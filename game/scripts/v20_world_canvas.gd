extends Control
class_name V20WorldCanvas

var mode: String = "menu"
var rain_offset: float = 0.0
var filter_built: bool = false
var enemy_hp: int = 45
var player_hp: int = 100
var market_cleared: bool = false
var radio_active: bool = false
var time_phase: float = 0.0

const INK := Color("#111412")
const BLACK := Color("#080a09")
const STEEL := Color("#252a27")
const STEEL_2 := Color("#343a35")
const CONCRETE := Color("#46483f")
const BONE := Color("#ded8c9")
const MUTED := Color("#8e8b7d")
const AMBER := Color("#d08a3f")
const AMBER_DIM := Color("#7b4d27")
const RED := Color("#a9231f")
const RED_DARK := Color("#551512")
const BLUE := Color("#3b5663")
const RAIN := Color(0.55,0.68,0.72,0.24)

func _ready() -> void:
    mouse_filter = Control.MOUSE_FILTER_IGNORE
    set_process(true)

func set_scene(new_mode: String) -> void:
    mode = new_mode
    queue_redraw()

func _process(delta: float) -> void:
    rain_offset = fmod(rain_offset + delta * 520.0, 920.0)
    time_phase += delta
    queue_redraw()

func _draw() -> void:
    match mode:
        "menu":
            _draw_menu()
        "shelter":
            _draw_shelter()
        "map":
            _draw_map()
        "market":
            _draw_market(false)
        "combat":
            _draw_market(true)
        "research":
            _draw_research()
        "inventory":
            _draw_inventory()
        _:
            _draw_shelter()

func _gradient_rect(rect: Rect2, top: Color, bottom: Color, steps: int = 36) -> void:
    var step_h := rect.size.y / float(steps)
    for i in range(steps):
        var t := float(i) / float(maxi(steps - 1, 1))
        draw_rect(Rect2(rect.position + Vector2(0, i * step_h), Vector2(rect.size.x, step_h + 1.0)), top.lerp(bottom, t))

func _draw_grain(area: Rect2, amount: int = 210) -> void:
    var rng := RandomNumberGenerator.new()
    rng.seed = 77431
    for i in range(amount):
        var p := Vector2(rng.randf_range(area.position.x, area.end.x), rng.randf_range(area.position.y, area.end.y))
        var a := rng.randf_range(0.018, 0.055)
        draw_circle(p, rng.randf_range(0.5, 1.8), Color(0.85,0.82,0.70,a))

func _draw_rain(area: Rect2, count: int = 125) -> void:
    var rng := RandomNumberGenerator.new()
    rng.seed = 99217
    for i in range(count):
        var x := rng.randf_range(area.position.x, area.end.x)
        var base_y := rng.randf_range(area.position.y - 920.0, area.end.y)
        var y := fmod(base_y + rain_offset, area.size.y + 120.0) + area.position.y - 60.0
        var len := rng.randf_range(11.0, 28.0)
        draw_line(Vector2(x,y), Vector2(x-4.0,y+len), RAIN, rng.randf_range(0.7,1.5), true)

func _draw_city(rect: Rect2, horizon: float, warm: bool = false) -> void:
    _gradient_rect(rect, Color("#121a1c"), Color("#27241f") if warm else Color("#101414"), 42)
    var rng := RandomNumberGenerator.new()
    rng.seed = 8823
    var x := rect.position.x - 15.0
    while x < rect.end.x:
        var w := rng.randf_range(44.0, 105.0)
        var h := rng.randf_range(90.0, 315.0)
        var y := horizon - h
        var c := Color("#161b1b") if int(x) % 2 == 0 else Color("#1c201f")
        draw_rect(Rect2(x,y,w,horizon-y+30), c)
        draw_rect(Rect2(x+6,y-8,w-12,9), Color("#0b0d0c"))
        var row_y := y + 20.0
        while row_y < horizon - 18.0:
            var wx := x + 10.0
            while wx < x+w-8.0:
                var lit := rng.randf() > 0.79
                draw_rect(Rect2(wx,row_y,5,7), Color(0.91,0.56,0.25,0.42) if lit else Color(0.11,0.15,0.15,0.55))
                wx += 16.0
            row_y += 20.0
        x += w + rng.randf_range(8,22)
    draw_rect(Rect2(rect.position.x,horizon,rect.size.x,rect.end.y-horizon), Color("#0d100f"))
    for i in range(14):
        var py := horizon + i * 10.0
        draw_line(Vector2(rect.position.x,py), Vector2(rect.end.x,py), Color(0.45,0.38,0.26,0.035), 1)
    _draw_grain(rect, 120)

