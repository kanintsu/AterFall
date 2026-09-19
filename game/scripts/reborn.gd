extends Control

const DESIGN := Vector2(1648, 920)
const C_BG := Color("#0a0c0d")
const C_PANEL := Color("#111416")
const C_PANEL2 := Color("#1a1e1f")
const C_INK := Color("#e8e2d5")
const C_MUTED := Color("#9b978e")
const C_RED := Color("#b32924")
const C_RED2 := Color("#7d1d1a")
const C_AMBER := Color("#d39a55")
const C_GREEN := Color("#6f8b72")
const C_BLUE := Color("#66818b")
const C_LINE := Color("#3c4140")
const SAVE_PATH := "user://afterfall_reborn.json"

enum Screen { MENU, SHELTER, MAP, LOCATION, COMBAT, INVENTORY, RESEARCH, CRAFTING, EVENT, HELP }

var screen: Screen = Screen.MENU
var font: Font
var rng := RandomNumberGenerator.new()
var hotspots: Array[Dictionary] = []
var rain: Array[Vector2] = []
var toast_text := ""
var toast_until := 0
var current_location := ""
var combat := {}
var event_data := {}
var selected_item := ""
var tutorial_step := 0

var state := {
	"day": 1,
	"minutes": 455,
	"weather": "CHUVA",
	"health": 100,
	"hunger": 18,
	"thirst": 16,
	"fatigue": 8,
	"morale": 55,
	"infection": 0,
	"food": 4,
	"water": 5,
	"med": 1,
	"bandage": 1,
	"ammo": 4,
	"fuel": 0,
	"scrap": 3,
	"wood": 2,
	"cloth": 2,
	"parts": 0,
	"electronics": 0,
	"chemicals": 0,
	"research": 0,
	"backpack": 12,
	"weapon": "FACA",
	"melee": "FACA",
	"firearm": "",
	"known": ["SUPERMERCADO", "FARMÁCIA"],
	"visited": {},
	"searched": {},
	"facilities": {"bed":1,"storage":1,"radio":1,"workshop":0,"research":0,"infirmary":0,"generator":0,"filter":0},
	"blueprints": [],
	"projects": [],
	"journal": [],
	"flags": {},
	"xp": 0
}

const LOCATIONS := {
	"SUPERMERCADO": {
		"district":"BAIRRO DO ABRIGO","risk":1,"distance":18,
		"desc":"Prateleiras vazias na frente, estoque nos fundos. Há marcas recentes perto do escritório.",
		"objects":[
			{"id":"shelves","name":"PRATELEIRAS","hint":"vasculhar alimentos e água","kind":"food","pos":Vector2(240,430)},
			{"id":"checkout","name":"CAIXAS","hint":"procurar itens esquecidos","kind":"mixed","pos":Vector2(655,500)},
			{"id":"pharmacy","name":"FARMÁCIA INTERNA","hint":"medicamentos e curativos","kind":"medical","pos":Vector2(1010,440)},
			{"id":"office","name":"ESCRITÓRIO","hint":"papéis, chaves e anotações","kind":"knowledge","pos":Vector2(1220,360)},
			{"id":"stock","name":"DEPÓSITO","hint":"porta fechada • há ruído atrás","kind":"danger","pos":Vector2(1370,470)}
		]
	},
	"FARMÁCIA": {
		"district":"BAIRRO DO ABRIGO","risk":2,"distance":22,
		"desc":"Vidros quebrados e balcões revirados. Os melhores remédios ficavam longe da vitrine.",
		"objects":[
			{"id":"counter","name":"BALCÃO","hint":"gavetas e receitas","kind":"medical","pos":Vector2(420,470)},
			{"id":"aisle","name":"CORREDOR","hint":"higiene e primeiros socorros","kind":"medical","pos":Vector2(790,430)},
			{"id":"back","name":"SALA DOS FUNDOS","hint":"porta trancada","kind":"knowledge","pos":Vector2(1190,390)}
		]
	},
	"POSTO": {
		"district":"ZONA OESTE","risk":2,"distance":34,
		"desc":"Bombas mortas, loja escura e uma oficina lateral. Um carro ficou aberto perto do pátio.",
		"objects":[
			{"id":"store","name":"CONVENIÊNCIA","hint":"comida, água e pilhas","kind":"food","pos":Vector2(340,440)},
			{"id":"pumps","name":"BOMBAS","hint":"tentar recuperar combustível","kind":"fuel","pos":Vector2(820,530)},
			{"id":"garage","name":"OFICINA","hint":"ferramentas e peças","kind":"parts","pos":Vector2(1190,410)},
			{"id":"car","name":"CARRO ABANDONADO","hint":"porta-malas e motor","kind":"parts","pos":Vector2(1390,580)}
		]
	},
	"OFICINA": {
		"district":"ZONA OESTE","risk":3,"distance":42,
		"desc":"Uma oficina pequena, pesada de óleo e ferrugem. Máquinas demais para terem sido levadas.",
		"objects":[
			{"id":"bench","name":"BANCADA","hint":"ferramentas e componentes","kind":"parts","pos":Vector2(380,430)},
			{"id":"locker","name":"ARMÁRIOS","hint":"roupas e equipamentos","kind":"mixed","pos":Vector2(740,420)},
			{"id":"truck","name":"CAMINHONETE","hint":"motor incompleto","kind":"vehicle","pos":Vector2(1120,520)},
			{"id":"office","name":"ESCRITÓRIO","hint":"ordens de serviço","kind":"knowledge","pos":Vector2(1380,390)}
		]
	},
	"HOSPITAL": {
		"district":"CENTRO","risk":4,"distance":58,
		"desc":"O saguão ainda cheira a produto químico. Portas corta-fogo dividem corredores escuros.",
		"objects":[
			{"id":"reception","name":"RECEPÇÃO","hint":"gavetas e mochilas","kind":"mixed","pos":Vector2(350,470)},
			{"id":"ward","name":"ENFERMARIA","hint":"curativos e remédios","kind":"medical","pos":Vector2(720,410)},
			{"id":"surgery","name":"CIRURGIA","hint":"equipamento médico raro","kind":"danger","pos":Vector2(1080,380)},
			{"id":"archive","name":"ARQUIVO","hint":"prontuários e registros","kind":"knowledge","pos":Vector2(1360,420)}
		]
	},
	"DELEGACIA": {
		"district":"CENTRO","risk":4,"distance":65,
		"desc":"Portas de aço, sirene muda e viaturas abandonadas. Alguém tentou selar o arsenal.",
		"objects":[
			{"id":"desk","name":"RECEPÇÃO","hint":"chaves e documentos","kind":"mixed","pos":Vector2(380,450)},
			{"id":"evidence","name":"EVIDÊNCIAS","hint":"itens apreendidos","kind":"mixed","pos":Vector2(740,420)},
			{"id":"armory","name":"ARSENAL","hint":"munição • alto risco","kind":"danger","pos":Vector2(1080,410)},
			{"id":"garage","name":"GARAGEM","hint":"viaturas e peças","kind":"parts","pos":Vector2(1370,500)}
		]
	},
	"BIBLIOTECA": {
		"district":"CENTRO","risk":2,"distance":52,
		"desc":"Poeira, livros no chão e silêncio. Aqui conhecimento vale mais que comida.",
		"objects":[
			{"id":"general","name":"ACERVO","hint":"livros úteis","kind":"knowledge","pos":Vector2(370,440)},
			{"id":"technical","name":"SEÇÃO TÉCNICA","hint":"manuais e diagramas","kind":"knowledge","pos":Vector2(800,410)},
			{"id":"archive","name":"ARQUIVO","hint":"mapas e recortes antigos","kind":"knowledge","pos":Vector2(1240,410)}
		]
	}
}

const PROJECTS := [
	{"id":"desk","name":"MESA DE PESQUISA","need":{"scrap":4,"wood":2},"rp":0,"desc":"Permite estudar manuais, peças e projetos encontrados na cidade."},
	{"id":"filter","name":"FILTRO DE ÁGUA","need":{"scrap":3,"cloth":2},"rp":2,"desc":"Transforma água encontrada em reserva segura no abrigo."},
	{"id":"pack","name":"MOCHILA REFORÇADA","need":{"cloth":3,"parts":2},"rp":3,"desc":"Aumenta o peso que você consegue trazer em cada viagem."},
	{"id":"generator","name":"GERADOR","need":{"parts":4,"electronics":2,"fuel":1},"rp":4,"desc":"Energia para rádio, enfermaria e pesquisas avançadas."},
	{"id":"infirmary","name":"ENFERMARIA","need":{"scrap":4,"cloth":3,"med":2},"rp":3,"desc":"Melhora tratamento e recuperação de ferimentos."},
	{"id":"antenna","name":"ANTENA DE RÁDIO","need":{"scrap":3,"electronics":3},"rp":4,"desc":"Revela transmissões, sobreviventes e novos locais."}
]

