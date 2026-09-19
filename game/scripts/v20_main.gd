extends Control

const WorldCanvas = preload("res://scripts/v20_world_canvas.gd")

const C_BG := Color("#0a0c0b")
const C_PANEL := Color(0.035,0.04,0.037,0.92)
const C_PANEL_SOFT := Color(0.035,0.04,0.037,0.74)
const C_BONE := Color("#e4dfd2")
const C_MUTED := Color("#aaa394")
const C_AMBER := Color("#d29755")
const C_RED := Color("#ae241f")
const C_GREEN := Color("#617b61")
const SAVE_PATH := "user://afterfall_v20.json"

var world
var ui_layer
var hud
var menu_layer
var action_layer
var message_panel
var message_label
var objective_label
var tip_label

var day := 1
var hour := 7
var minute := 10
var weather := "CHUVA"
var health := 100
var food := 2
var water := 1
var ammo := 0
var materials := 0
var med := 0
var energy := 78
var bag_used := 0
var bag_max := 20
var research := 0

var radio_heard := false
var market_unlocked := false
var filter_manual := false
var filter_built := false
var enemy_alive := true
var enemy_hp := 45
var market_cleared := false
var player_guard := false
var market_loot := {
    "shelves": false,
    "checkout": false,
    "pharmacy": false,
    "depot": false
}
var objective := "Descubra se o rádio ainda capta alguma coisa."
var current_screen := "menu"
var last_message := ""
var first_run := true

func _ready() -> void:
    set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    _build_root()
    _show_menu()
    call_deferred("_handle_cli")

func _build_root() -> void:
    world = WorldCanvas.new()
    world.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(world)

    ui_layer = Control.new()
    ui_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(ui_layer)

    hud = Control.new()
    hud.set_anchors_and_offsets_preset(Control.PRESET_TOP_WIDE)
    hud.offset_bottom = 104
    ui_layer.add_child(hud)

    menu_layer = Control.new()
    menu_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    ui_layer.add_child(menu_layer)

    action_layer = Control.new()
    action_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    ui_layer.add_child(action_layer)

    message_panel = Panel.new()
    message_panel.position = Vector2(490, 735)
    message_panel.size = Vector2(670, 112)
    message_panel.add_theme_stylebox_override("panel", _panel_style(Color(0.02,0.022,0.02,0.93), Color(0.42,0.34,0.24,0.70), 2))
    ui_layer.add_child(message_panel)

    message_label = Label.new()
    message_label.position = Vector2(24, 18)
    message_label.size = Vector2(622, 74)
    message_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    message_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
    message_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    message_label.add_theme_font_size_override("font_size", 17)
    message_label.add_theme_color_override("font_color", C_BONE)
    message_panel.add_child(message_label)

    objective_label = Label.new()
    objective_label.position = Vector2(1128, 112)
    objective_label.size = Vector2(472, 62)
    objective_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
    objective_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    objective_label.add_theme_font_size_override("font_size", 13)
    objective_label.add_theme_color_override("font_color", Color("#bdb29f"))
    ui_layer.add_child(objective_label)

    tip_label = Label.new()
    tip_label.position = Vector2(40, 865)
    tip_label.size = Vector2(1568, 35)
    tip_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    tip_label.add_theme_font_size_override("font_size", 12)
    tip_label.add_theme_color_override("font_color", Color("#8b8579"))
    ui_layer.add_child(tip_label)

func _panel_style(bg: Color, border: Color, width: int = 1) -> StyleBoxFlat:
    var s := StyleBoxFlat.new()
    s.bg_color = bg
    s.border_color = border
    s.set_border_width_all(width)
    s.corner_radius_top_left = 3
    s.corner_radius_top_right = 3
    s.corner_radius_bottom_left = 3
    s.corner_radius_bottom_right = 3
    return s

func _button_style(bg: Color, border: Color) -> StyleBoxFlat:
    var s := _panel_style(bg, border, 2)
    s.content_margin_left = 20
    s.content_margin_right = 20
    s.content_margin_top = 12
    s.content_margin_bottom = 12
    return s

func _clear(node: Node) -> void:
    for child in node.get_children():
        child.queue_free()