func _draw_menu() -> void:
    var full := Rect2(0,0,size.x,size.y)
    _draw_city(full, 665.0, true)
    draw_rect(Rect2(0,0,590,size.y), Color(0.015,0.017,0.016,0.87))
    draw_rect(Rect2(590,0,3,size.y), Color(0.45,0.35,0.22,0.28))
    _draw_road(Vector2(580,680), Vector2(1620,850), 250)
    _draw_player(Vector2(780,662), 1.45, false)
    _draw_dog(Vector2(910,726), 1.15)
    draw_circle(Vector2(1290,240), 62, Color(0.95,0.61,0.31,0.15))
    draw_circle(Vector2(1290,240), 28, Color(0.98,0.73,0.42,0.33))
    _draw_rain(Rect2(590,0,size.x-590,size.y), 150)
    for i in range(7):
        var px := 680 + i*130
        draw_line(Vector2(px,410), Vector2(px,690), Color("#25251f"), 5)
        draw_circle(Vector2(px,425), 7, Color(0.95,0.58,0.26,0.45))
    draw_rect(Rect2(0,0,size.x,size.y), Color(0,0,0,0.08))

func _draw_road(a: Vector2, b: Vector2, width: float) -> void:
    var dir := (b-a).normalized()
    var n := Vector2(-dir.y,dir.x) * width * 0.5
    draw_colored_polygon(PackedVector2Array([a+n,b+n,b-n,a-n]), Color("#171816"))
    draw_line(a,b,Color(0.72,0.62,0.40,0.12),3)

func _draw_shelter() -> void:
    var full := Rect2(0,0,size.x,size.y)
    _draw_city(Rect2(0,0,size.x,330), 295, false)
    _draw_rain(Rect2(0,0,size.x,330), 90)
    draw_rect(Rect2(0,300,size.x,size.y-300), Color("#090b0a"))
    var shell := Rect2(58,236,size.x-116,592)
    draw_rect(shell, Color("#161816"))
    draw_rect(Rect2(shell.position.x,shell.position.y,shell.size.x,10), Color("#4a4337"))
    draw_rect(Rect2(shell.position.x,shell.end.y-10,shell.size.x,10), Color("#3f3a31"))
    draw_rect(Rect2(shell.position.x,shell.position.y,10,shell.size.y), Color("#3b3830"))
    draw_rect(Rect2(shell.end.x-10,shell.position.y,10,shell.size.y), Color("#3b3830"))
    var gap := 12.0
    var room_w := (shell.size.x - gap*4.0) / 3.0
    var room_h := (shell.size.y - gap*3.0) / 2.0
    var rooms := [
        Rect2(shell.position.x+gap, shell.position.y+gap, room_w, room_h),
        Rect2(shell.position.x+gap*2+room_w, shell.position.y+gap, room_w, room_h),
        Rect2(shell.position.x+gap*3+room_w*2, shell.position.y+gap, room_w, room_h),
        Rect2(shell.position.x+gap, shell.position.y+gap*2+room_h, room_w, room_h),
        Rect2(shell.position.x+gap*2+room_w, shell.position.y+gap*2+room_h, room_w, room_h),
        Rect2(shell.position.x+gap*3+room_w*2, shell.position.y+gap*2+room_h, room_w, room_h)
    ]
    for r in rooms:
        _draw_room(r)
    _draw_bed(rooms[0])
    _draw_workbench(rooms[1])
    _draw_radio_room(rooms[2])
    _draw_storage(rooms[3])
    _draw_medbay(rooms[4])
    _draw_generator(rooms[5])
    _draw_player(Vector2(rooms[1].get_center().x+20,rooms[1].end.y-18),0.78,false)
    _draw_front_door(Vector2(shell.get_center().x, shell.end.y-6))
    if filter_built:
        _draw_filter(Vector2(rooms[4].end.x-54, rooms[4].end.y-48))
    _draw_grain(shell,230)