const CRAFTS := [
	{"id":"bandage","name":"BANDAGEM","need":{"cloth":1},"time":15},
	{"id":"bat","name":"TACO REFORÇADO","need":{"wood":2,"scrap":1},"time":25},
	{"id":"spear","name":"LANÇA IMPROVISADA","need":{"wood":2,"scrap":2},"time":35},
	{"id":"lockpick","name":"GAZUA","need":{"scrap":1},"time":10}
]

const TIPS := [
	"Nem toda luta vale o ferimento. Voltar vivo com o objetivo é progresso.",
	"Manuais e diagramas podem valer mais que sucata. Leve conhecimento para o abrigo.",
	"Quanto mais tarde você volta, maior a chance de encontrar algo na rua.",
	"Ruído abre caminhos rápidos, mas também chama atenção.",
	"Locais já vasculhados continuam existindo, porém ficam cada vez menos produtivos.",
	"Uma profissão muda o que você percebe. Conhecimento também é equipamento.",
	"Carregue o que você precisa, não apenas o que parece valioso.",
	"O rádio não serve só para história: algumas transmissões revelam lugares e pessoas."
]

func _ready() -> void:
	font = ThemeDB.fallback_font
	rng.randomize()
	set_process(true)
	for i in range(90):
		rain.append(Vector2(rng.randf_range(0, DESIGN.x), rng.randf_range(0, DESIGN.y)))
	var args:=OS.get_cmdline_user_args()
	if "--qa_reborn" in args:
		call_deferred("_qa_reborn")
	else:
		for arg in args:
			if str(arg).begins_with("--capture_reborn_"):
				call_deferred("_capture_reborn",str(arg).trim_prefix("--capture_reborn_"))
				break
	queue_redraw()

func _process(delta: float) -> void:
	for i in range(rain.size()):
		rain[i] += Vector2(-140, 720) * delta
		if rain[i].y > DESIGN.y:
			rain[i] = Vector2(rng.randf_range(0, DESIGN.x + 200), rng.randf_range(-180, -10))
	if state.weather == "CHUVA" and screen in [Screen.MENU, Screen.SHELTER, Screen.LOCATION, Screen.COMBAT]:
		queue_redraw()
	if toast_text != "" and Time.get_ticks_msec() > toast_until:
		toast_text = ""
		queue_redraw()

func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		queue_redraw()

func _scale_pos(p: Vector2) -> Vector2:
	var s:float = minf(size.x / DESIGN.x, size.y / DESIGN.y)
	var off:Vector2 = (size - DESIGN * s) * 0.5
	return off + p * s

func _to_design(p: Vector2) -> Vector2:
	var s:float = minf(size.x / DESIGN.x, size.y / DESIGN.y)
	var off:Vector2 = (size - DESIGN * s) * 0.5
	return (p - off) / s

func _draw() -> void:
	hotspots.clear()
	var s:float = minf(size.x / DESIGN.x, size.y / DESIGN.y)
	var off:Vector2 = (size - DESIGN * s) * 0.5
	draw_rect(Rect2(Vector2.ZERO, size), Color.BLACK)
	draw_set_transform(off, 0.0, Vector2(s,s))
	match screen:
		Screen.MENU: _draw_menu()
		Screen.SHELTER: _draw_shelter()
		Screen.MAP: _draw_map()
		Screen.LOCATION: _draw_location()
		Screen.COMBAT: _draw_combat()
		Screen.INVENTORY: _draw_inventory()
		Screen.RESEARCH: _draw_research()
		Screen.CRAFTING: _draw_crafting()
		Screen.EVENT: _draw_event()
		Screen.HELP: _draw_help()
	if toast_text != "":
		_panel(Rect2(410, 820, 828, 58), Color(0.02,0.02,0.02,0.94), C_AMBER)
		_text(toast_text, Vector2(438,856), 18, C_INK)
	draw_set_transform(Vector2.ZERO,0.0,Vector2.ONE)

func _gui_input(event: InputEvent) -> void:
	var pressed := false
	var p := Vector2.ZERO
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		pressed = true
		p = event.position
	elif event is InputEventScreenTouch and event.pressed:
		pressed = true
		p = event.position
	if not pressed:
		return
	var d := _to_design(p)
	for h in hotspots:
		if Rect2(h.rect).has_point(d):
			_action(str(h.id))
			accept_event()
			return

func _text(t:String, p:Vector2, fs:int=18, col:Color=C_INK) -> void:
	draw_string(font,p,t,HORIZONTAL_ALIGNMENT_LEFT,-1,fs,col)

func _center(t:String, r:Rect2, fs:int=20, col:Color=C_INK) -> void:
	var w := font.get_string_size(t,HORIZONTAL_ALIGNMENT_LEFT,-1,fs).x
	draw_string(font,Vector2(r.position.x+(r.size.x-w)*0.5,r.position.y+r.size.y*0.62),t,HORIZONTAL_ALIGNMENT_LEFT,-1,fs,col)

func _panel(r:Rect2, fill:Color=C_PANEL, edge:Color=C_LINE, width:float=2.0) -> void:
	draw_rect(r,fill,true)
	draw_rect(r,edge,false,width)

func _button(id:String, r:Rect2, label:String, active:=false, fs:=20) -> void:
	_panel(r, C_RED2 if active else Color("#15191a"), C_RED if active else Color("#5b5e5b"), 2)
	_center(label,r,fs,C_INK)
	hotspots.append({"id":id,"rect":r})

func _hotspot(id:String, center:Vector2, label:String, sub:String="") -> void:
	var r:=Rect2(center-Vector2(126,28),Vector2(252,56))
	draw_rect(r,Color(0.02,0.02,0.02,0.82),true)
	draw_rect(r,Color("#c9c5bb"),false,2)
	draw_circle(center-Vector2(98,0),18,Color("#171a1a"))
	draw_circle(center-Vector2(98,0),18,Color("#ded9cc"),false,2)
	_text("●",center-Vector2(105,-7),13,C_INK)
	_text(label,center-Vector2(66,-3),16,C_INK)
	if sub!="":
		_text(sub,center-Vector2(66,-21),10,C_MUTED)
	hotspots.append({"id":id,"rect":r})

func _draw_rain() -> void:
	for p in rain:
		draw_line(p,p+Vector2(-8,24),Color(0.55,0.68,0.72,0.22),1)

func _hud() -> void:
	draw_rect(Rect2(0,0,1648,82),Color(0.015,0.018,0.018,0.94),true)
	draw_line(Vector2(0,82),Vector2(1648,82),Color("#4c5150"),2)
	_text("AFTERFALL",Vector2(38,51),32,C_INK)
	_text("DIA %d"%int(state.day),Vector2(355,34),14,C_MUTED)
	_text(_clock(),Vector2(355,60),18,C_INK)
	_text("☁ "+str(state.weather),Vector2(475,50),18,C_INK)
	_text("COMIDA %d"%int(state.food),Vector2(680,50),17,C_INK)
	_text("ÁGUA %d"%int(state.water),Vector2(820,50),17,C_INK)
	_text("VIDA %d"%int(state.health),Vector2(950,50),17,C_INK)
	_text("MUNIÇÃO %d"%int(state.ammo),Vector2(1080,50),17,C_INK)
	_text("PESO %d/%d"%[_weight(),int(state.backpack)],Vector2(1240,50),17,C_INK)
	_text("☰",Vector2(1555,54),27,C_INK)
	hotspots.append({"id":"inventory","rect":Rect2(1510,10,110,62)})

func _clock() -> String:
	var m:=int(state.minutes)%1440
	return "%02d:%02d"%[m/60,m%60]

func _advance(minutes:int) -> void:
	state.minutes=int(state.minutes)+minutes
	while int(state.minutes)>=1440:
		state.minutes=int(state.minutes)-1440
		state.day=int(state.day)+1
		state.hunger=min(100,int(state.hunger)+12)
		state.thirst=min(100,int(state.thirst)+18)
		state.fatigue=min(100,int(state.fatigue)+10)
	if minutes>=30:
		state.hunger=min(100,int(state.hunger)+max(1,minutes/60))
		state.thirst=min(100,int(state.thirst)+max(1,minutes/45))
		state.fatigue=min(100,int(state.fatigue)+max(1,minutes/90))
	_save()

func _weight() -> int:
	return int(state.food)+int(state.water)+int(state.med)+int(state.bandage)+int(state.ammo)/3+int(state.scrap)/2+int(state.parts)+int(state.electronics)

