from pathlib import Path
import re, sys, json
from collections import Counter
root=Path(__file__).resolve().parent
main=(root/'scripts/main.gd').read_text(encoding='utf-8')
project=(root/'project.godot').read_text(encoding='utf-8',errors='ignore')
export=(root/'export_presets.cfg').read_text(encoding='utf-8',errors='ignore')
errors=[]; warnings=[]

# Function declarations and duplicate names.
funcs=re.findall(r'^func\s+([A-Za-z0-9_]+)\s*\(',main,re.M); funcset=set(funcs)
for n,c in Counter(funcs).items():
    if c>1: errors.append(f'duplicate func {n} x{c}')

# Every preload must exist in the project source tree.
preloads=re.findall(r'preload\("res://([^\"]+)"\)',main)
for rel in preloads:
    if not (root/rel).exists(): errors.append(f'missing preload: {rel}')

# Explicit Callable(self,"fn") targets must exist.
for fn in sorted(set(re.findall(r'Callable\(self,\s*"([A-Za-z0-9_]+)"\)',main))):
    if fn not in funcset: errors.append(f'missing callable target: {fn}')

# Critical V18 entry points.
critical=['_v18_reset_systems','_v18_expedition_preparation','_v18_try_special_room','_v18_resolve_special_room','_v18_apply_chain_outcome','_v18_homecoming_story_tick','_v18_update_ambient_audio','_run_v18_qa']
for fn in critical:
    if fn not in funcset: errors.append(f'missing V18 function {fn}')

# Extract simple constant blocks.
def block(name,next_name=None):
    i=main.find('const '+name)
    if i<0: return ''
    if next_name:
        j=main.find('const '+next_name,i+1)
    else:
        j=main.find('\n}\n',i)+3
    return main[i:j if j>i else len(main)]

loc_block=block('LOCATION_ROOMS','V18_SPECIAL_ROOMS')
city_block=block('CITY_LOCATIONS','LOCATION_ROOMS')
special_block=block('V18_SPECIAL_ROOMS','MUTATION_NAMES')
tex_block=block('V18_LOCATION_TEX','V18_LOCATION_FLAVOR')
flavor_block=block('V18_LOCATION_FLAVOR','MENU_TEX') if 'const MENU_TEX' in main[main.find('const V18_LOCATION_FLAVOR'):] else block('V18_LOCATION_FLAVOR')
city_names=re.findall(r'^\s*"([^\"]+)"\s*:',city_block,re.M)
room_keys=re.findall(r'^\s*"([^"|]+)\|([^\"]+)"\s*:',special_block,re.M)
for loc,room in room_keys:
    if f'"{loc}":' not in loc_block: errors.append(f'special room unknown location: {loc}')
    elif f'"{room}"' not in loc_block: warnings.append(f'room name not found literal near LOCATION_ROOMS: {loc}|{room}')

# Every main location should have visual identity and a short atmospheric description.
for loc in city_names:
    if f'"{loc}"' not in tex_block: warnings.append(f'V18 location has no dedicated/family texture: {loc}')
    if f'"{loc}"' not in flavor_block: warnings.append(f'V18 location has no flavor text: {loc}')

# Data-shape regression: special_items is an Array[Dictionary] throughout V7+.
for bad in re.findall(r'special_items\.append\(("[^\n]+?")\)',main):
    errors.append(f'special_items raw string append would break Dictionary reads: {bad[:80]}')

# V18 save/version/export checks.
if '"save_version":18' not in main: errors.append('save_version is not 18')
if 'afterfall_save_v18.json' not in main: errors.append('save path not v18')
if 'config/name="Afterfall: Buried Days V18"' not in project: errors.append('project name not V18')
if 'version/code=18' not in export: errors.append('Android version code not 18')
if 'version/name="0.18"' not in export: errors.append('Android version name not 0.18')
if 'export_path="Afterfall-Buried-Days-V18.apk"' not in export: warnings.append('Android export path is not V18 yet')
if 'architectures/arm64-v8a=true' not in export: errors.append('Android arm64 export disabled')

# UI direction regression checks: V18 shelter should remain scene-first, not restore legacy nav.
scene=main[main.find('func _build_scene_frame'):main.find('func _build_right_panel')]
if scene.count('_add_shelter_hitbox(')<5: errors.append('too few physical shelter hitboxes')
if scene.count('_add_hotspot("')>0: warnings.append('legacy labeled shelter hotspots reintroduced')

# Rough bracket lexer ignoring quoted strings and comments.
stack=[]; pairs={')':'(',']':'[','}':'{'}; opens=set(pairs.values()); in_str=False; quote=''; esc=False; i=0
while i<len(main):
    ch=main[i]
    if in_str:
        if esc: esc=False
        elif ch=='\\': esc=True
        elif ch==quote: in_str=False
        i+=1; continue
    if ch in ('"',"'"):
        in_str=True; quote=ch; i+=1; continue
    if ch=='#':
        j=main.find('\n',i); i=len(main) if j<0 else j+1; continue
    if ch in opens: stack.append((ch,i))
    elif ch in pairs:
        if not stack or stack[-1][0]!=pairs[ch]: errors.append(f'bracket mismatch at offset {i}: {ch}'); break
        stack.pop()
    i+=1
if stack: errors.append(f'unclosed brackets: {stack[-5:]}')

if 'version.text="V17 •' in main: warnings.append('menu still labels build as V17')
result={
    'status':'PASS' if not errors else 'FAIL',
    'functions':len(funcs),'unique_functions':len(funcset),'preloads':len(preloads),
    'city_locations':len(city_names),'v18_special_rooms':len(room_keys),
    'errors':errors,'warnings':warnings
}
print('STATIC_QA_'+result['status']); print(json.dumps(result,ensure_ascii=False,indent=2))
(root/'V18_STATIC_QA.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
sys.exit(0 if not errors else 2)