func _make_button(text_value: String, rect: Rect2, callback: Callable, accent: bool = false, compact: bool = false) -> Button:
    var b := Button.new()
    b.position = rect.position
    b.size = rect.size
    b.text = text_value
    b.focus_mode = Control.FOCUS_NONE
    b.add_theme_font_size_override("font_size", 18 if compact else 21)
    b.add_theme_color_override("font_color", C_BONE)
    b.add_theme_color_override("font_hover_color", Color.WHITE)
    var base := Color(0.055,0.06,0.055,0.90)
    var edge := Color("#5e594e")
    if accent:
        base = Color("#7d1c18")
        edge = Color("#d24b3e")
    b.add_theme_stylebox_override("normal", _button_style(base, edge))
    b.add_theme_stylebox_override("hover", _button_style(base.lightened(0.11), edge.lightened(0.16)))
    b.add_theme_stylebox_override("pressed", _button_style(base.darkened(0.12), edge))
    b.pressed.connect(callback)
    action_layer.add_child(b)
    return b

func _make_hotspot(text_value: String, rect: Rect2, callback: Callable, accent: bool = false) -> Button:
    var b := _make_button(text_value, rect, callback, accent, true)
    b.add_theme_stylebox_override("normal", _button_style(Color(0.02,0.025,0.022,0.72), Color(0.84,0.80,0.70,0.58)))
    b.add_theme_stylebox_override("hover", _button_style(Color(0.09,0.075,0.052,0.90), C_AMBER))
    return b

func _make_label(parent: Control, text_value: String, rect: Rect2, font_size: int, color: Color = C_BONE) -> Label:
    var l := Label.new()
    l.position = rect.position
    l.size = rect.size
    l.text = text_value
    l.add_theme_font_size_override("font_size", font_size)
    l.add_theme_color_override("font_color", color)
    l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    parent.add_child(l)
    return l

func _build_hud() -> void:
    _clear(hud)
    var bg := ColorRect.new()
    bg.position = Vector2(0,0)
    bg.size = Vector2(1648,104)
    bg.color = Color(0.018,0.021,0.019,0.94)
    hud.add_child(bg)

    _make_label(hud, "AFTERFALL", Rect2(38,18,275,52), 37)
    _make_label(hud, "AINDA HÁ AMANHÃ", Rect2(43,64,275,24), 13, Color("#b9b09f"))

    var slash := ColorRect.new()
    slash.position = Vector2(39,43)
    slash.size = Vector2(95,8)
    slash.rotation = -0.22
    slash.color = C_RED
    hud.add_child(slash)

    _stat_block(342, "DIA %d" % day, _time_text())
    _stat_block(492, weather, "TEMPO")
    _stat_block(638, "COMIDA", str(food))
    _stat_block(776, "SAÚDE", str(health))
    _stat_block(914, "ÁGUA", str(water))
    _stat_block(1050, "MUNIÇÃO", str(ammo))
    _stat_block(1193, "MATERIAIS", str(materials))
    _stat_block(1350, "ENERGIA", "%d%%" % energy)

    var map_b := Button.new()
    map_b.position = Vector2(1494,18)
    map_b.size = Vector2(58,58)
    map_b.text = "MAP"
    map_b.focus_mode = Control.FOCUS_NONE
    map_b.add_theme_font_size_override("font_size", 11)
    map_b.add_theme_stylebox_override("normal", _button_style(Color(0.04,0.045,0.04,0.75), Color("#5f5b50")))
    map_b.pressed.connect(_show_map)
    hud.add_child(map_b)

    var inv_b := Button.new()
    inv_b.position = Vector2(1562,18)
    inv_b.size = Vector2(58,58)
    inv_b.text = "BAG"
    inv_b.focus_mode = Control.FOCUS_NONE
    inv_b.add_theme_font_size_override("font_size", 11)
    inv_b.add_theme_stylebox_override("normal", _button_style(Color(0.04,0.045,0.04,0.75), Color("#5f5b50")))
    inv_b.pressed.connect(_show_inventory)
    hud.add_child(inv_b)

func _stat_block(x: float, title: String, value: String) -> void:
    var l1 := _make_label(hud, title, Rect2(x,20,135,26), 14, Color("#d7d2c5"))
    l1.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    var l2 := _make_label(hud, value, Rect2(x,50,135,30), 18, C_BONE)
    l2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    var sep := ColorRect.new()
    sep.position = Vector2(x-7,19)
    sep.size = Vector2(1,63)
    sep.color = Color(0.65,0.62,0.53,0.30)
    hud.add_child(sep)