func _draw_menu() -> void:
	# Procedural skyline, not a background image.
	draw_rect(Rect2(0,0,1648,920),Color("#111719"))
	for y in range(0,920,80):
		draw_rect(Rect2(0,y,1648,80),Color(0.04+float(y)/24000.0,0.05,0.055,1))
	for i in range(24):
		var x:=float(i*76-20)
		var bh:=float(170 + (i*47)%360)
		draw_rect(Rect2(x,700-bh,62,bh),Color("#15191a"))
		draw_rect(Rect2(x,700-bh,62,bh),Color("#3d4140"),false,1)
		for wy in range(int(720-bh),680,36):
			if (wy+i)%3==0:
				draw_rect(Rect2(x+10,wy,6,10),Color("#b67b41"))
	draw_rect(Rect2(0,700,1648,220),Color("#0b0e0f"))
	draw_polygon(PackedVector2Array([Vector2(0,790),Vector2(400,730),Vector2(780,780),Vector2(1200,720),Vector2(1648,770),Vector2(1648,920),Vector2(0,920)]),PackedColorArray([Color("#101314")]))
	_draw_survivor(Vector2(1030,690),1.65,false)
	_draw_dog(Vector2(1150,765),1.2)
	_draw_rain()
	_text("AFTERFALL",Vector2(78,148),72,C_INK)
	_text("AINDA HÁ AMANHÃ",Vector2(88,194),25,C_MUTED)
	_text("A CIDADE MORREU. AS ESCOLHAS NÃO.",Vector2(78,246),16,C_AMBER)
	_button("new_game",Rect2(78,320,420,72),"NOVO JOGO",true,26)
	_button("continue",Rect2(78,404,420,66),"CONTINUAR",false,23)
	_button("help",Rect2(78,482,420,66),"COMO JOGAR",false,23)
	_text("Versão reconstruída • cenário e interface renderizados pelo jogo",Vector2(78,860),13,C_MUTED)

func _draw_shelter() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#0b0e0f"))
	# storm outside
	draw_rect(Rect2(0,82,1648,838),Color("#11181b"))
	_draw_city(Vector2(0,90),0.55)
	_draw_rain()
	# shelter shell
	var shell:=Rect2(70,160,1508,650)
	draw_rect(shell,Color("#171818"),true)
	draw_rect(shell,Color("#6c604c"),false,5)
	draw_line(Vector2(70,485),Vector2(1578,485),Color("#625846"),5)
	# room separators
	for x in [520,1010]:
		draw_line(Vector2(x,160),Vector2(x,485),Color("#4b4438"),4)
	for x in [430,920,1300]:
		draw_line(Vector2(x,485),Vector2(x,810),Color("#4b4438"),4)
	# warm light pools
	draw_circle(Vector2(285,255),150,Color(0.52,0.31,0.12,0.12))
	draw_circle(Vector2(760,255),160,Color(0.62,0.35,0.13,0.13))
	draw_circle(Vector2(1255,255),170,Color(0.46,0.30,0.12,0.12))
	draw_circle(Vector2(675,600),150,Color(0.46,0.30,0.12,0.11))
	draw_circle(Vector2(1110,610),150,Color(0.46,0.30,0.12,0.10))
	# bedroom
	_draw_bed(Vector2(140,370),1.1)
	_draw_lamp(Vector2(265,218))
	_draw_crates(Vector2(360,395),2)
	# workshop
	_draw_workbench(Vector2(600,390))
	_draw_survivor(Vector2(760,420),0.72,false)
	# radio room
	_draw_radio(Vector2(1135,380))
	_draw_window(Rect2(1340,220,180,180))
	# storage
	_draw_shelves(Vector2(105,740),Vector2(250,180),4)
	# infirmary
	_draw_medbed(Vector2(560,720))
	# exit
	draw_rect(Rect2(830,575,120,210),Color("#222321"),true)
	draw_rect(Rect2(830,575,120,210),Color("#7e715c"),false,3)
	_text("SAÍDA",Vector2(856,768),13,C_AMBER)
	# generator
	_draw_generator(Vector2(1360,690))
	_hud()
	_hotspot("rest",Vector2(290,300),"DESCANSAR","recuperar energia")
	_hotspot("research",Vector2(770,300),"OFICINA","fabricar • pesquisar")
	_hotspot("radio",Vector2(1260,300),"RÁDIO","transmissões")
	_hotspot("storage",Vector2(250,585),"ESTOQUE","itens • recursos")
	_hotspot("infirmary",Vector2(690,585),"ENFERMARIA","tratar • curar")
	_hotspot("map",Vector2(890,690),"SAIR","abrir mapa")
	_hotspot("generator",Vector2(1400,585),"GERADOR","manter • melhorar")
	_text(_objective(),Vector2(80,875),16,C_AMBER)

func _draw_city(origin:Vector2, scale:float) -> void:
	draw_rect(Rect2(origin.x,origin.y,1648,300),Color("#0d1214"),true)
	for i in range(28):
		var x:=float(i*66)
		var h:=float(70+(i*53)%230)
		draw_rect(Rect2(x,origin.y+300-h,50,h),Color("#151a1c"),true)
		draw_rect(Rect2(x,origin.y+300-h,50,h),Color("#31383a"),false,1)

func _draw_bed(p:Vector2,sc:float) -> void:
	draw_rect(Rect2(p.x,p.y,230*sc,76*sc),Color("#332d26"),true)
	draw_rect(Rect2(p.x,p.y,230*sc,76*sc),Color("#796b58"),false,3)
	draw_rect(Rect2(p.x+12,p.y+8,65*sc,27*sc),Color("#aaa08e"),true)
	draw_line(Vector2(p.x,p.y+76*sc),Vector2(p.x-8,p.y+100*sc),Color("#5c5143"),5)
	draw_line(Vector2(p.x+230*sc,p.y+76*sc),Vector2(p.x+238*sc,p.y+100*sc),Color("#5c5143"),5)

func _draw_lamp(p:Vector2) -> void:
	draw_line(p,p+Vector2(0,62),Color("#4b443a"),4)
	draw_circle(p+Vector2(0,70),16,Color("#e2a65b"))
	draw_circle(p+Vector2(0,70),40,Color(0.8,0.5,0.2,0.08))

func _draw_workbench(p:Vector2) -> void:
	draw_rect(Rect2(p.x,p.y,320,34),Color("#4b3b2d"),true)
	draw_rect(Rect2(p.x+20,p.y-95,280,80),Color("#262621"),true)
	for i in range(8):
		draw_line(Vector2(p.x+35+i*32,p.y-75),Vector2(p.x+35+i*32,p.y-42),Color("#ad8b5e"),3)
	draw_rect(Rect2(p.x+35,p.y+34,20,110),Color("#4b3b2d"),true)
	draw_rect(Rect2(p.x+265,p.y+34,20,110),Color("#4b3b2d"),true)

func _draw_radio(p:Vector2) -> void:
	draw_rect(Rect2(p.x,p.y,170,72),Color("#252927"),true)
	draw_rect(Rect2(p.x,p.y,170,72),Color("#80745d"),false,2)
	draw_circle(p+Vector2(40,36),20,Color("#121414"))
	draw_circle(p+Vector2(125,25),8,C_AMBER)
	for i in range(4):
		draw_line(p+Vector2(102,45+i*5),p+Vector2(150,45+i*5),Color("#6d726e"),1)
	draw_line(p+Vector2(150,0),p+Vector2(185,-90),Color("#9b9588"),2)

func _draw_window(r:Rect2) -> void:
	draw_rect(r,Color("#0d1518"),true)
	draw_rect(r,Color("#6b675e"),false,4)
	draw_line(Vector2(r.position.x+r.size.x/2,r.position.y),Vector2(r.position.x+r.size.x/2,r.end.y),Color("#55564f"),3)
	draw_line(Vector2(r.position.x,r.position.y+r.size.y/2),Vector2(r.end.x,r.position.y+r.size.y/2),Color("#55564f"),3)

func _draw_shelves(p:Vector2, sz:Vector2, rows:int) -> void:
	draw_rect(Rect2(p,sz),Color("#232421"),true)
	draw_rect(Rect2(p,sz),Color("#736956"),false,3)
	for i in range(1,rows):
		var y:=p.y+sz.y*i/rows
		draw_line(Vector2(p.x,y),Vector2(p.x+sz.x,y),Color("#6c6353"),3)
	for r in range(rows):
		for c in range(6):
			if (r+c)%2==0:
				draw_rect(Rect2(p.x+12+c*36,p.y+12+r*(sz.y/rows),20,22),Color("#746048"),true)