func _draw_room(r: Rect2) -> void:
    _gradient_rect(r, Color("#27251f"), Color("#171916"), 24)
    draw_rect(r, Color("#66543b"), false, 2)
    draw_rect(Rect2(r.position+Vector2(10,12),Vector2(r.size.x-20,4)), Color(0.84,0.53,0.25,0.22))
    draw_circle(Vector2(r.get_center().x,r.position.y+28), 54, Color(0.93,0.57,0.27,0.055))
    draw_circle(Vector2(r.get_center().x,r.position.y+28), 24, Color(0.93,0.57,0.27,0.075))
    draw_rect(Rect2(r.position.x+15,r.end.y-15,r.size.x-30,4),Color("#332e25"))

func _draw_bed(r: Rect2) -> void:
    var y := r.end.y-86
    draw_rect(Rect2(r.position.x+28,y,210,54),Color("#242723"))
    draw_rect(Rect2(r.position.x+34,y+8,194,37),Color("#4a4940"))
    draw_rect(Rect2(r.position.x+40,y+12,52,26),Color("#777163"))
    draw_line(Vector2(r.position.x+25,y-28),Vector2(r.position.x+25,r.end.y-22),Color("#5b5141"),5)
    draw_rect(Rect2(r.position.x+252,r.position.y+80,84,142),Color("#252824"))
    for i in range(3):
        draw_line(Vector2(r.position.x+260,r.position.y+112+i*32),Vector2(r.position.x+328,r.position.y+112+i*32),Color("#494a40"),2)

func _draw_workbench(r: Rect2) -> void:
    var y := r.end.y-95
    draw_rect(Rect2(r.position.x+35,y,290,16),Color("#5b4934"))
    draw_rect(Rect2(r.position.x+46,y+16,12,58),Color("#40392e"))
    draw_rect(Rect2(r.position.x+296,y+16,12,58),Color("#40392e"))
    draw_rect(Rect2(r.position.x+64,r.position.y+70,246,82),Color("#242621"))
    for i in range(7):
        draw_circle(Vector2(r.position.x+85+i*31,r.position.y+92+(i%2)*18),3,Color("#a98855"))
    draw_line(Vector2(r.position.x+92,r.position.y+117),Vector2(r.position.x+107,r.position.y+80),AMBER,3)
    draw_rect(Rect2(r.position.x+180,y-34,46,30),Color("#29302f"))
    draw_rect(Rect2(r.position.x+187,y-29,32,18),Color(0.25,0.58,0.60,0.35))

func _draw_radio_room(r: Rect2) -> void:
    draw_rect(Rect2(r.position.x+42,r.end.y-92,275,60),Color("#38352d"))
    draw_rect(Rect2(r.position.x+78,r.end.y-142,115,48),Color("#222724"))
    draw_circle(Vector2(r.position.x+101,r.end.y-119),12,Color("#161a18"))
    draw_line(Vector2(r.position.x+181,r.end.y-142),Vector2(r.position.x+201,r.end.y-212),Color("#8a7b61"),2)
    for i in range(5):
        draw_line(Vector2(r.position.x+213+i*13,r.end.y-120),Vector2(r.position.x+220+i*13,r.end.y-120),Color("#ba9a67"),2)
    if radio_active:
        draw_circle(Vector2(r.position.x+132,r.end.y-118),4,Color("#cf3c32"))
        draw_arc(Vector2(r.position.x+132,r.end.y-118),28,-0.8,0.8,12,Color(0.70,0.85,0.78,0.34),2)