func _show_menu() -> void:
    current_screen = "menu"
    world.set_scene("menu")
    hud.visible = false
    menu_layer.visible = true
    message_panel.visible = false
    objective_label.visible = false
    tip_label.visible = false
    _clear(menu_layer)
    _clear(action_layer)

    var panel := ColorRect.new()
    panel.position = Vector2(0,0)
    panel.size = Vector2(575,920)
    panel.color = Color(0.015,0.017,0.016,0.72)
    menu_layer.add_child(panel)

    _make_label(menu_layer, "AFTERFALL", Rect2(62,50,455,86), 58)
    _make_label(menu_layer, "AINDA HÁ AMANHÃ", Rect2(72,132,390,38), 21, Color("#bcb3a1"))

    var red_line := ColorRect.new()
    red_line.position = Vector2(64,178)
    red_line.size = Vector2(165,8)
    red_line.rotation = -0.08
    red_line.color = C_RED
    menu_layer.add_child(red_line)

    _make_button("NOVO JOGO  »", Rect2(66,260,420,78), _new_game, true)
    var cont := _make_button("CONTINUAR", Rect2(66,354,420,72), _continue_game)
    cont.disabled = not FileAccess.file_exists(SAVE_PATH)
    _make_button("CAPÍTULOS", Rect2(66,442,420,72), _show_chapters)
    _make_button("CONFIGURAÇÕES", Rect2(66,530,420,72), _show_settings)

    _make_label(menu_layer, "Um survival de abrigo, expedição e escolhas.", Rect2(70,650,410,64), 15, Color("#8f887a"))
    _make_label(menu_layer, "O cenário é o jogo. Toque no mundo, não em uma planilha.", Rect2(70,722,410,70), 13, Color("#706b62"))

func _new_game() -> void:
    day = 1
    hour = 7
    minute = 10
    weather = "CHUVA"
    health = 100
    food = 2
    water = 1
    ammo = 0
    materials = 0
    med = 0
    energy = 78
    bag_used = 0
    research = 0
    radio_heard = false
    market_unlocked = false
    filter_manual = false
    filter_built = false
    enemy_alive = true
    enemy_hp = 45
    market_cleared = false
    player_guard = false
    market_loot = {"shelves":false,"checkout":false,"pharmacy":false,"depot":false}
    objective = "Descubra se o rádio ainda capta alguma coisa."
    first_run = true
    _save()
    _show_shelter()
    _message("A chuva não parou desde a madrugada. O abrigo ainda tem comida para pouco tempo. Talvez o rádio capte alguém.")
    _tip("Toque nos próprios espaços do abrigo. Cama, oficina, rádio, estoque e porta são parte do cenário.")

func _continue_game() -> void:
    if _load():
        _show_shelter()
        _message("Você volta ao abrigo. Lá fora, a cidade continuou existindo sem você.")
    else:
        _new_game()

func _show_shelter() -> void:
    current_screen = "shelter"
    world.filter_built = filter_built
    world.radio_active = radio_heard
    world.set_scene("shelter")
    hud.visible = true
    menu_layer.visible = false
    message_panel.visible = false
    objective_label.visible = true
    tip_label.visible = true
    _clear(action_layer)
    _build_hud()
    objective_label.text = "OBJETIVO