func _draw_medbed(p:Vector2) -> void:
	draw_rect(Rect2(p.x,p.y,250,65),Color("#65645e"),true)
	draw_rect(Rect2(p.x,p.y,250,65),Color("#b8b5aa"),false,3)
	draw_rect(Rect2(p.x+10,p.y+10,60,25),Color("#c8c5ba"),true)
	draw_line(p+Vector2(25,65),p+Vector2(15,100),Color("#76736a"),4)
	draw_line(p+Vector2(225,65),p+Vector2(235,100),Color("#76736a"),4)
	draw_rect(Rect2(p.x+110,p.y+18,30,30),Color("#91352f"),true)
	draw_rect(Rect2(p.x+119,p.y+8,12,50),Color("#91352f"),true)

func _draw_generator(p:Vector2) -> void:
	draw_rect(Rect2(p.x-110,p.y-80,220,120),Color("#302f28"),true)
	draw_rect(Rect2(p.x-110,p.y-80,220,120),Color("#9b6f3b"),false,4)
	draw_circle(p+Vector2(-65,-20),28,Color("#141515"))
	draw_circle(p+Vector2(70,-20),18,Color("#141515"))
	draw_line(p+Vector2(-100,45),p+Vector2(-80,80),Color("#65543f"),8)
	draw_line(p+Vector2(100,45),p+Vector2(80,80),Color("#65543f"),8)

func _draw_crates(p:Vector2,count:int) -> void:
	for i in range(count):
		var r:=Rect2(p.x+i*56,p.y-i*8,52,48)
		draw_rect(r,Color("#3e3428"),true)
		draw_rect(r,Color("#71614d"),false,2)

func _draw_survivor(p:Vector2,sc:float=1.0,armed:=true) -> void:
	draw_circle(p-Vector2(0,110*sc),22*sc,Color("#0b0c0c"))
	draw_polygon(PackedVector2Array([p-Vector2(35*sc,88*sc),p+Vector2(35*sc,-88*sc),p+Vector2(28*sc,20*sc),p+Vector2(44*sc,105*sc),p-Vector2(5*sc,105*sc),p-Vector2(30*sc,20*sc)]),PackedColorArray([Color("#111313")]))
	draw_line(p+Vector2(-18*sc,15*sc),p+Vector2(-35*sc,115*sc),Color("#0a0b0b"),18*sc)
	draw_line(p+Vector2(18*sc,15*sc),p+Vector2(30*sc,115*sc),Color("#0a0b0b"),18*sc)
	if armed:
		draw_line(p-Vector2(5*sc,45*sc),p+Vector2(60*sc,35*sc),Color("#2a2420"),11*sc)

func _draw_dog(p:Vector2,sc:float=1.0) -> void:
	draw_ellipse_like(p,Vector2(58*sc,28*sc),Color("#121414"))
	draw_circle(p+Vector2(52*sc,-20*sc),20*sc,Color("#121414"))
	draw_polygon(PackedVector2Array([p+Vector2(45,-35)*sc,p+Vector2(54,-62)*sc,p+Vector2(62,-33)*sc]),PackedColorArray([Color("#121414")]))
	for x in [-32,15]:
		draw_line(p+Vector2(x*sc,18*sc),p+Vector2((x-5)*sc,60*sc),Color("#121414"),8*sc)

func draw_ellipse_like(center:Vector2, radius:Vector2, color:Color) -> void:
	var pts:=PackedVector2Array()
	for i in range(24):
		var a:=TAU*float(i)/24.0
		pts.append(center+Vector2(cos(a)*radius.x,sin(a)*radius.y))
	draw_colored_polygon(pts,color)

func _draw_map() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#171816"))
	_hud()
	_text("MAPA DE CAMPO",Vector2(64,132),31,C_INK)
	_text("A cidade não é uma lista de fases. Escolha pelo que você precisa.",Vector2(64,161),14,C_MUTED)
	var roads=[
		[Vector2(170,720),Vector2(430,560),Vector2(740,620),Vector2(1010,420),Vector2(1390,320)],
		[Vector2(430,560),Vector2(520,300),Vector2(900,220),Vector2(1390,320)],
		[Vector2(740,620),Vector2(1040,700),Vector2(1320,620)]
	]
	for road in roads:
		for i in range(road.size()-1):
			draw_line(road[i],road[i+1],Color("#6e6759"),20)
			draw_line(road[i],road[i+1],Color("#242622"),13)
	# district blocks
	for r in [Rect2(95,225,360,220),Rect2(470,190,390,250),Rect2(900,180,290,240),Rect2(1220,470,300,240)]:
		draw_rect(r,Color("#232520"),true)
		draw_rect(r,Color("#42453c"),false,2)
		for i in range(7):
			var bx:float = r.position.x+20+float((i*43)%int(maxf(44.0,r.size.x-60)))
			var by:float = r.position.y+22+float((i*67)%int(maxf(44.0,r.size.y-70)))
			draw_rect(Rect2(bx,by,30,46),Color("#151715"),true)
	_text("BAIRRO DO ABRIGO",Vector2(105,212),14,C_GREEN)
	_text("CENTRO",Vector2(510,178),14,C_AMBER)
	_text("ZONA OESTE",Vector2(930,168),14,Color("#a87655"))
	var positions={
		"SUPERMERCADO":Vector2(300,640),"FARMÁCIA":Vector2(410,510),"POSTO":Vector2(790,580),
		"OFICINA":Vector2(1020,670),"HOSPITAL":Vector2(760,350),"DELEGACIA":Vector2(1010,300),"BIBLIOTECA":Vector2(1280,560)
	}
	for name in state.known:
		if not positions.has(name): continue
		var p:Vector2=positions[name]
		var risk:=int(LOCATIONS[name].risk)
		var col:=C_GREEN if risk<=1 else (C_AMBER if risk<=3 else C_RED)
		draw_circle(p,25,Color("#121414"))
		draw_circle(p,25,col,false,4)
		_text("●",p+Vector2(-8,7),15,col)
		_text(name,p+Vector2(-62,52),13,C_INK)
		var rr:=Rect2(p-Vector2(80,40),Vector2(160,105))
		hotspots.append({"id":"loc:"+str(name),"rect":rr})
	_button("shelter",Rect2(64,820,260,58),"VOLTAR AO ABRIGO")
	_panel(Rect2(1230,760,340,100),Color(0.03,0.03,0.03,0.92),C_LINE)
	_text(_objective(),Vector2(1250,795),14,C_AMBER)
	_text("Toque em um local para viajar.",Vector2(1250,826),12,C_MUTED)

func _draw_location() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#0b0d0e"))
	_hud()
	var data:Dictionary=LOCATIONS.get(current_location,{})
	match current_location:
		"SUPERMERCADO": _scene_supermarket()
		"FARMÁCIA": _scene_pharmacy()
		"POSTO": _scene_gas()
		"OFICINA": _scene_workshop()
		"HOSPITAL": _scene_hospital()
		"DELEGACIA": _scene_police()
		"BIBLIOTECA": _scene_library()
		_: _scene_generic()
	_draw_rain()
	_panel(Rect2(34,100,570,88),Color(0.02,0.02,0.02,0.78),C_LINE)
	_text(current_location,Vector2(56,134),29,C_INK)
	_text(str(data.get("desc","")),Vector2(56,163),13,C_MUTED)
	for obj in data.get("objects",[]):
		var key:=current_location+"|"+str(obj.id)
		var searched:=bool(state.searched.get(key,false))
		if searched:
			_hotspot("object:"+str(obj.id),Vector2(obj.pos),str(obj.name),"já vasculhado")
		else:
			_hotspot("object:"+str(obj.id),Vector2(obj.pos),str(obj.name),str(obj.hint))
	_button("leave_location",Rect2(1330,820,260,58),"VOLTAR / SAIR")
	_text("Cada objeto pertence ao lugar. Nada de baú genérico.",Vector2(56,870),13,C_MUTED)

func _scene_supermarket() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#141617"))
	draw_rect(Rect2(0,660,1648,260),Color("#252522"))
	draw_rect(Rect2(90,160,1460,500),Color("#1b1c1b"),true)
	draw_rect(Rect2(90,160,1460,500),Color("#4a4640"),false,3)
	_text("SUPERMERCADO",Vector2(520,250),58,Color("#6e5c4d"))
	for x in [120,370,620]:
		_draw_shelves(Vector2(x,330),Vector2(180,300),5)
	for x in [650,780,910]:
		draw_rect(Rect2(x,540,95,80),Color("#292a26"),true)
		draw_rect(Rect2(x,540,95,80),Color("#5d5b53"),false,2)
	draw_rect(Rect2(975,310,250,290),Color("#18211d"),true)
	draw_rect(Rect2(975,310,250,290),Color("#6e826f"),false,4)
	_text("FARMÁCIA",Vector2(1008,350),23,C_GREEN)
	draw_rect(Rect2(1240,250,180,350),Color("#111313"),true)
	draw_rect(Rect2(1240,250,180,350),Color("#766858"),false,4)
	_text("ESCRITÓRIO",Vector2(1260,290),17,C_MUTED)
	draw_rect(Rect2(1430,280,120,320),Color("#101212"),true)
	draw_rect(Rect2(1430,280,120,320),Color("#7c6b58"),false,4)
	_text("DEP.",Vector2(1462,315),16,C_RED)
	_draw_survivor(Vector2(535,725),1.05,true)