func _draw_storage(r: Rect2) -> void:
    for shelf in range(3):
        var sy := r.position.y+66+shelf*66
        draw_line(Vector2(r.position.x+34,sy),Vector2(r.end.x-34,sy),Color("#67604d"),5)
        for i in range(6):
            var w := 27 + (i%3)*8
            draw_rect(Rect2(r.position.x+46+i*48,sy-34,w,31),Color("#4c4639") if i%2==0 else Color("#353c36"))
    draw_rect(Rect2(r.position.x+276,r.end.y-92,60,60),Color("#6a5538"))
    draw_line(Vector2(r.position.x+276,r.end.y-62),Vector2(r.position.x+336,r.end.y-62),Color("#2a2822"),2)

func _draw_medbay(r: Rect2) -> void:
    draw_rect(Rect2(r.position.x+46,r.end.y-92,230,46),Color("#d0ccc0"))
    draw_rect(Rect2(r.position.x+58,r.end.y-84,206,30),Color("#8f9389"))
    draw_rect(Rect2(r.position.x+298,r.position.y+80,38,104),Color("#d4d0c5"))
    draw_rect(Rect2(r.position.x+313,r.position.y+99,8,54),RED)
    draw_rect(Rect2(r.position.x+290,r.position.y+122,54,8),RED)
    draw_line(Vector2(r.position.x+92,r.position.y+78),Vector2(r.position.x+92,r.end.y-104),Color("#8d887c"),3)
    draw_circle(Vector2(r.position.x+92,r.position.y+79),7,Color("#b8b09a"))

func _draw_generator(r: Rect2) -> void:
    var g := Rect2(r.position.x+67,r.end.y-128,242,93)
    draw_rect(g,Color("#4b402e"))
    draw_rect(Rect2(g.position+Vector2(10,12),Vector2(g.size.x-20,g.size.y-24)),Color("#232823"))
    draw_circle(Vector2(g.position.x+55,g.get_center().y),29,Color("#111513"))
    draw_circle(Vector2(g.end.x-58,g.get_center().y),21,Color("#111513"))
    draw_rect(Rect2(g.get_center().x-20,g.position.y+20,40,48),Color("#6d572f"))
    draw_line(Vector2(g.end.x-12,g.position.y+18),Vector2(g.end.x+22,g.position.y-25),Color("#7f2b23"),4)

func _draw_front_door(p: Vector2) -> void:
    var r := Rect2(p.x-64,p.y-158,128,158)
    draw_rect(r,Color("#2c2d28"))
    draw_rect(r,Color("#86725a"),false,3)
    draw_rect(Rect2(r.position.x+24,r.position.y+32,80,32),Color("#1b2221"))
    draw_circle(Vector2(r.end.x-21,r.get_center().y+23),4,AMBER)

func _draw_filter(p: Vector2) -> void:
    draw_rect(Rect2(p.x-26,p.y-64,52,62),Color("#3e4b48"))
    draw_rect(Rect2(p.x-17,p.y-53,34,40),Color("#647b73"))
    draw_line(Vector2(p.x,p.y-64),Vector2(p.x,p.y-91),Color("#8b8069"),4)
    draw_circle(Vector2(p.x,p.y-97),7,Color("#6a8c8d"))
    draw_line(Vector2(p.x+26,p.y-20),Vector2(p.x+45,p.y-20),Color("#6a8c8d"),4)