" + objective
    _tip("Abrigo: o que você constrói aparece aqui. Melhorias não são apenas números.")

    _make_hotspot("DESCANSAR
recuperar energia", Rect2(150,286,222,72), _rest)
    _make_hotspot("OFICINA
fabricar • pesquisar", Rect2(655,286,260,72), _show_research, filter_manual and not filter_built)
    _make_hotspot("RÁDIO
notícias • sobreviventes", Rect2(1155,286,270,72), _use_radio, not radio_heard)
    _make_hotspot("ESTOQUE
itens • recursos", Rect2(150,588,228,72), _show_inventory)
    _make_hotspot("ENFERMARIA
tratar • curar", Rect2(610,588,230,72), _use_medbay)
    _make_hotspot("GERADOR
manter • melhorar", Rect2(1160,588,245,72), _generator)
    _make_button("SAIR  »", Rect2(1420,804,190,74), _show_map, true)

func _rest() -> void:
    if food <= 0 or water <= 0:
        _message("Você até consegue deitar, mas sem comida e água o corpo não recupera de verdade.")
        return
    food -= 1
    water -= 1
    energy = mini(100, energy + 38)
    health = mini(100, health + 8)
    _advance(180)
    _save()
    _show_shelter()
    _message("Três horas de sono leve. A chuva continua batendo no concreto.")

func _use_radio() -> void:
    radio_heard = true
    market_unlocked = true
    world.radio_active = true
    objective = "Vá ao Supermercado da Rua 8. A transmissão mencionou a entrada lateral."
    _save()
    _show_shelter()
    _message("«...se alguém estiver ouvindo... Rua 8... mercado... não venham pela avenida...» O sinal morre. Agora você tem um destino.")

func _generator() -> void:
    if materials >= 3:
        materials -= 3
        energy = mini(100, energy + 24)
        _advance(35)
        _save()
        _show_shelter()
        _message("Você limpa contatos, aperta o suporte e reaproveita cabos. O gerador fica menos instável.")
    else:
        _message("O gerador ainda funciona, mas precisa de pelo menos 3 materiais para uma manutenção decente.")

func _use_medbay() -> void:
    if health >= 100:
        _message("Você não precisa de tratamento agora.")
        return
    if med <= 0:
        _message("A maca está pronta. O problema é que não há remédio suficiente.")
        return
    med -= 1
    health = mini(100, health + 34)
    _advance(20)
    _save()
    _show_shelter()
    _message("Curativo limpo, ferida fechada o suficiente para continuar.")

func _show_map() -> void:
    current_screen = "map"
    world.set_scene("map")
    hud.visible = true
    menu_layer.visible = false
    message_panel.visible = false
    objective_label.visible = true
    tip_label.visible = true
    _clear(action_layer)
    _build_hud()
    objective_label.text = "MAPA DE CAMPO
" + objective
    _tip("As rotas não são fases. Elas mudam tempo, risco e o que você pode encontrar.")

    var home := _make_hotspot("ABRIGO
seguro", Rect2(120,650,170,66), _show_shelter)
    home.add_theme_color_override("font_color", Color("#b9d1b3"))

    var market_text := "SUPERMERCADO
Rua 8 • 0,8 km"
    var market := _make_hotspot(market_text, Rect2(455,525,230,72), _travel_market, market_unlocked)
    market.disabled = not market_unlocked
    if not market_unlocked:
        market.text = "SUPERMERCADO
sinal desconhecido"

    var posto := _make_hotspot("POSTO
1,7 km • pista mecânica", Rect2(1015,500,235,72), _locked_post)
    posto.disabled = not filter_built
    if not filter_built:
        posto.text = "POSTO
rota ainda não confirmada"

    var hospital := _make_hotspot("HOSPITAL
2,3 km • alto risco", Rect2(775,330,240,72), _locked_hospital)
    hospital.disabled = true

    var quarantine := _make_hotspot("QUARENTENA
???", Rect2(1280,230,210,72), _locked_hospital)
    quarantine.disabled = true

func _locked_post() -> void:
    _message("O posto existe, mas você ainda não tem motivo suficiente para gastar recursos nessa rota.")

func _locked_hospital() -> void:
    _message("Você só tem rumores. Marcar um prédio no mapa não significa conhecê-lo.")

func _travel_market() -> void:
    if water <= 0:
        _message("Sair sem água agora é uma aposta ruim. Procure uma alternativa no abrigo.")
        return
    water -= 1
    energy = maxi(0, energy - 8)
    _advance(28)
    _save()
    _loading_transition("SUPERMERCADO DA RUA 8", "Chuva esconde passos. Também esconde o que está vindo.", _show_market)

func _loading_transition(title: String, tip: String, next: Callable) -> void:
    _clear(action_layer)
    message_panel.visible = false
    var veil := ColorRect.new()
    veil.position = Vector2(0,0)
    veil.size = Vector2(1648,920)
    veil.color = Color(0.01,0.012,0.011,0.96)
    action_layer.add_child(veil)
    var t := _make_label(action_layer, title, Rect2(260,330,1128,80), 34)
    t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    var s := _make_label(action_layer, tip, Rect2(310,430,1028,80), 17, Color("#aaa294"))
    s.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    await get_tree().create_timer(0.65).timeout
    next.call()

func _show_market() -> void:
    current_screen = "market"
    world.market_cleared = market_cleared
    world.set_scene("market")
    hud.visible = true
    menu_layer.visible = false
    message_panel.visible = false
    objective_label.visible = true
    tip_label.visible = true
    _clear(action_layer)
    _build_hud()
    objective_label.text = "SUPERMERCADO DA RUA 8
Encontre comida e descubra de onde veio a transmissão."
    _tip("Toque em coisas que fazem sentido no lugar. Loot vem de prateleira, caixa, farmácia, estoque — não de baús aleatórios.")

    if not bool(market_loot["shelves"]):
        _make_hotspot("PRATELEIRAS
vasculhar", Rect2(66,354,210,68), _loot_shelves)
    if not bool(market_loot["checkout"]):
        _make_hotspot("CAIXA
ver itens", Rect2(545,438,180,66), _loot_checkout)
    if not bool(market_loot["pharmacy"]):
        _make_hotspot("FARMÁCIA
procurar", Rect2(936,362,190,66), _loot_pharmacy)
    if not bool(market_loot["depot"]):
        _make_hotspot("DEPÓSITO
investigar", Rect2(1215,292,200,66), _open_depot, enemy_alive)
    else:
        _make_hotspot("DEPÓSITO
vasculhado", Rect2(1215,292,200,66), _empty_depot)
    _make_hotspot("SAÍDA DOS FUNDOS
voltar ao abrigo", Rect2(1430,330,190,70), _return_home)

    if first_run:
        first_run = false
        _message("O mercado está aberto demais para ser seguro. Há passos atrás da porta do depósito.")
    elif market_cleared:
        _message("O silêncio mudou. Agora o perigo imediato acabou, mas o prédio ainda conta uma história.")

func _loot_shelves() -> void:
    market_loot["shelves"] = true
    food += 2
    bag_used += 2
    _advance(12)
    _save()
    _show_market()
    _message("Você encontra duas latas amassadas atrás de produtos derrubados. Não é muito, mas é comida.")

func _loot_checkout() -> void:
    market_loot["checkout"] = true
    materials += 2
    bag_used += 2
    _advance(8)
    _save()
    _show_market()
    _message("Fios, uma pequena chave e peças do terminal quebrado. Materiais úteis, não tesouro mágico.")

func _loot_pharmacy() -> void:
    market_loot["pharmacy"] = true
    med += 1
    bag_used += 1
    _advance(11)
    _save()
    _show_market()
    _message("A maior parte foi saqueada, mas um pacote lacrado caiu atrás do balcão. +1 remédio.")

func _open_depot() -> void:
    if enemy_alive:
        _show_combat()
    else:
        _loot_depot()

func _show_combat() -> void:
    current_screen = "combat"
    world.enemy_hp = enemy_hp
    world.player_hp = health
    world.market_cleared = false
    world.set_scene("combat")
    hud.visible = true
    menu_layer.visible = false
    message_panel.visible = true
    objective_label.visible = true
    tip_label.visible = false
    _clear(action_layer)
    _build_hud()
    objective_label.text = "AMEAÇA
Infectado no corredor do depósito."
    message_label.text = "Um infectado cambaleia para fora do depósito. Atrás dele há movimento, mas só um está perto o bastante para atacar."

    _make_button("ATACAR", Rect2(285,785,250,82), _combat_attack, true)
    _make_button("ESQUIVAR", Rect2(555,785,250,82), _combat_dodge)
    _make_button("RECUAR", Rect2(825,785,250,82), _combat_retreat)
    _make_button("ITEM", Rect2(1095,785,250,82), _combat_item)

func _combat_attack() -> void:
    var damage := 19 + randi_range(0,8)
    enemy_hp -= damage
    energy = maxi(0, energy - 4)
    _advance(2)
    if enemy_hp <= 0:
        enemy_hp = 0
        enemy_alive = false
        market_cleared = true
        materials += 1
        research += 1
        _save()
        _combat_victory()
        return
    var incoming := randi_range(7,12)
    if player_guard:
        incoming = incoming / 3
        player_guard = false
    health = maxi(1, health - incoming)
    world.enemy_hp = enemy_hp
    world.player_hp = health
    _save()
    _show_combat()
    message_label.text = "Você acerta por %d. O infectado ainda vem. Você perde %d de saúde." % [damage, incoming]

func _combat_dodge() -> void:
    energy = maxi(0, energy - 6)
    _advance(1)
    if randi_range(1,100) <= 72:
        player_guard = true
        _save()
        _show_combat()
        message_label.text = "Você abre espaço e muda o ângulo. O próximo golpe, se vier, terá bem menos força."
    else:
        health = maxi(1, health - 7)
        _save()
        _show_combat()
        message_label.text = "Seu pé escorrega no piso molhado. Você evita a mordida, mas bate forte no balcão."

func _combat_retreat() -> void:
    energy = maxi(0, energy - 3)
    _advance(3)
    _save()
    _show_market()
    _message("Você fecha distância ao contrário e abandona o depósito. O infectado continua lá.")

func _combat_item() -> void:
    if med <= 0:
        message_label.text = "Você procura na mochila e percebe que não trouxe nada que resolva isso agora."
        return
    med -= 1
    health = mini(100, health + 28)
    _advance(1)
    _save()
    _show_combat()
    message_label.text = "Curativo rápido. Não é tratamento de verdade, mas mantém você de pé."

func _combat_victory() -> void:
    current_screen = "combat"
    world.market_cleared = true
    world.set_scene("market")
    _clear(action_layer)
    message_panel.visible = true
    message_label.text = "O infectado cai. O barulho do depósito para. Agora você pode descobrir o que alguém tentou esconder ali."
    _make_button("VASCULHAR O DEPÓSITO", Rect2(575,785,500,80), _loot_depot, true)

func _loot_depot() -> void:
    if bool(market_loot["depot"]):
        _empty_depot()
        return
    market_loot["depot"] = true
    filter_manual = true
    materials += 3
    food += 1
    bag_used = mini(bag_max, bag_used + 4)
    research += 2
    objective = "Volte ao abrigo e leve o manual para a oficina. Há um projeto de filtragem utilizável."
    _advance(22)
    _save()
    _show_market()
    _message("Dentro de uma gaveta de manutenção: terminais, mangueira, carvão técnico e um manual de filtragem. Isso pode virar algo no abrigo.")

func _empty_depot() -> void:
    _message("Você já separou tudo que tinha utilidade. O resto é peso morto.")

func _return_home() -> void:
    energy = maxi(0, energy - 6)
    _advance(30)
    _save()
    _loading_transition("RETORNO AO ABRIGO", "Voltar vivo também é progresso.", _show_shelter)
    await get_tree().create_timer(0.75).timeout
    _message("A porta fecha atrás de você. Tudo que trouxe agora pode virar comida, remédio, ferramenta ou conhecimento.")

func _show_research() -> void:
    current_screen = "research"
    world.filter_built = filter_built
    world.set_scene("research")
    hud.visible = true
    menu_layer.visible = false
    message_panel.visible = false
    objective_label.visible = true
    tip_label.visible = true
    _clear(action_layer)
    _build_hud()
    objective_label.text = "OFICINA / PESQUISA
Conhecimento: %d • Materiais: %d" % [research,materials]
    _tip("Tecnologia é encontrada no mundo. Você traz o conhecimento para casa e transforma em projeto.")

    _make_label(action_layer, "BANCADA DE PESQUISA", Rect2(330,205,500,45), 27)
    _make_label(action_layer, "Objetos, manuais e máquinas intactas revelam possibilidades.
A oficina não inventa tecnologia do nada.", Rect2(330,252,620,70), 15, Color("#b5ad9d"))

    var filter_text := "FILTRO DE ÁGUA II
"
    if filter_built:
        filter_text += "CONCLUÍDO • instalado no abrigo"
    elif filter_manual:
        filter_text += "4 materiais • 2 conhecimento • 60 min"
    else:
        filter_text += "PROJETO DESCONHECIDO • encontre documentação"
    var filter_button := _make_button(filter_text, Rect2(350,535,470,96), _build_filter, filter_manual and not filter_built)
    filter_button.disabled = not filter_manual or filter_built

    var gen := _make_button("GERADOR SILENCIOSO
projeto incompleto", Rect2(840,535,420,96), _locked_project)
    gen.disabled = true
    _make_button("VOLTAR AO ABRIGO", Rect2(610,680,430,70), _show_shelter)

func _build_filter() -> void:
    if filter_built:
        _message("O filtro já está instalado.")
        return
    if materials < 4 or research < 2:
        _message("Faltam materiais ou conhecimento. O manual explica o processo, mas ainda não cria peças.")
        return
    materials -= 4
    research -= 2
    filter_built = true
    water += 3
    objective = "O abrigo agora produz água melhor. O rádio menciona um posto e uma caminhonete abandonada."
    _advance(60)
    _save()
    _show_shelter()
    _message("O filtro entra em funcionamento. Pela primeira vez, uma expedição mudou fisicamente o abrigo.")

func _locked_project() -> void:
    _message("Você ainda não encontrou informação suficiente para montar isso sem desperdiçar peças.")

func _show_inventory() -> void:
    current_screen = "inventory"
    world.filter_built = filter_built
    world.set_scene("inventory")
    hud.visible = true
    menu_layer.visible = false
    message_panel.visible = false
    objective_label.visible = true
    tip_label.visible = true
    _clear(action_layer)
    _build_hud()
    objective_label.text = "MOCHILA
%d/%d espaços utilizados" % [bag_used,bag_max]
    _tip("O inventário existe quando faz sentido. No resto do tempo, o mundo fica visível.")

    _make_label(action_layer, "MOCHILA", Rect2(205,250,390,50), 28)
    _make_label(action_layer, "Comida       %d
Água          %d
Remédio      %d
Munição      %d
Materiais    %d
Conhecimento %d" % [food,water,med,ammo,materials,research], Rect2(805,245,430,250), 22)
    var notes := "SEM DOCUMENTOS TÉCNICOS"
    if filter_manual:
        notes = "MANUAL: FILTRAGEM IMPROVISADA"
    if filter_built:
        notes += "
Filtro de Água II instalado."
    _make_label(action_layer, notes, Rect2(805,525,470,90), 16, C_AMBER)
    _make_button("VOLTAR", Rect2(800,670,320,70), _return_from_inventory)

func _return_from_inventory() -> void:
    if market_unlocked and current_screen == "inventory":
        _show_shelter()
    else:
        _show_shelter()

func _show_chapters() -> void:
    _message_menu("CAPÍTULO 1 — A RUA 8

O primeiro capítulo acompanha o abrigo, o sinal de rádio e as primeiras pistas sobre quem ainda circula pela cidade.")

func _show_settings() -> void:
    _message_menu("CONFIGURAÇÕES

Esta build prioriza visual e gameplay. Áudio e acessibilidade entram no próximo passe sem mudar a direção visual.")

func _message_menu(text_value: String) -> void:
    _clear(action_layer)
    var panel := Panel.new()
    panel.position = Vector2(560,250)
    panel.size = Vector2(760,360)
    panel.add_theme_stylebox_override("panel", _panel_style(Color(0.025,0.028,0.025,0.96), Color("#766247"), 2))
    action_layer.add_child(panel)
    var l := _make_label(action_layer, text_value, Rect2(600,290,680,220), 20)
    l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    _make_button("FECHAR", Rect2(770,525,340,62), _show_menu)

func _advance(minutes_add: int) -> void:
    minute += minutes_add
    while minute >= 60:
        minute -= 60
        hour += 1
    while hour >= 24:
        hour -= 24
        day += 1

func _time_text() -> String:
    return "%02d:%02d" % [hour,minute]

func _message(text_value: String) -> void:
    last_message = text_value
    message_panel.visible = true
    message_label.text = text_value

func _tip(text_value: String) -> void:
    tip_label.text = text_value

func _save() -> void:
    var data := {
        "day":day,"hour":hour,"minute":minute,"weather":weather,
        "health":health,"food":food,"water":water,"ammo":ammo,"materials":materials,
        "med":med,"energy":energy,"bag_used":bag_used,"bag_max":bag_max,"research":research,
        "radio_heard":radio_heard,"market_unlocked":market_unlocked,
        "filter_manual":filter_manual,"filter_built":filter_built,
        "enemy_alive":enemy_alive,"enemy_hp":enemy_hp,"market_cleared":market_cleared,
        "market_loot":market_loot,"objective":objective,"first_run":first_run
    }
    var f := FileAccess.open(SAVE_PATH,FileAccess.WRITE)
    if f:
        f.store_string(JSON.stringify(data))

func _load() -> bool:
    if not FileAccess.file_exists(SAVE_PATH):
        return false
    var f := FileAccess.open(SAVE_PATH,FileAccess.READ)
    if not f:
        return false
    var d = JSON.parse_string(f.get_as_text())
    if typeof(d) != TYPE_DICTIONARY:
        return false
    day = int(d.get("day",1))
    hour = int(d.get("hour",7))
    minute = int(d.get("minute",10))
    weather = str(d.get("weather","CHUVA"))
    health = int(d.get("health",100))
    food = int(d.get("food",2))
    water = int(d.get("water",1))
    ammo = int(d.get("ammo",0))
    materials = int(d.get("materials",0))
    med = int(d.get("med",0))
    energy = int(d.get("energy",78))
    bag_used = int(d.get("bag_used",0))
    bag_max = int(d.get("bag_max",20))
    research = int(d.get("research",0))
    radio_heard = bool(d.get("radio_heard",false))
    market_unlocked = bool(d.get("market_unlocked",false))
    filter_manual = bool(d.get("filter_manual",false))
    filter_built = bool(d.get("filter_built",false))
    enemy_alive = bool(d.get("enemy_alive",true))
    enemy_hp = int(d.get("enemy_hp",45))
    market_cleared = bool(d.get("market_cleared",false))
    market_loot = d.get("market_loot",{"shelves":false,"checkout":false,"pharmacy":false,"depot":false})
    objective = str(d.get("objective","Descubra se o rádio ainda capta alguma coisa."))
    first_run = bool(d.get("first_run",false))
    world.filter_built = filter_built
    world.radio_active = radio_heard
    world.enemy_hp = enemy_hp
    world.player_hp = health
    world.market_cleared = market_cleared
    return true

func _handle_cli() -> void:
    var args := OS.get_cmdline_user_args()
    if "--qa_v20" in args:
        _run_qa()
        return
    var capture := ""
    if "--capture_v20_menu" in args:
        capture = "menu"
        _show_menu()
    elif "--capture_v20_shelter" in args:
        capture = "shelter"
        _new_game()
        _show_shelter()
    elif "--capture_v20_map" in args:
        capture = "map"
        _new_game()
        radio_heard = true
        market_unlocked = true
        _show_map()
    elif "--capture_v20_market" in args:
        capture = "market"
        _new_game()
        radio_heard = true
        market_unlocked = true
        _show_market()
    elif "--capture_v20_combat" in args:
        capture = "combat"
        _new_game()
        radio_heard = true
        market_unlocked = true
        _show_combat()
    elif "--capture_v20_research" in args:
        capture = "research"
        _new_game()
        filter_manual = true
        materials = 6
        research = 3
        _show_research()
    if capture != "":
        await get_tree().process_frame
        await get_tree().process_frame
        await get_tree().create_timer(0.25).timeout
        var img := get_viewport().get_texture().get_image()
        var path := "res://capture_v20_%s.png" % capture
        img.save_png(path)
        print("V20_CAPTURE ", path)
        get_tree().quit()

func _run_qa() -> void:
    var failures: Array[String] = []
    _new_game()
    if market_unlocked:
        failures.append("market_should_start_locked")
    _use_radio()
    if not market_unlocked:
        failures.append("radio_unlock")
    materials = 0
    research = 0
    _loot_checkout()
    if materials < 2:
        failures.append("checkout_loot")
    _loot_shelves()
    if food < 3:
        failures.append("shelf_food")
    enemy_hp = 1
    enemy_alive = true
    health = 100
    _combat_attack()
    if enemy_alive:
        failures.append("combat_kill")
    _loot_depot()
    if not filter_manual:
        failures.append("manual_unlock")
    materials = 10
    research = 5
    _build_filter()
    if not filter_built:
        failures.append("filter_build")
    _save()
    filter_built = false
    if not _load() or not filter_built:
        failures.append("save_load")
    print("V20_QA failures=", failures)
    get_tree().quit(0 if failures.is_empty() else 2)