func _scene_pharmacy() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#101516"))
	draw_rect(Rect2(0,670,1648,250),Color("#242523"))
	draw_rect(Rect2(120,170,1400,500),Color("#181b1b"),true)
	for x in [190,530,870]:
		_draw_shelves(Vector2(x,300),Vector2(220,300),6)
	draw_rect(Rect2(1120,280,270,120),Color("#242825"),true)
	draw_rect(Rect2(1120,280,270,120),Color("#607062"),false,3)
	_text("BALCÃO",Vector2(1200,350),26,C_GREEN)
	draw_rect(Rect2(1395,220,130,420),Color("#0e1010"),true)
	_text("FUNDOS",Vector2(1410,270),17,C_RED)
	_draw_survivor(Vector2(470,740),1.0,true)

func _scene_gas() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#111719"))
	draw_rect(Rect2(0,660,1648,260),Color("#242421"))
	draw_rect(Rect2(110,190,570,420),Color("#1c1d1b"),true)
	draw_rect(Rect2(110,190,570,420),Color("#645b4d"),false,4)
	_text("CONVENIÊNCIA",Vector2(250,250),29,C_INK)
	_draw_shelves(Vector2(170,330),Vector2(200,240),4)
	_draw_shelves(Vector2(410,330),Vector2(180,240),4)
	# canopy and pumps
	draw_rect(Rect2(700,190,520,42),Color("#353634"),true)
	for x in [760,940,1120]:
		draw_rect(Rect2(x,360,88,150),Color("#292b29"),true)
		draw_rect(Rect2(x,360,88,150),Color("#8a6a4d"),false,3)
	# garage
	draw_rect(Rect2(1240,180,300,430),Color("#171918"),true)
	draw_rect(Rect2(1240,180,300,430),Color("#766653"),false,4)
	_text("OFICINA",Vector2(1330,250),27,C_AMBER)
	_draw_car(Vector2(1310,570),1.0)
	_draw_survivor(Vector2(610,760),1.05,true)

func _scene_workshop() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#121414"))
	draw_rect(Rect2(0,670,1648,250),Color("#25231f"))
	_draw_workbench(Vector2(160,500))
	_draw_workbench(Vector2(560,500))
	_draw_shelves(Vector2(1050,270),Vector2(250,340),6)
	_draw_car(Vector2(650,650),1.6)
	draw_rect(Rect2(1350,210,180,400),Color("#111212"),true)
	_text("ESCRITÓRIO",Vector2(1365,260),15,C_MUTED)
	_draw_survivor(Vector2(420,760),1.0,true)

func _scene_hospital() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#0f1415"))
	draw_rect(Rect2(0,690,1648,230),Color("#202323"))
	for x in [120,520,920,1320]:
		draw_rect(Rect2(x,210,260,430),Color("#171b1b"),true)
		draw_rect(Rect2(x,210,260,430),Color("#56605e"),false,3)
		draw_rect(Rect2(x+80,360,100,220),Color("#101313"),true)
	_text("RECEPÇÃO",Vector2(170,270),18,C_MUTED)
	_text("ENFERMARIA",Vector2(550,270),18,C_MUTED)
	_text("CIRURGIA",Vector2(980,270),18,C_RED)
	_text("ARQUIVO",Vector2(1380,270),18,C_MUTED)
	_draw_medbed(Vector2(540,590))
	_draw_survivor(Vector2(390,760),1.0,true)

func _scene_police() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#101315"))
	draw_rect(Rect2(0,680,1648,240),Color("#202222"))
	_text("DELEGACIA",Vector2(640,200),48,Color("#555d60"))
	for x in [120,480,850,1220]:
		draw_rect(Rect2(x,260,260,330),Color("#171a1b"),true)
		draw_rect(Rect2(x,260,260,330),Color("#596165"),false,3)
	_draw_car(Vector2(1190,690),1.2)
	_draw_survivor(Vector2(410,760),1.0,true)

func _scene_library() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#12110f"))
	draw_rect(Rect2(0,680,1648,240),Color("#27231e"))
	for x in [100,380,660,940,1220]:
		_draw_shelves(Vector2(x,230),Vector2(220,420),8)
	_text("BIBLIOTECA MUNICIPAL",Vector2(500,190),35,Color("#9b8666"))
	_draw_survivor(Vector2(420,760),1.0,true)

func _scene_generic() -> void:
	draw_rect(Rect2(0,82,1648,838),Color("#161818"))

func _draw_car(p:Vector2,sc:float) -> void:
	draw_rect(Rect2(p.x,p.y-70*sc,260*sc,90*sc),Color("#252727"),true)
	draw_polygon(PackedVector2Array([p+Vector2(45,-70)*sc,p+Vector2(90,-125)*sc,p+Vector2(200,-125)*sc,p+Vector2(238,-70)*sc]),PackedColorArray([Color("#2b2d2d")]))
	draw_circle(p+Vector2(55,25)*sc,32*sc,Color("#0c0d0d"))
	draw_circle(p+Vector2(215,25)*sc,32*sc,Color("#0c0d0d"))
	draw_rect(Rect2(p.x+95*sc,p.y-118*sc,98*sc,45*sc),Color("#182226"),true)

func _draw_combat() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#0c0e0f"))
	match current_location:
		"SUPERMERCADO": _scene_supermarket()
		"POSTO": _scene_gas()
		"HOSPITAL": _scene_hospital()
		_: _scene_generic()
	draw_rect(Rect2(0,82,1648,838),Color(0,0,0,0.22),true)
	_hud()
	_draw_survivor(Vector2(360,650),1.55,true)
	var enemies:Array=combat.get("enemies",[])
	for i in range(enemies.size()):
		if int(enemies[i].hp)>0:
			_draw_zombie(Vector2(1020+i*160,610),1.2-float(i)*0.08)
	_panel(Rect2(380,650,880,80),Color(0.02,0.02,0.02,0.86),C_RED)
	_text(str(combat.get("message","Algo se aproxima.")),Vector2(410,690),19,C_INK)
	_text("AMEAÇA %d  •  DISTÂNCIA %d"%[int(combat.get("threat",1)),int(combat.get("distance",2))],Vector2(980,690),16,C_RED)
	_button("combat_attack",Rect2(300,760,250,78),"ATACAR",true,24)
	_button("combat_dodge",Rect2(570,760,250,78),"ESQUIVAR",false,22)
	_button("combat_retreat",Rect2(840,760,250,78),"RECUAR",false,22)
	_button("combat_item",Rect2(1110,760,250,78),"ITEM",false,22)

func _draw_zombie(p:Vector2,sc:float) -> void:
	draw_circle(p-Vector2(0,115*sc),26*sc,Color("#4c5046"))
	draw_polygon(PackedVector2Array([p-Vector2(34*sc,85*sc),p+Vector2(32*sc,-85*sc),p+Vector2(45*sc,30*sc),p+Vector2(20*sc,105*sc),p-Vector2(30*sc,105*sc),p-Vector2(45*sc,20*sc)]),PackedColorArray([Color("#30332e")]))
	draw_line(p+Vector2(-22,-45)*sc,p+Vector2(-72,15)*sc,Color("#3c4038"),15*sc)
	draw_line(p+Vector2(22,-45)*sc,p+Vector2(68,5)*sc,Color("#3c4038"),15*sc)
	draw_circle(p+Vector2(-9,-120)*sc,4*sc,C_RED)
	draw_circle(p+Vector2(9,-120)*sc,4*sc,C_RED)