func _draw_map() -> void:
    _gradient_rect(Rect2(0,0,size.x,size.y),Color("#171b18"),Color("#0d100e"),30)
    draw_rect(Rect2(42,128,size.x-84,size.y-184),Color("#242721"))
    draw_rect(Rect2(42,128,size.x-84,size.y-184),Color("#8f7a58"),false,3)
    var roads := [
        PackedVector2Array([Vector2(95,700),Vector2(360,580),Vector2(650,610),Vector2(915,430),Vector2(1330,520),Vector2(1540,310)]),
        PackedVector2Array([Vector2(170,210),Vector2(360,390),Vector2(650,610),Vector2(720,790)]),
        PackedVector2Array([Vector2(630,220),Vector2(915,430),Vector2(1270,250)]),
        PackedVector2Array([Vector2(360,580),Vector2(320,770)])
    ]
    for road in roads:
        draw_polyline(road,Color("#6d6655"),16,true)
        draw_polyline(road,Color("#22251f"),8,true)
    draw_colored_polygon(PackedVector2Array([Vector2(45,650),Vector2(290,585),Vector2(510,710),Vector2(340,870),Vector2(45,870)]),Color("#24363a"))
    for y in range(190,820,54):
        for x in range(90,1540,72):
            if (x+y)%5 != 0:
                draw_rect(Rect2(x,y,34,23),Color(0.18,0.19,0.16,0.55))
    _draw_city_label(Vector2(165,220),"RESIDENCIAL")
    _draw_city_label(Vector2(640,340),"CENTRO")
    _draw_city_label(Vector2(1080,560),"INDUSTRIAL")
    _draw_city_label(Vector2(1280,220),"QUARENTENA")
    _draw_rain(Rect2(0,0,size.x,size.y),75)
    _draw_grain(Rect2(42,128,size.x-84,size.y-184),180)

func _draw_city_label(p: Vector2, text: String) -> void:
    draw_line(p,p+Vector2(115,0),Color(0.70,0.58,0.39,0.34),2)
    draw_circle(p-Vector2(9,0),5,Color("#a48254"))

func _draw_market(combat: bool) -> void:
    _gradient_rect(Rect2(0,0,size.x,size.y),Color("#0f1414"),Color("#171a17"),30)
    draw_rect(Rect2(0,98,size.x,size.y-98),Color("#131614"))
    for i in range(7):
        draw_line(Vector2(0,158+i*88),Vector2(size.x,158+i*88),Color(0.25,0.25,0.20,0.20),2)
    for i in range(12):
        draw_line(Vector2(50+i*145,98),Vector2(50+i*145,820),Color(0.26,0.25,0.20,0.18),3)
    _draw_market_shelf(Rect2(55,315,345,350),3)
    _draw_market_shelf(Rect2(1065,310,330,335),4)
    _draw_checkout(Rect2(450,515,430,130))
    _draw_pharmacy(Rect2(880,270,240,265))
    _draw_depot(Rect2(1225,215,250,330))
    draw_rect(Rect2(620,138,390,72),Color("#4e4b40"))
    draw_rect(Rect2(626,144,378,60),Color("#242822"))
    _draw_player(Vector2(315,770),1.08,false)
    if combat and not market_cleared:
        _draw_zombie(Vector2(1025,690),1.35)
        _draw_zombie(Vector2(1260,640),0.92,0.45)
        _draw_zombie(Vector2(1390,655),0.78,0.32)
    _draw_rain(Rect2(1160,170,470,520),70)
    draw_rect(Rect2(0,720,size.x,200),Color(0.05,0.06,0.055,0.30))
    for i in range(14):
        draw_line(Vector2(0,730+i*12),Vector2(size.x,730+i*7),Color(0.67,0.47,0.25,0.045),1)
    _draw_grain(Rect2(0,98,size.x,size.y-98),180)

func _draw_market_shelf(r: Rect2, rows: int) -> void:
    draw_rect(r,Color("#20231f"))
    draw_rect(r,Color("#77705e"),false,3)
    var rh := r.size.y / float(rows)
    for row in range(rows):
        var y := r.position.y+(row+1)*rh-8
        draw_line(Vector2(r.position.x,y),Vector2(r.end.x,y),Color("#6d6554"),5)
        for i in range(8):
            var h := 25+((i+row)%4)*6
            var x := r.position.x+18+i*39
            draw_rect(Rect2(x,y-h-4,22,h),Color("#7a5b3d") if (i+row)%2==0 else Color("#454b3f"))

func _draw_checkout(r: Rect2) -> void:
    draw_rect(r,Color("#37352d"))
    draw_rect(Rect2(r.position.x+24,r.position.y-35,56,38),Color("#242a27"))
    draw_rect(Rect2(r.position.x+31,r.position.y-29,42,22),Color(0.29,0.53,0.55,0.28))
    draw_line(Vector2(r.position.x+100,r.position.y+24),Vector2(r.end.x-30,r.position.y+24),Color("#746852"),4)