func _draw_inventory() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#0d1011"))
	_hud()
	_text("MOCHILA",Vector2(72,145),34,C_INK)
	_text("Leve o necessário. Peso demais transforma a volta em outra expedição.",Vector2(72,178),14,C_MUTED)
	var items=[
		["food","COMIDA",state.food],["water","ÁGUA",state.water],["med","REMÉDIOS",state.med],["bandage","BANDAGENS",state.bandage],
		["ammo","MUNIÇÃO",state.ammo],["scrap","SUCATA",state.scrap],["wood","MADEIRA",state.wood],["cloth","TECIDO",state.cloth],
		["parts","PEÇAS",state.parts],["electronics","ELETRÔNICOS",state.electronics],["fuel","COMBUSTÍVEL",state.fuel],["research","CONHECIMENTO",state.research]
	]
	for i in range(items.size()):
		var col:=i%4
		var row:=i/4
		var r:=Rect2(80+col*360,230+row*175,320,140)
		_panel(r,Color("#15191a"),Color("#575b58"))
		_text(str(items[i][1]),r.position+Vector2(24,38),18,C_INK)
		_text("x"+str(items[i][2]),r.position+Vector2(24,78),28,C_AMBER)
		hotspots.append({"id":"item:"+str(items[i][0]),"rect":r})
	_panel(Rect2(80,770,1020,90),Color("#121515"),C_LINE)
	_text("ARMA: "+str(state.weapon),Vector2(110,810),18,C_INK)
	_text("CAPACIDADE: %d / %d"%[_weight(),int(state.backpack)],Vector2(380,810),18,C_INK)
	_text("PESQUISA: %d"%int(state.research),Vector2(700,810),18,C_INK)
	_button("back_context",Rect2(1260,790,280,58),"VOLTAR")

func _draw_research() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#10100f"))
	_hud()
	_text("MESA DE PESQUISA",Vector2(64,145),34,C_INK)
	_text("Descubra fora. Entenda aqui. Construa depois.",Vector2(64,177),15,C_MUTED)
	_text("Conhecimento disponível: %d"%int(state.research),Vector2(1250,150),17,C_AMBER)
	for i in range(PROJECTS.size()):
		var pr:Dictionary=PROJECTS[i]
		var col:=i%2
		var row:=i/2
		var r:=Rect2(80+col*760,220+row*190,700,160)
		var built:bool = str(pr.id) in state.projects
		var known:bool = _project_known(str(pr.id))
		_panel(r,Color("#161817"),C_GREEN if built else (C_AMBER if known else Color("#454640")))
		_text(str(pr.name),r.position+Vector2(24,36),21,C_INK if known else C_MUTED)
		_text(str(pr.desc),r.position+Vector2(24,72),13,C_MUTED)
		_text(_need_text(pr.need)+" • pesquisa "+str(pr.rp),r.position+Vector2(24,120),13,C_AMBER if known else C_MUTED)
		_text("CONCLUÍDO" if built else ("TOQUE PARA CONSTRUIR" if known else "CONHECIMENTO AUSENTE"),r.position+Vector2(470,130),12,C_GREEN if built else C_MUTED)
		hotspots.append({"id":"project:"+str(pr.id),"rect":r})
	_button("crafting",Rect2(930,830,280,58),"FABRICAÇÃO")
	_button("shelter",Rect2(1260,830,280,58),"VOLTAR AO ABRIGO")

func _draw_crafting() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#101210"))
	_hud()
	_text("OFICINA",Vector2(64,145),34,C_INK)
	_text("Ferramentas simples. Resultados diretos.",Vector2(64,177),15,C_MUTED)
	for i in range(CRAFTS.size()):
		var cr:Dictionary=CRAFTS[i]
		var r:=Rect2(90,230+i*145,1460,112)
		_panel(r,Color("#151817"),Color("#565a55"))
		_text(str(cr.name),r.position+Vector2(24,38),22,C_INK)
		_text(_need_text(cr.need)+" • %d min"%int(cr.time),r.position+Vector2(24,76),14,C_MUTED)
		_button("craft:"+str(cr.id),Rect2(r.end.x-250,r.position.y+24,210,60),"FABRICAR")
	_button("research",Rect2(1260,830,280,58),"PESQUISA")

func _draw_event() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#0b0d0e"))
	_hud()
	_panel(Rect2(220,160,1208,600),Color("#141616"),Color("#6b604f"),3)
	_text(str(event_data.get("title","EVENTO")),Vector2(270,225),35,C_INK)
	_text(str(event_data.get("text","")),Vector2(270,280),18,C_MUTED)
	var choices:Array=event_data.get("choices",[])
	for i in range(choices.size()):
		_button("event:"+str(i),Rect2(300+i*350,640,300,72),str(choices[i].label),i==0,19)

func _draw_help() -> void:
	draw_rect(Rect2(0,0,1648,920),Color("#0e1111"))
	_text("COMO JOGAR",Vector2(70,100),38,C_INK)
	var lines=[
		"1. O ABRIGO É SUA CASA. Toque nos objetos físicos: cama, oficina, rádio, estoque, enfermaria e porta.",
		"2. SAIA PELO MAPA. Cada local tem distância, risco e recursos próprios.",
		"3. DENTRO DOS LOCAIS, toque em objetos reais: prateleiras, armários, carros, documentos e portas.",
		"4. COMBATE É CURTO E PERIGOSO. Atacar, esquivar, recuar ou usar item.",
		"5. LEVE MANUAIS E PEÇAS PARA CASA. Pesquisa abre projetos e muda fisicamente o abrigo.",
		"6. NÃO EXISTE ENERGIA DE CELULAR OU ESPERA REAL. Todo tempo passa dentro da campanha.",
		"7. A CIDADE MUDA COM SUAS DESCOBERTAS. Rádio, documentos e eventos revelam novos lugares."
	]
	for i in range(lines.size()):
		_panel(Rect2(90,160+i*88,1460,70),Color("#151818"),Color("#3d4140"))
		_text(lines[i],Vector2(118,203+i*88),17,C_INK)
	_button("menu",Rect2(1280,830,260,58),"VOLTAR")

func _action(id:String) -> void:
	if id=="new_game":
		_new_game()
	elif id=="continue":
		if _load(): screen=Screen.SHELTER
		else: _new_game()
	elif id=="help":
		screen=Screen.HELP
	elif id=="menu":
		screen=Screen.MENU
	elif id=="shelter":
		screen=Screen.SHELTER
	elif id=="map":
		if tutorial_step<1: tutorial_step=1
		screen=Screen.MAP
	elif id=="inventory":
		screen=Screen.INVENTORY
	elif id=="back_context":
		screen=Screen.SHELTER if current_location=="" else Screen.LOCATION
	elif id=="research":
		screen=Screen.RESEARCH
	elif id=="crafting":
		if int(state.facilities.workshop)<=0:
			_toast("Monte primeiro a Mesa de Pesquisa/Oficina improvisada.")
		else:
			screen=Screen.CRAFTING
	elif id=="storage":
		screen=Screen.INVENTORY
	elif id=="rest":
		_rest()
	elif id=="radio":
		_radio_event()
	elif id=="infirmary":
		_heal()
	elif id=="generator":
		if int(state.facilities.generator)>0:
			_toast("Gerador operacional. Combustível: %d"%int(state.fuel))
		else:
			_toast("Aqui há espaço para um gerador. Pesquise e construa um.")
	elif id=="leave_location":
		_leave_location()
	elif id.begins_with("loc:"):
		_travel_to(id.trim_prefix("loc:"))
	elif id.begins_with("object:"):
		_search_object(id.trim_prefix("object:"))
	elif id.begins_with("item:"):
		_use_item(id.trim_prefix("item:"))
	elif id.begins_with("project:"):
		_build_project(id.trim_prefix("project:"))
	elif id.begins_with("craft:"):
		_craft(id.trim_prefix("craft:"))
	elif id=="combat_attack":
		_combat_attack()
	elif id=="combat_dodge":
		_combat_dodge()
	elif id=="combat_retreat":
		_combat_retreat()
	elif id=="combat_item":
		_combat_item()
	elif id.begins_with("event:"):
		_resolve_event(int(id.trim_prefix("event:")))
	queue_redraw()

func _new_game() -> void:
	state = {
		"day":1,"minutes":455,"weather":"CHUVA","health":100,"hunger":18,"thirst":16,"fatigue":8,"morale":55,"infection":0,
		"food":4,"water":5,"med":1,"bandage":1,"ammo":4,"fuel":0,"scrap":3,"wood":2,"cloth":2,"parts":0,"electronics":0,"chemicals":0,"research":0,
		"backpack":12,"weapon":"FACA","melee":"FACA","firearm":"","known":["SUPERMERCADO","FARMÁCIA"],"visited":{},"searched":{},
		"facilities":{"bed":1,"storage":1,"radio":1,"workshop":0,"research":0,"infirmary":0,"generator":0,"filter":0},
		"blueprints":[],"projects":[],"journal":[],"flags":{},"xp":0
	}
	tutorial_step=0
	current_location=""
	screen=Screen.SHELTER
	_toast("PRIMEIRO DIA: a água acaba em breve. Explore o abrigo e escolha sua primeira saída.")
	_save()

func _objective() -> String:
	if not bool(state.flags.get("first_trip",false)):
		return "OBJETIVO: encontre comida e alguma pista no Supermercado."
	if not ("desk" in state.projects):
		return "OBJETIVO: reúna sucata e madeira para montar a Mesa de Pesquisa."
	if not bool(state.flags.get("manual_found",false)):
		return "OBJETIVO: procure conhecimento no escritório do Supermercado ou na Biblioteca."
	if not ("filter" in state.projects):
		return "OBJETIVO: pesquise um Filtro de Água."
	if not ("POSTO" in state.known):
		return "OBJETIVO: use o rádio ou documentos para localizar o Posto."
	return "OBJETIVO: escolha uma necessidade real do abrigo e planeje a próxima saída."

func _travel_to(name:String) -> void:
	if not LOCATIONS.has(name): return
	var mins:=int(LOCATIONS[name].distance)
	_advance(mins)
	state.flags["first_trip"]=true
	current_location=name
	state.visited[name]=int(state.visited.get(name,0))+1
	_toast("Chegada em %s • %d min • %s"%[name,mins,TIPS[rng.randi_range(0,TIPS.size()-1)]])
	if rng.randf()<0.22+float(LOCATIONS[name].risk)*0.05:
		_start_combat(name,int(LOCATIONS[name].risk))
	else:
		screen=Screen.LOCATION
	_save()

func _leave_location() -> void:
	var mins:=int(LOCATIONS.get(current_location,{}).get("distance",20))
	_advance(mins)
	current_location=""
	screen=Screen.SHELTER
	if int(state.minutes)>1260:
		state.fatigue=min(100,int(state.fatigue)+8)
		_toast("Você voltou tarde. A cidade estava muito mais ativa no escuro.")
	else:
		_toast("Você voltou ao abrigo. Organize o que trouxe antes de sair de novo.")
	_save()

func _search_object(obj_id:String) -> void:
	var data:Dictionary=LOCATIONS.get(current_location,{})
	var obj:Dictionary={}
	for o in data.get("objects",[]):
		if str(o.id)==obj_id:
			obj=o
			break
	if obj.is_empty(): return
	var key:=current_location+"|"+obj_id
	if bool(state.searched.get(key,false)):
		_toast("Você já vasculhou isso. Restou pouca coisa útil.")
		if rng.randf()<0.2: state.scrap=int(state.scrap)+1
		return
	state.searched[key]=true
	_advance(rng.randi_range(12,28))
	var kind:=str(obj.kind)
	if kind=="danger":
		_start_combat(current_location,max(1,int(data.risk)))
		return
	var msg:=_grant_loot(kind,current_location,obj_id)
	_toast(msg)
	_discovery_logic(current_location,obj_id,kind)
	_save()

func _grant_loot(kind:String,loc:String,obj:String) -> String:
	match kind:
		"food":
			var f:=rng.randi_range(1,3); var w:=rng.randi_range(0,2)
			state.food=int(state.food)+f; state.water=int(state.water)+w
			return "Você encontrou %d comida e %d água."%[f,w]
		"medical":
			var m:=rng.randi_range(0,2); var b:=rng.randi_range(1,2)
			state.med=int(state.med)+m; state.bandage=int(state.bandage)+b
			return "Suprimentos médicos: %d remédio, %d bandagem."%[m,b]
		"parts":
			var p:=rng.randi_range(1,3); var s:=rng.randi_range(1,2)
			state.parts=int(state.parts)+p; state.scrap=int(state.scrap)+s
			return "Peças úteis: %d componentes e %d sucata."%[p,s]
		"fuel":
			var f:=rng.randi_range(1,2); state.fuel=int(state.fuel)+f
			return "Você recuperou %d unidade(s) de combustível."%f
		"knowledge":
			state.research=int(state.research)+1
			return "Você encontrou material técnico. +1 conhecimento."
		"vehicle":
			state.parts=int(state.parts)+2; state.research=int(state.research)+1
			return "O veículo ainda pode ensinar alguma coisa. +2 peças, +1 conhecimento."
		_:
			var s:=rng.randi_range(1,2); state.scrap=int(state.scrap)+s
			var extra:=""
			if rng.randf()<0.45:
				state.cloth=int(state.cloth)+1
				extra=" e tecido"
			elif rng.randf()<0.45:
				state.wood=int(state.wood)+1
				extra=" e madeira"
			return "Você separou %d sucata%s ainda aproveitável."%[s,extra]

func _discovery_logic(loc:String,obj:String,kind:String) -> void:
	if loc=="SUPERMERCADO" and obj=="office":
		state.flags["manual_found"]=true
		_add_known("POSTO")
		_add_known("BIBLIOTECA")
		state.research=int(state.research)+1
		_event("CADERNO DO ENCARREGADO","Entre notas de estoque há páginas sobre filtragem, baterias e manutenção. Um endereço de posto está circulado.",[
			{"label":"LEVAR PARA CASA","action":"manual"},{"label":"MARCAR O POSTO","action":"post"}
		])
	elif loc=="POSTO" and obj=="garage":
		_add_known("OFICINA")
		state.research=int(state.research)+1
	elif loc=="HOSPITAL" and obj=="archive":
		state.flags["hospital_truth"]=true
		state.research=int(state.research)+2
	elif loc=="BIBLIOTECA" and kind=="knowledge":
		state.flags["manual_found"]=true
		state.research=int(state.research)+1

func _add_known(name:String) -> void:
	if not (name in state.known):
		state.known.append(name)

func _start_combat(loc:String,risk:int) -> void:
	var count:=1 if risk<=2 else (2 if risk<=4 else 3)
	var enemies:Array=[]
	for i in range(count):
		enemies.append({"hp":30+risk*8,"max":30+risk*8})
	combat={"enemies":enemies,"distance":3,"threat":risk,"dodging":false,"message":"Você ouviu movimento. Algo veio na sua direção."}
	screen=Screen.COMBAT

func _combat_attack() -> void:
	var enemies:Array=combat.enemies
	var idx:=-1
	for i in range(enemies.size()):
		if int(enemies[i].hp)>0:
			idx=i; break
	if idx<0: return
	var damage:=8
	var ranged:=false
	if str(state.weapon)=="FACA": damage=18
	elif str(state.weapon)=="TACO": damage=24
	elif str(state.weapon)=="LANÇA": damage=22
	elif str(state.weapon)=="PISTOLA" and int(state.ammo)>0:
		damage=38; state.ammo=int(state.ammo)-1; ranged=true
	if not ranged and int(combat.distance)>1:
		combat.distance=max(1,int(combat.distance)-1)
		combat.message="Você fecha a distância. O infectado também avança."
		_enemy_turn()
		queue_redraw()
		return
	enemies[idx].hp=max(0,int(enemies[idx].hp)-damage)
	combat.enemies=enemies
	combat.message="Você causa %d de dano."%damage
	if _combat_won():
		_win_combat()
	else:
		_enemy_turn()
	_save()

func _combat_dodge() -> void:
	combat.dodging=true
	combat.message="Você prepara o corpo para sair da linha do ataque."
	if int(combat.distance)>1:
		combat.distance=max(1,int(combat.distance)-1)
	_enemy_turn()

func _combat_retreat() -> void:
	var chance:=0.45+float(combat.distance)*0.12
	if rng.randf()<chance:
		combat.message="Você rompe contato e consegue recuar."
		screen=Screen.LOCATION
		_advance(8)
	else:
		combat.message="Você tenta recuar, mas fica preso entre os obstáculos."
		_enemy_turn()

func _combat_item() -> void:
	if int(state.bandage)>0 and int(state.health)<85:
		state.bandage=int(state.bandage)-1
		state.health=min(100,int(state.health)+28)
		combat.message="Bandagem aplicada. Você recupera parte da condição."
		_enemy_turn()
	else:
		combat.message="Nada na mochila resolve isso agora."
		_enemy_turn()

func _enemy_turn() -> void:
	if int(combat.distance)>1:
		combat.distance=max(1,int(combat.distance)-1)
		combat.message += " A ameaça se aproxima."
		combat.dodging=false
		return
	var alive:=0
	for e in combat.enemies:
		if int(e.hp)>0: alive+=1
	var dmg:=alive*(6+int(combat.threat)*2)
	if bool(combat.dodging):
		dmg=int(dmg*0.35)
		combat.dodging=false
	state.health=max(0,int(state.health)-dmg)
	combat.message += " Você sofre %d de dano."%dmg
	if int(state.health)<=0:
		_game_over()