func _draw_pharmacy(r: Rect2) -> void:
    draw_rect(r,Color("#1d2621"))
    draw_rect(r,Color("#45644f"),false,4)
    draw_rect(Rect2(r.position.x+16,r.position.y+18,r.size.x-32,58),Color("#294136"))
    draw_rect(Rect2(r.get_center().x-7,r.position.y+28,14,36),Color("#ded8c9"))
    draw_rect(Rect2(r.get_center().x-19,r.position.y+39,38,14),Color("#ded8c9"))
    for y in range(int(r.position.y+100),int(r.end.y-20),48):
        draw_line(Vector2(r.position.x+18,y),Vector2(r.end.x-18,y),Color("#677060"),3)

func _draw_depot(r: Rect2) -> void:
    draw_rect(r,Color("#2a2925"))
    draw_rect(r,Color("#8a7453"),false,4)
    for x in range(int(r.position.x+28),int(r.end.x-20),45):
        draw_line(Vector2(x,r.position.y+12),Vector2(x,r.end.y-12),Color(0.13,0.13,0.11,0.32),2)
    draw_circle(Vector2(r.end.x-32,r.get_center().y),5,AMBER)

func _draw_research() -> void:
    _draw_shelter()
    draw_rect(Rect2(0,0,size.x,size.y),Color(0,0,0,0.52))
    var bench := Rect2(240,176,size.x-480,630)
    draw_rect(bench,Color("#171816"))
    draw_rect(bench,Color("#8a714d"),false,3)
    draw_rect(Rect2(bench.position.x+40,bench.end.y-168,bench.size.x-80,26),Color("#604c34"))
    draw_rect(Rect2(bench.position.x+78,bench.end.y-142,18,112),Color("#40362b"))
    draw_rect(Rect2(bench.end.x-96,bench.end.y-142,18,112),Color("#40362b"))
    for i in range(7):
        draw_line(Vector2(bench.position.x+85+i*95,bench.position.y+80),Vector2(bench.position.x+110+i*95,bench.position.y+35+(i%3)*18),Color("#9c7b4a"),5)
    var paper := Rect2(bench.position.x+190,bench.position.y+115,520,340)
    draw_colored_polygon(PackedVector2Array([paper.position,paper.position+Vector2(paper.size.x-20,7),paper.end,paper.position+Vector2(9,paper.size.y-4)]),Color("#c9c1ac"))
    for i in range(9):
        draw_line(Vector2(paper.position.x+44,paper.position.y+64+i*25),Vector2(paper.end.x-42,paper.position.y+64+i*25),Color(0.17,0.16,0.13,0.34),2)
    draw_circle(Vector2(paper.position.x+410,paper.position.y+170),62,Color(0.18,0.28,0.27,0.30))
    draw_line(Vector2(paper.position.x+410,paper.position.y+110),Vector2(paper.position.x+410,paper.position.y+230),Color("#5d786f"),4)
    draw_rect(Rect2(paper.position.x+385,paper.position.y+145,50,50),Color("#5d786f"),false,4)
    _draw_grain(bench,110)

func _draw_inventory() -> void:
    _draw_shelter()
    draw_rect(Rect2(0,0,size.x,size.y),Color(0,0,0,0.56))
    var bag := Rect2(150,205,520,565)
    draw_rect(bag,Color("#24251f"))
    draw_rect(bag,Color("#836c4d"),false,3)
    draw_arc(Vector2(bag.get_center().x,bag.position.y+56),84,3.25,6.15,30,Color("#8b7555"),8)
    draw_rect(Rect2(bag.position.x+90,bag.position.y+110,340,350),Color("#34362e"))
    draw_rect(Rect2(bag.position.x+118,bag.position.y+150,284,260),Color("#1c201c"))
    var shelf := Rect2(760,190,690,585)
    draw_rect(shelf,Color("#171916"))
    draw_rect(shelf,Color("#766448"),false,3)
    for i in range(5):
        draw_line(Vector2(shelf.position.x+35,shelf.position.y+100+i*92),Vector2(shelf.end.x-35,shelf.position.y+100+i*92),Color("#655a48"),4)
    _draw_grain(Rect2(100,160,1400,650),130)