func _combat_won() -> bool:
	for e in combat.enemies:
		if int(e.hp)>0: return false
	return true

func _win_combat() -> void:
	state.xp=int(state.xp)+5+int(combat.threat)*2
	state.scrap=int(state.scrap)+rng.randi_range(0,1)
	combat.message="A área ficou silenciosa. Por enquanto."
	screen=Screen.LOCATION
	_toast("Ameaça eliminada. Vasculhar ainda custa tempo.")
	_save()

func _game_over() -> void:
	event_data={"title":"VOCÊ NÃO VOLTOU","text":"A cidade venceu desta vez. Seu último save continua disponível para recomeçar.","choices":[{"label":"MENU","action":"menu"},{"label":"CARREGAR","action":"load"}]}
	screen=Screen.EVENT

func _rest() -> void:
	_advance(360)
	state.fatigue=max(0,int(state.fatigue)-55)
	state.health=min(100,int(state.health)+12)
	state.hunger=min(100,int(state.hunger)+5)
	state.thirst=min(100,int(state.thirst)+8)
	_toast("Algumas horas de sono. A cidade continuou mudando lá fora.")
	_save()

func _heal() -> void:
	if int(state.med)<=0:
		_toast("Você não tem remédios.")
		return
	state.med=int(state.med)-1
	state.health=min(100,int(state.health)+35)
	_advance(25)
	_toast("Tratamento concluído.")
	_save()

func _radio_event() -> void:
	if not bool(state.flags.get("radio_hospital",false)):
		state.flags["radio_hospital"]=true
		_add_known("HOSPITAL")
		_event("TRANSMISSÃO INTERROMPIDA","Uma voz cansada repete: 'Hospital Central... entrada de serviço... ainda existem medicamentos...'. Depois só há estática.",[
			{"label":"MARCAR HOSPITAL","action":"hospital"},{"label":"DESLIGAR","action":"close"}
		])
	elif not ("DELEGACIA" in state.known):
		_add_known("DELEGACIA")
		_event("FREQUÊNCIA DE EMERGÊNCIA","Um loop antigo cita a Delegacia Central e uma rota de evacuação que nunca foi concluída.",[
			{"label":"MARCAR NO MAPA","action":"police"},{"label":"IGNORAR","action":"close"}
		])
	else:
		_toast("Só estática e fragmentos de vozes. Talvez uma antena melhor alcance mais longe.")

func _event(title:String,text:String,choices:Array) -> void:
	event_data={"title":title,"text":text,"choices":choices}
	screen=Screen.EVENT

func _resolve_event(index:int) -> void:
	var choices:Array=event_data.get("choices",[])
	if index<0 or index>=choices.size(): return
	var a:=str(choices[index].action)
	if a=="menu":
		screen=Screen.MENU
	elif a=="load":
		if _load(): screen=Screen.SHELTER
		else: screen=Screen.MENU
	else:
		screen=Screen.LOCATION if current_location!="" else Screen.SHELTER
	_save()

func _project_known(id:String) -> bool:
	if id=="desk": return true
	if id=="filter": return bool(state.flags.get("manual_found",false))
	if id=="pack": return "OFICINA" in state.known
	if id=="generator": return "POSTO" in state.known and "OFICINA" in state.known
	if id=="infirmary": return "HOSPITAL" in state.known
	if id=="antenna": return "BIBLIOTECA" in state.known
	return false

func _need_text(need:Dictionary) -> String:
	var parts_text:Array[String]=[]
	for k in need:
		parts_text.append("%s %d"%[str(k).to_upper(),int(need[k])])
	return " • ".join(parts_text)

func _has_need(need:Dictionary) -> bool:
	for k in need:
		if int(state.get(k,0))<int(need[k]): return false
	return true

func _consume_need(need:Dictionary) -> void:
	for k in need:
		state[k]=int(state.get(k,0))-int(need[k])

func _build_project(id:String) -> void:
	var pr:Dictionary={}
	for p in PROJECTS:
		if str(p.id)==id: pr=p; break
	if pr.is_empty() or id in state.projects: return
	if not _project_known(id):
		_toast("Você ainda não entende esse projeto.")
		return
	if int(state.research)<int(pr.rp):
		_toast("Falta conhecimento para concluir esse projeto.")
		return
	if not _has_need(pr.need):
		_toast("Faltam materiais.")
		return
	_consume_need(pr.need)
	state.research=int(state.research)-int(pr.rp)
	state.projects.append(id)
	match id:
		"desk": state.facilities.research=1; state.facilities.workshop=1
		"filter": state.facilities.filter=1; state.water=int(state.water)+3
		"pack": state.backpack=int(state.backpack)+8
		"generator": state.facilities.generator=1
		"infirmary": state.facilities.infirmary=1
		"antenna":
			_add_known("DELEGACIA"); _add_known("HOSPITAL"); _add_known("BIBLIOTECA")
	_advance(45+int(pr.rp)*15)
	_toast(str(pr.name)+" concluído. A mudança agora faz parte do abrigo.")
	_save()

func _craft(id:String) -> void:
	var cr:Dictionary={}
	for c in CRAFTS:
		if str(c.id)==id: cr=c; break
	if cr.is_empty(): return
	if not _has_need(cr.need):
		_toast("Faltam materiais.")
		return
	_consume_need(cr.need)
	_advance(int(cr.time))
	match id:
		"bandage": state.bandage=int(state.bandage)+1
		"bat": state.weapon="TACO"
		"spear": state.weapon="LANÇA"
		"lockpick": state.flags["lockpick"]=true
	_toast(str(cr.name)+" fabricado.")
	_save()

func _use_item(id:String) -> void:
	if id=="food" and int(state.food)>0:
		state.food=int(state.food)-1; state.hunger=max(0,int(state.hunger)-28); _toasts("Você come algo rápido.")
	elif id=="water" and int(state.water)>0:
		state.water=int(state.water)-1; state.thirst=max(0,int(state.thirst)-35); _toasts("Você bebe água.")
	elif id=="med" and int(state.med)>0 and int(state.health)<100:
		state.med=int(state.med)-1; state.health=min(100,int(state.health)+25); _toasts("Você usa um remédio.")
	else:
		_toast("Esse item é recurso, não uma ação imediata.")
	_save()

func _toasts(t:String) -> void:
	_toast(t)

func _toast(t:String) -> void:
	toast_text=t
	toast_until=Time.get_ticks_msec()+4200
	queue_redraw()

func _save() -> void:
	var f:=FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(state))
		f.close()

func _load() -> bool:
	if not FileAccess.file_exists(SAVE_PATH): return false
	var f:=FileAccess.open(SAVE_PATH,FileAccess.READ)
	if not f: return false
	var parsed=JSON.parse_string(f.get_as_text())
	f.close()
	if typeof(parsed)!=TYPE_DICTIONARY: return false
	for k in parsed:
		state[k]=parsed[k]
	return true

func _qa_reborn() -> void:
	_new_game()
	if screen!=Screen.SHELTER:
		push_error("QA shelter")
		get_tree().quit(2); return
	_travel_to("SUPERMERCADO")
	screen=Screen.LOCATION
	_search_object("office")
	if not bool(state.flags.get("manual_found",false)):
		push_error("QA manual")
		get_tree().quit(3); return
	state.scrap=10; state.wood=10; state.research=10
	_build_project("desk")
	if int(state.facilities.research)<=0:
		push_error("QA research")
		get_tree().quit(4); return
	_start_combat("SUPERMERCADO",1)
	combat.enemies[0]["hp"]=1
	combat.distance=1
	_combat_attack()
	if screen!=Screen.LOCATION:
		push_error("QA combat")
		get_tree().quit(5); return
	_save()
	print("REBORN_QA PASS known=%d projects=%d hp=%d"%[state.known.size(),state.projects.size(),int(state.health)])
	get_tree().quit(0)

func _capture_reborn(which:String) -> void:
	_new_game()
	match which:
		"menu":
			screen=Screen.MENU
		"shelter":
			screen=Screen.SHELTER
		"map":
			screen=Screen.MAP
		"market":
			current_location="SUPERMERCADO"; screen=Screen.LOCATION
		"combat":
			current_location="POSTO"; _start_combat("POSTO",2)
		"research":
			state.facilities.research=1; state.research=8; state.flags["manual_found"]=true; state.known.append("POSTO"); state.known.append("OFICINA"); screen=Screen.RESEARCH
		_:
			screen=Screen.SHELTER
	queue_redraw()
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	var img:=get_viewport().get_texture().get_image()
	var path:="res://capture_reborn_%s.png"%which
	var err:=img.save_png(path)
	print("REBORN_CAPTURE %s err=%d"%[path,err])
	get_tree().quit(0)