func _draw_player(p: Vector2, scale: float = 1.0, flip: bool = false) -> void:
    var sx := -1.0 if flip else 1.0
    draw_circle(p+Vector2(0,-118)*scale,22*scale,Color("#0b0d0c"))
    draw_colored_polygon(PackedVector2Array([
        p+Vector2(-28*sx,-96)*scale,
        p+Vector2(30*sx,-95)*scale,
        p+Vector2(45*sx,-20)*scale,
        p+Vector2(21*sx,12)*scale,
        p+Vector2(-30*sx,-8)*scale
    ]),Color("#111411"))
    draw_rect(Rect2(p+Vector2(-44,-94)*scale,Vector2(28,70)*scale),Color("#292c26"))
    draw_line(p+Vector2(-12*sx,-70)*scale,p+Vector2(-55*sx,-6)*scale,Color("#171b18"),14*scale,true)
    draw_line(p+Vector2(22*sx,-67)*scale,p+Vector2(63*sx,-12)*scale,Color("#171b18"),13*scale,true)
    draw_line(p+Vector2(-14*sx,-8)*scale,p+Vector2(-28*sx,72)*scale,Color("#111411"),17*scale,true)
    draw_line(p+Vector2(16*sx,-8)*scale,p+Vector2(34*sx,72)*scale,Color("#111411"),17*scale,true)
    draw_line(p+Vector2(35*sx,-83)*scale,p+Vector2(64*sx,-144)*scale,Color("#3b352b"),6*scale,true)

func _draw_dog(p: Vector2, scale: float = 1.0) -> void:
    draw_colored_polygon(PackedVector2Array([
        p+Vector2(-38,-28)*scale,p+Vector2(24,-32)*scale,p+Vector2(48,-5)*scale,
        p+Vector2(20,12)*scale,p+Vector2(-32,10)*scale
    ]),Color("#0c0f0d"))
    draw_circle(p+Vector2(46,-38)*scale,18*scale,Color("#0c0f0d"))
    draw_colored_polygon(PackedVector2Array([p+Vector2(37,-53)*scale,p+Vector2(40,-82)*scale,p+Vector2(50,-56)*scale]),Color("#0c0f0d"))
    draw_line(p+Vector2(-20,6)*scale,p+Vector2(-26,48)*scale,Color("#0c0f0d"),9*scale)
    draw_line(p+Vector2(24,5)*scale,p+Vector2(30,48)*scale,Color("#0c0f0d"),9*scale)
    draw_line(p+Vector2(-38,-22)*scale,p+Vector2(-66,-49)*scale,Color("#0c0f0d"),8*scale)

func _draw_zombie(p: Vector2, scale: float = 1.0, alpha: float = 1.0) -> void:
    var c := Color(0.10,0.12,0.105,alpha)
    draw_circle(p+Vector2(0,-132)*scale,24*scale,c)
    draw_colored_polygon(PackedVector2Array([
        p+Vector2(-28,-108)*scale,p+Vector2(34,-102)*scale,p+Vector2(43,-28)*scale,
        p+Vector2(20,13)*scale,p+Vector2(-24,5)*scale
    ]),c)
    draw_line(p+Vector2(-20,-82)*scale,p+Vector2(-66,-30)*scale,c,14*scale,true)
    draw_line(p+Vector2(28,-78)*scale,p+Vector2(77,-48)*scale,c,13*scale,true)
    draw_line(p+Vector2(-12,4)*scale,p+Vector2(-26,80)*scale,c,15*scale,true)
    draw_line(p+Vector2(17,3)*scale,p+Vector2(34,78)*scale,c,15*scale,true)
    draw_circle(p+Vector2(-8,-136)*scale,3.2*scale,Color(0.74,0.18,0.12,alpha))
    draw_circle(p+Vector2(8,-136)*scale,3.2*scale,Color(0.74,0.18,0.12,alpha))
