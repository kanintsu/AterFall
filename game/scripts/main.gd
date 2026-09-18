extends Control

const SHELTER_TEX := preload("res://assets/v18/shelter_world_80.jpg")
const MENU_TEX := preload("res://assets/menu_clean.jpg")
const PAPER_TEX := preload("res://assets/paper.jpg")
const GRUNGE_TEX := preload("res://assets/grunge.jpg")
const RAIN_TEX := preload("res://assets/rain.png")
const RAIN_AUDIO := preload("res://assets/audio/rain_loop.wav")
const RADIO_AUDIO := preload("res://assets/audio/radio_static.wav")
const WIND_AUDIO := preload("res://assets/audio/wind_loop.wav")
const V18_URBAN_AUDIO := preload("res://assets/v18/audio/urban_night.wav")
const V18_INDUSTRIAL_AUDIO := preload("res://assets/v18/audio/industrial_hum.wav")
const V18_INTERIOR_AUDIO := preload("res://assets/v18/audio/interior_hum.wav")
const V19_CITY_MAP_TEX := preload("res://assets/v19/city_map.svg")

const V18_LOCATION_TEX := {
	"SUPERMERCADO": preload("res://assets/v18/supermarket.jpg"),
	"FARMÁCIA": preload("res://assets/v18/street_pharmacy.jpg"),
	"HOSPITAL": preload("res://assets/v18/medical_dark.jpg"),
	"APARTAMENTOS": preload("res://assets/v18/residential_rain.jpg"),
	"IGREJA": preload("res://assets/v18/community.jpg"),
	"DELEGACIA": preload("res://assets/v18/quarantine_dark.jpg"),
	"QUARENTENA": preload("res://assets/v18/quarantine_dark.jpg"),
	"LABORATÓRIO": preload("res://assets/v18/medical_dark.jpg"),
	"OFICINA": preload("res://assets/v18/industrial_dark.jpg"),
	"POSTO": preload("res://assets/v18/industrial_dark.jpg"),
	"ARMAZÉM": preload("res://assets/v18/industrial_dark.jpg"),
	"FÁBRICA": preload("res://assets/v18/industrial_dark.jpg"),
	"FERRO-VELHO": preload("res://assets/v18/industrial_dark.jpg"),
	"SUBESTAÇÃO": preload("res://assets/v18/industrial_dark.jpg"),
	"TÚNEIS": preload("res://assets/v18/interior_dark.jpg"),
	"ESTAÇÃO": preload("res://assets/v18/interior_dark.jpg"),
	"CENTRO": preload("res://assets/v18/street_pharmacy.jpg"),
	"SHOPPING": preload("res://assets/v18/supermarket.jpg"),
	"BIBLIOTECA": preload("res://assets/v18/interior_dark.jpg"),
	"ESCOLA": preload("res://assets/v18/interior_dark.jpg"),
	"FAZENDA": preload("res://assets/v18/community.jpg"),
	"FLORESTA": preload("res://assets/v18/residential_rain.jpg"),
	"LAGO": preload("res://assets/v18/residential_rain.jpg"),
	"SILO": preload("res://assets/v18/industrial_dark.jpg")
}

const V18_LOCATION_FLAVOR := {
	"SUPERMERCADO":"Carrinhos abandonados travam os corredores. O cheiro muda conforme você se aproxima dos fundos.",
	"FARMÁCIA":"Vidros quebrados, caixas vazias e etiquetas arrancadas. Os remédios mais valiosos nunca ficaram nas prateleiras da frente.",
	"OFICINA":"Óleo seco cobre o chão. Ferramentas desapareceram, mas máquinas pesadas demais para roubar continuam aqui.",
	"ESCOLA":"Desenhos infantis ainda cobrem as paredes. O silêncio do segundo andar parece diferente do resto do prédio.",
	"APARTAMENTOS":"Cada porta fechada é uma vida interrompida — ou alguém que decidiu não abrir.",
	"IGREJA":"Velas antigas, colchões improvisados e nomes escritos nas paredes transformaram o templo em memória coletiva.",
	"DELEGACIA":"Grades, arquivos e armários de aço sobreviveram melhor que as pessoas que trabalhavam aqui.",
	"CENTRO":"Vitrines quebradas e carros imóveis formam corredores urbanos onde qualquer esquina pode esconder movimento.",
	"HOSPITAL":"O ar cheira a desinfetante velho e umidade. Quanto mais fundo você entra, mais a evacuação parece ter sido planejada às pressas.",
	"ESTAÇÃO":"Trilhos escuros dividem a cidade. Ecos viajam longe demais pelos túneis para você saber de onde vieram.",
	"BIBLIOTECA":"Papel úmido e poeira escondem uma das poucas coisas que ainda pode crescer sem comida: conhecimento.",
	"SHOPPING":"O enorme espaço aberto amplifica cada passo. Lojas viraram pequenos abrigos dentro de um prédio impossível de defender.",
	"POSTO":"Combustível evaporado, bombas quebradas e uma oficina lateral ainda guardam vestígios de quem tentou fugir de carro.",
	"ARMAZÉM":"Galpões longos demais para enxergar de ponta a ponta. Caixas lacradas podem esconder suprimentos ou barulho.",
	"TÚNEIS":"A cidade continua embaixo da cidade. Aqui a luz é recurso e o som chega antes da ameaça.",
	"FÁBRICA":"Linhas de produção paradas parecem esqueletos de máquinas. A rede elétrica ainda reage em alguns setores.",
	"FERRO-VELHO":"Montanhas de metal criam becos estreitos. O que parece lixo pode ser a peça que mantém um veículo vivo.",
	"SUBESTAÇÃO":"Transformadores e cabos continuam perigosos mesmo sem uma rede estável. Um erro aqui pode apagar um bairro inteiro.",
	"FAZENDA":"Longe do concreto há espaço para produzir comida — mas também distância demais para pedir ajuda rapidamente.",
	"FLORESTA":"A vegetação engoliu trilhas antigas. Animais voltaram, e nem todos aprenderam a temer pessoas.",
	"LAGO":"A água parece calma demais. O lugar oferece peixe e água bruta, mas exposição em campo aberto cobra seu preço.",
	"SILO":"A torre domina o horizonte rural. Quem controla o alto enxerga estradas, fumaça e sinais de rádio muito antes dos outros.",
	"QUARENTENA":"Barreiras militares dividem o espaço em setores. Tudo aqui foi feito para controlar fluxo humano — e impedir retorno.",
	"LABORATÓRIO":"Portas seladas, vidro grosso e sistemas que ainda recebem energia. Este lugar foi construído para continuar funcionando quando o resto parasse."
}

const SHELTER_THUMB := preload("res://assets/shelter_thumb.jpg")
const PAPER_PANEL_TEX := preload("res://assets/paper_panel.jpg")
const DARK_PANEL_TEX := preload("res://assets/dark_panel.jpg")

# V8 — telas próprias e deslocamento urbano jogável.
const V8_STREET_TEX := {
	"BAIRRO DO ABRIGO": preload("res://assets/v8/street_residential.jpg"),
	"CENTRO": preload("res://assets/v8/street_center.jpg"),
	"ZONA INDUSTRIAL": preload("res://assets/v8/street_industrial.jpg"),
	"PERIFERIA": preload("res://assets/v8/street_residential.jpg"),
	"QUARENTENA": preload("res://assets/v8/street_quarantine.jpg")
}
const V8_ENTITY_TEX := {
	"errante": preload("res://assets/v8/infected_errante.png"),
	"mutant": preload("res://assets/v8/infected_mutant.png"),
	"horde": preload("res://assets/v8/infected_horde.png")
}
const V8_SCREEN_TEX := {
	"inventory": preload("res://assets/v8/screen_inventory.jpg"),
	"craft": preload("res://assets/v8/screen_crafting.jpg"),
	"radio": preload("res://assets/v8/screen_radio.jpg"),
	"world": preload("res://assets/v8/screen_radio.jpg"),
	"community": preload("res://assets/v8/screen_community.jpg"),
	"body": preload("res://assets/v8/screen_body.jpg"),
	"journal": preload("res://assets/v8/screen_journal.jpg"),
	"skills": preload("res://assets/v8/screen_skills.jpg"),
	"books": preload("res://assets/v8/screen_skills.jpg"),
	"production": preload("res://assets/v8/screen_production.jpg"),
	"research": preload("res://assets/v8/screen_body.jpg"),
	"missions": preload("res://assets/v8/screen_journal.jpg")
}
const V8_ROUTE_DATA := {
	"AVENIDA": {"segments":2,"risk":14,"fatigue":4,"minutes":18,"desc":"Mais rápida, aberta e barulhenta. Infectados enxergam você com facilidade."},
	"BECOS": {"segments":3,"risk":4,"fatigue":6,"minutes":26,"desc":"Mais lenta, boa para furtividade, mas humanos podem preparar emboscadas."},
	"ROTA SILENCIOSA": {"segments":4,"risk":-5,"fatigue":9,"minutes":34,"desc":"Desvio longo por quintais, trilhos e fundos de prédios. Menos encontros, mais desgaste."}
}

const LOCATION_TEX := {
	"SUPERMERCADO": preload("res://assets/locations/supermarket.jpg"),
	"FARMÁCIA": preload("res://assets/locations/pharmacy.jpg"),
	"OFICINA": preload("res://assets/locations/workshop.jpg"),
	"DELEGACIA": preload("res://assets/locations/police.jpg"),
	"ESCOLA": preload("res://assets/locations/school.jpg"),
	"CENTRO": preload("res://assets/locations/center.jpg"),
	"HOSPITAL": preload("res://assets/locations/pharmacy.jpg"),
	"POSTO": preload("res://assets/locations/supermarket.jpg"),
	"ARMAZÉM": preload("res://assets/locations/workshop.jpg"),
	"ESTAÇÃO": preload("res://assets/locations/center.jpg"),
	"TÚNEIS": preload("res://assets/locations/center.jpg"),
	"QUARENTENA": preload("res://assets/locations/police.jpg")
}

const UI_ICONS := {
	"life": preload("res://assets/icons/stat_life.png"),
	"hunger": preload("res://assets/icons/stat_hunger.png"),
	"thirst": preload("res://assets/icons/stat_thirst.png"),
	"fatigue": preload("res://assets/icons/stat_fatigue.png"),
	"infection": preload("res://assets/icons/stat_infection.png"),
	"morale": preload("res://assets/icons/stat_morale.png"),
	"shelter": preload("res://assets/icons/nav_home.png"),
	"map": preload("res://assets/icons/nav_map.png"),
	"explore": preload("res://assets/icons/nav_explore.png"),
	"missions": preload("res://assets/icons/nav_missions.png"),
	"survivors": preload("res://assets/icons/stat_morale.png"),
	"research": preload("res://assets/icons/stat_infection.png"),
	"community": preload("res://assets/icons/stat_morale.png"),
	"body": preload("res://assets/icons/stat_fatigue.png"),
	"skills": preload("res://assets/icons/nav_craft.png"),
	"world": preload("res://assets/icons/nav_missions.png"),
	"production": preload("res://assets/icons/action_upgrade.png"),
	"inventory": preload("res://assets/icons/backpack.png"),
	"craft": preload("res://assets/icons/nav_craft.png"),
	"upgrades": preload("res://assets/icons/action_upgrade.png"),
	"journal": preload("res://assets/icons/nav_journal.png"),
	"radio": preload("res://assets/icons/nav_missions.png"),
	"sleep": preload("res://assets/icons/action_sleep.png"),
	"next": preload("res://assets/icons/action_next.png")
}
const ICONS := {
	"backpack": preload("res://assets/icons/backpack.png"),
	"knife": preload("res://assets/icons/knife.png"),
	"pistol": preload("res://assets/icons/pistol.png"),
	"food": preload("res://assets/icons/food.png"),
	"water": preload("res://assets/icons/water.png"),
	"med": preload("res://assets/icons/med.png"),
	"scrap": preload("res://assets/icons/scrap.png"),
	"cloth": preload("res://assets/icons/cloth.png"),
	"ammo": preload("res://assets/icons/ammo.png")
}

const BG := Color("#090a09")
const PANEL := Color("#11110f")
const PANEL_2 := Color("#191713")
const PAPER := Color("#c9b99a")
const PAPER_DARK := Color("#b6a484")
const INK := Color("#17120e")
const BONE := Color("#ded1b7")
const MUTED := Color("#9c927f")
const RED := Color("#8f2b28")
const RED_BRIGHT := Color("#b7443c")
const GOLD := Color("#b28738")
const BLUE := Color("#4c8396")
const GREEN := Color("#56865f")

const CITY_LOCATIONS := {
	"SUPERMERCADO": {"district":"BAIRRO DO ABRIGO", "risk":16, "loot":"Comida / água / sementes", "searches":6},
	"FARMÁCIA": {"district":"BAIRRO DO ABRIGO", "risk":22, "loot":"Remédios / antibióticos", "searches":5},
	"OFICINA": {"district":"BAIRRO DO ABRIGO", "risk":24, "loot":"Ferramentas / peças / livros", "searches":6},
	"ESCOLA": {"district":"BAIRRO DO ABRIGO", "risk":20, "loot":"Livros / tecidos / sobreviventes", "searches":6},
	"APARTAMENTOS": {"district":"BAIRRO DO ABRIGO", "risk":26, "loot":"Comida / roupas / histórias", "searches":7},
	"IGREJA": {"district":"BAIRRO DO ABRIGO", "risk":25, "loot":"Abrigo / comunidade / mantimentos", "searches":5},
	"DELEGACIA": {"district":"CENTRO", "risk":38, "loot":"Munição / armas / arquivos", "searches":6},
	"CENTRO": {"district":"CENTRO", "risk":44, "loot":"Loot variado / alto risco", "searches":6},
	"HOSPITAL": {"district":"CENTRO", "risk":48, "loot":"Remédios / cirurgia / amostras", "searches":8},
	"ESTAÇÃO": {"district":"CENTRO", "risk":50, "loot":"Baterias / eletrônicos / rotas", "searches":6},
	"BIBLIOTECA": {"district":"CENTRO", "risk":34, "loot":"Livros / mapas / lore", "searches":6},
	"SHOPPING": {"district":"CENTRO", "risk":52, "loot":"Roupas / comida / equipamentos", "searches":8},
	"POSTO": {"district":"ZONA INDUSTRIAL", "risk":56, "loot":"Combustível / comida / peças", "searches":5},
	"ARMAZÉM": {"district":"ZONA INDUSTRIAL", "risk":62, "loot":"Metal / equipamento pesado", "searches":7},
	"TÚNEIS": {"district":"ZONA INDUSTRIAL", "risk":70, "loot":"Amostras / ninho / boss", "searches":6},
	"FÁBRICA": {"district":"ZONA INDUSTRIAL", "risk":64, "loot":"Metal / elétrica / máquinas", "searches":7},
	"FERRO-VELHO": {"district":"ZONA INDUSTRIAL", "risk":58, "loot":"Peças / veículos / metal", "searches":6},
	"SUBESTAÇÃO": {"district":"ZONA INDUSTRIAL", "risk":60, "loot":"Cobre / energia / eletrônica", "searches":5},
	"FAZENDA": {"district":"PERIFERIA", "risk":46, "loot":"Sementes / animais / comida", "searches":7},
	"FLORESTA": {"district":"PERIFERIA", "risk":42, "loot":"Madeira / caça / ervas", "searches":5},
	"LAGO": {"district":"PERIFERIA", "risk":38, "loot":"Peixe / água / plantas", "searches":4},
	"SILO": {"district":"PERIFERIA", "risk":54, "loot":"Grãos / ração / máquinas", "searches":5},
	"QUARENTENA": {"district":"QUARENTENA", "risk":82, "loot":"Tecnologia / comando / fim de campanha", "searches":7},
	"LABORATÓRIO": {"district":"QUARENTENA", "risk":88, "loot":"Pesquisa / mutações / origem", "searches":8}
}

const LOCATION_ROOMS := {
	"SUPERMERCADO": ["ESTACIONAMENTO", "ENTRADA", "CORREDORES", "AÇOUGUE", "ESCRITÓRIO", "DEPÓSITO"],
	"FARMÁCIA": ["VITRINE", "BALCÃO", "CORREDOR", "ESTOQUE", "SALA DOS FUNDOS"],
	"OFICINA": ["PÁTIO", "RECEPÇÃO", "BANCADAS", "DEPÓSITO", "ESCRITÓRIO", "GARAGEM"],
	"ESCOLA": ["PÁTIO", "SALAS", "COZINHA", "BIBLIOTECA", "QUADRA", "SEGUNDO ANDAR"],
	"APARTAMENTOS": ["PORTARIA", "GARAGEM", "APTO 101", "APTO 203", "APTO 302", "COBERTURA", "DEPÓSITO"],
	"IGREJA": ["PÁTIO", "NAVE", "SACRISTIA", "COZINHA", "PORÃO"],
	"DELEGACIA": ["PORTARIA", "RECEPÇÃO", "ARQUIVO", "ARSENAL", "CELAS", "GARAGEM"],
	"CENTRO": ["RUA COMERCIAL", "PRAÇA", "LOJA SAQUEADA", "ESCRITÓRIO", "TELHADO", "PRÉDIO ABANDONADO"],
	"HOSPITAL": ["ESTACIONAMENTO", "RECEPÇÃO", "ENFERMARIA", "FARMÁCIA INTERNA", "CIRURGIA", "LABORATÓRIO", "NECROTÉRIO", "SUBSOLO"],
	"ESTAÇÃO": ["ENTRADA", "BILHETERIA", "PLATAFORMA", "VAGÃO", "SALA ELÉTRICA", "TÚNEL DE SERVIÇO"],
	"BIBLIOTECA": ["RECEPÇÃO", "ACERVO GERAL", "TÉCNICOS", "ARQUIVO", "SALA DE ESTUDO", "SUBSOLO"],
	"SHOPPING": ["ESTACIONAMENTO", "PRAÇA DE ALIMENTAÇÃO", "LOJAS", "SUPERMERCADO", "ADMINISTRAÇÃO", "CINEMA", "TELHADO", "DOCAS"],
	"POSTO": ["LOJA", "BOMBAS", "OFICINA", "ESTOQUE", "PÁTIO"],
	"ARMAZÉM": ["PORTÃO", "DOCAS", "GALPÃO A", "GALPÃO B", "ESCRITÓRIO", "CÂMARA FRIA", "MEZANINO"],
	"TÚNEIS": ["ENTRADA", "MANUTENÇÃO", "GALERIA", "ESTAÇÃO ABANDONADA", "NINHO", "NINHO PROFUNDO"],
	"FÁBRICA": ["PORTARIA", "LINHA DE PRODUÇÃO", "MANUTENÇÃO", "SALA ELÉTRICA", "ALMOXARIFADO", "ESCRITÓRIOS", "TELHADO"],
	"FERRO-VELHO": ["PORTÃO", "PILHAS DE SUCATA", "CONTÊINERES", "OFICINA", "PÁTIO DE CARROS", "ESCRITÓRIO"],
	"SUBESTAÇÃO": ["PORTÃO", "PÁTIO", "TRANSFORMADORES", "SALA DE CONTROLE", "TÚNEL DE CABOS"],
	"FAZENDA": ["ESTRADA", "CASA", "CELEIRO", "GALINHEIRO", "PASTO", "HORTA", "POÇO"],
	"FLORESTA": ["TRILHA", "CLAREIRA", "CABANA", "RIACHO", "MATA FECHADA"],
	"LAGO": ["MARGEM", "PIER", "CABANA DE PESCA", "ILHOTA"],
	"SILO": ["PÁTIO", "ARMAZÉM DE GRÃOS", "TORRE", "OFICINA", "SUBSOLO"],
	"QUARENTENA": ["PORTÃO", "TRIAGEM", "BARRACAS", "HOSPITAL DE CAMPANHA", "COMANDO", "DEPÓSITO", "LABORATÓRIO MILITAR"],
	"LABORATÓRIO": ["RECEPÇÃO", "SEGURANÇA", "LABORATÓRIO A", "LABORATÓRIO B", "VIVEIRO", "ARQUIVO", "CÂMARA SELADA", "NÍVEL INFERIOR"]
}

# V18 — salas marcantes. Cada local importante tem pelo menos um encontro que
# muda a campanha em vez de ser apenas outro clique de loot.
const V18_SPECIAL_ROOMS := {
	"SUPERMERCADO|ESCRITÓRIO":{"title":"CADERNO DO ENCARREGADO","text":"Debaixo de notas de estoque há páginas sobre filtragem de água, baterias e manutenção. Não é uma receita pronta, mas é conhecimento que pode voltar ao abrigo.","kind":"document","skill":"electronics","chain":"first_manual"},
	"POSTO|ESTOQUE":{"title":"PEÇAS SEPARADAS PARA UMA FUGA","text":"Uma caixa de manutenção tem correias, terminais e uma bateria marcada para uma caminhonete. Alguém planejava sair e não conseguiu.","kind":"mechanics","skill":"mechanics","chain":"first_vehicle_parts"},
	"SUPERMERCADO|AÇOUGUE":{"title":"O FRIO PAROU, O CHEIRO NÃO","text":"A câmara do açougue está aberta. Caixas térmicas foram empilhadas contra a parede e alguém escreveu datas nelas antes da energia cair.","kind":"food","skill":"cooking","chain":"cold_store"},
	"FARMÁCIA|SALA DOS FUNDOS":{"title":"RECEITAS SEM PACIENTES","text":"Prontuários, antibióticos separados à mão e uma lista de apartamentos. Um nome aparece várias vezes ao lado de '302'.","kind":"medical","skill":"medicine","chain":"patient_302"},
	"OFICINA|GARAGEM":{"title":"UM MOTOR QUE AINDA PODE VOLTAR","text":"Há uma caminhonete desmontada sobre cavaletes. O motor não está morto — faltam peças e alguém sabia exatamente quais.","kind":"mechanics","skill":"mechanics","chain":"vehicle_parts"},
	"ESCOLA|SEGUNDO ANDAR":{"title":"A SALA TRANCADA","text":"Marcas de unhas na porta, garrafas vazias e um rádio portátil sem bateria. Alguém ficou aqui por dias.","kind":"human","skill":"survival","chain":"school_survivor"},
	"APARTAMENTOS|APTO 302":{"title":"O PACIENTE DO 302","text":"O apartamento está organizado demais para ter sido saqueado. Há remédios, uma febre anotada dia a dia e uma mensagem nunca enviada para a Farmácia.","kind":"medical","skill":"medicine","chain":"patient_302_end"},
	"IGREJA|PORÃO":{"title":"NOMES NA PAREDE","text":"Dezenas de nomes foram escritos no reboco. Alguns têm datas. Outros têm apenas uma seta apontando para a Escola.","kind":"human","skill":"survival","chain":"school_survivor_end"},
	"DELEGACIA|ARQUIVO":{"title":"ORDEM DE EVACUAÇÃO 17-B","text":"Uma ordem impressa manda conduzir civis pela Estação, mas o horário oficial é anterior ao primeiro boletim público do surto.","kind":"document","skill":"survival","chain":"evac_order"},
	"DELEGACIA|ARSENAL":{"title":"O ARMÁRIO QUE NÃO FOI ESVAZIADO","text":"A porta metálica está empenada. Dentro, caixas de munição foram deixadas para trás durante uma retirada apressada.","kind":"weapons","skill":"gunsmithing","chain":"arsenal"},
	"CENTRO|TELHADO":{"title":"LUZES NO HORIZONTE","text":"Do alto você vê três pontos de luz que não parecem incêndios. Um deles pisca num padrão repetido.","kind":"signal","skill":"electronics","chain":"three_lights"},
	"HOSPITAL|CIRURGIA":{"title":"A ÚLTIMA CIRURGIA","text":"Instrumentos ainda estão sobre a mesa. Uma ficha descreve um paciente com temperatura impossível e sedação mantida por horas.","kind":"medical","skill":"medicine","chain":"surgery_grid"},
	"HOSPITAL|NECROTÉRIO":{"title":"GAVETA 14","text":"Uma gaveta foi soldada por fora. O metal está arranhado do lado de dentro e há um número de amostra escrito à mão.","kind":"mutation","skill":"medicine","chain":"sample_14"},
	"HOSPITAL|SUBSOLO":{"title":"GERADOR DE EMERGÊNCIA","text":"O gerador parou por falta de combustível, não por dano. Um cabo grosso segue em direção à rede da Subestação.","kind":"power","skill":"electrical","chain":"surgery_grid"},
	"ESTAÇÃO|TÚNEL DE SERVIÇO":{"title":"ROTA 17-B","text":"Setas de tinta conduzem por um túnel lateral. Há marcas de macas no chão e cápsulas militares perto de uma porta de manutenção.","kind":"document","skill":"survival","chain":"evac_order_end"},
	"BIBLIOTECA|ARQUIVO":{"title":"JORNAIS QUE SUMIRAM DA INTERNET","text":"Uma pasta reúne recortes impressos sobre internações estranhas semanas antes do colapso. Alguém marcou cada hospital no mapa.","kind":"document","skill":"survival","chain":"pre_outbreak"},
	"SHOPPING|CINEMA":{"title":"SESSÃO ENCERRADA","text":"Colchões ocupam a sala de projeção. O lugar serviu de abrigo até alguém quebrar a saída de emergência por dentro.","kind":"human","skill":"survival","chain":"cinema_refuge"},
	"POSTO|OFICINA":{"title":"NOTA DE SERVIÇO: CAMINHONETE AZUL","text":"Uma ordem de serviço cita peças retiradas de um carro do Ferro-Velho. A mesma placa aparece anotada na parede.","kind":"mechanics","skill":"mechanics","chain":"vehicle_parts"},
	"ARMAZÉM|CÂMARA FRIA":{"title":"ESTOQUE DE EMERGÊNCIA","text":"A câmara está morna, mas caixas lacradas ainda protegem sal, conservas e material médico básico.","kind":"food","skill":"cooking","chain":"warehouse_cache"},
	"TÚNEIS|NINHO PROFUNDO":{"title":"PAREDES QUE RESPIRAM","text":"A matéria orgânica pulsa ao redor de cabos antigos. No centro há cápsulas e etiquetas iguais às do Hospital.","kind":"mutation","skill":"medicine","chain":"sample_14_end"},
	"FÁBRICA|SALA ELÉTRICA":{"title":"QUADRO DE BYPASS","text":"Um circuito improvisado pode alimentar parte da fábrica — ou mandar energia de volta para a rede urbana.","kind":"power","skill":"electrical","chain":"factory_grid"},
	"FERRO-VELHO|PÁTIO DE CARROS":{"title":"A CAMINHONETE AZUL","text":"A placa corresponde à ordem do Posto. O chassi ainda serve e há componentes que podem completar outro veículo.","kind":"mechanics","skill":"mechanics","chain":"vehicle_parts_end"},
	"SUBESTAÇÃO|SALA DE CONTROLE":{"title":"UM BAIRRO PODE ACENDER DE NOVO","text":"Os disjuntores principais estão intactos. O problema é isolar linhas contaminadas sem incendiar o restante da rede.","kind":"power","skill":"electrical","chain":"surgery_grid_end"},
	"FAZENDA|CELEIRO":{"title":"SEMENTES PARA UM ANO","text":"Sacarias foram suspensas do chão contra a umidade. Há sementes, ração e um caderno de rotação de cultivo.","kind":"farming","skill":"farming","chain":"seed_bank"},
	"FLORESTA|CABANA":{"title":"MAPA DE CAÇA","text":"Alguém marcou água, trilhas de animais e três pontos com a palavra 'NÃO'. O mapa é recente.","kind":"hunting","skill":"hunting","chain":"hunter_map"},
	"LAGO|CABANA DE PESCA":{"title":"RÁDIO DE ONDAS CURTAS","text":"O rádio está ligado a uma bateria automotiva quase vazia. Uma frequência foi circulada ao lado da palavra 'SILO'.","kind":"signal","skill":"electronics","chain":"lake_signal"},
	"SILO|TORRE":{"title":"A ANTENA DO SILO","text":"Do alto, a frequência do Lago fica clara. A transmissão menciona os Túneis e repete coordenadas em intervalos exatos.","kind":"signal","skill":"electronics","chain":"lake_signal_end"},
	"QUARENTENA|COMANDO":{"title":"PROTOCOLO ÂMBAR","text":"Mapas militares dividem a cidade em zonas de contenção. O Laboratório aparece como origem de todas as rotas, não como destino.","kind":"document","skill":"survival","chain":"amber_protocol"},
	"QUARENTENA|LABORATÓRIO MILITAR":{"title":"AMOSTRAS TRANSFERIDAS","text":"Registros confirmam que material do Hospital foi trazido para cá após a evacuação. A cadeia de custódia termina numa Câmara Selada.","kind":"mutation","skill":"medicine","chain":"amber_protocol"},
	"LABORATÓRIO|CÂMARA SELADA":{"title":"ANTES DO PRIMEIRO DIA","text":"A câmara guarda gravações e culturas datadas de antes do primeiro caso oficialmente reconhecido.","kind":"origin","skill":"chemistry","chain":"origin_truth"},
	"LABORATÓRIO|NÍVEL INFERIOR":{"title":"O QUE FICOU ABAIXO","text":"Portas blindadas levam a um nível que não aparece nas plantas. Alarmes ainda funcionam e algo grande se move do outro lado.","kind":"finale","skill":"survival","chain":"lower_level"}
}

const MUTATION_NAMES := {
	1: ["ERRANTE", "INFECTADO"],
	2: ["CORREDOR", "CEGO", "UIVADOR"],
	3: ["BRUTAMONTES", "CUSPIDOR", "PARASITADO"],
	4: ["CAÇADOR", "ABERRAÇÃO", "ALFA"]
}

const ITEM_LABELS := {
	"knife":"FACA", "pistol":"PISTOLA", "ammo":"MUNIÇÃO", "food":"COMIDA", "water":"ÁGUA", "med":"REMÉDIO",
	"scrap":"SUCATA", "cloth":"TECIDO", "bandage":"BANDAGEM", "antibiotic":"ANTIBIÓTICO", "battery":"PILHA",
	"electronics":"ELETRÔNICOS", "fuel":"COMBUSTÍVEL", "herbs":"ERVAS", "keycard":"CARTÃO", "samples":"AMOSTRAS"
}

# V7 — sobrevivência sistêmica: conhecimento, corpo, produção, comunidade e mundo.
const V7_SKILL_NAMES := {
	"survival":"SOBREVIVÊNCIA", "hunting":"CAÇA", "carpentry":"CARPINTARIA", "metalworking":"FORJA",
	"electrical":"ELÉTRICA", "electronics":"ELETRÔNICA", "mechanics":"MECÂNICA", "medicine":"MEDICINA",
	"cooking":"CULINÁRIA", "farming":"AGRICULTURA", "tailoring":"COSTURA", "gunsmithing":"ARMEIRO", "chemistry":"QUÍMICA"
}
const V7_BOOKS := {
	"sobrevivencia_1":{"title":"Manual de Sobrevivência Vol. I","skill":"survival","xp":40,"recipes":["wood_spear","trap"]},
	"cacador_1":{"title":"Rastreamento e Caça","skill":"hunting","xp":45,"recipes":["snare","smoker"]},
	"carpintaria_1":{"title":"Carpintaria Prática","skill":"carpentry","xp":50,"recipes":["rain_collector","animal_pen","garden_plot"]},
	"metalurgia_1":{"title":"Metalurgia Básica","skill":"metalworking","xp":55,"recipes":["forge","steel_axe"]},
	"eletrica_1":{"title":"Instalações Elétricas Residenciais","skill":"electrical","xp":55,"recipes":["battery_bank","generator_repair"]},
	"eletronica_1":{"title":"Eletrônica de Campo","skill":"electronics","xp":55,"recipes":["motion_alarm","radio_booster","weather_station"]},
	"mecanica_1":{"title":"Motores e Manutenção","skill":"mechanics","xp":55,"recipes":["vehicle_repair","generator_repair"]},
	"medicina_1":{"title":"Primeiros Socorros Avançados","skill":"medicine","xp":55,"recipes":["medkit","splint"]},
	"culinaria_1":{"title":"Conservação de Alimentos","skill":"cooking","xp":45,"recipes":["smoker","preserved_meat"]},
	"agricultura_1":{"title":"Cultivo em Tempos Difíceis","skill":"farming","xp":45,"recipes":["garden_plot","compost"]},
	"costura_1":{"title":"Costura e Reparos","skill":"tailoring","xp":45,"recipes":["reinforced_clothes"]},
	"armeiro_1":{"title":"Manutenção de Armas","skill":"gunsmithing","xp":60,"recipes":["gun_repair","improvised_suppressor"]},
	"quimica_1":{"title":"Química Aplicada","skill":"chemistry","xp":60,"recipes":["disinfectant","fuel_mix"]}
}
const V7_RECIPES := {
	"wood_spear":{"name":"Lança de madeira","skill":"survival","level":0,"facility":"workbench","materials":{"wood":2,"cloth":1},"kind":"item"},
	"trap":{"name":"Armadilha simples","skill":"hunting","level":0,"facility":"workbench","materials":{"wood":2,"wire":1},"kind":"trap"},
	"snare":{"name":"Laço de caça","skill":"hunting","level":1,"facility":"workbench","materials":{"wire":2,"cloth":1},"kind":"trap"},
	"rain_collector":{"name":"Coletor de chuva","skill":"carpentry","level":1,"facility":"workbench","materials":{"wood":3,"nails":2,"cloth":2},"kind":"facility","target":"rain_collector"},
	"animal_pen":{"name":"Cercado para animais","skill":"carpentry","level":1,"facility":"workbench","materials":{"wood":6,"nails":4,"wire":2},"kind":"facility","target":"animal_pen"},
	"garden_plot":{"name":"Canteiro de cultivo","skill":"farming","level":1,"facility":"workbench","materials":{"wood":3,"seeds":1},"kind":"facility","target":"garden"},
	"forge":{"name":"Forja improvisada","skill":"metalworking","level":1,"facility":"workbench","materials":{"steel":5,"scrap":5,"coal":2},"kind":"facility","target":"forge"},
	"steel_axe":{"name":"Machado de aço","skill":"metalworking","level":2,"facility":"forge","materials":{"steel":3,"wood":1},"kind":"item"},
	"battery_bank":{"name":"Banco de baterias","skill":"electrical","level":2,"facility":"workbench","materials":{"copper":3,"electronics":2,"battery":2},"kind":"facility","target":"battery_bank"},
	"generator_repair":{"name":"Reparo do gerador","skill":"mechanics","level":2,"facility":"workbench","materials":{"mechanical":3,"copper":2,"fuel":1},"kind":"project","target":"power"},
	"motion_alarm":{"name":"Alarme de movimento","skill":"electronics","level":2,"facility":"workbench","materials":{"electronics":3,"copper":2,"battery":1},"kind":"facility","target":"motion_alarm"},
	"radio_booster":{"name":"Amplificador de rádio","skill":"electronics","level":2,"facility":"workbench","materials":{"electronics":3,"copper":2,"battery":1},"kind":"facility","target":"radio_booster"},
	"weather_station":{"name":"Estação meteorológica","skill":"electronics","level":2,"facility":"workbench","materials":{"electronics":3,"copper":2,"battery":1,"mechanical":1},"kind":"facility","target":"weather_station"},
	"smoker":{"name":"Defumador","skill":"cooking","level":1,"facility":"workbench","materials":{"wood":4,"nails":2,"steel":1},"kind":"facility","target":"smoker"},
	"preserved_meat":{"name":"Carne preservada","skill":"cooking","level":1,"facility":"smoker","materials":{"raw_meat":2,"salt":1},"kind":"food"},
	"medkit":{"name":"Kit médico","skill":"medicine","level":1,"facility":"workbench","materials":{"cloth":2,"chemicals":1,"herbs":1},"kind":"med"},
	"splint":{"name":"Tala","skill":"medicine","level":1,"facility":"workbench","materials":{"wood":1,"cloth":2},"kind":"splint"},
	"reinforced_clothes":{"name":"Roupa reforçada","skill":"tailoring","level":1,"facility":"workbench","materials":{"cloth":4,"leather":2},"kind":"armor"},
	"gun_repair":{"name":"Reparo de arma","skill":"gunsmithing","level":1,"facility":"workbench","materials":{"steel":1,"mechanical":1},"kind":"repair"},
	"improvised_suppressor":{"name":"Supressor improvisado","skill":"gunsmithing","level":2,"facility":"workbench","materials":{"steel":2,"cloth":1,"mechanical":1},"kind":"item"},
	"disinfectant":{"name":"Desinfetante","skill":"chemistry","level":1,"facility":"workbench","materials":{"chemicals":2,"water":1},"kind":"med"},
	"fuel_mix":{"name":"Mistura de combustível","skill":"chemistry","level":2,"facility":"workbench","materials":{"chemicals":2,"fuel":1},"kind":"fuel"}
}
const V7_WORLD_NEWS := [
	{"day":1,"channel":"LOCAL","text":"Hospitais da região deixaram de responder. A Defesa Civil recomenda permanecer em locais fechados."},
	{"day":3,"channel":"NACIONAL","text":"Rodovias estaduais foram bloqueadas após ataques em postos de triagem. Comboios ainda tentam alcançar o interior."},
	{"day":5,"channel":"MILITAR","text":"Frequência 117.8: unidades de quarentena relatam comportamento anormal em infectados expostos por vários dias."},
	{"day":8,"channel":"EXTERNA","text":"Uma transmissão estrangeira confirma surtos em mais de um continente. Algumas regiões mantêm energia e comunicação."},
	{"day":12,"channel":"NACIONAL","text":"A chamada Zona Segura Delta interrompeu transmissões depois de receber milhares de refugiados."},
	{"day":17,"channel":"MILITAR","text":"Boletim fragmentado menciona 'pressão mutagênica' e ordena destruição de ninhos antes do estágio quatro."},
	{"day":24,"channel":"EXTERNA","text":"Estações de ondas curtas falam de corredores humanitários em zonas costeiras, mas nenhuma rota foi confirmada."},
	{"day":35,"channel":"DESCONHECIDA","text":"Uma voz repete coordenadas e a frase: 'Aurora não caiu. Não acredite no silêncio'."},
	{"day":50,"channel":"ARQUIVO","text":"Documento recuperado cita testes neurológicos anteriores ao primeiro caso público e uma empresa chamada Helix Ardent."}
]
const V7_RARITIES := ["COMUM","INCOMUM","RARO","MUITO RARO","ÚNICO"]

# AFTERFALL V9 — alimentos específicos, interiores sistêmicos e eventos globais.
const V9_FOODS := {
	"feijao_lata":{"name":"Feijão enlatado","kcal":430,"protein":23,"hydration":10,"days":999,"rarity":"COMUM"},
	"biscoito":{"name":"Biscoito seco","kcal":360,"protein":7,"hydration":0,"days":120,"rarity":"COMUM"},
	"atum_lata":{"name":"Atum enlatado","kcal":310,"protein":38,"hydration":6,"days":999,"rarity":"INCOMUM"},
	"barra_proteica":{"name":"Barra proteica","kcal":260,"protein":20,"hydration":0,"days":240,"rarity":"INCOMUM"},
	"carne_fresca":{"name":"Carne fresca","kcal":620,"protein":46,"hydration":4,"days":2,"rarity":"INCOMUM"},
	"vegetais_frescos":{"name":"Vegetais frescos","kcal":180,"protein":6,"hydration":28,"days":3,"rarity":"COMUM"},
	"refeicao_mre":{"name":"Ração militar MRE","kcal":1180,"protein":42,"hydration":8,"days":999,"rarity":"RARO"},
	"doce":{"name":"Doce antigo","kcal":520,"protein":3,"hydration":0,"days":180,"rarity":"INCOMUM"},
	"carne_defumada":{"name":"Carne defumada","kcal":540,"protein":40,"hydration":1,"days":18,"rarity":"INCOMUM"}
}

const V9_GLOBAL_EVENTS := [
	{"day":4,"id":"water_warning","title":"ÁGUA SOB SUSPEITA","text":"Uma transmissão recomenda não beber água de torneiras ou caixas antigas. Casos de febre foram associados à rede.","effect":"WATER"},
	{"day":8,"id":"grid_failure","title":"QUEDA DA REDE","text":"Subestações fora da cidade deixaram de responder. Bairros inteiros estão sem energia.","effect":"POWER"},
	{"day":13,"id":"refugee_wave","title":"COLUNA DE REFUGIADOS","text":"Um grande grupo vindo do oeste está tentando atravessar a região. Facções locais disputam a rota.","effect":"REFUGEES"},
	{"day":18,"id":"mutation_burst","title":"NOVAS MUTAÇÕES","text":"Boletins militares descrevem infectados com alterações incompatíveis com a progressão normal da doença.","effect":"MUTATION"},
	{"day":26,"id":"radio_silence","title":"SILÊNCIO NAS FREQUÊNCIAS","text":"Várias emissoras desapareceram na mesma noite. Restam sinais curtos e transmissões automáticas.","effect":"RADIO"}
]

# V10 — personagens persistentes, raridade narrativa e perfil de jogador.
# A raridade representa quão difícil é encontrar aquela combinação de experiência/história,
# não o valor humano do sobrevivente. Na primeira instalação apenas o CIVIL COMUM é inicial.
const V10_CHARACTERS := {
	"starter":{"name":"SOBREVIVENTE","role":"CIVIL","rarity":"COMUM","story":"Antes do colapso, você era uma pessoa comum. Nenhum treinamento especial, nenhum estoque preparado. Só o que conseguir aprender depois do Dia 1.","trait":"ADAPTÁVEL — aprende sem bônus nem penalidade.","unlock":"INICIAL","skill":"","level":0},
	"mara":{"name":"MARA","role":"AGRICULTORA","rarity":"INCOMUM","story":"Cresceu em uma pequena propriedade e estava trazendo sementes para a irmã quando as estradas fecharam. Detesta desperdiçar comida.","trait":"MÃOS DE TERRA — melhor rendimento em horta e sementes.","unlock":"Encontre Mara na periferia.","skill":"farming","level":2},
	"ivo":{"name":"IVO","role":"MECÂNICO","rarity":"INCOMUM","story":"Trabalhava numa oficina de ônibus. Conhece motores pelo som, mas deve favores a gente que sobreviveu no Ferro-Velho.","trait":"IMPROVISO MECÂNICO — reparos usam menos peças.","unlock":"Ajude Ivo na Zona Industrial.","skill":"mechanics","level":2},
	"raul":{"name":"RAUL","role":"CAÇADOR","rarity":"INCOMUM","story":"Passou anos guiando caçadas legais e conhecendo matas da região. Depois do surto, perdeu o irmão numa estrada rural.","trait":"RASTREADOR — encontra mais sinais de animais e rotas naturais.","unlock":"Siga rastros na Floresta.","skill":"hunting","level":2},
	"miguel":{"name":"MIGUEL","role":"PROFESSOR","rarity":"INCOMUM","story":"Professor de ciências e bibliotecário voluntário. Salvou caixas de livros enquanto outras pessoas buscavam armas.","trait":"MEMÓRIA TÉCNICA — aprende mais com livros e preserva conhecimento.","unlock":"Investigue a Biblioteca.","skill":"survival","level":1},
	"davi":{"name":"DAVI","role":"SOCORRISTA","rarity":"RARO","story":"Paramédico de plantão na noite em que as primeiras ambulâncias deixaram de voltar. Ainda procura a irmã, desaparecida perto da Escola.","trait":"TRIAGEM — tratamentos de campo são mais eficientes.","unlock":"Responda ao pedido de socorro na Escola.","skill":"medicine","level":3},
	"lucia":{"name":"LÚCIA","role":"BATEDORA","rarity":"RARO","story":"Conhece atalhos e telhados da cidade. Diz ter abandonado uma comunidade chamada Vigília, mas evita explicar por quê.","trait":"PASSOS LEVES — bônus de furtividade em ruas e interiores.","unlock":"Decida abrir o portão para Lúcia.","skill":"survival","level":3},
	"helena":{"name":"HELENA","role":"ELETRICISTA","rarity":"RARO","story":"Era técnica de manutenção de uma subestação. Sabe quais partes da rede ainda podem ser recuperadas e quais podem matar alguém em segundos.","trait":"REDE VIVA — projetos elétricos exigem menos tempo.","unlock":"Restaure parte da Subestação.","skill":"electricity","level":3},
	"otavio":{"name":"OTÁVIO","role":"FERREIRO","rarity":"RARO","story":"Fabricava ferramentas e facas artesanais. Durante o colapso transformou a própria oficina em abrigo até ficar sem carvão.","trait":"AÇO TEMPERADO — itens de metal saem com qualidade maior.","unlock":"Encontre a forja abandonada na Zona Industrial.","skill":"blacksmith","level":3},
	"samuel":{"name":"SAMUEL","role":"EX-MILITAR","rarity":"RARO","story":"Foi destacado para um cordão de quarentena que desapareceu dos mapas oficiais. Carrega ordens antigas que nunca conseguiu cumprir.","trait":"DISCIPLINA — melhor desempenho com armas e em vigia.","unlock":"Descubra um posto militar perdido.","skill":"gunsmith","level":2},
	"elisa":{"name":"ELISA","role":"CIRURGIÃ","rarity":"EXCEPCIONAL","story":"Cirurgiã do Hospital Central. Continuou operando durante apagões e escondeu prontuários que contradizem a versão oficial do surto.","trait":"MÃOS FIRMES — ferimentos graves têm tratamento avançado.","unlock":"Abra a ala cirúrgica do Hospital.","skill":"medicine","level":4},
	"nora":{"name":"NORA","role":"PESQUISADORA","rarity":"EXCEPCIONAL","story":"Pesquisava resposta imunológica antes do colapso. O nome dela aparece em documentos que antecedem os primeiros casos públicos.","trait":"PROTOCOLO CINZA — pesquisa de mutações rende mais informação.","unlock":"Descubra o laboratório profundo da Quarentena.","skill":"chemistry","level":4},
	"nina":{"name":"NINA","role":"COZINHEIRA","rarity":"INCOMUM","story":"Trabalhava na praça de alimentação do Shopping e aprendeu a fazer refeições com quase nada. Depois do colapso, transformou conservação de comida em questão de sobrevivência.","trait":"PANELA VAZIA — refeições rendem mais energia e alimentos estragam um pouco mais devagar.","unlock":"Encontre Nina na Praça de Alimentação.","skill":"cooking","level":2},
	"cesar":{"name":"CÉSAR","role":"CARPINTEIRO","rarity":"INCOMUM","story":"Reformava apartamentos quando o surto começou. Passou dias abrindo passagens entre prédios sem pisar na rua.","trait":"ESTRUTURA — construções de madeira usam menos material.","unlock":"Encontre César nos Apartamentos.","skill":"carpentry","level":2},
	"joana":{"name":"JOANA","role":"VETERINÁRIA","rarity":"RARO","story":"Atendia animais de produção na periferia. Recusou deixar os bichos morrerem quando as famílias fugiram das fazendas.","trait":"CUIDADO ANIMAL — reduz doenças e perdas na criação.","unlock":"Encontre Joana no Silo ou Fazenda.","skill":"medicine","level":2},
	"bruno":{"name":"BRUNO","role":"COSTUREIRO","rarity":"INCOMUM","story":"Fazia ajustes e consertos numa loja do Shopping. Descobriu cedo que uma boa camada de tecido podia significar a diferença entre arranhão e mordida.","trait":"REMENDO FORTE — roupas reparadas duram mais.","unlock":"Encontre Bruno entre as lojas do Shopping.","skill":"tailoring","level":2},
	"celso":{"name":"CELSO","role":"RADIOAMADOR","rarity":"RARO","story":"Passou décadas montando antenas por hobby. Nos primeiros dias do colapso foi uma das poucas vozes ainda falando com cidades distantes.","trait":"OUVIDO NA ESTÁTICA — encontra frequências e notícias raras com mais facilidade.","unlock":"Encontre Celso na Estação.","skill":"electronics","level":3},
	"ana":{"name":"ANA","role":"FARMACÊUTICA","rarity":"RARO","story":"Conhece medicamentos, dosagens e o que ainda pode ser aproveitado depois de meses sem refrigeração. Guarda culpa por ter fechado a farmácia numa noite de tumulto.","trait":"DOSE CERTA — medicamentos e antibióticos rendem mais.","unlock":"Encontre Ana nos fundos da Farmácia.","skill":"chemistry","level":3},
	"tomas":{"name":"TOMÁS","role":"BOMBEIRO","rarity":"RARO","story":"Entrou em prédios em chamas enquanto o resto da cidade fugia. Conhece resgate, ferramentas de entrada e como manter a cabeça quando tudo desaba.","trait":"RESGATE — menor risco ao arrombar, carregar feridos e atravessar incêndios.","unlock":"Encontre Tomás num prédio do Centro.","skill":"survival","level":3},
	"zero":{"name":"ZERO","role":"DESCONHECIDO","rarity":"ÚNICO","story":"Uma transmissão usa esse nome repetidamente, sempre de frequências diferentes. Não está claro se é uma pessoa, um codinome ou algo pior.","trait":"??? — a história precisa ser descoberta em jogo.","unlock":"Decifre as transmissões perdidas.","skill":"","level":0}
}
const V10_RARITY_COLORS := {
	"COMUM":Color("#a8a096"),"INCOMUM":Color("#6f9b72"),"RARO":Color("#668aa9"),"EXCEPCIONAL":Color("#a07bb0"),"ÚNICO":Color("#b08b45")
}
const V10_PERSONAL_QUESTS := {
	"mara":{"title":"SEMENTES DA IRMÃ","desc":"Mara acredita que a irmã deixou uma caixa de sementes marcada antes de fugir.","location":"FAZENDA","reward":"Mara confia mais em você • sementes especiais"},
	"ivo":{"title":"DÍVIDA DE FERRO","desc":"Ivo quer voltar ao Ferro-Velho e recuperar uma caixa de ferramentas que pertencia à antiga equipe.","location":"FERRO-VELHO","reward":"Ferramentas mecânicas • confiança de Ivo"},
	"raul":{"title":"A ÚLTIMA TRILHA","desc":"Raul reconheceu marcas que podem ter sido deixadas pelo irmão pouco antes da queda.","location":"FLORESTA","reward":"Mapa de caça • confiança de Raul"},
	"miguel":{"title":"O LIVRO QUE FALTA","desc":"Miguel procura um caderno técnico que catalogava poços, sementes e geradores da região.","location":"BIBLIOTECA","reward":"Conhecimento da comunidade • confiança de Miguel"},
	"davi":{"title":"A IRMÃ DE DAVI","desc":"Davi encontrou uma anotação que liga a irmã ao Hospital Central depois da evacuação da Escola.","location":"HOSPITAL","reward":"Davi revela seu passado • Medicina"},
	"lucia":{"title":"O QUE A VIGÍLIA FEZ","desc":"Lúcia aceita contar a verdade se você encontrar os registros que a Vigília tentou apagar.","location":"DELEGACIA","reward":"Segredo de Lúcia revelado • informação de facção"},
	"helena":{"title":"SUBESTAÇÃO 3","desc":"Helena sabe como recuperar parte da rede, mas precisa chegar ao painel que abandonou no primeiro apagão.","location":"SUBESTAÇÃO","reward":"Projeto elétrico avançado • confiança de Helena"},
	"otavio":{"title":"A ÚLTIMA BRASA","desc":"Otávio deixou moldes e ferramentas numa fábrica tomada pelos infectados.","location":"FÁBRICA","reward":"Receita de metalurgia • confiança de Otávio"},
	"samuel":{"title":"ORDEM 17","desc":"Samuel ainda carrega uma ordem militar lacrada que só faz sentido dentro da Quarentena.","location":"QUARENTENA","reward":"Arquivo militar • confiança de Samuel"},
	"elisa":{"title":"PRONTUÁRIOS 17-B","desc":"Elisa escondeu prontuários da primeira noite do surto na ala médica.","location":"HOSPITAL","reward":"Lore médico • confiança de Elisa"},
	"nina":{"title":"A ÚLTIMA REFEIÇÃO","desc":"Nina deixou um caderno de receitas e conservação no Shopping durante a evacuação.","location":"SHOPPING","reward":"Receitas de conservação • confiança de Nina"},
	"cesar":{"title":"PASSAGEM ENTRE PAREDES","desc":"César marcou uma rota segura entre os Apartamentos que pode virar atalho permanente.","location":"APARTAMENTOS","reward":"Atalho urbano • confiança de César"},
	"joana":{"title":"O CELEIRO FECHADO","desc":"Joana ouviu animais presos no Silo e quer descobrir se algum ainda está vivo.","location":"SILO","reward":"Saúde animal • confiança de Joana"},
	"bruno":{"title":"TECIDO BALÍSTICO","desc":"Bruno lembra de um estoque técnico abandonado nas docas do Shopping.","location":"SHOPPING","reward":"Roupa reforçada • confiança de Bruno"},
	"celso":{"title":"A VOZ DO KM 81","desc":"Celso reconheceu um indicativo antigo transmitindo da Estação e quer rastrear a origem.","location":"ESTAÇÃO","reward":"Nova frequência • confiança de Celso"},
	"ana":{"title":"A LISTA DE DOSAGENS","desc":"Ana escondeu fichas de medicamentos nos fundos da Farmácia quando a multidão entrou.","location":"FARMÁCIA","reward":"Eficiência médica • confiança de Ana"},
	"tomas":{"title":"AINDA TEM ALGUÉM LÁ","desc":"Tomás acredita que um chamado de emergência antigo veio do prédio onde perdeu sua equipe.","location":"CENTRO","reward":"Ferramentas de resgate • confiança de Tomás"},
	"nora":{"title":"PROTOCOLO CINZA","desc":"Nora quer verificar o que restou dos registros de pesquisa sob a Quarentena.","location":"LABORATÓRIO","reward":"Pesquisa avançada • verdade sobre as mutações"}
}

# V11 — vida cotidiana no abrigo. Rotinas consomem tempo/recursos e deixam memória.
const V11_ROUTINES := {
	"meal":{"name":"REFEIÇÃO EM GRUPO","desc":"Cozinhar e comer junto. Usa comida e água, reduz tensão e aproxima as pessoas."},
	"cards":{"name":"CARTAS / CONVERSA","desc":"Uma hora sem pensar em infectados. Reduz estresse e pode criar amizade ou rivalidade."},
	"reading":{"name":"NOITE DE LEITURA","desc":"Compartilhar livros e anotações. Preserva conhecimento e dá experiência de habilidade."},
	"maintenance":{"name":"RONDA DE MANUTENÇÃO","desc":"Verificar portas, telhado, cercas e gerador antes de dormir."},
	"training":{"name":"TREINO EM GRUPO","desc":"Exercício e prática de defesa. Cansa, mas melhora coesão e preparo."}
}

# V12 — tempo físico, clima sistêmico, saúde ambiental, perfil e planejamento de viagem.
const V12_LOCATION_DISTANCE_KM := {
	"SUPERMERCADO":0.9,"FARMÁCIA":1.4,"OFICINA":1.8,"ESCOLA":2.1,"APARTAMENTOS":1.1,"IGREJA":1.7,
	"DELEGACIA":3.2,"CENTRO":3.7,"HOSPITAL":4.1,"ESTAÇÃO":4.4,"BIBLIOTECA":3.5,"SHOPPING":4.8,
	"POSTO":5.6,"ARMAZÉM":6.4,"TÚNEIS":6.8,"FÁBRICA":6.1,"FERRO-VELHO":5.9,"SUBESTAÇÃO":6.7,
	"FAZENDA":8.2,"FLORESTA":9.4,"LAGO":10.6,"SILO":8.9,"QUARENTENA":13.5,"LABORATÓRIO":14.7
}
const V12_ROUTE_FACTORS := {
	"AVENIDA":{"distance":1.0,"speed":1.0,"stealth":-8,"name":"AVENIDA"},
	"BECOS":{"distance":1.16,"speed":0.86,"stealth":10,"name":"BECOS"},
	"ROTA SILENCIOSA":{"distance":1.34,"speed":0.78,"stealth":16,"name":"ROTA SILENCIOSA"}
}
const V12_SEASON_META := {
	"OUTONO":{"min":10,"max":23,"sunrise":390,"sunset":1080,"rain":45,"wind":15},
	"INVERNO":{"min":3,"max":16,"sunrise":430,"sunset":1030,"rain":35,"wind":18},
	"PRIMAVERA":{"min":13,"max":27,"sunrise":360,"sunset":1110,"rain":52,"wind":14},
	"VERÃO":{"min":20,"max":35,"sunrise":330,"sunset":1150,"rain":42,"wind":12}
}
const V12_DISEASE_META := {
	"RESFRIADO":{"name":"RESFRIADO","desc":"Tosse, sono ruim e recuperação mais lenta."},
	"INFECÇÃO DE FERIDA":{"name":"INFECÇÃO DE FERIDA","desc":"Dor, febre e perda gradual de vida se não for tratada."},
	"INTOXICAÇÃO":{"name":"INTOXICAÇÃO ALIMENTAR","desc":"Náusea, sede maior e energia baixa."},
	"HIPOTERMIA":{"name":"HIPOTERMIA","desc":"Frio perigoso, perda de coordenação e energia."},
	"EXAUSTÃO PELO CALOR":{"name":"EXAUSTÃO PELO CALOR","desc":"Sede acelerada, fadiga e dificuldade de caminhar."},
	"DESIDRATAÇÃO":{"name":"DESIDRATAÇÃO","desc":"Fraqueza, percepção pior e risco de colapso."},
	"IRRITAÇÃO RESPIRATÓRIA":{"name":"IRRITAÇÃO RESPIRATÓRIA","desc":"Tosse seca e fôlego curto após poeira, fumaça ou mofo."},
	"GRIPE":{"name":"GRIPE","desc":"Febre, dores no corpo, sono ruim e risco de espalhar sintomas no abrigo."},
	"BRONQUITE":{"name":"BRONQUITE","desc":"Tosse persistente e perda de fôlego. Frio e fumaça pioram o quadro."},
	"GASTROENTERITE":{"name":"GASTROENTERITE","desc":"Náusea, fraqueza e grande consumo de água. Higiene e água segura importam."}
}
const V14_CLOTHING_META := {
	"ROUPA COMUM":{"warmth":0,"waterproof":0,"protection":0,"noise":0,"weight":1.2,"rarity":"COMUM"},
	"JAQUETA DE CHUVA":{"warmth":1,"waterproof":3,"protection":0,"noise":1,"weight":1.0,"rarity":"INCOMUM"},
	"CASACO DE LÃ":{"warmth":3,"waterproof":0,"protection":1,"noise":0,"weight":2.1,"rarity":"INCOMUM"},
	"PARKA IMPERMEÁVEL":{"warmth":4,"waterproof":3,"protection":1,"noise":1,"weight":2.8,"rarity":"RARO"},
	"ROUPA REFORÇADA":{"warmth":2,"waterproof":1,"protection":3,"noise":2,"weight":3.4,"rarity":"RARO"},
	"COLETE REFORÇADO":{"warmth":1,"waterproof":0,"protection":4,"noise":2,"weight":4.0,"rarity":"RARO"}
}

const V12_DAILY_POOL := [
	{"id":"walk","title":"NA ESTRADA","desc":"Percorra 3 km em qualquer campanha.","target":3,"stat":"km","reward":35},
	{"id":"rooms","title":"CADA PORTA CONTA","desc":"Vasculhe 4 áreas internas.","target":4,"stat":"rooms","reward":30},
	{"id":"silent","title":"SEM CHAMAR ATENÇÃO","desc":"Passe por 2 perigos de rua sem disparar.","target":2,"stat":"stealth","reward":40},
	{"id":"cook","title":"COMIDA QUENTE","desc":"Prepare 2 refeições.","target":2,"stat":"cook","reward":25},
	{"id":"study","title":"CONHECIMENTO É RECURSO","desc":"Estude por pelo menos 120 minutos.","target":120,"stat":"study_minutes","reward":35},
	{"id":"train","title":"CORPO PREPARADO","desc":"Faça 60 minutos de exercício.","target":60,"stat":"exercise_minutes","reward":30},
	{"id":"help","title":"AINDA SOMOS GENTE","desc":"Ajude 1 sobrevivente ou comunidade.","target":1,"stat":"help","reward":45},
	{"id":"craft","title":"FAÇA VOCÊ MESMO","desc":"Fabrique 2 itens ou projetos.","target":2,"stat":"craft","reward":30},
	{"id":"radio","title":"VOZES NA ESTÁTICA","desc":"Faça 2 varreduras de rádio.","target":2,"stat":"radio","reward":25},
	{"id":"hunt","title":"DO MATO PARA A MESA","desc":"Consiga alimento por caça ou pesca.","target":1,"stat":"hunt","reward":35},
	{"id":"attention","title":"OLHOS ABERTOS","desc":"Use o Modo de Atenção em 3 situações de rua.","target":3,"stat":"attention","reward":35},
	{"id":"safe_return","title":"ANTES QUE ESCUREÇA","desc":"Volte de uma expedição antes do anoitecer.","target":1,"stat":"safe_return","reward":40}
]
const V12_ITEM_ICON_PATHS := {
	"food":"res://assets/icons_v12/food_can.png","water":"res://assets/icons_v12/water_bottle.png","dirty_water":"res://assets/icons_v12/water_bottle.png",
	"med":"res://assets/icons_v12/medkit.png","bandage":"res://assets/icons_v12/medkit.png","wood":"res://assets/icons_v12/wood.png",
	"steel":"res://assets/icons_v12/steel.png","copper":"res://assets/icons_v12/copper.png","wire":"res://assets/icons_v12/wire.png",
	"seeds":"res://assets/icons_v12/seeds.png","fuel":"res://assets/icons_v12/fuel.png","battery":"res://assets/icons_v12/battery.png",
	"electronics":"res://assets/icons_v12/electronics.png","cloth":"res://assets/icons_v12/cloth.png","leather":"res://assets/icons_v12/leather.png",
	"knife":"res://assets/icons_v12/knife2.png","pistol":"res://assets/icons_v12/pistol2.png","book":"res://assets/icons_v12/book.png",
	"nails":"res://assets/icons_v14/nails.png","screws":"res://assets/icons_v14/screws.png","chemicals":"res://assets/icons_v14/chemicals.png","salt":"res://assets/icons_v14/salt.png","coal":"res://assets/icons_v14/coal.png",
	"mechanical":"res://assets/icons_v14/mechanical.png","raw_meat":"res://assets/icons_v14/raw_meat.png","preserved_meat":"res://assets/icons_v14/preserved_meat.png","eggs":"res://assets/icons_v14/eggs.png","vegetables":"res://assets/icons_v14/vegetables.png",
	"battery2":"res://assets/icons_v14/battery2.png","electronics2":"res://assets/icons_v14/electronics2.png"
}

var rng := RandomNumberGenerator.new()
var current_screen := "menu"
var selected_panel := "shelter"
var sound_enabled := true
var master_volume := 0.82
var ambience_volume := 0.68
var radio_volume := 0.72
var effects_volume := 0.78
var selected_character_id := "starter"
var profile_unlocked_characters: Array[String] = ["starter"]
var profile_legacy := {"best_day":0,"best_bosses":0,"best_kills":0,"campaigns_started":0}
var menu_overlay_layer: Control
var menu_rain: TextureRect
var menu_character_label: Label
var menu_save_label: Label
var menu_overlay_return_to_game := false
var pending_recruit_id := ""
var has_save := false
var game_started := false

var day := 1
var hour := 8
var actions_left := 3
var life := 86
var hunger := 22
var thirst := 18
var fatigue := 20
var infection := 4
var morale := 64
var weather := "CHUVA"
var weather_severity := 2
var threat := 18
var survivor_count := 1
var radio_signal := 24
var event_history: Array[String] = []
var event_flags := {}
var lightning_timer := 4.0

# Progressão da campanha. O jogador começa realmente do zero.
var survivor_level := 1
var survivor_xp := 0
var skill_points := 0
var combat_training := 0
var scavenging_skill := 0
var field_medicine := 0
var research_points := 0
var mutation_pressure := 0
var bosses_defeated := 0
var infected_kills := 0
var noise := 0
var current_district := "BAIRRO DO ABRIGO"
var equipped_melee := "MÃOS"
var equipped_firearm := "NENHUMA"
var armor_name := "ROUPA COMUM"
var backpack_level := 0

# Corpo e sobrevivência.
var body_weight := 72.0
var body_fat := 18.0
var strength := 42
var fitness := 42
var energy := 82
var soreness := 0
var stress := 18
var hygiene := 72
var calories_today := 0
var activity_calories := 0
var injuries := {"arm":0,"leg":0,"bleeding":0,"fracture":0}

# Conhecimento, livros e produção.
var skills := {}
var skill_xp := {}
var found_books := {}
var known_books := {}
var known_recipes := {}
var materials := {}
var tools := {}
var facilities := {}
var special_items: Array = []
var traps_set := 0
var wildlife_density := 70
var fish_density := 65
var farm := {"plots":0,"planted":0,"growth":0,"ready":0,"compost":0}
var animals := {"chickens":0,"rabbits":0,"goats":0,"dog":0,"feed":0,"health":100,"eggs":0,"milk":0}

# Comunidade e mundo.
var community_tension := 12
var partner_name := ""
var children: Array = []
var pregnancies: Array = []
var selected_survivor_index := 0
var factions := {}
var world_news_seen: Array = []
var lore_archive: Array = []
var season := "OUTONO"
var temperature := 18
var vehicles := {}
var active_vehicle := ""
var city_projects := {}

var inventory := {
	"knife": 0,
	"pistol": 0,
	"ammo": 0,
	"food": 0,
	"water": 0,
	"dirty_water": 0,
	"med": 0,
	"scrap": 0,
	"cloth": 0,
	"bandage": 0,
	"antibiotic": 0,
	"battery": 0,
	"electronics": 0,
	"fuel": 0,
	"herbs": 0,
	"keycard": 0,
	"samples": 0
}
var upgrades := {"bed": 0, "workbench": 0, "fence": 0, "filter": 0, "infirmary": 0, "radio": 0, "storage": 0}
var visited := {}
var journal: Array[String] = []
var missions: Array = []
var location_states := {}
var room_states := {}
var active_location := ""
var pending_room_location := ""
var pending_room_name := ""
var survivors: Array = []
var discovered_districts := {"BAIRRO DO ABRIGO": true, "CENTRO": false, "ZONA INDUSTRIAL": false, "PERIFERIA": false, "QUARENTENA": false}

var bosses := {
	"O UIVADOR": {"location":"CENTRO", "tier":2, "hp":145, "alive":true, "reward_xp":90, "reward":"Chave do Centro"},
	"O AÇOUGUEIRO": {"location":"ARMAZÉM", "tier":3, "hp":230, "alive":true, "reward_xp":150, "reward":"Projeto de armadura"},
	"A MATRIARCA": {"location":"TÚNEIS", "tier":4, "hp":340, "alive":true, "reward_xp":240, "reward":"Acesso à Quarentena"}
}

var combat_enemy: Dictionary = {}
var combat_location := ""
var combat_is_boss := false
var combat_enemy_hp := 0
var combat_turn := 0
var combat_log: Array[String] = []

var menu_layer: Control
var game_layer: Control
var overlay_layer: Control
var scene_frame: Control
var scene_texture: TextureRect
var rain_layer: TextureRect
var light_layer: ColorRect
var right_panel: Panel
var right_title: Label
var right_subtitle: Label
var right_body: RichTextLabel
var right_actions: VBoxContainer
var inventory_bar: HBoxContainer
var day_label: Label
var time_label: Label
var weather_label: Label
var stat_bars := {}
var stat_values := {}
var action_label: Label
var toast: Label
var modal: Panel
var modal_title: Label
var modal_body: RichTextLabel
var modal_art: TextureRect
var modal_actions: VBoxContainer
var left_buttons := {}
var left_nav_panel: Panel
var bottom_inventory_panel: Panel
var bottom_actions_panel: Panel
var shelter_context_panel: Panel
var shelter_context_label: Label
var shelter_exit_button: Button
var item_slots := {}
var hotspot_buttons: Array[Button] = []
var map_layer: Control
var location_cards: Array[Button] = []
var rain_offset := 0.0
var flicker_clock := 0.0
var rain_audio_player: AudioStreamPlayer
var radio_audio_player: AudioStreamPlayer
var wind_audio_player: AudioStreamPlayer
var v18_ambient_player: AudioStreamPlayer
var v18_ambient_key := ""
var storm_flash: ColorRect

# V17 visual rebuild: contextual navigation instead of a permanent dashboard.
var v17_command_overlay: Control
var v17_command_panel: Panel
var v17_command_grid: GridContainer
var v17_menu_button: Button
var v17_quick_inventory_button: Button

# V8 layers / viagem urbana.
var v8_page_layer: Control
var v8_page_bg: TextureRect
var v8_page_title: Label
var v8_page_subtitle: Label
var v8_page_body: RichTextLabel
var v8_page_actions: VBoxContainer
var v8_page_close: Button
var v8_page_cards: GridContainer
var v8_page_entity: TextureRect
var v8_page_shade: ColorRect
var v8_page_head: Panel
var v8_page_info: Panel
var v8_page_side: Panel
var v8_street_layer: Control
var v8_street_bg: TextureRect
var v8_street_title: Label
var v8_street_status: Label
var v8_street_body: RichTextLabel
var v8_street_actions: VBoxContainer
var v8_street_entity: TextureRect
var v8_selected_inventory_key := ""
var v8_travel_destination := ""
var v8_travel_origin := "ABRIGO"
var v8_travel_route := ""
var v8_travel_segment := 0
var v8_travel_returning := false
var v8_travel_active := false
var v8_travel_event := ""
var v8_resume_after_combat := false
var v8_discovered_micro_locations: Array[String] = []
var v8_route_memory := {}

# V9 persistent simulation.
var detailed_food: Array = []
var room_conditions := {}
var global_events_active := {}
var world_state := {"power_grid":42,"water_safety":48,"refugee_pressure":0,"radio_blackout":0}
var stomach_sick := 0
var current_room_context := {"location":"","room":""}
var survivor_tasks := {}
var community_clues: Array = []
var community_supplies_stolen := 0
# V11 — memória social e rotina do abrigo.
var community_cohesion := 20
var shelter_comfort := 8
var community_memories: Array = []
var routine_history: Array = []
var last_community_scene := ""

# V12 persistent environmental simulation.
var minute := 0
var wind_speed := 12
var wind_direction := "O"
var humidity := 72
var visibility := 92
var wetness := 0
var body_temperature := 36.7
var sunrise_minute := 390
var sunset_minute := 1080
var forecast_text := "Tempo instável."
var diseases := {}
var total_distance_km := 0.0
var expedition_distance_km := 0.0
var profile_name := "SOBREVIVENTE"
var profile_xp := 0
var profile_level := 1
var profile_tokens := 0
var profile_daily_key := ""
var profile_daily_missions: Array = []
var profile_daily_stats := {"km":0.0,"rooms":0,"stealth":0,"cook":0,"study_minutes":0,"exercise_minutes":0,"help":0,"craft":0,"radio":0,"hunt":0,"attention":0,"safe_return":0}
var v12_profile_name_edit: LineEdit

# V13 — storylets persistentes, eventos do abrigo e dossiês visuais.
var v13_pending_event := {}
var v13_event_memory: Array = []
var v13_story_flags := {}
var v13_last_event_day := 0
var v13_event_person := ""
var v13_expedition_start_day := 1
var v13_expedition_start_minute := 420
var v13_expedition_start_thirst := 0
var v13_expedition_start_fatigue := 0
var v13_expedition_start_weight := 0
var v13_attention_scans := {}
var v13_delayed_storylets: Array = []
var v13_last_trip_summary := ""

# V14 — clima histórico, evolução de doenças e cadeias ambientais.
var v14_disease_days := {}
var v14_weather_history: Array = []
var v14_environment_flags := {}
var owned_clothing: Array[String] = ["ROUPA COMUM"]
var equipped_clothing := "ROUPA COMUM"
var clothing_condition := {}

# V16 — manutenção física do abrigo, sono seguro e saúde coletiva avançada.
var shelter_integrity := 82
var shelter_cleanliness := 68
var shelter_heat := 54
var maintenance_debt := 0
var roof_leak := false
var shelter_maintenance_history: Array = []
var v16_story_flags := {}
var v16_last_maintenance_day := 0
var v16_camp_active := false
var v16_camp_name := ""
var v16_camp_quality := 0

# V18 — exploração narrativa, preparo de expedição e combate tático.
var v18_story_flags := {}
var v18_special_rooms_seen := {}
var v18_route_experience := {}
var v18_location_knowledge := {}
var v18_last_prep_score := 0
var v18_last_prep_notes: Array = []
var v18_combat_range := 2 # 3 longe, 2 média, 1 perto, 0 agarrado
var v18_cover := 0
var v18_aim_bonus := 0
var v18_guarding := false

func _base_missions() -> Array:
	return [
		{"id":"wake", "title":"O PRIMEIRO DIA", "desc":"Vasculhe o abrigo e encontre qualquer coisa útil.", "target":1, "current":0, "reward":"Faca improvisada • +10 XP", "done":false},
		{"id":"supplies", "title":"NÃO MORRA DE FOME", "desc":"Consiga 3 unidades de comida para o abrigo.", "target":3, "current":0, "reward":"+8 Moral • +15 XP", "done":false},
		{"id":"signal", "title":"SINAL NA CHUVA", "desc":"Explore 2 locais diferentes e procure pistas do rádio.", "target":2, "current":0, "reward":"Desbloqueia transmissões • +20 XP", "done":false},
		{"id":"fortify", "title":"A NOITE VAI CHEGAR", "desc":"Construa a primeira melhoria da cerca.", "target":1, "current":0, "reward":"Menos risco noturno • +20 XP", "done":false}
	]

func _init_location_states() -> void:
	location_states = {}
	for name in CITY_LOCATIONS:
		var spec: Dictionary = CITY_LOCATIONS[name]
		location_states[name] = {
			"status":"INEXPLORADO",
			"searches_left":int(LOCATION_ROOMS[name].size()),
			"danger":int(spec["risk"]),
			"infestation":0,
			"boss":""
		}
	location_states["CENTRO"]["boss"] = "O UIVADOR"
	location_states["ARMAZÉM"]["boss"] = "O AÇOUGUEIRO"
	location_states["TÚNEIS"]["boss"] = "A MATRIARCA"

func _reset_campaign() -> void:
	# Novo jogo é um reset real: nenhum item ou progresso é herdado.
	if FileAccess.file_exists("user://afterfall_save_v18.json"):
		DirAccess.remove_absolute(ProjectSettings.globalize_path("user://afterfall_save_v18.json"))
	has_save = false
	day = 1
	hour = 7
	minute = 0
	actions_left = 3
	life = 100
	hunger = 18
	thirst = 15
	fatigue = 12
	infection = 0
	morale = 55
	weather = "GAROA"
	weather_severity = 1
	threat = 8
	survivor_count = 1
	radio_signal = 0
	survivor_level = 1
	survivor_xp = 0
	skill_points = 0
	combat_training = 0
	scavenging_skill = 0
	field_medicine = 0
	research_points = 0
	mutation_pressure = 0
	bosses_defeated = 0
	infected_kills = 0
	noise = 0
	current_district = "BAIRRO DO ABRIGO"
	equipped_melee = "MÃOS"
	equipped_firearm = "NENHUMA"
	armor_name = "ROUPA COMUM"
	owned_clothing=["ROUPA COMUM"]; equipped_clothing="ROUPA COMUM"; clothing_condition={"ROUPA COMUM":100}
	backpack_level = 0
	inventory = {"knife":0,"pistol":0,"ammo":0,"food":0,"water":0,"dirty_water":0,"med":0,"scrap":0,"cloth":0,"bandage":0,"antibiotic":0,"battery":0,"electronics":0,"fuel":0,"herbs":0,"keycard":0,"samples":0}
	upgrades = {"bed":0,"workbench":0,"fence":0,"filter":0,"infirmary":0,"radio":0,"storage":0}
	visited = {}
	event_flags = {}
	event_history = ["07:00 • ABRIGO — Você acordou sem suprimentos. A mochila está vazia."]
	journal = ["Dia 1 — acordei sozinho. Não tenho comida, água, arma ou remédio. Preciso procurar qualquer coisa que ainda tenha utilidade."]
	missions = _base_missions()
	survivors = []
	discovered_districts = {"BAIRRO DO ABRIGO":true,"CENTRO":false,"ZONA INDUSTRIAL":false,"QUARENTENA":false}
	for boss_name in bosses:
		bosses[boss_name]["alive"] = true
	_init_location_states()
	room_states = {}
	_v9_init_room_conditions()
	active_location = ""
	pending_room_location = ""
	pending_room_name = ""
	_v7_reset_systems()
	_v10_apply_starter_profile()
	_v9_reset_systems()
	_v12_reset_systems()
	_v13_reset_systems()
	_v16_reset_systems()
	_v18_reset_systems()

func _mutation_tier() -> int:
	if mutation_pressure >= 75 or day >= 22:
		return 4
	if mutation_pressure >= 45 or day >= 13:
		return 3
	if mutation_pressure >= 20 or day >= 6:
		return 2
	return 1

func _v13_condition_penalty(kind: String) -> int:
	var penalty := 0
	for id_v in diseases.keys():
		var id := str(id_v)
		var sev := clampi(int(diseases.get(id, 1)), 1, 3)
		match kind:
			"combat":
				if id == "DESIDRATAÇÃO": penalty += 4 * sev
				elif id == "HIPOTERMIA": penalty += 5 * sev
				elif id == "EXAUSTÃO PELO CALOR": penalty += 4 * sev
				elif id == "INFECÇÃO DE FERIDA": penalty += 3 * sev
				elif id == "INTOXICAÇÃO": penalty += 2 * sev
				elif id == "RESFRIADO": penalty += sev
			"stealth":
				if id == "RESFRIADO": penalty += 7 * sev
				elif id == "DESIDRATAÇÃO": penalty += 4 * sev
				elif id == "HIPOTERMIA": penalty += 4 * sev
				elif id == "EXAUSTÃO PELO CALOR": penalty += 3 * sev
				elif id == "INTOXICAÇÃO": penalty += 2 * sev
			"perception":
				if id == "DESIDRATAÇÃO": penalty += 7 * sev
				elif id == "HIPOTERMIA": penalty += 5 * sev
				elif id == "EXAUSTÃO PELO CALOR": penalty += 5 * sev
				elif id == "INTOXICAÇÃO": penalty += 3 * sev
	return penalty

func _v13_condition_summary() -> String:
	var parts: Array[String] = []
	if not diseases.is_empty():
		parts.append("doença")
	if fatigue >= 75:
		parts.append("exaustão")
	if thirst >= 80:
		parts.append("sede")
	if int(injuries.get("leg", 0)) > 0:
		parts.append("perna ferida")
	return "Sem limitações importantes." if parts.is_empty() else "Limitações: " + ", ".join(parts) + "."

func _player_power() -> int:
	var power := 10 + survivor_level * 5 + combat_training * 7
	if inventory.get("knife", 0) > 0: power += 7
	if inventory.get("pistol", 0) > 0: power += 15
	power += mini(20, int(inventory.get("ammo", 0)))
	power += upgrades.workbench * 4 + upgrades.infirmary * 3
	power += survivor_count * 2
	power += int(strength / 10) + int(fitness / 14) + _v7_gear_bonus()
	if energy < 30: power -= 5
	if injuries.get("arm",0) > 0: power -= 4
	power -= _v13_condition_penalty("combat")
	return maxi(1, power)

func _gain_xp(amount: int) -> void:
	survivor_xp += maxi(0, amount)
	var need := survivor_level * 55
	while survivor_xp >= need:
		survivor_xp -= need
		survivor_level += 1
		skill_points += 1
		morale = mini(100, morale + 4)
		_add_event("PROGRESSO", "Você alcançou o nível %d. Ponto de habilidade +1." % survivor_level)
		_toast("NÍVEL %d • ponto de habilidade +1" % survivor_level)
		need = survivor_level * 55

func _unlock_districts() -> void:
	var center_was := bool(discovered_districts.get("CENTRO", false))
	var industrial_was := bool(discovered_districts.get("ZONA INDUSTRIAL", false))
	var outskirts_was := bool(discovered_districts.get("PERIFERIA", false))
	var quarantine_was := bool(discovered_districts.get("QUARENTENA", false))
	if visited.size() >= 3 or day >= 4:
		discovered_districts["CENTRO"] = true
	if bosses_defeated >= 1:
		discovered_districts["ZONA INDUSTRIAL"] = true
	if bosses_defeated >= 2 or day >= 18:
		discovered_districts["PERIFERIA"] = true
	if bosses_defeated >= 3 or inventory.get("keycard", 0) > 1:
		discovered_districts["QUARENTENA"] = true
	if not center_was and bool(discovered_districts["CENTRO"]):
		_add_event("MAPA", "Uma rota para o Centro foi marcada no diário.")
		_add_mission("boss_uivador", "O SOM NO CENTRO", "Descubra a origem dos uivos no Centro e derrote O Uivador quando estiver preparado.", 1, "Acesso à Zona Industrial • +90 XP")
	if not industrial_was and bool(discovered_districts["ZONA INDUSTRIAL"]):
		_add_event("MAPA", "A queda do Uivador abriu caminho para a Zona Industrial.")
		_add_mission("boss_acougueiro", "CARNE E FERRUGEM", "Entre no Armazém e derrote O Açougueiro.", 1, "Colete reforçado • +150 XP")
	if bosses_defeated >= 2 and not event_flags.get("matriarch_mission", false):
		event_flags["matriarch_mission"] = true
		_add_mission("boss_matriarca", "ABAIXO DA CIDADE", "Entre nos Túneis e derrote A Matriarca.", 1, "Abre a Quarentena • +240 XP")
		_add_event("RÁDIO", "Os sinais mais fortes agora vêm debaixo da cidade.")
	if not outskirts_was and bool(discovered_districts.get("PERIFERIA", false)):
		_add_event("MAPA", "Uma estrada secundária para a Periferia foi marcada. Fazendas, floresta e água voltaram a importar.")
	if not quarantine_was and bool(discovered_districts["QUARENTENA"]):
		_add_event("MAPA", "O mapa agora mostra uma rota até a Área de Quarentena.")
		_add_mission("quarantine", "O ÚLTIMO SINAL", "Chegue ao Laboratório Militar da Quarentena e descubra o que restou do comando de emergência.", 1, "Revela o mapa regional")

func _location_available(name: String) -> bool:
	if not CITY_LOCATIONS.has(name): return false
	var district := str(CITY_LOCATIONS[name]["district"])
	return bool(discovered_districts.get(district, false))

func _location_state_line(name: String) -> String:
	var st: Dictionary = location_states.get(name, {})
	if st.is_empty(): return ""
	var left := int(st.get("searches_left", 0))
	var state := str(st.get("status", "INEXPLORADO"))
	var inf := int(st.get("infestation", 0))
	if left <= 0: state = "SAQUEADO"
	return "%s • buscas %d • infestação %d%%" % [state, left, inf]

func _roll_enemy(location_name: String) -> Dictionary:
	var tier := _mutation_tier()
	var names: Array = MUTATION_NAMES[tier]
	var enemy_name := str(names[rng.randi_range(0, names.size() - 1)])
	var hp := 30
	var damage := 7
	var behavior := "comum"
	match enemy_name:
		"ERRANTE": hp = 28; damage = 6; behavior = "lento"
		"INFECTADO": hp = 34; damage = 7; behavior = "instável"
		"CORREDOR": hp = 34; damage = 11; behavior = "ataca primeiro"
		"CEGO": hp = 46; damage = 9; behavior = "caça pelo som"
		"UIVADOR": hp = 40; damage = 8; behavior = "atrai outros infectados"
		"BRUTAMONTES": hp = 92; damage = 19; behavior = "golpes pesados"
		"CUSPIDOR": hp = 58; damage = 12; behavior = "alta chance de infecção"
		"PARASITADO": hp = 74; damage = 13; behavior = "fica agressivo ferido"
		"CAÇADOR": hp = 96; damage = 20; behavior = "dificulta fuga"
		"ABERRAÇÃO": hp = 122; damage = 23; behavior = "mutação imprevisível"
		"ALFA": hp = 145; damage = 25; behavior = "lidera infectados próximos"
	hp += int(day / 3) * 2
	return {"name":enemy_name,"tier":tier,"hp":hp,"damage":damage,"trait":behavior,"location":location_name}

func _boss_at_location(name: String) -> String:
	var st: Dictionary = location_states.get(name, {})
	var boss_name := str(st.get("boss", ""))
	if boss_name == "" or not bosses.has(boss_name): return ""
	if not bool(bosses[boss_name].get("alive", true)): return ""
	var required_tier := int(bosses[boss_name].get("tier", 2))
	if _mutation_tier() < required_tier: return ""
	return boss_name

func _search_shelter() -> void:
	if event_flags.get("shelter_searched", false):
		_toast("Você já vasculhou tudo que estava ao alcance no abrigo.")
		return
	event_flags["shelter_searched"] = true
	inventory.scrap += 2
	inventory.cloth += 1
	inventory.water += 1
	inventory.knife = 1
	equipped_melee = "FACA IMPROVISADA"
	_mission_progress("wake", 1)
	journal.append("Dia 1 — encontrei uma faca velha, um pouco de água, pano e duas peças de sucata escondidas no abrigo.")
	_add_event("ABRIGO", "Primeira busca: faca improvisada, água x1, tecido x1, sucata x2.")
	_v12_advance_time(35,"vasculhar o abrigo",0.16,false)
	_update_all(); _save_game(); _show_shelter(); _toast("Você encontrou seus primeiros recursos. 35 min passaram.")

func _research_mutations() -> void:
	if inventory.get("samples", 0) <= 0:
		_toast("Você ainda não tem amostras de infectados.")
		return
	var used := mini(3, int(inventory.samples))
	inventory.samples -= used
	research_points += used
	mutation_pressure = maxi(0, mutation_pressure - used * 2)
	_add_event("PESQUISA", "%d amostra(s) analisadas. Você aprendeu mais sobre as mutações." % used)
	_v12_advance_time(35+used*25,"analisar amostras",0.05,false)
	_gain_xp(used * 8)
	_update_all(); _save_game(); _show_research_panel()

func _spend_skill(kind: String) -> void:
	if skill_points <= 0:
		_toast("Você não tem pontos de habilidade.")
		return
	skill_points -= 1
	if kind == "combat": combat_training += 1
	elif kind == "scavenge": scavenging_skill += 1
	elif kind == "medicine": field_medicine += 1
	_gain_xp(2)
	_save_game(); _show_research_panel(); _toast("Habilidade aprimorada.")

func _show_research_panel() -> void:
	map_layer.visible = false
	scene_frame.visible = true
	var tier := _mutation_tier()
	var next_hint := "Errantes ainda dominam as ruas."
	if tier == 2: next_hint = "Corredores, Cegos e Uivadores já foram vistos."
	elif tier == 3: next_hint = "Brutamontes, Cuspidores e Parasitados estão se espalhando."
	elif tier >= 4: next_hint = "A infecção entrou em estágio de aberração."
	var body := "[b]PRESSÃO DA INFECÇÃO[/b] %d/100 • Estágio %d\n[b]Pesquisa[/b] %d • Amostras %d\n[b]Nível[/b] %d • XP %d/%d • Pontos %d\n\n%s\n\nTreino: combate %d • coleta %d • medicina %d\nBosses derrotados: %d/3 • Infectados: %d" % [mutation_pressure, tier, research_points, inventory.get("samples",0), survivor_level, survivor_xp, survivor_level*55, skill_points, next_hint, combat_training, scavenging_skill, field_medicine, bosses_defeated, infected_kills]
	var actions := [["ANALISAR AMOSTRAS", Callable(self,"_research_mutations")]]
	if skill_points > 0:
		actions.append(["TREINAR COMBATE", func(): _spend_skill("combat")])
		actions.append(["TREINAR COLETA", func(): _spend_skill("scavenge")])
	else:
		actions.append(["ABRIGO", Callable(self,"_show_shelter")])
	_set_right_panel("PESQUISA", "ENTENDA O QUE ESTÁ MUDANDO", body, actions)
	_mark_nav("missions")

func _fight_enemy(enemy: Dictionary, location_name: String, is_boss: bool = false) -> void:
	_v12_set_shelter_immersive(false)
	combat_enemy = enemy.duplicate(true)
	combat_location = location_name
	combat_is_boss = is_boss
	combat_enemy_hp = int(enemy.get("hp", 30))
	combat_turn = 1
	var enemy_name:=str(enemy.get("name","INFECTADO")); v18_combat_range=3 if enemy_name in ["CUSPIDOR","UIVADOR"] else (1 if enemy_name=="CORREDOR" else 2); v18_cover=0; v18_aim_bonus=0; v18_guarding=false
	combat_log = ["%s bloqueia seu caminho. Distância: %s." % [enemy_name,_v18_range_name()]]
	_render_combat()

func _combat_melee() -> void:
	if combat_enemy.is_empty(): return
	if v18_combat_range>1:
		_toast("O alvo está longe demais para um golpe. Aproxime-se primeiro."); return
	var dmg: int = 6 + survivor_level * 2 + combat_training * 3
	if inventory.knife > 0: dmg += 8
	dmg -= int(ceil(float(_v13_condition_penalty("combat")) / 3.0)); dmg += rng.randi_range(-2,5); dmg=maxi(2,dmg)
	if v18_combat_range==0: dmg+=4
	combat_enemy_hp=maxi(0,combat_enemy_hp-dmg); noise=mini(100,noise+3); v18_aim_bonus=0
	combat_log.append("Você acerta %s por %d a %s distância."%[str(combat_enemy.name),dmg,_v18_range_name()])
	if combat_enemy_hp<=0: _combat_victory(); return
	_combat_enemy_turn()

func _combat_shoot() -> void:
	if inventory.pistol <= 0 or inventory.ammo <= 0:
		_toast("Você não tem uma arma carregada."); return
	inventory.ammo-=1; noise=mini(100,noise+22); threat=mini(100,threat+2)
	var range_penalty:int = int([-6,0,8,16][clampi(v18_combat_range,0,3)])
	var hit_chance:int = 72+combat_training*5+v18_aim_bonus-range_penalty-int(fatigue/8)-int(_v13_condition_penalty("combat")/2)
	hit_chance=clampi(hit_chance,18,96)
	v18_aim_bonus=0
	if rng.randi_range(1,100)>hit_chance:
		combat_log.append("O tiro erra. O estampido ecoa e a ameaça continua avançando."); _combat_enemy_turn(); return
	var dmg:int=24+survivor_level*2+combat_training*2+int(upgrades.workbench)*2-int(ceil(float(_v13_condition_penalty("combat"))/4.0))+rng.randi_range(-3,8)
	if v18_combat_range==2: dmg+=2
	combat_enemy_hp=maxi(0,combat_enemy_hp-dmg); combat_log.append("O tiro acerta por %d de dano (%d%% de chance)."%[dmg,hit_chance])
	if combat_enemy_hp<=0: _combat_victory(); return
	_combat_enemy_turn()

func _v18_range_name() -> String:
	match v18_combat_range:
		0: return "AGARRADO"
		1: return "PERTO"
		2: return "MÉDIA"
		_: return "LONGE"

func _v18_combat_advance() -> void:
	if combat_enemy.is_empty(): return
	if v18_combat_range<=0: _toast("Você já está colado na ameaça."); return
	v18_combat_range=maxi(0,v18_combat_range-1); fatigue=mini(100,fatigue+2); combat_log.append("Você avança. Distância agora: %s."%_v18_range_name()); _combat_enemy_turn()

func _v18_combat_retreat() -> void:
	if combat_enemy.is_empty(): return
	if v18_combat_range>=3: _toast("Não há mais espaço seguro para recuar."); return
	v18_combat_range=mini(3,v18_combat_range+1); fatigue=mini(100,fatigue+3); combat_log.append("Você recua buscando espaço. Distância: %s."%_v18_range_name()); _combat_enemy_turn()

func _v18_combat_cover() -> void:
	if combat_enemy.is_empty(): return
	var quality:=1
	if combat_location in ["DELEGACIA","HOSPITAL","FÁBRICA","ARMAZÉM","ESTAÇÃO","SUPERMERCADO"]: quality=2
	if rng.randi_range(1,100)<=35+int(skills.get("survival",0))*8: quality=mini(2,quality+1)
	v18_cover=quality; fatigue=mini(100,fatigue+2); combat_log.append("Você encontra cobertura %s."%("SÓLIDA" if quality>=2 else "PARCIAL")); _combat_enemy_turn()

func _v18_combat_aim() -> void:
	if combat_enemy.is_empty(): return
	if inventory.pistol<=0 or inventory.ammo<=0: _toast("Sem arma e munição para mirar."); return
	v18_aim_bonus=mini(35,v18_aim_bonus+22+combat_training*2); combat_log.append("Você controla a respiração e prepara o próximo tiro. Mira +%d."%v18_aim_bonus); _combat_enemy_turn()

func _v18_combat_guard() -> void:
	if combat_enemy.is_empty(): return
	v18_guarding=true; combat_log.append("Você protege cabeça e torso e espera a investida."); _combat_enemy_turn()

func _combat_heal() -> void:
	if inventory.bandage <= 0 and inventory.med <= 0:
		_toast("Nada para tratar o ferimento.")
		return
	if inventory.bandage > 0:
		inventory.bandage -= 1
		life = mini(100, life + 14 + field_medicine * 4)
		combat_log.append("Você improvisa uma bandagem sem tirar os olhos da criatura.")
	else:
		inventory.med -= 1
		life = mini(100, life + 22 + field_medicine * 5)
		infection = maxi(0, infection - 6 - field_medicine * 2)
		combat_log.append("Você usa um remédio em pleno combate.")
	_combat_enemy_turn()

func _combat_flee() -> void:
	var chance:int=48+survivor_level*3-_mutation_tier()*5-int(fatigue/10)-int(ceil(float(_v13_condition_penalty("combat"))/2.0))
	if str(combat_enemy.get("name",""))=="CAÇADOR": chance-=20
	if rng.randi_range(1,100)<=chance:
		combat_log.append("Você encontra uma saída e corre sem olhar para trás."); _add_event(combat_location,"Você fugiu de %s."%str(combat_enemy.name)); combat_enemy={}
		var return_loc:=pending_room_location; pending_room_location=""; pending_room_name=""; _update_all(); _save_game()
		if v8_resume_after_combat:
			v8_resume_after_combat=false; fatigue=mini(100,fatigue+8); _v8_render_street("Você dispara pela rua e só para quando o som da criatura desaparece. Perdeu fôlego, mas retomou a rota.",[["CONTINUAR",Callable(self,"_v8_next_segment")]]); return
		if return_loc!="": _v8_show_page("journal","VOCÊ ESCAPOU","NEM TODA LUTA PRECISA TERMINAR EM MORTE","Você abandonou o confronto e voltou para uma área conhecida do local.",[["VOLTAR AO LOCAL",func(): _show_location_rooms(return_loc)],["VOLTAR AO ABRIGO",Callable(self,"_v8_begin_return_trip")]])
		else: _show_map()
		_toast("Você conseguiu escapar."); return
	combat_log.append("A criatura corta sua rota de fuga."); _combat_enemy_turn()

func _combat_enemy_turn() -> void:
	combat_turn += 1
	var damage: int = int(combat_enemy.get("damage",8)) + rng.randi_range(-2,5)
	var enemy_name := str(combat_enemy.get("name","")); var ranged_enemy:=enemy_name in ["CUSPIDOR","A MATRIARCA"]
	# Criaturas corpo a corpo precisam fechar distância; isso transforma posicionamento em recurso.
	if not ranged_enemy and v18_combat_range>=2:
		var close_by:=2 if enemy_name in ["CORREDOR","CAÇADOR"] else 1; v18_combat_range=maxi(0,v18_combat_range-close_by); combat_log.append("%s avança para %s distância."%[enemy_name,_v18_range_name()]); damage=0 if v18_combat_range>=2 else maxi(2,int(damage*0.55))
	elif ranged_enemy and v18_combat_range<=1:
		v18_combat_range=mini(3,v18_combat_range+1); combat_log.append("%s tenta recuperar distância."%enemy_name); damage=maxi(2,int(damage*0.70))
	if enemy_name == "CORREDOR" and combat_turn == 2: damage += 4
	elif enemy_name == "CEGO":
		if noise <= 12: damage = maxi(1, damage - 4)
		else: damage += 3
	elif enemy_name == "BRUTAMONTES" and combat_turn % 3 == 0: damage += 7
	elif enemy_name == "PARASITADO" and combat_enemy_hp < int(combat_enemy.get("hp",60)) / 2: damage += 4
	elif enemy_name == "UIVADOR" and combat_turn % 2 == 0:
		threat = mini(100, threat + 4)
		combat_log.append("O Uivador chama mais movimento para a região.")
	if ranged_enemy and v18_cover>0: damage=maxi(0,damage-v18_cover*5); combat_log.append("A cobertura absorve parte do ataque.")
	if v18_guarding: damage=int(ceil(float(damage)*0.55)); v18_guarding=false
	damage=maxi(0,damage-_v14_clothing_protection()*2)
	if combat_is_boss and combat_turn % 3 == 0:
		var boss_name := str(combat_enemy.get("name",""))
		if boss_name == "O UIVADOR":
			damage += 5
			threat = mini(100, threat + 8)
			combat_log.append("O Uivador chama infectados nas ruas. A ameaça da região aumenta.")
		elif boss_name == "O AÇOUGUEIRO":
			damage += 9
			combat_log.append("O Açougueiro investe contra você e quebra tudo no caminho.")
		elif boss_name == "A MATRIARCA":
			damage += 7
			infection = mini(100, infection + 4)
			combat_log.append("A Matriarca espalha material infeccioso pelo chão.")
	life = maxi(0, life - damage)
	if damage>0: _v7_combat_injury(damage); _v7_degrade_gear()
	var infection_chance: int = 6 + int(combat_enemy.get("tier",1)) * 7
	if enemy_name == "CUSPIDOR" or enemy_name == "A MATRIARCA": infection_chance += 20
	if damage>0 and rng.randi_range(1,100) <= infection_chance:
		var inf_gain: int = rng.randi_range(1, 3 + int(combat_enemy.get("tier",1)))
		infection = mini(100, infection + inf_gain)
		combat_log.append("O contato aumentou sua infecção em %d." % inf_gain)
	if damage>0: combat_log.append("%s atinge você por %d." % [str(combat_enemy.name), damage])
	else: combat_log.append("%s não consegue alcançar você neste momento."%str(combat_enemy.name))
	if life <= 0 or infection >= 100:
		_save_game(); _game_over(); return
	_render_combat()

func _render_combat() -> void:
	var enemy_name := str(combat_enemy.get("name","INFECTADO"))
	var hp_max := int(combat_enemy.get("hp",30))
	var tail:Array[String]=[]; var start:=maxi(0,combat_log.size()-5)
	for i in range(start,combat_log.size()): tail.append(combat_log[i])
	var log_text:="\n".join(tail); var behavior:=str(combat_enemy.get("trait","desconhecida")); var tier:=int(combat_enemy.get("tier",1))
	var cover_name:="NENHUMA" if v18_cover<=0 else ("PARCIAL" if v18_cover==1 else "SÓLIDA")
	var body := "[b]%s[/b]\nVida da ameaça: %d/%d\nMutação: estágio %d • %s\nDistância: [b]%s[/b] • Cobertura: %s\n\n[b]VOCÊ[/b]\nVida %d • Infecção %d • Energia %d\nMunição %d • Ruído %d • %s\nMira preparada: +%d\n\n[b]ÚLTIMOS MOMENTOS[/b]\n%s" % [enemy_name,combat_enemy_hp,hp_max,tier,behavior,_v18_range_name(),cover_name,life,infection,energy,inventory.ammo,noise,armor_name,v18_aim_bonus,log_text]
	var actions:Array=[]
	if v18_combat_range<=1: actions.append(["ATACAR DE PERTO",Callable(self,"_combat_melee")])
	else: actions.append(["APROXIMAR",Callable(self,"_v18_combat_advance")])
	if inventory.pistol>0 and inventory.ammo>0: actions.append(["ATIRAR",Callable(self,"_combat_shoot")]); actions.append(["MIRAR",Callable(self,"_v18_combat_aim")])
	if v18_combat_range<3: actions.append(["RECUAR / GANHAR ESPAÇO",Callable(self,"_v18_combat_retreat")])
	actions.append(["BUSCAR COBERTURA",Callable(self,"_v18_combat_cover")]); actions.append(["DEFENDER",Callable(self,"_v18_combat_guard")]); actions.append(["TRATAR FERIMENTO",Callable(self,"_combat_heal")]); actions.append(["FUGIR",Callable(self,"_combat_flee")])
	_v8_show_page("journal","COMBATE • TURNO %d"%combat_turn,"%s BLOQUEIA SEU CAMINHO"%enemy_name,body,actions)
	if combat_location!="" and CITY_LOCATIONS.has(combat_location):
		v8_page_bg.texture=_v8_location_texture(combat_location)
	else:
		v8_page_bg.texture=V8_STREET_TEX.get(_v8_street_district(),V8_STREET_TEX["BAIRRO DO ABRIGO"])
	v8_page_body.size=Vector2(390,520)
	v8_page_entity.visible=true; v8_page_entity.position=Vector2(430,180); v8_page_entity.size=Vector2(390,500); v8_page_entity.move_to_front()
	v8_page_entity.texture=V8_ENTITY_TEX["mutant"] if tier>=3 or combat_is_boss else V8_ENTITY_TEX["errante"]
	if v8_page_close != null: v8_page_close.visible=false
	if left_nav_panel != null: left_nav_panel.visible=false

func _combat_victory() -> void:
	var enemy_name:=str(combat_enemy.get("name","INFECTADO")); var tier:=int(combat_enemy.get("tier",1)); infected_kills+=1
	var xp_gain:=12+tier*8; inventory.samples+=1; _mission_progress("samples",1)
	if combat_is_boss:
		xp_gain+=int(combat_enemy.get("reward_xp",70)); inventory.samples+=2
		if bosses.has(enemy_name): bosses[enemy_name]["alive"]=false
		bosses_defeated+=1; mutation_pressure=mini(100,mutation_pressure+6)
		if enemy_name=="O UIVADOR": inventory.keycard+=1; discovered_districts["ZONA INDUSTRIAL"]=true; _mission_progress("boss_uivador",1)
		elif enemy_name=="O AÇOUGUEIRO":
			armor_name="COLETE REFORÇADO"
			equipped_clothing="COLETE REFORÇADO"
			if not owned_clothing.has("COLETE REFORÇADO"):
				owned_clothing.append("COLETE REFORÇADO")
			clothing_condition["COLETE REFORÇADO"]=90
			_mission_progress("boss_acougueiro",1)
		elif enemy_name=="A MATRIARCA": discovered_districts["QUARENTENA"]=true; journal.append("Dia %d — derrotei %s."%[day,enemy_name])
		_add_event("BOSS","%s caiu. %s."%[enemy_name,str(combat_enemy.get("reward","rota liberada"))])
	else:
		_add_event(combat_location,"%s abatido. Uma amostra foi coletada."%enemy_name)
		if location_states.has(combat_location) and str(location_states[combat_location].get("status",""))=="NINHO": _destroy_nest(combat_location)
	_gain_xp(xp_gain); _unlock_districts(); combat_log.append("%s caiu. +%d XP."%[enemy_name,xp_gain]); combat_enemy_hp=0
	var room_result:=""; var return_loc:=pending_room_location
	if not combat_is_boss and pending_room_location!="" and pending_room_name!="": room_result=_complete_room_search(pending_room_location,pending_room_name)
	pending_room_location=""; pending_room_name=""; _update_all(); _save_game()
	var reward_line:="Amostras coletadas: %d\n+%d XP"%[inventory.samples,xp_gain]
	if room_result!="": reward_line+="\n"+room_result
	if combat_is_boss: reward_line+="\n\n[b]BOSS DERROTADO[/b]\nO território e as rotas da cidade podem ter mudado."
	combat_enemy={}; v18_cover=0; v18_aim_bonus=0; v18_guarding=false; v18_combat_range=2; var actions:Array=[]
	if v8_resume_after_combat: actions=[["CONTINUAR O CAMINHO",Callable(self,"_v8_resume_travel_after_combat")],["VOLTAR AO ABRIGO",Callable(self,"_v8_begin_return_trip")]]
	elif return_loc!="": actions=[["CONTINUAR EXPLORANDO",func(): _show_location_rooms(return_loc)],["VOLTAR AO ABRIGO",Callable(self,"_v8_begin_return_trip")],["MAPA",Callable(self,"_show_map")]]
	else: actions=[["MAPA",Callable(self,"_show_map")],["ABRIGO",Callable(self,"_return_from_explore")]]
	_v8_show_page("journal","VITÓRIA","VOCÊ SOBREVIVEU AO CONFRONTO",reward_line,actions)
	v8_page_bg.texture=_v8_location_texture(combat_location) if CITY_LOCATIONS.has(combat_location) else V8_STREET_TEX.get(_v8_street_district(),V8_STREET_TEX["BAIRRO DO ABRIGO"])

func _return_to_map() -> void:
	_close_modal()
	if active_location!="": _show_location_rooms(active_location)
	else: _show_map()

func _boss_encounter(boss_name: String, location_name: String) -> void:
	var b: Dictionary = bosses[boss_name]
	var enemy := {"name":boss_name,"tier":int(b.tier),"hp":int(b.hp),"damage":12 + int(b.tier) * 7,"reward_xp":int(b.reward_xp),"reward":str(b.reward)}
	var power := _player_power()
	_open_modal(boss_name, "[b]AMEAÇA DE BOSS[/b]\n\nA presença dessa criatura mudou toda a região.\n\nPoder recomendado: %d\nSeu poder atual: %d\nVida estimada: %d\n\n[color=#8f2b28]Você pode encontrá-la cedo demais e fugir. Volte melhor equipado.[/color]" % [int(b.hp) - 35, power, int(b.hp)], [["ENFRENTAR", func(): _close_modal(); _fight_enemy(enemy, location_name, true)], ["RECUAR", Callable(self,"_return_to_map")]])
	_show_modal_art(LOCATION_TEX.get(location_name, SHELTER_THUMB))

# -----------------------------------------------------------------------------
# AFTERFALL V19 — immersion rebuild, touch scroll, field map and research
# -----------------------------------------------------------------------------
func _v19_clear_named(parent:Node,prefix:String) -> void:
	for child in parent.get_children():
		if str(child.name).begins_with(prefix): child.queue_free()

func _v19_tip() -> String:
	var tips:Array[String]=[
		"Nem todo infectado precisa morrer. Voltar vivo com o objetivo vale mais que uma luta desnecessária.",
		"Ferramentas barulhentas abrem caminhos rápidos, mas o som continua existindo depois que a porta abre.",
		"Livros, diagramas e equipamentos intactos podem valer mais na bancada de pesquisa do que desmontados na rua.",
		"Chuva piora a visibilidade, mas pode esconder parte do barulho dos seus passos.",
		"Profissões mudam o que um sobrevivente percebe. Um mecânico enxerga peças onde outra pessoa vê sucata.",
		"Peso demais transforma a volta em outra expedição. Deixe espaço para aquilo que você realmente veio buscar.",
		"Uma rota familiar reduz incerteza. Isso não significa que a cidade parou de mudar.",
		"Algumas consequências demoram dias. Nem toda boa decisão parece boa imediatamente.",
		"Voltar antes do anoitecer é uma estratégia. Ficar até tarde também pode ser, se você preparou um ponto seguro.",
		"O abrigo melhora quando aquilo que você encontra lá fora vira algo físico aqui dentro."
	]
	return tips[rng.randi_range(0,tips.size()-1)]

func _v19_hint_once(id:String,message:String) -> void:
	var key:="v19_hint_"+id
	if bool(event_flags.get(key,false)): return
	event_flags[key]=true
	_toast(message)
	_save_game()

func _v19_intro_tutorial() -> void:
	if bool(event_flags.get("v19_tutorial_intro",false)): return
	event_flags["v19_tutorial_intro"]=true
	_save_game()
	_open_modal("PRIMEIRO DIA","[b]VOCÊ NÃO PRECISA DECORAR O JOGO.[/b]\n\nToque nos objetos do abrigo para usá-los. A porta abre o mapa. A bancada guarda pesquisa e projetos. O estoque abre a mochila.\n\nCada viagem gasta [b]tempo, água e condição física[/b]. Dentro dos locais, procure objetos e cômodos que façam sentido — prateleiras, armários, oficinas, veículos, arquivos.\n\nSeu primeiro objetivo é simples: [b]voltar vivo com alguma coisa útil[/b]. Manuais e peças raras podem abrir novas tecnologias.",[["ENTENDI • EXPLORAR O ABRIGO",Callable(self,"_close_modal")],["ABRIR O MAPA",func(): _close_modal(); _show_map()]])

func _v19_current_objective() -> String:
	if not bool(event_flags.get("shelter_searched",false)): return "Examine o abrigo e encontre algo que permita sua primeira saída."
	if not bool(event_flags.get("v19_bp_first_manual",false)): return "Procure comida e conhecimento no Supermercado. O escritório pode guardar mais que mantimentos."
	if int(upgrades.get("workbench",0))<=0: return "Leve sucata e madeira para montar uma Mesa de Estudos no abrigo."
	if not bool(event_flags.get("v19_project_filter",false)): return "Use o manual encontrado para pesquisar um sistema melhor de água."
	if not bool(vehicles.get("CARRO",{}).get("found",false)): return "Siga pistas mecânicas entre Oficina, Posto e Ferro-Velho."
	return "Escolha uma necessidade real do abrigo e planeje a próxima expedição."

func _v19_show_arrival(name:String) -> void:
	var spec:Dictionary=CITY_LOCATIONS.get(name,{})
	var state:=_location_state_line(name)
	var knowledge:=int(v18_location_knowledge.get(name,0))
	var body:="[font_size=22][b]%s[/b][/font_size]\n\n%s\n\n[color=#ad9877]Estado: %s • risco %d/100 • conhecimento local %d[/color]\n\nVocê chegou até aqui. Antes de tocar em qualquer porta, ainda pode decidir como entrar.\n\n[color=#b99a68][b]DICA[/b][/color]  %s"%[name,str(V18_LOCATION_FLAVOR.get(name,"O lugar parece diferente visto de perto.")),state,int(spec.get("risk",0)),knowledge,_v19_tip()]
	_v8_show_page("journal","CHEGADA • "+name,"PARE. OLHE. ESCUTE.",body,[])
	_v9_set_immersive_page(true); v8_page_bg.texture=_v8_location_texture(name); v8_page_shade.color=Color(0.005,0.005,0.004,0.30)
	v8_page_side.visible=true; _v8_clear_actions(v8_page_actions)
	_v17_side_note("ANTES DE ENTRAR","Observar custa tempo, mas pode revelar perigo. Entrar rápido economiza minutos e aumenta ruído.",145)
	_v17_side_button("OBSERVAR A ÁREA • 5 MIN",func(): _v19_enter_location(name,"observe"))
	_v17_side_button("ENTRAR COM CUIDADO",func(): _v19_enter_location(name,"quiet"))
	_v17_side_button("ENTRAR RÁPIDO",func(): _v19_enter_location(name,"fast"))
	_v17_side_button("VOLTAR PELAS RUAS",Callable(self,"_v8_begin_return_trip"))

func _v19_enter_location(name:String,mode:String) -> void:
	match mode:
		"observe":
			_v12_advance_time(5,"observar "+name.to_lower(),0.05,true)
			v18_location_knowledge[name]=int(v18_location_knowledge.get(name,0))+1
			threat=maxi(0,threat-1)
		"quiet":
			noise=maxi(0,noise-2)
			_v12_advance_time(2,"aproximação cuidadosa",0.03,true)
		"fast":
			noise=mini(100,noise+7); fatigue=mini(100,fatigue+1)
	_save_game(); _v8_show_location_screen(name)

func _v19_room_hint(room:String) -> String:
	var r:=room.to_upper()
	if "GARAGEM" in r or "PÁTIO DE CARROS" in r: return "VEÍCULOS / FERRAMENTAS • toque para inspecionar"
	if "ESTOQUE" in r or "DEPÓSITO" in r or "ALMOXARIFADO" in r: return "PRATELEIRAS / ARMÁRIOS • toque para vasculhar"
	if "ESCRITÓRIO" in r or "ARQUIVO" in r or "ESTUDO" in r: return "PAPÉIS / GAVETAS / PISTAS • toque para entrar"
	if "FARMÁCIA" in r or "ENFERMARIA" in r or "CIRURGIA" in r: return "ARMÁRIOS MÉDICOS / EQUIPAMENTO • toque para entrar"
	if "COZINHA" in r or "AÇOUGUE" in r or "CÂMARA" in r: return "ALIMENTOS / RECIPIENTES • toque para examinar"
	if "ELÉTR" in r or "CONTROLE" in r or "TRANSFORM" in r: return "PAINÉIS / CABOS / COMPONENTES • toque para examinar"
	if "BIBLIOTECA" in r or "TÉCNICOS" in r: return "LIVROS / MANUAIS / MAPAS • toque para procurar"
	if "TELHADO" in r or "TORRE" in r: return "PONTO DE OBSERVAÇÃO / SINAL • toque para subir"
	return "OBJETOS E CANTOS AINDA NÃO EXAMINADOS • toque para entrar"

func _v19_unlock_blueprint_from_discovery(location_name:String,room_name:String,chain:String) -> void:
	var bp:=""
	var label:=""
	if chain=="first_manual": bp="first_manual"; label="Caderno de manutenção e filtragem"
	elif chain=="vehicle_parts" or chain=="first_vehicle_parts": bp="vehicle"; label="Conjunto de notas mecânicas"
	elif chain=="surgery_grid": bp="power"; label="Diagrama de energia de emergência"
	elif chain=="sample_14": bp="lab"; label="Procedimento de análise de amostras"
	if bp=="": return
	var key:="v19_bp_"+bp
	if bool(event_flags.get(key,false)): return
	event_flags[key]=true
	research_points+=1
	_add_event("PESQUISA","Conhecimento recuperado: %s. A bancada do abrigo agora pode transformar isso em um projeto."%label)

func _v19_research_projects() -> Array:
	return [
		{"id":"study","name":"MESA DE ESTUDOS","desc":"Organize ferramentas, manuais e peças para transformar descobertas em projetos reproduzíveis.","need":"2 sucata • 2 madeira • 45 min"},
		{"id":"filter","name":"FILTRO DE ÁGUA II","desc":"Camadas substituíveis de carvão e tecido. Água deixa de ser apenas loot e vira infraestrutura.","need":"2 pesquisa • 2 sucata • 1 tecido • 60 min"},
		{"id":"pack","name":"MOCHILA ESTRUTURADA","desc":"Armação reaproveitada distribui melhor o peso e aumenta a capacidade de retorno.","need":"3 pesquisa • 2 tecido • 1 peça mecânica • 70 min"},
		{"id":"generator","name":"GERADOR SILENCIOSO","desc":"Reorganiza admissão e isolamento para manter energia com menos ruído e falhas.","need":"4 pesquisa • 2 peças • 2 eletrônicos • 1 combustível • 90 min"},
		{"id":"fieldlab","name":"KIT DE ANÁLISE","desc":"Microscopia improvisada e reagentes básicos para entender doença e mutação no abrigo.","need":"4 pesquisa • 1 remédio • 1 eletrônico • 75 min"}
	]

func _v19_project_known(id:String) -> bool:
	match id:
		"study": return true
		"filter": return bool(event_flags.get("v19_bp_first_manual",false))
		"pack": return bool(event_flags.get("v19_bp_vehicle",false))
		"generator": return bool(event_flags.get("v19_bp_power",false))
		"fieldlab": return bool(event_flags.get("v19_bp_lab",false))
	return false

func _v19_project_done(id:String) -> bool:
	if id=="study": return int(upgrades.get("workbench",0))>0
	return bool(event_flags.get("v19_project_"+id,false))

func _v19_research_card(project:Dictionary) -> Button:
	var id:=str(project.id); var known:=_v19_project_known(id); var done:=_v19_project_done(id)
	var edge:=GREEN if done else (GOLD if known else Color("#4f4b42"))
	var b:=Button.new(); b.custom_minimum_size=Vector2(360,190); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.disabled=not known or done; b.add_theme_stylebox_override("normal",_flat(Color(0.025,0.022,0.018,0.96),edge,6,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.095,0.064,0.039,0.98),edge.lightened(0.18),6,3))
	var name_l:=Label.new(); name_l.position=Vector2(18,16); name_l.size=Vector2(325,31); name_l.text=str(project.name); name_l.add_theme_font_size_override("font_size",18); name_l.add_theme_color_override("font_color",BONE); name_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(name_l)
	var desc:=Label.new(); desc.position=Vector2(18,54); desc.size=Vector2(325,78); desc.text=str(project.desc) if known else "PROJETO NÃO COMPREENDIDO. Encontre um manual, diagrama ou equipamento relacionado."; desc.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; desc.add_theme_font_size_override("font_size",11); desc.add_theme_color_override("font_color",MUTED); desc.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(desc)
	var need:=Label.new(); need.position=Vector2(18,140); need.size=Vector2(325,36); need.text="CONCLUÍDO" if done else (str(project.need) if known else "CONHECIMENTO AUSENTE"); need.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; need.add_theme_font_size_override("font_size",10); need.add_theme_color_override("font_color",edge.lightened(0.25)); need.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(need)
	if known and not done: b.pressed.connect(func(): _v19_build_project(id))
	return b

func _v19_show_research_bench() -> void:
	_v8_show_page("craft","BANCADA DE PESQUISA","DESCUBRA FORA. ENTENDA AQUI. CONSTRUA DEPOIS.","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["craft"]; v8_page_shade.color=Color(0.006,0.006,0.005,0.42)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_cards.visible=false; v8_page_body.visible=true; v8_page_body.position=Vector2(24,18); v8_page_body.size=Vector2(1060,74)
	v8_page_body.text="[b]Conhecimento disponível: %d[/b] • bancada Nv.%d\nManuais e equipamentos encontrados no mundo liberam projetos. Pesquisar consome tempo da campanha, nunca tempo real."%[research_points,int(upgrades.get("workbench",0))]
	_v19_clear_named(v8_page_info,"V19Research")
	var scroll:=ScrollContainer.new(); scroll.name="V19ResearchScroll"; scroll.position=Vector2(20,102); scroll.size=Vector2(1080,548); scroll.horizontal_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED; scroll.vertical_scroll_mode=ScrollContainer.SCROLL_MODE_AUTO; v8_page_info.add_child(scroll)
	var grid:=GridContainer.new(); grid.columns=2; grid.custom_minimum_size=Vector2(1044,0); grid.add_theme_constant_override("h_separation",14); grid.add_theme_constant_override("v_separation",14); scroll.add_child(grid)
	for project in _v19_research_projects(): grid.add_child(_v19_research_card(project))
	_v8_clear_actions(v8_page_actions); _v17_side_note("COMO APRENDER","Documentos, livros, máquinas e peças intactas podem abrir pesquisas. Nem todo objeto raro deve ser usado imediatamente.",190)
	_v17_side_button("CRAFTING",Callable(self,"_show_crafting_panel")); _v17_side_button("PRODUÇÃO DO ABRIGO",Callable(self,"_show_production_panel")); _v17_side_button("MOCHILA",Callable(self,"_show_inventory_panel")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter"))
	_mark_nav("craft"); _v19_hint_once("research","DICA: alguns itens valem mais como conhecimento. Levar um manual intacto ao abrigo pode mudar toda a campanha.")

func _v19_build_project(id:String) -> void:
	if not _v19_project_known(id): _toast("Você ainda não entende esse projeto."); return
	if _v19_project_done(id): _toast("Projeto já concluído."); return
	match id:
		"study":
			if int(inventory.scrap)<2 or int(materials.wood)<2: _toast("Faltam 2 sucatas e 2 madeiras."); return
			inventory.scrap-=2; materials.wood-=2; upgrades.workbench=maxi(1,int(upgrades.get("workbench",0))); _v12_advance_time(45,"montar mesa de estudos",0.10,true)
		"filter":
			if research_points<2 or int(inventory.scrap)<2 or int(inventory.cloth)<1: _toast("Faltam pesquisa, sucata ou tecido."); return
			research_points-=2; inventory.scrap-=2; inventory.cloth-=1; upgrades.filter=maxi(1,int(upgrades.get("filter",0))); event_flags["v19_project_filter"]=true; _v12_advance_time(60,"pesquisar filtro de água",0.12,true)
		"pack":
			if research_points<3 or int(inventory.cloth)<2 or int(materials.mechanical)<1: _toast("Faltam pesquisa, tecido ou peça mecânica."); return
			research_points-=3; inventory.cloth-=2; materials.mechanical-=1; backpack_level+=1; event_flags["v19_project_pack"]=true; _v12_advance_time(70,"montar mochila estruturada",0.13,true)
		"generator":
			if research_points<4 or int(materials.mechanical)<2 or int(materials.electronics)<2 or int(inventory.fuel)<1: _toast("Faltam pesquisa, peças, eletrônicos ou combustível."); return
			research_points-=4; materials.mechanical-=2; materials.electronics-=2; inventory.fuel-=1; event_flags["v19_project_generator"]=true; radio_signal=mini(100,radio_signal+8); shelter_heat=mini(100,shelter_heat+8); _v12_advance_time(90,"adaptar gerador silencioso",0.16,true)
		"fieldlab":
			if research_points<4 or int(inventory.med)<1 or int(materials.electronics)<1: _toast("Faltam pesquisa, remédio ou eletrônico."); return
			research_points-=4; inventory.med-=1; materials.electronics-=1; event_flags["v19_project_fieldlab"]=true; field_medicine+=1; upgrades.infirmary=maxi(1,int(upgrades.get("infirmary",0))); _v12_advance_time(75,"montar kit de análise",0.13,true)
	_add_event("PESQUISA","Projeto concluído na bancada: %s."%id.to_upper())
	_save_game(); _update_all(); _v19_show_research_bench()

func _ready() -> void:
	rng.randomize()
	_load_profile_settings()
	_load_save_presence()
	_build_root()
	_build_menu()
	_build_game()
	_apply_audio_settings()
	_build_modal()
	_show_menu()
	var args := OS.get_cmdline_user_args()
	if "--preview_v14clothing" in args or "preview_v14clothing" in args:
		_start_new_game(false); owned_clothing=["ROUPA COMUM","JAQUETA DE CHUVA","CASACO DE LÃ","PARKA IMPERMEÁVEL","ROUPA REFORÇADA"]; equipped_clothing="JAQUETA DE CHUVA"; _v14_show_clothing()
	elif "--capture_v14clothing" in args or "capture_v14clothing" in args:
		_start_new_game(false); owned_clothing=["ROUPA COMUM","JAQUETA DE CHUVA","CASACO DE LÃ","PARKA IMPERMEÁVEL","ROUPA REFORÇADA"]; clothing_condition={"ROUPA COMUM":100,"JAQUETA DE CHUVA":78,"CASACO DE LÃ":64,"PARKA IMPERMEÁVEL":91,"ROUPA REFORÇADA":72}; equipped_clothing="PARKA IMPERMEÁVEL"; _v14_show_clothing(); _capture_after_frames("res://capture_v14clothing.png")
	elif "--capture_v14health" in args or "capture_v14health" in args:
		_start_new_game(false); season="INVERNO"; weather="CHUVA"; weather_severity=2; temperature=7; wind_speed=34; wind_direction="SO"; humidity=94; wetness=72; body_temperature=35.5; diseases={"RESFRIADO":2,"IRRITAÇÃO RESPIRATÓRIA":1}; v14_disease_days={"RESFRIADO":3,"IRRITAÇÃO RESPIRATÓRIA":1}; owned_clothing=["ROUPA COMUM","CASACO DE LÃ"]; equipped_clothing="ROUPA COMUM"; _v12_show_health_environment(); _capture_after_frames("res://capture_v14health.png")
	elif "--capture_v14inventory" in args or "capture_v14inventory" in args:
		_start_new_game(false); materials.nails=12; materials.screws=8; materials.chemicals=3; materials.salt=2; materials.coal=5; materials.mechanical=4; materials.raw_meat=2; materials.preserved_meat=1; materials.eggs=4; materials.vegetables=3; materials.battery=2; materials.electronics=2; _show_inventory_panel(); _capture_after_frames("res://capture_v14inventory.png")
	elif "--capture_v16camp" in args or "capture_v16camp" in args:
		_start_new_game(false); hour=21; minute=35; fatigue=81; energy=18; weather="CHUVA"; weather_severity=2; temperature=8; wind_speed=33; skills["survival"]=3; v8_travel_destination="HOSPITAL"; v8_travel_origin="ABRIGO"; v8_travel_route="BECOS"; v8_travel_active=true; v8_travel_segment=2; _v16_open_camp("SALA DOS FUNDOS",64); _capture_after_frames("res://capture_v16camp.png")
	elif "--capture_v16maintenance" in args or "capture_v16maintenance" in args:
		_start_new_game(false); shelter_integrity=43; shelter_cleanliness=37; shelter_heat=28; maintenance_debt=46; roof_leak=true; weather="TEMPORAL"; weather_severity=3; temperature=7; wind_speed=48; materials.wood=5; materials.nails=7; inventory.scrap=6; _v16_show_shelter_maintenance(); _capture_after_frames("res://capture_v16maintenance.png")
	elif "--capture_v16sleep" in args or "capture_v16sleep" in args:
		_start_new_game(false); hour=22; minute=10; threat=58; shelter_integrity=48; shelter_cleanliness=44; shelter_heat=35; weather="CHUVA"; weather_severity=2; survivor_tasks={}; _rest(); _capture_after_frames("res://capture_v16sleep.png")
	elif "--capture_v15forecast" in args or "capture_v15forecast" in args:
		_start_new_game(false); season="INVERNO"; day=27; weather="CHUVA"; weather_severity=2; temperature=8; wind_speed=37; wind_direction="SO"; facilities.weather_station=1; _v15_show_forecast(); _capture_after_frames("res://capture_v15forecast.png")
	elif "--capture_v15quarantine" in args or "capture_v15quarantine" in args:
		_start_new_game(false); survivors=[_v7_make_survivor("MARA","AGRICULTORA",68),_v7_make_survivor("IVO","MECÂNICO",62),_v7_make_survivor("DAVI","SOCORRISTA",72,"PROCURA A IRMÃ")]; survivor_count=4; survivors[0].illness="RESFRIADO"; survivors[0].illness_severity=2; survivors[0].illness_days=3; survivors[0].isolated=true; survivors[2].illness="RESFRIADO"; survivors[2].illness_severity=1; survivors[2].illness_days=1; upgrades.infirmary=1; selected_survivor_index=0; _v15_show_shelter_health(); _capture_after_frames("res://capture_v15quarantine.png")
	elif "--preview_v14room" in args or "preview_v14room" in args:
		_start_new_game(false); discovered_districts["CENTRO"]=true; active_location="HOSPITAL"; room_conditions["HOSPITAL|ENFERMARIA"]["event_done"]=true; _v14_show_room_scene("HOSPITAL","ENFERMARIA")
	elif "--capture_shelter" in args or "capture_shelter" in args:
		_start_new_game(false)
		_capture_after_frames("res://capture_shelter.png")
	elif "--capture_v18prep" in args or "capture_v18prep" in args:
		_start_new_game(false); inventory.water=3; inventory.food=2; inventory.bandage=1; inventory.knife=1; equipped_melee="FACA"; discovered_districts["CENTRO"]=true; _v8_prepare_travel("HOSPITAL"); _capture_after_frames("res://capture_v18prep.png")
	elif "--capture_v18special" in args or "capture_v18special" in args:
		_start_new_game(false); discovered_districts["CENTRO"]=true; active_location="HOSPITAL"; skills["medicine"]=2; _v18_try_special_room("HOSPITAL","CIRURGIA"); _capture_after_frames("res://capture_v18special.png")
	elif "--qa_v18" in args or "qa_v18" in args:
		_run_v18_qa()
	elif "--capture_v17menu" in args or "capture_v17menu" in args:
		_start_new_game(false); _v17_toggle_command_menu(); _capture_after_frames("res://capture_v17menu.png")
	elif "--capture_v17location" in args or "capture_v17location" in args:
		_start_new_game(false); discovered_districts["CENTRO"]=true; active_location="HOSPITAL"; _v8_show_location_screen("HOSPITAL"); _capture_after_frames("res://capture_v17location.png")
	elif "--capture_v17missions" in args or "capture_v17missions" in args:
		_start_new_game(false); missions[0].current=1; missions[0].done=true; missions[1].current=2; _show_missions_panel(); _capture_after_frames("res://capture_v17missions.png")
	elif "--capture_v17radio" in args or "capture_v17radio" in args:
		_start_new_game(false); day=18; radio_signal=61; _v7_generate_world_news(); _show_radio_panel(); _capture_after_frames("res://capture_v17radio.png")
	elif "--capture_v17journal" in args or "capture_v17journal" in args:
		_start_new_game(false); journal=["Dia 1 — você acordou no abrigo sem equipamento útil.","Dia 2 — chuva forte bloqueou a avenida norte.","Dia 3 — uma transmissão mencionou sobreviventes perto da escola.","Dia 4 — o grupo encontrou antibióticos no Hospital Central.","Dia 5 — alguém mexeu no estoque durante a madrugada.","Dia 6 — o primeiro ninho foi identificado no Centro."]; _show_journal_panel(); _capture_after_frames("res://capture_v17journal.png")
	elif "--capture_v17craft" in args or "capture_v17craft" in args:
		_start_new_game(false); _v7_qa_seed(); known_recipes={}; for k in V7_RECIPES.keys(): known_recipes[str(k)]=true; materials.wood=12; materials.nails=10; materials.wire=8; materials.steel=6; inventory.scrap=14; _show_crafting_panel(); _capture_after_frames("res://capture_v17craft.png")
	elif "--capture_menu" in args or "capture_menu" in args:
		_capture_after_frames("res://capture_menu.png")
	elif "--capture_map" in args or "capture_map" in args:
		_start_new_game(false)
		_show_map()
		_capture_after_frames("res://capture_map.png")
	elif "--capture_missions" in args or "capture_missions" in args:
		_start_new_game(false)
		_show_missions_panel()
		_capture_after_frames("res://capture_missions.png")
	elif "--capture_event" in args or "capture_event" in args:
		_start_new_game(false)
		_trigger_story_event("radio_help")
		_capture_after_frames("res://capture_event.png")
	elif "--capture_combat" in args or "capture_combat" in args:
		_start_new_game(false)
		_search_shelter()
		inventory.pistol = 1; inventory.ammo = 8; equipped_firearm = "PISTOLA"
		mutation_pressure = 28
		_fight_enemy({"name":"UIVADOR","tier":2,"hp":64,"damage":10,"trait":"atrai outros infectados"}, "CENTRO", false)
		_capture_after_frames("res://capture_combat.png")
	elif "--capture_rooms" in args or "capture_rooms" in args:
		_start_new_game(false)
		_search_shelter()
		_show_location_rooms("SUPERMERCADO")
		_capture_after_frames("res://capture_rooms.png")
	elif "--capture_latemap" in args or "capture_latemap" in args:
		_start_new_game(false)
		day = 9; mutation_pressure = 36; survivor_level = 4
		discovered_districts["CENTRO"] = true; discovered_districts["ZONA INDUSTRIAL"] = true
		location_states["FARMÁCIA"]["status"] = "SAQUEADO"; location_states["FARMÁCIA"]["searches_left"] = 0
		location_states["ESCOLA"]["status"] = "INFESTADO"; location_states["ESCOLA"]["infestation"] = 53
		location_states["CENTRO"]["status"] = "NINHO"; location_states["CENTRO"]["infestation"] = 78
		_show_map()
		_capture_after_frames("res://capture_latemap.png")
	elif "--capture_v7body" in args or "capture_v7body" in args:
		_start_new_game(false); _show_body_panel(); _capture_after_frames("res://capture_v7body.png")
	elif "--capture_v7production" in args or "capture_v7production" in args:
		_start_new_game(false); _v7_qa_seed(); _show_production_panel(); _capture_after_frames("res://capture_v7production.png")
	elif "--capture_v7community" in args or "capture_v7community" in args:
		_start_new_game(false); _v7_qa_seed(); _show_community_panel(); _capture_after_frames("res://capture_v7community.png")
	elif "--capture_v7world" in args or "capture_v7world" in args:
		_start_new_game(false); day=18; _v7_generate_world_news(); _update_all(); _show_world_panel(); _capture_after_frames("res://capture_v7world.png")
	elif "--capture_v8street" in args or "capture_v8street" in args:
		_start_new_game(false); _search_shelter(); _v8_prepare_travel("SUPERMERCADO"); _v8_start_travel("BECOS"); v8_travel_segment=1; v8_travel_event="lone_zombie"; _v8_render_street("[b]UM INFECTADO PERTO DO CAMINHO[/b]\n\nUm infectado está parado junto a um carro, entre você e a próxima esquina. Ele ainda não percebeu você. A chuva está mascarando seus passos.",[["PASSAR ESCONDIDO",func(): _v8_resolve_stealth("zombie")],["ATACAR EM SILÊNCIO",Callable(self,"_v8_street_silent_attack")],["CONTINUAR SEM DESVIAR",Callable(self,"_v8_street_push_past")],["DAR A VOLTA",Callable(self,"_v8_street_detour")]],"errante"); _capture_after_frames("res://capture_v8street.png")
	elif "--capture_v8map" in args or "capture_v8map" in args:
		_start_new_game(false); day=12; discovered_districts["CENTRO"]=true; discovered_districts["ZONA INDUSTRIAL"]=true; _show_map(); _capture_after_frames("res://capture_v8map.png")
	elif "--capture_v8inventory" in args or "capture_v8inventory" in args:
		_start_new_game(false); _v7_qa_seed(); _show_inventory_panel(); _capture_after_frames("res://capture_v8inventory.png")
	elif "--capture_v8location" in args or "capture_v8location" in args:
		_start_new_game(false); _search_shelter(); active_location="HOSPITAL"; discovered_districts["CENTRO"]=true; _show_location_rooms("HOSPITAL"); _capture_after_frames("res://capture_v8location.png")
	elif "--capture_v8combat" in args or "capture_v8combat" in args:
		_start_new_game(false); _search_shelter(); inventory.pistol=1; inventory.ammo=7; equipped_firearm="PISTOLA"; mutation_pressure=48; _fight_enemy({"name":"CUSPIDOR","tier":3,"hp":88,"damage":13,"trait":"mantém distância e espalha material infeccioso"},"HOSPITAL",false); _capture_after_frames("res://capture_v8combat.png")
	elif "--capture_v9room" in args or "capture_v9room" in args:
		_start_new_game(false); discovered_districts["CENTRO"]=true; active_location="DELEGACIA"; _v9_enter_room("DELEGACIA","ARSENAL"); _capture_after_frames("res://capture_v9room.png")
	elif "--capture_v9food" in args or "capture_v9food" in args:
		_start_new_game(false); _v9_add_food("feijao_lata"); _v9_add_food("carne_fresca",1); _v9_add_food("refeicao_mre"); _v9_add_food("vegetais_frescos",2); _show_food_panel(); _capture_after_frames("res://capture_v9food.png")
	elif "--capture_v9world" in args or "capture_v9world" in args:
		_start_new_game(false); day=18; _v9_world_event_tick(); _v7_generate_world_news(); _show_world_panel(); _capture_after_frames("res://capture_v9world.png")
	elif "--capture_v9community" in args or "capture_v9community" in args:
		_start_new_game(false); survivors=[_v7_make_survivor("MARA","AGRICULTORA",68),_v7_make_survivor("IVO","MECÂNICO",59),_v7_make_survivor("LÚCIA","BATEDORA",47,"EX-INTEGRANTE DA VIGÍLIA")]; survivor_count=4; survivor_tasks={"MARA":"HORTA","IVO":"OFICINA","LÚCIA":"RÁDIO"}; community_clues=["Uma transmissão curta saiu do abrigo durante o turno de LÚCIA."]; _show_community_panel(); _capture_after_frames("res://capture_v9community.png")
	elif "--capture_v10menu" in args or "capture_v10menu" in args:
		_v10_refresh_menu_profile(); _capture_after_frames("res://capture_v10menu.png")
	elif "--capture_v10characters" in args or "capture_v10characters" in args:
		_v10_show_character_roster(); _capture_after_frames("res://capture_v10characters.png")
	elif "--capture_v10settings" in args or "capture_v10settings" in args:
		_menu_settings(); _capture_after_frames("res://capture_v10settings.png")
	elif "--capture_v11community" in args or "capture_v11community" in args:
		_start_new_game(false); survivors=[_v7_make_survivor("MARA","AGRICULTORA",68),_v7_make_survivor("IVO","MECÂNICO",59),_v7_make_survivor("NINA","COZINHEIRA",62)]; survivor_count=4; inventory.food=8; inventory.water=8; community_cohesion=42; _v11_do_routine("cards"); _show_community_panel(); _capture_after_frames("res://capture_v11community.png")
	elif "--capture_v11legacy" in args or "capture_v11legacy" in args:
		profile_legacy={"best_day":34,"best_bosses":2,"best_kills":87,"campaigns_started":3}; profile_unlocked_characters=["starter","mara","davi","ivo"]; _v11_show_legacy(); _capture_after_frames("res://capture_v11legacy.png")
	elif "--capture_v12profile" in args or "capture_v12profile" in args:
		profile_name="NÔMADE"; profile_xp=410; _v12_recalc_profile_level(); _v12_show_profile(); _capture_after_frames("res://capture_v12profile.png")
	elif "--capture_v12daily" in args or "capture_v12daily" in args:
		_v12_ensure_daily_missions(); _v12_show_daily_missions(); _capture_after_frames("res://capture_v12daily.png")
	elif "--capture_v12travel" in args or "capture_v12travel" in args:
		_start_new_game(false); _search_shelter(); hour=17; minute=10; temperature=9; wind_speed=31; wind_direction="SO"; sunset_minute=1083; _v8_prepare_travel("FARMÁCIA"); _capture_after_frames("res://capture_v12travel.png")
	elif "--capture_v12health" in args or "capture_v12health" in args:
		_start_new_game(false); wetness=76; body_temperature=35.4; diseases={"RESFRIADO":1,"HIPOTERMIA":1}; _v12_show_health_environment(); _capture_after_frames("res://capture_v12health.png")
	elif "--capture_v13dossier" in args or "capture_v13dossier" in args:
		_start_new_game(false); survivors=[_v7_make_survivor("MARA","AGRICULTORA",72),_v7_make_survivor("IVO","MECÂNICO",58)]; survivor_count=3; survivor_tasks={"MARA":"HORTA","IVO":"OFICINA"}; community_memories=[{"day":2,"type":"scene","text":"MARA cobriu os canteiros antes do temporal."},{"day":3,"type":"conversation","text":"MARA contou que ainda procura sinais da irmã."}]; selected_survivor_index=0; _v10_show_survivor_dossier(); _capture_after_frames("res://capture_v13dossier.png")
	elif "--capture_v13event" in args or "capture_v13event" in args:
		_start_new_game(false); survivors=[_v7_make_survivor("LÚCIA","BATEDORA",45,"EX-INTEGRANTE DA VIGÍLIA")]; survivor_count=2; community_tension=54; community_clues=["Uma transmissão curta saiu do abrigo durante o turno de LÚCIA."]; _v13_queue_event("suspicion","LÚCIA"); _v13_show_pending_event(); _capture_after_frames("res://capture_v13event.png")
	elif "--capture_v13attention" in args or "capture_v13attention" in args:
		_start_new_game(false); skills["survival"]=3; skills["mechanics"]=2; hour=18; minute=6; v8_travel_destination="FARMÁCIA"; v8_travel_origin="ABRIGO"; v8_travel_route="BECOS"; v8_travel_active=true; v8_travel_segment=1; v8_travel_event="abandoned_car"; _v8_render_street("[b]CARRO ABANDONADO[/b]\n\nA porta do motorista está aberta. Há marcas recentes na lama e algo no banco traseiro.",[["REVISTAR",Callable(self,"_v8_search_car")],["IGNORAR",Callable(self,"_v8_next_segment")]]); _v13_attention_scan(); _capture_after_frames("res://capture_v13attention.png")
	elif "--capture_v13return" in args or "capture_v13return" in args:
		_start_new_game(false); v13_expedition_start_day=1; v13_expedition_start_minute=16*60+20; v13_expedition_start_thirst=22; v13_expedition_start_fatigue=18; v13_expedition_start_weight=5; day=1; hour=20; minute=42; thirst=78; fatigue=72; wetness=66; expedition_distance_km=7.8; v8_travel_origin="HOSPITAL"; v8_travel_returning=true; active_location="HOSPITAL"; _v13_finish_return_trip(); _capture_after_frames("res://capture_v13return.png")
	elif "--qa_v16" in args or "qa_v16" in args:
		_run_v16_qa()
	elif "--qa_v15" in args or "qa_v15" in args:
		_run_v15_qa()
	elif "--qa_v14" in args or "qa_v14" in args:
		_run_v14_qa()
	elif "--qa_v13" in args or "qa_v13" in args:
		_run_v13_qa()
	elif "--qa_v12" in args or "qa_v12" in args:
		_run_v12_qa()
	elif "--qa_v11" in args or "qa_v11" in args:
		_run_v11_qa()
	elif "--qa_v10" in args or "qa_v10" in args:
		_run_v10_qa()
	elif "--qa_v9" in args or "qa_v9" in args:
		_run_v9_qa()
	elif "--qa_v8" in args or "qa_v8" in args:
		_run_v8_qa()
	elif "--qa_v7" in args or "qa_v7" in args:
		_run_v7_qa()
	elif "--qa_campaign" in args or "qa_campaign" in args:
		_run_campaign_qa()
	elif "--qa_all" in args or "qa_all" in args:
		_run_qa()

	_v18_update_ambient_audio()

func _process(delta: float) -> void:
	flicker_clock += delta
	if menu_layer != null and menu_layer.visible and menu_rain != null:
		menu_rain.position.y = -80.0 + fmod(flicker_clock * 38.0, 80.0)
	if not game_layer.visible:
		return
	if rain_layer.visible:
		rain_offset = fmod(rain_offset + delta * (32.0 + float(wind_speed)*0.55), 600.0)
		var wind_sign:=_v14_wind_screen_sign()
		rain_layer.position.y = -30.0 + sin(rain_offset * 0.035) * 4.0
		rain_layer.position.x = -16.0 + wind_sign * float(wind_speed) * 0.18 + sin(rain_offset * 0.022) * (2.0 + float(wind_speed)*0.06)
	if light_layer.visible:
		var pulse := 0.025 + 0.012 * sin(flicker_clock * 8.4) + 0.005 * sin(flicker_clock * 21.0)
		light_layer.color = Color(0.52, 0.28, 0.08, pulse)
	if weather_severity >= 3 and storm_flash != null:
		lightning_timer -= delta
		if lightning_timer <= 0.0:
			storm_flash.color.a = 0.20
			var flash := create_tween()
			flash.tween_property(storm_flash, "color:a", 0.0, 0.22)
			lightning_timer = rng.randf_range(4.5, 9.0)

func _build_root() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var black := ColorRect.new()
	black.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	black.color = BG
	black.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(black)

func _build_menu() -> void:
	menu_layer = Control.new()
	menu_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(menu_layer)

	var bg := TextureRect.new()
	bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	bg.texture = MENU_TEX
	bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bg.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	menu_layer.add_child(bg)

	var shade := ColorRect.new()
	shade.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	shade.color = Color(0.008, 0.008, 0.008, 0.50)
	shade.mouse_filter = Control.MOUSE_FILTER_IGNORE
	menu_layer.add_child(shade)

	menu_rain = TextureRect.new()
	menu_rain.position = Vector2(0,-80)
	menu_rain.size = Vector2(1648,1080)
	menu_rain.texture = RAIN_TEX
	menu_rain.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	menu_rain.stretch_mode = TextureRect.STRETCH_TILE
	menu_rain.modulate = Color(0.75,0.82,0.88,0.12)
	menu_rain.mouse_filter = Control.MOUSE_FILTER_IGNORE
	menu_layer.add_child(menu_rain)

	var grain := TextureRect.new()
	grain.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	grain.texture = GRUNGE_TEX
	grain.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	grain.stretch_mode = TextureRect.STRETCH_TILE
	grain.modulate = Color(1,1,1,0.13)
	grain.mouse_filter = Control.MOUSE_FILTER_IGNORE
	menu_layer.add_child(grain)

	var left_plate:=Panel.new()
	left_plate.position=Vector2(52,38); left_plate.size=Vector2(540,832)
	left_plate.add_theme_stylebox_override("panel",_flat(Color(0.025,0.023,0.020,0.88),Color("#5a5041"),7,2))
	menu_layer.add_child(left_plate)
	_add_texture_backdrop(left_plate,DARK_PANEL_TEX,0.35)

	var logo := Label.new()
	logo.position = Vector2(35, 28); logo.size = Vector2(460, 100)
	logo.text = "AFTERFALL"; logo.add_theme_font_size_override("font_size", 66)
	logo.add_theme_color_override("font_color", Color("#e4dac8")); logo.add_theme_color_override("font_shadow_color", Color.BLACK)
	logo.add_theme_constant_override("shadow_offset_x", 4); logo.add_theme_constant_override("shadow_offset_y", 4)
	left_plate.add_child(logo)
	var sub := Label.new(); sub.position=Vector2(47,111); sub.size=Vector2(420,40); sub.text="B U R I E D   D A Y S"; sub.add_theme_font_size_override("font_size",21); sub.add_theme_color_override("font_color",Color("#c8b69a")); left_plate.add_child(sub)
	var line:=ColorRect.new(); line.position=Vector2(36,158); line.size=Vector2(414,4); line.color=RED; line.mouse_filter=Control.MOUSE_FILTER_IGNORE; left_plate.add_child(line)
	var motto := Label.new(); motto.position=Vector2(38,180); motto.size=Vector2(445,56); motto.text="VOCÊ NÃO ERA UM HERÓI.\nVOCÊ SÓ AINDA ESTÁ VIVO."; motto.add_theme_font_size_override("font_size",16); motto.add_theme_color_override("font_color",Color("#a89a84")); left_plate.add_child(motto)

	var menu_box := VBoxContainer.new(); menu_box.position=Vector2(34,250); menu_box.size=Vector2(458,472); menu_box.add_theme_constant_override("separation",7); left_plate.add_child(menu_box)
	var specs:Array=[
		["CONTINUAR CAMPANHA", Callable(self,"_continue_game")],
		["NOVO JOGO", Callable(self,"_new_game_confirm")],
		["PERFIL", Callable(self,"_v12_show_profile")],
		["DESAFIOS DIÁRIOS", Callable(self,"_v12_show_daily_missions")],
		["PERSONAGENS", Callable(self,"_v10_show_character_roster")],
		["LEGADO", Callable(self,"_v11_show_legacy")],
		["CONFIGURAÇÕES", Callable(self,"_menu_settings")],
		["CRÉDITOS", Callable(self,"_menu_credits")],
		["SAIR", Callable(self,"_quit_game")]
	]
	for spec in specs:
		var b:=_make_dark_button(str(spec[0]),Vector2(448,42)); b.pressed.connect(spec[1]); menu_box.add_child(b)
		if str(spec[0]).begins_with("CONTINUAR") and not has_save: b.disabled=true

	menu_save_label=Label.new(); menu_save_label.position=Vector2(38,705); menu_save_label.size=Vector2(450,50); menu_save_label.add_theme_font_size_override("font_size",14); menu_save_label.add_theme_color_override("font_color",MUTED); left_plate.add_child(menu_save_label)
	var version := Label.new(); version.position=Vector2(38,775); version.size=Vector2(460,35); version.text="V19 • mundo físico, pesquisa, retratos e exploração imersiva"; version.add_theme_font_size_override("font_size",14); version.add_theme_color_override("font_color",Color("#786f61")); left_plate.add_child(version)

	# Dossiê do sobrevivente selecionado — muda quando o jogador escolhe um legado.
	var dossier:=Panel.new(); dossier.position=Vector2(1050,96); dossier.size=Vector2(520,690); dossier.add_theme_stylebox_override("panel",_paper_style()); menu_layer.add_child(dossier); _add_texture_backdrop(dossier,PAPER_PANEL_TEX,0.45)
	var stamp:=Label.new(); stamp.position=Vector2(28,24); stamp.size=Vector2(460,35); stamp.text="DOSSIÊ DE SOBREVIVENTE"; stamp.add_theme_font_size_override("font_size",18); stamp.add_theme_color_override("font_color",INK); dossier.add_child(stamp)
	menu_character_label=Label.new(); menu_character_label.position=Vector2(28,72); menu_character_label.size=Vector2(462,480); menu_character_label.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; menu_character_label.add_theme_font_size_override("font_size",17); menu_character_label.add_theme_color_override("font_color",INK); dossier.add_child(menu_character_label)
	var roster_btn:=_make_dark_button("ABRIR ARQUIVO DE PERSONAGENS",Vector2(440,54)); roster_btn.position=Vector2(38,592); roster_btn.pressed.connect(_v10_show_character_roster); dossier.add_child(roster_btn)

	menu_overlay_layer=Control.new(); menu_overlay_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); menu_overlay_layer.visible=false; menu_layer.add_child(menu_overlay_layer)
	_v10_refresh_menu_profile()

func _build_game() -> void:
	game_layer = Control.new()
	game_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(game_layer)

	var backdrop := ColorRect.new()
	backdrop.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	backdrop.color = BG
	game_layer.add_child(backdrop)

	_build_top_hud()
	_build_left_nav()
	_build_scene_frame()
	_build_right_panel()
	_build_bottom_inventory()
	_build_bottom_actions()
	_build_map_layer()
	_build_v8_layers()
	_build_v17_command_menu()
	_build_ambient_audio()

	var grain := TextureRect.new()
	grain.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	grain.texture = GRUNGE_TEX
	grain.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	grain.stretch_mode = TextureRect.STRETCH_TILE
	grain.modulate = Color(1,1,1,0.055)
	grain.mouse_filter = Control.MOUSE_FILTER_IGNORE
	game_layer.add_child(grain)

	toast = Label.new()
	toast.position = Vector2(330, 700)
	toast.size = Vector2(760, 38)
	toast.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	toast.add_theme_font_size_override("font_size", 17)
	toast.add_theme_color_override("font_color", Color("#c9baa0"))
	toast.add_theme_color_override("font_shadow_color", Color.BLACK)
	toast.add_theme_constant_override("shadow_offset_x", 2)
	toast.add_theme_constant_override("shadow_offset_y", 2)
	toast.mouse_filter = Control.MOUSE_FILTER_IGNORE
	game_layer.add_child(toast)

func _build_top_hud() -> void:
	# Compact survival HUD. The world keeps most of the screen.
	var bar := Panel.new()
	bar.position = Vector2(0, 0)
	bar.size = Vector2(1648, 96)
	bar.add_theme_stylebox_override("panel", _flat(Color(0.018,0.017,0.015,0.98), Color("#40382e"), 0, 2))
	game_layer.add_child(bar)
	_add_texture_backdrop(bar, DARK_PANEL_TEX, 0.42)

	var logo := Label.new()
	logo.position = Vector2(22, 13); logo.size = Vector2(250, 44)
	logo.text = "AFTERFALL"; logo.add_theme_font_size_override("font_size", 34)
	logo.add_theme_color_override("font_color", Color("#e0d5c3")); bar.add_child(logo)
	var sub := Label.new(); sub.position=Vector2(26,57); sub.size=Vector2(230,24); sub.text="B U R I E D   D A Y S"; sub.add_theme_font_size_override("font_size",12); sub.add_theme_color_override("font_color",Color("#9f9078")); bar.add_child(sub)
	var red_line:=ColorRect.new(); red_line.position=Vector2(22,84); red_line.size=Vector2(232,3); red_line.color=RED; red_line.mouse_filter=Control.MOUSE_FILTER_IGNORE; bar.add_child(red_line)

	var clock := Panel.new(); clock.position=Vector2(286,12); clock.size=Vector2(190,72); clock.add_theme_stylebox_override("panel",_flat(Color(0.07,0.06,0.05,0.92),Color("#776955"),4,1)); bar.add_child(clock)
	day_label=Label.new(); day_label.position=Vector2(10,7); day_label.size=Vector2(78,28); day_label.add_theme_font_size_override("font_size",18); day_label.add_theme_color_override("font_color",BONE); clock.add_child(day_label)
	time_label=Label.new(); time_label.position=Vector2(88,7); time_label.size=Vector2(90,28); time_label.horizontal_alignment=HORIZONTAL_ALIGNMENT_RIGHT; time_label.add_theme_font_size_override("font_size",18); time_label.add_theme_color_override("font_color",BONE); clock.add_child(time_label)
	weather_label=Label.new(); weather_label.position=Vector2(10,40); weather_label.size=Vector2(168,24); weather_label.add_theme_font_size_override("font_size",11); weather_label.add_theme_color_override("font_color",Color("#b6a58d")); clock.add_child(weather_label)

	var stats := [
		["life", "VIDA", RED], ["hunger", "FOME", GOLD], ["thirst", "SEDE", BLUE],
		["fatigue", "FADIGA", Color("#918b82")], ["infection", "INFECÇÃO", GREEN], ["morale", "MORAL", Color("#b6aa6d")]
	]
	var x:=492.0
	for s in stats:
		var p:=Panel.new(); p.position=Vector2(x,12); p.size=Vector2(145,72); p.add_theme_stylebox_override("panel",_flat(Color(0.025,0.024,0.021,0.92),Color("#3f3930"),3,1)); bar.add_child(p)
		var ico:=TextureRect.new(); ico.position=Vector2(8,9); ico.size=Vector2(28,28); ico.texture=UI_ICONS[s[0]]; ico.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; ico.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED; ico.mouse_filter=Control.MOUSE_FILTER_IGNORE; p.add_child(ico)
		var name:=Label.new(); name.position=Vector2(40,6); name.size=Vector2(96,20); name.text=s[1]; name.add_theme_font_size_override("font_size",10); name.add_theme_color_override("font_color",MUTED); p.add_child(name)
		var val:=Label.new(); val.position=Vector2(40,25); val.size=Vector2(96,22); val.add_theme_font_size_override("font_size",15); val.add_theme_color_override("font_color",BONE); p.add_child(val); stat_values[s[0]]=val
		var pb:=ProgressBar.new(); pb.position=Vector2(9,53); pb.size=Vector2(127,10); pb.show_percentage=false; pb.min_value=0; pb.max_value=100; pb.add_theme_stylebox_override("background",_flat(Color("#090909"),Color("#4d463c"),1,1)); pb.add_theme_stylebox_override("fill",_flat(s[2],s[2],1,0)); p.add_child(pb); stat_bars[s[0]]=pb
		x+=151.0

	v17_quick_inventory_button=_make_dark_button("MOCHILA",Vector2(106,60)); v17_quick_inventory_button.position=Vector2(1400,18); v17_quick_inventory_button.icon=ICONS["backpack"]; v17_quick_inventory_button.expand_icon=true; v17_quick_inventory_button.pressed.connect(_show_inventory_panel); bar.add_child(v17_quick_inventory_button)
	v17_menu_button=_make_dark_button("MENU",Vector2(106,60)); v17_menu_button.position=Vector2(1518,18); v17_menu_button.icon=ICONS["scrap"]; v17_menu_button.expand_icon=true; v17_menu_button.pressed.connect(_v17_toggle_command_menu); bar.add_child(v17_menu_button)


func _build_left_nav() -> void:
	left_nav_panel = Panel.new()
	var nav := left_nav_panel
	nav.position = Vector2(0, 140)
	nav.size = Vector2(170, 780)
	nav.add_theme_stylebox_override("panel", _flat(Color("#0c0c0b"), Color("#383229"), 0, 2))
	game_layer.add_child(nav)
	_add_texture_backdrop(nav, DARK_PANEL_TEX, 0.55)
	var box := VBoxContainer.new()
	box.position = Vector2(12, 18)
	box.size = Vector2(146, 700)
	box.add_theme_constant_override("separation", 4)
	nav.add_child(box)
	var specs := [
		["ABRIGO", "shelter"], ["MAPA", "map"], ["MISSÕES", "missions"], ["COMUNIDADE", "community"],
		["CORPO", "body"], ["HABILIDADES", "skills"], ["MUNDO", "world"], ["INVENTÁRIO", "inventory"],
		["CRAFTING", "craft"], ["PRODUÇÃO", "production"], ["PESQUISA", "research"], ["DIÁRIO", "journal"]
	]
	for s in specs:
		var key: String = str(s[1])
		var b := _make_nav_button(s[0])
		b.icon = UI_ICONS.get(key, null)
		b.expand_icon = true
		b.pressed.connect(func(): _navigate(key))
		box.add_child(b)
		left_buttons[key] = b

	action_label = Label.new()
	action_label.position = Vector2(16, 708)
	action_label.size = Vector2(138, 58)
	action_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	action_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	action_label.add_theme_font_size_override("font_size", 15)
	action_label.add_theme_color_override("font_color", MUTED)
	nav.add_child(action_label)

func _build_scene_frame() -> void:
	# V17: the shelter itself is the navigation surface.
	scene_frame = Panel.new()
	scene_frame.position = Vector2(0, 96)
	scene_frame.size = Vector2(1648, 824)
	scene_frame.clip_contents = true
	scene_frame.add_theme_stylebox_override("panel", _flat(Color("#070707"), Color("#41382e"), 0, 0))
	game_layer.add_child(scene_frame)

	scene_texture = TextureRect.new(); scene_texture.position=Vector2.ZERO; scene_texture.size=scene_frame.size; scene_texture.texture=SHELTER_TEX; scene_texture.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; scene_texture.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; scene_texture.mouse_filter=Control.MOUSE_FILTER_IGNORE; scene_frame.add_child(scene_texture)

	var cinematic_shade:=ColorRect.new(); cinematic_shade.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); cinematic_shade.color=Color(0.015,0.012,0.01,0.16); cinematic_shade.mouse_filter=Control.MOUSE_FILTER_IGNORE; scene_frame.add_child(cinematic_shade)
	rain_layer=TextureRect.new(); rain_layer.position=Vector2(0,-30); rain_layer.size=Vector2(1648,884); rain_layer.texture=RAIN_TEX; rain_layer.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; rain_layer.stretch_mode=TextureRect.STRETCH_TILE; rain_layer.modulate=Color(0.72,0.78,0.82,0.22); rain_layer.mouse_filter=Control.MOUSE_FILTER_IGNORE; scene_frame.add_child(rain_layer)
	light_layer=ColorRect.new(); light_layer.position=Vector2(430,120); light_layer.size=Vector2(650,520); light_layer.color=Color(0.5,0.28,0.08,0.03); light_layer.mouse_filter=Control.MOUSE_FILTER_IGNORE; scene_frame.add_child(light_layer)
	storm_flash=ColorRect.new(); storm_flash.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); storm_flash.color=Color(0.75,0.86,1.0,0.0); storm_flash.mouse_filter=Control.MOUSE_FILTER_IGNORE; scene_frame.add_child(storm_flash)

	# V18: the approved shelter artwork already labels the real objects. Keep the scene clean
	# and make those physical objects the navigation surface instead of drawing another dashboard.
	_add_shelter_hitbox("CAMA", Rect2(0,315,275,245), Callable(self,"_rest"))
	_add_shelter_hitbox("RÁDIO", Rect2(205,260,175,150), Callable(self,"_show_radio_panel"))
	_add_shelter_hitbox("BANCADA", Rect2(390,255,285,225), Callable(self,"_show_workbench"))
	_add_shelter_hitbox("ESTOQUE", Rect2(680,285,205,250), Callable(self,"_show_inventory_panel"))
	_add_shelter_hitbox("PORTA", Rect2(900,125,170,430), Callable(self,"_show_map"))
	_add_shelter_hitbox("JANELA", Rect2(260,45,300,180), Callable(self,"_window_event"))

	shelter_context_panel=Panel.new(); shelter_context_panel.position=Vector2(24,22); shelter_context_panel.size=Vector2(390,104); shelter_context_panel.add_theme_stylebox_override("panel",_flat(Color(0.018,0.016,0.013,0.76),Color("#7a6b54"),5,1)); scene_frame.add_child(shelter_context_panel)
	shelter_context_label=Label.new(); shelter_context_label.position=Vector2(16,10); shelter_context_label.size=Vector2(356,84); shelter_context_label.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; shelter_context_label.add_theme_font_size_override("font_size",13); shelter_context_label.add_theme_color_override("font_color",BONE); shelter_context_panel.add_child(shelter_context_label)

	shelter_exit_button=_make_dark_button("SAIR • PLANEJAR EXPEDIÇÃO",Vector2(286,58)); shelter_exit_button.position=Vector2(1330,738); shelter_exit_button.icon=UI_ICONS.get("map",null); shelter_exit_button.expand_icon=true; shelter_exit_button.pressed.connect(_show_map); shelter_exit_button.visible=false; scene_frame.add_child(shelter_exit_button)


func _add_shelter_hitbox(label_text:String, rect:Rect2, callback:Callable) -> void:
	# Rects are authored on the old 1080x608 reference grid. Only a subtle focus outline
	# appears on hover/keyboard focus; labels live inside the artwork itself.
	var sx:=scene_frame.size.x/1080.0; var sy:=scene_frame.size.y/608.0
	var actual:=Rect2(Vector2(rect.position.x*sx,rect.position.y*sy),Vector2(rect.size.x*sx,rect.size.y*sy))
	var hit:=Button.new(); hit.position=actual.position; hit.size=actual.size; hit.text=""; hit.focus_mode=Control.FOCUS_ALL; hit.mouse_default_cursor_shape=Control.CURSOR_POINTING_HAND
	hit.add_theme_stylebox_override("normal",_flat(Color(0,0,0,0),Color(0,0,0,0),8,0)); hit.add_theme_stylebox_override("hover",_flat(Color(0.12,0.085,0.045,0.07),Color(0.90,0.72,0.42,0.38),8,2)); hit.add_theme_stylebox_override("focus",_flat(Color(0.12,0.085,0.045,0.05),Color(0.90,0.72,0.42,0.48),8,2))
	hit.tooltip_text=label_text; hit.pressed.connect(callback); scene_frame.add_child(hit); hotspot_buttons.append(hit)

func _add_hotspot(label_text: String, rect: Rect2, callback: Callable) -> void:
	# Rects were authored in the old 1080x608 shelter coordinate space; scale them into V17.
	var sx:=scene_frame.size.x/1080.0; var sy:=scene_frame.size.y/608.0
	var actual:=Rect2(Vector2(rect.position.x*sx,rect.position.y*sy),Vector2(rect.size.x*sx,rect.size.y*sy))
	var hit:=Button.new(); hit.position=actual.position; hit.size=actual.size; hit.text=""; hit.flat=true; hit.focus_mode=Control.FOCUS_NONE; hit.mouse_default_cursor_shape=Control.CURSOR_POINTING_HAND; hit.pressed.connect(callback); hit.add_theme_stylebox_override("hover",_flat(Color(0.12,0.09,0.06,0.12),Color(0.83,0.69,0.46,0.28),5,1)); scene_frame.add_child(hit); hotspot_buttons.append(hit)

	var paths={"CAMA":"res://assets/action_sleep.png","OFICINA":"res://assets/icons_v12/hammer.png","FOGÃO":"res://assets/icons_v12/food_can.png","JANELA":"res://assets/icons_v12/map_pin.png","ARMÁRIO":"res://assets/backpack.png","RÁDIO":"res://assets/icons_v12/radio2.png","VOCÊ":"res://assets/icons_v12/profile.png","MANUTENÇÃO":"res://assets/icons_v12/hammer.png","MURAL":"res://assets/icons/nav_missions.png","ENFERMARIA":"res://assets/icons_v12/medkit.png"}
	var path:=str(paths.get(label_text,"res://assets/backpack.png")); var tex:=load(path) as Texture2D if ResourceLoader.exists(path) else ICONS["backpack"]
	var marker:=Button.new(); marker.position=actual.position+actual.size*0.5-Vector2(72,23); marker.size=Vector2(144,46); marker.text="  "+label_text; marker.icon=tex; marker.expand_icon=true; marker.focus_mode=Control.FOCUS_NONE; marker.alignment=HORIZONTAL_ALIGNMENT_LEFT; marker.add_theme_font_size_override("font_size",12); marker.add_theme_color_override("font_color",Color("#eadfc9")); marker.add_theme_stylebox_override("normal",_flat(Color(0.018,0.016,0.013,0.78),Color("#806f55"),22,1)); marker.add_theme_stylebox_override("hover",_flat(Color(0.11,0.075,0.045,0.95),Color("#d1a85f"),22,2)); marker.add_theme_stylebox_override("pressed",_flat(Color(0.22,0.06,0.04,0.95),RED_BRIGHT,22,2)); marker.mouse_default_cursor_shape=Control.CURSOR_POINTING_HAND; marker.pressed.connect(callback); scene_frame.add_child(marker); hotspot_buttons.append(marker)


func _build_right_panel() -> void:
	right_panel = Panel.new()
	right_panel.position = Vector2(1260, 150)
	right_panel.size = Vector2(368, 590)
	right_panel.add_theme_stylebox_override("panel", _paper_style())
	game_layer.add_child(right_panel)
	_add_texture_backdrop(right_panel, PAPER_PANEL_TEX, 0.46)

	right_title = Label.new()
	right_title.position = Vector2(24, 18)
	right_title.size = Vector2(320, 46)
	right_title.add_theme_font_size_override("font_size", 34)
	right_title.add_theme_color_override("font_color", INK)
	right_panel.add_child(right_title)

	right_subtitle = Label.new()
	right_subtitle.position = Vector2(25, 62)
	right_subtitle.size = Vector2(320, 28)
	right_subtitle.add_theme_font_size_override("font_size", 15)
	right_subtitle.add_theme_color_override("font_color", Color("#4b3d31"))
	right_panel.add_child(right_subtitle)

	var sep := HSeparator.new()
	sep.position = Vector2(24, 96)
	sep.size = Vector2(320, 2)
	right_panel.add_child(sep)

	var thumb := TextureRect.new()
	thumb.position = Vector2(24, 112)
	thumb.size = Vector2(320, 118)
	thumb.texture = SHELTER_THUMB
	thumb.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	thumb.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	thumb.mouse_filter = Control.MOUSE_FILTER_IGNORE
	right_panel.add_child(thumb)

	right_body = RichTextLabel.new()
	right_body.position = Vector2(24, 242)
	right_body.size = Vector2(320, 176)
	right_body.bbcode_enabled = true
	right_body.fit_content = false
	right_body.scroll_active = true
	right_body.add_theme_font_size_override("normal_font_size", 16)
	right_body.add_theme_font_size_override("bold_font_size", 17)
	right_body.add_theme_color_override("default_color", INK)
	right_panel.add_child(right_body)

	right_actions = VBoxContainer.new()
	right_actions.position = Vector2(24, 430)
	right_actions.size = Vector2(320, 135)
	right_actions.add_theme_constant_override("separation", 8)
	right_panel.add_child(right_actions)

func _build_bottom_inventory() -> void:
	bottom_inventory_panel = Panel.new()
	var p := bottom_inventory_panel
	p.position = Vector2(170, 748)
	p.size = Vector2(1080, 172)
	p.add_theme_stylebox_override("panel", _flat(Color("#0b0b0a"), Color("#40382e"), 0, 2))
	game_layer.add_child(p)
	_add_texture_backdrop(p, DARK_PANEL_TEX, 0.52)
	var title := Label.new()
	title.position = Vector2(16, 8)
	title.size = Vector2(240, 30)
	title.text = "INVENTÁRIO RÁPIDO"
	title.add_theme_font_size_override("font_size", 19)
	title.add_theme_color_override("font_color", BONE)
	p.add_child(title)
	inventory_bar = HBoxContainer.new()
	inventory_bar.position = Vector2(16, 44)
	inventory_bar.size = Vector2(1048, 112)
	inventory_bar.add_theme_constant_override("separation", 8)
	p.add_child(inventory_bar)
	for key in ["backpack", "knife", "pistol", "ammo", "food", "water", "med", "scrap", "cloth"]:
		var b := _make_item_slot(key)
		inventory_bar.add_child(b)
		item_slots[key] = b

func _make_item_slot(key: String) -> Button:
	var b := Button.new()
	b.custom_minimum_size = Vector2(104, 104)
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_stylebox_override("normal", _flat(Color("#0d0d0c"), Color("#51483c"), 4, 1))
	b.add_theme_stylebox_override("hover", _flat(Color("#211b16"), Color("#b59a6b"), 4, 2))
	b.add_theme_stylebox_override("pressed", _flat(Color("#2a1715"), RED_BRIGHT, 4, 2))
	var box := VBoxContainer.new()
	box.name = "SlotBox"
	box.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tex := TextureRect.new()
	tex.custom_minimum_size = Vector2(64, 64)
	tex.texture = ICONS.get(key, ICONS["backpack"])
	tex.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tex.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(tex)
	var lab := Label.new()
	lab.name = "Count"
	lab.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lab.add_theme_font_size_override("font_size", 15)
	lab.add_theme_color_override("font_color", BONE)
	box.add_child(lab)
	b.add_child(box)
	b.pressed.connect(func(): _inventory_slot_pressed(key))
	return b

func _build_bottom_actions() -> void:
	bottom_actions_panel = Panel.new()
	var p := bottom_actions_panel
	p.position = Vector2(1260, 748)
	p.size = Vector2(388, 172)
	p.add_theme_stylebox_override("panel", _flat(Color("#0b0b0a"), Color("#40382e"), 0, 2))
	game_layer.add_child(p)
	_add_texture_backdrop(p, DARK_PANEL_TEX, 0.52)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.position = Vector2(14, 13)
	grid.size = Vector2(360, 146)
	grid.add_theme_constant_override("h_separation", 8)
	grid.add_theme_constant_override("v_separation", 8)
	p.add_child(grid)
	for spec in [
		["DORMIR", "sleep", Callable(self,"_rest")], ["MELHORAR", "upgrades", Callable(self,"_show_upgrades_panel")],
		["EXPLORAR", "map", Callable(self,"_show_map")], ["PRÓXIMO DIA", "next", Callable(self,"_end_day")]
	]:
		var b := _make_paper_button(spec[0], Vector2(176, 69))
		b.icon = UI_ICONS.get(spec[1], null)
		b.expand_icon = true
		b.pressed.connect(spec[2])
		grid.add_child(b)

func _build_map_layer() -> void:
	map_layer = Control.new()
	map_layer.position = Vector2(170, 140)
	map_layer.size = Vector2(1080, 608)
	map_layer.visible = false
	game_layer.add_child(map_layer)
	var paper := TextureRect.new()
	paper.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	paper.texture = PAPER_TEX
	paper.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	paper.stretch_mode = TextureRect.STRETCH_TILE
	paper.modulate = Color("#827765")
	map_layer.add_child(paper)
	var dark := ColorRect.new()
	dark.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	dark.color = Color(0.05,0.05,0.045,0.45)
	map_layer.add_child(dark)
	var title := Label.new()
	title.position = Vector2(34, 20)
	title.size = Vector2(590, 48)
	title.text = "CIDADE • MAPA DE SOBREVIVÊNCIA"
	title.add_theme_font_size_override("font_size", 30)
	title.add_theme_color_override("font_color", Color("#eadfc8"))
	map_layer.add_child(title)
	var desc := Label.new()
	desc.position = Vector2(36, 67)
	desc.size = Vector2(990, 58)
	desc.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	desc.text = "Os locais mudam com o tempo: podem ser saqueados, infestados, bloqueados ou virar território de mutantes. Distritos novos abrem conforme você sobrevive e derrota bosses."
	desc.add_theme_font_size_override("font_size", 15)
	desc.add_theme_color_override("font_color", Color("#c2b49e"))
	map_layer.add_child(desc)
	var grid := GridContainer.new()
	grid.columns = 4
	grid.position = Vector2(34, 132)
	grid.size = Vector2(1012, 438)
	grid.add_theme_constant_override("h_separation", 12)
	grid.add_theme_constant_override("v_separation", 12)
	map_layer.add_child(grid)
	for name in CITY_LOCATIONS:
		var b := Button.new()
		b.custom_minimum_size = Vector2(244, 136)
		b.text = ""
		b.focus_mode = Control.FOCUS_NONE
		b.set_meta("location", name)
		b.add_theme_stylebox_override("normal", _flat(Color(0.04,0.04,0.035,0.96), Color("#625746"), 4, 2))
		b.add_theme_stylebox_override("hover", _flat(Color(0.12,0.09,0.07,0.98), Color("#b59a6b"), 4, 2))
		b.add_theme_stylebox_override("pressed", _flat(Color(0.22,0.07,0.06,0.98), RED_BRIGHT, 4, 2))
		var card := VBoxContainer.new()
		card.name = "Card"
		card.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		card.mouse_filter = Control.MOUSE_FILTER_IGNORE
		card.add_theme_constant_override("separation", 0)
		var art := TextureRect.new()
		art.custom_minimum_size = Vector2(240, 78)
		art.texture = _v8_location_texture(name)
		art.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		art.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		art.mouse_filter = Control.MOUSE_FILTER_IGNORE
		card.add_child(art)
		var lab := Label.new()
		lab.name = "LocationLabel"
		lab.custom_minimum_size = Vector2(240, 54)
		lab.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		lab.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		lab.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		lab.add_theme_font_size_override("font_size", 12)
		lab.add_theme_color_override("font_color", Color("#e5d9c0"))
		lab.mouse_filter = Control.MOUSE_FILTER_IGNORE
		card.add_child(lab)
		b.add_child(card)
		b.pressed.connect(func(): _v8_prepare_travel(str(b.get_meta("location"))))
		grid.add_child(b)
		location_cards.append(b)

func _refresh_map_cards() -> void:
	_unlock_districts()
	for b in location_cards:
		var name := str(b.get_meta("location"))
		var lab := b.get_node_or_null("Card/LocationLabel") as Label
		var spec: Dictionary = CITY_LOCATIONS[name]
		var locked := not _location_available(name)
		var district := str(spec["district"])
		var st_line := "BLOQUEADO • %s" % district if locked else _location_state_line(name)
		var boss_name := _boss_at_location(name)
		if boss_name != "": st_line = "⚠ %s • %s" % [boss_name, st_line]
		if lab != null:
			lab.text = "%s\n%s" % [name, st_line]
			lab.add_theme_color_override("font_color", Color("#776f64") if locked else Color("#e5d9c0"))
		b.disabled = false
		if locked:
			b.add_theme_stylebox_override("normal", _flat(Color(0.025,0.025,0.023,0.96), Color("#34302a"), 4, 1))
		else:
			b.add_theme_stylebox_override("normal", _flat(Color(0.04,0.04,0.035,0.96), Color("#625746"), 4, 2))

func _build_v8_layers() -> void:
	# Full-screen activity page below the compact top HUD. It covers the old dashboard panels.
	v8_page_layer = Control.new()
	v8_page_layer.position = Vector2(170, 140)
	v8_page_layer.size = Vector2(1458, 780)
	v8_page_layer.visible = false
	game_layer.add_child(v8_page_layer)

	v8_page_bg = TextureRect.new()
	v8_page_bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	v8_page_bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	v8_page_bg.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	v8_page_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v8_page_layer.add_child(v8_page_bg)
	v8_page_shade = ColorRect.new()
	v8_page_shade.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	v8_page_shade.color = Color(0.015,0.014,0.012,0.54)
	v8_page_shade.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v8_page_layer.add_child(v8_page_shade)
	v8_page_entity=TextureRect.new(); v8_page_entity.position=Vector2(420,170); v8_page_entity.size=Vector2(390,500); v8_page_entity.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; v8_page_entity.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED; v8_page_entity.mouse_filter=Control.MOUSE_FILTER_IGNORE; v8_page_entity.visible=false; v8_page_layer.add_child(v8_page_entity)

	v8_page_head = Panel.new()
	v8_page_head.position = Vector2(24, 20); v8_page_head.size = Vector2(1410, 96)
	v8_page_head.add_theme_stylebox_override("panel", _flat(Color(0.035,0.032,0.027,0.90), Color("#766956"), 5, 2))
	v8_page_layer.add_child(v8_page_head)
	v8_page_title = Label.new(); v8_page_title.position = Vector2(30, 12); v8_page_title.size = Vector2(720, 48)
	v8_page_title.add_theme_font_size_override("font_size", 34); v8_page_title.add_theme_color_override("font_color", BONE); v8_page_head.add_child(v8_page_title)
	v8_page_subtitle = Label.new(); v8_page_subtitle.position = Vector2(32, 57); v8_page_subtitle.size = Vector2(1050, 28)
	v8_page_subtitle.add_theme_font_size_override("font_size", 15); v8_page_subtitle.add_theme_color_override("font_color", MUTED); v8_page_head.add_child(v8_page_subtitle)
	v8_page_close = _make_dark_button("VOLTAR AO ABRIGO", Vector2(250, 54)); v8_page_close.position = Vector2(1130, 21); v8_page_close.pressed.connect(_show_shelter); v8_page_head.add_child(v8_page_close)

	v8_page_info = Panel.new(); v8_page_info.position = Vector2(24, 132); v8_page_info.size = Vector2(900, 620)
	v8_page_info.add_theme_stylebox_override("panel", _flat(Color(0.035,0.032,0.027,0.88), Color("#5f5548"), 5, 2)); v8_page_layer.add_child(v8_page_info)
	v8_page_body = RichTextLabel.new(); v8_page_body.position = Vector2(28, 24); v8_page_body.size = Vector2(844, 566); v8_page_body.bbcode_enabled = true
	v8_page_body.add_theme_font_size_override("normal_font_size", 19); v8_page_body.add_theme_font_size_override("bold_font_size", 21); v8_page_body.add_theme_color_override("default_color", BONE); v8_page_info.add_child(v8_page_body)

	v8_page_side = Panel.new(); v8_page_side.position = Vector2(944, 132); v8_page_side.size = Vector2(490, 620)
	v8_page_side.add_theme_stylebox_override("panel", _flat(Color(0.03,0.028,0.024,0.92), Color("#665a49"), 5, 2)); v8_page_layer.add_child(v8_page_side)
	var al := Label.new(); al.position = Vector2(22,18); al.size = Vector2(430,32); al.text = "AÇÕES"; al.add_theme_font_size_override("font_size", 19); al.add_theme_color_override("font_color", Color("#bba98c")); v8_page_side.add_child(al)
	v8_page_actions = VBoxContainer.new(); v8_page_actions.position = Vector2(22, 62); v8_page_actions.size = Vector2(446, 526); v8_page_actions.add_theme_constant_override("separation", 8); v8_page_side.add_child(v8_page_actions)
	v8_page_cards = GridContainer.new(); v8_page_cards.columns = 3; v8_page_cards.position = Vector2(36, 220); v8_page_cards.size = Vector2(820, 350); v8_page_cards.visible = false; v8_page_info.add_child(v8_page_cards)

	# Street travel uses its own scene instead of a popup/menu.
	v8_street_layer = Control.new(); v8_street_layer.position = Vector2(0,96); v8_street_layer.size = Vector2(1648,824); v8_street_layer.visible = false; game_layer.add_child(v8_street_layer)
	v8_street_bg = TextureRect.new(); v8_street_bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); v8_street_bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE; v8_street_bg.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED; v8_street_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE; v8_street_layer.add_child(v8_street_bg)
	var street_shade := ColorRect.new(); street_shade.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); street_shade.color = Color(0.01,0.01,0.01,0.25); street_shade.mouse_filter = Control.MOUSE_FILTER_IGNORE; v8_street_layer.add_child(street_shade)
	var street_head := Panel.new(); street_head.position = Vector2(22,18); street_head.size = Vector2(1604,92); street_head.add_theme_stylebox_override("panel",_flat(Color(0.025,0.024,0.022,0.88),Color("#756956"),5,2)); v8_street_layer.add_child(street_head)
	v8_street_title=Label.new(); v8_street_title.position=Vector2(26,10); v8_street_title.size=Vector2(760,44); v8_street_title.add_theme_font_size_override("font_size",32); v8_street_title.add_theme_color_override("font_color",BONE); street_head.add_child(v8_street_title)
	v8_street_status=Label.new(); v8_street_status.position=Vector2(28,54); v8_street_status.size=Vector2(1100,26); v8_street_status.add_theme_font_size_override("font_size",15); v8_street_status.add_theme_color_override("font_color",Color("#b4a58d")); street_head.add_child(v8_street_status)
	v8_street_entity=TextureRect.new(); v8_street_entity.position=Vector2(660,165); v8_street_entity.size=Vector2(300,330); v8_street_entity.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; v8_street_entity.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED; v8_street_entity.mouse_filter=Control.MOUSE_FILTER_IGNORE; v8_street_entity.visible=false; v8_street_layer.add_child(v8_street_entity)
	var street_card:=Panel.new(); street_card.position=Vector2(38,480); street_card.size=Vector2(1015,270); street_card.add_theme_stylebox_override("panel",_flat(Color(0.025,0.022,0.019,0.92),Color("#8a7658"),6,2)); v8_street_layer.add_child(street_card)
	v8_street_body=RichTextLabel.new(); v8_street_body.position=Vector2(26,20); v8_street_body.size=Vector2(960,225); v8_street_body.bbcode_enabled=true; v8_street_body.add_theme_font_size_override("normal_font_size",20); v8_street_body.add_theme_font_size_override("bold_font_size",22); v8_street_body.add_theme_color_override("default_color",BONE); street_card.add_child(v8_street_body)
	var street_actions_panel:=Panel.new(); street_actions_panel.position=Vector2(1075,480); street_actions_panel.size=Vector2(535,270); street_actions_panel.add_theme_stylebox_override("panel",_flat(Color(0.025,0.022,0.019,0.94),Color("#8a7658"),6,2)); v8_street_layer.add_child(street_actions_panel)
	v8_street_actions=VBoxContainer.new(); v8_street_actions.position=Vector2(20,18); v8_street_actions.size=Vector2(495,235); v8_street_actions.add_theme_constant_override("separation",8); street_actions_panel.add_child(v8_street_actions)

func _v8_hide_layers() -> void:
	if v8_page_layer != null: v8_page_layer.visible = false
	if v8_street_layer != null: v8_street_layer.visible = false
	if left_nav_panel != null: left_nav_panel.visible = false

func _v8_clear_actions(container: VBoxContainer) -> void:
	for c in container.get_children(): c.queue_free()

func _v8_show_page(key: String, title: String, subtitle: String, body: String, actions: Array) -> void:
	_v12_set_shelter_immersive(false)
	if v8_page_side!=null: v8_page_side.visible=true
	if toast != null: toast.text = ""
	_v9_set_immersive_page(true)
	if left_nav_panel != null: left_nav_panel.visible = false
	if right_panel!=null: right_panel.visible=false
	if bottom_inventory_panel!=null: bottom_inventory_panel.visible=false
	if bottom_actions_panel!=null: bottom_actions_panel.visible=false
	map_layer.visible = false; scene_frame.visible = false
	v8_street_layer.visible = false; v8_page_layer.visible = true
	v8_page_bg.texture = V8_SCREEN_TEX.get(key, V8_SCREEN_TEX["journal"])
	if v8_page_entity != null: v8_page_entity.visible=false
	if v8_page_close != null: v8_page_close.visible=true
	v8_page_title.text = title; v8_page_subtitle.text = subtitle; v8_page_body.visible=true; v8_page_body.text = body
	v8_page_body.position=Vector2(28,24); v8_page_body.size=Vector2(844,566)
	v8_page_cards.position=Vector2(36,220); v8_page_cards.size=Vector2(820,350); v8_page_cards.visible = false
	_v8_clear_actions(v8_page_actions)
	for spec in actions:
		var b := _make_dark_button(str(spec[0]), Vector2(438, 50)); b.pressed.connect(spec[1]); v8_page_actions.add_child(b)

func _v9_set_immersive_page(enabled: bool) -> void:
	if v8_page_layer==null: return
	if left_nav_panel!=null: left_nav_panel.visible=false
	v8_page_layer.position=Vector2(0,96); v8_page_layer.size=Vector2(1648,824)
	v8_page_head.position=Vector2(22,18); v8_page_head.size=Vector2(1604,88); v8_page_close.position=Vector2(1320,17)
	v8_page_info.position=Vector2(34,120); v8_page_info.size=Vector2(1019,674); v8_page_body.size=Vector2(963,620)
	v8_page_side.position=Vector2(1075,120); v8_page_side.size=Vector2(535,674); v8_page_actions.size=Vector2(491,580)
	v8_page_info.add_theme_stylebox_override("panel",_flat(Color(0.022,0.019,0.016,0.70 if enabled else 0.88),Color("#6f604c"),5,2))
	v8_page_side.add_theme_stylebox_override("panel",_flat(Color(0.022,0.019,0.016,0.82 if enabled else 0.92),Color("#78664e"),5,2))
	v8_page_shade.color=Color(0.01,0.01,0.008,0.22 if enabled else 0.42)


func _v8_location_texture(name: String) -> Texture2D:
	if V18_LOCATION_TEX.has(name): return V18_LOCATION_TEX[name]
	if LOCATION_TEX.has(name): return LOCATION_TEX[name]
	match name:
		"HOSPITAL", "FARMÁCIA": return LOCATION_TEX["FARMÁCIA"]
		"BIBLIOTECA", "ESCOLA": return LOCATION_TEX["ESCOLA"]
		"OFICINA", "POSTO", "FÁBRICA", "FERRO-VELHO", "SUBESTAÇÃO", "ARMAZÉM": return LOCATION_TEX["OFICINA"]
		"DELEGACIA", "QUARENTENA", "LABORATÓRIO": return LOCATION_TEX["DELEGACIA"]
		"CENTRO", "ESTAÇÃO": return LOCATION_TEX["CENTRO"]
		"SHOPPING", "SUPERMERCADO", "APARTAMENTOS": return LOCATION_TEX["SUPERMERCADO"]
		"IGREJA", "FAZENDA", "FLORESTA", "LAGO", "SILO": return LOCATION_TEX["ESCOLA"]
	var district:=str(CITY_LOCATIONS.get(name,{}).get("district","BAIRRO DO ABRIGO"))
	if district=="ZONA INDUSTRIAL": return LOCATION_TEX["OFICINA"]
	if district=="CENTRO": return LOCATION_TEX["CENTRO"]
	if district=="QUARENTENA": return LOCATION_TEX["DELEGACIA"]
	if district=="PERIFERIA": return LOCATION_TEX["ESCOLA"]
	return LOCATION_TEX["SUPERMERCADO"]

func _v17_room_texture(location_name:String, room_index:int) -> Texture2D:
	var base:=_v8_location_texture(location_name)
	if base==null: return base
	var w:=base.get_width(); var h:=base.get_height()
	if w<=0 or h<=0: return base
	var cols:=3; var rows:=2; var cw:=maxi(1,int(w/cols)); var ch:=maxi(1,int(h/rows))
	var cell:=room_index%(cols*rows); var cx:=cell%cols; var cy:=int(cell/cols)
	var atlas:=AtlasTexture.new(); atlas.atlas=base; atlas.region=Rect2(cx*cw,cy*ch,cw,ch); return atlas



func _build_v17_command_menu() -> void:
	v17_command_overlay=Control.new(); v17_command_overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); v17_command_overlay.visible=false; game_layer.add_child(v17_command_overlay)
	var shade:=ColorRect.new(); shade.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); shade.color=Color(0,0,0,0.73); shade.mouse_filter=Control.MOUSE_FILTER_STOP; v17_command_overlay.add_child(shade)
	v17_command_panel=Panel.new(); v17_command_panel.position=Vector2(256,128); v17_command_panel.size=Vector2(1136,690); v17_command_panel.add_theme_stylebox_override("panel",_flat(Color(0.025,0.022,0.018,0.97),Color("#817056"),8,2)); v17_command_overlay.add_child(v17_command_panel); _add_texture_backdrop(v17_command_panel,DARK_PANEL_TEX,0.38)
	var title:=Label.new(); title.position=Vector2(40,28); title.size=Vector2(720,48); title.text="CADERNO DE SOBREVIVÊNCIA"; title.add_theme_font_size_override("font_size",32); title.add_theme_color_override("font_color",BONE); v17_command_panel.add_child(title)
	var sub:=Label.new(); sub.position=Vector2(42,76); sub.size=Vector2(820,28); sub.text="Abra apenas o que precisa. O mundo continua do lado de fora."; sub.add_theme_font_size_override("font_size",14); sub.add_theme_color_override("font_color",MUTED); v17_command_panel.add_child(sub)
	var close:=_make_dark_button("FECHAR",Vector2(150,48)); close.position=Vector2(940,30); close.pressed.connect(_v17_close_command_menu); v17_command_panel.add_child(close)
	v17_command_grid=GridContainer.new(); v17_command_grid.columns=3; v17_command_grid.position=Vector2(40,128); v17_command_grid.size=Vector2(1056,500); v17_command_grid.add_theme_constant_override("h_separation",16); v17_command_grid.add_theme_constant_override("v_separation",16); v17_command_panel.add_child(v17_command_grid)
	var entries=[
		["EXPEDIÇÃO","Mapa, rotas, distância e clima","map",Callable(self,"_show_map")],
		["MOCHILA","Itens, equipamento e peso","inventory",Callable(self,"_show_inventory_panel")],
		["MISSÕES","Histórias, contratos e urgências","missions",Callable(self,"_show_missions_panel")],
		["COMUNIDADE","Pessoas, relações e funções","community",Callable(self,"_show_community_panel")],
		["SAÚDE","Corpo, doenças e enfermaria","body",Callable(self,"_v12_show_health_environment")],
		["PESQUISA / OFICINA","Tecnologia, projetos e construção","production",Callable(self,"_v19_show_research_bench")],
		["RÁDIO / MUNDO","Notícias, sinais e facções","world",Callable(self,"_show_radio_panel")],
		["DIÁRIO","Linha do tempo desta campanha","journal",Callable(self,"_show_journal_panel")],
		["PERFIL","Legado, desafios e progresso","profile",Callable(self,"_v12_show_profile")]
	]
	for e in entries:
		var b:=Button.new(); b.custom_minimum_size=Vector2(336,148); b.text=""; b.focus_mode=Control.FOCUS_NONE; b.add_theme_stylebox_override("normal",_flat(Color(0.035,0.031,0.026,0.94),Color("#675b4a"),6,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.105,0.072,0.046,0.98),Color("#c5a16a"),6,3)); b.add_theme_stylebox_override("pressed",_flat(Color(0.18,0.05,0.04,0.98),RED_BRIGHT,6,2))
		var icon:=TextureRect.new(); icon.position=Vector2(18,22); icon.size=Vector2(62,62); icon.texture=UI_ICONS.get(str(e[2]),ICONS["backpack"]); icon.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; icon.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED; icon.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(icon)
		var t:=Label.new(); t.position=Vector2(96,22); t.size=Vector2(220,32); t.text=str(e[0]); t.add_theme_font_size_override("font_size",20); t.add_theme_color_override("font_color",BONE); t.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(t)
		var d:=Label.new(); d.position=Vector2(96,60); d.size=Vector2(220,58); d.text=str(e[1]); d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.add_theme_font_size_override("font_size",12); d.add_theme_color_override("font_color",MUTED); d.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(d)
		var cb:Callable=e[3]; b.pressed.connect(func(): _v17_close_command_menu(); cb.call()); v17_command_grid.add_child(b)

func _v17_toggle_command_menu() -> void:
	if v17_command_overlay==null: return
	v17_command_overlay.visible=not v17_command_overlay.visible

func _v17_close_command_menu() -> void:
	if v17_command_overlay!=null: v17_command_overlay.visible=false

func _build_modal() -> void:
	overlay_layer = Control.new()
	overlay_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay_layer.visible = false
	add_child(overlay_layer)
	var dim := ColorRect.new()
	dim.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	dim.color = Color(0,0,0,0.72)
	dim.mouse_filter = Control.MOUSE_FILTER_STOP
	overlay_layer.add_child(dim)
	modal = Panel.new()
	modal.position = Vector2(454, 176)
	modal.size = Vector2(740, 568)
	modal.add_theme_stylebox_override("panel", _paper_style())
	overlay_layer.add_child(modal)
	var paper_layer := TextureRect.new()
	paper_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	paper_layer.texture = PAPER_PANEL_TEX
	paper_layer.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	paper_layer.stretch_mode = TextureRect.STRETCH_SCALE
	paper_layer.modulate = Color(1,1,1,0.42)
	paper_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	modal.add_child(paper_layer)
	var grime_layer := TextureRect.new()
	grime_layer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	grime_layer.texture = GRUNGE_TEX
	grime_layer.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	grime_layer.stretch_mode = TextureRect.STRETCH_TILE
	grime_layer.modulate = Color(0.30,0.24,0.18,0.16)
	grime_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	modal.add_child(grime_layer)
	var modal_rule := ColorRect.new()
	modal_rule.position = Vector2(24, 73)
	modal_rule.size = Vector2(690, 3)
	modal_rule.color = RED
	modal_rule.mouse_filter = Control.MOUSE_FILTER_IGNORE
	modal.add_child(modal_rule)
	modal_title = Label.new()
	modal_title.position = Vector2(28, 22)
	modal_title.size = Vector2(680, 50)
	modal_title.add_theme_font_size_override("font_size", 34)
	modal_title.add_theme_color_override("font_color", INK)
	modal.add_child(modal_title)
	modal_body = RichTextLabel.new()
	modal_body.position = Vector2(30, 92)
	modal_body.size = Vector2(680, 300)
	modal_body.bbcode_enabled = true
	modal_body.add_theme_font_size_override("normal_font_size", 19)
	modal_body.add_theme_font_size_override("bold_font_size", 20)
	modal_body.add_theme_color_override("default_color", INK)
	modal.add_child(modal_body)
	modal_art = TextureRect.new()
	modal_art.position = Vector2(500, 94)
	modal_art.size = Vector2(205, 128)
	modal_art.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	modal_art.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	modal_art.mouse_filter = Control.MOUSE_FILTER_IGNORE
	modal_art.visible = false
	modal.add_child(modal_art)
	modal_actions = VBoxContainer.new()
	modal_actions.position = Vector2(30, 405)
	modal_actions.size = Vector2(680, 145)
	modal_actions.add_theme_constant_override("separation", 8)
	modal.add_child(modal_actions)

func _add_texture_backdrop(parent: Control, tex: Texture2D, alpha: float = 1.0) -> TextureRect:
	var t := TextureRect.new()
	t.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	t.texture = tex
	t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	t.stretch_mode = TextureRect.STRETCH_SCALE
	t.modulate = Color(1,1,1,alpha)
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(t)
	parent.move_child(t, 0)
	return t

func _make_dark_button(text_value: String, min_size: Vector2) -> Button:
	var b := Button.new()
	b.text = text_value
	b.custom_minimum_size = min_size
	b.focus_mode = Control.FOCUS_NONE
	b.alignment = HORIZONTAL_ALIGNMENT_LEFT
	b.add_theme_font_size_override("font_size", 20)
	b.add_theme_color_override("font_color", BONE)
	b.add_theme_color_override("font_hover_color", Color.WHITE)
	b.add_theme_stylebox_override("normal", _flat(Color(0.03,0.03,0.028,0.90), Color("#5a5145"), 3, 1))
	b.add_theme_stylebox_override("hover", _flat(Color("#321b18"), RED, 3, 2))
	b.add_theme_stylebox_override("pressed", _flat(Color("#4a1f1c"), RED_BRIGHT, 3, 2))
	return b

func _make_nav_button(text_value: String) -> Button:
	var b := _make_dark_button(text_value, Vector2(146, 48))
	b.add_theme_font_size_override("font_size", 15)
	return b

func _make_paper_button(text_value: String, min_size: Vector2) -> Button:
	var b := Button.new()
	b.text = text_value
	b.custom_minimum_size = min_size
	b.focus_mode = Control.FOCUS_NONE
	b.add_theme_font_size_override("font_size", 18)
	b.add_theme_color_override("font_color", INK)
	b.add_theme_stylebox_override("normal", _flat(PAPER_DARK, Color("#1b1713"), 3, 2))
	b.add_theme_stylebox_override("hover", _flat(Color("#d7c5a2"), Color("#7e2c28"), 3, 3))
	b.add_theme_stylebox_override("pressed", _flat(Color("#bca780"), RED, 3, 3))
	return b

func _flat(bg: Color, border: Color, radius: int, width: int) -> StyleBoxFlat:
	var s := StyleBoxFlat.new()
	s.bg_color = bg
	s.border_color = border
	s.set_border_width_all(width)
	s.corner_radius_top_left = radius
	s.corner_radius_top_right = radius
	s.corner_radius_bottom_left = radius
	s.corner_radius_bottom_right = radius
	return s

func _paper_style() -> StyleBoxFlat:
	var s := _flat(PAPER, Color("#17130f"), 3, 5)
	s.shadow_color = Color(0,0,0,0.50)
	s.shadow_size = 8
	return s

func _show_menu() -> void:
	current_screen = "menu"
	menu_layer.visible = true
	game_layer.visible = false
	overlay_layer.visible = false
	if menu_overlay_layer!=null: menu_overlay_layer.visible=false
	_v10_refresh_menu_profile()

func _start_new_game(ask: bool = true) -> void:
	if ask:
		_new_game_confirm()
		return
	profile_legacy["campaigns_started"]=int(profile_legacy.get("campaigns_started",0))+1
	_save_profile_settings()
	_reset_campaign()
	game_started = true
	_show_game()
	_save_game()

func _show_game() -> void:
	current_screen = "game"
	menu_layer.visible = false
	game_layer.visible = true
	overlay_layer.visible = false
	_show_shelter()
	_update_all()
	if not bool(event_flags.get("v19_tutorial_intro",false)):
		call_deferred("_v19_intro_tutorial")

func _continue_game() -> void:
	if not _load_game():
		_open_modal("SEM SAVE", "Nenhum jogo salvo foi encontrado.\n\nComece um novo jogo para criar seu diário de sobrevivência.", [["NOVO JOGO", Callable(self,"_confirm_new_game")], ["VOLTAR", Callable(self,"_close_modal")]])
		return
	game_started = true
	_show_game()

func _new_game_confirm() -> void:
	_v10_show_character_select()

func _confirm_new_game() -> void:
	_close_modal()
	_start_new_game(false)

func _menu_missions() -> void:
	_open_modal("MISSÕES", _missions_bbcode(), [["VOLTAR", Callable(self,"_close_modal")]])

func _menu_settings() -> void:
	menu_overlay_return_to_game = game_layer.visible
	_v10_show_settings_overlay()

func _toggle_sound() -> void:
	sound_enabled = not sound_enabled
	master_volume = 0.82 if sound_enabled else 0.0
	_apply_audio_settings(); _save_profile_settings()

func _menu_credits() -> void:
	_open_modal("CRÉDITOS", "AFTERFALL: BURIED DAYS\n\nProtótipo original de sobrevivência 2D inspirado em jogos de diário pós-apocalíptico.\n\nArte e interface construídas para esta versão.", [["VOLTAR", Callable(self,"_close_modal")]])

func _quit_game() -> void:
	get_tree().quit()

func _navigate(key: String) -> void:
	selected_panel = key
	if key == "shelter": _show_shelter()
	elif key == "map" or key == "explore": _show_map()
	elif key == "missions": _show_missions_panel()
	elif key == "survivors" or key == "community": _show_community_panel()
	elif key == "radio" or key == "world": _show_world_panel()
	elif key == "body": _show_body_panel()
	elif key == "skills": _show_skills_panel()
	elif key == "inventory": _show_inventory_panel()
	elif key == "craft": _show_crafting_panel()
	elif key == "upgrades" or key == "production": _show_production_panel()
	elif key == "research": _show_research_panel()
	elif key == "journal": _show_journal_panel()

func _v12_set_shelter_immersive(enabled: bool) -> void:
	# V17 no longer restores the legacy dashboard.
	if left_nav_panel!=null: left_nav_panel.visible=false
	if right_panel!=null: right_panel.visible=false
	if bottom_inventory_panel!=null: bottom_inventory_panel.visible=false
	if bottom_actions_panel!=null: bottom_actions_panel.visible=false
	if scene_frame!=null:
		scene_frame.position=Vector2(0,96); scene_frame.size=Vector2(1648,824); scene_frame.scale=Vector2.ONE
	if shelter_context_panel!=null: shelter_context_panel.visible=enabled
	if shelter_exit_button!=null: shelter_exit_button.visible=enabled


func _v12_update_shelter_context() -> void:
	if shelter_context_label==null: return
	var state:="CALMO" if threat<35 else ("ATENTO" if threat<65 else "AMEAÇADO")
	var objective:="Vasculhe o abrigo e prepare a primeira saída." if not bool(event_flags.get("shelter_searched",false)) else _v19_current_objective()
	var research_state:="improvisada" if int(upgrades.get("workbench",0))<=0 else ("funcional" if int(upgrades.get("workbench",0))==1 else "avançada")
	shelter_context_label.text="ABRIGO • %s • estrutura %d%%\n%s • %d°C • pesquisa %s\n%s"%[state,shelter_integrity,weather,temperature,research_state,objective]

func _show_shelter() -> void:
	_v17_close_command_menu()
	_v8_hide_layers()
	_v12_set_shelter_immersive(true)
	map_layer.visible = false
	scene_frame.visible = true
	_v12_update_shelter_context()
	_mark_nav("shelter")
	if not v13_pending_event.is_empty(): call_deferred("_v13_show_pending_event")

func _show_map() -> void:
	_v12_set_shelter_immersive(false)
	_v8_show_map_screen()
	_mark_nav("map")

func _show_missions_panel() -> void:
	_v8_show_page("journal", "MISSÕES", "PEQUENAS TAREFAS. GRANDES CONSEQUÊNCIAS.", "Objetivos surgem de pessoas, rádio, abrigo e acontecimentos do mundo. Eles podem expirar, mudar ou voltar mais tarde.", [["MAPA / EXPEDIÇÃO", Callable(self,"_show_map")], ["DIÁRIO", Callable(self,"_show_journal_panel")], ["ABRIGO", Callable(self,"_show_shelter")]])
	_v9_set_immersive_page(true); _mark_nav("missions")
	v8_page_body.position=Vector2(28,22); v8_page_body.size=Vector2(960,82)
	v8_page_cards.visible=true; v8_page_cards.columns=3; v8_page_cards.position=Vector2(28,120); v8_page_cards.size=Vector2(960,520)
	for c in v8_page_cards.get_children(): c.queue_free()
	for m in missions:
		v8_page_cards.add_child(_v17_mission_card(m))

func _v17_mission_card(m:Dictionary) -> Panel:
	var done:=bool(m.get("done",false)); var current:=int(m.get("current",0)); var target:=maxi(1,int(m.get("target",1))); var urgent:=not done and current>0
	var edge:=GREEN if done else (RED_BRIGHT if urgent else Color("#9a8057"))
	var card:=Panel.new(); card.custom_minimum_size=Vector2(300,215); card.add_theme_stylebox_override("panel",_flat(Color(0.88,0.82,0.70,0.93),edge,6,2)); _add_texture_backdrop(card,PAPER_PANEL_TEX,0.32)
	var pin:=ColorRect.new(); pin.position=Vector2(20,12); pin.size=Vector2(10,10); pin.color=edge; pin.mouse_filter=Control.MOUSE_FILTER_IGNORE; card.add_child(pin)
	var title:=Label.new(); title.position=Vector2(38,10); title.size=Vector2(242,34); title.text=str(m.get("title","MISSÃO")); title.add_theme_font_size_override("font_size",17); title.add_theme_color_override("font_color",INK); card.add_child(title)
	var desc:=Label.new(); desc.position=Vector2(20,48); desc.size=Vector2(260,78); desc.text=str(m.get("desc","")); desc.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; desc.add_theme_font_size_override("font_size",12); desc.add_theme_color_override("font_color",Color("#3d342c")); card.add_child(desc)
	var prog:=ProgressBar.new(); prog.position=Vector2(20,132); prog.size=Vector2(260,12); prog.min_value=0; prog.max_value=target; prog.value=current if not done else target; prog.show_percentage=false; prog.add_theme_stylebox_override("background",_flat(Color("#3a332b"),Color("#3a332b"),1,0)); prog.add_theme_stylebox_override("fill",_flat(edge,edge,1,0)); card.add_child(prog)
	var status:=Label.new(); status.position=Vector2(20,150); status.size=Vector2(260,22); status.text="CONCLUÍDA" if done else "%d / %d"%[current,target]; status.add_theme_font_size_override("font_size",11); status.add_theme_color_override("font_color",Color("#51463a")); card.add_child(status)
	var reward:=Label.new(); reward.position=Vector2(20,174); reward.size=Vector2(260,34); reward.text="Recompensa: "+str(m.get("reward","—")); reward.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; reward.add_theme_font_size_override("font_size",10); reward.add_theme_color_override("font_color",Color("#6a5030")); card.add_child(reward)
	return card


func _show_survivors_panel() -> void:
	_show_community_panel()

func _survivor_risk_bonus() -> int:
	var bonus := 0
	for person in survivors:
		if not bool(person.get("alive",true)): continue
		var role := str(person.get("role",""))
		if role == "BATEDORA": bonus += 5
		elif role == "MECÂNICO": bonus += 1
	return bonus

func _apply_survivor_bonuses() -> void:
	for person in survivors:
		if not bool(person.get("alive",true)): continue
		var role := str(person.get("role",""))
		if role == "SOCORRISTA" and life < 100:
			life = mini(100, life + 4)
		elif role == "MECÂNICO" and rng.randi_range(1,100) <= 25:
			inventory.scrap += 1
			_add_event("OFICINA", "%s reaproveitou uma peça durante a noite. +1 sucata." % str(person.get("name","Mecânico")))

func _show_radio_panel() -> void:
	_v17_show_radio_visual()

func _v12_icon(key:String,fallback:Texture2D) -> Texture2D:
	var path:=str(V12_ITEM_ICON_PATHS.get(key,""))
	if path!="":
		var tex:=_v13_runtime_png(path); if tex!=null: return tex
	return fallback

func _show_inventory_panel() -> void:
	_v8_show_page("inventory","MOCHILA / EQUIPAMENTO","O QUE VOCÊ CARREGA MUDA COMO VOCÊ SOBREVIVE","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["inventory"]; v8_page_shade.color=Color(0.008,0.008,0.007,0.50)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_cards.visible=false
	_v19_clear_named(v8_page_info,"V19Inventory")
	var weight_now:=_total_weight(); var weight_max:=_max_weight(); var load_state:="LEVE" if weight_now<float(weight_max)*0.55 else ("PESADA" if weight_now<float(weight_max)*0.90 else "SOBRECARGA")
	var profile:=Panel.new(); profile.name="V19InventoryProfile"; profile.position=Vector2(20,20); profile.size=Vector2(286,620); profile.add_theme_stylebox_override("panel",_flat(Color(0.018,0.017,0.015,0.91),Color("#665946"),6,2)); v8_page_info.add_child(profile)
	var portrait:=TextureRect.new(); portrait.position=Vector2(27,24); portrait.size=Vector2(232,230); portrait.texture=_v12_portrait_texture(selected_character_id); portrait.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; portrait.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; portrait.mouse_filter=Control.MOUSE_FILTER_IGNORE; profile.add_child(portrait)
	var shade:=ColorRect.new(); shade.position=Vector2(27,194); shade.size=Vector2(232,60); shade.color=Color(0,0,0,0.62); shade.mouse_filter=Control.MOUSE_FILTER_IGNORE; profile.add_child(shade)
	var who:=Label.new(); who.position=Vector2(38,203); who.size=Vector2(210,44); who.text=str(_v10_get_selected_character().get("name","SOBREVIVENTE")); who.add_theme_font_size_override("font_size",19); who.add_theme_color_override("font_color",BONE); who.mouse_filter=Control.MOUSE_FILTER_IGNORE; profile.add_child(who)
	var info:=RichTextLabel.new(); info.position=Vector2(24,278); info.size=Vector2(238,314); info.bbcode_enabled=true; info.add_theme_font_size_override("normal_font_size",15); info.add_theme_color_override("default_color",BONE); info.text="[b]ARMA[/b]  %s\n[b]CORPO A CORPO[/b]  %s\n[b]ROUPA[/b]  %s • %d%%\n\n[b]MOCHILA Nv.%d[/b]\n%d / %d kg • [color=#c7a36a]%s[/color]\n\n[color=#938673]Peso alto aumenta fadiga, viagem e ruído. Arraste a lista ao lado para ver todos os itens.[/color]"%[equipped_firearm,equipped_melee,equipped_clothing,int(clothing_condition.get(equipped_clothing,100)),backpack_level,weight_now,weight_max,load_state]; profile.add_child(info)
	var scroll:=ScrollContainer.new(); scroll.name="V19InventoryScroll"; scroll.position=Vector2(320,20); scroll.size=Vector2(780,620); scroll.horizontal_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED; scroll.vertical_scroll_mode=ScrollContainer.SCROLL_MODE_AUTO; v8_page_info.add_child(scroll)
	var grid:=GridContainer.new(); grid.name="V19InventoryGrid"; grid.columns=4; grid.custom_minimum_size=Vector2(744,0); grid.add_theme_constant_override("h_separation",10); grid.add_theme_constant_override("v_separation",10); scroll.add_child(grid)
	var specs:Array=[
		["knife","FACA",int(inventory.knife),_v12_icon("knife",ICONS["knife"])],["pistol","PISTOLA",int(inventory.pistol),_v12_icon("pistol",ICONS["pistol"])],["ammo","MUNIÇÃO",int(inventory.ammo),ICONS["ammo"]],["food","COMIDA",int(inventory.food),_v12_icon("food",ICONS["food"])],
		["water","ÁGUA",int(inventory.water),_v12_icon("water",ICONS["water"])],["dirty_water","ÁGUA SUJA",int(inventory.dirty_water),_v12_icon("dirty_water",ICONS["water"])],["med","REMÉDIO",int(inventory.med),_v12_icon("med",ICONS["med"])],["bandage","BANDAGEM",int(inventory.bandage),_v12_icon("med",ICONS["med"])],
		["wood","MADEIRA",int(materials.wood),_v12_icon("wood",ICONS["scrap"])],["nails","PREGOS",int(materials.nails),_v12_icon("nails",ICONS["scrap"])],["wire","FIO",int(materials.wire),_v12_icon("wire",ICONS["scrap"])],["steel","AÇO",int(materials.steel),_v12_icon("steel",ICONS["scrap"])],
		["mechanical","PEÇAS",int(materials.mechanical),_v12_icon("mechanical",ICONS["scrap"])],["electronics","ELETRÔNICOS",int(materials.electronics),_v12_icon("electronics2",ICONS["scrap"])],["raw_meat","CARNE CRUA",int(materials.raw_meat),_v12_icon("raw_meat",ICONS["food"])],["vegetables","VEGETAIS",int(materials.vegetables),_v12_icon("vegetables",ICONS["food"])],
		["cloth","TECIDO",int(inventory.cloth),_v12_icon("cloth",ICONS["cloth"])],["fuel","COMBUSTÍVEL",int(inventory.fuel),_v12_icon("fuel",ICONS["water"])],["battery","BATERIAS",int(materials.battery),_v12_icon("battery2",ICONS["scrap"])],["seeds","SEMENTES",int(materials.seeds),_v12_icon("seeds",ICONS["food"])]
	]
	for spec in specs: grid.add_child(_v17_inventory_card(str(spec[0]),str(spec[1]),int(spec[2]),spec[3]))
	_v8_clear_actions(v8_page_actions); _v17_side_note("MOCHILA","Arraste para cima e para baixo. Toque num item para examinar, usar ou descobrir para que ele serve.",155)
	_v17_side_button("ROUPAS / CAMADAS",Callable(self,"_v14_show_clothing")); _v17_side_button("ALIMENTAÇÃO",Callable(self,"_show_food_panel")); _v17_side_button("PESQUISA / BANCADA",Callable(self,"_v19_show_research_bench")); _v17_side_button("CRAFTING",Callable(self,"_show_crafting_panel")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter"))
	_mark_nav("inventory"); _v19_hint_once("inventory_scroll","DICA: arraste a mochila para cima e para baixo. Peso muda fadiga, ruído e tempo de viagem.")

func _v8_make_inventory_card(key: String, label_text: String, count: int, tex: Texture2D) -> Button:
	var b:=Button.new(); b.custom_minimum_size=Vector2(148,122); b.focus_mode=Control.FOCUS_NONE; b.text=""
	b.add_theme_stylebox_override("normal",_flat(Color(0.025,0.024,0.021,0.92),Color("#655946"),4,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.12,0.08,0.05,0.96),Color("#b69763"),4,2))
	var box:=VBoxContainer.new(); box.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); box.mouse_filter=Control.MOUSE_FILTER_IGNORE
	var icon:=TextureRect.new(); icon.custom_minimum_size=Vector2(74,74); icon.texture=tex; icon.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; icon.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED; icon.mouse_filter=Control.MOUSE_FILTER_IGNORE; box.add_child(icon)
	var lab:=Label.new(); lab.text="%s  x%d"%[label_text,count]; lab.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER; lab.add_theme_font_size_override("font_size",13); lab.add_theme_color_override("font_color",BONE); lab.mouse_filter=Control.MOUSE_FILTER_IGNORE; box.add_child(lab)
	b.add_child(box); b.pressed.connect(func(): _v8_inventory_select(key,label_text,count)); return b

func _v8_inventory_select(key: String, label_text: String, count: int) -> void:
	v8_selected_inventory_key=key
	var detail:="%s • quantidade %d"%[label_text,count]
	if key in ["knife","pistol"]: detail += "\nEquipamento pode ter condição e qualidade diferentes."
	elif key in ["food","water","dirty_water","med","bandage"]: detail += "\nConsumível. Água não tratada pode causar doença."
	else: detail += "\nMaterial usado em crafting, reparo ou projetos do abrigo."
	v8_page_subtitle.text=detail
	_v8_clear_actions(v8_page_actions)
	if key=="food":
		var use:=_make_dark_button("COMER",Vector2(438,50)); use.pressed.connect(_use_food); v8_page_actions.add_child(use)
	elif key=="water":
		var use:=_make_dark_button("BEBER",Vector2(438,50)); use.pressed.connect(_use_water); v8_page_actions.add_child(use)
	elif key=="dirty_water":
		var boil:=_make_dark_button("FERVER / TRATAR",Vector2(438,50)); boil.pressed.connect(_v12_treat_dirty_water); v8_page_actions.add_child(boil)
		var risk:=_make_dark_button("BEBER SEM TRATAR",Vector2(438,50)); risk.pressed.connect(_v12_drink_dirty_water); v8_page_actions.add_child(risk)
	elif key=="med":
		var use:=_make_dark_button("USAR REMÉDIO",Vector2(438,50)); use.pressed.connect(_use_med); v8_page_actions.add_child(use)
	elif key=="bandage":
		var use:=_make_dark_button("USAR BANDAGEM",Vector2(438,50)); use.pressed.connect(_use_bandage); v8_page_actions.add_child(use)
	var craft:=_make_dark_button("CRAFTING",Vector2(438,50)); craft.pressed.connect(_show_crafting_panel); v8_page_actions.add_child(craft)
	var back:=_make_dark_button("FECHAR MOCHILA",Vector2(438,50)); back.pressed.connect(_show_shelter); v8_page_actions.add_child(back)

func _show_workbench() -> void:
	_v19_show_research_bench()

func _show_crafting_panel() -> void:
	_v8_show_page("craft","OFICINA / CRAFTING","CONHECIMENTO + FERRAMENTA + MATERIAL + TEMPO","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["craft"]; v8_page_shade.color=Color(0.008,0.007,0.006,0.48)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_body.visible=true; v8_page_body.position=Vector2(24,20); v8_page_body.size=Vector2(270,620)
	v8_page_body.text="[font_size=27][b]BANCADA[/b][/font_size]\n\nReceitas conhecidas\n[b]%d / %d[/b]\n\nOficina  Nv.%d\nForja  %s\nDefumador  %s\n\n[color=#9f8f76]Livros ensinam. Prática melhora. Ferramentas e estações determinam o que realmente pode ser feito.[/color]"%[known_recipes.size(),V7_RECIPES.size(),int(upgrades.workbench),"ATIVA" if int(facilities.forge)>0 else "NÃO","ATIVO" if int(facilities.smoker)>0 else "NÃO"]
	v8_page_cards.visible=true; v8_page_cards.columns=2; v8_page_cards.position=Vector2(310,28); v8_page_cards.size=Vector2(785,620); v8_page_cards.add_theme_constant_override("h_separation",12); v8_page_cards.add_theme_constant_override("v_separation",12)
	for c in v8_page_cards.get_children(): c.queue_free()
	var shown:=0
	for id in V7_RECIPES:
		if not bool(known_recipes.get(id,false)): continue
		var rid:=str(id); var recipe:Dictionary=V7_RECIPES[id]; v8_page_cards.add_child(_v17_recipe_card(rid,recipe)); shown+=1
		if shown>=8: break
	if shown==0: v8_page_cards.add_child(_v17_text_card("NENHUMA RECEITA NOVA","Procure livros, oficinas, casas e sobreviventes especializados.",Color("#6f604c"),Callable(self,"_show_books_panel")))
	_v8_clear_actions(v8_page_actions); _v17_side_note("PROJETOS","Construir também consome minutos ou horas da campanha. Planeje antes do anoitecer.",145)
	_v17_side_button("BIBLIOTECA / LIVROS",Callable(self,"_show_books_panel")); _v17_side_button("PRODUÇÃO DO ABRIGO",Callable(self,"_show_production_panel")); _v17_side_button("MANUTENÇÃO",Callable(self,"_v16_show_shelter_maintenance")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter")); _mark_nav("craft")

func _show_upgrades_panel() -> void:
	map_layer.visible = false
	scene_frame.visible = true
	var text := "[b]ABRIGO[/b]\nCama %d • Oficina %d • Cerca %d\nFiltro %d • Enfermaria %d • Rádio %d • Estoque %d\n\nSucata disponível: %d\n\nO custo aumenta conforme cada estrutura evolui. Melhorias mudam risco, descanso, cura, rádio e capacidade." % [upgrades.bed, upgrades.workbench, upgrades.fence, upgrades.filter, upgrades.infirmary, upgrades.radio, upgrades.storage, inventory.scrap]
	_set_right_panel("MELHORIAS", "FORTALEÇA O ABRIGO", text, [["CERCA +1", func(): _upgrade("fence")], ["OFICINA +1", func(): _upgrade("workbench")], ["ENFERMARIA +1", func(): _upgrade("infirmary")]])
	_mark_nav("upgrades")

func _show_journal_panel() -> void:
	_v8_show_page("journal","DIÁRIO DA CAMPANHA","REGISTRE. LEMBRE. NÃO DEIXE O MUNDO APAGAR O QUE ACONTECEU.","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["journal"]; v8_page_shade.color=Color(0.015,0.012,0.009,0.38)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_body.visible=true; v8_page_body.position=Vector2(24,18); v8_page_body.size=Vector2(1060,64); v8_page_body.text="[b]Dia %d[/b] • %s • %s\n[color=#8f826f]Cada decisão importante deixa uma marca neste save.[/color]"%[day,_v12_clock_text(),season]
	v8_page_cards.visible=true; v8_page_cards.columns=2; v8_page_cards.position=Vector2(26,100); v8_page_cards.size=Vector2(1060,540); v8_page_cards.add_theme_constant_override("h_separation",14); v8_page_cards.add_theme_constant_override("v_separation",12)
	for c in v8_page_cards.get_children(): c.queue_free()
	if journal.is_empty(): v8_page_cards.add_child(_v17_journal_card("DIA %d"%day,"O diário ainda está vazio. Sua primeira história ainda não aconteceu."))
	else:
		var start:=maxi(0,journal.size()-10)
		for i in range(journal.size()-1,start-1,-1): v8_page_cards.add_child(_v17_journal_card("REGISTRO %02d"%(i+1),str(journal[i])))
	_v8_clear_actions(v8_page_actions); _v17_side_note("ARQUIVO","O diário registra sua campanha; o Arquivo do Colapso guarda o que você descobriu sobre o mundo.",150)
	_v17_side_button("MISSÕES",Callable(self,"_show_missions_panel")); _v17_side_button("ARQUIVO DO COLAPSO",Callable(self,"_show_lore_panel")); _v17_side_button("PERFIL / LEGADO",Callable(self,"_v12_show_profile")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter")); _mark_nav("journal")

func _mark_nav(key: String) -> void:
	for k in left_buttons:
		var b: Button = left_buttons[k]
		if k == key:
			b.add_theme_stylebox_override("normal", _flat(Color("#3c1c19"), RED_BRIGHT, 3, 2))
		else:
			b.add_theme_stylebox_override("normal", _flat(Color(0.03,0.03,0.028,0.90), Color("#5a5145"), 3, 1))

func _set_right_panel(title: String, subtitle: String, body: String, actions: Array) -> void:
	right_title.text = title
	right_subtitle.text = subtitle
	right_body.text = body
	for c in right_actions.get_children(): c.queue_free()
	for spec in actions:
		var b := _make_dark_button(spec[0], Vector2(320, 46))
		b.add_theme_font_size_override("font_size", 16)
		b.pressed.connect(spec[1])
		right_actions.add_child(b)

func _inventory_slot_pressed(key: String) -> void:
	if key == "food": _use_food()
	elif key == "water": _use_water()
	elif key == "med": _use_med()
	elif key == "ammo": _toast("Munição disponível: %d" % inventory.ammo)
	elif key == "pistol": _toast("Pistola equipada. %d tiros restantes." % inventory.ammo)
	elif key == "knife": _toast("Faca equipada. Silenciosa, mas perigosa de perto.")
	elif key == "scrap": _toast("Sucata: %d. Use na oficina ou nas melhorias." % inventory.scrap)
	elif key == "cloth": _toast("Tecido: %d. Pode virar bandagem." % inventory.cloth)
	else: _show_inventory_panel()

func _use_food() -> void:
	if inventory.food <= 0:
		_toast("Não resta comida pronta.")
		return
	inventory.food -= 1
	_v7_consume_calories(480, 22, 14, "ração")
	hunger = maxi(0, hunger - 28)
	morale = mini(100, morale + 2)
	_update_all(); _save_game(); _toast("Você comeu uma ração. +480 kcal.")

func _use_water() -> void:
	if inventory.water <= 0:
		_toast("A garrafa está vazia.")
		return
	inventory.water -= 1
	thirst = maxi(0, thirst - 34)
	_update_all(); _save_game(); _toast("Você bebeu água.")

func _use_med() -> void:
	if inventory.med <= 0:
		_toast("Você não tem remédios.")
		return
	inventory.med -= 1
	life = mini(100, life + 24)
	infection = maxi(0, infection - 18)
	_v12_advance_time(12,"tomar remédio e observar sintomas",0.0,false)
	_update_all(); _save_game(); _toast("O remédio segurou a infecção por enquanto. 12 min passaram.")

func _use_bandage() -> void:
	if inventory.bandage <= 0:
		_toast("Você não tem bandagens.")
		return
	inventory.bandage -= 1
	life = mini(100, life + 12 + field_medicine * 4)
	_v12_advance_time(maxi(5,10-field_medicine),"fazer curativo",0.0,false)
	_update_all(); _save_game(); _toast("Ferimento tratado.")

func _cook() -> void:
	if materials.raw_meat > 0:
		materials.raw_meat -= 1
		_v7_consume_calories(620, 38, 24, "carne cozida")
		hunger = maxi(0, hunger - 40); morale = mini(100, morale + 4)
		_v7_gain_skill("cooking", 7); _v12_advance_time(35,"cozinhar",0.15,false); _v12_daily_add("cook",1)
		_update_all(); _save_game(); _toast("Carne cozida. +620 kcal.")
		return
	if inventory.food <= 0:
		_toast("Nada para cozinhar.")
		return
	inventory.food -= 1
	_v7_consume_calories(650, 25, 18, "refeição quente")
	hunger = maxi(0, hunger - 38); morale = mini(100, morale + 5)
	_v7_gain_skill("cooking", 5); _v12_advance_time(30,"cozinhar",0.12,false); _v12_daily_add("cook",1)
	_update_all(); _save_game(); _toast("Uma refeição quente ainda lembra que você é humano.")

func _rest() -> void:
	_open_modal("DESCANSAR","[b]CAMA / DESCANSO[/b]\n\nDormir consome tempo real. Frio, chuva, doença, ameaça e conforto do abrigo alteram a qualidade do sono.\n\nAgora: %s • fadiga %d • energia %d • sede %d."%[_v12_clock_text(),fatigue,energy,thirst],[["COCHILO • 2H",func(): _close_modal(); _v14_sleep(120,"cochilo")],["DORMIR • 6H",func(): _close_modal(); _v14_sleep(360,"sono")],["DORMIR ATÉ AMANHECER",func(): _close_modal(); _v14_sleep_until_dawn()],["CANCELAR",Callable(self,"_close_modal")]])

func _v14_sleep_until_dawn() -> void:
	var now:=_v12_clock_minutes(); var target:=sunrise_minute
	var minutes_to_dawn:=target-now if now<target else (1440-now)+target
	minutes_to_dawn=clampi(minutes_to_dawn,60,720)
	_v14_sleep(minutes_to_dawn,"até amanhecer")

func _v14_sleep(minutes_sleep:int,label:String) -> void:
	var quality:int=55 + int(upgrades.bed)*9 + int(shelter_comfort/4)
	quality+=int(shelter_integrity/12)+int(shelter_heat/18)+_v16_guard_bonus()
	quality-=int(threat/7) + weather_severity*4 + int(community_tension/10) + int(maintenance_debt/8)
	if shelter_cleanliness<35: quality-=8
	if roof_leak and weather_severity>0: quality-=12
	if diseases.has("RESFRIADO") or diseases.has("INFECÇÃO DE FERIDA"): quality-=8
	if body_temperature<36.0 or body_temperature>37.7: quality-=10
	quality=clampi(quality,20,100)
	var interrupt_chance:int=maxi(0,28-int(quality/4)+int(threat/8))
	var actual:int=minutes_sleep
	var interrupted:bool=rng.randi_range(1,100)<=interrupt_chance and minutes_sleep>=240
	if interrupted: actual=maxi(90,int(minutes_sleep*0.62))
	_v12_advance_time(actual,"dormir",0.0,false)
	var hours_f:float=float(actual)/60.0; var recovery:int=int(hours_f*(5.0+float(quality)/18.0))
	fatigue=maxi(0,fatigue-recovery); energy=mini(100,energy+int(recovery*0.8)); soreness=maxi(0,soreness-int(hours_f*7.0)); stress=maxi(0,stress-int(hours_f*2.2))
	if quality>=70: life=mini(100,life+int(hours_f*1.4))
	var note:="Sono interrompido por ruídos e tensão no abrigo." if interrupted else "Descanso concluído."
	journal.append("Dia %d — %s por %dh%02d, qualidade %d%%. %s"%[day,label,int(actual/60),actual%60,quality,note])
	_v16_after_sleep_event(actual,interrupted)
	_add_event("DESCANSO","%s Qualidade %d%% • %dh%02d."%[note,quality,int(actual/60),actual%60]); _update_all(); _save_game(); _show_shelter(); _toast("Descanso %d%% • %dh%02d"%[quality,int(actual/60),actual%60])

func _window_event() -> void:
	var lines := [
		"A chuva cobre quase todos os sons. Quase.",
		"Uma silhueta cruzou a rua e sumiu atrás dos carros.",
		"Você ouviu três disparos ao norte. Depois, silêncio.",
		"Uma luz piscou em um prédio distante. Pode ter sido alguém.",
		"Há pegadas novas na lama diante do abrigo."
	]
	var msg: String = lines[rng.randi_range(0, lines.size()-1)]
	_v12_advance_time(5,"observar a rua",0.0,false)
	_add_event("JANELA", msg)
	_toast(msg)

func _craft_bandage() -> void:
	if inventory.cloth < 2:
		_toast("Faltam tecidos.")
		return
	inventory.cloth -= 2
	inventory.bandage += 1
	_v12_advance_time(18,"improvisar bandagem",0.05,false)
	journal.append("Dia %d — improvisei uma bandagem." % day)
	_update_all(); _save_game(); _show_crafting_panel(); _toast("Bandagem criada.")

func _craft_ammo() -> void:
	if inventory.scrap < 4:
		_toast("Falta sucata.")
		return
	inventory.scrap -= 4
	inventory.ammo += 3
	_v12_advance_time(45,"improvisar munição",0.12,false)
	_update_all(); _save_game(); _show_crafting_panel(); _toast("3 munições improvisadas. 45 min passaram.")

func _upgrade(key: String) -> void:
	if inventory.scrap < 4:
		_toast("Você precisa de 4 sucatas.")
		return
	inventory.scrap -= 4
	upgrades[key] += 1
	_v12_advance_time(90,"melhorar "+key,0.28,false)
	if key == "fence": _mission_progress("fortify", 1)
	journal.append("Dia %d — melhorei %s do abrigo." % [day, key])
	_update_all(); _save_game(); _show_upgrades_panel(); _toast("Melhoria concluída.")

func _v8_show_map_screen() -> void:
	_v8_show_page("journal","MAPA DE CAMPO","NÃO É UMA LISTA DE FASES. É UMA CIDADE QUE VOCÊ PRECISA APRENDER.","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_STREET_TEX["CENTRO"]; v8_page_shade.color=Color(0.008,0.010,0.010,0.72)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_body.visible=true; v8_page_body.position=Vector2(24,14); v8_page_body.size=Vector2(1060,64); v8_page_body.text="%s • %s • %d°C • vento %s %d km/h • pressão da infecção %d/100\nPôr do sol %s. Rotas aprendidas ficam mais previsíveis, mas nunca totalmente seguras."%[_v12_clock_text(),weather,temperature,wind_direction,wind_speed,mutation_pressure,_v12_format_minutes(sunset_minute)]
	v8_page_cards.visible=false
	for c in v8_page_info.get_children():
		if str(c.name).begins_with("V17Map") or str(c.name).begins_with("V19Map"): c.queue_free()
	var canvas:=Panel.new(); canvas.name="V19MapCanvas"; canvas.position=Vector2(22,88); canvas.size=Vector2(1075,563); canvas.add_theme_stylebox_override("panel",_flat(Color(0.018,0.020,0.018,0.98),Color("#837254"),8,2)); canvas.clip_contents=true; v8_page_info.add_child(canvas)
	var art:=TextureRect.new(); art.name="V19MapArt"; art.position=Vector2(0,4); art.size=Vector2(1075,555); art.texture=V19_CITY_MAP_TEX; art.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; art.stretch_mode=TextureRect.STRETCH_SCALE; art.mouse_filter=Control.MOUSE_FILTER_IGNORE; canvas.add_child(art)
	_unlock_districts(); var counts:Dictionary={}
	for name_v in CITY_LOCATIONS.keys():
		var name:=str(name_v); var spec:Dictionary=CITY_LOCATIONS[name]; var district:=str(spec.get("district","BAIRRO DO ABRIGO")); if not bool(discovered_districts.get(district,false)): continue
		var idx:=int(counts.get(district,0)); counts[district]=idx+1; var pos:=_v17_map_position(district,idx); canvas.add_child(_v17_map_pin(name,pos))
	_v8_clear_actions(v8_page_actions); _v17_side_note("ANOTAÇÕES","OBJETIVO ATUAL\n"+_v19_current_objective()+"\n\nVERDE  risco menor\nDOURADO  risco conhecido\nVERMELHO  infestação / boss\n\n"+_v19_tip(),290)
	_v17_side_button("MISSÕES",Callable(self,"_show_missions_panel")); _v17_side_button("PREVISÃO 3 DIAS",Callable(self,"_v15_show_forecast")); _v17_side_button("MOCHILA",Callable(self,"_show_inventory_panel")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter"))
	_v19_hint_once("map","DICA: escolha um lugar pelo que você precisa, não só pelo risco. Algumas descobertas abrem pesquisas e novas rotas.")

func _v17_map_card(name:String) -> Button:
	var spec:Dictionary=CITY_LOCATIONS[name]; var st:Dictionary=location_states.get(name,{})
	var risk:=int(spec.get("risk",0)); var infestation:=int(st.get("infestation",0)); var boss:=_boss_at_location(name)
	var edge:=GREEN if risk<35 and infestation<20 else (RED_BRIGHT if infestation>=55 or boss!="" else GOLD)
	var b:=Button.new(); b.custom_minimum_size=Vector2(230,176); b.text=""; b.focus_mode=Control.FOCUS_NONE; b.add_theme_stylebox_override("normal",_flat(Color(0.025,0.023,0.020,0.95),edge.darkened(0.28),5,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.095,0.064,0.042,0.98),edge,5,3))
	var art:=TextureRect.new(); art.position=Vector2(7,7); art.size=Vector2(216,88); art.texture=_v8_location_texture(name); art.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; art.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; art.modulate=Color(0.90,0.86,0.78,0.86); art.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(art)
	var title:=Label.new(); title.position=Vector2(12,101); title.size=Vector2(206,25); title.text=name; title.add_theme_font_size_override("font_size",14); title.add_theme_color_override("font_color",BONE); title.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(title)
	var dist:=float(V12_LOCATION_DISTANCE_KM.get(name,1.0)); var meta:=Label.new(); meta.position=Vector2(12,128); meta.size=Vector2(206,39); meta.text="%.1f km • risco %d • conhec. %d
%s%s"%[dist,risk,int(v18_location_knowledge.get(name,0)),_location_state_line(name),(" • "+boss) if boss!="" else ""]; meta.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; meta.add_theme_font_size_override("font_size",10); meta.add_theme_color_override("font_color",edge.lightened(0.22)); meta.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(meta)
	b.pressed.connect(func(): _v8_prepare_travel(name)); return b


func _v8_prepare_travel(name: String) -> void:
	if not CITY_LOCATIONS.has(name): return
	if not _location_available(name): _toast("Essa região ainda não foi descoberta."); return
	v8_travel_destination=name; v8_travel_origin="ABRIGO" if active_location=="" else active_location; v8_travel_returning=false; v8_travel_active=false
	var spec:Dictionary=CITY_LOCATIONS[name]
	var prep:=_v18_expedition_preparation(name); v18_last_prep_score=int(prep.score); v18_last_prep_notes=prep.notes
	var base_info:="[b]%s[/b] • %s\nRisco conhecido %d/100 • distância direta %.1f km • água limpa %.1f L\nSaída %s • pôr do sol %s • %s, %d°C • sensação %d°C\n\n[b]PREPARO %d/100 • %s[/b]\n%s"%[name,str(spec.loot),int(spec.risk),float(V12_LOCATION_DISTANCE_KM.get(name,1.0)),float(inventory.water)*0.5,_v12_clock_text(),_v12_format_minutes(sunset_minute),weather,temperature,_v12_feels_like(),int(prep.score),str(prep.grade)," • ".join(prep.notes)]
	_v8_show_page("journal","PLANEJAR EXPEDIÇÃO","TEMPO, DISTÂNCIA E CLIMA SÃO RECURSOS",base_info,[])
	_v9_set_immersive_page(true); left_nav_panel.visible=false; v8_page_bg.texture=V8_STREET_TEX.get(str(spec.district),V8_STREET_TEX["BAIRRO DO ABRIGO"])
	v8_page_side.visible=false; v8_page_info.position=Vector2(38,132); v8_page_info.size=Vector2(1572,620); v8_page_body.position=Vector2(28,22); v8_page_body.size=Vector2(1516,145)
	for c in v8_page_cards.get_children(): c.queue_free()
	v8_page_cards.visible=true; v8_page_cards.columns=3; v8_page_cards.position=Vector2(28,190); v8_page_cards.size=Vector2(1516,330)
	for route in ["AVENIDA","BECOS","ROTA SILENCIOSA"]:
		var est:=_v12_travel_estimate(name,route); var arrival:=_v12_clock_minutes()+int(est.minutes); var return_at:=arrival+int(est.minutes); var dark:=return_at>sunset_minute
		var rf:Dictionary=V12_ROUTE_FACTORS[route]; var desc:=str(V8_ROUTE_DATA[route].desc); var risk_word:="ALTO" if int(rf.stealth)<0 else ("BAIXO" if int(rf.stealth)>=15 else "MODERADO")
		var card:=Button.new(); card.custom_minimum_size=Vector2(485,280); card.focus_mode=Control.FOCUS_NONE; card.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART
		var experience:=_v18_route_xp(name,route); var familiar:="NOVA" if experience<=0 else ("CONHECIDA" if experience<4 else "FAMILIAR")
		card.text="%s • %s\n\n%.1f km • ~%d min\nChegada %s • água %.1f L\nExposição: %s%s\n\n%s"%[route,familiar,float(est.distance),int(est.minutes),_v12_format_minutes(arrival),float(est.water_ml)/1000.0,risk_word,"\n⚠ RETORNO PROVÁVEL NO ESCURO" if dark else "",desc]
		card.add_theme_font_size_override("font_size",18); var edge:=RED_BRIGHT if dark else Color("#9e8b68"); card.add_theme_stylebox_override("normal",_flat(Color(0.025,0.022,0.018,0.91),edge,7,2)); card.add_theme_stylebox_override("hover",_flat(Color(0.10,0.067,0.043,0.97),edge.lightened(0.16),7,3))
		var rr:String=route; card.pressed.connect(func(): _v8_start_travel(rr)); v8_page_cards.add_child(card)
	v8_page_close.text="VOLTAR AO MAPA"

func _v8_start_travel(route: String) -> void:
	v8_travel_route=route; v8_travel_segment=0; v8_travel_active=true; v8_travel_event=""
	if not v8_travel_returning: expedition_distance_km=0.0
	if not v8_travel_returning:
		v13_expedition_start_day=day; v13_expedition_start_minute=_v12_clock_minutes(); v13_expedition_start_thirst=thirst; v13_expedition_start_fatigue=fatigue; v13_expedition_start_weight=_total_weight(); v13_attention_scans={}
		actions_left=maxi(0,actions_left-1); _v7_prepare_travel()
	_v8_render_street("Você deixa a segurança relativa do abrigo. O som da porta fechando fica para trás. Agora cada minuto pertence à rua.\n\n[color=#b99a68][b]DICA DE SOBREVIVÊNCIA[/b][/color]\n"+_v19_tip(),[["SEGUIR",Callable(self,"_v8_next_segment")],["VOLTAR",Callable(self,"_v8_abort_travel")]])

func _v8_street_district() -> String:
	if v8_travel_destination=="ABRIGO": return str(CITY_LOCATIONS.get(v8_travel_origin,{}).get("district","BAIRRO DO ABRIGO"))
	return str(CITY_LOCATIONS.get(v8_travel_destination,{}).get("district","BAIRRO DO ABRIGO"))

func _v8_render_street(body: String, actions: Array, entity_key: String = "") -> void:
	if toast != null: toast.text = ""
	if left_nav_panel != null: left_nav_panel.visible = false
	v8_page_layer.visible=false; map_layer.visible=false; scene_frame.visible=false; v8_street_layer.visible=true
	var district:=_v8_street_district(); v8_street_bg.texture=V8_STREET_TEX.get(district,V8_STREET_TEX["BAIRRO DO ABRIGO"])
	v8_street_entity.visible = entity_key != ""
	if entity_key != "": v8_street_entity.texture = V8_ENTITY_TEX.get(entity_key,V8_ENTITY_TEX["errante"])
	var route_data:Dictionary=V8_ROUTE_DATA.get(v8_travel_route,V8_ROUTE_DATA["AVENIDA"])
	v8_street_title.text="RUA • %s"%("VOLTA PARA O ABRIGO" if v8_travel_returning else v8_travel_destination)
	var est:=_v12_travel_estimate(v8_travel_origin if v8_travel_destination=="ABRIGO" else v8_travel_destination,v8_travel_route)
	var remain_km:=maxf(0.0,float(est.distance)*(1.0-float(v8_travel_segment)/maxf(1.0,float(route_data.segments))))
	v8_street_status.text="%s • %.1f km restantes • %s • %d°C • vento %s %d • peso %d/%d"%[v8_travel_route,remain_km,_v12_clock_text(),temperature,wind_direction,wind_speed,_total_weight(),_max_weight()]
	v8_street_body.text=body; _v8_clear_actions(v8_street_actions)
	if v8_travel_active and (_v12_is_night() or fatigue>=75 or energy<=22) and not v16_camp_active:
		var shelter_btn:=_make_dark_button("⌂  PROCURAR ABRIGO TEMPORÁRIO",Vector2(493,46)); shelter_btn.pressed.connect(_v16_seek_temporary_shelter); v8_street_actions.add_child(shelter_btn)
	if v8_travel_event!="":
		var attention:=_make_dark_button("◉  ATENÇÃO / LER O AMBIENTE",Vector2(493,44)); attention.pressed.connect(_v13_attention_scan); v8_street_actions.add_child(attention)
	for spec in actions:
		var b:=_make_dark_button(str(spec[0]),Vector2(493,48)); b.pressed.connect(spec[1]); v8_street_actions.add_child(b)

func _v8_advance_travel_cost() -> void:
	var r:Dictionary=V8_ROUTE_DATA.get(v8_travel_route,V8_ROUTE_DATA["AVENIDA"])
	var loc:=v8_travel_origin if v8_travel_destination=="ABRIGO" else v8_travel_destination
	var est:=_v12_travel_estimate(loc,v8_travel_route)
	var segs:=maxi(1,int(r.segments)); var segment_minutes:=maxi(4,int(ceil(float(est.minutes)/float(segs))))
	var segment_km:=float(est.distance)/float(segs)
	fatigue=mini(100,fatigue+int(r.fatigue)+maxi(0,_total_weight()-_max_weight())/3)
	energy=maxi(0,energy-3); activity_calories+=int(70.0*segment_km); total_distance_km+=segment_km; expedition_distance_km+=segment_km; _v12_daily_add("km",segment_km)
	_v12_advance_time(segment_minutes,"deslocamento",0.55,true)
	_update_all()

func _v8_next_segment() -> void:
	if not v8_travel_active: return
	v8_travel_segment+=1; _v8_advance_travel_cost()
	var r:Dictionary=V8_ROUTE_DATA.get(v8_travel_route,V8_ROUTE_DATA["AVENIDA"])
	if v8_travel_segment>int(r.segments): _v8_arrive(); return
	_v8_roll_street_event()

func _v8_roll_street_event() -> void:
	var spec:Dictionary=CITY_LOCATIONS.get(v8_travel_destination,CITY_LOCATIONS["SUPERMERCADO"])
	var r:Dictionary=V8_ROUTE_DATA.get(v8_travel_route,V8_ROUTE_DATA["AVENIDA"])
	var route_loc:=v8_travel_origin if v8_travel_destination=="ABRIGO" else v8_travel_destination
	var familiarity:=_v18_route_xp(route_loc,v8_travel_route); var prep_reduction:=int(v18_last_prep_score/18)
	var chance:=clampi(48+int(spec.risk)/3+int(r.risk)+weather_severity*2-mini(10,familiarity*2)-prep_reduction,22,94)
	if _v12_is_night(): chance=mini(97,chance+14)
	if visibility<55: chance=mini(97,chance+6)
	if v8_travel_returning: chance=mini(95,chance+8)
	if rng.randi_range(1,100)>chance:
		_v8_render_street("A rua continua quieta. Você ouve apenas água escorrendo pelas calhas e seus próprios passos. Nenhuma oportunidade parece valer o risco.",[["CONTINUAR",Callable(self,"_v8_next_segment")],["PARAR E OBSERVAR",Callable(self,"_v8_observe_street")]])
		return
	var pool:=["lone_zombie","abandoned_car","cry_help","backpack","blood_trail","armed_window","animal_tracks","transformer","smoke_house","wounded_stranger","sick_survivor","stray_dog","dead_courier","distant_generator","roadblock"]
	if _v12_is_night(): pool.append("night_noise")
	if wind_speed>=28: pool.append("wind_debris")
	if wind_speed>=36: pool.append("fallen_debris")
	if weather=="NEBLINA": pool.append("fog_shape")
	if weather in ["CHUVA","TEMPORAL"]: pool.append("flooded_street")
	if weather=="TEMPORAL": pool.append("storm_shelter"); pool.append("storm_signal")
	if wind_speed>=30: pool.append("downed_line")
	if humidity>=88: pool.append("mold_house")
	if season in ["PRIMAVERA","OUTONO"] and v8_travel_destination in ["FAZENDA","FLORESTA","LAGO","SILO"]: pool.append("migrating_animals")
	if _v12_feels_like()<=7: pool.append("cold_exposure")
	if _v12_feels_like()>=32: pool.append("heat_exposure")
	if diseases.has("RESFRIADO"): pool.append("cough_fit")
	if diseases.has("DESIDRATAÇÃO") or diseases.has("EXAUSTÃO PELO CALOR"): pool.append("dizzy_spell")
	if diseases.has("INFECÇÃO DE FERIDA"): pool.append("fever_wave")
	if mutation_pressure>=35: pool.append("mutant")
	if int(spec.risk)>=50: pool.append("horde")
	v8_travel_event=str(pool[rng.randi_range(0,pool.size()-1)])
	match v8_travel_event:
		"lone_zombie":
			_v8_render_street("[b]UM INFECTADO PERTO DO CAMINHO[/b]\n\nUm infectado está parado junto a um carro, entre você e a próxima esquina. Ele ainda não percebeu você. A chuva e o vento estão mascarando parte dos seus passos.",[["PASSAR ESCONDIDO",func(): _v8_resolve_stealth("zombie")],["ATACAR EM SILÊNCIO",func(): _v8_street_silent_attack()],["CONTINUAR SEM DESVIAR",func(): _v8_street_push_past()],["DAR A VOLTA",func(): _v8_street_detour()]],"errante")
		"abandoned_car":
			_v8_render_street("[b]CARRO ABANDONADO[/b]\n\nA porta do motorista está aberta. Há algo no banco traseiro, mas o veículo pode ter alarme — e o porta-malas parece ter sido fechado às pressas.",[["REVISTAR O CARRO",Callable(self,"_v8_search_car")],["TENTAR RETIRAR COMBUSTÍVEL",Callable(self,"_v8_siphon_car")],["IGNORAR",Callable(self,"_v8_next_segment")]])
		"cry_help":
			_v8_render_street("[b]UMA VOZ PEDE AJUDA[/b]\n\nVem do segundo andar de um prédio. A pessoa fala baixo demais para saber se está ferida, presa... ou tentando fazer você entrar.",[["APROXIMAR-SE",Callable(self,"_v8_help_voice")],["OBSERVAR DE LONGE",Callable(self,"_v8_observe_voice")],["IGNORAR E SEGUIR",Callable(self,"_v8_ignore_voice")]])
		"backpack":
			_v8_render_street("[b]MOCHILA NO ASFALTO[/b]\n\nUma mochila relativamente nova está caída no meio da rua. Não há corpo por perto. Isso pode ser sorte — ou isca.",[["PEGAR RAPIDAMENTE",Callable(self,"_v8_take_backpack")],["PROCURAR ARMADILHA",Callable(self,"_v8_check_backpack")],["DEIXAR",Callable(self,"_v8_next_segment")]])
		"blood_trail":
			_v8_render_street("[b]RASTRO DE SANGUE[/b]\n\nGotas recentes entram por um beco que não aparece no seu mapa. Você pode seguir o rastro ou manter o plano original.",[["SEGUIR O RASTRO",Callable(self,"_v8_follow_blood")],["MARCAR NO MAPA",Callable(self,"_v8_mark_micro_location")],["CONTINUAR",Callable(self,"_v8_next_segment")]])
		"armed_window":
			_v8_render_street("[b]ALGUÉM ESTÁ OBSERVANDO[/b]\n\nVocê vê o brilho de uma arma numa janela. A pessoa não atira. Ainda. Talvez esteja apenas defendendo o próprio território.",[["MOSTRAR AS MÃOS",Callable(self,"_v8_signal_survivor")],["SAIR DA LINHA DE TIRO",Callable(self,"_v8_street_detour")],["IGNORAR",Callable(self,"_v8_next_segment")]])
		"animal_tracks":
			_v8_render_street("[b]PEGADAS NA LAMA[/b]\n\nMarcas recentes cruzam a rua e seguem para um terreno tomado por mato. Um caçador veria mais do que um civil.",[["SEGUIR AS PEGADAS",Callable(self,"_v12_follow_tracks")],["USAR MODO DE ATENÇÃO",Callable(self,"_v12_attention_tracks")],["SEGUIR VIAGEM",Callable(self,"_v8_next_segment")]])
		"transformer":
			_v8_render_street("[b]TRANSFORMADOR ESTALANDO[/b]\n\nUma caixa elétrica ainda recebe energia intermitente. Há cobre e componentes, mas tocar no lugar errado pode ser fatal.",[["EXAMINAR",Callable(self,"_v12_examine_transformer")],["MARCAR NO MAPA",Callable(self,"_v8_mark_micro_location")],["NÃO ARRISCAR",Callable(self,"_v8_next_segment")]])
		"smoke_house":
			_v8_render_street("[b]FUMAÇA NUMA CASA[/b]\n\nFumaça fina sai de uma janela quebrada. Pode ser incêndio, alguém cozinhando ou um pedido de socorro que ninguém conseguiu fazer.",[["INVESTIGAR",Callable(self,"_v12_investigate_smoke")],["OBSERVAR",Callable(self,"_v8_observe_street")],["CONTINUAR",Callable(self,"_v8_next_segment")]])
		"wounded_stranger":
			_v8_render_street("[b]ESTRANHO FERIDO[/b]\n\nUma pessoa está sentada contra um muro, pressionando um ferimento. Ela pede água e diz que conhece um atalho.",[["DAR ÁGUA",Callable(self,"_v12_help_stranger")],["AVALIAR FERIMENTO",Callable(self,"_v12_assess_stranger")],["NÃO PARAR",Callable(self,"_v8_next_segment")]])
		"night_noise":
			_v8_render_street("[b]BARULHO NO ESCURO[/b]\n\nAlguma coisa acompanha seu ritmo do outro lado da rua. Quando você para, ela para. A iluminação é insuficiente para identificar.",[["APAGAR A LUZ E ESPERAR",Callable(self,"_v12_wait_in_dark")],["ACELERAR O PASSO",Callable(self,"_v8_street_run")],["TENTAR IDENTIFICAR",Callable(self,"_v12_identify_night_sound")]])
		"wind_debris":
			_v8_render_street("[b]RAJADAS FORTES[/b]\n\nUma placa metálica se solta e bate contra a fachada. O vento mascara sons, mas torna cada passo mais lento e imprevisível.",[["ESPERAR 15 MIN",Callable(self,"_v12_wait_wind")],["SEGUIR MESMO ASSIM",Callable(self,"_v8_next_segment")]])
		"fog_shape":
			_v8_render_street("[b]FORMA NA NEBLINA[/b]\n\nUma silhueta aparece a poucos metros e some de novo. A visibilidade está péssima. Você não sabe se ela viu você.",[["ESCONDER-SE",func(): _v8_resolve_stealth("zombie")],["RECUAR",Callable(self,"_v8_street_detour")],["CHAMAR",Callable(self,"_v12_call_into_fog")]])
		"flooded_street":
			_v8_render_street("[b]RUA ALAGADA[/b]\n\nA água cobre metade da via. Você não consegue ver buracos, vidro ou o que pode estar submerso. O desvio custa tempo.",[["ATRAVESSAR",Callable(self,"_v12_cross_flood")],["FAZER DESVIO",Callable(self,"_v12_detour_flood")],["OBSERVAR PRIMEIRO",Callable(self,"_v8_observe_street")]])
		"storm_shelter":
			_v8_render_street("[b]TEMPORAL FECHANDO A RUA[/b]\n\nA chuva fica quase horizontal. Uma loja com a porta arrebentada pode servir de abrigo até a pior rajada passar.",[["ABRIGAR-SE",Callable(self,"_v12_take_weather_shelter")],["CONTINUAR NA CHUVA",Callable(self,"_v12_push_storm")]])
		"cold_exposure":
			_v8_render_street("[b]FRIO CORTANTE[/b]\n\nO vento atravessa a roupa molhada. Seus dedos estão ficando lentos. Continuar assim pode transformar a viagem em hipotermia.",[["PARAR E SE AQUECER",Callable(self,"_v12_warm_up")],["CONTINUAR",Callable(self,"_v8_next_segment")]])
		"heat_exposure":
			_v8_render_street("[b]CALOR PESADO[/b]\n\nO asfalto devolve calor e sua boca está seca. O caminho parece maior do que no mapa.",[["BEBER E DESCANSAR",Callable(self,"_v12_cool_down")],["ECONOMIZAR ÁGUA",Callable(self,"_v8_next_segment")]])
		"sick_survivor":
			_v8_render_street("[b]SOBREVIVENTE COM FEBRE[/b]\n\nUma pessoa está escondida num ponto de ônibus, tremendo e confusa. Ela insiste que não foi mordida.",[["EXAMINAR",Callable(self,"_v12_examine_sick_survivor")],["OFERECER REMÉDIO",Callable(self,"_v12_medicate_stranger")],["SEGUIR",Callable(self,"_v8_next_segment")]])
		"stray_dog":
			_v8_render_street("[b]UM CÃO NA CHUVA[/b]\n\nUm cachorro magro observa você debaixo de uma marquise. Não rosna. Há uma coleira rasgada e sangue seco numa das patas.",[["OFERECER COMIDA",Callable(self,"_v13_feed_stray_dog")],["OBSERVAR",Callable(self,"_v13_observe_stray_dog")],["SEGUIR",Callable(self,"_v8_next_segment")]])
		"dead_courier":
			_v8_render_street("[b]MENSAGEIRO CAÍDO[/b]\n\nUm corpo com uma bolsa impermeável está entre dois carros. O sangue já escureceu, mas a bolsa parece protegida da chuva.",[["REVISTAR COM CUIDADO",Callable(self,"_v13_search_courier")],["MARCAR NO MAPA",Callable(self,"_v13_mark_courier")],["DEIXAR",Callable(self,"_v8_next_segment")]])
		"distant_generator":
			_v8_render_street("[b]UM MOTOR AINDA FUNCIONA[/b]\n\nEntre o vento e a chuva você percebe o ronco irregular de um gerador vindo de uma rua lateral. Onde há energia, pode haver gente — ou uma armadilha.",[["INVESTIGAR",Callable(self,"_v13_investigate_generator")],["APENAS MARCAR",Callable(self,"_v13_mark_generator")],["IGNORAR",Callable(self,"_v8_next_segment")]])
		"roadblock":
			_v8_render_street("[b]PASSAGEM IMPROVISADA[/b]\n\nCarros e móveis formam uma barricada atravessando a rua. Há uma abertura estreita, mas a mochila pode prender no metal.",[["PASSAR PELA ABERTURA",Callable(self,"_v13_squeeze_roadblock")],["ESCALAR",Callable(self,"_v13_climb_roadblock")],["DESVIAR",Callable(self,"_v8_street_detour")]])
		"fallen_debris":
			_v8_render_street("[b]PASSAGEM BLOQUEADA[/b]\n\nUma árvore e placas arrancadas pelo vento fecharam a passagem. Dá para abrir caminho, esperar ajuda do vento ou voltar algumas quadras.",[["REMOVER ENTULHO",Callable(self,"_v12_clear_debris")],["DESVIAR",Callable(self,"_v8_street_detour")],["ESPERAR",Callable(self,"_v12_wait_wind")]])
		"cough_fit":
			_v8_render_street("[b]A TOSSE VEM NA PIOR HORA[/b]\n\nSua garganta fecha e você sente a tosse subindo. Nesta rua silenciosa, alguns segundos de barulho podem denunciar exatamente onde você está.",[["PARAR E CONTROLAR A RESPIRAÇÃO",Callable(self,"_v13_control_cough")],["USAR REMÉDIO",Callable(self,"_v13_medicine_cough")],["SEGUIR MESMO ASSIM",Callable(self,"_v13_push_cough")]])
		"dizzy_spell":
			_v8_render_street("[b]O MUNDO INCLINA[/b]\n\nSua visão fecha nas bordas. Sede, calor e esforço estão cobrando a conta. Continuar agora economiza tempo, mas não energia.",[["BEBER ÁGUA",Callable(self,"_v13_drink_dizzy")],["SENTAR 12 MIN",Callable(self,"_v13_rest_dizzy")],["FORÇAR O PASSO",Callable(self,"_v13_push_dizzy")]])
		"fever_wave":
			_v8_render_street("[b]FEBRE E DOR NA FERIDA[/b]\n\nA região do ferimento pulsa sob a roupa. Você sente calor no rosto apesar do vento. Se piorar longe do abrigo, a volta pode custar muito mais tempo.",[["TRATAR AGORA",Callable(self,"_v13_treat_fever")],["DESCANSAR E OBSERVAR",Callable(self,"_v13_rest_fever")],["CONTINUAR",Callable(self,"_v13_push_fever")]])
		"downed_line":
			_v8_render_street("[b]FIAÇÃO CAÍDA NA RUA[/b]\n\nO vento arrancou cabos de um poste. Algumas pontas ainda estalam contra o asfalto molhado. Há cobre suficiente para valer a parada — se a rede estiver realmente morta.",[["EXAMINAR A REDE",Callable(self,"_v14_examine_downed_line")],["ESPERAR UMA ABERTURA",Callable(self,"_v14_wait_downed_line")],["CONTORNAR",Callable(self,"_v8_street_detour")]])
		"mold_house":
			_v8_render_street("[b]CASA ÚMIDA E FECHADA[/b]\n\nA porta cede alguns centímetros. O cheiro de mofo é forte, mas caixas ainda estão empilhadas lá dentro. Ficar ali muito tempo sem proteção pode cobrar um preço nos pulmões.",[["ENTRAR E VASCULHAR",Callable(self,"_v14_search_mold_house")],["USAR MODO DE ATENÇÃO",Callable(self,"_v13_attention_scan")],["NÃO ENTRAR",Callable(self,"_v8_next_segment")]])
		"migrating_animals":
			_v8_render_street("[b]MOVIMENTO NO MATO[/b]\n\nO clima mudou e um pequeno grupo de animais cruza a área em direção a água e abrigo. Um caçador experiente consegue transformar isso em alimento — ou apenas aprender a rota.",[["SEGUIR E CAÇAR",Callable(self,"_v14_follow_migration")],["MARCAR A ROTA",Callable(self,"_v14_mark_migration")],["DEIXAR PASSAR",Callable(self,"_v8_next_segment")]])
		"storm_signal":
			_v8_render_street("[b]SINAL ENTRE OS TROVÕES[/b]\n\nPor alguns segundos, seu rádio portátil capta uma voz repetindo coordenadas entre descargas elétricas. A tempestade derruba o sinal antes da mensagem terminar.",[["PARAR E GRAVAR",Callable(self,"_v14_record_storm_signal")],["TENTAR RESPONDER",Callable(self,"_v14_answer_storm_signal")],["SEGUIR",Callable(self,"_v8_next_segment")]])
		"mutant":
			_v8_render_street("[b]ALGO DIFERENTE ATRAVESSA A RUA[/b]\n\nA silhueta não se move como um Errante comum. Ela ainda não viu você. Enfrentar agora pode render uma amostra rara — ou terminar a expedição.",[["ESCONDER-SE",func(): _v8_resolve_stealth("mutant")],["ENFRENTAR",Callable(self,"_v8_street_mutant_combat")],["RECUAR POR OUTRA RUA",Callable(self,"_v8_street_detour")]],"mutant")
		"horde":
			_v8_render_street("[b]HORDA NA AVENIDA[/b]\n\nDezenas de infectados atravessam a via. Você não vai vencer isso lutando. É preciso desaparecer, correr ou abandonar a rota.",[["ESCONDER-SE",Callable(self,"_v8_hide_from_horde")],["DESVIO LONGO",Callable(self,"_v8_street_detour")],["CORRER",Callable(self,"_v8_run_horde")]],"horde")

func _v8_stealth_score() -> int:
	var score:=45+int(skills.get("survival",0))*6+fitness/8-int(fatigue/7)-maxi(0,_total_weight()-_max_weight())*2
	if weather_severity>=2: score+=10
	if wind_speed>=28: score+=4
	if visibility<=55: score+=5
	if v8_travel_route=="BECOS": score+=10
	if v8_travel_route=="ROTA SILENCIOSA": score+=14
	var cloth:=_v14_clothing_meta(); score-=int(cloth.get("noise",0))*3
	if wetness>75: score-=4
	score -= _v13_condition_penalty("stealth")
	return clampi(score,8,92)

func _v8_resolve_stealth(kind: String) -> void:
	var score:=_v8_stealth_score()-(12 if kind=="mutant" else 0)
	if rng.randi_range(1,100)<=score:
		_v7_gain_skill("survival",3); _v12_daily_add("stealth",1); _v8_render_street("Você reduz o passo, controla a respiração e usa cobertura. A criatura nunca confirma que você esteve ali.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else:
		_v8_render_street("Um pedaço de vidro estala sob sua bota. A cabeça da criatura vira imediatamente na sua direção.",[["ENFRENTAR",Callable(self,"_v8_street_mutant_combat") if kind=="mutant" else Callable(self,"_v8_street_zombie_combat")],["CORRER",Callable(self,"_v8_street_run")]])

func _v8_street_zombie_combat() -> void:
	v8_resume_after_combat=true; var enemy:=_roll_enemy(v8_travel_destination); enemy["name"]="ERRANTE"; enemy["tier"]=1; enemy["hp"]=36; enemy["damage"]=7; _fight_enemy(enemy,v8_travel_destination,false)

func _v8_street_mutant_combat() -> void:
	v8_resume_after_combat=true; var enemy:=_roll_enemy(v8_travel_destination); _fight_enemy(enemy,v8_travel_destination,false)

func _v8_resume_travel_after_combat() -> void:
	_close_modal(); v8_resume_after_combat=false; _v8_render_street("A rua volta ao silêncio. O corpo ficou para trás, mas o barulho pode ter sido ouvido.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_street_silent_attack() -> void:
	var chance:=clampi(48+strength/6+int(skills.get("survival",0))*5-int(fatigue/8),15,90)
	if rng.randi_range(1,100)<=chance:
		infected_kills+=1; _v7_gain_skill("survival",3); _v8_render_street("Você chega perto o bastante e derruba o infectado antes que ele consiga gritar. Quase nenhum ruído.",[["REVISTAR CORPO",Callable(self,"_v8_loot_street_body")],["SEGUIR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("O golpe não termina o serviço. O infectado se vira e agarra sua roupa.",[["LUTAR",Callable(self,"_v8_street_zombie_combat")]])

func _v8_street_push_past() -> void:
	noise=mini(100,noise+8)
	if rng.randi_range(1,100)<=55: life=maxi(1,life-rng.randi_range(3,10)); _v8_render_street("Você passa rápido demais para uma luta longa, mas recebe um golpe no caminho. O barulho ecoa entre os prédios.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("Você passa antes que a criatura consiga fechar o caminho. Ela fica para trás, urrando.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_street_run() -> void:
	fatigue=mini(100,fatigue+10); energy=maxi(0,energy-8); noise=mini(100,noise+12); _v8_render_street("Você corre até dobrar duas esquinas. Quando para, os pulmões queimam — mas não há passos logo atrás.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_street_detour() -> void:
	fatigue=mini(100,fatigue+6); thirst=mini(100,thirst+2); v8_travel_segment=maxi(0,v8_travel_segment-1); _v8_render_street("Você abandona o trajeto direto e contorna o quarteirão. Demora mais, mas o perigo fica para trás.",[["CONTINUAR PELO DESVIO",Callable(self,"_v8_next_segment")]])

func _v8_loot_street_body() -> void:
	var roll:=rng.randi_range(1,4)
	if roll==1: inventory.food+=1; _add_event("RUA","Uma lata amassada foi encontrada no infectado.")
	elif roll==2: inventory.ammo+=1; _add_event("RUA","Uma munição solta foi encontrada.")
	elif roll==3: inventory.scrap+=1; _add_event("RUA","Você aproveitou uma pequena peça metálica.")
	else: inventory.cloth+=1; _add_event("RUA","Um pedaço de tecido ainda servia.")
	_v8_next_segment()

func _v8_search_car() -> void:
	noise=mini(100,noise+3); var roll:=rng.randi_range(1,100)
	if roll<=18:
		noise=mini(100,noise+24); threat=mini(100,threat+5); _v8_render_street("O alarme dispara. O som é brutal no quarteirão vazio. Você arranca o que consegue antes de sair dali.",[["PEGAR E CORRER",Callable(self,"_v8_car_alarm_loot")]])
	else:
		materials.mechanical+=1; inventory.scrap+=1; _v7_gain_skill("mechanics",2); _v8_render_street("Sem alarme. Você encontra uma ferramenta, peças aproveitáveis e um porta-luvas cheio de papéis inúteis.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_car_alarm_loot() -> void:
	inventory.scrap+=1; materials.mechanical+=1; _v8_street_run()

func _v8_siphon_car() -> void:
	if rng.randi_range(1,100)<=58+int(skills.get("mechanics",0))*6: inventory.fuel+=1; _v7_gain_skill("mechanics",3); _v8_render_street("Você consegue recuperar um pouco de combustível sem chamar muita atenção.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("O tanque está seco ou contaminado. Você perdeu tempo por nada.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_help_voice() -> void:
	if rng.randi_range(1,100)<=55:
		var name:="MARTA" if day%2==0 else "RAFAEL"; if survivors.size()<6: survivors.append(_v7_make_survivor(name,"CIVIL",42,"TEM FAMÍLIA EM OUTRO BAIRRO")); survivor_count=maxi(survivor_count,survivors.size()+1)
		morale=mini(100,morale+5); _v12_daily_add("help",1); _add_event("RUA","Você encontrou %s preso no prédio. Agora existe mais uma pessoa dependendo do abrigo."%name); _v8_render_street("A voz era real. Depois de remover móveis que bloqueavam a porta, você encontra alguém exausto — mas vivo.",[["LEVAR PARA O ABRIGO DEPOIS",Callable(self,"_v8_next_segment")]])
	else:
		_v8_render_street("Quando você entra no saguão, percebe tarde demais que a voz era uma gravação. Passos aparecem atrás de você.",[["SAIR CORRENDO",Callable(self,"_v8_street_run")],["PROCURAR QUEM FEZ ISSO",Callable(self,"_v8_ambush")]])

func _v8_observe_voice() -> void:
	if rng.randi_range(1,100)<=60: _v8_render_street("Depois de alguns minutos, uma pessoa aparece por uma fresta e realmente parece ferida. Você agora pode se aproximar sabendo um pouco mais.",[["AJUDAR",Callable(self,"_v8_help_voice")],["SEGUIR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("Ninguém aparece. A mesma frase se repete exatamente igual. É uma gravação usada como isca.",[["MARCAR O PRÉDIO",Callable(self,"_v8_mark_micro_location")],["SEGUIR",Callable(self,"_v8_next_segment")]])

func _v8_ignore_voice() -> void:
	morale=maxi(0,morale-1); _add_event("RUA","Você deixou uma voz pedindo ajuda para trás. Talvez ainda descubra quem era."); _v13_schedule_delayed("ignored_cry",day+rng.randi_range(2,5),{"district":_v8_street_district()}); _v8_next_segment()

func _v8_take_backpack() -> void:
	if rng.randi_range(1,100)<=25:
		life=maxi(1,life-8); injuries.arm=mini(100,int(injuries.arm)+8); _v8_render_street("Um fio prende a mochila a latas e metal. O estrondo não é enorme, mas você corta o braço tentando se soltar.",[["PEGAR MESMO ASSIM",Callable(self,"_v8_backpack_loot")],["LARGAR",Callable(self,"_v8_next_segment")]])
	else: _v8_backpack_loot()

func _v8_check_backpack() -> void:
	_v7_gain_skill("survival",2); if rng.randi_range(1,100)<=65: _v8_render_street("Você encontra um fio fino preso ao zíper. Alguém preparou isso para fazer barulho. Você desmonta a isca.",[["PEGAR AGORA",Callable(self,"_v8_backpack_loot")]])
	else: _v8_render_street("Você não encontra nada suspeito. Ainda assim, isso não significa que seja seguro.",[["PEGAR",Callable(self,"_v8_backpack_loot")],["DEIXAR",Callable(self,"_v8_next_segment")]])

func _v8_backpack_loot() -> void:
	inventory.food+=rng.randi_range(0,1); inventory.water+=rng.randi_range(0,1); inventory.cloth+=1
	if backpack_level<1 and rng.randi_range(1,100)<=20: backpack_level=1; _add_event("EQUIPAMENTO","Você encontrou uma mochila melhor na rua.")
	_v8_render_street("Dentro há alguns suprimentos e tecido aproveitável. Nada milagroso, mas o tipo de coisa que mantém alguém vivo por mais um dia.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_follow_blood() -> void:
	fatigue=mini(100,fatigue+4); var id:="APARTAMENTO ESCONDIDO %d"%(v8_discovered_micro_locations.size()+1); if not v8_discovered_micro_locations.has(id): v8_discovered_micro_locations.append(id)
	inventory.med+=1 if rng.randi_range(1,100)<=45 else 0; _add_event("DESCOBERTA","%s foi marcado no mapa."%id); _v13_schedule_delayed("blood_hideout",day+rng.randi_range(1,4),{"place":id}); _v8_render_street("O rastro termina numa porta de serviço. Lá dentro há sinais de que alguém viveu escondido por dias. Você marca o ponto para outra expedição.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_mark_micro_location() -> void:
	var id:="PONTO DESCONHECIDO %d"%(v8_discovered_micro_locations.size()+1); if not v8_discovered_micro_locations.has(id): v8_discovered_micro_locations.append(id); _add_event("MAPA","Um pequeno local foi marcado: %s."%id); _v8_next_segment()

func _v8_signal_survivor() -> void:
	if rng.randi_range(1,100)<=65: factions["VIGÍLIA"].rep=int(factions["VIGÍLIA"].rep)+1; _v13_schedule_delayed("window_contact",day+rng.randi_range(2,6),{}); _v8_render_street("A arma baixa alguns centímetros. A pessoa aponta para uma rua lateral e faz um gesto curto: caminho livre. Você ganhou informação sem trocar uma palavra.",[["SEGUIR",Callable(self,"_v8_next_segment")]])
	else: _v8_street_detour()

func _v8_ambush() -> void:
	life=maxi(1,life-rng.randi_range(4,12)); inventory.food=maxi(0,inventory.food-1); community_tension=mini(100,community_tension+2); _v8_render_street("Você encontra uma armadilha humana improvisada. Consegue escapar, mas deixa sangue e talvez algum suprimento para trás.",[["SAIR",Callable(self,"_v8_next_segment")]])

func _v8_hide_from_horde() -> void:
	var score:=_v8_stealth_score()+10
	if rng.randi_range(1,100)<=score: stress=mini(100,stress+4); _v8_render_street("Você se enfia atrás de uma porta quebrada e espera. Por minutos, só existem pés arrastando no asfalto. Depois passa.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_run_horde()

func _v8_run_horde() -> void:
	fatigue=mini(100,fatigue+18); energy=maxi(0,energy-15); life=maxi(1,life-rng.randi_range(0,8)); noise=mini(100,noise+20); _v8_render_street("Você corre até as pernas falharem. Alguns infectados seguem por uma quadra, mas a horda perde você entre os prédios.",[["RECUPERAR O FÔLEGO",Callable(self,"_v8_next_segment")]])

func _v8_observe_street() -> void:
	if rng.randi_range(1,100)<=35: inventory.scrap+=1; _v8_render_street("Ao observar com calma, você percebe uma caixa de ferramentas caída sob uma marquise. Quase tudo está enferrujado, mas uma peça ainda serve.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("Você espera e escuta. Nada se move além da chuva. O silêncio, pelo menos desta vez, era apenas silêncio.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v8_arrive() -> void:
	if v8_travel_returning:
		v8_travel_active=false; v8_travel_returning=false; _v18_homecoming_story_tick(); _v13_finish_return_trip(); return
	var name:=v8_travel_destination; v8_travel_active=false; active_location=name
	var first_visit:=not visited.has(name); visited[name]=int(visited.get(name,0))+1
	if first_visit: _mission_progress("signal",1); _gain_xp(5)
	var st:Dictionary=location_states[name]; if str(st.get("status",""))=="INEXPLORADO": st.status="VISITADO"; location_states[name]=st
	var key:="%s|%s"%[v8_travel_origin,name]; v8_route_memory[key]=int(v8_route_memory.get(key,0))+1
	_v18_gain_route_xp(name,v8_travel_route); v18_location_knowledge[name]=int(v18_location_knowledge.get(name,0))+1
	var boss_name:=_boss_at_location(name)
	if boss_name!="": _update_all(); _save_game(); _boss_encounter(boss_name,name); return
	_update_all(); _save_game(); _v19_show_arrival(name)

func _v8_begin_return_trip() -> void:
	if active_location=="": _show_shelter(); return
	_close_modal(); v8_travel_origin=active_location; v8_travel_destination="ABRIGO"; v8_travel_returning=true; v8_travel_active=true; v8_travel_segment=0
	if v8_travel_route=="": v8_travel_route="AVENIDA"
	_v8_render_street("Você deixa %s para trás. A mochila está mais pesada e o caminho de volta costuma parecer mais longo."%v8_travel_origin,[["VOLTAR PARA CASA",Callable(self,"_v8_next_segment")],["REVISAR INVENTÁRIO",Callable(self,"_show_inventory_panel")]])

func _v8_abort_travel() -> void:
	v8_travel_active=false; v8_travel_destination=""; v8_travel_segment=0; _show_map()

func _v8_show_location_screen(name: String) -> void:
	active_location=name; var rooms:Array=LOCATION_ROOMS[name]; var spec:Dictionary=CITY_LOCATIONS[name]
	_v8_show_page("journal",name,"%s • %s"%[str(spec.district),_location_state_line(name)],"",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=_v8_location_texture(name); v8_page_shade.color=Color(0.006,0.006,0.005,0.35)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1160,674); v8_page_side.position=Vector2(1210,120); v8_page_side.size=Vector2(400,674)
	v8_page_body.visible=true; v8_page_body.position=Vector2(24,12); v8_page_body.size=Vector2(1100,82); v8_page_body.text="%s\n[color=#a18d70]Risco %d/100 • provável: %s • conhecimento local %d[/color]"%[str(V18_LOCATION_FLAVOR.get(name,"Cada área custa tempo; portas, luz, contaminação e barulho podem mudar o que acontece aqui.")),int(spec.risk),str(spec.loot),int(v18_location_knowledge.get(name,0))]
	v8_page_cards.visible=true; v8_page_cards.columns=3; v8_page_cards.position=Vector2(22,95); v8_page_cards.size=Vector2(1110,555); v8_page_cards.add_theme_constant_override("h_separation",12); v8_page_cards.add_theme_constant_override("v_separation",12)
	for c in v8_page_cards.get_children(): c.queue_free()
	for i in range(rooms.size()):
		var room:=str(rooms[i]); var key:="%s|%s"%[name,room]; var searched:=bool(room_states.get(key,false)); var cond:Dictionary=_v9_room_condition(name,room); v8_page_cards.add_child(_v17_room_card(name,room,searched,cond,i))
	_v8_clear_actions(v8_page_actions); _v17_side_art(_v8_location_texture(name),180); _v17_side_note("LOCAL", "%s\n\nEstado: %s\nVisitas: %d\nDistância do abrigo: %.1f km"%[str(spec.loot),_location_state_line(name),int(visited.get(name,0)),float(V12_LOCATION_DISTANCE_KM.get(name,1.0))],165)
	_v17_side_button("ABRIR MOCHILA",Callable(self,"_show_inventory_panel")); _v17_side_button("VOLTAR PELAS RUAS",Callable(self,"_v8_begin_return_trip"))

func _v17_room_card(location_name:String, room:String, searched:bool, cond:Dictionary, room_index:int) -> Button:
	var b:=Button.new(); b.custom_minimum_size=Vector2(350,176); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.disabled=searched
	var danger:=int(cond.get("contamination",0)); var special_key:="%s|%s"%[location_name,room]; var special_unseen:=V18_SPECIAL_ROOMS.has(special_key) and not bool(v18_special_rooms_seen.get(special_key,false)); var edge:=Color("#806e55") if not searched else Color("#3e3a34"); if special_unseen: edge=GOLD; if danger>0: edge=RED_BRIGHT
	b.add_theme_stylebox_override("normal",_flat(Color(0.021,0.019,0.017,0.94),edge,6,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.11,0.072,0.045,0.98),Color("#c4a36d"),6,3))
	var art:=TextureRect.new(); art.position=Vector2(7,7); art.size=Vector2(336,100); art.texture=_v17_room_texture(location_name,room_index); art.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; art.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; art.modulate=Color(0.84,0.80,0.72,0.30 if searched else 0.90); art.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(art)
	var shade:=ColorRect.new(); shade.position=Vector2(7,70); shade.size=Vector2(336,37); shade.color=Color(0,0,0,0.70); shade.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(shade)
	var title:=Label.new(); title.position=Vector2(16,75); title.size=Vector2(315,27); title.text=room; title.add_theme_font_size_override("font_size",15); title.add_theme_color_override("font_color",BONE); title.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(title)
	var tags:Array[String]=[]; if special_unseen: tags.append("PISTA / HISTÓRIA"); if bool(cond.get("locked",false)): tags.append("TRANCADO"); if bool(cond.get("dark",false)) and not bool(city_projects.get("power",false)): tags.append("ESCURO"); if danger>0: tags.append("CONTAMINADO"); if searched: tags=["VASCULHADO"]
	var st:=Label.new(); st.position=Vector2(16,116); st.size=Vector2(315,47); st.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; st.text=" • ".join(tags) if not tags.is_empty() else _v19_room_hint(room); st.add_theme_font_size_override("font_size",10); st.add_theme_color_override("font_color",Color("#857c70") if searched else edge.lightened(0.30)); st.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(st)
	if not searched: b.pressed.connect(func(): _v9_enter_room(location_name,room))
	return b

func _explore_location(name: String, risk: int, loot_hint: String) -> void:
	# Compatibilidade com testes/rotas antigas.
	_explore_location_dynamic(name)

func _explore_location_dynamic(name: String) -> void:
	_v8_prepare_travel(name)

func _show_location_rooms(name: String) -> void:
	_close_modal()
	_v8_show_location_screen(name)

func _search_room(location_name: String, room_name: String) -> void:
	_v14_try_find_clothing(location_name)
	var key := "%s|%s" % [location_name, room_name]
	if bool(room_states.get(key, false)): _toast("Você já vasculhou esse ponto."); return
	var st: Dictionary = location_states[location_name]
	var base_risk := int(CITY_LOCATIONS[location_name]["risk"])
	var local_knowledge:=int(v18_location_knowledge.get(location_name,0)); var risk: int = mini(94, base_risk + int(st.get("infestation",0))/3 + mutation_pressure/5 + int(noise/6) + maxi(0,_total_weight()-_max_weight()) - survivor_level*2 - _survivor_risk_bonus() - mini(10,local_knowledge*2))
	if hour>=18: risk=mini(96,risk+10)
	if weather_severity>=2: risk=maxi(4,risk-3)
	if str(st.get("status",""))=="NINHO": risk=mini(96,risk+18)
	var search_minutes:=maxi(10,32-int(skills.get("survival",0))*3-mini(6,local_knowledge))
	_v12_advance_time(search_minutes,"vasculhar "+room_name,0.28,true); fatigue=mini(100,fatigue+3); hunger=mini(100,hunger+1); thirst=mini(100,thirst+1); noise=mini(100,noise+rng.randi_range(0,3))
	if rng.randi_range(1,100)<=risk:
		var enemy:=_roll_enemy(location_name); pending_room_location=location_name; pending_room_name=room_name; _add_event(location_name,"%s apareceu em %s."%[str(enemy.name),room_name]); _fight_enemy(enemy,location_name,false); return
	var result:=_complete_room_search(location_name,room_name)
	_v8_show_page("journal","%s • %s"%[location_name,room_name],"VOCÊ CONSEGUIU PROCURAR SEM SER CERCADO",result+"\n\nVocê ainda precisa sair do prédio e voltar pelas ruas com o que encontrou.",[["CONTINUAR EXPLORANDO",func(): _show_location_rooms(location_name)],["VOLTAR AO ABRIGO",Callable(self,"_v8_begin_return_trip")],["ABRIR MOCHILA",Callable(self,"_show_inventory_panel")]])
	v8_page_bg.texture=_v8_location_texture(location_name)

func _complete_room_search(location_name: String, room_name: String) -> String:
	var key := "%s|%s" % [location_name, room_name]
	if bool(room_states.get(key, false)): return "Nada novo foi encontrado."
	room_states[key] = true
	_v12_daily_add("rooms",1)
	var st: Dictionary = location_states[location_name]
	st["searches_left"] = maxi(0, int(st.get("searches_left",1)) - 1)
	st["status"] = "SAQUEADO" if int(st["searches_left"]) <= 0 else ("NINHO" if str(st.get("status","")) == "NINHO" else "VASCULHADO")
	location_states[location_name] = st
	var result := _grant_room_loot(location_name, room_name)
	var v7_extra := _v7_loot_bonus(location_name, room_name)
	if v7_extra != "": result += " " + v7_extra
	var v9_extra := _v9_room_loot_bonus(location_name, room_name)
	if v9_extra != "": result += " " + v9_extra
	_mission_progress("supplies", int(inventory.food))
	_resolve_location_story(location_name)
	_v10_check_personal_missions(location_name)
	_v10_try_location_recruit(location_name,room_name)
	if location_name == "QUARENTENA" and room_name == "LABORATÓRIO MILITAR":
		_mission_progress("quarantine", 1)
		event_flags["regional_map_found"] = true
		journal.append("Dia %d — encontrei mapas de evacuação apontando para outras cidades. A epidemia é muito maior do que eu imaginava." % day)
		_add_event("QUARENTENA", "Um mapa regional mostra estradas e cidades fora desta zona.")
	journal.append("Dia %d — %s" % [day, result])
	_add_event(location_name, result)
	_gain_xp(5 + scavenging_skill * 2)
	mutation_pressure = mini(100, mutation_pressure + rng.randi_range(0,1))
	_unlock_districts()
	_update_all(); _save_game(); _refresh_map_cards()
	return result

func _grant_room_loot(name: String, room_name: String) -> String:
	var found: Array[String] = []
	var bonus := scavenging_skill
	match name:
		"SUPERMERCADO":
			var n: int = rng.randi_range(0,1) + (1 if room_name == "DEPÓSITO" else 0) + mini(1, bonus)
			inventory.food += n
			if n > 0: found.append("comida x%d" % n)
			if rng.randi_range(1,100) <= 55: inventory.water += 1; found.append("água x1")
		"FARMÁCIA":
			inventory.med += 1; found.append("remédio x1")
			if room_name == "SALA DOS FUNDOS" and rng.randi_range(1,100) <= 60: inventory.antibiotic += 1; found.append("antibiótico x1")
		"OFICINA":
			var n: int = rng.randi_range(1,2) + mini(1, bonus); inventory.scrap += n; found.append("sucata x%d" % n)
			if room_name == "GARAGEM" and rng.randi_range(1,100) <= 45: inventory.electronics += 1; found.append("eletrônicos x1")
		"ESCOLA":
			inventory.cloth += 1; found.append("tecido x1")
			if room_name == "SEGUNDO ANDAR" and rng.randi_range(1,100) <= 35: inventory.food += 1; found.append("comida x1")
		"DELEGACIA":
			var ammo_n: int = rng.randi_range(1,3); inventory.ammo += ammo_n; found.append("munição x%d" % ammo_n)
			if room_name == "ARSENAL" and inventory.pistol <= 0:
				inventory.pistol = 1; equipped_firearm = "PISTOLA"; found.append("PISTOLA")
		"CENTRO":
			inventory.scrap += 1; found.append("sucata x1")
			if rng.randi_range(1,100) <= 40: inventory.battery += 1; found.append("pilha x1")
		"HOSPITAL":
			inventory.med += 1; found.append("remédio x1")
			if room_name == "LABORATÓRIO": inventory.samples += 1; found.append("amostra x1")
		"ESTAÇÃO":
			inventory.battery += 1; found.append("pilha x1")
			if room_name == "SALA ELÉTRICA": inventory.electronics += 1; found.append("eletrônicos x1")
		"POSTO":
			if room_name == "BOMBAS": inventory.fuel += 1; found.append("combustível x1")
			else: inventory.water += 1; found.append("água x1")
		"ARMAZÉM":
			inventory.scrap += 2; found.append("sucata x2")
			if room_name == "CÂMARA FRIA": inventory.food += 1; found.append("comida x1")
		"TÚNEIS":
			inventory.samples += 1; found.append("amostra mutante x1")
		"APARTAMENTOS":
			inventory.food += rng.randi_range(0,1); inventory.cloth += 1; found.append("tecido x1"); if rng.randi_range(1,100)<=35: found.append("objeto pessoal")
		"IGREJA":
			inventory.food += rng.randi_range(0,1); inventory.water += rng.randi_range(0,1); found.append("mantimentos")
		"BIBLIOTECA":
			materials.paper += 1; found.append("papel / anotações"); if rng.randi_range(1,100)<=55: found.append("manual técnico")
		"SHOPPING":
			inventory.cloth += 1; inventory.food += rng.randi_range(0,1); found.append("roupas / mantimentos")
		"FÁBRICA", "FERRO-VELHO", "SUBESTAÇÃO":
			materials.steel += 1; materials.copper += 1; inventory.scrap += 1; found.append("metal / componentes")
		"FAZENDA":
			materials.seeds += 1; animals.feed += 1; materials.vegetables += rng.randi_range(0,1); found.append("sementes / ração")
		"FLORESTA":
			materials.wood += 2; inventory.herbs += rng.randi_range(0,1); found.append("madeira / ervas")
		"LAGO":
			inventory.dirty_water += 2; found.append("água não tratada x2"); fish_density=maxi(0,fish_density-1)
		"SILO":
			animals.feed += 2; inventory.food += rng.randi_range(0,1); found.append("ração / grãos")
		"LABORATÓRIO":
			inventory.samples += 1; materials.chemicals += 1; found.append("amostra / reagentes")
		"QUARENTENA":
			inventory.med += 1; inventory.electronics += 1; found.append("remédio x1"); found.append("eletrônicos x1")
	if rng.randi_range(1,100) <= 25 + bonus * 5:
		inventory.scrap += 1; found.append("sucata x1")
	if found.is_empty(): found.append("nada útil")
	return "Em %s, você encontrou %s." % [room_name.to_lower(), ", ".join(found)]

func _grant_location_loot(name: String) -> String:
	var st: Dictionary = location_states[name]
	if int(st.get("searches_left",0)) <= 0:
		return "Você revirou o local mais uma vez, mas quase tudo já foi levado."
	var found: Array[String] = []
	var common_scrap := rng.randi_range(0, 2)
	if common_scrap > 0:
		inventory.scrap += common_scrap
		found.append("sucata x%d" % common_scrap)
	match name:
		"SUPERMERCADO":
			var food_n := rng.randi_range(1,3); var water_n := rng.randi_range(0,2)
			inventory.food += food_n; inventory.water += water_n
			found.append("comida x%d" % food_n)
			if water_n > 0: found.append("água x%d" % water_n)
		"FARMÁCIA":
			inventory.med += 1; found.append("remédio x1")
			if rng.randi_range(1,100) <= 38: inventory.antibiotic += 1; found.append("antibiótico x1")
		"OFICINA":
			var scrap_n := rng.randi_range(2,4); inventory.scrap += scrap_n; found.append("sucata x%d" % scrap_n)
			if rng.randi_range(1,100) <= 45: inventory.electronics += 1; found.append("eletrônicos x1")
		"ESCOLA":
			var cloth_n := rng.randi_range(1,3); inventory.cloth += cloth_n; found.append("tecido x%d" % cloth_n)
			if rng.randi_range(1,100) <= 25: inventory.food += 1; found.append("comida x1")
		"DELEGACIA":
			var ammo_n := rng.randi_range(2,5); inventory.ammo += ammo_n; found.append("munição x%d" % ammo_n)
			if inventory.pistol <= 0 and rng.randi_range(1,100) <= 55:
				inventory.pistol = 1; equipped_firearm = "PISTOLA"; found.append("PISTOLA")
		"CENTRO":
			inventory.food += rng.randi_range(0,1); inventory.battery += 1; inventory.scrap += 1
			found.append("pilha x1"); found.append("sucata x1")
		"HOSPITAL":
			inventory.med += rng.randi_range(1,2); inventory.samples += rng.randi_range(0,1)
			found.append("remédios");
			if inventory.samples > 0: found.append("amostra")
		"ESTAÇÃO":
			inventory.battery += 1; inventory.electronics += rng.randi_range(0,2)
			found.append("pilha x1"); found.append("componentes")
		"POSTO":
			inventory.fuel += rng.randi_range(1,2); inventory.water += rng.randi_range(0,1)
			found.append("combustível");
		"ARMAZÉM":
			inventory.scrap += rng.randi_range(3,5); inventory.cloth += rng.randi_range(0,2)
			found.append("material pesado")
		"TÚNEIS":
			inventory.samples += rng.randi_range(1,2); found.append("amostras mutantes")
		"QUARENTENA":
			inventory.med += 1; inventory.electronics += 2; inventory.samples += 2
			found.append("suprimentos militares"); found.append("amostras x2")
	if found.is_empty(): found.append("nada útil")
	return "Você vasculhou %s e encontrou %s." % [name, ", ".join(found)]

func _avoid_enemy(location_name: String, enemy_name: String) -> void:
	_close_modal()
	fatigue = mini(100, fatigue + 6)
	morale = maxi(0, morale - 1)
	_add_event(location_name, "Você evitou %s e saiu sem procurar mais fundo." % enemy_name)
	_update_all(); _save_game(); _show_map(); _toast("Você recuou antes que fosse tarde.")

func _resolve_location_story(name: String) -> void:
	if name == "ESCOLA" and event_flags.get("rescue_davi", false): _resolve_rescue_davi()
	if name == "FARMÁCIA" and event_flags.get("antibiotics", false): _resolve_antibiotics()
	if name == "DELEGACIA" and event_flags.get("investigate_shots", false): _resolve_gunshots()

func _return_from_explore() -> void:
	if active_location!="": _v8_begin_return_trip()
	else: _show_shelter()

func _evolve_city() -> void:
	mutation_pressure = mini(100, mutation_pressure + 2 + int(day / 5))
	noise = maxi(0, noise - 12)
	var names: Array = CITY_LOCATIONS.keys()
	var changes := mini(3, 1 + int(day / 7))
	for i in range(changes):
		var name := str(names[rng.randi_range(0, names.size() - 1)])
		var st: Dictionary = location_states[name]
		var rise := rng.randi_range(3, 9) + _mutation_tier() * 2
		st["infestation"] = mini(100, int(st.get("infestation",0)) + rise)
		if int(st["infestation"]) >= 72 and int(st.get("searches_left",0)) > 0:
			st["status"] = "NINHO"
		elif int(st["infestation"]) >= 45 and str(st.get("status","")) != "SAQUEADO":
			st["status"] = "INFESTADO"
		location_states[name] = st
	if mutation_pressure >= 20 and not event_flags.get("mutation_tier2_seen", false):
		event_flags["mutation_tier2_seen"] = true
		_add_event("INFECÇÃO", "Foram vistos infectados rápidos e um uivo estranho vindo do Centro.")
	if mutation_pressure >= 45 and not event_flags.get("mutation_tier3_seen", false):
		event_flags["mutation_tier3_seen"] = true
		_add_event("INFECÇÃO", "As mutações ficaram grandes demais para serem chamadas de humanas.")
	if mutation_pressure >= 75 and not event_flags.get("mutation_tier4_seen", false):
		event_flags["mutation_tier4_seen"] = true
		_add_event("INFECÇÃO", "A cidade entrou em estágio de aberração. Algumas áreas parecem vivas.")

func _consume_shelter_supplies() -> String:
	var need := maxi(1, survivor_count)
	var eaten := mini(need, int(inventory.food))
	var drank := mini(need, int(inventory.water))
	inventory.food -= eaten
	inventory.water -= drank
	var text := "O abrigo consumiu comida %d/%d e água %d/%d." % [eaten, need, drank, need]
	if eaten < need:
		hunger = mini(100, hunger + (need - eaten) * 10)
		morale = maxi(0, morale - (need - eaten) * 3)
		text += " Faltou comida."
	if drank < need:
		thirst = mini(100, thirst + (need - drank) * 12)
		morale = maxi(0, morale - (need - drank) * 3)
		text += " Faltou água."
	if upgrades.filter > 0 and weather_severity > 0:
		inventory.water += upgrades.filter
		text += " O filtro coletou %d água." % upgrades.filter
	return text

func _end_day() -> void:
	day += 1
	hour = 7
	minute = 0
	actions_left = 3
	hunger = mini(100, hunger + 10)
	thirst = mini(100, thirst + 12)
	fatigue = mini(100, fatigue + 10)
	var supply_report := _consume_shelter_supplies()
	_evolve_city()
	_v7_daily_tick()
	_roll_weather()
	_unlock_districts()
	if hunger >= 90:
		life = maxi(0, life - 8); morale = maxi(0, morale - 3); _add_event("FOME", "Seu corpo começou a ceder por falta de comida.")
	if thirst >= 90:
		life = maxi(0, life - 12); morale = maxi(0, morale - 4); _add_event("SEDE", "A desidratação está ficando perigosa.")
	if fatigue >= 90:
		actions_left = maxi(1, actions_left - 1); _add_event("CANSAÇO", "Você acordou exausto e perdeu uma ação do dia.")
	var night_risk := maxi(4, 18 + threat / 8 + noise / 6 + _mutation_tier() * 3 - upgrades.fence * 6)
	var event := "A noite passou sem visitas."
	if rng.randi_range(1,100) <= night_risk:
		var night_damage := rng.randi_range(4,10 + _mutation_tier() * 2)
		night_damage=maxi(2,night_damage-_v14_clothing_protection())
		life = maxi(0, life - night_damage)
		morale = maxi(0, morale - 4)
		threat = mini(100, threat + 5)
		event = "Algo testou as defesas durante a madrugada. Vida -%d." % night_damage
	else:
		threat = maxi(0, threat - 2)
	if infection > 0: infection = mini(100, infection + rng.randi_range(0, 3 + _mutation_tier()))
	_apply_survivor_bonuses()
	journal.append("Dia %d — %s %s" % [day, event, supply_report])
	_add_event("NOITE", "%s %s" % [event, supply_report])
	_update_all(); _save_game(); _show_shelter(); _toast(event)
	if life <= 0 or infection >= 100:
		call_deferred("_game_over")
	else:
		if _v7_has_pending_social_crisis(): call_deferred("_v7_trigger_social_crisis")
		else: call_deferred("_trigger_daily_event")

func _game_over() -> void:
	var reason := "Seus ferimentos venceram." if life <= 0 else "A infecção tomou conta do seu corpo."
	_open_modal("VOCÊ NÃO VOLTOU", "%s\n\nDias sobrevividos: %d\nNível: %d\nBosses derrotados: %d\nInfectados abatidos: %d" % [reason, day, survivor_level, bosses_defeated, infected_kills], [["NOVO JOGO", Callable(self,"_confirm_new_game")], ["MENU", Callable(self,"_show_menu")]])

func _mission_progress(id: String, value: int) -> void:
	for m in missions:
		if str(m.get("id","")) != id or bool(m.get("done",false)): continue
		if id == "supplies": m["current"] = mini(int(m["target"]), value)
		else: m["current"] = mini(int(m["target"]), int(m["current"]) + value)
		if int(m["current"]) >= int(m["target"]):
			m["done"] = true
			var xp_reward := 15
			if id == "wake": xp_reward = 10
			elif id == "signal" or id == "fortify": xp_reward = 20
			elif id.begins_with("boss_"): xp_reward = 35
			_gain_xp(xp_reward)
			if id == "supplies": morale = mini(100, morale + 8)
			journal.append("MISSÃO CONCLUÍDA — %s" % str(m["title"]))
			_add_event("MISSÃO", "%s concluída." % str(m["title"]))
			_toast("MISSÃO CONCLUÍDA: %s" % str(m["title"]))

func _missions_bbcode() -> String:
	var out := ""
	for m in missions:
		var mark := "[color=#4d6b4f]CONCLUÍDA[/color]" if m.done else "%d/%d" % [m.current, m.target]
		out += "[b]%s[/b]  %s\n%s\nRecompensa: %s\n\n" % [m.title, mark, m.desc, m.reward]
	return out

func _update_all() -> void:
	day_label.text = "DIA %d" % day
	time_label.text = "%02d:%02d" % [hour, minute]
	if weather_label != null: weather_label.text = "%s • %d°C • %dkm/h" % [weather, temperature, wind_speed]
	_update_environment()
	var vals := {"life":life,"hunger":hunger,"thirst":thirst,"fatigue":fatigue,"infection":infection,"morale":morale}
	for k in vals:
		stat_bars[k].value = vals[k]
		stat_values[k].text = "%d/100" % vals[k]
	action_label.text = "AÇÕES %d/3\nNV.%d • PODER %d" % [actions_left, survivor_level, _player_power()]
	for k in item_slots:
		var count := 0
		if k == "backpack": count = _total_weight()
		else: count = int(inventory.get(k,0))
		var lab := item_slots[k].get_node("SlotBox/Count") as Label
		if lab:
			var item_names := {"backpack":"PESO", "knife":"FACA", "pistol":"PISTOLA", "ammo":"MUNIÇÃO", "food":"COMIDA", "water":"ÁGUA", "med":"REMÉDIO", "scrap":"SUCATA", "cloth":"TECIDO"}
			lab.text = "%s  %d" % [item_names.get(k, k.to_upper()), count]
	if selected_panel == "inventory": _show_inventory_panel()

func _max_weight() -> int:
	return 14 + backpack_level * 8 + upgrades.storage * 4

func _total_weight() -> int:
	# Peso inclui recursos de crafting e a própria roupa: carregar metal e madeira precisa importar.
	var w:=float(inventory.food)*0.45 + float(inventory.water)*0.5 + float(inventory.med)*0.18 + float(inventory.scrap)*0.65 + float(inventory.cloth)*0.18 + float(inventory.bandage)*0.08 + float(inventory.antibiotic)*0.08 + float(inventory.battery)*0.22 + float(inventory.electronics)*0.32 + float(inventory.fuel)*1.0 + float(inventory.samples)*0.12 + float(inventory.ammo)*0.035
	w += float(materials.get("wood",0))*0.8 + float(materials.get("steel",0))*0.75 + float(materials.get("copper",0))*0.42 + float(materials.get("wire",0))*0.12 + float(materials.get("nails",0))*0.06 + float(materials.get("screws",0))*0.05
	w += float(materials.get("mechanical",0))*0.9 + float(materials.get("chemicals",0))*0.35 + float(materials.get("coal",0))*0.7 + float(materials.get("raw_meat",0))*0.6 + float(materials.get("preserved_meat",0))*0.5 + float(materials.get("vegetables",0))*0.35 + float(materials.get("eggs",0))*0.12
	w += float(_v14_clothing_meta().get("weight",1.2))
	return maxi(0,int(round(w)))

func _toast(text_value: String) -> void:
	toast.text = text_value
	var tw := create_tween()
	toast.modulate.a = 1.0
	tw.tween_interval(2.6)
	tw.tween_property(toast, "modulate:a", 0.0, 0.6)
	tw.tween_callback(func(): toast.text = ""; toast.modulate.a = 1.0)

func _open_modal(title: String, body: String, actions: Array) -> void:
	overlay_layer.visible = true
	modal_title.text = title
	modal_art.visible = false
	modal_body.size.x = 680
	modal_body.text = body
	for c in modal_actions.get_children(): c.queue_free()
	for spec in actions:
		var b := _make_dark_button(spec[0], Vector2(680, 34))
		b.add_theme_font_size_override("font_size", 16)
		b.pressed.connect(spec[1])
		modal_actions.add_child(b)

func _show_modal_art(tex: Texture2D) -> void:
	if modal_art == null: return
	modal_art.texture = tex
	modal_art.visible = true
	modal_body.size.x = 450

func _close_modal() -> void:
	overlay_layer.visible = false

func _build_ambient_audio() -> void:
	rain_audio_player = AudioStreamPlayer.new()
	rain_audio_player.stream = RAIN_AUDIO
	rain_audio_player.volume_db = -22.0
	rain_audio_player.finished.connect(_restart_rain_audio)
	game_layer.add_child(rain_audio_player)
	radio_audio_player = AudioStreamPlayer.new()
	radio_audio_player.stream = RADIO_AUDIO
	radio_audio_player.volume_db = -15.0
	game_layer.add_child(radio_audio_player)
	wind_audio_player = AudioStreamPlayer.new()
	wind_audio_player.stream = WIND_AUDIO
	wind_audio_player.volume_db = -28.0
	wind_audio_player.finished.connect(_restart_wind_audio)
	game_layer.add_child(wind_audio_player)
	v18_ambient_player = AudioStreamPlayer.new()
	v18_ambient_player.volume_db = -30.0
	v18_ambient_player.finished.connect(_v18_restart_ambient)
	game_layer.add_child(v18_ambient_player)

func _restart_rain_audio() -> void:
	if sound_enabled and game_layer.visible and weather_severity > 0:
		rain_audio_player.play()

func _restart_wind_audio() -> void:
	if sound_enabled and game_layer.visible and wind_speed >= 14:
		wind_audio_player.play()

func _v18_restart_ambient() -> void:
	if sound_enabled and game_layer.visible and v18_ambient_player!=null and v18_ambient_player.stream!=null: v18_ambient_player.play()

func _v18_ambient_choice() -> Dictionary:
	if v8_street_layer!=null and v8_street_layer.visible:
		return {"key":"urban","stream":V18_URBAN_AUDIO,"gain":0.18}
	if active_location!="":
		var district:=str(CITY_LOCATIONS.get(active_location,{}).get("district",""))
		if district=="ZONA INDUSTRIAL" or active_location in ["OFICINA","POSTO","ARMAZÉM","FÁBRICA","FERRO-VELHO","SUBESTAÇÃO","SILO"]:
			return {"key":"industrial","stream":V18_INDUSTRIAL_AUDIO,"gain":0.16}
		return {"key":"interior","stream":V18_INTERIOR_AUDIO,"gain":0.13}
	return {"key":"shelter","stream":V18_INTERIOR_AUDIO,"gain":0.10}

func _v18_update_ambient_audio() -> void:
	if v18_ambient_player==null: return
	var choice:=_v18_ambient_choice(); var key:=str(choice.key)
	if key!=v18_ambient_key:
		v18_ambient_key=key; v18_ambient_player.stop(); v18_ambient_player.stream=choice.stream
	v18_ambient_player.volume_db=linear_to_db(maxf(0.001,ambience_volume*float(choice.gain)))
	if sound_enabled and game_layer.visible:
		if not v18_ambient_player.playing: v18_ambient_player.play()
	elif v18_ambient_player.playing: v18_ambient_player.stop()

func _v14_wind_screen_sign() -> float:
	if "O" in wind_direction and "L" not in wind_direction: return 1.0
	if "L" in wind_direction: return -1.0
	return 0.35 if wind_direction in ["N","NE","NO"] else -0.35

func _update_environment() -> void:
	if rain_layer == null:
		return
	rain_layer.visible = weather_severity > 0
	var rain_alpha := 0.0
	if weather_severity == 1: rain_alpha = 0.11
	elif weather_severity == 2: rain_alpha = 0.20
	elif weather_severity >= 3: rain_alpha = 0.31
	rain_layer.modulate = Color(0.72, 0.78, 0.82, rain_alpha)
	if scene_texture != null:
		var time_tint:=Color.WHITE
		if hour >= 19 or hour < 6: time_tint=Color(0.68,0.73,0.82,1.0)
		elif hour >= 16: time_tint=Color(0.88,0.80,0.69,1.0)
		var season_tint:=Color.WHITE
		match season:
			"INVERNO": season_tint=Color(0.86,0.92,1.0,1.0)
			"OUTONO": season_tint=Color(1.0,0.92,0.80,1.0)
			"PRIMAVERA": season_tint=Color(0.94,1.0,0.94,1.0)
			"VERÃO": season_tint=Color(1.0,0.95,0.84,1.0)
		scene_texture.modulate=Color(time_tint.r*season_tint.r,time_tint.g*season_tint.g,time_tint.b*season_tint.b,1.0)
	if rain_audio_player != null:
		rain_audio_player.volume_db = linear_to_db(maxf(0.001, ambience_volume * (0.20 + float(weather_severity) * 0.10)))
		if sound_enabled and weather_severity > 0 and game_layer.visible:
			if not rain_audio_player.playing: rain_audio_player.play()
		elif rain_audio_player.playing:
			rain_audio_player.stop()
	if wind_audio_player != null:
		var wind_mix:=clampf((float(wind_speed)-10.0)/45.0,0.0,1.0)
		wind_audio_player.volume_db=linear_to_db(maxf(0.001,ambience_volume*(0.06+wind_mix*0.32)))
		if sound_enabled and wind_speed>=14 and game_layer.visible:
			if not wind_audio_player.playing: wind_audio_player.play()
		elif wind_audio_player.playing:
			wind_audio_player.stop()

func _roll_weather() -> void:
	_v12_roll_environment()

func _add_event(source: String, message: String) -> void:
	var stamp := "%02d:%02d" % [hour, minute]
	event_history.append("%s • %s — %s" % [stamp, source, message])
	while event_history.size() > 10:
		event_history.pop_front()

func _recent_events_bbcode(max_count: int) -> String:
	if event_history.is_empty():
		return "Nenhuma mensagem nova."
	var out := ""
	var start := maxi(0, event_history.size() - max_count)
	for i in range(start, event_history.size()):
		out += "• %s\n" % event_history[i]
	return out

func _scan_radio() -> void:
	if actions_left <= 0:
		_toast("Você não tem tempo para varrer frequências hoje.")
		return
	actions_left -= 1
	_v12_advance_time(45,"varredura de rádio",0.03,false); _v12_daily_add("radio",1)
	if radio_audio_player != null and sound_enabled:
		radio_audio_player.volume_db=linear_to_db(maxf(0.001,radio_volume*0.45))
		radio_audio_player.play()
	_update_all()
	var candidates: Array[String] = []
	if not event_flags.get("radio_help_seen", false): candidates.append("radio_help")
	if not event_flags.get("shots_seen", false): candidates.append("gunshots")
	if survivor_count > 1 and not event_flags.get("antibiotics_seen", false): candidates.append("expedition")
	candidates.append("static")
	var pick := candidates[rng.randi_range(0, candidates.size() - 1)]
	if pick == "static":
		_add_event("RÁDIO", "Só estática, um código incompleto e uma voz que desapareceu antes de dizer o endereço.")
		_save_game()
		_show_radio_panel()
		_toast("Nada claro atravessou a estática.")
	else:
		_trigger_story_event(pick)

func _accept_mechanic() -> void:
	if inventory.food <= 0:
		_toast("Você não tem comida para dividir.")
		return
	inventory.food -= 1
	survivor_count += 1
	survivors.append(_v7_make_survivor("MARCOS","MECÂNICO",45, "DÍVIDA COM OS FERROS-VELHOS"))
	upgrades.workbench += 1
	morale = mini(100, morale + 5)
	event_flags["mechanic_joined"] = true
	journal.append("Dia %d — Marcos, um mecânico, entrou no abrigo." % day)
	_add_event("ABRIGO", "Marcos entrou no grupo e melhorou a oficina para Nv.%d." % upgrades.workbench)
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _refuse_mechanic() -> void:
	morale = maxi(0, morale - 2)
	_add_event("PORTÃO", "O mecânico foi embora antes de escurecer.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _mark_random_nest() -> void:
	var candidates: Array[String] = []
	for name in CITY_LOCATIONS:
		if _location_available(str(name)) and int(location_states[name].get("searches_left",0)) > 0:
			candidates.append(str(name))
	if candidates.is_empty():
		_close_modal(); return
	var target := candidates[rng.randi_range(0, candidates.size()-1)]
	var st: Dictionary = location_states[target]
	st["infestation"] = mini(100, maxi(72, int(st.get("infestation",0)) + 25))
	st["status"] = "NINHO"
	location_states[target] = st
	_add_mission("nest_" + target.to_lower(), "NINHO EM %s" % target, "Entre em %s e reduza a infestação antes que ela se espalhe." % target, 1, "+30 XP • reduz pressão")
	_add_event("INFECÇÃO", "%s virou um ninho ativo." % target)
	_close_modal(); _save_game(); _show_map(); _toast("Novo ninho marcado no mapa.")

func _destroy_nest(name: String) -> void:
	if not location_states.has(name): return
	var st: Dictionary = location_states[name]
	if str(st.get("status","")) != "NINHO": return
	if inventory.fuel > 0:
		inventory.fuel -= 1
	else:
		life = maxi(1, life - 8)
	st["infestation"] = maxi(15, int(st.get("infestation",0)) - 50)
	st["status"] = "VASCULHADO"
	location_states[name] = st
	mutation_pressure = maxi(0, mutation_pressure - 7)
	_mission_progress("nest_" + name.to_lower(), 1)
	_gain_xp(18)
	_add_event(name, "O ninho foi destruído. A pressão da infecção caiu.")

func _trade_scavenger() -> void:
	if inventory.scrap < 2:
		_toast("Você não tem as 2 sucatas que ele quer.")
		return
	inventory.scrap -= 2
	inventory.food += 1
	inventory.med += 1
	_add_event("ESTRADA", "Troca concluída: -2 sucatas, +1 comida, +1 remédio.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _ignore_scavenger() -> void:
	_add_event("ESTRADA", "O catador seguiu caminho sem dizer o nome.")
	_close_modal(); _save_game(); _show_shelter()

func _investigate_mutation() -> void:
	_add_mission("samples", "O QUE ELES ESTÃO VIRANDO", "Colete 3 amostras de infectados mutantes.", 3, "Pesquisa +3 • +30 XP")
	_add_event("PESQUISA", "O diário agora tem uma seção dedicada às mutações.")
	_close_modal(); _save_game(); _show_research_panel()

func _trigger_daily_event() -> void:
	var pool: Array[String] = []
	if weather_severity >= 2: pool.append("heavy_rain")
	if not event_flags.get("radio_help_seen", false): pool.append("radio_help")
	if not event_flags.get("gate_seen", false): pool.append("survivor_gate")
	if not event_flags.get("shots_seen", false): pool.append("gunshots")
	if survivor_count > 1 and not event_flags.get("antibiotics_seen", false): pool.append("expedition")
	if day >= 3 and not event_flags.get("mechanic_seen", false): pool.append("mechanic")
	if mutation_pressure >= 15 and not event_flags.get("mutation_event_seen", false): pool.append("mutation_warning")
	if day >= 5: pool.append("nest_growth")
	if day >= 4: pool.append("scavenger")
	pool.append("blackout")
	if pool.is_empty(): return
	_trigger_story_event(pool[rng.randi_range(0, pool.size() - 1)])

func _trigger_story_event(id: String) -> void:
	if id == "radio_help":
		event_flags["radio_help_seen"] = true
		_add_event("RÁDIO", "Uma voz masculina atravessa o chiado: 'Estou preso na escola. Segundo andar. Não tenho muito tempo.'")
		_open_modal("SINAL DE SOCORRO", "[b]RÁDIO — 104.7 MHz[/b]\n\nUma voz cansada corta a estática.\n\n'Quem estiver ouvindo... meu nome é Davi. Estou na escola, segundo andar. A escada está bloqueada e eles estão entrando pelo térreo.'\n\n[color=#8f2b28]Ir até lá será perigoso.[/color]", [["ACEITAR O RESGATE", Callable(self,"_accept_rescue_davi")], ["DESLIGAR O RÁDIO", Callable(self,"_ignore_rescue_davi")]])
	elif id == "survivor_gate":
		event_flags["gate_seen"] = true
		_add_event("PORTÃO", "Uma mulher ferida bateu três vezes e pediu abrigo.")
		_open_modal("ALGUÉM NO PORTÃO", "A batida não parece de um infectado.\n\nUma mulher chamada Lúcia está do outro lado da cerca. O braço está cortado e ela mal consegue ficar em pé.\n\nEla pede um remédio e um lugar para passar a noite.", [["AJUDAR (1 REMÉDIO)", Callable(self,"_help_gate_survivor")], ["NÃO ABRIR", Callable(self,"_refuse_gate_survivor")]])
	elif id == "gunshots":
		event_flags["shots_seen"] = true
		_add_event("RUA", "Três disparos vieram da direção da Delegacia. Depois, um clarão.")
		_open_modal("TIROS AO NORTE", "Três disparos ecoaram perto da Delegacia.\n\nPode ser alguém vivo. Pode ser uma armadilha. Também pode haver munição abandonada por lá.\n\n[color=#8f2b28]A área está marcada como alto risco.[/color]", [["MARCAR PARA INVESTIGAR", Callable(self,"_accept_investigate_shots")], ["IGNORAR", Callable(self,"_ignore_gunshots")]])
	elif id == "expedition":
		event_flags["antibiotics_seen"] = true
		_add_event("ABRIGO", "Lúcia quer procurar antibióticos na Farmácia antes que a chuva piore.")
		_open_modal("PROPOSTA DE EXPEDIÇÃO", "Lúcia acredita que ainda existem antibióticos na Farmácia.\n\nEla quer sair ao amanhecer, mas não pretende ir sozinha.\n\nA busca pode render remédios para o grupo.", [["IR COM ELA", Callable(self,"_accept_antibiotics")], ["ADIAR A SAÍDA", Callable(self,"_decline_antibiotics")]])
	elif id == "mechanic":
		event_flags["mechanic_seen"] = true
		_add_event("PORTÃO", "Um homem com uma caixa de ferramentas pediu abrigo em troca de trabalho.")
		_open_modal("UM MECÂNICO NO PORTÃO", "Marcos diz que trabalhou anos com motores e geradores. Ele está com fome e oferece consertar a oficina se puder ficar.\n\nEle pede uma refeição antes de entrar.", [["ACOLHER (1 COMIDA)", Callable(self,"_accept_mechanic")], ["MANDAR EMBORA", Callable(self,"_refuse_mechanic")]])
	elif id == "mutation_warning":
		event_flags["mutation_event_seen"] = true
		_add_event("RÁDIO", "Uma transmissão descreveu infectados que correm e reagem a som.")
		_open_modal("ELES ESTÃO MUDANDO", "Uma voz no rádio repete a mesma frase: 'não são mais os mesmos'.\n\nRelatos falam de infectados rápidos, cegos e criaturas que chamam outras com um uivo.\n\n[color=#8f2b28]A pressão da infecção está em %d/100.[/color]" % mutation_pressure, [["COMEÇAR A PESQUISAR", Callable(self,"_investigate_mutation")], ["IGNORAR", Callable(self,"_close_modal")]])
	elif id == "nest_growth":
		_open_modal("UM NINHO SE FORMOU", "O rádio capta relatos de uma rua tomada por matéria orgânica e infectados se reunindo no mesmo local.\n\nSe ninguém agir, a infestação vai continuar crescendo.", [["MARCAR NO MAPA", Callable(self,"_mark_random_nest")], ["DEIXAR PARA DEPOIS", Callable(self,"_close_modal")]])
	elif id == "scavenger":
		_add_event("ESTRADA", "Um catador apareceu perto da cerca oferecendo comida e remédio por peças.")
		_open_modal("UM CATADOR", "Ele não quer entrar. Só mostra uma mochila e aponta para sua caixa de peças.\n\nOferta: 2 sucatas por 1 comida e 1 remédio.", [["TROCAR", Callable(self,"_trade_scavenger")], ["RECUSAR", Callable(self,"_ignore_scavenger")]])
	elif id == "heavy_rain":
		_add_event("TEMPORAL", "A água começou a entrar por uma fresta da janela e o telhado está gemendo.")
		_open_modal("TEMPORAL", "A chuva ficou forte demais. A água escorre pelas tábuas da janela e parte do teto começou a pingar.\n\nVocê pode reforçar a abertura com sucata ou aproveitar a água da chuva.", [["REFORÇAR (1 SUCATA)", Callable(self,"_reinforce_storm")], ["COLETAR ÁGUA", Callable(self,"_collect_rainwater")]])
	elif id == "blackout":
		_add_event("ABRIGO", "A lâmpada apagou e o rádio perdeu força por alguns segundos.")
		_open_modal("QUEDA DE ENERGIA", "A lâmpada pisca duas vezes e apaga.\n\nNo escuro, cada ruído do lado de fora parece mais perto. O rádio ainda funciona, mas com sinal fraco.", [["REPARAR (1 SUCATA)", Callable(self,"_repair_power")], ["ESPERAR", Callable(self,"_wait_blackout")]])

func _add_mission(id: String, title: String, desc: String, target: int, reward: String) -> void:
	for m in missions:
		if str(m.get("id", "")) == id:
			return
	missions.append({"id":id, "title":title, "desc":desc, "target":target, "current":0, "reward":reward, "done":false})

func _accept_rescue_davi() -> void:
	event_flags["rescue_davi"] = true
	_add_mission("rescue_davi", "VOZ NA ESCOLA", "Vá até a Escola e encontre Davi no segundo andar.", 1, "Davi entra no grupo • +8 Moral")
	morale = mini(100, morale + 2)
	journal.append("Dia %d — prometi pelo rádio que iria buscar Davi na Escola." % day)
	_add_event("MISSÃO", "Resgate de Davi aceito. Destino: Escola.")
	_close_modal(); _save_game(); _show_missions_panel(); _toast("Nova missão: VOZ NA ESCOLA")

func _ignore_rescue_davi() -> void:
	morale = maxi(0, morale - 4)
	journal.append("Dia %d — ouvi um pedido de socorro e desliguei o rádio." % day)
	_add_event("RÁDIO", "O pedido de Davi sumiu na estática. Moral -4.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _resolve_rescue_davi() -> void:
	if not event_flags.get("rescue_davi", false): return
	event_flags["rescue_davi"] = false
	survivor_count += 1
	survivors.append(_v7_make_survivor("DAVI","SOCORRISTA",55, "PROCURA A IRMÃ"))
	morale = mini(100, morale + 8)
	_mission_progress("rescue_davi", 1)
	journal.append("Dia %d — encontrei Davi vivo na Escola. Agora somos %d." % [day, survivor_count])
	_add_event("RESGATE", "Davi voltou com você para o abrigo.")

func _help_gate_survivor() -> void:
	if inventory.med <= 0:
		_open_modal("SEM REMÉDIO", "Você procura a mochila duas vezes. Não há nenhum remédio para tratar o ferimento dela.", [["NÃO ABRIR", Callable(self,"_refuse_gate_survivor")], ["VOLTAR", Callable(self,"_close_modal")]])
		return
	inventory.med -= 1
	survivor_count += 1
	survivors.append(_v7_make_survivor("LÚCIA","BATEDORA",48, "EX-INTEGRANTE DA VIGÍLIA"))
	morale = mini(100, morale + 6)
	event_flags["lucia_joined"] = true
	journal.append("Dia %d — Lúcia entrou no abrigo. Gastei um remédio no ferimento dela." % day)
	_add_event("ABRIGO", "Lúcia entrou no grupo. Sobreviventes: %d." % survivor_count)
	_close_modal(); _update_all(); _save_game(); _show_shelter(); _toast("Lúcia agora faz parte do abrigo.")

func _refuse_gate_survivor() -> void:
	morale = maxi(0, morale - 5)
	threat = maxi(0, threat - 1)
	journal.append("Dia %d — não abri o portão para a sobrevivente ferida." % day)
	_add_event("PORTÃO", "As batidas pararam. Moral -5.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _accept_antibiotics() -> void:
	event_flags["antibiotics"] = true
	_add_mission("antibiotics", "ANTIBIÓTICOS", "Vá à Farmácia com Lúcia e procure antibióticos.", 1, "+2 Remédios • +4 Moral")
	journal.append("Dia %d — aceitei procurar antibióticos com Lúcia." % day)
	_add_event("MISSÃO", "Expedição à Farmácia adicionada.")
	_close_modal(); _save_game(); _show_missions_panel(); _toast("Nova missão: ANTIBIÓTICOS")

func _decline_antibiotics() -> void:
	morale = maxi(0, morale - 2)
	_add_event("ABRIGO", "A expedição à Farmácia foi adiada.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _resolve_antibiotics() -> void:
	if not event_flags.get("antibiotics", false): return
	event_flags["antibiotics"] = false
	inventory.med += 2
	morale = mini(100, morale + 4)
	_mission_progress("antibiotics", 1)
	journal.append("Dia %d — encontramos antibióticos na Farmácia." % day)
	_add_event("FARMÁCIA", "A expedição trouxe 2 remédios para o abrigo.")

func _accept_investigate_shots() -> void:
	event_flags["investigate_shots"] = true
	_add_mission("investigate_shots", "TIROS AO NORTE", "Investigue a Delegacia e descubra quem disparou.", 1, "+Munição • reduz ameaça")
	_add_event("MISSÃO", "Delegacia marcada para investigação.")
	_close_modal(); _save_game(); _show_missions_panel(); _toast("Nova missão: TIROS AO NORTE")

func _ignore_gunshots() -> void:
	threat = mini(100, threat + 4)
	_add_event("RUA", "Os disparos cessaram, mas ninguém sabe quem estava lá. Ameaça +4.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _resolve_gunshots() -> void:
	if not event_flags.get("investigate_shots", false): return
	event_flags["investigate_shots"] = false
	inventory.ammo += 3
	threat = maxi(0, threat - 7)
	_mission_progress("investigate_shots", 1)
	journal.append("Dia %d — encontrei cartuchos e sinais de sobreviventes na Delegacia." % day)
	_add_event("DELEGACIA", "Você trouxe 3 munições e descobriu uma rota mais segura.")

func _reinforce_storm() -> void:
	if inventory.scrap <= 0:
		_open_modal("SEM SUCATA", "Você não tem material suficiente para reforçar a janela.", [["COLETAR ÁGUA", Callable(self,"_collect_rainwater")], ["VOLTAR", Callable(self,"_close_modal")]])
		return
	inventory.scrap -= 1
	threat = maxi(0, threat - 3)
	morale = mini(100, morale + 1)
	_add_event("TEMPORAL", "A janela foi reforçada antes que a água invadisse o abrigo.")
	_close_modal(); _update_all(); _save_game(); _show_shelter(); _toast("Janela reforçada.")

func _collect_rainwater() -> void:
	var amount := 2 if upgrades.filter > 0 else 1
	inventory.water += amount
	if upgrades.filter <= 0:
		infection = mini(100, infection + 2)
		_add_event("TEMPORAL", "Você coletou água sem filtro. +1 água, infecção +2.")
	else:
		_add_event("TEMPORAL", "O filtro tornou a água da chuva utilizável. +2 água.")
	_close_modal(); _update_all(); _save_game(); _show_shelter(); _toast("Água da chuva coletada.")

func _repair_power() -> void:
	if inventory.scrap <= 0:
		_toast("Sem sucata para reparar a fiação.")
		return
	inventory.scrap -= 1
	radio_signal = mini(100, radio_signal + 8)
	morale = mini(100, morale + 2)
	_add_event("ENERGIA", "A fiação foi reparada e o rádio recuperou sinal.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _wait_blackout() -> void:
	morale = maxi(0, morale - 3)
	radio_signal = maxi(0, radio_signal - 6)
	_add_event("ENERGIA", "Você passou horas no escuro. Moral -3, sinal do rádio piorou.")
	_close_modal(); _update_all(); _save_game(); _show_shelter()

func _save_game() -> void:
	_v11_update_legacy()
	_v10_sync_character_unlocks()
	var data := {
		"save_version":18,
		"day":day,"hour":hour,"actions":actions_left,"life":life,"hunger":hunger,"thirst":thirst,"fatigue":fatigue,"infection":infection,"morale":morale,
		"inventory":inventory,"upgrades":upgrades,"visited":visited,"journal":journal,"missions":missions,
		"weather":weather,"weather_severity":weather_severity,"threat":threat,"survivor_count":survivor_count,"radio_signal":radio_signal,"event_history":event_history,"event_flags":event_flags,
		"survivor_level":survivor_level,"survivor_xp":survivor_xp,"skill_points":skill_points,"combat_training":combat_training,"scavenging_skill":scavenging_skill,"field_medicine":field_medicine,
		"research_points":research_points,"mutation_pressure":mutation_pressure,"bosses_defeated":bosses_defeated,"infected_kills":infected_kills,"noise":noise,
		"equipped_melee":equipped_melee,"equipped_firearm":equipped_firearm,"armor_name":armor_name,"backpack_level":backpack_level,
		"location_states":location_states,"room_states":room_states,"survivors":survivors,"discovered_districts":discovered_districts,"bosses":bosses,
		"body_weight":body_weight,"body_fat":body_fat,"strength":strength,"fitness":fitness,"energy":energy,"soreness":soreness,"stress":stress,"hygiene":hygiene,"calories_today":calories_today,"activity_calories":activity_calories,"injuries":injuries,
		"skills":skills,"skill_xp":skill_xp,"found_books":found_books,"known_books":known_books,"known_recipes":known_recipes,"materials":materials,"tools":tools,"facilities":facilities,"special_items":special_items,"traps_set":traps_set,"wildlife_density":wildlife_density,"fish_density":fish_density,"farm":farm,"animals":animals,
		"community_tension":community_tension,"partner_name":partner_name,"children":children,"pregnancies":pregnancies,"factions":factions,"world_news_seen":world_news_seen,"lore_archive":lore_archive,"season":season,"temperature":temperature,"vehicles":vehicles,"active_vehicle":active_vehicle,"city_projects":city_projects,
		"detailed_food":detailed_food,"room_conditions":room_conditions,"global_events_active":global_events_active,"world_state":world_state,"stomach_sick":stomach_sick,
		"survivor_tasks":survivor_tasks,"community_clues":community_clues,"community_supplies_stolen":community_supplies_stolen,
		"community_cohesion":community_cohesion,"shelter_comfort":shelter_comfort,"community_memories":community_memories,"routine_history":routine_history,"last_community_scene":last_community_scene,
		"selected_character_id":selected_character_id,
		"minute":minute,"wind_speed":wind_speed,"wind_direction":wind_direction,"humidity":humidity,"visibility":visibility,"wetness":wetness,"body_temperature":body_temperature,"sunrise_minute":sunrise_minute,"sunset_minute":sunset_minute,"forecast_text":forecast_text,"diseases":diseases,"total_distance_km":total_distance_km,"expedition_distance_km":expedition_distance_km,
		"v13_pending_event":v13_pending_event,"v13_event_memory":v13_event_memory,"v13_story_flags":v13_story_flags,"v13_last_event_day":v13_last_event_day,"v13_event_person":v13_event_person,
		"v13_expedition_start_day":v13_expedition_start_day,"v13_expedition_start_minute":v13_expedition_start_minute,"v13_expedition_start_thirst":v13_expedition_start_thirst,"v13_expedition_start_fatigue":v13_expedition_start_fatigue,"v13_expedition_start_weight":v13_expedition_start_weight,"v13_attention_scans":v13_attention_scans,"v13_delayed_storylets":v13_delayed_storylets,"v13_last_trip_summary":v13_last_trip_summary,
		"v14_disease_days":v14_disease_days,"v14_weather_history":v14_weather_history,"v14_environment_flags":v14_environment_flags,"owned_clothing":owned_clothing,"equipped_clothing":equipped_clothing,"clothing_condition":clothing_condition,
		"shelter_integrity":shelter_integrity,"shelter_cleanliness":shelter_cleanliness,"shelter_heat":shelter_heat,"maintenance_debt":maintenance_debt,"roof_leak":roof_leak,"shelter_maintenance_history":shelter_maintenance_history,"v16_story_flags":v16_story_flags,"v16_last_maintenance_day":v16_last_maintenance_day,"v16_camp_active":v16_camp_active,"v16_camp_name":v16_camp_name,"v16_camp_quality":v16_camp_quality,
		"v18_story_flags":v18_story_flags,"v18_special_rooms_seen":v18_special_rooms_seen,"v18_route_experience":v18_route_experience,"v18_location_knowledge":v18_location_knowledge,"v18_last_prep_score":v18_last_prep_score
	}
	var f := FileAccess.open("user://afterfall_save_v18.json", FileAccess.WRITE)
	if f:
		f.store_string(JSON.stringify(data))
		has_save = true

func _load_save_presence() -> void:
	has_save = FileAccess.file_exists("user://afterfall_save_v18.json")

func _load_game() -> bool:
	if not FileAccess.file_exists("user://afterfall_save_v18.json"): return false
	var f := FileAccess.open("user://afterfall_save_v18.json", FileAccess.READ)
	if not f: return false
	var parsed = JSON.parse_string(f.get_as_text())
	if typeof(parsed) != TYPE_DICTIONARY: return false
	if int(parsed.get("save_version",0)) < 18:
		# Saves antigos eram protótipos e não continham o estado de cidade/mutações.
		return false
	day = int(parsed.get("day",1)); hour = int(parsed.get("hour",7)); actions_left = int(parsed.get("actions",3))
	life = int(parsed.get("life",100)); hunger = int(parsed.get("hunger",18)); thirst = int(parsed.get("thirst",15)); fatigue = int(parsed.get("fatigue",12)); infection = int(parsed.get("infection",0)); morale = int(parsed.get("morale",55))
	inventory = parsed.get("inventory", inventory)
	upgrades = parsed.get("upgrades", upgrades)
	visited = parsed.get("visited", visited)
	journal = []
	for x in parsed.get("journal", []): journal.append(str(x))
	missions = parsed.get("missions", _base_missions())
	weather = str(parsed.get("weather", "GAROA")); weather_severity = int(parsed.get("weather_severity", 1))
	threat = int(parsed.get("threat", 8)); survivor_count = int(parsed.get("survivor_count", 1)); radio_signal = int(parsed.get("radio_signal", 0))
	event_history = []
	for x in parsed.get("event_history", []): event_history.append(str(x))
	event_flags = parsed.get("event_flags", {})
	survivor_level = int(parsed.get("survivor_level",1)); survivor_xp = int(parsed.get("survivor_xp",0)); skill_points = int(parsed.get("skill_points",0))
	combat_training = int(parsed.get("combat_training",0)); scavenging_skill = int(parsed.get("scavenging_skill",0)); field_medicine = int(parsed.get("field_medicine",0))
	research_points = int(parsed.get("research_points",0)); mutation_pressure = int(parsed.get("mutation_pressure",0)); bosses_defeated = int(parsed.get("bosses_defeated",0)); infected_kills = int(parsed.get("infected_kills",0)); noise = int(parsed.get("noise",0))
	equipped_melee = str(parsed.get("equipped_melee","MÃOS")); equipped_firearm = str(parsed.get("equipped_firearm","NENHUMA")); armor_name = str(parsed.get("armor_name","ROUPA COMUM")); backpack_level = int(parsed.get("backpack_level",0))
	location_states = parsed.get("location_states", {})
	if location_states.is_empty(): _init_location_states()
	room_states = parsed.get("room_states", {})
	survivors = parsed.get("survivors", [])
	discovered_districts = parsed.get("discovered_districts", {"BAIRRO DO ABRIGO":true,"CENTRO":false,"ZONA INDUSTRIAL":false,"QUARENTENA":false})
	bosses = parsed.get("bosses", bosses)
	body_weight = float(parsed.get("body_weight",72.0)); body_fat = float(parsed.get("body_fat",18.0)); strength = int(parsed.get("strength",42)); fitness = int(parsed.get("fitness",42)); energy = int(parsed.get("energy",82)); soreness = int(parsed.get("soreness",0)); stress = int(parsed.get("stress",18)); hygiene = int(parsed.get("hygiene",72)); calories_today = int(parsed.get("calories_today",0)); activity_calories = int(parsed.get("activity_calories",0)); injuries = parsed.get("injuries", injuries)
	skills = parsed.get("skills", skills); skill_xp = parsed.get("skill_xp", skill_xp); found_books = parsed.get("found_books", found_books); known_books = parsed.get("known_books", known_books); known_recipes = parsed.get("known_recipes", known_recipes); materials = parsed.get("materials", materials); tools = parsed.get("tools", tools); facilities = parsed.get("facilities", facilities); special_items = parsed.get("special_items", special_items); traps_set = int(parsed.get("traps_set",0)); wildlife_density = int(parsed.get("wildlife_density",70)); fish_density = int(parsed.get("fish_density",65)); farm = parsed.get("farm", farm); animals = parsed.get("animals", animals)
	community_tension = int(parsed.get("community_tension",12)); partner_name = str(parsed.get("partner_name","")); children = parsed.get("children",[]); pregnancies = parsed.get("pregnancies",[]); factions = parsed.get("factions",factions); world_news_seen = parsed.get("world_news_seen",[]); lore_archive = parsed.get("lore_archive",[]); season = str(parsed.get("season","OUTONO")); temperature = int(parsed.get("temperature",18)); vehicles = parsed.get("vehicles",vehicles); active_vehicle = str(parsed.get("active_vehicle","")); city_projects = parsed.get("city_projects",city_projects)
	detailed_food = parsed.get("detailed_food",[]); room_conditions = parsed.get("room_conditions",{}); global_events_active = parsed.get("global_events_active",{}); world_state = parsed.get("world_state",world_state); stomach_sick = int(parsed.get("stomach_sick",0))
	survivor_tasks = parsed.get("survivor_tasks",{}); community_clues = parsed.get("community_clues",[]); community_supplies_stolen = int(parsed.get("community_supplies_stolen",0))
	community_cohesion=int(parsed.get("community_cohesion",20)); shelter_comfort=int(parsed.get("shelter_comfort",8)); community_memories=parsed.get("community_memories",[]); routine_history=parsed.get("routine_history",[]); last_community_scene=str(parsed.get("last_community_scene",""))
	selected_character_id = str(parsed.get("selected_character_id","starter"))
	minute=int(parsed.get("minute",0)); wind_speed=int(parsed.get("wind_speed",12)); wind_direction=str(parsed.get("wind_direction","O")); humidity=int(parsed.get("humidity",72)); visibility=int(parsed.get("visibility",92)); wetness=int(parsed.get("wetness",0)); body_temperature=float(parsed.get("body_temperature",36.7)); sunrise_minute=int(parsed.get("sunrise_minute",390)); sunset_minute=int(parsed.get("sunset_minute",1080)); forecast_text=str(parsed.get("forecast_text","Tempo instável.")); diseases=parsed.get("diseases",{}); total_distance_km=float(parsed.get("total_distance_km",0.0)); expedition_distance_km=float(parsed.get("expedition_distance_km",0.0))
	v13_pending_event=parsed.get("v13_pending_event",{}); v13_event_memory=parsed.get("v13_event_memory",[]); v13_story_flags=parsed.get("v13_story_flags",{}); v13_last_event_day=int(parsed.get("v13_last_event_day",0)); v13_event_person=str(parsed.get("v13_event_person",""))
	v13_expedition_start_day=int(parsed.get("v13_expedition_start_day",day)); v13_expedition_start_minute=int(parsed.get("v13_expedition_start_minute",_v12_clock_minutes())); v13_expedition_start_thirst=int(parsed.get("v13_expedition_start_thirst",thirst)); v13_expedition_start_fatigue=int(parsed.get("v13_expedition_start_fatigue",fatigue)); v13_expedition_start_weight=int(parsed.get("v13_expedition_start_weight",_total_weight())); v13_attention_scans=parsed.get("v13_attention_scans",{}); v13_delayed_storylets=parsed.get("v13_delayed_storylets",[]); v13_last_trip_summary=str(parsed.get("v13_last_trip_summary",""))
	v14_disease_days=parsed.get("v14_disease_days",{}); v14_weather_history=parsed.get("v14_weather_history",[]); v14_environment_flags=parsed.get("v14_environment_flags",{})
	owned_clothing=[]
	for x in parsed.get("owned_clothing",["ROUPA COMUM"]): owned_clothing.append(str(x))
	equipped_clothing=str(parsed.get("equipped_clothing","ROUPA COMUM")); clothing_condition=parsed.get("clothing_condition",{})
	shelter_integrity=int(parsed.get("shelter_integrity",82)); shelter_cleanliness=int(parsed.get("shelter_cleanliness",68)); shelter_heat=int(parsed.get("shelter_heat",54)); maintenance_debt=int(parsed.get("maintenance_debt",0)); roof_leak=bool(parsed.get("roof_leak",false)); shelter_maintenance_history=parsed.get("shelter_maintenance_history",[]); v16_story_flags=parsed.get("v16_story_flags",{}); v16_last_maintenance_day=int(parsed.get("v16_last_maintenance_day",0)); v16_camp_active=bool(parsed.get("v16_camp_active",false)); v16_camp_name=str(parsed.get("v16_camp_name","")); v16_camp_quality=int(parsed.get("v16_camp_quality",0))
	v18_story_flags=parsed.get("v18_story_flags",{}); v18_special_rooms_seen=parsed.get("v18_special_rooms_seen",{}); v18_route_experience=parsed.get("v18_route_experience",{}); v18_location_knowledge=parsed.get("v18_location_knowledge",{}); v18_last_prep_score=int(parsed.get("v18_last_prep_score",0)); v18_last_prep_notes=[]
	_v7_normalize_loaded_state(); _v9_normalize_loaded_state(); _v11_normalize_loaded_state(); _v12_normalize_loaded_state()
	return true


# -----------------------------------------------------------------------------
# AFTERFALL V10 — menu, perfil, personagens e acessibilidade de áudio
# -----------------------------------------------------------------------------
func _v10_character_by_name(name_value:String) -> Dictionary:
	var upper:=name_value.to_upper()
	for id in V10_CHARACTERS:
		var meta:Dictionary=V10_CHARACTERS[id]
		if str(meta.get("name","")).to_upper()==upper:
			var out:=meta.duplicate(true); out["id"]=id; return out
	return {"id":"","name":name_value,"role":"CIVIL","rarity":"COMUM","story":"História ainda desconhecida.","trait":"Nenhuma especialização conhecida.","skill":"","level":0}

func _v10_get_selected_character() -> Dictionary:
	if not V10_CHARACTERS.has(selected_character_id): selected_character_id="starter"
	var out:Dictionary=V10_CHARACTERS[selected_character_id].duplicate(true); out["id"]=selected_character_id; return out

func _v10_refresh_menu_profile() -> void:
	if menu_character_label==null: return
	var c:=_v10_get_selected_character(); var rarity:=str(c.get("rarity","COMUM")); var available:=profile_unlocked_characters.has(selected_character_id)
	menu_character_label.text="PERFIL: %s • Nv.%d\n\n%s\n%s • %s\n\n%s\n\n%s\n\n%s"%[profile_name,profile_level,str(c.name),str(c.role),rarity,str(c.story),str(c.trait),("DISPONÍVEL PARA NOVA CAMPANHA" if available else "BLOQUEADO — "+str(c.unlock))]
	menu_character_label.add_theme_color_override("font_color",INK)
	if menu_save_label!=null:
		menu_save_label.text=_v10_save_summary() if has_save else "NENHUMA CAMPANHA SALVA • NOVO JOGO COMEÇA DO ZERO"

func _v10_save_summary() -> String:
	if not FileAccess.file_exists("user://afterfall_save_v18.json"): return "NENHUMA CAMPANHA SALVA"
	var f:=FileAccess.open("user://afterfall_save_v18.json",FileAccess.READ); if not f: return "CAMPANHA SALVA"
	var parsed=JSON.parse_string(f.get_as_text()); if typeof(parsed)!=TYPE_DICTIONARY: return "CAMPANHA SALVA"
	var cid:=str(parsed.get("selected_character_id","starter")); var cname:="SOBREVIVENTE"
	if V10_CHARACTERS.has(cid): cname=str(V10_CHARACTERS[cid].name)
	return "CONTINUAR: DIA %d • %02d:%02d • NV.%d • %s • %d PESSOA(S)"%[int(parsed.get("day",1)),int(parsed.get("hour",7)),int(parsed.get("minute",0)),int(parsed.get("survivor_level",1)),cname,int(parsed.get("survivor_count",1))]

func _v10_clear_menu_overlay() -> void:
	if menu_overlay_layer==null: return
	for c in menu_overlay_layer.get_children(): c.queue_free()
	menu_overlay_layer.visible=true

func _v10_close_menu_overlay() -> void:
	if menu_overlay_layer!=null: menu_overlay_layer.visible=false
	if menu_overlay_return_to_game:
		menu_layer.visible=false; game_layer.visible=true; menu_overlay_return_to_game=false
	else:
		menu_layer.visible=true
	_v10_refresh_menu_profile()

func _v10_overlay_base(title_text:String,subtitle_text:String) -> Dictionary:
	_v10_clear_menu_overlay()
	var veil:=ColorRect.new(); veil.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT); veil.color=Color(0,0,0,0.79); menu_overlay_layer.add_child(veil)
	var panel:=Panel.new(); panel.position=Vector2(95,58); panel.size=Vector2(1458,804); panel.add_theme_stylebox_override("panel",_flat(Color(0.025,0.023,0.020,0.98),Color("#716451"),8,2)); menu_overlay_layer.add_child(panel); _add_texture_backdrop(panel,DARK_PANEL_TEX,0.25)
	var title:=Label.new(); title.position=Vector2(34,24); title.size=Vector2(1100,58); title.text=title_text; title.add_theme_font_size_override("font_size",34); title.add_theme_color_override("font_color",BONE); panel.add_child(title)
	var sub:=Label.new(); sub.position=Vector2(36,78); sub.size=Vector2(1160,42); sub.text=subtitle_text; sub.add_theme_font_size_override("font_size",15); sub.add_theme_color_override("font_color",MUTED); panel.add_child(sub)
	var close:=_make_dark_button("VOLTAR",Vector2(180,48)); close.position=Vector2(1225,28); close.pressed.connect(_v10_close_menu_overlay); panel.add_child(close)
	return {"panel":panel}

func _v10_show_character_roster() -> void:
	var ui:=_v10_overlay_base("ARQUIVO DE PERSONAGENS","Cada rosto pertence a alguém que pode mudar a campanha. Arraste para ver o arquivo completo.")
	var panel:Panel=ui.panel
	var scroll:=ScrollContainer.new(); scroll.position=Vector2(30,128); scroll.size=Vector2(1398,625); scroll.horizontal_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED; scroll.vertical_scroll_mode=ScrollContainer.SCROLL_MODE_AUTO; panel.add_child(scroll)
	var grid:=GridContainer.new(); grid.columns=3; grid.custom_minimum_size=Vector2(1360,0); grid.add_theme_constant_override("h_separation",14); grid.add_theme_constant_override("v_separation",14); scroll.add_child(grid)
	for id in V10_CHARACTERS:
		var c:Dictionary=V10_CHARACTERS[id]; var unlocked:=profile_unlocked_characters.has(id) or id=="starter"; var rarity:=str(c.rarity); var col:Color=V10_RARITY_COLORS.get(rarity,MUTED)
		var card:=Button.new(); card.custom_minimum_size=Vector2(442,184); card.focus_mode=Control.FOCUS_NONE; card.text=""; card.add_theme_stylebox_override("normal",_flat(Color(0.034,0.030,0.026,0.98),col,7,2)); card.add_theme_stylebox_override("hover",_flat(Color(0.09,0.075,0.055,0.98),col.lightened(0.18),7,3)); grid.add_child(card)
		var portrait:=TextureRect.new(); portrait.position=Vector2(16,16); portrait.size=Vector2(126,150); portrait.texture=_v12_portrait_texture(str(id)); portrait.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; portrait.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; portrait.modulate=Color(1,1,1,1 if unlocked else 0.38); portrait.mouse_filter=Control.MOUSE_FILTER_IGNORE; card.add_child(portrait)
		var veil:=ColorRect.new(); veil.position=Vector2(16,16); veil.size=Vector2(126,150); veil.color=Color(0,0,0,0 if unlocked else 0.48); veil.mouse_filter=Control.MOUSE_FILTER_IGNORE; card.add_child(veil)
		var name_l:=Label.new(); name_l.position=Vector2(160,18); name_l.size=Vector2(260,32); name_l.text=str(c.name) if unlocked else "IDENTIDADE NÃO CONHECIDA"; name_l.add_theme_font_size_override("font_size",18); name_l.add_theme_color_override("font_color",BONE); name_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; card.add_child(name_l)
		var info:=Label.new(); info.position=Vector2(160,55); info.size=Vector2(260,108); info.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; info.text=("%s • %s\n\n%s"%[str(c.role),rarity,"Toque para abrir o dossiê."]) if unlocked else ("%s\n\n%s"%[rarity,str(c.unlock)]); info.add_theme_font_size_override("font_size",11); info.add_theme_color_override("font_color",MUTED); info.mouse_filter=Control.MOUSE_FILTER_IGNORE; card.add_child(info)
		card.pressed.connect(func(cid=id): _v10_inspect_character(str(cid)))

func _v10_inspect_character(id:String) -> void:
	if not V10_CHARACTERS.has(id): return
	var c:Dictionary=V10_CHARACTERS[id]; var unlocked:=profile_unlocked_characters.has(id)
	var body:="[b]%s[/b]\n%s • %s\n\n%s\n\n[b]TRAÇO[/b]\n%s\n\n[b]COMO ENCONTRAR[/b]\n%s"%[str(c.name) if unlocked else "IDENTIDADE DESCONHECIDA",str(c.role) if unlocked else "???",str(c.rarity),str(c.story) if unlocked else "Você ainda não conhece a história desta pessoa.",str(c.trait) if unlocked else "Desconhecido.",str(c.unlock)]
	var acts:Array=[["VOLTAR AO ARQUIVO",func(): _close_modal(); _v10_show_character_roster()]]
	if unlocked: acts.push_front(["SELECIONAR PARA NOVA CAMPANHA",func(): _close_modal(); selected_character_id=id; _save_profile_settings(); _v10_refresh_menu_profile(); _v10_show_character_roster()])
	_open_modal("DOSSIÊ",body,acts)

func _v10_show_character_select() -> void:
	var c:=_v10_get_selected_character()
	var body:="[b]%s[/b]\n%s • %s\n\n%s\n\n%s\n\n[color=#b7443c]NOVO JOGO apaga a campanha atual. O personagem começa sem comida, água, arma, munição ou remédios.[/color]"%[str(c.name),str(c.role),str(c.rarity),str(c.story),str(c.trait)]
	var acts:Array=[["COMEÇAR DO ZERO",Callable(self,"_confirm_new_game")],["ESCOLHER OUTRO",func(): _close_modal(); _v10_show_character_roster()],["CANCELAR",Callable(self,"_close_modal")]]
	_open_modal("NOVA CAMPANHA",body,acts)

func _v10_apply_starter_profile() -> void:
	var c:=_v10_get_selected_character(); var skill:=str(c.get("skill","")); var level:=int(c.get("level",0))
	if skill!="" and skills.has(skill): skills[skill]=level; skill_xp[skill]=level*35
	journal.append("Dia 1 — passado: %s (%s, %s)."%[str(c.name),str(c.role),str(c.rarity)])

func _v10_show_survivor_dossier() -> void:
	if survivors.is_empty(): _toast("Você ainda está sozinho."); return
	selected_survivor_index=clampi(selected_survivor_index,0,survivors.size()-1); var p:Dictionary=survivors[selected_survivor_index]; _v7_normalize_survivor(p)
	var meta:=_v10_character_by_name(str(p.get("name",""))); var cid:=str(meta.get("id","starter")); if cid=="": cid="starter"
	var secret_text:=str(p.secret) if bool(p.secret_known) else "Ainda não revelado. Confiança, convivência e investigação podem mudar isso."
	var relation:=_v7_social_read(p); var task:=str(survivor_tasks.get(str(p.name),"SEM FUNÇÃO"))
	var memories:Array[String]=[]
	for i in range(community_memories.size()-1,-1,-1):
		var m=community_memories[i]; var txt:=str(m.get("text",m)) if typeof(m)==TYPE_DICTIONARY else str(m)
		if txt.to_upper().contains(str(p.name).to_upper()): memories.append(txt)
		if memories.size()>=3: break
	var mem_text:="Nenhum momento importante registrado ainda." if memories.is_empty() else "\n• ".join(memories)
	var body:="[b]%s[/b]\n%s • %s\nEntrou no Dia %d • função: %s\n\n[b]HISTÓRIA[/b]\n%s\n\n[b]TRAÇO[/b]\n%s\n\n[b]COMO VOCÊ A PERCEBE[/b]\n%s\n\n[b]PASSADO / SEGREDO[/b]\n%s\n\n[b]MEMÓRIAS RECENTES[/b]\n• %s"%[str(p.name),str(p.role),str(p.get("rarity","COMUM")),int(p.joined_day),task,str(p.get("story","História desconhecida.")),str(p.get("trait","Nenhum traço conhecido.")),relation,secret_text,mem_text]
	_v8_show_page("community","DOSSIÊ: "+str(p.name),"UMA PESSOA PODE SALVAR O ABRIGO — OU DESTRUÍ-LO POR DENTRO",body,[["CONVERSAR (20 MIN)",Callable(self,"_v13_talk_dossier")],["PRÓXIMA PESSOA",Callable(self,"_v10_next_survivor_dossier")],["COMUNIDADE",Callable(self,"_show_community_panel")]])
	_v9_set_immersive_page(true); v8_page_bg.texture=SHELTER_TEX; v8_page_shade.color=Color(0.01,0.01,0.008,0.76); v8_page_close.text="VOLTAR À COMUNIDADE"
	v8_page_body.size=Vector2(520,566)
	if v8_page_entity!=null:
		v8_page_entity.texture=_v12_portrait_texture(cid); v8_page_entity.visible=v8_page_entity.texture!=null; v8_page_entity.position=Vector2(545,205); v8_page_entity.size=Vector2(330,450); v8_page_entity.move_to_front()

func _v13_talk_dossier() -> void:
	if survivors.is_empty(): return
	var p:Dictionary=survivors[selected_survivor_index]; _v12_advance_time(20,"conversa no abrigo",0.01,false)
	p.trust=mini(100,int(p.get("trust",45))+3); p.stress=maxi(0,int(p.get("stress",20))-3); community_cohesion=mini(100,community_cohesion+1)
	var text:="Você e %s conversaram sem pressa. Nem toda informação precisa virar missão."%str(p.name)
	community_memories.append({"day":day,"type":"conversation","text":text}); while community_memories.size()>40: community_memories.pop_front()
	_add_event("CONVIVÊNCIA",text); _save_game(); _v10_show_survivor_dossier()

func _v10_next_survivor_dossier() -> void:
	if survivors.is_empty(): return
	selected_survivor_index=(selected_survivor_index+1)%survivors.size(); _v10_show_survivor_dossier()

func _v10_has_survivor(name_value:String) -> bool:
	for p in survivors:
		if str(p.get("name","")).to_upper()==name_value.to_upper() and bool(p.get("alive",true)): return true
	return false

func _v10_try_location_recruit(location_name:String,room_name:String) -> void:
	var candidate:=""
	if location_name=="FAZENDA" and room_name in ["CASA","HORTA"]: candidate="mara"
	elif location_name=="FERRO-VELHO" and room_name in ["OFICINA","ESCRITÓRIO"]: candidate="ivo"
	elif location_name=="FLORESTA" and room_name in ["CABANA","MATA FECHADA"]: candidate="raul"
	elif location_name=="BIBLIOTECA" and room_name in ["SALA DE ESTUDO","ARQUIVO"]: candidate="miguel"
	elif location_name=="SUBESTAÇÃO" and room_name=="SALA DE CONTROLE": candidate="helena"
	elif location_name=="FÁBRICA" and room_name in ["MANUTENÇÃO","ALMOXARIFADO"]: candidate="otavio"
	elif location_name=="HOSPITAL" and room_name=="CIRURGIA": candidate="elisa"
	elif location_name=="QUARENTENA" and room_name in ["POSTO DE COMANDO","BUNKER"]: candidate="samuel"
	elif location_name=="LABORATÓRIO" and room_name in ["LABORATÓRIO CENTRAL","ARQUIVO RESTRITO","ARQUIVO","NÍVEL INFERIOR"]: candidate="nora"
	elif location_name=="SHOPPING" and room_name=="PRAÇA DE ALIMENTAÇÃO": candidate="nina"
	elif location_name=="APARTAMENTOS" and room_name in ["APTO 203","COBERTURA","DEPÓSITO"]: candidate="cesar"
	elif location_name=="SILO" and room_name in ["ARMAZÉM DE GRÃOS","OFICINA"]: candidate="joana"
	elif location_name=="SHOPPING" and room_name in ["LOJAS","DOCAS"]: candidate="bruno"
	elif location_name=="ESTAÇÃO" and room_name in ["BILHETERIA","SALA ELÉTRICA"]: candidate="celso"
	elif location_name=="FARMÁCIA" and room_name in ["ESTOQUE","SALA DOS FUNDOS"]: candidate="ana"
	elif location_name=="CENTRO" and room_name in ["PRÉDIO ABANDONADO","TELHADO"]: candidate="tomas"
	if candidate=="" or not V10_CHARACTERS.has(candidate): return
	var c:Dictionary=V10_CHARACTERS[candidate]
	if _v10_has_survivor(str(c.name)) or bool(event_flags.get("v10_met_"+candidate,false)): return
	event_flags["v10_met_"+candidate]=true; pending_recruit_id=candidate
	call_deferred("_v10_show_recruit_event")

func _v10_show_recruit_event() -> void:
	if pending_recruit_id=="" or not V10_CHARACTERS.has(pending_recruit_id): return
	var c:Dictionary=V10_CHARACTERS[pending_recruit_id]
	var body:="[b]%s[/b] — %s • %s\n\n%s\n\n%s\n\nA pessoa não pede para entrar imediatamente. Primeiro quer saber que tipo de abrigo você está construindo."%[str(c.name),str(c.role),str(c.rarity),str(c.story),str(c.trait)]
	_open_modal("ENCONTRO: "+str(c.name),body,[["OFERECER UM LUGAR",Callable(self,"_v10_recruit_pending")],["SEGUIR SEU CAMINHO",Callable(self,"_v10_decline_recruit")]])

func _v10_recruit_pending() -> void:
	if pending_recruit_id=="" or not V10_CHARACTERS.has(pending_recruit_id): _close_modal(); return
	var id:=pending_recruit_id; var c:Dictionary=V10_CHARACTERS[id]; var base_trust:=52
	if str(c.rarity)=="INCOMUM": base_trust=56
	elif str(c.rarity)=="RARO": base_trust=50
	elif str(c.rarity)=="EXCEPCIONAL": base_trust=45
	var p:=_v7_make_survivor(str(c.name),str(c.role),base_trust); survivors.append(p); survivor_count=maxi(1,survivors.size()+1)
	if not profile_unlocked_characters.has(id): profile_unlocked_characters.append(id); _save_profile_settings()
	community_tension=mini(100,community_tension+2); morale=mini(100,morale+4); _add_event("COMUNIDADE","%s aceitou tentar viver no abrigo."%str(c.name)); journal.append("Dia %d — %s (%s) entrou para a comunidade."%[day,str(c.name),str(c.role)])
	pending_recruit_id=""; _close_modal(); _save_game(); _show_community_panel(); _toast(str(c.name)+" entrou na comunidade.")

func _v10_decline_recruit() -> void:
	if pending_recruit_id!="" and V10_CHARACTERS.has(pending_recruit_id): _add_event("ENCONTRO","Você não convidou %s para o abrigo."%str(V10_CHARACTERS[pending_recruit_id].name))
	pending_recruit_id=""; _close_modal()

func _v10_personal_story_tick() -> void:
	for p in survivors:
		if not bool(p.get("alive",true)) or int(p.get("trust",0))<60: continue
		var id:=str(p.get("character_id","")); if id=="" or not V10_PERSONAL_QUESTS.has(id): continue
		var flag:="v10_story_"+id
		if bool(event_flags.get(flag,false)): continue
		event_flags[flag]=true; var q:Dictionary=V10_PERSONAL_QUESTS[id]
		_add_mission("story_"+id,str(q.title),str(q.desc)+" Destino: "+str(q.location)+".",1,str(q.reward))
		_add_event("HISTÓRIA",str(p.name)+" confiou em você o suficiente para pedir ajuda com algo pessoal.")

func _v10_check_personal_missions(location_name:String) -> void:
	for id in V10_PERSONAL_QUESTS:
		var q:Dictionary=V10_PERSONAL_QUESTS[id]
		if str(q.location)!=location_name: continue
		var mission_id:="story_"+str(id)
		for m in missions:
			if str(m.get("id",""))==mission_id and not bool(m.get("done",false)):
				_mission_progress(mission_id,1)
				for p in survivors:
					if str(p.get("character_id",""))==str(id): p.trust=mini(100,int(p.get("trust",50))+10); p.loyalty=mini(100,int(p.get("loyalty",45))+6); p.secret_known=true
				morale=mini(100,morale+4); _add_event("HISTÓRIA","A história de %s avançou em %s."%[str(V10_CHARACTERS[id].name),location_name]); break

func _v10_show_settings_overlay() -> void:
	if not menu_layer.visible:
		# Dentro da campanha usamos a mesma tela, mas o menu fica visível temporariamente como fundo neutro.
		menu_layer.visible=true; game_layer.visible=false
	var ui:=_v10_overlay_base("CONFIGURAÇÕES","Áudio ajustável em tempo real. As preferências ficam fora do save da campanha.")
	var panel:Panel=ui.panel
	var labels=["VOLUME GERAL","AMBIENTE / CHUVA","RÁDIO / TRANSMISSÕES","EFEITOS"]
	var values=[master_volume,ambience_volume,radio_volume,effects_volume]
	for i in range(4):
		var y:=155+i*118; var lab:=Label.new(); lab.position=Vector2(70,y); lab.size=Vector2(360,35); lab.text=labels[i]; lab.add_theme_font_size_override("font_size",18); lab.add_theme_color_override("font_color",BONE); panel.add_child(lab)
		var value_label:=Label.new(); value_label.position=Vector2(1120,y); value_label.size=Vector2(170,35); value_label.text="%d%%"%int(float(values[i])*100.0); value_label.horizontal_alignment=HORIZONTAL_ALIGNMENT_RIGHT; value_label.add_theme_font_size_override("font_size",18); value_label.add_theme_color_override("font_color",GOLD); panel.add_child(value_label)
		var slider:=HSlider.new(); slider.position=Vector2(450,y-2); slider.size=Vector2(650,40); slider.min_value=0; slider.max_value=100; slider.step=1; slider.value=float(values[i])*100.0; panel.add_child(slider)
		slider.value_changed.connect(func(v:float,idx=i,l=value_label): _v10_volume_changed(idx,v,l))
	var hint:=Label.new(); hint.position=Vector2(70,655); hint.size=Vector2(1260,80); hint.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; hint.text="Dica: deixar Ambiente mais alto aumenta chuva, vento e sons do abrigo; Rádio controla estática e transmissões. O jogo continuará recebendo controles separados de música e interface conforme novos sons forem adicionados."; hint.add_theme_font_size_override("font_size",15); hint.add_theme_color_override("font_color",MUTED); panel.add_child(hint)

func _v10_volume_changed(index:int,value:float,label:Label) -> void:
	var v:=clampf(value/100.0,0.0,1.0); label.text="%d%%"%int(value)
	match index:
		0: master_volume=v
		1: ambience_volume=v
		2: radio_volume=v
		3: effects_volume=v
	sound_enabled=master_volume>0.001; _apply_audio_settings(); _save_profile_settings()

func _apply_audio_settings() -> void:
	var master_idx:=AudioServer.get_bus_index("Master")
	if master_idx>=0: AudioServer.set_bus_volume_db(master_idx,linear_to_db(maxf(0.001,master_volume))); AudioServer.set_bus_mute(master_idx,master_volume<=0.001)
	if rain_audio_player!=null: rain_audio_player.volume_db=linear_to_db(maxf(0.001,ambience_volume*0.34))
	if radio_audio_player!=null: radio_audio_player.volume_db=linear_to_db(maxf(0.001,radio_volume*0.45))
	if wind_audio_player!=null: wind_audio_player.volume_db=linear_to_db(maxf(0.001,ambience_volume*0.18))

func _load_profile_settings() -> void:
	if not FileAccess.file_exists("user://afterfall_profile_v12.json"): return
	var f:=FileAccess.open("user://afterfall_profile_v12.json",FileAccess.READ); if not f: return
	var parsed=JSON.parse_string(f.get_as_text()); if typeof(parsed)!=TYPE_DICTIONARY: return
	master_volume=float(parsed.get("master_volume",0.82)); ambience_volume=float(parsed.get("ambience_volume",0.68)); radio_volume=float(parsed.get("radio_volume",0.72)); effects_volume=float(parsed.get("effects_volume",0.78)); selected_character_id=str(parsed.get("selected_character_id","starter"))
	profile_legacy=parsed.get("legacy",profile_legacy)
	profile_name=str(parsed.get("profile_name","SOBREVIVENTE")); profile_xp=int(parsed.get("profile_xp",0)); profile_level=int(parsed.get("profile_level",1)); profile_tokens=int(parsed.get("profile_tokens",0)); profile_daily_key=str(parsed.get("profile_daily_key","")); profile_daily_missions=parsed.get("profile_daily_missions",[]); profile_daily_stats=parsed.get("profile_daily_stats",profile_daily_stats); _v12_ensure_daily_missions()
	profile_unlocked_characters=[]
	for x in parsed.get("unlocked_characters",["starter"]): profile_unlocked_characters.append(str(x))
	if not profile_unlocked_characters.has("starter"): profile_unlocked_characters.append("starter")
	if not profile_unlocked_characters.has(selected_character_id): selected_character_id="starter"

func _save_profile_settings() -> void:
	var f:=FileAccess.open("user://afterfall_profile_v12.json",FileAccess.WRITE); if not f: return
	f.store_string(JSON.stringify({"master_volume":master_volume,"ambience_volume":ambience_volume,"radio_volume":radio_volume,"effects_volume":effects_volume,"selected_character_id":selected_character_id,"unlocked_characters":profile_unlocked_characters,"legacy":profile_legacy,"profile_name":profile_name,"profile_xp":profile_xp,"profile_level":profile_level,"profile_tokens":profile_tokens,"profile_daily_key":profile_daily_key,"profile_daily_missions":profile_daily_missions,"profile_daily_stats":profile_daily_stats}))

func _v10_sync_character_unlocks() -> void:
	var changed:=false
	for p in survivors:
		var meta:=_v10_character_by_name(str(p.get("name",""))); var id:=str(meta.get("id",""))
		if id!="" and not profile_unlocked_characters.has(id): profile_unlocked_characters.append(id); changed=true
	if changed: _save_profile_settings()

# -----------------------------------------------------------------------------
# AFTERFALL V11 — comunidade viva, rotina, memória e profissão emergente
# -----------------------------------------------------------------------------
func _v11_update_legacy() -> void:
	profile_legacy["best_day"]=maxi(int(profile_legacy.get("best_day",0)),day)
	profile_legacy["best_bosses"]=maxi(int(profile_legacy.get("best_bosses",0)),bosses_defeated)
	profile_legacy["best_kills"]=maxi(int(profile_legacy.get("best_kills",0)),infected_kills)

func _v11_show_legacy() -> void:
	var unlocked:=profile_unlocked_characters.size(); var total:=V10_CHARACTERS.size()
	var body:="[b]LEGADO DO JOGADOR[/b]\nCampanhas iniciadas: %d\nMelhor sobrevivência: Dia %d\nBosses derrotados numa campanha: %d\nMaior número de infectados abatidos: %d\nPersonagens conhecidos: %d/%d\n\nNa primeira campanha você é apenas um Civil Comum. Conhecer pessoas e sobreviver cria opções para campanhas futuras — sem apagar a brutalidade do começo."%[int(profile_legacy.get("campaigns_started",0)),int(profile_legacy.get("best_day",0)),int(profile_legacy.get("best_bosses",0)),int(profile_legacy.get("best_kills",0)),unlocked,total]
	var ui:=_v10_overlay_base("LEGADO","O mundo lembra das campanhas que você conseguiu sobreviver.")
	var panel:Panel=ui.panel
	var text:=RichTextLabel.new(); text.position=Vector2(70,155); text.size=Vector2(1280,500); text.bbcode_enabled=true; text.text=body; text.add_theme_font_size_override("normal_font_size",21); text.add_theme_color_override("default_color",BONE); panel.add_child(text)

func _v11_reset_systems() -> void:
	community_cohesion=20; shelter_comfort=8; community_memories=[]; routine_history=[]; last_community_scene=""

func _v11_normalize_loaded_state() -> void:
	community_cohesion=clampi(community_cohesion,0,100); shelter_comfort=clampi(shelter_comfort,0,100)
	if typeof(community_memories)!=TYPE_ARRAY: community_memories=[]
	if typeof(routine_history)!=TYPE_ARRAY: routine_history=[]

func _v11_player_path() -> String:
	var best_key:=""; var best_level:=0
	for k in skills:
		var level:=int(skills.get(k,0))
		if level>best_level: best_level=level; best_key=str(k)
	if best_level<=0: return "CIVIL COMUM"
	var prefix:="APRENDIZ DE " if best_level<=1 else ("PRATICANTE DE " if best_level==2 else ("ESPECIALISTA EM " if best_level<=4 else "MESTRE EM "))
	return prefix+str(V7_SKILL_NAMES.get(best_key,best_key)).to_upper()

func _v11_show_routine_panel() -> void:
	var body:="[b]ROTINA DO ABRIGO[/b]\nCoesão %d/100 • Conforto %d/100 • Tensão %d/100\nAções restantes %d • comida %d • água %d\n\nPassar tempo junto também é sobrevivência. Algumas rotinas gastam recursos; outras só gastam tempo. Todas deixam consequências sociais."%[community_cohesion,shelter_comfort,community_tension,actions_left,int(inventory.food),int(inventory.water)]
	if not routine_history.is_empty(): body += "\n\n[b]ÚLTIMAS NOITES[/b]\n"+"\n".join(routine_history.slice(maxi(0,routine_history.size()-4),routine_history.size()))
	_v8_show_page("community","ROTINA / LAZER","NEM TODA HORA PRECISA SER UMA LUTA",body,[["REFEIÇÃO EM GRUPO",func(): _v11_do_routine("meal")],["CARTAS / CONVERSA",func(): _v11_do_routine("cards")],["NOITE DE LEITURA",func(): _v11_do_routine("reading")],["RONDA DE MANUTENÇÃO",func(): _v11_do_routine("maintenance")],["TREINO EM GRUPO",func(): _v11_do_routine("training")],["COMUNIDADE",Callable(self,"_show_community_panel")]])

func _v11_do_routine(id:String) -> void:
	if actions_left<=0: _toast("Sem tempo para isso hoje."); return
	if not V11_ROUTINES.has(id): return
	actions_left-=1; hour+=1
	var text:=""
	match id:
		"meal":
			var need:=maxi(1,int(ceil(float(survivor_count)/2.0)))
			if inventory.food<need or inventory.water<1:
				actions_left+=1; hour-=1; _toast("Falta comida ou água para reunir o grupo."); return
			inventory.food-=need; inventory.water-=1; morale=mini(100,morale+6); community_tension=maxi(0,community_tension-7); community_cohesion=mini(100,community_cohesion+6); shelter_comfort=mini(100,shelter_comfort+1); text="Todos comeram juntos. Por uma hora, o abrigo pareceu uma casa."
		"cards":
			stress=maxi(0,stress-7); morale=mini(100,morale+4); community_tension=maxi(0,community_tension-4); community_cohesion=mini(100,community_cohesion+4); text="Cartas, histórias ruins e algumas risadas baixas quebraram o silêncio."
			_v11_relationship_moment()
		"reading":
			stress=maxi(0,stress-4); community_cohesion=mini(100,community_cohesion+2); facilities.library=maxi(1,int(facilities.library)); text="Livros e anotações passaram de mão em mão. Conhecimento deixou de pertencer a uma pessoa só."
			var candidates:=[]
			for k in skills:
				if int(skills[k])<5: candidates.append(k)
			if not candidates.is_empty(): _v7_gain_skill(str(candidates[rng.randi_range(0,candidates.size()-1)]),5)
		"maintenance":
			fatigue=mini(100,fatigue+5); threat=maxi(0,threat-5); shelter_comfort=mini(100,shelter_comfort+2); text="Portas, goteiras, cercas e ferramentas foram verificadas antes da noite."
		"training":
			fatigue=mini(100,fatigue+8); activity_calories+=180; community_cohesion=mini(100,community_cohesion+3); combat_training=mini(100,combat_training+1); text="O grupo treinou sinais, recuo e defesa sem desperdiçar munição."
	last_community_scene=text; routine_history.append("Dia %d — %s"%[day,text]); while routine_history.size()>10: routine_history.pop_front()
	community_memories.append({"day":day,"type":"routine","text":text}); while community_memories.size()>40: community_memories.pop_front()
	_add_event("ROTINA",text); _save_game(); _update_all(); _v11_show_routine_panel()

func _v11_relationship_moment() -> void:
	if survivors.size()<2: return
	var living:=[]
	for p in survivors:
		if bool(p.get("alive",true)): living.append(p)
	if living.size()<2: return
	var a:Dictionary=living[rng.randi_range(0,living.size()-1)]; var b:Dictionary=living[rng.randi_range(0,living.size()-1)]
	if a==b: return
	if rng.randi_range(1,100)<=70:
		a.affinity=mini(100,int(a.get("affinity",15))+3); b.affinity=mini(100,int(b.get("affinity",15))+3); _add_event("CONVIVÊNCIA","%s e %s passaram a noite conversando."%[str(a.name),str(b.name)])
	else:
		a.stress=mini(100,int(a.get("stress",20))+4); b.stress=mini(100,int(b.get("stress",20))+4); community_tension=mini(100,community_tension+3); _add_event("CONVIVÊNCIA","Uma discussão entre %s e %s terminou em silêncio."%[str(a.name),str(b.name)])

func _v11_daily_community_scene() -> void:
	if survivor_count<=1:
		last_community_scene="O abrigo ficou silencioso. Você ouviu apenas chuva, madeira e o próprio estômago."
		return
	var scenes:=[]
	if animals.dog>0: scenes.append("O cachorro dormiu perto da porta enquanto alguém fazia a última ronda.")
	if facilities.library>0: scenes.append("Uma luz ficou acesa sobre a mesa: alguém continuou lendo depois que os outros dormiram.")
	if int(farm.planted)>0: scenes.append("Antes de escurecer, duas pessoas conferiram a horta e cobriram os canteiros.")
	if partner_name!="": scenes.append("%s guardou um lugar para você perto da parte mais quente do abrigo."%partner_name)
	if survivors.size()>0:
		var p:Dictionary=survivors[rng.randi_range(0,survivors.size()-1)]
		if bool(p.get("alive",true)): scenes.append("%s ficou alguns minutos olhando a rua pela janela antes de fechar a cortina."%str(p.name))
	if scenes.is_empty(): scenes.append("A comunidade dividiu tarefas e se recolheu cedo. Amanhã ninguém sabe o que estará de pé.")
	last_community_scene=str(scenes[rng.randi_range(0,scenes.size()-1)])
	community_memories.append({"day":day,"type":"scene","text":last_community_scene}); while community_memories.size()>40: community_memories.pop_front()
	community_cohesion=clampi(community_cohesion+(1 if morale>=55 else -1),0,100)
	shelter_comfort=clampi(8+upgrades.bed*5+upgrades.storage*2+facilities.library*3+facilities.rain_collector*2+int(city_projects.get("power",false))*8,0,100)

# -----------------------------------------------------------------------------
# AFTERFALL V7 — sistemas de sobrevivência integrados
# -----------------------------------------------------------------------------
func _v7_reset_systems() -> void:
	body_weight = 72.0; body_fat = 18.0; strength = 42; fitness = 42; energy = 82; soreness = 0; stress = 18; hygiene = 72; calories_today = 0; activity_calories = 0
	injuries = {"arm":0,"leg":0,"bleeding":0,"fracture":0}
	skills = {}; skill_xp = {}
	for k in V7_SKILL_NAMES: skills[k] = 0; skill_xp[k] = 0
	found_books = {}; known_books = {}; known_recipes = {"wood_spear":true,"trap":true}
	materials = {"wood":0,"nails":0,"screws":0,"steel":0,"copper":0,"wire":0,"plastic":0,"rubber":0,"leather":0,"chemicals":0,"salt":0,"seeds":0,"coal":0,"mechanical":0,"raw_meat":0,"preserved_meat":0,"eggs":0,"vegetables":0,"water":0,"fuel":0,"battery":0,"electronics":0,"scrap":0,"cloth":0,"herbs":0}
	tools = {"hammer":false,"saw":false,"wrench":false,"multimeter":false,"welder":false}
	facilities = {"workbench":1,"forge":0,"smoker":0,"rain_collector":0,"animal_pen":0,"garden":0,"battery_bank":0,"motion_alarm":0,"radio_booster":0,"weather_station":0,"library":0}
	special_items = []; traps_set = 0; wildlife_density = 70; fish_density = 65
	farm = {"plots":0,"planted":0,"growth":0,"ready":0,"compost":0}
	animals = {"chickens":0,"rabbits":0,"goats":0,"dog":0,"feed":0,"health":100,"eggs":0,"milk":0}
	community_tension = 12; partner_name = ""; children = []; pregnancies = []; selected_survivor_index = 0
	factions = {"VIGÍLIA":{"rep":0,"status":"NEUTRA"},"FERROS-VELHOS":{"rep":0,"status":"NEUTRA"},"SANTA LUZ":{"rep":0,"status":"DESCONHECIDA"}}
	world_news_seen = []; lore_archive = ["Dia 1 — o surto começou antes do último boletim oficial. Ninguém sabe por quê."]
	season = "OUTONO"; temperature = 18
	vehicles = {"BICICLETA":{"found":false,"condition":45,"fuel":0},"MOTO":{"found":false,"condition":25,"fuel":0},"CARRO":{"found":false,"condition":18,"fuel":0}}
	active_vehicle = ""; city_projects = {"power":false,"water":false,"antenna":false,"safe_block":false}

func _v7_normalize_loaded_state() -> void:
	for k in V7_SKILL_NAMES:
		if not skills.has(k): skills[k] = 0
		if not skill_xp.has(k): skill_xp[k] = 0
	for k in ["wood","nails","screws","steel","copper","wire","plastic","rubber","leather","chemicals","salt","seeds","coal","mechanical","raw_meat","preserved_meat","eggs","vegetables","water","fuel","battery","electronics","scrap","cloth","herbs"]:
		if not materials.has(k): materials[k] = 0
	for k in ["hammer","saw","wrench","multimeter","welder"]:
		if not tools.has(k): tools[k] = false
	for k in ["workbench","forge","smoker","rain_collector","animal_pen","garden","battery_bank","motion_alarm","radio_booster","weather_station","library"]:
		if not facilities.has(k): facilities[k] = 0
	for person in survivors: _v7_normalize_survivor(person)

func _v7_make_survivor(name_value: String, role_value: String, trust_value: int, secret_value: String = "") -> Dictionary:
	var meta:=_v10_character_by_name(name_value)
	return {"name":name_value,"role":role_value,"trust":trust_value,"loyalty":maxi(25,trust_value-5),"envy":rng.randi_range(4,24),"affinity":rng.randi_range(10,28),"stress":rng.randi_range(10,30),"alive":true,"secret":secret_value,"secret_known":false,"spy":false,"betrayed":false,"partner":"","joined_day":day,"rarity":str(meta.get("rarity","COMUM")),"story":str(meta.get("story","História ainda desconhecida.")),"trait":str(meta.get("trait","Nenhuma especialização conhecida.")),"character_id":str(meta.get("id","")),"illness":"","illness_severity":0,"illness_days":0,"isolated":false}

func _v7_normalize_survivor(person: Dictionary) -> void:
	if not person.has("loyalty"): person["loyalty"] = maxi(25,int(person.get("trust",40))-5)
	if not person.has("envy"): person["envy"] = 12
	if not person.has("affinity"): person["affinity"] = 15
	if not person.has("stress"): person["stress"] = 20
	if not person.has("secret"): person["secret"] = ""
	if not person.has("secret_known"): person["secret_known"] = false
	if not person.has("spy"): person["spy"] = false
	if not person.has("betrayed"): person["betrayed"] = false
	if not person.has("partner"): person["partner"] = ""
	if not person.has("joined_day"): person["joined_day"] = day
	if not person.has("illness"): person["illness"] = ""
	if not person.has("illness_severity"): person["illness_severity"] = 0
	if not person.has("illness_days"): person["illness_days"] = 0
	if not person.has("isolated"): person["isolated"] = false
	var meta:=_v10_character_by_name(str(person.get("name","")))
	if not person.has("rarity"): person["rarity"] = str(meta.get("rarity","COMUM"))
	if not person.has("story"): person["story"] = str(meta.get("story","História ainda desconhecida."))
	if not person.has("trait"): person["trait"] = str(meta.get("trait","Nenhuma especialização conhecida."))
	if not person.has("character_id"): person["character_id"] = str(meta.get("id",""))

func _v7_consume_calories(amount: int, protein: int, hydration: int, source: String) -> void:
	calories_today += amount
	energy = mini(100, energy + int(amount / 120))
	thirst = maxi(0, thirst - int(hydration / 2))
	if protein >= 30 and soreness > 0: soreness = maxi(0, soreness - 2)
	_add_event("ALIMENTAÇÃO", "%s: +%d kcal." % [source.capitalize(), amount])

func _show_food_panel() -> void:
	var body := "[b]DESPENSA[/b]  %d kcal hoje • %.1f kg • energia %d/100\nFome %d • Sede %d • alimentos encontrados %d" % [calories_today,body_weight,energy,hunger,thirst,detailed_food.size()]
	if stomach_sick>0: body += "\n[color=#b7443c][b]INTOXICAÇÃO ALIMENTAR[/b][/color] — %d dia(s)"%stomach_sick
	_v8_show_page("inventory","DESPENSA","ESCOLHA O QUE COMER — CALORIAS, PROTEÍNA E CONSERVAÇÃO IMPORTAM",body,[["COZINHAR / PREPARAR",Callable(self,"_cook")],["INVENTÁRIO",Callable(self,"_show_inventory_panel")],["ABRIGO",Callable(self,"_show_shelter")]])
	v8_page_body.size=Vector2(844,90); v8_page_cards.visible=true; v8_page_cards.columns=4; v8_page_cards.position=Vector2(28,125); v8_page_cards.size=Vector2(840,470)
	for c in v8_page_cards.get_children(): c.queue_free()
	for i in range(detailed_food.size()): v8_page_cards.add_child(_v9_make_food_card(i))
	if inventory.food>0:
		var ration:=_make_dark_button("RAÇÃO GENÉRICA x%d\n650 kcal • estável"%inventory.food,Vector2(195,122)); ration.pressed.connect(_use_food); v8_page_cards.add_child(ration)
	if detailed_food.is_empty() and inventory.food<=0:
		var empty:=Label.new(); empty.text="A despensa está vazia. A próxima saída precisa render comida."; empty.custom_minimum_size=Vector2(760,80); empty.add_theme_font_size_override("font_size",20); empty.add_theme_color_override("font_color",MUTED); v8_page_cards.add_child(empty)

func _v9_make_food_card(index:int) -> Button:
	var item:Dictionary=detailed_food[index]; var cat:Dictionary=V9_FOODS.get(str(item.get("id","")),{}); var left:=int(item.get("days_left",999)); var condition:=int(item.get("condition",100))
	var state:="ESTÁVEL" if left>=900 else ("HOJE" if left<=1 and left>=0 else ("ESTRAGADO" if left<0 else "%d DIAS"%left))
	var b:=Button.new(); b.custom_minimum_size=Vector2(195,132); b.focus_mode=Control.FOCUS_NONE; b.text="%s\n%d kcal • %dg proteína\n%s • %d%%\n%s"%[str(cat.get("name","Alimento")).to_upper(),int(cat.get("kcal",0)),int(cat.get("protein",0)),state,condition,str(cat.get("rarity","COMUM"))]
	b.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; b.add_theme_font_size_override("font_size",12); b.add_theme_stylebox_override("normal",_flat(Color(0.035,0.03,0.025,0.95),Color("#716451"),4,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.11,0.07,0.045,0.97),Color("#b69763"),4,2)); b.pressed.connect(func(): _v9_eat_food(index)); return b

func _v7_eat_eggs() -> void:
	if animals.eggs <= 0: _toast("Sem ovos."); return
	animals.eggs -= 1; _v7_consume_calories(190,14,4,"ovos"); hunger=maxi(0,hunger-18); _update_all(); _save_game(); _show_food_panel()

func _v7_eat_preserved() -> void:
	if materials.preserved_meat <= 0: _toast("Sem carne preservada."); return
	materials.preserved_meat -= 1; _v7_consume_calories(520,34,2,"carne preservada"); hunger=maxi(0,hunger-32); _update_all(); _save_game(); _show_food_panel()

func _show_body_panel() -> void:
	var shape := "EQUILIBRADO"
	if body_weight < 60.0: shape = "MUITO MAGRO"
	elif body_weight < 67.0: shape = "MAGRO"
	elif body_weight > 95.0: shape = "PESO ALTO"
	elif body_weight > 84.0: shape = "ROBUSTO"
	var body := "[b]SEU CORPO[/b]\nCaminho atual: [b]%s[/b]\n%.1f kg • %s • gordura %.1f%%\nForça %d • Condicionamento %d • Energia %d\nDor muscular %d • Estresse %d • Higiene %d\nCalorias hoje %d\n\n[b]FERIMENTOS[/b]\nBraço %d • Perna %d • Sangramento %d • Fratura %d\n\nSeu corpo muda ao longo da campanha. Déficit prolongado tira energia e músculo; excesso prolongado aumenta peso. Treino sem recuperação também cobra preço." % [_v11_player_path(),body_weight,shape,body_fat,strength,fitness,energy,soreness,stress,hygiene,calories_today,injuries.arm,injuries.leg,injuries.bleeding,injuries.fracture]
	_v8_show_page("body", "CORPO", "VOCÊ NÃO É UMA BARRA DE VIDA", body, [["SAÚDE / CLIMA",Callable(self,"_v12_show_health_environment")],["TREINAR FORÇA", func(): _v7_exercise("strength")], ["TREINAR CARDIO", func(): _v7_exercise("cardio")], ["ALIMENTAÇÃO", Callable(self,"_show_food_panel")], ["DESCANSAR", Callable(self,"_rest")]])
	_mark_nav("body")

func _v7_exercise(kind: String) -> void:
	if actions_left <= 0: _toast("Sem tempo para treinar hoje."); return
	if thirst > 80 or energy < 20: _toast("Seu corpo está exausto ou desidratado."); return
	actions_left -= 1; _v12_advance_time(60,"exercício",0.75,false); fatigue=mini(100,fatigue+12); thirst=mini(100,thirst+7); energy=maxi(0,energy-14); soreness=mini(100,soreness+18); activity_calories += 320; _v12_daily_add("exercise_minutes",60)
	if kind == "strength": strength = mini(100,strength+1); _v7_gain_skill("survival",2); _add_event("TREINO","Treino de força concluído.")
	else: fitness = mini(100,fitness+1); _v7_gain_skill("survival",2); _add_event("TREINO","Treino cardiovascular concluído.")
	_update_all(); _save_game(); _show_body_panel()

func _v7_gain_skill(skill: String, amount: int) -> void:
	if not skills.has(skill): return
	skill_xp[skill] = int(skill_xp.get(skill,0)) + maxi(0,amount)
	var level := int(skills.get(skill,0)); var need := 35 + level * 35
	while int(skill_xp[skill]) >= need and level < 5:
		skill_xp[skill] = int(skill_xp[skill]) - need; level += 1; skills[skill] = level
		_add_event("HABILIDADE", "%s chegou ao nível %d." % [str(V7_SKILL_NAMES[skill]),level]); need = 35 + level * 35

func _show_skills_panel() -> void:
	var body := "[b]HABILIDADES[/b]\n"
	for k in V7_SKILL_NAMES: body += "%s  Nv.%d  • XP %d\n" % [str(V7_SKILL_NAMES[k]),int(skills.get(k,0)),int(skill_xp.get(k,0))]
	body += "\nLivros encontrados: %d • lidos: %d\n\nLivros ensinam teoria e receitas. Fazer o trabalho é o que transforma teoria em habilidade." % [found_books.size(),known_books.size()]
	_v8_show_page("skills", "HABILIDADES", "NINGUÉM ACORDA SABENDO FORJAR, OPERAR UM GERADOR OU TRATAR UMA FRATURA", body, [["BIBLIOTECA / MANUAIS", Callable(self,"_show_books_panel")], ["CORPO / TREINO", Callable(self,"_show_body_panel")], ["OFICINA", Callable(self,"_show_crafting_panel")]])
	_mark_nav("skills")

func _show_books_panel() -> void:
	var body := "[b]BIBLIOTECA DO ABRIGO[/b]\n"
	if found_books.is_empty(): body += "Nenhum manual encontrado. Bibliotecas, escolas, oficinas, hospitais e instalações técnicas agora são destinos valiosos."
	else:
		for id in found_books:
			var read := bool(known_books.get(id,false)); body += "• %s — %s\n" % [str(V7_BOOKS[id].title),"LIDO" if read else "NÃO LIDO"]
	var actions: Array=[]
	for id in found_books:
		if not bool(known_books.get(id,false)):
			var bid:=str(id); actions.append(["LER: "+str(V7_BOOKS[bid].title).to_upper(), func(): _v7_read_book(bid)])
			if actions.size()>=7: break
	actions.append(["HABILIDADES", Callable(self,"_show_skills_panel")])
	_v8_show_page("books", "BIBLIOTECA", "CONHECIMENTO TAMBÉM É LOOT", body, actions)

func _v7_read_book(id: String) -> void:
	if not found_books.has(id) or bool(known_books.get(id,false)): return
	if actions_left <= 0: _toast("Sem tempo para estudar hoje."); return
	actions_left -= 1; _v12_advance_time(120,"estudo",0.02,false); known_books[id]=true; _v12_daily_add("study_minutes",120)
	var spec: Dictionary=V7_BOOKS[id]; _v7_gain_skill(str(spec.skill),int(spec.xp))
	for recipe in spec.recipes: known_recipes[str(recipe)] = true
	lore_archive.append("Dia %d — estudei %s." % [day,str(spec.title)]); stress=maxi(0,stress-2)
	_save_game(); _show_books_panel(); _toast("Conhecimento adquirido. Novas receitas podem ter sido liberadas.")

func _v7_materials_ok(req: Dictionary) -> bool:
	for k in req:
		var have := int(materials.get(k,0))
		if inventory.has(k): have += int(inventory.get(k,0))
		if have < int(req[k]): return false
	return true

func _v7_recipe_available(id: String) -> bool:
	if not V7_RECIPES.has(id) or not bool(known_recipes.get(id,false)): return false
	var r: Dictionary=V7_RECIPES[id]; var skill:=str(r.skill)
	if int(skills.get(skill,0)) < int(r.level): return false
	var f:=str(r.facility)
	if f=="workbench" and upgrades.workbench<=0 and int(facilities.workbench)<=0: return false
	if f!="workbench" and int(facilities.get(f,0))<=0: return false
	return _v7_materials_ok(r.materials)

func _craft_v7(id: String) -> void:
	if not V7_RECIPES.has(id): return
	if not _v7_recipe_available(id): _toast("Falta conhecimento, estação ou material."); return
	var r: Dictionary=V7_RECIPES[id]
	for k in r.materials:
		var n:=int(r.materials[k])
		if inventory.has(k):
			var from_inventory:=mini(n,int(inventory.get(k,0)))
			inventory[k]=int(inventory.get(k,0))-from_inventory
			n-=from_inventory
		if n>0: materials[k]=int(materials.get(k,0))-n
	var skill:=str(r.skill); _v7_gain_skill(skill,12); var quality:=mini(100,55+int(skills.get(skill,0))*9+rng.randi_range(-5,8)); var kind:=str(r.kind)
	if kind=="trap": traps_set += 1
	elif kind=="facility": facilities[str(r.target)] = int(facilities.get(str(r.target),0))+1; _v7_sync_facility(str(r.target))
	elif kind=="project":
		city_projects[str(r.target)] = true
		if str(r.target)=="power": radio_signal=mini(100,radio_signal+18)
	elif kind=="food": materials.preserved_meat += 2
	elif kind=="med": inventory.med += 1
	elif kind=="splint": injuries.fracture=maxi(0,int(injuries.fracture)-1); injuries.leg=maxi(0,int(injuries.leg)-1)
	elif kind=="armor":
		armor_name="ROUPA REFORÇADA"
		equipped_clothing="ROUPA REFORÇADA"
		if not owned_clothing.has("ROUPA REFORÇADA"):
			owned_clothing.append("ROUPA REFORÇADA")
		clothing_condition["ROUPA REFORÇADA"]=quality
		_v7_add_special_item(str(r.name),"ARMADURA",quality)
	elif kind=="repair": _v7_repair_special_item()
	elif kind=="fuel": inventory.fuel += 2
	else:
		_v7_add_special_item(str(r.name),"EQUIPAMENTO",quality)
		if id=="wood_spear": equipped_melee="LANÇA DE MADEIRA"
		elif id=="steel_axe": equipped_melee="MACHADO DE AÇO"
	var craft_minutes:=25+int(r.level)*20
	_v12_advance_time(craft_minutes,"crafting",0.18,false); _v12_daily_add("craft",1)
	_add_event("CRAFTING","%s produzido em %d min. Qualidade %d%%." % [str(r.name),craft_minutes,quality]); _save_game(); _show_crafting_panel()

func _v7_sync_facility(target: String) -> void:
	if target=="garden": farm.plots=maxi(int(farm.plots),1)
	if target=="animal_pen": animals.feed += 0
	if target=="rain_collector": upgrades.filter=maxi(upgrades.filter,1)
	if target=="radio_booster": radio_signal=mini(100,radio_signal+22)

func _v7_add_special_item(name_value: String, type_value: String, condition_value: int, rarity_value: String = "") -> void:
	var rarity:=rarity_value
	if rarity=="":
		var roll:=rng.randi_range(1,100); rarity="COMUM" if roll<=55 else ("INCOMUM" if roll<=80 else ("RARO" if roll<=94 else "MUITO RARO"))
	special_items.append({"name":name_value,"type":type_value,"rarity":rarity,"condition":clampi(condition_value,1,100)})
	if special_items.size()>24: special_items.pop_front()

func _v7_special_items_text() -> String:
	if special_items.is_empty(): return "Nenhum item especial."
	var out:=[]; var start:=maxi(0,special_items.size()-5)
	for i in range(start,special_items.size()):
		var it:Dictionary=special_items[i]; out.append("%s [%s] • %d%%" % [str(it.name),str(it.rarity),int(it.condition)])
	return "\n".join(out)

func _v7_gear_bonus() -> int:
	var bonus:=0
	for it in special_items:
		var c:=int(it.get("condition",50)); var r:=str(it.get("rarity","COMUM")); bonus += int(c/40) + V7_RARITIES.find(r)
	return mini(18,bonus)

func _v7_repair_special_item() -> void:
	if special_items.is_empty(): return
	var idx:=0; var lowest:=101
	for i in range(special_items.size()):
		if int(special_items[i].condition)<lowest: lowest=int(special_items[i].condition); idx=i
	special_items[idx].condition=mini(100,int(special_items[idx].condition)+35+int(skills.gunsmithing)*5)

func _v7_degrade_gear() -> void:
	if special_items.is_empty() or rng.randi_range(1,100)>35: return
	var idx:=rng.randi_range(0,special_items.size()-1); special_items[idx].condition=maxi(1,int(special_items[idx].condition)-rng.randi_range(1,4))

func _show_production_panel() -> void:
	_v8_show_page("production","PRODUÇÃO DO ABRIGO","SOBREVIVER POR MESES EXIGE MAIS DO QUE SAQUEAR","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["production"]; v8_page_shade.color=Color(0.009,0.008,0.006,0.46)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_body.visible=true; v8_page_body.position=Vector2(24,18); v8_page_body.size=Vector2(1060,76); v8_page_body.text="[b]Água[/b] %d • [b]Comida[/b] %d • [b]Energia[/b] %s • [b]Estrutura[/b] %d%% • [b]Manutenção[/b] %d"%[int(inventory.water),int(inventory.food),"ATIVA" if bool(city_projects.power) else "LIMITADA",int(shelter_integrity),int(maintenance_debt)]
	v8_page_cards.visible=true; v8_page_cards.columns=2; v8_page_cards.position=Vector2(24,108); v8_page_cards.size=Vector2(1065,535); v8_page_cards.add_theme_constant_override("h_separation",14); v8_page_cards.add_theme_constant_override("v_separation",14)
	for c in v8_page_cards.get_children(): c.queue_free()
	v8_page_cards.add_child(_v17_prod_card("HORTA","%d canteiros • %d%% crescimento • %d pronto(s)"%[int(farm.plots),int(farm.growth),int(farm.ready)],_v12_icon("seeds",ICONS["food"]),Color("#61734d"),Callable(self,"_show_farm_panel")))
	v8_page_cards.add_child(_v17_prod_card("ANIMAIS","%d galinhas • %d coelhos • %d cabras • saúde %d%%"%[int(animals.chickens),int(animals.rabbits),int(animals.goats),int(animals.health)],_v12_icon("eggs",ICONS["food"]),Color("#79694f"),Callable(self,"_show_animals_panel")))
	v8_page_cards.add_child(_v17_prod_card("CAÇA / PESCA","Fauna %d%% • peixes %d%% • armadilhas %d"%[wildlife_density,fish_density,traps_set],_v12_icon("raw_meat",ICONS["food"]),Color("#6b5946"),Callable(self,"_show_hunting_panel")))
	v8_page_cards.add_child(_v17_prod_card("OFICINA","Nv.%d • forja %s • peças mecânicas %d"%[int(upgrades.workbench),"SIM" if int(facilities.forge)>0 else "NÃO",int(materials.mechanical)],_v12_icon("mechanical",ICONS["scrap"]),Color("#736454"),Callable(self,"_show_crafting_panel")))
	v8_page_cards.add_child(_v17_prod_card("INFRAESTRUTURA","Energia %s • água %s • antena %s"%["OK" if bool(city_projects.power) else "CAÍDA","OK" if bool(city_projects.water) else "CAÍDA","ATIVA" if bool(city_projects.antenna) else "INATIVA"],_v12_icon("electronics2",ICONS["scrap"]),Color("#4f6570"),Callable(self,"_show_infrastructure_panel")))
	v8_page_cards.add_child(_v17_prod_card("MANUTENÇÃO","Estrutura %d%% • higiene %d%% • calor %d%% • dívida %d"%[int(shelter_integrity),int(shelter_cleanliness),int(shelter_heat),int(maintenance_debt)],_v12_icon("nails",ICONS["scrap"]),Color("#8a6547"),Callable(self,"_v16_show_shelter_maintenance")))
	_v8_clear_actions(v8_page_actions); _v17_side_note("ABRIGO VIVO","Produção gera estabilidade, mas tudo consome água, ração, materiais, tempo e manutenção.",155)
	_v17_side_button("VEÍCULOS",Callable(self,"_show_vehicle_panel")); _v17_side_button("PREVISÃO",Callable(self,"_v15_show_forecast")); _v17_side_button("ESTOQUE / MOCHILA",Callable(self,"_show_inventory_panel")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter")); _mark_nav("production")

func _show_hunting_panel() -> void:
	var body := "[b]ZONA DE CAÇA[/b]\nFauna disponível: %d%%\nPeixes: %d%%\nArmadilhas: %d\nCarne crua: %d • couro: %d\n\nArma de fogo aumenta a eficiência, mas o ruído pode trazer infectados. Armadilhas são lentas e silenciosas." % [wildlife_density,fish_density,traps_set,materials.raw_meat,materials.leather]
	_set_right_panel("CAÇA E PESCA", "A FLORESTA TAMBÉM ESTÁ SOBREVIVENDO", body, [["CAÇAR", Callable(self,"_v7_hunt")], ["PESCAR", Callable(self,"_v7_fish")], ["ARMAR LAÇO", Callable(self,"_v7_set_field_trap")], ["VOLTAR", Callable(self,"_show_production_panel")]])

func _v7_hunt() -> void:
	if actions_left<=0: _toast("Sem tempo."); return
	actions_left-=1; hour+=3; activity_calories+=380; fatigue=mini(100,fatigue+14); thirst=mini(100,thirst+8); energy=maxi(0,energy-16)
	var chance:=35+int(skills.hunting)*10+int(skills.survival)*5+int(fitness/10)
	if equipped_firearm!="NENHUMA": chance+=15
	noise=mini(100,noise+15)
	if rng.randi_range(1,100)<=chance and wildlife_density>5:
		var meat:=rng.randi_range(1,3)+int(skills.hunting/2); materials.raw_meat+=meat; materials.leather+=rng.randi_range(0,1); wildlife_density=maxi(0,wildlife_density-rng.randi_range(3,7)); _v7_gain_skill("hunting",10); _add_event("CAÇA","Você voltou com %d porções de carne."%meat)
	else: _add_event("CAÇA","Você seguiu rastros por horas e voltou sem carne.")
	_save_game(); _show_hunting_panel()

func _v7_fish() -> void:
	if actions_left<=0: _toast("Sem tempo."); return
	actions_left-=1; hour+=2; activity_calories+=180; fatigue=mini(100,fatigue+7); var chance:=40+int(skills.survival)*8
	if rng.randi_range(1,100)<=chance and fish_density>5:
		var meat:=rng.randi_range(1,2); materials.raw_meat+=meat; fish_density=maxi(0,fish_density-2); _v7_gain_skill("survival",6); _add_event("PESCA","Você pescou alimento suficiente para %d refeição(ões)."%meat)
	else: _add_event("PESCA","Nenhuma fisgada. O tempo passou.")
	_save_game(); _show_hunting_panel()

func _v7_set_field_trap() -> void:
	if materials.wood<1 or materials.wire<1: _toast("Precisa de madeira e fio."); return
	materials.wood-=1; materials.wire-=1; traps_set+=1; _v7_gain_skill("hunting",4); _save_game(); _show_hunting_panel()

func _show_farm_panel() -> void:
	var body := "[b]HORTA[/b]\nCanteiros: %d • plantados: %d • crescimento: %d%% • colheitas prontas: %d\nSementes: %d • vegetais: %d • compostagem: %d\n\nChuva ajuda o crescimento. Falta de água e frio reduzem rendimento." % [farm.plots,farm.planted,farm.growth,farm.ready,materials.seeds,materials.vegetables,farm.compost]
	_set_right_panel("HORTA", "COMIDA É TEMPO TRANSFORMADO EM RAIZ", body, [["PREPARAR CANTEIRO", Callable(self,"_v7_make_plot")], ["PLANTAR", Callable(self,"_v7_plant")], ["COLHER", Callable(self,"_v7_harvest")], ["VOLTAR", Callable(self,"_show_production_panel")]])

func _v7_make_plot() -> void:
	if materials.wood<2: _toast("Falta madeira."); return
	materials.wood-=2; farm.plots=int(farm.plots)+1; facilities.garden=maxi(1,int(facilities.garden)); _v7_gain_skill("farming",5); _save_game(); _show_farm_panel()

func _v7_plant() -> void:
	var space:=int(farm.plots)-int(farm.planted)
	if space<=0 or materials.seeds<=0: _toast("Sem canteiro livre ou sementes."); return
	materials.seeds-=1; farm.planted=int(farm.planted)+1; farm.growth=0; _v7_gain_skill("farming",4); _save_game(); _show_farm_panel()

func _v7_harvest() -> void:
	if int(farm.ready)<=0: _toast("Nada pronto para colher."); return
	var n:=int(farm.ready)*(2+int(skills.farming)); materials.vegetables+=n; farm.ready=0; _v7_gain_skill("farming",10); _add_event("HORTA","Colheita: %d porções de vegetais."%n); _save_game(); _show_farm_panel()

func _show_animals_panel() -> void:
	var body := "[b]CRIAÇÃO[/b]\nGalinhas %d • coelhos %d • cabras %d • cão %s\nRação %d • saúde %d%% • ovos %d • leite %d\n\nAnimais consomem alimento e água todos os dias. Sem cercado, ataques e fugas são muito mais prováveis." % [animals.chickens,animals.rabbits,animals.goats,"SIM" if animals.dog>0 else "NÃO",animals.feed,animals.health,animals.eggs,animals.milk]
	_set_right_panel("ANIMAIS", "ESTABILIDADE TEM CUSTO", body, [["ALIMENTAR", Callable(self,"_v7_feed_animals")], ["PROCURAR ANIMAIS", Callable(self,"_v7_search_animals")], ["COLETAR OVOS/LEITE", Callable(self,"_v7_collect_animal_food")], ["VOLTAR", Callable(self,"_show_production_panel")]])

func _v7_feed_animals() -> void:
	if animals.feed<=0: _toast("Sem ração."); return
	animals.feed-=1; animals.health=mini(100,int(animals.health)+12); _save_game(); _show_animals_panel()

func _v7_search_animals() -> void:
	if facilities.animal_pen<=0: _toast("Construa um cercado primeiro."); return
	if actions_left<=0: _toast("Sem tempo."); return
	actions_left-=1; hour+=3; activity_calories+=300
	var roll:=rng.randi_range(1,100)
	if roll<=35: animals.chickens=int(animals.chickens)+rng.randi_range(1,2); _add_event("ANIMAIS","Você trouxe galinhas abandonadas para o cercado.")
	elif roll<=55: animals.rabbits=int(animals.rabbits)+1; _add_event("ANIMAIS","Um coelho vivo foi capturado sem ferimentos.")
	elif roll<=65: animals.goats=int(animals.goats)+1; _add_event("ANIMAIS","Uma cabra solta seguiu você de volta.")
	elif roll<=72 and animals.dog<=0: animals.dog=1; _add_event("ANIMAIS","Um cão desconfiado aceitou comida e ficou no abrigo.")
	else: _add_event("ANIMAIS","Você encontrou rastros, mas nada que pudesse trazer vivo.")
	_save_game(); _show_animals_panel()

func _v7_collect_animal_food() -> void:
	materials.eggs+=int(animals.eggs); animals.eggs=0
	if int(animals.milk)>0: inventory.food+=int(animals.milk); animals.milk=0
	_save_game(); _show_animals_panel()

func _show_vehicle_panel() -> void:
	var body:="[b]GARAGEM[/b]\n"
	for k in vehicles:
		var v:Dictionary=vehicles[k]; body += "%s — %s • condição %d%% • combustível %d\n" % [k,"ENCONTRADO" if bool(v.found) else "DESCONHECIDO",int(v.condition),int(v.fuel)]
	body += "\nAtivo: %s" % (active_vehicle if active_vehicle!="" else "A PÉ")
	_set_right_panel("VEÍCULOS", "ALCANCE TEM UM PREÇO", body, [["ESCOLHER MELHOR", Callable(self,"_v7_select_vehicle")], ["REPARAR", Callable(self,"_v7_repair_vehicle")], ["ABASTECER", Callable(self,"_v7_refuel_vehicle")], ["VOLTAR", Callable(self,"_show_production_panel")]])

func _v7_select_vehicle() -> void:
	for k in ["CARRO","MOTO","BICICLETA"]:
		if bool(vehicles[k].found) and int(vehicles[k].condition)>20: active_vehicle=k; _toast("%s selecionado."%k); _save_game(); _show_vehicle_panel(); return
	_toast("Nenhum veículo utilizável.")

func _v7_repair_vehicle() -> void:
	if active_vehicle=="": _toast("Selecione um veículo."); return
	if materials.mechanical<2 or materials.steel<1: _toast("Faltam peças mecânicas e aço."); return
	materials.mechanical-=2; materials.steel-=1; vehicles[active_vehicle].condition=mini(100,int(vehicles[active_vehicle].condition)+25+int(skills.mechanics)*5); _v7_gain_skill("mechanics",10); _save_game(); _show_vehicle_panel()

func _v7_refuel_vehicle() -> void:
	if active_vehicle=="" or active_vehicle=="BICICLETA": _toast("Esse veículo não precisa de combustível."); return
	if inventory.fuel<=0: _toast("Sem combustível."); return
	inventory.fuel-=1; vehicles[active_vehicle].fuel=int(vehicles[active_vehicle].fuel)+20; _save_game(); _show_vehicle_panel()

func _v7_prepare_travel() -> void:
	if active_vehicle=="BICICLETA": fatigue=maxi(0,fatigue-2); activity_calories+=80
	elif active_vehicle=="MOTO" or active_vehicle=="CARRO":
		if int(vehicles[active_vehicle].fuel)>0:
			vehicles[active_vehicle].fuel=maxi(0,int(vehicles[active_vehicle].fuel)-2); fatigue=maxi(0,fatigue-4); noise=mini(100,noise+(8 if active_vehicle=="MOTO" else 12))
		else: active_vehicle=""; _add_event("VEÍCULO","O tanque secou. Você voltou a andar a pé.")

func _show_infrastructure_panel() -> void:
	var body := "[b]INFRAESTRUTURA[/b]\nEnergia do bairro: %s\nÁgua comunitária: %s\nAntena de longo alcance: %s\nQuarteirão seguro: %s\n\nProjetos grandes gastam materiais, mas mudam o mundo em vez de apenas dar bônus numérico." % ["ATIVA" if bool(city_projects.power) else "CAÍDA","ATIVA" if bool(city_projects.water) else "CAÍDA","ATIVA" if bool(city_projects.antenna) else "INATIVA","SIM" if bool(city_projects.safe_block) else "NÃO"]
	_set_right_panel("INFRAESTRUTURA", "RECONSTRUIR É OUTRA FORMA DE SOBREVIVER", body, [["RESTAURAR ENERGIA", func(): _v7_city_project("power")], ["RESTAURAR ÁGUA", func(): _v7_city_project("water")], ["ERGUE ANTENA", func(): _v7_city_project("antenna")], ["SEGURAR QUARTEIRÃO", func(): _v7_city_project("safe_block")], ["VOLTAR", Callable(self,"_show_production_panel")]])

func _v7_city_project(id: String) -> void:
	if bool(city_projects.get(id,false)): _toast("Projeto já concluído."); return
	var cost:=6 if id!="safe_block" else 10
	if materials.steel+inventory.scrap<cost or materials.copper<2: _toast("Faltam metal e cobre."); return
	var take:=mini(cost,int(inventory.scrap)); inventory.scrap-=take; materials.steel=maxi(0,int(materials.steel)-(cost-take)); materials.copper-=2; city_projects[id]=true
	if id=="power": radio_signal=mini(100,radio_signal+15)
	elif id=="water": inventory.water+=3
	elif id=="antenna": radio_signal=100
	elif id=="safe_block": threat=maxi(0,threat-18)
	_add_event("CIDADE","Projeto concluído: %s."%id.to_upper()); _save_game(); _show_infrastructure_panel()

func _show_community_panel() -> void:
	_v8_show_page("community","COMUNIDADE","PESSOAS, NÃO PLANILHAS.","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["community"]; v8_page_shade.color=Color(0.008,0.008,0.007,0.45)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_cards.visible=false; v8_page_body.visible=true; v8_page_body.position=Vector2(24,18); v8_page_body.size=Vector2(1060,72)
	v8_page_body.text="[b]%d pessoa(s)[/b] • coesão %d • tensão %d • conforto %d\nParceiro(a): %s • crianças %d%s"%[survivor_count,community_cohesion,community_tension,shelter_comfort,partner_name if partner_name!="" else "—",children.size()," • [color=#c68b45]há suspeitas não resolvidas[/color]" if not community_clues.is_empty() else ""]
	_v19_clear_named(v8_page_info,"V19Community")
	var scroll:=ScrollContainer.new(); scroll.name="V19CommunityScroll"; scroll.position=Vector2(20,100); scroll.size=Vector2(1080,548); scroll.horizontal_scroll_mode=ScrollContainer.SCROLL_MODE_DISABLED; scroll.vertical_scroll_mode=ScrollContainer.SCROLL_MODE_AUTO; v8_page_info.add_child(scroll)
	var grid:=GridContainer.new(); grid.name="V19CommunityGrid"; grid.columns=2; grid.custom_minimum_size=Vector2(1044,0); grid.add_theme_constant_override("h_separation",14); grid.add_theme_constant_override("v_separation",14); scroll.add_child(grid)
	if survivors.is_empty():
		grid.add_child(_v17_text_card("VOCÊ AINDA ESTÁ SOZINHO","Pessoas são encontradas explorando, ouvindo o rádio e respondendo a situações do mundo.",Color("#675b4a"),Callable(self,"_show_map")))
	else:
		for i in range(survivors.size()):
			if bool(survivors[i].get("alive",true)): grid.add_child(_v17_survivor_card(i))
	_v8_clear_actions(v8_page_actions); _v17_side_note("CONVIVÊNCIA",last_community_scene if last_community_scene!="" else "Salvar alguém é só o começo. Ferimentos, confiança, ciúmes e decisões continuam depois que a porta do abrigo fecha.",190)
	_v17_side_button("DOSSIÊ SELECIONADO",Callable(self,"_v10_show_survivor_dossier")); _v17_side_button("ROTINA / LAZER",Callable(self,"_v11_show_routine_panel")); _v17_side_button("TRABALHOS",Callable(self,"_v9_show_work_roster")); _v17_side_button("ENFERMARIA",Callable(self,"_v15_show_shelter_health")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter")); _mark_nav("community")
	_v19_hint_once("community_scroll","DICA: arraste a lista de pessoas. Retratos, estado e função ajudam a ler a comunidade de relance.")

func _v13_runtime_png(path:String) -> Texture2D:
	if ResourceLoader.exists(path): return load(path) as Texture2D
	var img:=Image.new(); var err:=img.load(ProjectSettings.globalize_path(path))
	if err==OK: return ImageTexture.create_from_image(img)
	return null

func _v12_portrait_texture(id:String) -> Texture2D:
	var safe_id := id if id.strip_edges()!="" else "starter"
	return _v13_runtime_png("res://assets/portraits/%s.png"%safe_id)

func _v11_make_survivor_card(index:int) -> Button:
	var p:Dictionary=survivors[index]; _v7_normalize_survivor(p)
	var meta:=_v10_character_by_name(str(p.get("name",""))); var cid:=str(meta.get("id","starter")); if cid=="": cid="starter"
	var rarity:=str(p.get("rarity","COMUM")); var col:Color=V10_RARITY_COLORS.get(rarity,MUTED); var task:=str(survivor_tasks.get(str(p.name),"SEM FUNÇÃO"))
	var b:=Button.new(); b.custom_minimum_size=Vector2(260,150); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.03,0.028,0.024,0.95),col,5,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.075,0.06,0.045,0.98),col.lightened(0.18),5,3))
	var strip:=ColorRect.new(); strip.position=Vector2(0,0); strip.size=Vector2(7,150); strip.color=col; strip.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(strip)
	var portrait:=TextureRect.new(); portrait.position=Vector2(13,14); portrait.size=Vector2(72,105); portrait.texture=_v12_portrait_texture(cid); portrait.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; portrait.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; portrait.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(portrait)
	var name_l:=Label.new(); name_l.position=Vector2(95,10); name_l.size=Vector2(150,30); name_l.text=str(p.name); name_l.add_theme_font_size_override("font_size",19); name_l.add_theme_color_override("font_color",BONE); name_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(name_l)
	var role_l:=Label.new(); role_l.position=Vector2(95,40); role_l.size=Vector2(150,35); role_l.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; role_l.text="%s • %s"%[str(p.role),rarity]; role_l.add_theme_font_size_override("font_size",10); role_l.add_theme_color_override("font_color",col.lightened(0.22)); role_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(role_l)
	var status_l:=Label.new(); status_l.position=Vector2(95,78); status_l.size=Vector2(150,60); status_l.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; status_l.text="%s\n%s"%[_v7_social_read(p),task]; status_l.add_theme_font_size_override("font_size",10); status_l.add_theme_color_override("font_color",MUTED); status_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(status_l)
	b.pressed.connect(func(): selected_survivor_index=index; _v10_show_survivor_dossier())
	return b

func _v7_social_read(person: Dictionary) -> String:
	var trust:=int(person.trust); var loyalty:=int(person.loyalty); var mood:="DISTANTE"
	if trust>=70 and loyalty>=65: mood="MUITO PRÓXIMO"
	elif trust>=50: mood="CONFIANTE"
	elif trust<30: mood="DESCONFIADO"
	if int(person.envy)>65: mood += " / INVEJOSO"
	if int(person.stress)>70: mood += " / NO LIMITE"
	return mood

func _v7_talk_to_survivor() -> void:
	if survivors.is_empty(): _toast("Não há ninguém com quem conversar."); return
	selected_survivor_index=clampi(selected_survivor_index,0,survivors.size()-1)
	var p:Dictionary=survivors[selected_survivor_index]
	if not bool(p.alive): return
	p.trust=mini(100,int(p.trust)+rng.randi_range(2,5)); p.affinity=mini(100,int(p.affinity)+rng.randi_range(2,5)); p.stress=maxi(0,int(p.stress)-5); stress=maxi(0,stress-3)
	if int(p.trust)>=65 and str(p.secret)!="" and not bool(p.secret_known) and rng.randi_range(1,100)<=45:
		p.secret_known=true; _add_event("COMUNIDADE","%s contou algo que escondia: %s."%[str(p.name),str(p.secret)])
	selected_survivor_index=(selected_survivor_index+1)%survivors.size(); _save_game(); _show_community_panel()

func _v7_romance_attempt() -> void:
	if partner_name!="": _toast("Você já tem uma relação importante com %s."%partner_name); return
	for p in survivors:
		if bool(p.alive) and str(p.partner)=="" and int(p.trust)>=65 and int(p.affinity)>=60:
			partner_name=str(p.name); p.partner="JOGADOR"; p.loyalty=mini(100,int(p.loyalty)+12); _add_event("COMUNIDADE","Você e %s decidiram tentar construir algo juntos."%partner_name); _save_game(); _show_community_panel(); return
	_toast("Ainda não existe confiança suficiente para isso.")

func _v7_investigate_community() -> void:
	if survivors.is_empty(): _toast("Você está sozinho."); return
	var found:=false
	for p in survivors:
		if (bool(p.spy) or int(p.envy)>60 or int(p.loyalty)<30) and not bool(p.secret_known): p.secret_known=true; found=true; _add_event("COMUNIDADE","Você percebeu sinais estranhos envolvendo %s."%str(p.name)); break
	if not found: _add_event("COMUNIDADE","Nada concreto. Só cansaço, medo e pequenos atritos.")
	_save_game(); _show_community_panel()

func _v7_social_daily() -> void:
	if survivors.is_empty(): community_tension=maxi(0,community_tension-1); return
	for p in survivors:
		_v7_normalize_survivor(p)
		if not bool(p.alive): continue
		p.stress=clampi(int(p.stress)+(3 if morale<40 else -2),0,100)
		if hunger>65 or thirst>65: p.trust=maxi(0,int(p.trust)-2); p.envy=mini(100,int(p.envy)+2)
		else: p.loyalty=mini(100,int(p.loyalty)+1)
		if str(p.name)=="LÚCIA" and day>=12 and int(p.trust)<40 and not bool(p.spy): p.spy=true; p.secret="CONTATO ATIVO COM A VIGÍLIA"
		if (bool(p.spy) and int(p.trust)<45 and day>=14) or (int(p.envy)>78 and int(p.loyalty)<28): event_flags["v7_social_crisis"]=str(p.name)
	community_tension=clampi(community_tension+(2 if morale<45 else -1),0,100)
	_v7_form_npc_couples(); _v7_update_pregnancies()

func _v7_form_npc_couples() -> void:
	if survivors.size()<2 or rng.randi_range(1,100)>8: return
	var a:Dictionary={}; var b:Dictionary={}
	for p in survivors:
		if bool(p.alive) and str(p.partner)=="" and int(p.trust)>=55:
			if a.is_empty(): a=p
			elif b.is_empty(): b=p; break
	if not a.is_empty() and not b.is_empty(): a.partner=str(b.name); b.partner=str(a.name); _add_event("COMUNIDADE","%s e %s estão cada vez mais próximos."%[str(a.name),str(b.name)])

func _v7_update_pregnancies() -> void:
	for pr in pregnancies:
		if not bool(pr.get("born",false)) and day>=int(pr.get("due_day",99999)):
			pr.born=true; children.append({"name":"CRIANÇA %d"%(children.size()+1),"born_day":day}); _add_event("FAMÍLIA","Uma criança nasceu no abrigo. O futuro agora tem um rosto.")
	if day<30 or pregnancies.size()>0 or inventory.food<12 or inventory.water<12: return
	var couple_exists:=partner_name!=""
	if not couple_exists:
		for p in survivors:
			if str(p.get("partner",""))!="": couple_exists=true; break
	if couple_exists and rng.randi_range(1,100)<=2: pregnancies.append({"start_day":day,"due_day":day+270,"born":false}); _add_event("FAMÍLIA","A comunidade recebeu a notícia de uma gravidez. Agora é preciso pensar muito além do próximo inverno.")

func _v7_has_pending_social_crisis() -> bool:
	return str(event_flags.get("v7_social_crisis",""))!=""

func _v7_trigger_social_crisis() -> void:
	var name:=str(event_flags.get("v7_social_crisis",""))
	if name=="": return
	var body:="Durante a madrugada, sinais apontam para %s. Pode ser espionagem, roubo ou algo pior.\n\nVocê não tem certeza de quanto já foi revelado para fora do abrigo."%name
	_open_modal("TRAIÇÃO?",body,[["CONFRONTAR",func(): _v7_resolve_betrayal(name,"confront")],["EXPULSAR",func(): _v7_resolve_betrayal(name,"exile")],["VIGIAR EM SILÊNCIO",func(): _v7_resolve_betrayal(name,"watch")]])

func _v7_resolve_betrayal(name: String, choice: String) -> void:
	for p in survivors:
		if str(p.name)!=name: continue
		if choice=="exile": p.alive=false; survivor_count=maxi(1,survivor_count-1); community_tension=mini(100,community_tension+12); _add_event("COMUNIDADE","%s foi expulso do abrigo."%name)
		elif choice=="confront": p.secret_known=true; p.trust=maxi(0,int(p.trust)-8); p.loyalty=mini(100,int(p.loyalty)+5); community_tension=mini(100,community_tension+6); _add_event("COMUNIDADE","Você confrontou %s diante de todos."%name)
		else: p.trust=maxi(0,int(p.trust)-3); p.loyalty=maxi(0,int(p.loyalty)-4); _add_event("COMUNIDADE","Você decidiu observar %s sem revelar a suspeita."%name)
		p.betrayed=true; p.spy=false; break
	event_flags.erase("v7_social_crisis"); _close_modal(); _save_game(); _show_community_panel()

func _show_world_panel() -> void:
	_v7_generate_world_news()
	var body := "[b]NOTÍCIAS DO MUNDO[/b]\n%s • %d°C • sinal do rádio %d%%\nRede elétrica regional %d%% • segurança da água %d%% • pressão de refugiados %d/100\n\n" % [season,temperature,radio_signal,int(world_state.get("power_grid",0)),int(world_state.get("water_safety",0)),int(world_state.get("refugee_pressure",0))]
	var start:=maxi(0,world_news_seen.size()-7)
	for i in range(start,world_news_seen.size()): body += "• %s\n\n"%str(world_news_seen[i])
	body += "[b]FACÇÕES CONHECIDAS[/b]\n"
	for f in factions: body += "%s — reputação %d • %s\n"%[f,int(factions[f].rep),str(factions[f].status)]
	_v8_show_page("world", "RÁDIO / MUNDO", "O APOCALIPSE CONTINUA MESMO QUANDO VOCÊ FECHA A PORTA", body, [["VARRER FREQUÊNCIAS", Callable(self,"_scan_radio")], ["ARQUIVO DO COLAPSO", Callable(self,"_show_lore_panel")], ["COMUNIDADE", Callable(self,"_show_community_panel")], ["MAPA", Callable(self,"_show_map")]])
	_mark_nav("world")

func _v7_generate_world_news() -> void:
	for n in V7_WORLD_NEWS:
		var key:="v7_news_%s_%s"%[str(n.day),str(n.channel)]
		if day>=int(n.day) and not bool(event_flags.get(key,false)):
			event_flags[key]=true
			world_news_seen.append("[%s] %s"%[str(n.channel),str(n.text)])
			lore_archive.append("Dia %d — %s"%[day,str(n.text)])
			break
	while world_news_seen.size()>9: world_news_seen.pop_front()

func _show_lore_panel() -> void:
	var body:="[b]ARQUIVO DO COLAPSO[/b]\n"
	for i in range(maxi(0,lore_archive.size()-14),lore_archive.size()): body += "• %s\n\n"%str(lore_archive[i])
	_v8_show_page("journal", "ARQUIVO DO COLAPSO", "NOTÍCIAS ANTIGAS PODEM MUDAR DE SIGNIFICADO", body, [["RÁDIO", Callable(self,"_show_world_panel")], ["DIÁRIO", Callable(self,"_show_journal_panel")]])

func _v7_loot_bonus(location_name: String, room_name: String) -> String:
	var found:Array[String]=[]; var book_chance:=18+scavenging_skill*4
	match location_name:
		"SUPERMERCADO":
			materials.salt+=1; materials.seeds+=rng.randi_range(0,1); animals.feed+=rng.randi_range(0,1)
			if room_name=="DEPÓSITO": materials.vegetables+=1
		"FARMÁCIA": materials.chemicals+=1
		"OFICINA":
			materials.steel+=rng.randi_range(1,2); materials.copper+=1; materials.wire+=1; materials.mechanical+=1; tools.hammer=true
			if room_name=="GARAGEM": vehicles.BICICLETA.found=true
		"ESCOLA": book_chance+=35; materials.wood+=1
		"DELEGACIA":
			materials.steel+=1
			if rng.randi_range(1,100)<=25: _v7_add_special_item("Colete policial","ARMADURA",rng.randi_range(45,85),"RARO")
		"CENTRO": materials.plastic+=1; materials.wire+=1
		"HOSPITAL": materials.chemicals+=2; book_chance+=20
		"ESTAÇÃO": materials.copper+=2; materials.wire+=2; tools.multimeter=true
		"POSTO":
			materials.rubber+=1; materials.mechanical+=1
			if room_name=="OFICINA": vehicles.MOTO.found=true
		"ARMAZÉM": materials.wood+=2; materials.steel+=2; materials.leather+=1; tools.saw=true
		"TÚNEIS": materials.coal+=2
		"QUARENTENA":
			materials.chemicals+=2; materials.electronics+=2; book_chance+=30
			if room_name=="LABORATÓRIO MILITAR": vehicles.CARRO.found=true
	if rng.randi_range(1,100)<=book_chance:
		var candidates:Array=[]
		for id in V7_BOOKS:
			if not found_books.has(id): candidates.append(id)
		if not candidates.is_empty():
			var id:=str(candidates[rng.randi_range(0,candidates.size()-1)]); found_books[id]=true; found.append("livro: %s"%str(V7_BOOKS[id].title))
	if rng.randi_range(1,100)<=18:
		var names:=["Lanterna robusta","Machado usado","Mochila de trilha","Canivete técnico","Botas militares"]; _v7_add_special_item(str(names[rng.randi_range(0,names.size()-1)]),"EQUIPAMENTO",rng.randi_range(35,95)); found.append("item de qualidade variável")
	if location_name=="OFICINA" or location_name=="ARMAZÉM": found.append("materiais técnicos")
	return "Extra: %s."%", ".join(found) if not found.is_empty() else ""

func _v7_combat_injury(damage: int) -> void:
	if damage<8 or rng.randi_range(1,100)>22: return
	var roll:=rng.randi_range(1,100)
	if roll<=35: injuries.arm=mini(3,int(injuries.arm)+1); combat_log.append("Seu braço foi ferido.")
	elif roll<=70: injuries.leg=mini(3,int(injuries.leg)+1); combat_log.append("Sua perna foi ferida.")
	elif roll<=90: injuries.bleeding=mini(3,int(injuries.bleeding)+1); combat_log.append("O ferimento está sangrando.")
	else: injuries.fracture=mini(2,int(injuries.fracture)+1); combat_log.append("Você sentiu algo quebrar.")

func _v7_daily_tick() -> void:
	# Nutrição e corpo.
	var need:=2100+activity_calories+int(body_weight*3.0)
	var balance:=calories_today-need; body_weight=clampf(body_weight+float(balance)/7700.0,45.0,130.0); body_fat=clampf(body_fat+float(balance)/18000.0,5.0,45.0)
	if balance < -900:
		energy=maxi(0,energy-12)
		if body_weight<62.0: strength=maxi(10,strength-1)
	elif balance > 900: energy=mini(100,energy+4)
	else: energy=mini(100,energy+8)
	if body_weight>95.0: fitness=maxi(10,fitness-1)
	soreness=maxi(0,soreness-18); stress=clampi(stress+(4 if threat>60 else -2),0,100); hygiene=maxi(0,hygiene-(4 if weather_severity==0 else 2)); calories_today=0; activity_calories=0
	if injuries.bleeding>0: life=maxi(0,life-int(injuries.bleeding)*2)
	# A estação e o clima mudam a produção de verdade: chuva ajuda a horta,
	# geada/calor forte atrasam crescimento e temporais podem danificar canteiros.
	if int(farm.planted)>0:
		var season_growth: int = int({"PRIMAVERA":7,"VERÃO":3,"OUTONO":1,"INVERNO":-5}.get(season,0))
		var rain_growth := 7 if weather_severity in [1,2] else 0
		var temp_penalty := 0
		if temperature <= 4: temp_penalty += 10
		elif temperature < 8: temp_penalty += 5
		if temperature >= 33: temp_penalty += 6
		var storm_damage := 0
		if weather_severity >= 3 and rng.randi_range(1,100) <= 18:
			storm_damage = 7
			_add_event("HORTA", "O temporal derrubou parte das plantas e atrasou a colheita.")
		var growth:=maxi(1,12+int(skills.farming)*3+season_growth+rain_growth-temp_penalty-storm_damage)
		farm.growth=mini(100,int(farm.growth)+growth)
		if int(farm.growth)>=100: farm.ready=int(farm.ready)+int(farm.planted); farm.planted=0; farm.growth=0
	# Coletor produz água não tratada. Chuva não vira água potável magicamente.
	if facilities.rain_collector>0 and weather_severity>0:
		var collected:=maxi(1,int(facilities.rain_collector)*(1 if weather_severity==1 else 2))
		inventory.dirty_water+=collected
	if traps_set>0 and wildlife_density>0 and rng.randi_range(1,100)<=35+int(skills.hunting)*5: materials.raw_meat+=1; wildlife_density=maxi(0,wildlife_density-1); _add_event("ARMADILHA","Uma das armadilhas rendeu carne durante a noite.")
	_v7_animals_daily(); _v7_social_daily(); _v9_survivor_work_daily(); _v9_social_incident_tick(); _v10_personal_story_tick(); _v11_daily_community_scene(); _v13_daily_event_tick(); _v7_generate_world_news(); _v9_food_daily(); _v9_world_event_tick(); _v7_natural_recovery()

func _v7_animals_daily() -> void:
	var total:=int(animals.chickens)+int(animals.rabbits)+int(animals.goats)
	if total<=0 and int(animals.dog)<=0: return
	var weather_stress := 0
	if temperature <= 3: weather_stress += 7
	elif temperature <= 8: weather_stress += 3
	if temperature >= 34: weather_stress += 6
	if weather_severity >= 3 and int(facilities.animal_pen)<=0: weather_stress += 7
	var water_need := 1 + (1 if temperature >= 30 and total>0 else 0)
	if total>0 and animals.feed>0 and int(inventory.get("water",0))>=water_need:
		animals.feed-=1; inventory.water-=water_need
		animals.health=clampi(int(animals.health)+3-weather_stress,0,100)
		var production_factor := 0 if int(animals.health)<35 else 1
		if season=="INVERNO" and temperature<7: production_factor=0
		animals.eggs=int(animals.eggs)+int(animals.chickens/2)*production_factor
		animals.milk=int(animals.milk)+int(animals.goats/2)*production_factor
		var breed_chance:=8 + int(skills.get("farming",0))*2
		if season=="PRIMAVERA": breed_chance+=6
		if weather_stress>0: breed_chance=maxi(1,breed_chance-weather_stress)
		if facilities.animal_pen>0 and rng.randi_range(1,100)<=breed_chance:
			animals.rabbits=int(animals.rabbits)+1; _add_event("ANIMAIS","A criação aumentou durante a noite.")
	else:
		animals.health=maxi(0,int(animals.health)-12-weather_stress); _add_event("ANIMAIS","Faltou água/ração ou o clima castigou o criatório.")
	if weather_stress>=7:
		_add_event("ANIMAIS","%s prejudicou a criação. Abrigo e água passaram a importar mais." % ("O frio" if temperature<10 else "O calor/temporal"))
	if int(animals.health)<25 and total>0 and rng.randi_range(1,100)<=25:
		if animals.chickens>0: animals.chickens-=1
		elif animals.rabbits>0: animals.rabbits-=1
		elif animals.goats>0: animals.goats-=1
		_add_event("ANIMAIS","Um animal não resistiu às condições do abrigo.")
	if animals.dog>0 and rng.randi_range(1,100)<=20: threat=maxi(0,threat-3); _add_event("CÃO","O cachorro avisou sobre movimento antes que chegasse perto demais.")

func _v7_natural_recovery() -> void:
	if facilities.library>0: stress=maxi(0,stress-2)
	if hygiene<25: morale=maxi(0,morale-2)
	if stress>80: fatigue=mini(100,fatigue+8)
	if city_projects.water: inventory.water+=1
	if city_projects.safe_block: threat=maxi(0,threat-2)

# -----------------------------------------------------------------------------
# AFTERFALL V9 — interiores sistêmicos, alimentação específica e mundo reativo
# -----------------------------------------------------------------------------
func _v9_reset_systems() -> void:
	detailed_food=[]; global_events_active={}; world_state={"power_grid":42,"water_safety":48,"refugee_pressure":0,"radio_blackout":0}; stomach_sick=0; current_room_context={"location":"","room":""}
	survivor_tasks={}; community_clues=[]; community_supplies_stolen=0
	_v9_init_room_conditions()

func _v9_normalize_loaded_state() -> void:
	if typeof(detailed_food)!=TYPE_ARRAY: detailed_food=[]
	if typeof(room_conditions)!=TYPE_DICTIONARY or room_conditions.is_empty(): _v9_init_room_conditions()
	for k in ["power_grid","water_safety","refugee_pressure","radio_blackout"]:
		if not world_state.has(k): world_state[k]=0
	if typeof(survivor_tasks)!=TYPE_DICTIONARY: survivor_tasks={}
	if typeof(community_clues)!=TYPE_ARRAY: community_clues=[]

func _v9_init_room_conditions() -> void:
	room_conditions={}
	for loc in LOCATION_ROOMS:
		for room_v in LOCATION_ROOMS[loc]:
			var room:=str(room_v); var upper:=room.to_upper(); var key:="%s|%s"%[str(loc),room]
			var locked:=upper.contains("ARSENAL") or upper.contains("CÂMARA SELADA") or upper.contains("COMANDO") or upper.contains("LABORATÓRIO MILITAR") or upper.contains("SALA DE CONTROLE")
			var dark:=upper.contains("SUBSOLO") or upper.contains("TÚNEL") or upper.contains("NECROTÉRIO") or upper.contains("NÍVEL INFERIOR") or upper.contains("NINHO PROFUNDO") or upper.contains("PORÃO")
			var contam:=0
			if upper.contains("NECROTÉRIO") or upper.contains("NINHO") or upper.contains("VIVEIRO") or upper.contains("LABORATÓRIO"): contam=2
			elif upper.contains("CIRURGIA") or upper.contains("CÂMARA FRIA"): contam=1
			var events:= ["","","noise","cache","document","survivor","alarm"]
			var ev:=str(events[abs(hash(key))%events.size()])
			room_conditions[key]={"locked":locked,"dark":dark,"contamination":contam,"event":ev,"event_done":false,"forced":false}

func _v9_room_condition(location_name:String, room_name:String) -> Dictionary:
	var key:="%s|%s"%[location_name,room_name]
	if not room_conditions.has(key): room_conditions[key]={"locked":false,"dark":false,"contamination":0,"event":"","event_done":false,"forced":false}
	return room_conditions[key]

func _v9_enter_room(location_name:String, room_name:String) -> void:
	current_room_context={"location":location_name,"room":room_name}
	var cond:=_v9_room_condition(location_name,room_name)
	if bool(cond.get("locked",false)):
		var actions:Array=[]
		if int(inventory.get("keycard",0))>0: actions.append(["USAR CARTÃO / CHAVE",func(): _v9_unlock_room(location_name,room_name,"key")])
		actions.append(["FORÇAR ENTRADA",func(): _v9_unlock_room(location_name,room_name,"force")])
		if bool(tools.get("wrench",false)) or int(skills.get("mechanics",0))>=2: actions.append(["DESMONTAR A FECHADURA",func(): _v9_unlock_room(location_name,room_name,"skill")])
		actions.append(["DEIXAR PARA DEPOIS",func(): _v8_show_location_screen(location_name)])
		_v8_show_page("journal","%s • %s"%[location_name,room_name],"A PORTA NÃO CEDE","Há marcas recentes na fechadura. Entrar rápido fará barulho; entrar direito exige ferramenta, conhecimento ou uma chave.",actions); _v9_set_immersive_page(true); v8_page_bg.texture=_v8_location_texture(location_name); return
	if bool(cond.get("dark",false)) and not bool(city_projects.get("power",false)):
		var dark_actions:Array=[]
		if int(inventory.get("battery",0))>0: dark_actions.append(["USAR LANTERNA • -1 PILHA",func(): _v9_enter_dark_room(location_name,room_name,true)])
		dark_actions.append(["ENTRAR NO ESCURO",func(): _v9_enter_dark_room(location_name,room_name,false)])
		dark_actions.append(["VOLTAR",func(): _v8_show_location_screen(location_name)])
		_v8_show_page("journal","%s • %s"%[location_name,room_name],"VOCÊ NÃO ENXERGA O FUNDO DO CÔMODO","Sem energia, o interior engole a luz da porta. Entrar no escuro aumenta o risco de ferimento, emboscada e perder itens importantes.",dark_actions); _v9_set_immersive_page(true); v8_page_bg.texture=_v8_location_texture(location_name); return
	_v9_room_hazard_or_event(location_name,room_name)

func _v9_unlock_room(location_name:String, room_name:String, method:String) -> void:
	var cond:=_v9_room_condition(location_name,room_name); var success:=true
	if method=="key": inventory.keycard=maxi(0,int(inventory.keycard)-1)
	elif method=="skill": _v7_gain_skill("mechanics",4); fatigue=mini(100,fatigue+3); hour+=1
	else:
		noise=mini(100,noise+18); fatigue=mini(100,fatigue+6); success=rng.randi_range(1,100)<=55+strength/3
		if not success: life=maxi(1,life-rng.randi_range(2,7)); injuries.arm=mini(3,int(injuries.arm)+1)
	if success:
		cond.locked=false; cond.forced=method=="force"; room_conditions["%s|%s"%[location_name,room_name]]=cond; _add_event(location_name,"Você abriu %s (%s)."%[room_name,method]); _v9_enter_room(location_name,room_name)
	else:
		_v8_show_page("journal","ENTRADA FALHOU","O BARULHO ECOOU PELO PRÉDIO","A porta continuou fechada. Seu braço dói e qualquer coisa próxima agora sabe que alguém está aqui.",[ ["TENTAR NOVAMENTE",func(): _v9_enter_room(location_name,room_name)], ["RECUAR",func(): _v8_show_location_screen(location_name)] ]); _v9_set_immersive_page(true); v8_page_bg.texture=_v8_location_texture(location_name)

func _v9_enter_dark_room(location_name:String, room_name:String, light:bool) -> void:
	if light: inventory.battery=maxi(0,int(inventory.battery)-1); _v7_gain_skill("survival",1)
	else:
		stress=mini(100,stress+5); var danger:=35-int(skills.get("survival",0))*4
		if rng.randi_range(1,100)<=danger: life=maxi(1,life-rng.randi_range(2,8)); fatigue=mini(100,fatigue+5); _add_event(location_name,"Você se machucou explorando %s no escuro."%room_name)
	_v9_room_hazard_or_event(location_name,room_name)

func _v9_room_hazard_or_event(location_name:String, room_name:String) -> void:
	if _v18_try_special_room(location_name,room_name): return
	var cond:=_v9_room_condition(location_name,room_name); var contamination:=int(cond.get("contamination",0))
	if contamination>0 and rng.randi_range(1,100)<=20+contamination*15:
		infection=mini(100,infection+contamination*2); stress=mini(100,stress+contamination*2); _add_event("CONTAMINAÇÃO","O ar de %s irritou seus olhos e garganta."%room_name)
	if bool(cond.get("event_done",false)) or str(cond.get("event",""))=="": _search_room(location_name,room_name); return
	_v9_render_room_event(location_name,room_name,str(cond.get("event","")))

func _v9_render_room_event(location_name:String, room_name:String, event_id:String) -> void:
	match event_id:
		"noise": _v8_show_page("journal","%s • %s"%[location_name,room_name],"ALGUMA COISA SE MOVE ATRÁS DA PAREDE","Você escuta um arrasto curto, depois silêncio. Pode ser um infectado preso, um animal ou alguém tentando ficar quieto.",[ ["ESCUTAR ANTES DE ENTRAR",func(): _v9_resolve_room_event(location_name,room_name,"listen")], ["ENTRAR RÁPIDO",func(): _v9_resolve_room_event(location_name,room_name,"rush")], ["RECUAR",func(): _v8_show_location_screen(location_name)] ])
		"cache": _v8_show_page("journal","%s • %s"%[location_name,room_name],"UM ESCONDERIJO IMPROVISADO","Atrás de um móvel há uma caixa presa com fio fino. Pode ser um estoque escondido — ou uma isca barulhenta.",[ ["INSPECIONAR",func(): _v9_resolve_room_event(location_name,room_name,"inspect")], ["ABRIR LOGO",func(): _v9_resolve_room_event(location_name,room_name,"open")], ["IGNORAR",func(): _v9_resolve_room_event(location_name,room_name,"ignore")] ])
		"document": _v8_show_page("journal","%s • %s"%[location_name,room_name],"PAPÉIS QUE ALGUÉM TENTOU ESCONDER","Entre folhas molhadas há nomes, datas e anotações feitas antes do colapso. Parte pode explicar o que aconteceu nesta região.",[ ["LER COM CALMA",func(): _v9_resolve_room_event(location_name,room_name,"read")], ["GUARDAR E CONTINUAR",func(): _v9_resolve_room_event(location_name,room_name,"take")] ])
		"survivor": _v8_show_page("journal","%s • %s"%[location_name,room_name],"ALGUÉM ESTÁ AQUI","Uma pessoa aponta uma ferramenta improvisada para você. Parece exausta, mas ainda está lúcida. Ela não sabe se você é pior que o que está lá fora.",[ ["FALAR BAIXO",func(): _v9_resolve_room_event(location_name,room_name,"talk")], ["OFERECER ÁGUA",func(): _v9_resolve_room_event(location_name,room_name,"water")], ["RECUAR",func(): _v9_resolve_room_event(location_name,room_name,"leave")] ])
		"alarm": _v8_show_page("journal","%s • %s"%[location_name,room_name],"FIAÇÃO AINDA ESTÁ ATIVA","Uma luz de emergência pisca. Abrir a próxima porta pode acionar uma sirene antiga.",[ ["DESLIGAR O CIRCUITO",func(): _v9_resolve_room_event(location_name,room_name,"cut")], ["ARRISCAR",func(): _v9_resolve_room_event(location_name,room_name,"risk")], ["VOLTAR",func(): _v8_show_location_screen(location_name)] ])
		_: _search_room(location_name,room_name)
	_v9_set_immersive_page(true); v8_page_bg.texture=_v8_location_texture(location_name)

func _v9_resolve_room_event(location_name:String, room_name:String, choice:String) -> void:
	var cond:=_v9_room_condition(location_name,room_name); cond.event_done=true; room_conditions["%s|%s"%[location_name,room_name]]=cond
	match choice:
		"listen":
			_v7_gain_skill("survival",2); if rng.randi_range(1,100)<=60: _add_event(location_name,"Você identificou o movimento antes de entrar.")
		"rush": noise=mini(100,noise+8); stress=mini(100,stress+3)
		"inspect": _v7_gain_skill("survival",2); inventory.scrap+=1; materials.wire+=1
		"open":
			if rng.randi_range(1,100)<=40: noise=mini(100,noise+16); life=maxi(1,life-3)
			else: inventory.food+=1
		"read": lore_archive.append("Dia %d — documento encontrado em %s/%s menciona evacuações anteriores ao primeiro boletim público."%[day,location_name,room_name]); hour+=1
		"take": lore_archive.append("Documento recuperado de %s/%s. Ainda não foi analisado."%[location_name,room_name])
		"talk":
			if rng.randi_range(1,100)<=55: _v9_recruit_room_survivor(location_name)
		"water":
			if inventory.water>0: inventory.water-=1; _v9_recruit_room_survivor(location_name); morale=mini(100,morale+3)
		"cut":
			if bool(tools.get("multimeter",false)) or int(skills.get("electricity",0))>=1: _v7_gain_skill("electricity",4)
			else: noise=mini(100,noise+12); life=maxi(1,life-2)
		"risk": noise=mini(100,noise+22); threat=mini(100,threat+4)
	_search_room(location_name,room_name)

func _v9_recruit_room_survivor(location_name:String) -> void:
	var names:=["MARA","IVO","SÔNIA","CAIO","RENATA","LEON","TALITA","BRUNO"]
	var roles:=["AGRICULTORA","ELETRICISTA","CAÇADOR","MECÂNICO","COZINHEIRA","CARPINTEIRO","SOCORRISTA","BATEDORA"]
	var name:=str(names[rng.randi_range(0,names.size()-1)])
	for p in survivors:
		if str(p.get("name",""))==name: name += " II"
	var person:=_v7_make_survivor(name,str(roles[rng.randi_range(0,roles.size()-1)]),rng.randi_range(38,68),"NÃO CONTA TUDO SOBRE O GRUPO ANTERIOR")
	if rng.randi_range(1,100)<=12: person.spy=true; person.loyalty=rng.randi_range(10,35)
	survivors.append(person); survivor_count+=1; _add_event("RESGATE","%s aceitou ir para o abrigo depois do encontro em %s."%[name,location_name])

func _v9_add_food(id:String, days_override:int=-1) -> void:
	if not V9_FOODS.has(id): return
	var cat:Dictionary=V9_FOODS[id]; var days:=int(cat.days) if days_override<0 else days_override
	detailed_food.append({"id":id,"days_left":days,"condition":rng.randi_range(72,100)})

func _v9_eat_food(index:int) -> void:
	if index<0 or index>=detailed_food.size(): _show_food_panel(); return
	var item:Dictionary=detailed_food[index]; var id:=str(item.get("id","")); var cat:Dictionary=V9_FOODS.get(id,{})
	if cat.is_empty(): detailed_food.remove_at(index); _show_food_panel(); return
	var spoiled:=int(item.get("days_left",1))<=0 or int(item.get("condition",100))<=20
	detailed_food.remove_at(index)
	if spoiled:
		stomach_sick=maxi(stomach_sick,rng.randi_range(1,3)); life=maxi(1,life-rng.randi_range(2,8)); morale=maxi(0,morale-2); _add_event("ALIMENTAÇÃO","%s estava estragado. Seu estômago virou."%str(cat.name))
	else:
		_v7_consume_calories(int(cat.kcal),int(cat.protein),int(cat.hydration),str(cat.name)); hunger=maxi(0,hunger-mini(55,int(cat.kcal)/22)); _add_event("ALIMENTAÇÃO","Você comeu %s."%str(cat.name))
	_update_all(); _save_game(); _show_food_panel()

func _v9_food_daily() -> void:
	for item in detailed_food:
		if int(item.get("days_left",999))<900: item.days_left=int(item.get("days_left",0))-1
		if int(item.get("days_left",0))<0: item.condition=maxi(0,int(item.get("condition",100))-25)
	if stomach_sick>0:
		stomach_sick-=1; energy=maxi(0,energy-12); thirst=mini(100,thirst+12); fatigue=mini(100,fatigue+8); _add_event("DOENÇA","A intoxicação alimentar deixou você fraco durante a noite.")

func _v9_room_loot_bonus(location_name:String, room_name:String) -> String:
	var found:Array[String]=[]; var upper:=room_name.to_upper()
	if location_name in ["SUPERMERCADO","SHOPPING","APARTAMENTOS","FAZENDA"]:
		var food_pool:=["feijao_lata","biscoito","atum_lata","vegetais_frescos","doce"]
		if rng.randi_range(1,100)<=55:
			var id:=str(food_pool[rng.randi_range(0,food_pool.size()-1)]); _v9_add_food(id); found.append(str(V9_FOODS[id].name))
	if location_name=="QUARENTENA" or upper.contains("MILITAR"):
		if rng.randi_range(1,100)<=42: _v9_add_food("refeicao_mre"); found.append("MRE militar")
	if upper.contains("AÇOUGUE") or location_name=="FAZENDA":
		if rng.randi_range(1,100)<=38: _v9_add_food("carne_fresca"); found.append("carne fresca")
	if upper.contains("ARQUIVO") or upper.contains("ESCRITÓRIO"):
		if rng.randi_range(1,100)<=28: lore_archive.append("Dia %d — anotações recuperadas de %s/%s."%[day,location_name,room_name]); found.append("documento")
	return "Achado específico: %s."%", ".join(found) if not found.is_empty() else ""

func _v9_show_work_roster() -> void:
	if survivors.is_empty(): _toast("Ainda não há ninguém para organizar."); return
	selected_survivor_index=clampi(selected_survivor_index,0,survivors.size()-1)
	var p:Dictionary=survivors[selected_survivor_index]
	if not bool(p.get("alive",true)):
		selected_survivor_index=(selected_survivor_index+1)%survivors.size(); _v9_show_work_roster(); return
	var pname:=str(p.name); var body:="[b]%s[/b] — %s\\n%s\\n\\nFunção atual: [b]%s[/b]\\n\\nVigia reduz ameaça. Horta acelera cultivo. Oficina recupera materiais. Manutenção segura estrutura e higiene. Caça pode trazer carne. Enfermaria ajuda feridos. Rádio melhora informação e sinal. Funções dão acesso diferente ao abrigo — e isso também importa se a pessoa não for confiável."%[pname,str(p.role),_v7_social_read(p),str(survivor_tasks.get(pname,"SEM FUNÇÃO"))]
	_v8_show_page("community","QUADRO DE TRABALHO","A COMUNIDADE SOBREVIVE QUANDO CADA PESSOA TEM RESPONSABILIDADE",body,[["VIGIA",func(): _v9_assign_task("VIGIA")],["HORTA",func(): _v9_assign_task("HORTA")],["OFICINA",func(): _v9_assign_task("OFICINA")],["MANUTENÇÃO",func(): _v9_assign_task("MANUTENÇÃO")],["CAÇA",func(): _v9_assign_task("CAÇA")],["ENFERMARIA",func(): _v9_assign_task("ENFERMARIA")],["RÁDIO",func(): _v9_assign_task("RÁDIO")],["PRÓXIMA PESSOA",Callable(self,"_v9_next_worker")],["COMUNIDADE",Callable(self,"_show_community_panel")]])

func _v9_next_worker() -> void:
	if survivors.is_empty(): return
	selected_survivor_index=(selected_survivor_index+1)%survivors.size(); _v9_show_work_roster()

func _v9_assign_task(task:String) -> void:
	if survivors.is_empty(): return
	var p:Dictionary=survivors[clampi(selected_survivor_index,0,survivors.size()-1)]; if not bool(p.get("alive",true)): return
	var pname:=str(p.name); survivor_tasks[pname]=task; p.trust=mini(100,int(p.trust)+1); _add_event("COMUNIDADE","%s ficou responsável por %s."%[pname,task.to_lower()]); _save_game(); _v9_show_work_roster()

func _v9_role_bonus(person:Dictionary, task:String) -> int:
	var role:=str(person.get("role","")); var bonus:=0
	if task=="VIGIA" and role in ["BATEDORA","CAÇADOR"]: bonus=8
	elif task=="HORTA" and role in ["AGRICULTORA","COZINHEIRA"]: bonus=10
	elif task=="OFICINA" and role in ["MECÂNICO","CARPINTEIRO","ELETRICISTA"]: bonus=10
	elif task=="MANUTENÇÃO" and role in ["MECÂNICO","CARPINTEIRO","ELETRICISTA","BOMBEIRO"]: bonus=12
	elif task=="CAÇA" and role in ["CAÇADOR","BATEDORA"]: bonus=12
	elif task=="ENFERMARIA" and role=="SOCORRISTA": bonus=14
	elif task=="RÁDIO" and role in ["ELETRICISTA","MECÂNICO"]: bonus=8
	return bonus

func _v9_survivor_work_daily() -> void:
	for p in survivors:
		if not bool(p.get("alive",true)): continue
		var pname:=str(p.name); var task:=str(survivor_tasks.get(pname,"")); if task=="": continue
		var bonus:=_v9_role_bonus(p,task); var effectiveness:=clampi(45+bonus+int(p.get("loyalty",40))/3-int(p.get("stress",20))/4,15,95)
		match task:
			"VIGIA": threat=maxi(0,threat-(2+bonus/4)); if rng.randi_range(1,100)<=effectiveness: _add_event("VIGIA","%s manteve movimento suspeito longe do abrigo."%pname)
			"HORTA":
				if int(farm.planted)>0: farm.growth=mini(100,int(farm.growth)+4+bonus/3)
			"OFICINA":
				if rng.randi_range(1,100)<=effectiveness: inventory.scrap+=1; if bonus>=8 and rng.randi_range(1,100)<=35: materials.mechanical+=1
			"MANUTENÇÃO":
				maintenance_debt=maxi(0,maintenance_debt-(3+int(bonus/4))); shelter_cleanliness=mini(100,shelter_cleanliness+2+int(bonus/5))
				if shelter_integrity<75 and rng.randi_range(1,100)<=effectiveness: shelter_integrity=mini(100,shelter_integrity+1+int(bonus/6))
				if roof_leak and bonus>=8 and int(materials.get("nails",0))>0 and rng.randi_range(1,100)<=35: materials.nails-=1; roof_leak=false; shelter_integrity=mini(100,shelter_integrity+4); _add_event("MANUTENÇÃO","%s vedou uma infiltração usando material do estoque."%pname)
			"CAÇA":
				if wildlife_density>0 and rng.randi_range(1,100)<=effectiveness-15: materials.raw_meat+=1; wildlife_density=maxi(0,wildlife_density-1); _add_event("CAÇA","%s voltou com carne."%pname)
				elif rng.randi_range(1,100)<=12: p.stress=mini(100,int(p.stress)+8); _add_event("CAÇA","%s voltou sem nada e bastante abalado."%pname)
			"ENFERMARIA":
				if life<100: life=mini(100,life+2+bonus/5)
				if injuries.bleeding>0 and rng.randi_range(1,100)<=effectiveness: injuries.bleeding=maxi(0,int(injuries.bleeding)-1)
			"RÁDIO": radio_signal=mini(100,radio_signal+2+bonus/4); if rng.randi_range(1,100)<=20+bonus: _v7_generate_world_news()
		# Access creates opportunity for espionage.
		if bool(p.get("spy",false)) and task in ["RÁDIO","VIGIA","MANUTENÇÃO"] and int(p.get("loyalty",40))<45 and rng.randi_range(1,100)<=18:
			threat=mini(100,threat+8); var clue:="Uma transmissão curta saiu do abrigo durante o turno de %s."%pname if task=="RÁDIO" else "Marcas perto da cerca não combinam com uma ronda normal de %s."%pname; community_clues.append(clue); _add_event("SUSPEITA",clue)

func _v9_social_incident_tick() -> void:
	if survivors.is_empty(): return
	for p in survivors:
		if not bool(p.get("alive",true)): continue
		var pname:=str(p.name); var envy:=int(p.get("envy",0)); var loyalty:=int(p.get("loyalty",50)); var pstress:=int(p.get("stress",20))
		if envy>65 and loyalty<38 and rng.randi_range(1,100)<=10:
			var stolen:=mini(int(inventory.food),rng.randi_range(1,2)); inventory.food-=stolen; community_supplies_stolen+=stolen; var clue:="Comida sumiu do estoque depois do turno de %s."%pname; community_clues.append(clue); p.envy=maxi(0,envy-8); community_tension=mini(100,community_tension+5); _add_event("COMUNIDADE",clue)
		if bool(p.get("spy",false)) and loyalty<28 and int(p.get("trust",40))<40 and community_clues.size()>=2: event_flags["v7_social_crisis"]=pname
		if pstress>85 and rng.randi_range(1,100)<=8: community_tension=mini(100,community_tension+7); _add_event("COMUNIDADE","%s perdeu a calma durante uma discussão no abrigo."%pname)
	while community_clues.size()>10: community_clues.pop_front()

func _v9_world_event_tick() -> void:
	for ev in V9_GLOBAL_EVENTS:
		var id:=str(ev.id)
		if day<int(ev.day) or bool(global_events_active.get(id,false)): continue
		global_events_active[id]=true; world_news_seen.append("[EMERGÊNCIA] %s — %s"%[str(ev.title),str(ev.text)]); lore_archive.append("Dia %d — %s"%[day,str(ev.text)])
		match str(ev.effect):
			"WATER": world_state.water_safety=maxi(10,int(world_state.water_safety)-25); thirst=mini(100,thirst+3)
			"POWER": world_state.power_grid=maxi(0,int(world_state.power_grid)-28); radio_signal=maxi(0,radio_signal-8)
			"REFUGEES": world_state.refugee_pressure=mini(100,int(world_state.refugee_pressure)+45); community_tension=mini(100,community_tension+4)
			"MUTATION": mutation_pressure=mini(100,mutation_pressure+12)
			"RADIO": world_state.radio_blackout=1; radio_signal=maxi(0,radio_signal-20)
		_add_event("MUNDO",str(ev.title)+": "+str(ev.text))
		break

# -----------------------------------------------------------------------------
# AFTERFALL V13 — EVENTOS ENCADEADOS, ABRIGO VIVO E CONSEQUÊNCIAS SOCIAIS
# -----------------------------------------------------------------------------
func _v13_reset_systems() -> void:
	v13_pending_event={}; v13_event_memory=[]; v13_story_flags={}; v13_last_event_day=0; v13_event_person=""
	v13_expedition_start_day=day; v13_expedition_start_minute=_v12_clock_minutes(); v13_expedition_start_thirst=thirst; v13_expedition_start_fatigue=fatigue; v13_expedition_start_weight=_total_weight(); v13_attention_scans={}; v13_delayed_storylets=[]; v13_last_trip_summary=""
	v14_disease_days={}; v14_weather_history=[]; v14_environment_flags={}

func _v13_queue_event(id:String, person:String="") -> void:
	if not v13_pending_event.is_empty(): return
	v13_event_person=person
	var title:="ALGO ACONTECEU NO ABRIGO"; var text:="A rotina foi interrompida."
	match id:
		"storm": title="O TELHADO NÃO VAI AGUENTAR"; text="O vento empurra a chuva por uma fresta nova. Uma parte da cobertura começou a bater contra as vigas. Ignorar economiza material, mas o próximo temporal pode entrar no abrigo."
		"cold": title="A NOITE ESFRIOU DEMAIS"; text="A temperatura caiu e as paredes estão úmidas. Ninguém está descansando direito. O grupo olha para o estoque de madeira antes de olhar para você."
		"suspicion": title="UMA TRANSMISSÃO QUE NINGUÉM ASSUME"; text="O rádio registrou uma transmissão curta fora do horário de uso. %s estava perto do equipamento. Isso não prova nada — ainda."%person
		"argument": title="COMIDA, MEDO E UMA DISCUSSÃO"; text="A divisão de suprimentos virou discussão. %s elevou a voz e o restante do abrigo ficou em silêncio. O problema não é só a comida; é quem acredita que merece decidir."%person
		"animal": title="UM ANIMAL NÃO ESTÁ BEM"; text="Um dos animais passou o dia sem comer e está isolado dos outros. Pode ser estresse, infecção ou algo que se espalhe para a criação."
		"visitor": title="TRÊS BATIDAS NO PORTÃO"; text="Alguém bateu três vezes e depois recuou. Uma voz diz estar sozinho e oferece informação em troca de água. Do lado de dentro ninguém concorda sobre abrir."
		"leak": title="A ÁGUA ESTÁ ENTRANDO"; text="A infiltração piorou. Gotas já caem perto das caixas de suprimentos. Você pode reparar agora, mover tudo para um canto seco ou arriscar deixar para amanhã."
		"pests": title="ALGO ESTÁ COMENDO O ESTOQUE"; text="Embalagens rasgadas, fezes pequenas e barulho atrás das caixas. O abrigo ficou úmido e sujo o bastante para atrair pragas."
	v13_pending_event={"id":id,"title":title,"text":text,"day":day,"person":person}; v13_last_event_day=day
	_add_event("ABRIGO",title)

func _v13_daily_event_tick() -> void:
	if day<=v13_last_event_day or not v13_pending_event.is_empty(): return
	var candidates:Array[String]=[]
	if weather_severity>=3: candidates.append("storm")
	if temperature<=7 or (season=="INVERNO" and temperature<=10): candidates.append("cold")
	if int(animals.get("chickens",0))+int(animals.get("rabbits",0))+int(animals.get("goats",0))>0 and int(animals.get("health",100))<70: candidates.append("animal")
	var person:=""
	if not survivors.is_empty():
		var living:Array=[]
		for p in survivors: if bool(p.get("alive",true)): living.append(p)
		if not living.is_empty(): person=str(living[rng.randi_range(0,living.size()-1)].get("name",""))
		if community_tension>=38: candidates.append("argument")
		if not community_clues.is_empty(): candidates.append("suspicion")
	if roof_leak and weather_severity>0: candidates.append("leak")
	if shelter_cleanliness<=35: candidates.append("pests")
	if rng.randi_range(1,100)<=28: candidates.append("visitor")
	if candidates.is_empty(): return
	_v13_queue_event(str(candidates[rng.randi_range(0,candidates.size()-1)]),person)

func _v13_show_pending_event() -> void:
	if v13_pending_event.is_empty(): return
	var id:=str(v13_pending_event.get("id","")); var acts:Array=[]
	match id:
		"storm": acts=[["REPARAR AGORA • 50 MIN",Callable(self,"_v13_storm_repair")],["APARAR ÁGUA • 20 MIN",Callable(self,"_v13_storm_collect")],["IGNORAR",Callable(self,"_v13_storm_ignore")]]
		"cold": acts=[["QUEIMAR MADEIRA • 30 MIN",Callable(self,"_v13_cold_heat")],["DIVIDIR COBERTORES",Callable(self,"_v13_cold_blankets")],["AGUENTAR A NOITE",Callable(self,"_v13_cold_ignore")]]
		"suspicion": acts=[["INVESTIGAR • 45 MIN",Callable(self,"_v13_suspicion_investigate")],["CONVERSAR SEM ACUSAR • 25 MIN",Callable(self,"_v13_suspicion_talk")],["ACUSAR AGORA",Callable(self,"_v13_suspicion_accuse")]]
		"argument": acts=[["MEDIAR • 30 MIN",Callable(self,"_v13_argument_mediate")],["IMPOR RACIONAMENTO",Callable(self,"_v13_argument_ration")],["DEIXAR QUE RESOLVAM",Callable(self,"_v13_argument_ignore")]]
		"animal": acts=[["USAR REMÉDIO • 25 MIN",Callable(self,"_v13_animal_med")],["ISOLAR O ANIMAL • 35 MIN",Callable(self,"_v13_animal_isolate")],["OBSERVAR ATÉ AMANHÃ",Callable(self,"_v13_animal_ignore")]]
		"leak": acts=[["REPARO DE EMERGÊNCIA • 35 MIN",Callable(self,"_v16_leak_repair")],["MOVER SUPRIMENTOS • 25 MIN",Callable(self,"_v16_leak_move_supplies")],["DEIXAR PARA AMANHÃ",Callable(self,"_v16_leak_ignore")]]
		"pests": acts=[["ARMAR RATOEIRAS • 30 MIN",Callable(self,"_v16_pests_trap")],["LIMPEZA PESADA • 55 MIN",Callable(self,"_v16_pests_clean")],["IGNORAR",Callable(self,"_v16_pests_ignore")]]
		_: acts=[["OBSERVAR PRIMEIRO • 10 MIN",Callable(self,"_v13_visitor_observe")],["OFERECER ÁGUA",Callable(self,"_v13_visitor_help")],["MANDAR EMBORA",Callable(self,"_v13_visitor_refuse")]]
	_v8_show_page("community",str(v13_pending_event.title),"EVENTOS NÃO SÃO TEXTO DECORATIVO: ELES MUDAM TEMPO, RECURSOS E RELAÇÕES",str(v13_pending_event.text),acts)
	_v9_set_immersive_page(true); v8_page_bg.texture=SHELTER_TEX; v8_page_shade.color=Color(0.01,0.01,0.008,0.62)
	if v8_page_close!=null: v8_page_close.visible=false
	var pname:=str(v13_pending_event.get("person","")); var meta:=_v10_character_by_name(pname)
	if pname!="" and str(meta.get("id",""))!="" and v8_page_entity!=null:
		v8_page_entity.texture=_v12_portrait_texture(str(meta.id)); v8_page_entity.visible=v8_page_entity.texture!=null; v8_page_entity.position=Vector2(600,205); v8_page_entity.size=Vector2(320,430); v8_page_entity.move_to_front(); v8_page_body.size=Vector2(540,566)

func _v13_finish_event(result:String) -> void:
	if v13_pending_event.is_empty(): return
	var record:={"day":day,"time":_v12_clock_text(),"id":str(v13_pending_event.get("id","")),"person":str(v13_pending_event.get("person","")),"result":result}
	v13_event_memory.append(record); while v13_event_memory.size()>50: v13_event_memory.pop_front()
	community_memories.append({"day":day,"type":"event","text":result}); while community_memories.size()>40: community_memories.pop_front()
	_add_event("CONSEQUÊNCIA",result); v13_pending_event={}; v13_event_person=""; _save_game(); _show_shelter(); _toast(result)

func _v13_storm_repair() -> void:
	if int(materials.get("wood",0))+int(inventory.get("scrap",0))<=0: _toast("Sem madeira ou sucata para fazer o reparo."); return
	if int(materials.get("wood",0))>0: materials.wood-=1
	else: inventory.scrap-=1
	_v12_advance_time(50,"reparar cobertura durante temporal",0.35,false); shelter_comfort=mini(100,shelter_comfort+3); shelter_integrity=mini(100,shelter_integrity+14); maintenance_debt=maxi(0,maintenance_debt-10); roof_leak=false; threat=maxi(0,threat-2); _v13_finish_event("A cobertura foi presa antes que o temporal abrisse outra fresta.")
func _v13_storm_collect() -> void:
	_v12_advance_time(20,"aparar chuva",0.10,false); inventory.dirty_water+=2; shelter_comfort=maxi(0,shelter_comfort-1); roof_leak=true; maintenance_debt=mini(100,maintenance_debt+5); _v13_finish_event("Você deixou o reparo para depois e aproveitou a água. +2 água não tratada.")
func _v13_storm_ignore() -> void:
	shelter_comfort=maxi(0,shelter_comfort-4); shelter_integrity=maxi(0,shelter_integrity-8); shelter_cleanliness=maxi(0,shelter_cleanliness-5); roof_leak=true; maintenance_debt=mini(100,maintenance_debt+10); morale=maxi(0,morale-2); _v13_finish_event("A noite ficou mais úmida e desconfortável. O problema no telhado continua.")
func _v13_cold_heat() -> void:
	if int(materials.get("wood",0))<=0: _toast("Sem madeira seca."); return
	materials.wood-=1; _v12_advance_time(30,"aquecer o abrigo",0.05,false); shelter_comfort=mini(100,shelter_comfort+3); shelter_heat=mini(100,shelter_heat+28); morale=mini(100,morale+2); _v13_finish_event("O fogo ficou aceso por horas. A comunidade finalmente descansou sem tremer.")
func _v13_cold_blankets() -> void:
	_v12_advance_time(12,"redistribuir cobertores",0.01,false); community_cohesion=mini(100,community_cohesion+2); _v13_finish_event("Vocês juntaram cobertores e aproximaram as camas. Não ficou confortável, mas ninguém passou a noite sozinho no frio.")
func _v13_cold_ignore() -> void:
	fatigue=mini(100,fatigue+8); morale=maxi(0,morale-3); if rng.randi_range(1,100)<=28: diseases["RESFRIADO"]=maxi(1,int(diseases.get("RESFRIADO",0))); _v13_finish_event("A madrugada custou descanso e calor. Alguns acordaram tossindo.")
func _v13_find_survivor(name_value:String) -> Dictionary:
	for p in survivors: if str(p.get("name",""))==name_value and bool(p.get("alive",true)): return p
	return {}
func _v13_suspicion_investigate() -> void:
	_v12_advance_time(45,"investigar transmissão clandestina",0.02,false); var p:=_v13_find_survivor(str(v13_pending_event.get("person",""))); var proof:=not p.is_empty() and bool(p.get("spy",false))
	if proof: p.secret_known=true; p.trust=maxi(0,int(p.get("trust",45))-5); v13_story_flags["spy_exposed_"+str(p.name)]=true; _v13_finish_event("Você encontrou evidência de contato externo ligado a %s. Agora existe prova, não apenas suspeita."%str(p.name))
	else: community_tension=maxi(0,community_tension-3); _v13_finish_event("Você verificou o rádio, horários e pegadas. Não encontrou prova suficiente para acusar ninguém.")
func _v13_suspicion_talk() -> void:
	_v12_advance_time(25,"conversa difícil",0.01,false); var p:=_v13_find_survivor(str(v13_pending_event.get("person",""))); if not p.is_empty(): p.trust=mini(100,int(p.get("trust",45))+2); p.stress=maxi(0,int(p.get("stress",20))-2)
	community_tension=maxi(0,community_tension-2); _v13_finish_event("Você fez perguntas sem transformar o abrigo num interrogatório. A dúvida continua, mas a tensão caiu.")
func _v13_suspicion_accuse() -> void:
	var p:=_v13_find_survivor(str(v13_pending_event.get("person",""))); if not p.is_empty(): p.trust=maxi(0,int(p.get("trust",45))-12); p.loyalty=maxi(0,int(p.get("loyalty",45))-6); p.stress=mini(100,int(p.get("stress",20))+10)
	community_tension=mini(100,community_tension+9); _v13_finish_event("A acusação dividiu o abrigo. Mesmo quem desconfiava não gostou de como aconteceu.")
func _v13_argument_mediate() -> void:
	_v12_advance_time(30,"mediar conflito",0.01,false); community_tension=maxi(0,community_tension-8); community_cohesion=mini(100,community_cohesion+4); _v13_finish_event("A conversa não resolveu tudo, mas ninguém saiu da mesa acreditando que precisava escolher um lado.")
func _v13_argument_ration() -> void:
	community_tension=mini(100,community_tension+2); morale=maxi(0,morale-1); v13_story_flags["strict_rationing"]=true; _v13_finish_event("Você impôs porções iguais e encerrou a discussão. Funcionou — mas algumas pessoas guardaram o ressentimento.")
func _v13_argument_ignore() -> void:
	community_tension=mini(100,community_tension+7); community_cohesion=maxi(0,community_cohesion-3); _v13_finish_event("Você deixou a discussão morrer sozinha. Ela morreu na sala, não na cabeça das pessoas.")
func _v13_animal_med() -> void:
	if inventory.med<=0: _toast("Sem remédio disponível."); return
	inventory.med-=1; _v12_advance_time(25,"cuidar da criação",0.05,false); animals.health=mini(100,int(animals.health)+25); _v13_finish_event("O animal respondeu ao tratamento. Você evitou que o problema chegasse ao restante da criação.")
func _v13_animal_isolate() -> void:
	_v12_advance_time(35,"isolar animal doente",0.12,false); animals.health=mini(100,int(animals.health)+8); _v13_finish_event("Você improvisou um cercado separado. Dá trabalho, mas agora é possível observar sem arriscar toda a criação.")
func _v13_animal_ignore() -> void:
	animals.health=maxi(0,int(animals.health)-12); _v13_finish_event("Você decidiu esperar. O animal piorou durante a noite e o resto da criação ficou inquieto.")
func _v13_visitor_observe() -> void:
	_v12_advance_time(10,"observar visitante pelo abrigo",0.01,false); _v13_finish_event("Você observou antes de abrir. A pessoa não parecia seguida, mas carregava marcas de uma comunidade desconhecida.")
func _v13_visitor_help() -> void:
	if inventory.water<=0: _toast("Você não tem água limpa para oferecer."); return
	inventory.water-=1; _v12_advance_time(8,"ajudar visitante",0.01,false); morale=mini(100,morale+2); _v12_daily_add("help",1); _v13_finish_event("Você passou água pelo portão. Em troca recebeu a localização aproximada de uma rua menos infestada.")
func _v13_visitor_refuse() -> void:
	threat=maxi(0,threat-1); _v13_finish_event("Você não abriu. Os passos se afastaram na chuva. Ninguém sabe se foi prudência ou uma oportunidade perdida.")

func _v13_attention_key() -> String:
	return "%d|%s|%d|%s" % [day, v8_travel_route, v8_travel_segment, v8_travel_event]

func _v13_attention_scan() -> void:
	if not v8_travel_active or v8_travel_event == "":
		_toast("Não há uma situação concreta para analisar agora.")
		return
	var key := _v13_attention_key()
	var first := not bool(v13_attention_scans.get(key, false))
	if first:
		v13_attention_scans[key] = true
		_v12_advance_time(3, "observar o ambiente", 0.01, true)
		_v12_daily_add("attention", 1)
	var survival := int(skills.get("survival", 0))
	var mechanics := int(skills.get("mechanics", 0))
	var medicine := int(skills.get("medicine", 0))
	var hunting := int(skills.get("hunting", 0))
	var electrical := int(skills.get("electrical", 0))
	var clues: Array[String] = []
	match v8_travel_event:
		"lone_zombie":
			clues.append("O infectado ainda não reagiu à sua presença.")
			if survival >= 2: clues.append("A chuva e o vento cobrem passos leves; o lado dos carros oferece melhor cobertura.")
			if medicine >= 2: clues.append("A rigidez dos movimentos indica um Errante recente, sem mutação evidente.")
		"abandoned_car":
			clues.append("Há lama fresca perto da porta do motorista.")
			if mechanics >= 1: clues.append("O capô não está deformado. Bateria, alternador ou combustível ainda podem ser aproveitados.")
			if survival >= 2: clues.append("As marcas de sola vão embora do carro; não parecem pegadas de infectado.")
		"cry_help":
			clues.append("A voz vem sempre do mesmo ponto do prédio.")
			if survival >= 2: clues.append("Se for gravação, a cadência tende a se repetir. Esperar revela mais do que entrar correndo.")
		"blood_trail":
			clues.append("O sangue ainda tem brilho apesar da chuva.")
			if medicine >= 2: clues.append("Pelo volume, a pessoa perdeu muito sangue e provavelmente não foi longe.")
			if hunting >= 2: clues.append("Há arrasto de uma perna e marcas indo para o beco, sem sinal de retorno.")
		"animal_tracks":
			clues.append("Pegadas pequenas atravessam a lama.")
			if hunting >= 2: clues.append("São rastros recentes. Seguir contra o vento reduz a chance de ser percebido.")
		"transformer":
			clues.append("O transformador estala em intervalos irregulares.")
			if electrical >= 2: clues.append("Ainda existe tensão. A caixa lateral pode ter componentes úteis, mas é perigosa molhada.")
		"wounded_stranger", "sick_survivor":
			clues.append("A pessoa está consciente, mas debilitada.")
			if medicine >= 2: clues.append("Sem padrão típico de mordida. Desidratação e exposição parecem mais urgentes.")
		"stray_dog":
			clues.append("O cão mantém distância, mas não mostra os dentes.")
			if hunting >= 1: clues.append("A pata está machucada, porém suporta peso. Comida pode fazê-lo confiar em você.")
		"dead_courier":
			clues.append("A bolsa foi protegida sob o corpo de propósito.")
			if survival >= 2: clues.append("Há pegadas novas ao redor. Alguém passou aqui depois da morte.")
		"distant_generator":
			clues.append("O motor falha a cada poucos segundos.")
			if mechanics >= 2: clues.append("Pelo ritmo, trabalha sem carga constante — provavelmente alimenta só parte de um prédio.")
			if electrical >= 2: clues.append("Energia ainda ativa pode significar rádio, refrigeração ou iluminação.")
		"roadblock":
			clues.append("A abertura tem metal exposto e pouco espaço para a mochila.")
			if survival >= 2: clues.append("Tirar a mochila antes faz menos barulho que escalar e reduz o risco de ficar preso.")
		_:
			clues.append("Você procura movimento, som, cheiro e rotas de saída antes de agir.")
	if _v12_is_night(): clues.append("A escuridão reduz sua leitura à distância, mas também esconde sua silhueta.")
	if wind_speed >= 28: clues.append("Rajadas mascaram ruídos curtos e tornam objetos soltos imprevisíveis.")
	if visibility < 55: clues.append("A visibilidade baixa torna qualquer leitura distante menos confiável.")
	var perception_penalty := _v13_condition_penalty("perception")
	if perception_penalty >= 8:
		clues.append("Seu estado físico está prejudicando concentração e percepção. Algumas conclusões podem estar incompletas.")
	_open_modal("MODO DE ATENÇÃO", "[b]O QUE VOCÊ PERCEBE[/b]\n\n• " + "\n• ".join(clues) + "\n\n[i]Conhecimento, profissão e seu estado físico mudam o que o personagem consegue interpretar. Observar também consome tempo.[/i]", [["VOLTAR À SITUAÇÃO", Callable(self, "_close_modal")]])

func _v13_schedule_delayed(kind: String, due_day: int, data: Dictionary = {}) -> void:
	for e in v13_delayed_storylets:
		if str(e.get("kind", "")) == kind and not bool(e.get("resolved", false)):
			return
	v13_delayed_storylets.append({"kind":kind, "due_day":maxi(day + 1, due_day), "data":data.duplicate(true), "resolved":false})

func _v13_process_delayed_storylets() -> void:
	for i in range(v13_delayed_storylets.size()):
		var e: Dictionary = v13_delayed_storylets[i]
		if bool(e.get("resolved", false)) or day < int(e.get("due_day", 99999)):
			continue
		var kind := str(e.get("kind", ""))
		var data: Dictionary = e.get("data", {})
		match kind:
			"sick_stranger":
				if rng.randi_range(1, 100) <= 72:
					inventory.food += 1
					profile_tokens += 2
					_add_event("PORTÃO", "O desconhecido que você ajudou voltou. Deixou comida e uma anotação de rota antes de seguir viagem.")
					community_memories.append({"day":day, "type":"storylet", "text":"Alguém ajudado na rua voltou para agradecer."})
				else:
					_add_event("RÁDIO", "Uma voz fraca agradeceu pelo remédio recebido dias atrás. A transmissão caiu antes de dizer onde estava.")
			"ignored_cry":
				if rng.randi_range(1, 100) <= 50:
					morale = maxi(0, morale - 2)
					_add_event("RUA", "Uma patrulha encontrou um corpo no setor onde você ouviu o pedido de ajuda. Não há como saber se era a mesma pessoa.")
				else:
					_add_event("RÁDIO", "Uma transmissão menciona alguém resgatado no mesmo setor onde você deixou uma voz para trás. Talvez outra pessoa tenha chegado a tempo.")
			"blood_hideout":
				var place := str(data.get("place", "um esconderijo"))
				missions.append({"id":"v13_hideout_%d" % day, "title":"QUEM VIVEU AQUI?", "desc":"Volte a %s e procure uma pista sobre o rastro de sangue." % place, "target":1, "current":0, "reward":"Documento • suprimentos", "done":false})
				_add_event("DIÁRIO", "O ponto marcado pelo rastro de sangue continua incomodando você. Talvez valha voltar.")
			"storm_signal":
				_add_mission("v14_storm_signal","COORDENADAS NA TEMPESTADE","Investigue a origem das coordenadas captadas durante o temporal. Destino provável: Estação.",1,"Arquivo raro • frequência desconhecida")
				_add_event("RÁDIO","A gravação da tempestade foi limpa. As coordenadas apontam para perto da Estação.")
			"migration_return":
				wildlife_density=mini(100,wildlife_density+8); _add_event("FAUNA","A rota marcada confirmou uma passagem sazonal de animais. A densidade de caça aumentou temporariamente.")
			"window_contact":
				factions["VIGÍLIA"].rep = int(factions["VIGÍLIA"].rep) + 1
				_add_event("RÁDIO", "Uma voz curta diz: 'vimos você respeitar nosso território. Rua leste está limpa hoje'. A Vigília parece lembrar.")
			"mold_problem":
				shelter_cleanliness=maxi(0,shelter_cleanliness-12); diseases["IRRITAÇÃO RESPIRATÓRIA"]=maxi(1,int(diseases.get("IRRITAÇÃO RESPIRATÓRIA",0))); _add_event("ABRIGO","A parede que ficou molhada criou mofo. O ar está pesado e a tosse começou.")
		e["resolved"] = true
		v13_delayed_storylets[i] = e

func _v13_feed_stray_dog() -> void:
	if inventory.food <= 0:
		_toast("Você não tem comida para oferecer.")
		return
	inventory.food -= 1
	_v12_advance_time(8, "ganhar confiança de um animal", 0.01, true)
	if int(animals.get("dog", 0)) <= 0 and rng.randi_range(1, 100) <= 65:
		animals.dog = 1
		morale = mini(100, morale + 5)
		_add_event("COMPANHEIRO", "O cão seguiu você à distância e acabou escolhendo o abrigo.")
		community_memories.append({"day":day, "type":"animal", "text":"Um cachorro passou a viver conosco."})
		_v8_render_street("O cão come sem tirar os olhos de você. Quando você volta a andar, ele mantém alguns metros de distância — mas não vai embora.", [["CONTINUAR", Callable(self, "_v8_next_segment")]])
	else:
		morale = mini(100, morale + 1)
		_v8_render_street("Ele aceita a comida, mas continua desconfiado. Depois desaparece entre dois carros.", [["CONTINUAR", Callable(self, "_v8_next_segment")]])

func _v13_observe_stray_dog() -> void:
	_v12_advance_time(4, "observar o cão", 0.0, true)
	_v7_gain_skill("hunting", 1)
	_v8_render_street("A coleira está rompida e a pata dianteira tem um corte antigo. Ele parece acostumado a pessoas, não a viver sozinho.", [["OFERECER COMIDA", Callable(self, "_v13_feed_stray_dog")], ["SEGUIR", Callable(self, "_v8_next_segment")]])

func _v13_search_courier() -> void:
	_v12_advance_time(7, "revistar mensageiro", 0.02, true)
	var careful := int(skills.get("medicine", 0)) + int(skills.get("survival", 0))
	if careful < 2 and rng.randi_range(1, 100) <= 22:
		hygiene = maxi(0, hygiene - 12)
		injuries.arm = mini(100, int(injuries.arm) + 3)
	var id := "ROTA DO MENSAGEIRO %d" % (v8_discovered_micro_locations.size() + 1)
	v8_discovered_micro_locations.append(id)
	inventory.bandage += 1
	lore_archive.append("Bilhete do mensageiro: não use a avenida depois do toque da sirene.")
	_add_event("DESCOBERTA", "A bolsa do mensageiro continha um curativo e anotações de rota.")
	_v8_render_street("Dentro da bolsa há um curativo seco, um mapa dobrado e uma frase circulada várias vezes: 'não use a avenida depois do toque da sirene'.", [["CONTINUAR", Callable(self, "_v8_next_segment")]])

func _v13_mark_courier() -> void:
	_v12_advance_time(2, "marcar localização", 0.0, true)
	_add_event("MAPA", "Você marcou o corpo do mensageiro para voltar melhor preparado.")
	_v8_next_segment()

func _v13_investigate_generator() -> void:
	_v12_advance_time(18, "investigar gerador", 0.12, true)
	var score := 30 + int(skills.get("mechanics", 0)) * 12 + int(skills.get("electrical", 0)) * 10
	if rng.randi_range(1, 100) <= score:
		inventory.battery += 1
		materials.wire += 1
		_v7_gain_skill("electrical", 3)
		_add_event("ENERGIA", "Você aproveitou bateria e fiação de um gerador improvisado.")
		_v8_render_street("A casa foi abandonada às pressas. O gerador ainda tosse no quintal. Você recupera uma bateria e fio útil.", [["CONTINUAR", Callable(self, "_v8_next_segment")]])
	else:
		noise = mini(100, noise + 10)
		_v8_render_street("Você chega perto demais e o motor engasga com um estampido. Não consegue aproveitar nada e o som viaja pela rua.", [["SAIR", Callable(self, "_v8_next_segment")]])

func _v13_mark_generator() -> void:
	var id := "GERADOR POSSÍVEL %d" % (v8_discovered_micro_locations.size() + 1)
	v8_discovered_micro_locations.append(id)
	_add_event("MAPA", "Você marcou a origem de um gerador ainda funcionando.")
	_v8_next_segment()

func _v13_squeeze_roadblock() -> void:
	_v12_advance_time(7, "passar pela barricada", 0.15, true)
	var score := 55 + int(fitness / 4) - maxi(0, _total_weight() - 10) * 2
	if rng.randi_range(1, 100) <= score:
		_v8_render_street("Você tira a mochila, passa de lado pelo metal e recupera o equipamento sem chamar atenção.", [["CONTINUAR", Callable(self, "_v8_next_segment")]])
	else:
		injuries.arm = mini(100, int(injuries.arm) + 5)
		noise = mini(100, noise + 7)
		_v8_render_street("Uma alça prende no metal. Você se solta, mas raspa o braço e derruba uma placa no asfalto.", [["CONTINUAR", Callable(self, "_v8_next_segment")]])

func _v13_climb_roadblock() -> void:
	_v12_advance_time(9, "escalar barricada", 0.35, true)
	fatigue = mini(100, fatigue + 4)
	if rng.randi_range(1, 100) > 55 + int(fitness / 3):
		life = maxi(1, life - 4)
		injuries.leg = mini(100, int(injuries.leg) + 4)
	_v8_render_street("Você passa por cima da barricada. É mais rápido que o desvio, mas cobra das pernas e faz algum barulho.", [["CONTINUAR", Callable(self, "_v8_next_segment")]])

func _v13_reduce_disease(id:String, amount:int=1) -> void:
	if not diseases.has(id): return
	var new_sev := int(diseases.get(id,1)) - amount
	if new_sev <= 0: diseases.erase(id)
	else: diseases[id] = new_sev

func _v13_control_cough() -> void:
	_v12_advance_time(8,"controlar a tosse",0.0,true); stress=mini(100,stress+1); _v8_render_street("Você encosta numa parede, respira pelo nariz e espera a crise passar. Perde tempo, mas preserva o silêncio.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_medicine_cough() -> void:
	if int(inventory.get("med",0))<=0: _toast("Você não tem medicamento adequado."); return
	inventory.med-=1; _v12_advance_time(5,"tratar sintomas",0.0,true); _v13_reduce_disease("RESFRIADO",1); _v8_render_street("O remédio não cura instantaneamente, mas controla os sintomas o bastante para continuar sem tossir a cada esquina.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_push_cough() -> void:
	noise=mini(100,noise+13); threat=mini(100,threat+2); fatigue=mini(100,fatigue+3); _v12_advance_time(2,"seguir tossindo",0.08,true); _v8_render_street("Você força o passo. A tosse ecoa entre as fachadas. Nada aparece imediatamente, mas a rua deixou de parecer vazia.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_drink_dizzy() -> void:
	if int(inventory.get("water",0))<=0: _toast("Sua garrafa está vazia."); return
	inventory.water-=1; thirst=maxi(0,thirst-30); _v12_advance_time(5,"hidratar e recuperar o equilíbrio",0.0,true); _v12_apply_condition_pressure(); _v8_render_street("Você bebe devagar e espera a visão estabilizar. A água custa recurso, mas devolve margem para chegar vivo.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_rest_dizzy() -> void:
	_v12_advance_time(12,"descansar da tontura",0.0,true); fatigue=maxi(0,fatigue-5); stress=maxi(0,stress-2); _v8_render_street("Você se senta fora da linha da rua e espera o coração desacelerar. Está um pouco melhor, mas o relógio não parou.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_push_dizzy() -> void:
	_v12_advance_time(3,"forçar o passo",0.45,true); life=maxi(1,life-4); fatigue=mini(100,fatigue+7); _v8_render_street("Você continua. Por alguns segundos precisa apoiar a mão num carro para não cair. Ganhou minutos e perdeu condição.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_treat_fever() -> void:
	if int(inventory.get("antibiotic",0))>0:
		inventory.antibiotic-=1; _v13_reduce_disease("INFECÇÃO DE FERIDA",1); _v12_advance_time(15,"limpar ferida e usar antibiótico",0.0,true); hygiene=mini(100,hygiene+5)
	elif int(inventory.get("med",0))>0:
		inventory.med-=1; _v12_advance_time(12,"limpar e proteger a ferida",0.0,true); life=mini(100,life+4)
	else:
		_toast("Sem antibiótico ou material médico."); return
	_v8_render_street("Você trata a ferida no melhor abrigo que encontra. É improvisado, mas melhor do que fingir que a febre não existe.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_rest_fever() -> void:
	_v12_advance_time(20,"observar a febre",0.0,true); fatigue=maxi(0,fatigue-4); _v8_render_street("Você para, verifica o ferimento e recupera um pouco do fôlego. A infecção continua ali; pelo menos agora sabe que não está melhorando sozinha.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_push_fever() -> void:
	_v12_advance_time(4,"ignorar a febre",0.30,true); fatigue=mini(100,fatigue+6); stress=mini(100,stress+3); _v8_render_street("Você aperta a bandagem e segue. Cada passo faz o ferimento pulsar. A decisão economizou tempo, não saúde.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v13_finish_return_trip() -> void:
	var end_abs := (day - 1) * 1440 + _v12_clock_minutes()
	var start_abs := (v13_expedition_start_day - 1) * 1440 + v13_expedition_start_minute
	var elapsed := maxi(0, end_abs - start_abs)
	var night_return := _v12_is_night()
	var thirst_delta := maxi(0, thirst - v13_expedition_start_thirst)
	var fatigue_delta := maxi(0, fatigue - v13_expedition_start_fatigue)
	var lines: Array[String] = []
	lines.append("Tempo fora: %dh%02d" % [int(elapsed / 60), elapsed % 60])
	lines.append("Distância percorrida: %.1f km" % expedition_distance_km)
	lines.append("Sede: +%d • fadiga: +%d" % [thirst_delta, fatigue_delta])
	lines.append("Roupa molhada: %d%% • peso atual %d/%d kg" % [wetness, _total_weight(), _max_weight()])
	if night_return:
		stress = mini(100, stress + 4)
		threat = mini(100, threat + 2)
		lines.append("[color=#b7443c]Você voltou depois de escurecer. A rua estava mais perigosa e o abrigo ouviu sua chegada antes de vê-lo.[/color]")
		if upgrades.fence <= 0 and rng.randi_range(1, 100) <= 18 + int(threat / 6):
			threat = mini(100, threat + 7)
			_add_event("ABRIGO", "Movimento acompanhou você nas últimas quadras. A noite ficou menos segura.")
	else:
		_v12_daily_add("safe_return", 1)
		lines.append("[color=#7ea66f]Você conseguiu voltar antes da noite fechar a cidade.[/color]")
	if thirst >= 85: lines.append("Você chegou perigosamente desidratado.")
	if fatigue >= 85: lines.append("Seu corpo está perto do limite; outra saída agora seria imprudente.")
	if wetness >= 65 and _v12_feels_like() < 12: lines.append("Frio + roupa molhada aumentaram o risco de adoecer.")
	_v12_apply_condition_pressure()
	lines.append(_v13_condition_summary())
	active_location = ""
	_add_event("ABRIGO", "Você voltou de %s após %.1f km de expedição." % [v8_travel_origin, expedition_distance_km])
	v13_last_trip_summary = "\n".join(lines)
	_update_all()
	_save_game()
	_v8_show_page("journal", "RETORNO AO ABRIGO", "A EXPEDIÇÃO TERMINOU. AS CONSEQUÊNCIAS NÃO.", v13_last_trip_summary, [["ENTRAR NO ABRIGO", Callable(self, "_show_shelter")], ["SAÚDE / SINTOMAS", Callable(self, "_v12_show_health_environment")], ["MOCHILA", Callable(self, "_show_inventory_panel")]])
	_v9_set_immersive_page(true)
	if v8_page_bg!=null: v8_page_bg.texture=SHELTER_TEX
	if v8_page_shade!=null: v8_page_shade.color=Color(0.012,0.010,0.008,0.52)
	if left_nav_panel!=null: left_nav_panel.visible=false
	if v8_page_close!=null: v8_page_close.visible=false
	if v8_page_title!=null:
		v8_page_title.add_theme_font_size_override("font_size",34)
		v8_page_title.add_theme_color_override("font_color",BONE)
	if v8_page_body!=null:
		v8_page_body.position=Vector2(28,24); v8_page_body.size=Vector2(945,155)
	if v8_page_cards!=null:
		for c in v8_page_cards.get_children(): c.queue_free()
		v8_page_cards.visible=true; v8_page_cards.columns=4; v8_page_cards.position=Vector2(28,205); v8_page_cards.size=Vector2(950,320)
		v8_page_cards.add_child(_v13_trip_card("TEMPO FORA","%dh%02d"%[int(elapsed/60),elapsed%60],"Cada minuto consumiu recursos e luz do dia.",GOLD))
		v8_page_cards.add_child(_v13_trip_card("DISTÂNCIA","%.1f km"%expedition_distance_km,"Ida, exploração e retorno contam para o desgaste.",Color("#7690a0")))
		v8_page_cards.add_child(_v13_trip_card("SEDE / FADIGA","+%d / +%d"%[thirst_delta,fatigue_delta],"Estado final %d sede • %d fadiga"%[thirst,fatigue],Color("#8e6e4b")))
		v8_page_cards.add_child(_v13_trip_card("RETORNO","NOITE" if night_return else "ANTES DA NOITE","A cidade muda quando a luz desaparece.",Color("#a6463d") if night_return else GREEN))


func _v13_trip_card(title:String, value:String, note:String, accent:Color) -> Panel:
	var card:=Panel.new(); card.custom_minimum_size=Vector2(224,132); card.add_theme_stylebox_override("panel",_flat(Color(0.025,0.022,0.018,0.92),accent,5,2))
	var t:=Label.new(); t.position=Vector2(16,12); t.size=Vector2(190,24); t.text=title; t.add_theme_font_size_override("font_size",12); t.add_theme_color_override("font_color",accent.lightened(0.25)); card.add_child(t)
	var v:=Label.new(); v.position=Vector2(16,38); v.size=Vector2(190,38); v.text=value; v.add_theme_font_size_override("font_size",24); v.add_theme_color_override("font_color",BONE); card.add_child(v)
	var n:=Label.new(); n.position=Vector2(16,82); n.size=Vector2(190,42); n.text=note; n.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; n.add_theme_font_size_override("font_size",10); n.add_theme_color_override("font_color",MUTED); card.add_child(n)
	return card

func _run_v14_qa() -> void:
	_start_new_game(false); var failures:Array[String]=[]
	# roupa deve alterar exposição à chuva
	weather="CHUVA"; weather_severity=2; temperature=8; wind_speed=28; wetness=0; equipped_clothing="ROUPA COMUM"; owned_clothing=["ROUPA COMUM","PARKA IMPERMEÁVEL"]; clothing_condition={"ROUPA COMUM":100,"PARKA IMPERMEÁVEL":90}
	_v12_advance_time(60,"teste chuva comum",0.1,true); var wet_common:=wetness
	wetness=0; body_temperature=36.7; equipped_clothing="PARKA IMPERMEÁVEL"; _v12_advance_time(60,"teste chuva parka",0.1,true); var wet_parka:=wetness
	if wet_parka>=wet_common: failures.append("clothing_weather")
	# doença deve acumular dias e poder escalar
	diseases={"RESFRIADO":1}; v14_disease_days={}; fatigue=90; thirst=82; hunger=85; energy=15; _v12_disease_daily_tick(); if int(v14_disease_days.get("RESFRIADO",0))!=1: failures.append("disease_day")
	_v12_disease_daily_tick(); if int(diseases.get("RESFRIADO",0))<1: failures.append("disease_progress")
	# histórico do clima precisa ser guardado
	v14_weather_history=[]; _v12_roll_environment(); if v14_weather_history.is_empty(): failures.append("weather_history")
	# eventos encadeados novos
	v13_delayed_storylets=[]; _v13_schedule_delayed("storm_signal",day+1,{}); day+=1; _v13_process_delayed_storylets(); var found_mission:=false
	for m in missions: if str(m.get("id",""))=="v14_storm_signal": found_mission=true
	if not found_mission: failures.append("storm_storylet")
	# save/load V14
	_save_game(); var cloth_before:=equipped_clothing; var disease_before:=v14_disease_days.duplicate(true); equipped_clothing="ROUPA COMUM"; v14_disease_days={}; if not _load_game(): failures.append("save_load")
	if equipped_clothing!=cloth_before or v14_disease_days!=disease_before: failures.append("v14_state_save")
	print("V14_QA wet_common=%d wet_parka=%d disease=%s weather_history=%d clothing=%s failures=%s"%[wet_common,wet_parka,str(diseases),v14_weather_history.size(),equipped_clothing,str(failures)]); get_tree().quit(0 if failures.is_empty() else 2)

func _run_v13_qa() -> void:
	_start_new_game(false); var failures:Array[String]=[]
	materials.wood=2; weather="TEMPORAL"; weather_severity=3; _v13_queue_event("storm"); if v13_pending_event.is_empty(): failures.append("queue")
	var before:=_v12_clock_minutes(); _v13_storm_repair(); if _v12_clock_minutes()<=before or v13_event_memory.is_empty(): failures.append("storm_resolution")
	survivors=[_v7_make_survivor("LÚCIA","BATEDORA",42,"EX-INTEGRANTE DA VIGÍLIA")]; survivor_count=2; survivors[0].spy=true; survivors[0].loyalty=25; community_clues=["transmissão"]
	_v13_queue_event("suspicion","LÚCIA"); _v13_suspicion_investigate(); if not bool(v13_story_flags.get("spy_exposed_LÚCIA",false)): failures.append("spy_story")
	_v13_queue_event("visitor"); var mem_before:=v13_event_memory.size(); _v13_visitor_refuse(); if v13_event_memory.size()<=mem_before: failures.append("visitor")
	v8_travel_active=true; v8_travel_route="BECOS"; v8_travel_destination="FARMÁCIA"; v8_travel_event="abandoned_car"; v8_travel_segment=1; skills["survival"]=3; var scan_before:=_v12_clock_minutes(); _v13_attention_scan(); _close_modal(); if _v12_clock_minutes()<=scan_before or v13_attention_scans.is_empty(): failures.append("attention")
	v13_delayed_storylets=[]; _v13_schedule_delayed("sick_stranger",day+1,{}); day+=1; _v13_process_delayed_storylets(); if v13_delayed_storylets.is_empty() or not bool(v13_delayed_storylets[0].get("resolved",false)): failures.append("delayed")
	v13_expedition_start_day=day; v13_expedition_start_minute=12*60; v13_expedition_start_thirst=20; v13_expedition_start_fatigue=15; hour=18; minute=45; thirst=80; fatigue=76; expedition_distance_km=6.2; v8_travel_origin="HOSPITAL"; _v13_finish_return_trip(); if v13_last_trip_summary=="": failures.append("return")
	# Doença precisa alterar jogo, não apenas texto.
	diseases={}; fatigue=20; thirst=20; var stealth_clean:=_v8_stealth_score(); var power_clean:=_player_power(); diseases={"RESFRIADO":2,"DESIDRATAÇÃO":1}; var stealth_sick:=_v8_stealth_score(); var power_sick:=_player_power(); if stealth_sick>=stealth_clean or power_sick>=power_clean: failures.append("disease_penalty")
	# Chuva coletada permanece não tratada até filtragem/fervura.
	diseases={}; facilities.rain_collector=1; weather="CHUVA"; weather_severity=2; inventory.water=0; inventory.dirty_water=0; farm.planted=0; animals={"chickens":0,"rabbits":0,"goats":0,"dog":0,"feed":0,"health":70,"eggs":0,"milk":0}; _v7_daily_tick(); if int(inventory.dirty_water)<=0 or int(inventory.water)>0: failures.append("rainwater_safety")
	_save_game(); var saved:=v13_event_memory.size(); var delayed_saved:=v13_delayed_storylets.size(); v13_event_memory=[]; v13_delayed_storylets=[]; if not _load_game() or v13_event_memory.size()!=saved or v13_delayed_storylets.size()!=delayed_saved: failures.append("save")
	print("V13_QA events=%d story_flags=%d attention=%d delayed=%d trip=%.1fkm time=%s failures=%s"%[v13_event_memory.size(),v13_story_flags.size(),v13_attention_scans.size(),v13_delayed_storylets.size(),expedition_distance_km,_v12_clock_text(),str(failures)]); get_tree().quit(0 if failures.is_empty() else 2)

# -----------------------------------------------------------------------------
# AFTERFALL V12 — TEMPO, CLIMA, DOENÇAS, DISTÂNCIA, PERFIL E DESAFIOS
# -----------------------------------------------------------------------------
func _v14_show_room_scene(location_name:String, room_name:String) -> void:
	active_location=location_name
	_v9_enter_room(location_name,room_name)

func _v14_clothing_meta() -> Dictionary:
	return V14_CLOTHING_META.get(equipped_clothing,V14_CLOTHING_META["ROUPA COMUM"])

func _v14_clothing_protection() -> int:
	var m:=_v14_clothing_meta(); var condition_factor:=clampf(float(clothing_condition.get(equipped_clothing,100))/100.0,0.25,1.0)
	return int(round(float(m.get("protection",0))*condition_factor))

func _v14_season_preparation_tick() -> void:
	# Cinco dias antes da virada de estação, rádio/diário avisam para o jogador poder se preparar.
	if ((day-1)%30)!=25: return
	var seasons:=["OUTONO","INVERNO","PRIMAVERA","VERÃO"]; var current_idx:=seasons.find(season); if current_idx<0: current_idx=0
	var next_season:String=seasons[(current_idx+1)%seasons.size()]
	var flag:="season_warning_%d"%day; if bool(v14_environment_flags.get(flag,false)): return
	v14_environment_flags[flag]=true
	var advice:String=str({"INVERNO":"estoque lenha, roupas quentes e comida conservada","PRIMAVERA":"prepare sementes, drenagem e coleta de água","VERÃO":"garanta água, sombra e conservação de alimentos","OUTONO":"revise telhado, estoque e roupas antes do frio"}.get(next_season,"revise seus estoques"))
	_add_event("ESTAÇÃO","Faltam cerca de 5 dias para %s. %s."%[next_season,str(advice).capitalize()])
	journal.append("Dia %d — sinais de mudança de estação. Próxima: %s."%[day,next_season])

func _v14_show_clothing() -> void:
	var lines:Array[String]=[]
	var active:=_v14_clothing_meta()
	lines.append("[b]EQUIPADO[/b]  %s • condição %d%%"%[equipped_clothing,int(clothing_condition.get(equipped_clothing,100))])
	lines.append("Calor +%d • impermeabilidade %d • proteção %d • ruído %d"%[int(active.get("warmth",0)),int(active.get("waterproof",0)),int(active.get("protection",0)),int(active.get("noise",0))])
	lines.append("\n[b]ROUPAS DISPONÍVEIS[/b]")
	for c in owned_clothing:
		var m:Dictionary=V14_CLOTHING_META.get(c,V14_CLOTHING_META["ROUPA COMUM"])
		lines.append("%s%s — calor %d • chuva %d • proteção %d • condição %d%% • %s"%["✓ " if c==equipped_clothing else "",c,int(m.get("warmth",0)),int(m.get("waterproof",0)),int(m.get("protection",0)),int(clothing_condition.get(c,100)),str(m.get("rarity","COMUM"))])
	var actions:Array=[]
	for c in owned_clothing:
		if c!=equipped_clothing: actions.append(["VESTIR "+c,func(name=c): _v14_equip_clothing(name)])
	if int(clothing_condition.get(equipped_clothing,100))<95: actions.append(["REMENDAR / REPARAR",Callable(self,"_v14_repair_clothing")])
	if wetness>10: actions.append(["SECAR-SE NO ABRIGO",Callable(self,"_v14_dry_clothing")])
	actions.append(["SAÚDE / AMBIENTE",Callable(self,"_v12_show_health_environment")])
	_v8_show_page("body","ROUPAS & CAMADAS","O CLIMA COMEÇA NA PELE","\n".join(lines),actions)

func _v14_equip_clothing(name:String) -> void:
	if not owned_clothing.has(name): return
	_v12_advance_time(4,"trocar roupa",0.0,false); equipped_clothing=name; armor_name=name; _save_game(); _v14_show_clothing()

func _v14_repair_clothing() -> void:
	if equipped_clothing=="ROUPA COMUM" and int(clothing_condition.get(equipped_clothing,100))>=95: _toast("Essa roupa não precisa de reparo."); return
	var need:=1 if int(clothing_condition.get(equipped_clothing,100))>=50 else 2
	var have:=int(inventory.get("cloth",0))+int(materials.get("cloth",0))
	if have<need: _toast("Falta tecido para remendar."); return
	var take_inv:=mini(need,int(inventory.get("cloth",0))); inventory.cloth-=take_inv; var left:=need-take_inv; if left>0: materials.cloth-=left
	var skill:=int(skills.get("tailoring",0)); var gain:=22+skill*8; clothing_condition[equipped_clothing]=mini(100,int(clothing_condition.get(equipped_clothing,50))+gain)
	_v12_advance_time(maxi(18,42-skill*4),"remendar roupa",0.06,false); _v7_gain_skill("tailoring",5); _add_event("EQUIPAMENTO","Você reparou %s. Condição agora %d%%."%[equipped_clothing,int(clothing_condition[equipped_clothing])]); _save_game(); _v14_show_clothing()

func _v14_dry_clothing() -> void:
	var wood_cost:=1 if wetness>=55 and temperature<=12 else 0
	if wood_cost>0 and int(materials.get("wood",0))<=0: _toast("Está frio demais para secar rápido sem lenha."); return
	if wood_cost>0: materials.wood-=1
	var minutes:=45 if wetness>=55 else 25; _v12_advance_time(minutes,"secar roupa e recuperar calor",0.0,false); wetness=maxi(0,wetness-70); body_temperature=minf(36.8,body_temperature+0.35); fatigue=maxi(0,fatigue-4); _v12_apply_condition_pressure(); _add_event("ABRIGO","Você parou para secar roupa e recuperar calor antes de sair de novo."); _save_game(); _v14_show_clothing()

func _v14_try_find_clothing(location_name:String) -> void:
	if rng.randi_range(1,100)>7: return
	var pool:Array[String]=["JAQUETA DE CHUVA","CASACO DE LÃ"]
	if location_name in ["SHOPPING","QUARENTENA","DELEGACIA"]: pool.append("PARKA IMPERMEÁVEL")
	if location_name in ["DELEGACIA","ARMAZÉM","QUARENTENA"]: pool.append("ROUPA REFORÇADA")
	var found:=pool[rng.randi_range(0,pool.size()-1)]
	if not owned_clothing.has(found):
		owned_clothing.append(found); clothing_condition[found]=rng.randi_range(45,92); _add_event("EQUIPAMENTO","Você encontrou %s em condição aproveitável."%found)

func _v14_examine_downed_line() -> void:
	var skilled:=int(skills.get("electricity",0))>=2 or bool(tools.get("multimeter",false))
	_v12_advance_time(18,"examinar rede caída",0.16,true)
	if skilled:
		materials.copper+=2; materials.wire+=2; _v7_gain_skill("electricity",5); _add_event("RUA","Você confirmou ausência de tensão e recuperou cobre e fios sem tocar nos cabos errados.")
	else:
		if rng.randi_range(1,100)<=35: life=maxi(1,life-8); stress=mini(100,stress+6); _add_event("ACIDENTE","Uma descarga residual atravessou a ferramenta. Vida -8.")
		else: materials.copper+=1; _add_event("RUA","Você recuperou pouco cobre sem entender completamente a rede.")
	_v8_render_street("Você termina a inspeção e olha novamente para a rota.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v14_wait_downed_line() -> void:
	_v12_advance_time(12,"esperar os cabos pararem",0.0,true); _v8_render_street("As rajadas mudam e os cabos param de varrer a passagem por alguns minutos.",[["PASSAR",Callable(self,"_v8_next_segment")]])

func _v14_search_mold_house() -> void:
	_v12_advance_time(28,"vasculhar casa úmida",0.22,false)
	var protected:=armor_name!="ROUPA COMUM" or int(skills.get("medicine",0))>=2
	if not protected and rng.randi_range(1,100)<=42:
		diseases["IRRITAÇÃO RESPIRATÓRIA"]=maxi(1,int(diseases.get("IRRITAÇÃO RESPIRATÓRIA",0))); v14_disease_days["IRRITAÇÃO RESPIRATÓRIA"]=0
	if rng.randi_range(1,100)<=55: inventory.food+=1
	else: materials.cloth+=2; materials.chemicals+=1
	_v8_render_street("Você sai tossindo levemente, mas não de mãos vazias. A umidade fica impregnada na roupa.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v14_follow_migration() -> void:
	_v12_advance_time(42,"seguir animais",0.42,true)
	var score:=35+int(skills.get("hunting",0))*11+int(skills.get("survival",0))*5
	if rng.randi_range(1,100)<=clampi(score,20,92):
		materials.raw_meat+=rng.randi_range(1,3); _v7_gain_skill("hunting",7); _v12_daily_add("hunt",1); _add_event("CAÇA","Você aproveitou a passagem sazonal e voltou à rota com carne fresca.")
	else: _add_event("CAÇA","Você seguiu os rastros por quase uma hora, mas o vento entregou sua posição.")
	_v13_schedule_delayed("migration_return",day+3,{})
	_v8_render_street("A trilha some entre vegetação e construções. Você marca mentalmente a direção antes de voltar à viagem.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v14_mark_migration() -> void:
	_v12_advance_time(8,"marcar rota de animais",0.03,true); _v13_schedule_delayed("migration_return",day+2,{}); _add_event("MAPA","Você marcou a direção da passagem de animais para observar nos próximos dias."); _v8_next_segment()

func _v14_record_storm_signal() -> void:
	_v12_advance_time(14,"gravar transmissão",0.02,true); _v13_schedule_delayed("storm_signal",day+1,{}); lore_archive.append("Dia %d — coordenadas incompletas captadas durante um temporal."%day); _v8_render_street("Você salva um trecho cheio de estática. Talvez o rádio do abrigo consiga limpar a gravação.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v14_answer_storm_signal() -> void:
	_v12_advance_time(9,"responder transmissão",0.02,true); noise=mini(100,noise+3); radio_signal=maxi(0,radio_signal-4); _v13_schedule_delayed("storm_signal",day+2,{}); _v8_render_street("Você responde duas vezes. Por um instante alguém parece repetir seu indicativo, então o trovão engole a frequência.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_reset_systems() -> void:
	minute=0; wetness=0; body_temperature=36.7; diseases={}; total_distance_km=0.0; expedition_distance_km=0.0
	_v12_roll_environment()
	_v12_ensure_daily_missions()

func _v12_normalize_loaded_state() -> void:
	minute=clampi(minute,0,59); wind_speed=clampi(wind_speed,0,90); humidity=clampi(humidity,10,100); visibility=clampi(visibility,10,100); wetness=clampi(wetness,0,100)
	if typeof(diseases)!=TYPE_DICTIONARY: diseases={}
	if typeof(v14_disease_days)!=TYPE_DICTIONARY: v14_disease_days={}
	for dk in v14_disease_days.keys(): v14_disease_days[dk]=int(v14_disease_days[dk])
	if typeof(v14_weather_history)!=TYPE_ARRAY: v14_weather_history=[]
	if typeof(v14_environment_flags)!=TYPE_DICTIONARY: v14_environment_flags={}
	if owned_clothing.is_empty(): owned_clothing=["ROUPA COMUM"]
	if not owned_clothing.has(equipped_clothing): equipped_clothing=owned_clothing[0]
	if typeof(clothing_condition)!=TYPE_DICTIONARY: clothing_condition={}
	for c in owned_clothing: if not clothing_condition.has(c): clothing_condition[c]=100
	_v12_ensure_daily_missions()

func _v12_clock_minutes() -> int:
	return hour*60+minute

func _v12_clock_text() -> String:
	return "%02d:%02d"%[hour,minute]

func _v12_format_minutes(total:int) -> String:
	var t:=posmod(total,1440)
	return "%02d:%02d"%[int(t/60),t%60]

func _v12_is_night() -> bool:
	var t:=_v12_clock_minutes()
	return t<sunrise_minute or t>=sunset_minute

func _v12_daylight_left() -> int:
	return maxi(0,sunset_minute-_v12_clock_minutes())

func _v12_roll_environment() -> void:
	season=["OUTONO","INVERNO","PRIMAVERA","VERÃO"][int((day-1)/30)%4]
	var meta:Dictionary=V12_SEASON_META[season]
	sunrise_minute=int(meta.sunrise)+rng.randi_range(-12,12); sunset_minute=int(meta.sunset)+rng.randi_range(-12,12)
	temperature=rng.randi_range(int(meta.min),int(meta.max)); humidity=rng.randi_range(45,94); wind_speed=maxi(2,int(meta.wind)+rng.randi_range(-7,22)); wind_direction=["N","NE","L","SE","S","SO","O","NO"][rng.randi_range(0,7)]
	var rain_roll:=rng.randi_range(1,100); var rain_chance:=int(meta.rain)
	if rain_roll<=rain_chance/4: weather="TEMPORAL"; weather_severity=3; visibility=rng.randi_range(38,62); humidity=95
	elif rain_roll<=rain_chance: weather="CHUVA"; weather_severity=2; visibility=rng.randi_range(55,78); humidity=maxi(humidity,82)
	elif rng.randi_range(1,100)<=14: weather="NEBLINA"; weather_severity=1; visibility=rng.randi_range(28,55); humidity=maxi(humidity,88)
	elif rng.randi_range(1,100)<=26: weather="GAROA"; weather_severity=1; visibility=rng.randi_range(68,88)
	else: weather="SECO"; weather_severity=0; visibility=rng.randi_range(82,100)
	if season=="INVERNO" and temperature<=6 and weather_severity==0: weather="FRIO SECO"
	if season=="VERÃO" and temperature>=32 and weather_severity==0: weather="CALOR"
	forecast_text="%s. %d°C, umidade %d%%, vento %s %d km/h. Luz do dia %s–%s."%[weather,temperature,humidity,wind_direction,wind_speed,_v12_format_minutes(sunrise_minute),_v12_format_minutes(sunset_minute)]
	radio_signal=clampi(42+upgrades.radio*6-weather_severity*7-int(wind_speed/9)+rng.randi_range(-6,8),4,98)
	v14_weather_history.append({"day":day,"season":season,"weather":weather,"temperature":temperature,"humidity":humidity,"wind_speed":wind_speed,"wind_direction":wind_direction,"visibility":visibility})
	while v14_weather_history.size()>7: v14_weather_history.pop_front()
	_add_event("CLIMA",forecast_text)

func _v12_feels_like() -> int:
	var feel:=temperature
	if wind_speed>=20: feel-=int((wind_speed-15)/8)
	if humidity>=85 and temperature<=15: feel-=2
	if humidity>=75 and temperature>=28: feel+=2
	return feel

func _v12_advance_time(minutes_delta:int,reason:String="",exertion:float=0.0,outdoors:bool=false) -> void:
	if minutes_delta<=0: return
	var remaining:=minutes_delta
	while remaining>0:
		var now:=_v12_clock_minutes(); var until_midnight:=1440-now; var step:=mini(remaining,until_midnight)
		var hours_f:=float(step)/60.0
		hunger=clampi(hunger+int(ceil(hours_f*(1.1+exertion*0.8))),0,100)
		var heat_factor:=maxf(0.0,float(_v12_feels_like()-24)/12.0)
		thirst=clampi(thirst+int(ceil(hours_f*(1.5+exertion*2.2+heat_factor))),0,100)
		fatigue=clampi(fatigue+int(ceil(hours_f*(0.7+exertion*1.7))),0,100); energy=clampi(energy-int(ceil(hours_f*(1.0+exertion*2.5))),0,100)
		activity_calories+=int(hours_f*(55.0+exertion*210.0))
		if outdoors:
			var cloth:=_v14_clothing_meta()
			var cond_factor:=clampf(float(clothing_condition.get(equipped_clothing,100))/100.0,0.25,1.0)
			var waterproof:=int(round(float(cloth.get("waterproof",0))*cond_factor)); var warmth:=int(round(float(cloth.get("warmth",0))*cond_factor))
			if weather_severity>0:
				var wet_gain:=maxf(2.0,float(12+weather_severity*11)-float(waterproof)*8.0)
				wetness=clampi(wetness+int(hours_f*wet_gain),0,100)
			elif wind_speed>22: wetness=maxi(0,wetness-int(hours_f*9))
			var feel:=_v12_feels_like()+warmth*2
			if wetness>45 and feel<12:
				body_temperature=maxf(34.0,body_temperature-hours_f*maxf(0.07,0.25-float(warmth)*0.035))
			elif feel>31:
				body_temperature=minf(39.5,body_temperature+hours_f*(0.12+float(warmth)*0.015))
			else:
				body_temperature=move_toward(body_temperature,36.7,hours_f*0.12)
			if equipped_clothing!="ROUPA COMUM" and weather_severity>=2:
				clothing_condition[equipped_clothing]=maxi(1,int(clothing_condition.get(equipped_clothing,100))-int(ceil(hours_f*0.6)))
		var total:=now+step; hour=int(total/60)%24; minute=total%60; remaining-=step
		if step>=until_midnight:
			_v12_pass_midnight()
	_v12_apply_condition_pressure()
	if reason!="" and minutes_delta>=45: _add_event("TEMPO","%s consumiu %d min."%[reason.capitalize(),minutes_delta])
	_update_all()

func _v12_pass_midnight() -> void:
	day+=1; hour=0; minute=0; actions_left=3
	var supply_report:=_consume_shelter_supplies(); _evolve_city(); _v7_daily_tick(); _unlock_districts(); _v12_disease_daily_tick(); _v15_community_health_tick(); _v16_shelter_daily_tick(); _v16_advanced_health_tick(); _v12_roll_environment(); _v13_process_delayed_storylets(); _v14_season_preparation_tick(); _apply_survivor_bonuses()
	journal.append("Dia %d — a madrugada passou enquanto o tempo continuava. %s"%[day,supply_report]); _add_event("MADRUGADA",supply_report)

func _v12_apply_condition_pressure() -> void:
	if thirst>=92: diseases["DESIDRATAÇÃO"]=maxi(int(diseases.get("DESIDRATAÇÃO",0)),1)
	elif thirst<65 and diseases.has("DESIDRATAÇÃO"): diseases.erase("DESIDRATAÇÃO")
	if body_temperature<=35.2: diseases["HIPOTERMIA"]=maxi(int(diseases.get("HIPOTERMIA",0)),1)
	elif body_temperature>=36.2 and diseases.has("HIPOTERMIA"): diseases.erase("HIPOTERMIA")
	if body_temperature>=38.2: diseases["EXAUSTÃO PELO CALOR"]=maxi(int(diseases.get("EXAUSTÃO PELO CALOR",0)),1)
	elif body_temperature<37.8 and diseases.has("EXAUSTÃO PELO CALOR"): diseases.erase("EXAUSTÃO PELO CALOR")

func _v12_disease_daily_tick() -> void:
	if wetness>65 and _v12_feels_like()<12 and rng.randi_range(1,100)<=28: diseases["RESFRIADO"]=maxi(1,int(diseases.get("RESFRIADO",0)))
	if int(injuries.get("bleeding",0))>0 and hygiene<45 and rng.randi_range(1,100)<=30: diseases["INFECÇÃO DE FERIDA"]=maxi(1,int(diseases.get("INFECÇÃO DE FERIDA",0)))
	if stomach_sick>0: diseases["INTOXICAÇÃO"]=maxi(1,int(diseases.get("INTOXICAÇÃO",0)))
	# Condições persistentes acumulam dias e podem piorar se o personagem insiste em ignorá-las.
	for id in diseases.keys():
		var sev:=clampi(int(diseases[id]),1,3)
		var days_sick:=int(v14_disease_days.get(str(id),0))+1
		v14_disease_days[str(id)]=days_sick
		var bad_recovery:=fatigue>70 or thirst>75 or hunger>78 or energy<25
		var good_recovery:=fatigue<45 and thirst<55 and hunger<60 and energy>45 and shelter_comfort>=8
		if days_sick>=2 and sev<3 and bad_recovery and rng.randi_range(1,100)<=34:
			sev+=1; _add_event("SAÚDE","%s piorou depois de %d dias sem recuperação adequada."%[str(V12_DISEASE_META.get(str(id),{}).get("name",id)),days_sick])
		elif days_sick>=2 and sev>1 and good_recovery and rng.randi_range(1,100)<=28:
			sev-=1; v14_disease_days[str(id)]=0; _add_event("SAÚDE","Repouso, água e alimentação aliviaram %s."%str(V12_DISEASE_META.get(str(id),{}).get("name",id)))
		diseases[id]=sev
		match str(id):
			"RESFRIADO": fatigue=mini(100,fatigue+3*sev); energy=maxi(0,energy-3*sev)
			"INFECÇÃO DE FERIDA": life=maxi(1,life-3*sev); fatigue=mini(100,fatigue+2*sev)
			"INTOXICAÇÃO": thirst=mini(100,thirst+7*sev); energy=maxi(0,energy-5*sev)
			"HIPOTERMIA": life=maxi(1,life-4*sev); fatigue=mini(100,fatigue+5*sev)
			"EXAUSTÃO PELO CALOR": thirst=mini(100,thirst+8*sev); energy=maxi(0,energy-6*sev)
			"DESIDRATAÇÃO": life=maxi(1,life-5*sev); energy=maxi(0,energy-6*sev)
			"IRRITAÇÃO RESPIRATÓRIA": fatigue=mini(100,fatigue+2*sev); energy=maxi(0,energy-2*sev); stress=mini(100,stress+sev)
			"GRIPE": fatigue=mini(100,fatigue+5*sev); energy=maxi(0,energy-5*sev); thirst=mini(100,thirst+3*sev)
			"BRONQUITE": fatigue=mini(100,fatigue+4*sev); energy=maxi(0,energy-4*sev); stress=mini(100,stress+2*sev)
			"GASTROENTERITE": thirst=mini(100,thirst+9*sev); energy=maxi(0,energy-6*sev); hunger=mini(100,hunger+3*sev)
	# Limpa contadores de condições que já desapareceram.
	for id in v14_disease_days.keys():
		if not diseases.has(id): v14_disease_days.erase(id)

func _v12_condition_text() -> String:
	if diseases.is_empty(): return "Sem sintomas importantes."
	var lines:Array[String]=[]
	for id in diseases:
		var meta:Dictionary=V12_DISEASE_META.get(str(id),{"name":str(id),"desc":"Condição em acompanhamento."})
		var sev:=int(diseases[id]); var days_sick:=int(v14_disease_days.get(str(id),0))
		var stage:="LEVE" if sev==1 else ("MODERADO" if sev==2 else "GRAVE")
		lines.append("%s • %s • %d dia(s) — %s"%[str(meta.name),stage,days_sick,str(meta.desc)])
	return "\n".join(lines)

func _v12_speed_kmh(route:String) -> float:
	var speed:=4.8
	if active_vehicle!="" and vehicles.has(active_vehicle) and bool(vehicles[active_vehicle].get("found",false)):
		speed={"BICICLETA":13.0,"MOTO":28.0,"CARRO":36.0}.get(active_vehicle,4.8)
	var load_ratio:=float(_total_weight())/maxf(1.0,float(_max_weight())); if load_ratio>0.8: speed*=maxf(0.52,1.0-(load_ratio-0.8)*0.45)
	speed*=clampf(0.78+float(fitness)/190.0,0.72,1.22); speed*=V12_ROUTE_FACTORS.get(route,V12_ROUTE_FACTORS["AVENIDA"]).speed
	if int(injuries.get("leg",0))>0: speed*=maxf(0.45,1.0-float(injuries.leg)/130.0)
	if fatigue>70: speed*=0.78
	if weather=="TEMPORAL": speed*=0.72
	elif weather in ["CHUVA","NEBLINA"]: speed*=0.86
	if wind_speed>=45: speed*=0.78
	elif wind_speed>=30: speed*=0.9
	if wetness>=75: speed*=0.90
	if float(_v14_clothing_meta().get("weight",1.2))>=3.0: speed*=0.94
	if _v12_is_night(): speed*=0.88
	for id in ["HIPOTERMIA","EXAUSTÃO PELO CALOR","DESIDRATAÇÃO"]:
		if diseases.has(id): speed*=0.88
	return maxf(1.3,speed)

func _v12_travel_estimate(location_name:String,route:String) -> Dictionary:
	var base:=float(V12_LOCATION_DISTANCE_KM.get(location_name,1.0)); var rf:Dictionary=V12_ROUTE_FACTORS.get(route,V12_ROUTE_FACTORS["AVENIDA"]); var distance:=base*float(rf.distance); var speed:=_v12_speed_kmh(route); var mins:=maxi(5,int(ceil(distance/speed*60.0)))
	var familiarity:=_v18_route_xp(location_name,route); var knowledge_bonus:=minf(0.15,float(familiarity)*0.025); mins=maxi(4,int(ceil(float(mins)*(1.0-knowledge_bonus))))
	var water_ml:=int(distance*(95.0+maxf(0.0,float(temperature-22))*5.0)*(1.2 if _total_weight()>_max_weight() else 1.0))
	return {"distance":distance,"speed":speed,"minutes":mins,"water_ml":water_ml,"familiarity":familiarity}

func _v12_today_key() -> String:
	var d:=Time.get_date_dict_from_system(); return "%04d-%02d-%02d"%[int(d.year),int(d.month),int(d.day)]

func _v12_ensure_daily_missions() -> void:
	var key:=_v12_today_key()
	if profile_daily_key==key and profile_daily_missions.size()==3: return
	profile_daily_key=key; profile_daily_missions=[]; profile_daily_stats={"km":0.0,"rooms":0,"stealth":0,"cook":0,"study_minutes":0,"exercise_minutes":0,"help":0,"craft":0,"radio":0,"hunt":0,"attention":0,"safe_return":0}
	var local_rng:=RandomNumberGenerator.new(); local_rng.seed=abs(hash(key))+1709; var ids:Array[int]=[]
	while ids.size()<3:
		var idx:=local_rng.randi_range(0,V12_DAILY_POOL.size()-1); if not ids.has(idx): ids.append(idx)
	for idx in ids:
		var m:Dictionary=V12_DAILY_POOL[idx].duplicate(true); m["current"]=0.0; m["done"]=false; profile_daily_missions.append(m)
	_save_profile_settings()

func _v12_daily_add(stat:String,amount:float) -> void:
	_v12_ensure_daily_missions(); profile_daily_stats[stat]=float(profile_daily_stats.get(stat,0.0))+amount; var changed:=false
	for m in profile_daily_missions:
		if str(m.stat)!=stat or bool(m.done): continue
		m.current=minf(float(m.target),float(profile_daily_stats[stat])); if float(m.current)>=float(m.target): m.done=true; profile_xp+=int(m.reward); profile_tokens+=1; changed=true; _v12_recalc_profile_level(); _toast("DESAFIO DIÁRIO CONCLUÍDO: "+str(m.title))
	if changed: _save_profile_settings()

func _v12_recalc_profile_level() -> void:
	profile_level=1+int(profile_xp/180)

func _v12_show_profile() -> void:
	_v12_ensure_daily_missions(); var ui:=_v10_overlay_base("PERFIL DE SOBREVIVENTE","Este perfil existe fora das campanhas. A campanha pode morrer; sua história de jogador permanece."); var panel:Panel=ui.panel
	var left:=Label.new(); left.position=Vector2(70,150); left.size=Vector2(570,430); left.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; left.text="NOME DO PERFIL\n%s\n\nNÍVEL %d • XP %d\nFichas de legado: %d\n\nDistância total nesta campanha: %.1f km\nMelhor campanha: Dia %d\nBosses: %d\nPersonagens conhecidos: %d/%d"%[profile_name,profile_level,profile_xp,profile_tokens,total_distance_km,int(profile_legacy.get("best_day",0)),int(profile_legacy.get("best_bosses",0)),profile_unlocked_characters.size(),V10_CHARACTERS.size()]; left.add_theme_font_size_override("font_size",20); left.add_theme_color_override("font_color",BONE); panel.add_child(left)
	var edit:=LineEdit.new(); edit.position=Vector2(720,170); edit.size=Vector2(540,52); edit.placeholder_text="Digite seu nome ou codinome"; edit.text=profile_name; edit.max_length=24; edit.add_theme_font_size_override("font_size",20); panel.add_child(edit); v12_profile_name_edit=edit
	var save:=_make_dark_button("SALVAR NOME",Vector2(300,52)); save.position=Vector2(720,245); save.pressed.connect(_v12_save_profile_name); panel.add_child(save)
	var daily:=_make_dark_button("VER DESAFIOS DIÁRIOS",Vector2(300,52)); daily.position=Vector2(1040,245); daily.pressed.connect(_v12_show_daily_missions); panel.add_child(daily)
	var note:=Label.new(); note.position=Vector2(720,335); note.size=Vector2(560,220); note.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; note.text="O nome do perfil não torna seu personagem especial. Na primeira campanha você continua sendo um Civil Comum sem recursos. Profissões, cicatrizes, relações e conhecimento são conquistados jogando."; note.add_theme_font_size_override("font_size",17); note.add_theme_color_override("font_color",MUTED); panel.add_child(note)

func _v12_save_profile_name() -> void:
	if v12_profile_name_edit==null: return
	var candidate:=v12_profile_name_edit.text.strip_edges(); if candidate.length()<2: _toast("Use pelo menos 2 caracteres."); return
	profile_name=candidate.substr(0,24); _save_profile_settings(); _v10_refresh_menu_profile(); _v12_show_profile()

func _v12_show_daily_missions() -> void:
	_v12_ensure_daily_missions(); var ui:=_v10_overlay_base("DESAFIOS DIÁRIOS","Objetivos opcionais do perfil. Eles não entregam comida ou munição infinita: rendem XP de perfil e legado."); var panel:Panel=ui.panel
	var y:=150
	for m in profile_daily_missions:
		var card:=Panel.new(); card.position=Vector2(70,y); card.size=Vector2(1280,145); card.add_theme_stylebox_override("panel",_flat(Color(0.04,0.037,0.032,0.97),GREEN if bool(m.done) else Color("#6d604c"),7,2)); panel.add_child(card)
		var lab:=Label.new(); lab.position=Vector2(28,18); lab.size=Vector2(1180,105); lab.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; var current:=float(profile_daily_stats.get(str(m.stat),0.0)); lab.text="%s  %s\n%s\nProgresso: %.1f / %.1f • +%d XP de perfil"%[str(m.title),"CONCLUÍDO" if bool(m.done) else "",str(m.desc),minf(current,float(m.target)),float(m.target),int(m.reward)]; lab.add_theme_font_size_override("font_size",18); lab.add_theme_color_override("font_color",BONE); card.add_child(lab); y+=165
	var footer:=Label.new(); footer.position=Vector2(70,660); footer.size=Vector2(1200,70); footer.text="Perfil %s • Nv.%d • XP %d • fichas %d"%[profile_name,profile_level,profile_xp,profile_tokens]; footer.add_theme_font_size_override("font_size",17); footer.add_theme_color_override("font_color",GOLD); panel.add_child(footer)

func _v12_follow_tracks() -> void:
	_v12_advance_time(22,"seguir pegadas",0.3,true); var chance:=42+int(skills.get("hunting",0))*12
	if rng.randi_range(1,100)<=chance: materials.raw_meat+=1; wildlife_density=maxi(0,wildlife_density-2); _v12_daily_add("hunt",1); _v8_render_street("As pegadas terminam num terreno vazio. Você consegue uma pequena caça antes que ela escape.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("O rastro some entre concreto e água. Você perdeu tempo, mas aprendeu algo sobre a direção dos animais.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_attention_tracks() -> void:
	var h:=int(skills.get("hunting",0)); var s:=int(skills.get("survival",0)); var text:="Você vê marcas recentes." if h+s<3 else "Pegadas pequenas, provavelmente coelho ou animal jovem. Seguem contra o vento, em direção a uma área com cobertura."
	_v8_render_street("[b]MODO DE ATENÇÃO[/b]\n\n"+text+"\n\nO que você entende do mundo depende do que aprendeu.",[["SEGUIR",Callable(self,"_v12_follow_tracks")],["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_examine_transformer() -> void:
	var skill:=int(skills.get("electrical",0)); _v12_advance_time(15,"examinar transformador",0.1,true)
	if skill>=2: materials.copper+=2; inventory.electronics+=1; _v7_gain_skill("electrical",4); _v8_render_street("Você identifica o circuito ainda energizado, isola a parte perigosa e recupera cobre e um componente útil.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	elif rng.randi_range(1,100)<=35: life=maxi(1,life-12); _v8_render_street("Você toca numa parte que parecia morta. O choque joga seu braço para trás. Sem conhecimento, aquela caixa era uma armadilha.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("Você percebe que não sabe o bastante para trabalhar com segurança. Pelo menos não se machucou.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_investigate_smoke() -> void:
	_v12_advance_time(18,"investigar fumaça",0.2,true); var roll:=rng.randi_range(1,100)
	if roll<=35: inventory.food+=1; _v8_render_street("A fumaça vinha de uma panela esquecida sobre brasas fracas. Ninguém aparece. Uma lata ainda pode ser aproveitada.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	elif roll<=70: _v12_help_stranger()
	else: noise=mini(100,noise+10); _v8_render_street("O piso cede perto da entrada. Você recua antes de ficar preso, mas o estrondo ecoa pelo quarteirão.",[["SAIR",Callable(self,"_v8_next_segment")]])

func _v12_help_stranger() -> void:
	if inventory.water<=0: _v8_render_street("Você procura a garrafa, mas não tem água limpa para oferecer. A pessoa apenas abaixa a cabeça.",[["CONTINUAR",Callable(self,"_v8_next_segment")]]); return
	inventory.water-=1; morale=mini(100,morale+2); _v12_daily_add("help",1); v8_travel_segment=min(v8_travel_segment+1,int(V8_ROUTE_DATA.get(v8_travel_route,V8_ROUTE_DATA["AVENIDA"]).segments)); _add_event("RUA","Você dividiu água com um desconhecido e recebeu uma indicação de atalho."); _v8_render_street("Depois de beber, a pessoa desenha uma passagem entre dois prédios. O atalho corta parte do caminho.",[["USAR O ATALHO",Callable(self,"_v8_next_segment")]])

func _v12_assess_stranger() -> void:
	var med:=int(skills.get("medicine",0)); _v12_advance_time(8,"avaliar ferimento",0.02,true); var read:="Você vê sangue e não sabe a gravidade." if med<2 else "Ferimento profundo, mas sem sinais claros de mordida. A pessoa está desidratada e consciente."
	_v8_render_street("[b]AVALIAÇÃO[/b]\n\n"+read,[["DAR ÁGUA",Callable(self,"_v12_help_stranger")],["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_wait_in_dark() -> void:
	_v12_advance_time(12,"esperar no escuro",0.0,true); stress=mini(100,stress+2); _v12_daily_add("stealth",1); _v8_render_street("Você fica imóvel até os sons se afastarem. A cidade volta a parecer vazia.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_identify_night_sound() -> void:
	var score:=35+int(skills.get("survival",0))*10+visibility/5
	if rng.randi_range(1,100)<=score: _v8_render_street("Você percebe pelo ritmo que são passos humanos, não de infectado. Alguém cruza a esquina e some sem tentar contato.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("Você força os olhos no escuro e perde a referência. O som agora parece mais perto.",[["RECUAR",Callable(self,"_v8_street_detour")],["CORRER",Callable(self,"_v8_street_run")]])

func _v12_wait_wind() -> void:
	_v12_advance_time(15,"esperar as rajadas",0.0,true); _v8_render_street("As rajadas diminuem por alguns minutos. Você usa a abertura para continuar.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_call_into_fog() -> void:
	noise=mini(100,noise+8); if rng.randi_range(1,100)<=45: _v8_render_street("Uma voz humana responde de longe: 'não chega perto'. Você obedece.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])
	else: _v8_render_street("A resposta é um rosnado curto e rápido demais. A silhueta volta a aparecer.",[["ESCONDER-SE",func(): _v8_resolve_stealth("mutant")],["LUTAR",Callable(self,"_v8_street_mutant_combat")]],"mutant")

func _v12_show_health_environment() -> void:
	_v8_show_page("body","SAÚDE / CORPO","O CORPO NÃO IGNORA FRIO, FOME, ÁGUA, DOR OU TEMPO","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["body"]; v8_page_shade.color=Color(0.008,0.008,0.008,0.45)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_body.visible=true; v8_page_body.position=Vector2(24,20); v8_page_body.size=Vector2(315,620)
	var disease_text:=_v17_disease_summary(); var season_day:=((day-1)%30)+1
	v8_page_body.text="[font_size=27][b]SEU CORPO[/b][/font_size]\n\nPeso  [b]%.1f kg[/b]\nEnergia  [b]%d%%[/b]\nCondicionamento  [b]%d%%[/b]\nTemperatura  [b]%.1f°C[/b]\nRoupa molhada  [b]%d%%[/b]\n\n[b]DOENÇAS[/b]\n%s\n\n[color=#9b8c76]Estação: %s • dia %d/30[/color]"%[body_weight,energy,int(fitness),body_temperature,wetness,disease_text,season,season_day]
	v8_page_cards.visible=true; v8_page_cards.columns=2; v8_page_cards.position=Vector2(355,38); v8_page_cards.size=Vector2(730,590); v8_page_cards.add_theme_constant_override("h_separation",12); v8_page_cards.add_theme_constant_override("v_separation",12)
	for c in v8_page_cards.get_children(): c.queue_free()
	v8_page_cards.add_child(_v17_status_card("CLIMA","%s • sensação %d°C"%[forecast_text,_v12_feels_like()],"Umidade %d%% • vento %s %d km/h"%[humidity,wind_direction,wind_speed],Color("#587185")))
	v8_page_cards.add_child(_v17_status_card("HIDRATAÇÃO","Sede %d / 100"%thirst,"Água limpa %d • suja %d"%[int(inventory.water),int(inventory.dirty_water)],Color("#4b7890")))
	v8_page_cards.add_child(_v17_status_card("FERIMENTOS",_v17_injury_summary(),"Sangramento, fratura e membros feridos alteram combate e viagem.",Color("#8c4d47")))
	v8_page_cards.add_child(_v17_status_card("ROUPA",equipped_clothing,"Condição %d%% • proteção climática ativa"%int(clothing_condition.get(equipped_clothing,100)),Color("#75684f")))
	v8_page_cards.add_child(_v17_status_card("FADIGA","%d / 100"%fatigue,"Sono e qualidade do abrigo determinam recuperação.",Color("#806e62")))
	v8_page_cards.add_child(_v17_status_card("ESTRESSE / MORAL","%d / 100 • moral %d"%[stress,morale],"Perdas, medo, relações e lazer mudam seu estado mental.",Color("#78637e")))
	_v8_clear_actions(v8_page_actions); _v17_side_note("ENFERMARIA","Sintomas têm duração e estágio. Diagnóstico, repouso, hidratação e medicamento importam.",160)
	_v17_side_button("TRATAR SINTOMAS",Callable(self,"_v12_treat_condition")); _v17_side_button("ROUPAS / CAMADAS",Callable(self,"_v14_show_clothing")); _v17_side_button("EXERCÍCIO / CORPO",Callable(self,"_show_body_panel")); _v17_side_button("PREVISÃO 3 DIAS",Callable(self,"_v15_show_forecast")); _v17_side_button("QUARENTENA",Callable(self,"_v15_show_shelter_health")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter"))

func _v15_forecast_for_offset(offset:int) -> Dictionary:
	# A previsão não altera o clima real. Ela usa estação, tendência atual e ruído
	# determinístico; equipamento melhor reduz a incerteza exibida ao jogador.
	var station_level:=int(facilities.get("weather_station",0))
	var seed_value:int=abs(int(hash("%s:%d:%d"%[season,day,offset])))+773
	var local_rng:RandomNumberGenerator=RandomNumberGenerator.new(); local_rng.seed=seed_value
	var meta:Dictionary=V12_SEASON_META.get(season,V12_SEASON_META["OUTONO"])
	var base_temp:int=int(round((float(meta.get("min",10))+float(meta.get("max",23)))/2.0))
	var trend:int=int(round(float(temperature-base_temp)*pow(0.55,float(offset))))
	var uncertainty:int=maxi(1,7-station_level*3)
	var temp_est:int=base_temp+trend+local_rng.randi_range(-uncertainty,uncertainty)
	var rain_base:int=int(meta.get("rain",45))
	var carry:int=12 if weather_severity>=2 and offset==1 else 0
	var rain_score:int=clampi(rain_base+carry+local_rng.randi_range(-18,18),3,95)
	var weather_est:String="SECO"
	if rain_score>=72: weather_est="TEMPORAL"
	elif rain_score>=48: weather_est="CHUVA"
	elif rain_score>=32: weather_est="GAROA"
	elif int(meta.get("min",10))<=6 and temp_est<=7: weather_est="FRIO SECO"
	var wind_est:int=clampi(int(round(float(wind_speed)*pow(0.58,float(offset))))+local_rng.randi_range(6,25),3,68)
	var confidence:int=clampi(35+station_level*28-offset*8,20,94)
	return {"day":day+offset,"weather":weather_est,"temperature":temp_est,"rain":rain_score,"wind":wind_est,"confidence":confidence}

func _v15_show_forecast() -> void:
	var station:=int(facilities.get("weather_station",0))
	var body:="[b]PREVISÃO DO ABRIGO[/b]\n"
	if station<=0:
		body += "Sem instrumentos, a previsão depende do rádio e da leitura do céu. Construa uma Estação meteorológica para reduzir a incerteza."
	else:
		body += "Sensores improvisados acompanham pressão, umidade e vento. Use a tendência para decidir quando viajar, caçar ou ficar em casa."
	_v8_show_page("world","PREVISÃO 3 DIAS","O TEMPO NÃO É FUNDO. É PARTE DO PLANO.",body,[["SAÚDE / AMBIENTE",Callable(self,"_v12_show_health_environment")],["CRAFTING",Callable(self,"_show_crafting_panel")],["RÁDIO / MUNDO",Callable(self,"_show_world_panel")],["ABRIGO",Callable(self,"_show_shelter")]])
	_v9_set_immersive_page(true); v8_page_bg.texture=SHELTER_TEX; v8_page_shade.color=Color(0.01,0.01,0.008,0.58)
	v8_page_body.size=Vector2(959,92); v8_page_cards.visible=true; v8_page_cards.columns=3; v8_page_cards.position=Vector2(28,138); v8_page_cards.size=Vector2(955,400)
	for c in v8_page_cards.get_children(): c.queue_free()
	for offset in range(1,4): v8_page_cards.add_child(_v15_make_forecast_card(offset,station))

func _v15_make_forecast_card(offset:int, station:int) -> Control:
	var f:=_v15_forecast_for_offset(offset); var weather_name:=str(f.get("weather","SECO")); var confidence:=int(f.get("confidence",30)); if station<=0: confidence=min(42,confidence)
	var border:=Color("#5a7280")
	if weather_name=="TEMPORAL": border=Color("#8d4b43")
	elif weather_name in ["CHUVA","GAROA"]: border=Color("#4f7182")
	elif weather_name=="FRIO SECO": border=Color("#7a8790")
	var card:=Panel.new(); card.custom_minimum_size=Vector2(300,330); card.add_theme_stylebox_override("panel",_flat(Color(0.025,0.026,0.026,0.92),border,8,2))
	var day_l:=Label.new(); day_l.position=Vector2(20,18); day_l.size=Vector2(250,42); day_l.text="DIA %d"%int(f.get("day",day+offset)); day_l.add_theme_font_size_override("font_size",28); day_l.add_theme_color_override("font_color",BONE); card.add_child(day_l)
	var icon_l:=Label.new(); icon_l.position=Vector2(20,68); icon_l.size=Vector2(255,46); icon_l.text={"TEMPORAL":"TEMPESTADE","CHUVA":"CHUVA FORTE","GAROA":"GAROA","FRIO SECO":"FRIO SECO"}.get(weather_name,weather_name); icon_l.add_theme_font_size_override("font_size",20); icon_l.add_theme_color_override("font_color",border.lightened(0.35)); card.add_child(icon_l)
	var temp_l:=Label.new(); temp_l.position=Vector2(20,125); temp_l.size=Vector2(250,54); temp_l.text="~%d°C"%int(f.get("temperature",temperature)); temp_l.add_theme_font_size_override("font_size",38); temp_l.add_theme_color_override("font_color",BONE); card.add_child(temp_l)
	var detail:=Label.new(); detail.position=Vector2(20,190); detail.size=Vector2(255,90); detail.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; detail.text="Chuva %d%%\nVento ~%d km/h\nConfiança %d%%"%[int(f.get("rain",0)),int(f.get("wind",0)),confidence]; detail.add_theme_font_size_override("font_size",16); detail.add_theme_color_override("font_color",Color("#c4b8a3")); card.add_child(detail)
	var note:=Label.new(); note.position=Vector2(20,286); note.size=Vector2(255,30); note.text="PLANEJE, NÃO CONFIE CEGAMENTE"; note.add_theme_font_size_override("font_size",10); note.add_theme_color_override("font_color",MUTED); card.add_child(note)
	return card

func _v15_survivor_health_text(p:Dictionary) -> String:
	_v7_normalize_survivor(p)
	var illness:=str(p.get("illness",""))
	if illness=="": return "SAUDÁVEL" + (" • ISOLADO" if bool(p.get("isolated",false)) else "")
	var sev:=clampi(int(p.get("illness_severity",1)),1,3)
	var stage:="LEVE" if sev==1 else ("MODERADO" if sev==2 else "GRAVE")
	return "%s • %s • %d dia(s)%s"%[illness,stage,int(p.get("illness_days",0))," • ISOLADO" if bool(p.get("isolated",false)) else ""]

func _v15_show_shelter_health() -> void:
	var body:="[b]SAÚDE DA COMUNIDADE[/b]  Enfermaria Nv.%d • conforto %d • tensão %d\nSelecione uma pessoa para isolar, tratar ou acompanhar a evolução dos sintomas."%[int(upgrades.get("infirmary",0)),shelter_comfort,community_tension]
	var actions:Array=[]
	if not survivors.is_empty():
		actions.append(["ISOLAR / LIBERAR",Callable(self,"_v15_toggle_isolation")]); actions.append(["TRATAR SELECIONADO",Callable(self,"_v15_treat_survivor")])
	actions.append(["COMUNIDADE",Callable(self,"_show_community_panel")]); actions.append(["ABRIGO",Callable(self,"_show_shelter")])
	_v8_show_page("community","ENFERMARIA / QUARENTENA","PROTEGER O GRUPO TAMBÉM SIGNIFICA SEPARAR PESSOAS",body,actions)
	_v9_set_immersive_page(true); v8_page_bg.texture=SHELTER_TEX; v8_page_shade.color=Color(0.01,0.01,0.008,0.67)
	v8_page_body.size=Vector2(959,82); v8_page_cards.visible=true; v8_page_cards.columns=3; v8_page_cards.position=Vector2(28,130); v8_page_cards.size=Vector2(955,430)
	for c in v8_page_cards.get_children(): c.queue_free()
	if survivors.is_empty():
		var empty:=Label.new(); empty.text="O abrigo está vazio. Não há ninguém para acompanhar."; empty.custom_minimum_size=Vector2(850,120); empty.add_theme_font_size_override("font_size",22); empty.add_theme_color_override("font_color",MUTED); v8_page_cards.add_child(empty); return
	selected_survivor_index=clampi(selected_survivor_index,0,survivors.size()-1)
	for i in range(survivors.size()):
		if bool(survivors[i].get("alive",true)): v8_page_cards.add_child(_v15_make_health_card(i))

func _v15_make_health_card(index:int) -> Button:
	var p:Dictionary=survivors[index]; _v7_normalize_survivor(p); var selected:=index==selected_survivor_index
	var illness:=str(p.get("illness","")); var sick:=illness!=""; var isolated:=bool(p.get("isolated",false)); var col:=Color("#8a4740") if sick else Color("#53735d"); if isolated: col=Color("#8a743f")
	var b:=Button.new(); b.custom_minimum_size=Vector2(300,350); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.025,0.023,0.021,0.95),col,7,3 if selected else 2)); b.add_theme_stylebox_override("hover",_flat(Color(0.07,0.055,0.044,0.98),col.lightened(0.18),7,3))
	var meta:=_v10_character_by_name(str(p.get("name",""))); var cid:=str(meta.get("id","starter")); if cid=="": cid="starter"
	var portrait:=TextureRect.new(); portrait.position=Vector2(18,18); portrait.size=Vector2(96,132); portrait.texture=_v12_portrait_texture(cid); portrait.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; portrait.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; portrait.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(portrait)
	var name_l:=Label.new(); name_l.position=Vector2(130,20); name_l.size=Vector2(150,38); name_l.text=str(p.get("name","?")); name_l.add_theme_font_size_override("font_size",24); name_l.add_theme_color_override("font_color",BONE); name_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(name_l)
	var role_l:=Label.new(); role_l.position=Vector2(130,60); role_l.size=Vector2(150,52); role_l.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; role_l.text=str(p.get("role","CIVIL")); role_l.add_theme_font_size_override("font_size",13); role_l.add_theme_color_override("font_color",MUTED); role_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(role_l)
	var state:=Label.new(); state.position=Vector2(18,170); state.size=Vector2(264,112); state.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; state.text=_v15_survivor_health_text(p); state.add_theme_font_size_override("font_size",17); state.add_theme_color_override("font_color",col.lightened(0.32)); state.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(state)
	var hint:=Label.new(); hint.position=Vector2(18,292); hint.size=Vector2(264,42); hint.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; hint.text="SELECIONADO" if selected else "TOQUE PARA ACOMPANHAR"; hint.add_theme_font_size_override("font_size",11); hint.add_theme_color_override("font_color",Color("#b6a98f")); hint.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(hint)
	b.pressed.connect(func(): selected_survivor_index=index; _v15_show_shelter_health()); return b

func _v15_next_health_survivor() -> void:
	if survivors.is_empty(): return
	selected_survivor_index=(selected_survivor_index+1)%survivors.size(); _v15_show_shelter_health()

func _v15_toggle_isolation() -> void:
	if survivors.is_empty(): return
	selected_survivor_index=clampi(selected_survivor_index,0,survivors.size()-1)
	var p:Dictionary=survivors[selected_survivor_index]; _v7_normalize_survivor(p)
	var new_state:=not bool(p.get("isolated",false)); p["isolated"]=new_state
	_v12_advance_time(10,"organizar isolamento",0.01,false)
	if new_state:
		p["stress"]=mini(100,int(p.get("stress",20))+5); p["trust"]=maxi(0,int(p.get("trust",40))-1)
		_add_event("QUARENTENA","%s foi separado do restante do abrigo."%str(p.get("name","Sobrevivente")))
	else:
		p["stress"]=maxi(0,int(p.get("stress",20))-2); _add_event("QUARENTENA","%s voltou às áreas comuns."%str(p.get("name","Sobrevivente")))
	_save_game(); _v15_show_shelter_health()

func _v15_treat_survivor() -> void:
	if survivors.is_empty(): return
	var p:Dictionary=survivors[clampi(selected_survivor_index,0,survivors.size()-1)]; _v7_normalize_survivor(p)
	if str(p.get("illness",""))=="": _toast("Essa pessoa não apresenta sintomas importantes."); return
	if inventory.med<=0: _toast("Faltam medicamentos."); return
	inventory.med-=1; _v12_advance_time(20,"cuidar de sobrevivente doente",0.01,false)
	var sev:=maxi(0,int(p.get("illness_severity",1))-1); p["illness_severity"]=sev; p["illness_days"]=0
	p["trust"]=mini(100,int(p.get("trust",40))+3); p["stress"]=maxi(0,int(p.get("stress",20))-5)
	if sev<=0:
		p["illness"]=""; p["isolated"]=false; _add_event("ENFERMARIA","%s melhorou e voltou à rotina."%str(p.get("name","Sobrevivente")))
	else: _add_event("ENFERMARIA","O tratamento reduziu os sintomas de %s."%str(p.get("name","Sobrevivente")))
	_save_game(); _v15_show_shelter_health()

func _v15_community_health_tick() -> void:
	if survivors.is_empty(): return
	var infectious:Array[Dictionary]=[]
	# O frio, abrigo lotado e exposição criam casos novos de forma contextual.
	for p in survivors:
		if not bool(p.get("alive",true)): continue
		_v7_normalize_survivor(p)
		var illness:=str(p.get("illness",""))
		if illness=="" and _v12_feels_like()<10 and shelter_comfort<35 and rng.randi_range(1,100)<=8:
			p["illness"]="RESFRIADO"; p["illness_severity"]=1; p["illness_days"]=0; illness="RESFRIADO"
			_add_event("SAÚDE DO ABRIGO","%s começou a tossir depois de uma noite fria."%str(p.get("name","Alguém")))
		if illness!="":
			p["illness_days"]=int(p.get("illness_days",0))+1
			var sev:=clampi(int(p.get("illness_severity",1)),1,3)
			var recover_bonus:=int(upgrades.get("infirmary",0))*12 + (10 if bool(p.get("isolated",false)) else 0)
			if int(p.get("illness_days",0))>=2 and rng.randi_range(1,100)<=18+recover_bonus:
				sev-=1; p["illness_days"]=0
				if sev<=0:
					p["illness"]=""; p["illness_severity"]=0; p["isolated"]=false
					_add_event("SAÚDE DO ABRIGO","%s se recuperou."%str(p.get("name","Alguém")))
					continue
			elif int(p.get("illness_days",0))>=3 and sev<3 and rng.randi_range(1,100)<=18:
				sev+=1; _add_event("SAÚDE DO ABRIGO","Os sintomas de %s pioraram."%str(p.get("name","Alguém")))
			p["illness_severity"]=sev
			if not bool(p.get("isolated",false)): infectious.append(p)
	# O protagonista resfriado também pode levar doença para áreas comuns.
	var source_count:=infectious.size() + (1 if diseases.has("RESFRIADO") else 0)
	if source_count>0:
		var infirmary_reduction:=int(upgrades.get("infirmary",0))*8
		for target in survivors:
			if not bool(target.get("alive",true)) or str(target.get("illness",""))!="" or bool(target.get("isolated",false)): continue
			var spread_chance:=clampi(5+source_count*5+maxi(0,survivor_count-4)*2-infirmary_reduction,2,35)
			if rng.randi_range(1,100)<=spread_chance:
				target["illness"]="RESFRIADO"; target["illness_severity"]=1; target["illness_days"]=0
				_add_event("CONTÁGIO","%s começou a apresentar sintomas. O abrigo pode precisar de isolamento."%str(target.get("name","Alguém")))
				if inventory.med<=0: _add_mission("medicine_%s"%str(target.get("name","survivor")).to_lower(),"REMÉDIO PARA O ABRIGO","Encontre medicamento antes que o quadro piore.",1,"Reduz risco de surto interno")
				break

func _v12_cross_flood() -> void:
	_v12_advance_time(18,"atravessar alagamento",0.45,true); wetness=mini(100,wetness+32)
	if rng.randi_range(1,100)<=20: injuries.leg=mini(100,int(injuries.leg)+8); _add_event("RUA","Você pisou num buraco escondido pela água e torceu a perna.")
	_v8_render_street("Você atravessa com água acima dos tornozelos. A roupa está mais pesada e o frio entra rápido.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_detour_flood() -> void:
	_v12_advance_time(28,"desviar do alagamento",0.22,true); _v8_render_street("O desvio leva quase meia hora, mas você mantém roupas e equipamento relativamente secos.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_take_weather_shelter() -> void:
	_v12_advance_time(35,"esperar o temporal",0.02,false); wetness=maxi(0,wetness-14); stress=maxi(0,stress-3); _v8_render_street("Você espera atrás de uma porta de metal enquanto o temporal bate no prédio. Quando sai, a rua mudou de som e de cheiro.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_push_storm() -> void:
	_v12_advance_time(12,"avançar no temporal",0.55,true); wetness=mini(100,wetness+28); body_temperature=maxf(34.0,body_temperature-0.18); fatigue=mini(100,fatigue+5); _v12_apply_condition_pressure(); _v8_render_street("Você continua curvado contra o vento. Ganhou alguns minutos, mas o corpo pagou por eles.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_warm_up() -> void:
	_v12_advance_time(25,"buscar abrigo do frio",0.02,false); body_temperature=minf(36.7,body_temperature+0.35); wetness=maxi(0,wetness-10); _v8_render_street("Você encontra um corredor protegido do vento e recupera parte da sensibilidade nas mãos.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_cool_down() -> void:
	if inventory.water<=0: _toast("Você não tem água limpa."); return
	inventory.water-=1; thirst=maxi(0,thirst-22); _v12_advance_time(20,"descansar do calor",0.0,false); body_temperature=maxf(36.7,body_temperature-0.25); _v8_render_street("Você bebe devagar e espera na sombra. A pressa diminui, mas sua cabeça volta a funcionar direito.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_examine_sick_survivor() -> void:
	_v12_advance_time(10,"examinar sobrevivente",0.02,true); var med:=int(skills.get("medicine",0)); var text:="Febre, tosse e fraqueza. Você não consegue concluir muito." if med<2 else "Febre e desidratação, sem sinais de mordida. Parece uma infecção respiratória comum agravada pela exposição."
	_v8_render_street("[b]AVALIAÇÃO[/b]\n\n"+text,[["DAR REMÉDIO",Callable(self,"_v12_medicate_stranger")],["DAR ÁGUA",Callable(self,"_v12_help_stranger")],["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_medicate_stranger() -> void:
	if inventory.med<=0: _toast("Sem remédios para oferecer."); return
	inventory.med-=1; _v12_advance_time(6,"ajudar sobrevivente doente",0.01,true); morale=mini(100,morale+3); _v12_daily_add("help",1); _add_event("RUA","Você deixou um remédio com um desconhecido febril."); _v13_schedule_delayed("sick_stranger",day+rng.randi_range(3,7),{}); _v8_render_street("A pessoa segura o comprimido como se fosse ouro. Ela promete lembrar do seu abrigo se conseguir atravessar a semana.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_clear_debris() -> void:
	var mins:=maxi(12,30-int(strength/6)); _v12_advance_time(mins,"remover entulho",0.55,true); materials.wood+=1; fatigue=mini(100,fatigue+5); _add_event("RUA","Você abriu uma passagem e separou madeira aproveitável."); _v8_render_street("Depois de esforço e muito barulho, existe espaço suficiente para passar. Você recupera uma peça de madeira útil.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v12_treat_condition() -> void:
	if diseases.is_empty(): _toast("Nenhum sintoma importante para tratar."); return
	var target:=str(diseases.keys()[0]); var needs_antibiotic:=target=="INFECÇÃO DE FERIDA"
	if needs_antibiotic and inventory.antibiotic<=0: _toast("Essa condição pede antibiótico e cuidados de ferida."); return
	if not needs_antibiotic and inventory.med<=0: _toast("Você não tem medicamento adequado."); return
	if needs_antibiotic: inventory.antibiotic-=1
	else: inventory.med-=1
	_v12_advance_time(30,"tratar sintomas",0.0,false); var sev:=maxi(0,int(diseases[target])-1)
	if sev<=0: diseases.erase(target); v14_disease_days.erase(target)
	else: diseases[target]=sev; v14_disease_days[target]=0
	life=mini(100,life+6); energy=mini(100,energy+5); _add_event("SAÚDE","Você tratou %s e reservou tempo para recuperação."%target); _save_game(); _v12_show_health_environment()

func _v12_treat_dirty_water() -> void:
	if int(inventory.get("dirty_water",0))<=0: _toast("Sem água para tratar."); return
	var can_filter:=int(upgrades.get("filter",0))>0 or int(facilities.get("rain_collector",0))>0
	if not can_filter and int(materials.get("wood",0))<=0 and int(inventory.get("fuel",0))<=0:
		_toast("Precisa de filtro, madeira ou combustível."); return
	if can_filter:
		_v12_advance_time(12,"filtrar água",0.02,true)
	elif int(materials.wood)>0:
		materials.wood-=1; _v12_advance_time(25,"ferver água",0.04,true)
	else:
		inventory.fuel-=1; _v12_advance_time(20,"ferver água",0.03,true)
	var amount:=mini(2,int(inventory.dirty_water)); inventory.dirty_water-=amount; inventory.water+=amount
	_add_event("ÁGUA","Você tratou %d recipiente(s) de água."%amount); _update_all(); _save_game(); _show_inventory_panel()

func _v12_drink_dirty_water() -> void:
	if int(inventory.get("dirty_water",0))<=0: _toast("Sem água não tratada."); return
	inventory.dirty_water-=1; thirst=maxi(0,thirst-24); _v12_advance_time(2,"beber água não tratada",0.0,true)
	var risk:=35 + (20 if int(world_state.get("water_safety",100))<50 else 0) - int(skills.get("survival",0))*4
	if rng.randi_range(1,100)<=risk:
		diseases["INTOXICAÇÃO"] = maxi(1,int(diseases.get("INTOXICAÇÃO",0))); stomach_sick=maxi(stomach_sick,2); _add_event("DOENÇA","A água não tratada cobrou o preço: náusea e fraqueza começaram horas depois.")
	else: _add_event("ÁGUA","Você arriscou beber sem tratar e, por enquanto, não sentiu sintomas.")
	_update_all(); _save_game(); _show_inventory_panel()


func _run_v15_qa() -> void:
	_start_new_game(false); var failures:Array[String]=[]
	# Estação meteorológica deve melhorar confiança e existir como receita.
	if not V7_RECIPES.has("weather_station"): failures.append("weather_recipe")
	var no_station:=_v15_forecast_for_offset(1); facilities["weather_station"]=1; var with_station:=_v15_forecast_for_offset(1)
	if int(with_station.get("confidence",0))<=int(no_station.get("confidence",0)): failures.append("forecast_confidence")
	# Saúde coletiva: isolamento deve reduzir fonte de contágio e tratamento reduzir gravidade.
	survivors=[_v7_make_survivor("MARA","AGRICULTORA",65),_v7_make_survivor("IVO","MECÂNICO",60)]; survivor_count=3
	survivors[0].illness="RESFRIADO"; survivors[0].illness_severity=2; survivors[0].illness_days=2; survivors[0].isolated=true
	inventory.med=2; selected_survivor_index=0; _v15_treat_survivor()
	if int(survivors[0].get("illness_severity",0))>=2: failures.append("survivor_treatment")
	# Save/load deve preservar campos novos dos sobreviventes e facility.
	survivors[0].illness="RESFRIADO"; survivors[0].illness_severity=1; survivors[0].isolated=true; facilities.weather_station=1; _save_game()
	survivors[0].illness=""; survivors[0].isolated=false; facilities.weather_station=0
	if not _load_game(): failures.append("load")
	if str(survivors[0].get("illness",""))!="RESFRIADO" or not bool(survivors[0].get("isolated",false)) or int(facilities.get("weather_station",0))!=1: failures.append("v15_state")
	print("V15_QA forecast=%d%% station=%d survivor=%s isolated=%s failures=%s"%[int(with_station.get("confidence",0)),int(facilities.get("weather_station",0)),str(survivors[0].get("illness","")),str(survivors[0].get("isolated",false)),str(failures)])
	get_tree().quit(0 if failures.is_empty() else 2)

func _run_v12_qa() -> void:
	_start_new_game(false); var failures:Array[String]=[]
	minute=35; var before:=_v12_clock_minutes(); _v12_advance_time(50,"qa",0.2,true); if _v12_clock_minutes()!=before+50: failures.append("clock")
	season="INVERNO"; temperature=5; wind_speed=35; wetness=80; body_temperature=35.0; _v12_apply_condition_pressure(); if not diseases.has("HIPOTERMIA"): failures.append("hypothermia")
	var est:=_v12_travel_estimate("HOSPITAL","AVENIDA"); if float(est.distance)<4.0 or int(est.minutes)<=0: failures.append("travel_estimate")
	profile_daily_key=""; _v12_ensure_daily_missions(); if profile_daily_missions.size()!=3: failures.append("daily_count")
	var xp_before:=profile_xp; for m in profile_daily_missions: if str(m.stat)=="rooms": _v12_daily_add("rooms",float(m.target)); break
	if profile_xp<xp_before: failures.append("daily_xp")
	_save_game(); var m_before:=minute; minute=0; if not _load_game() or minute!=m_before: failures.append("save_minute")
	print("V12_QA clock=%s weather=%s wind=%d diseases=%d distance=%.1f daily=%d failures=%s"%[_v12_clock_text(),weather,wind_speed,diseases.size(),float(est.distance),profile_daily_missions.size(),str(failures)])
	get_tree().quit(0 if failures.is_empty() else 2)

func _run_v11_qa() -> void:
	var failures:Array[String]=[]
	selected_character_id="starter"; profile_unlocked_characters=["starter"]; _start_new_game(false)
	if V10_CHARACTERS.size()<20: failures.append("characters_%d"%V10_CHARACTERS.size())
	if _v11_player_path()!="CIVIL COMUM": failures.append("starter_path")
	skills.carpentry=2; if not _v11_player_path().contains("CARPINTARIA"): failures.append("profession_path")
	survivors=[_v7_make_survivor("MARA","AGRICULTORA",65),_v7_make_survivor("NINA","COZINHEIRA",62)]; survivor_count=3; inventory.food=8; inventory.water=8; actions_left=3
	var coh_before:=community_cohesion; _v11_do_routine("meal"); if community_cohesion<=coh_before: failures.append("routine_cohesion")
	if routine_history.is_empty() or community_memories.is_empty(): failures.append("routine_memory")
	_v11_daily_community_scene(); if last_community_scene=="": failures.append("daily_scene")
	profile_legacy={"best_day":0,"best_bosses":0,"best_kills":0,"campaigns_started":1}; day=17; bosses_defeated=1; infected_kills=33; _v11_update_legacy(); if int(profile_legacy.best_day)!=17 or int(profile_legacy.best_bosses)!=1: failures.append("legacy")
	_save_game(); community_cohesion=0; routine_history=[]; if not _load_game(): failures.append("save_load")
	if community_cohesion<=0 or routine_history.is_empty(): failures.append("v11_save_state")
	print("V11_QA characters=%d path=%s cohesion=%d memories=%d legacy_day=%d failures=%s"%[V10_CHARACTERS.size(),_v11_player_path(),community_cohesion,community_memories.size(),int(profile_legacy.best_day),str(failures)])
	get_tree().quit(0 if failures.is_empty() else 2)

func _run_v10_qa() -> void:
	var failures:Array[String]=[]
	selected_character_id="starter"; profile_unlocked_characters=["starter"]; _start_new_game(false)
	if V10_CHARACTERS.size()<13: failures.append("catalog_size")
	var starter:=_v10_get_selected_character(); if str(starter.rarity)!="COMUM" or str(starter.role)!="CIVIL": failures.append("starter_profile")
	if inventory.food!=0 or inventory.water!=0 or inventory.pistol!=0: failures.append("starter_items")
	if not skills.has("mechanics") or int(skills.mechanics)!=0: failures.append("starter_skills")
	var mara:=_v7_make_survivor("MARA","AGRICULTORA",66); survivors=[mara]; survivor_count=2; _v10_personal_story_tick()
	var found_story:=false
	for m in missions:
		if str(m.get("id",""))=="story_mara": found_story=true
	if not found_story: failures.append("personal_story")
	_v10_check_personal_missions("FAZENDA")
	if not bool(mara.get("secret_known",false)): failures.append("story_completion")
	master_volume=0.63; ambience_volume=0.51; radio_volume=0.47; _save_profile_settings(); _apply_audio_settings()
	_menu_settings(); _v10_close_menu_overlay(); if not game_layer.visible or menu_layer.visible: failures.append("settings_return")
	_save_game(); var char_before:=selected_character_id; selected_character_id="starter"; if not _load_game(): failures.append("save_load")
	if selected_character_id!=char_before: failures.append("character_save")
	print("V11_QA characters=%d starter=%s stories=%s volumes=%d/%d/%d failures=%s"%[V10_CHARACTERS.size(),str(starter.role),str(found_story),int(master_volume*100),int(ambience_volume*100),int(radio_volume*100),str(failures)])
	get_tree().quit(0 if failures.is_empty() else 2)

func _run_v9_qa() -> void:
	_start_new_game(false); var failures:Array[String]=[]
	var room_total:=0; for k in LOCATION_ROOMS: room_total+=LOCATION_ROOMS[k].size()
	if room_conditions.size()!=room_total: failures.append("room_conditions_%d/%d"%[room_conditions.size(),room_total])
	var lock_key:="DELEGACIA|ARSENAL"; if not bool(room_conditions.get(lock_key,{}).get("locked",false)): failures.append("arsenal_not_locked")
	tools.wrench=true; skills.mechanics=2; _v9_unlock_room("DELEGACIA","ARSENAL","skill"); if bool(room_conditions[lock_key].locked): failures.append("unlock_failed")
	_v9_add_food("carne_fresca",1); var food_before:=detailed_food.size(); _v9_food_daily(); if detailed_food.size()!=food_before or int(detailed_food[0].days_left)!=0: failures.append("food_tick")
	day=8; _v9_world_event_tick(); if not bool(global_events_active.get("water_warning",false)) and not bool(global_events_active.get("grid_failure",false)): failures.append("world_event")
	survivors=[_v7_make_survivor("MARA","AGRICULTORA",65),_v7_make_survivor("IVO","MECÂNICO",60)]; survivor_count=3; survivor_tasks["MARA"]="HORTA"; survivor_tasks["IVO"]="OFICINA"; farm.planted=1; var scrap_before:=int(inventory.scrap); _v9_survivor_work_daily(); if int(farm.growth)<=0: failures.append("worker_farm"); if int(inventory.scrap)<scrap_before: failures.append("worker_scrap")
	_save_game(); var rc_before:=room_conditions.size(); room_conditions={}; detailed_food=[]; survivor_tasks={}; if not _load_game(): failures.append("load")
	if room_conditions.size()!=rc_before: failures.append("room_save")
	if detailed_food.is_empty(): failures.append("food_save")
	print("V9_QA rooms=%d food=%d events=%d failures=%s"%[room_conditions.size(),detailed_food.size(),global_events_active.size(),str(failures)])
	get_tree().quit(0 if failures.is_empty() else 2)

func _run_v8_qa() -> void:
	_start_new_game(false)
	var failures:Array[String]=[]
	if CITY_LOCATIONS.size()<24: failures.append("city_locations")
	var room_total:=0
	for k in LOCATION_ROOMS: room_total+=LOCATION_ROOMS[k].size()
	if room_total<140: failures.append("room_total_%d"%room_total)
	if inventory.food!=0 or inventory.water!=0 or inventory.med!=0: failures.append("new_game_not_zero")
	_search_shelter()
	# Travel state and a deterministic street choice.
	_v8_prepare_travel("SUPERMERCADO"); _v8_start_travel("BECOS")
	if not v8_travel_active or v8_travel_destination!="SUPERMERCADO": failures.append("travel_start")
	var old_fatigue:=fatigue; _v8_next_segment(); if fatigue<=old_fatigue: failures.append("travel_cost")
	# Direct arrival for room persistence QA.
	v8_travel_segment=int(V8_ROUTE_DATA["BECOS"].segments)+1; _v8_arrive(); if active_location!="SUPERMERCADO": failures.append("arrival")
	var room:=str(LOCATION_ROOMS["SUPERMERCADO"][0]); var result:=_complete_room_search("SUPERMERCADO",room)
	if not bool(room_states.get("SUPERMERCADO|"+room,false)): failures.append("room_persistence")
	# Page separation.
	_show_inventory_panel(); if not v8_page_layer.visible or scene_frame.visible: failures.append("inventory_page")
	_show_shelter(); if v8_page_layer.visible or not scene_frame.visible: failures.append("shelter_return")
	print("V8_QA locations=%d rooms=%d street=%s room_result=%s failures=%s"%[CITY_LOCATIONS.size(),room_total,"OK" if v8_travel_destination=="SUPERMERCADO" else "FAIL",result,str(failures)])
	get_tree().quit(0 if failures.is_empty() else 2)

func _v7_qa_seed() -> void:
	materials.wood=12; materials.nails=8; materials.steel=10; materials.copper=6; materials.wire=8; materials.leather=4; materials.chemicals=4; materials.mechanical=6; materials.seeds=4; materials.salt=3; materials.coal=3; inventory.scrap=15; inventory.water=20; inventory.food=20; inventory.fuel=5; inventory.battery=4; inventory.electronics=4; animals.feed=8
	upgrades.workbench=2; facilities.workbench=1
	for id in V7_BOOKS: found_books[id]=true; known_books[id]=true
	for id in V7_RECIPES: known_recipes[id]=true
	for k in skills: skills[k]=2
	if survivors.is_empty(): survivors=[_v7_make_survivor("DAVI","SOCORRISTA",72,"PROCURA A IRMÃ"),_v7_make_survivor("LÚCIA","BATEDORA",58,"EX-INTEGRANTE DA VIGÍLIA")]; survivor_count=3
	facilities.animal_pen=1; facilities.garden=1; farm.plots=2; animals.chickens=3; animals.rabbits=2; animals.dog=1; vehicles.BICICLETA.found=true; vehicles.BICICLETA.condition=70

func _run_v7_qa() -> void:
	_start_new_game(false); _v7_qa_seed()
	var initial_weight:=body_weight; _v7_consume_calories(900,35,10,"QA"); _v7_exercise("strength"); _v7_daily_tick()
	if body_weight==initial_weight: push_error("V7_QA_BODY_FAIL"); get_tree().quit(2); return
	var book_id:="metalurgia_1"; known_books.erase(book_id); found_books[book_id]=true; actions_left=3; _v7_read_book(book_id)
	if not bool(known_books.get(book_id,false)): push_error("V7_QA_BOOK_FAIL"); get_tree().quit(2); return
	known_recipes["wood_spear"]=true; materials.wood=3; materials.cloth=2; var before_items:=special_items.size(); _craft_v7("wood_spear")
	if special_items.size()<=before_items: push_error("V7_QA_CRAFT_FAIL"); get_tree().quit(2); return
	actions_left=3; wildlife_density=80; _v7_hunt(); facilities.animal_pen=1; actions_left=3; _v7_search_animals()
	if not factions.has("VIGÍLIA") or not vehicles.has("CARRO"): push_error("V7_QA_WORLD_FAIL"); get_tree().quit(2); return
	if survivors.is_empty(): push_error("V7_QA_SOCIAL_FAIL"); get_tree().quit(2); return
	_save_game(); var snap_weight:=body_weight; body_weight=50.0
	if not _load_game() or abs(body_weight-snap_weight)>0.01: push_error("V7_QA_SAVE_FAIL"); get_tree().quit(2); return
	print("V7_QA_OK body=",body_weight," skills=",skills.size()," recipes=",known_recipes.size()," books=",known_books.size()," survivors=",survivors.size()," items=",special_items.size()); get_tree().quit(0)

func _run_campaign_qa() -> void:
	_start_new_game(false)
	_search_shelter()
	inventory.food = 120; inventory.water = 120; inventory.med = 20; inventory.scrap = 50; inventory.cloth = 30; inventory.ammo = 40; inventory.pistol = 1
	equipped_firearm = "PISTOLA"
	for simulated_day in range(2, 27):
		day = simulated_day
		_evolve_city()
		_unlock_districts()
		if simulated_day % 4 == 0:
			_gain_xp(35)
	if _mutation_tier() != 4:
		push_error("QA_CAMPAIGN_MUTATION_FAIL tier=" + str(_mutation_tier()))
		get_tree().quit(2); return
	var infested := 0
	var nests := 0
	for name in location_states:
		var state := str(location_states[name].get("status",""))
		if state == "INFESTADO": infested += 1
		elif state == "NINHO": nests += 1
	if infested + nests <= 0:
		push_error("QA_CAMPAIGN_CITY_STATE_FAIL")
		get_tree().quit(2); return
	_save_game()
	if not _load_game():
		push_error("QA_CAMPAIGN_SAVE_FAIL")
		get_tree().quit(2); return
	print("QA_CAMPAIGN_PASS day=", day, " tier=", _mutation_tier(), " pressure=", mutation_pressure, " infested=", infested, " nests=", nests, " level=", survivor_level)
	get_tree().quit()

func _run_qa() -> void:
	_start_new_game(false)
	# Novo jogo deve realmente começar do zero.
	for key in ["knife","pistol","ammo","food","water","med","scrap","cloth"]:
		if int(inventory.get(key,-1)) != 0:
			push_error("QA_NEW_GAME_RESET_FAIL item=" + key)
			get_tree().quit(2); return
	_search_shelter()
	if inventory.knife != 1 or not bool(event_flags.get("shelter_searched",false)):
		push_error("QA_SHELTER_SEARCH_FAIL")
		get_tree().quit(2); return
	# Mapa/cidade e salas persistentes.
	_show_map()
	if location_cards.size() != 24:
		push_error("QA_CITY_MAP_FAIL cards=" + str(location_cards.size()))
		get_tree().quit(2); return
	_complete_room_search("SUPERMERCADO", "ENTRADA")
	if not bool(room_states.get("SUPERMERCADO|ENTRADA",false)):
		push_error("QA_ROOM_STATE_FAIL")
		get_tree().quit(2); return
	# Progressão e distrito.
	visited["SUPERMERCADO"] = 1; visited["FARMÁCIA"] = 1; visited["ESCOLA"] = 1
	_unlock_districts()
	if not bool(discovered_districts.get("CENTRO",false)):
		push_error("QA_DISTRICT_UNLOCK_FAIL")
		get_tree().quit(2); return
	# Combate por turnos e mutação.
	var test_enemy := {"name":"CORREDOR","tier":2,"hp":10,"damage":1,"trait":"ataca primeiro"}
	_fight_enemy(test_enemy, "SUPERMERCADO", false)
	_combat_melee()
	if infected_kills < 1:
		push_error("QA_COMBAT_FAIL")
		get_tree().quit(2); return
	# Boss deve alterar progressão do mundo.
	mutation_pressure = 25
	_add_mission("boss_uivador", "O SOM NO CENTRO", "Teste", 1, "Teste")
	var test_boss := {"name":"O UIVADOR","tier":2,"hp":8,"damage":1,"trait":"chama infectados","reward_xp":90,"reward":"Chave do Centro"}
	_fight_enemy(test_boss, "CENTRO", true)
	# V18 introduziu distância tática; o Uivador começa LONGE.
	# Este QA testa a progressão após a vitória, não o reposicionamento.
	v18_combat_range = 1
	_combat_melee()
	if bosses_defeated < 1 or not bool(discovered_districts.get("ZONA INDUSTRIAL",false)):
		push_error("QA_BOSS_PROGRESS_FAIL")
		get_tree().quit(2); return
	# Eventos/sobreviventes/crafting/melhorias.
	inventory.food = 3; _accept_mechanic(); _close_modal()
	inventory.cloth = 4; _craft_bandage()
	inventory.scrap = 12; _upgrade("fence")
	_show_survivors_panel(); _show_research_panel(); _show_inventory_panel(); _show_missions_panel(); _show_journal_panel(); _show_map(); _show_shelter()
	# Save/load precisa manter a campanha V9.
	_save_game()
	var saved_day := day
	day = 99
	if not _load_game() or day != saved_day:
		push_error("QA_SAVE_LOAD_FAIL")
		get_tree().quit(2); return
	await get_tree().process_frame
	var disconnected: Array[String] = []
	var button_nodes := find_children("*", "Button", true, false)
	var connected_count := 0
	for node in button_nodes:
		var btn := node as Button
		if btn == null: continue
		if btn.get_signal_connection_list(&"pressed").is_empty(): disconnected.append(str(btn.name))
		else: connected_count += 1
	if not disconnected.is_empty():
		push_error("QA_CLICKABILITY_FAIL disconnected=" + str(disconnected))
		get_tree().quit(2); return
	print("QA_NEW_GAME_RESET_PASS")
	print("QA_ROOM_STATE_PASS rooms=147 map_cards=", location_cards.size())
	print("QA_COMBAT_PASS kills=", infected_kills, " bosses=", bosses_defeated)
	print("QA_CLICKABILITY_PASS connected_buttons=", connected_count)
	print("QA_SAVE_LOAD_PASS version=13 day=", day, " level=", survivor_level, " mutation=", mutation_pressure)
	get_tree().quit()


# -----------------------------------------------------------------------------
# AFTERFALL V18 — exploração narrativa, preparo de expedição e combate tático
# -----------------------------------------------------------------------------
func _v18_reset_systems() -> void:
	v18_story_flags={}; v18_special_rooms_seen={}; v18_route_experience={}; v18_location_knowledge={}; v18_last_prep_score=0; v18_last_prep_notes=[]; v18_combat_range=2; v18_cover=0; v18_aim_bonus=0; v18_guarding=false

func _v18_route_key(location_name:String,route:String) -> String:
	return "%s|%s"%[location_name,route]

func _v18_route_xp(location_name:String,route:String) -> int:
	return int(v18_route_experience.get(_v18_route_key(location_name,route),0))

func _v18_gain_route_xp(location_name:String,route:String) -> void:
	if location_name=="" or route=="": return
	var key:=_v18_route_key(location_name,route); v18_route_experience[key]=mini(8,int(v18_route_experience.get(key,0))+1)

func _v18_expedition_preparation(location_name:String) -> Dictionary:
	var score:=22; var notes:Array[String]=[]; var distance:=float(V12_LOCATION_DISTANCE_KM.get(location_name,1.0)); var spec:Dictionary=CITY_LOCATIONS.get(location_name,{"risk":20}); var water_l:=float(inventory.water)*0.5
	if water_l>=maxf(0.5,distance*0.22): score+=16; notes.append("água suficiente")
	else: notes.append("pouca água")
	if inventory.food>0: score+=6
	else: notes.append("sem comida")
	if inventory.bandage>0 or inventory.med>0: score+=8
	else: notes.append("sem primeiros socorros")
	if equipped_melee!="MÃOS" or inventory.knife>0: score+=8
	else: notes.append("sem arma confiável")
	if equipped_firearm!="NENHUMA" and inventory.ammo>=3: score+=8
	if _total_weight()<=_max_weight(): score+=8
	else: notes.append("sobrecarga")
	if fatigue<55 and energy>45: score+=8
	else: notes.append("corpo cansado")
	if life>=70: score+=6
	if _v12_is_night(): score-=12; notes.append("saída noturna")
	var until_dark:=sunset_minute-_v12_clock_minutes(); if until_dark<180 and until_dark>0: score-=5; notes.append("pouca luz restante")
	if weather_severity>=2: score-=6; notes.append("clima severo")
	if int(spec.get("risk",20))>=60: score-=6
	var familiarity:=int(v18_location_knowledge.get(location_name,0)); if familiarity>0: score+=mini(8,familiarity*2); notes.append("local conhecido %d"%familiarity)
	var cloth:=_v14_clothing_meta(); if weather in ["CHUVA","TEMPORAL"] and int(cloth.get("waterproof",0))>=2: score+=5
	if _v12_feels_like()<=8 and int(cloth.get("warmth",0))>=2: score+=5
	score=clampi(score,0,100); var grade:="PRONTO" if score>=75 else ("ACEITÁVEL" if score>=55 else ("ARRISCADO" if score>=35 else "MAL PREPARADO"))
	if notes.is_empty(): notes.append("equipamento equilibrado")
	return {"score":score,"grade":grade,"notes":notes}

func _v18_try_special_room(location_name:String,room_name:String) -> bool:
	var key:="%s|%s"%[location_name,room_name]
	if not V18_SPECIAL_ROOMS.has(key): return false
	if bool(v18_special_rooms_seen.get(key,false)): return false
	var meta:Dictionary=V18_SPECIAL_ROOMS[key]; var skill:=str(meta.get("skill","survival")); var level:=int(skills.get(skill,0)); var read:=_v18_skill_read(skill,level,str(meta.get("kind","document")))
	var actions:Array=[
		["OBSERVAR / INTERPRETAR • 15 MIN",func(): _v18_resolve_special_room(location_name,room_name,"study")],
		["AGIR AGORA • 25 MIN",func(): _v18_resolve_special_room(location_name,room_name,"act")],
		["DEIXAR COMO ESTÁ",func(): _v18_resolve_special_room(location_name,room_name,"leave")]
	]
	_v8_show_page("journal","%s • %s"%[location_name,room_name],str(meta.get("title","ALGO DIFERENTE AQUI")),str(meta.get("text",""))+"\n\n[color=#b59a6a]O que você entende:[/color] "+read,actions); _v9_set_immersive_page(true); v8_page_bg.texture=_v8_location_texture(location_name); return true

func _v18_skill_read(skill:String,level:int,kind:String) -> String:
	if level<=0:
		return "Você percebe que isso importa, mas não sabe exatamente por quê."
	match kind:
		"medical": return "Há sinais clínicos e decisões de tratamento que um leigo provavelmente ignoraria." if level>=2 else "Você reconhece material médico e sinais de uso recente."
		"mechanics": return "O conjunto pode ser recuperado sem destruir as peças principais." if level>=2 else "Algumas peças ainda parecem aproveitáveis."
		"power": return "Você consegue separar circuito, carga e risco de retorno de energia." if level>=2 else "A rede ainda pode ter energia residual."
		"mutation", "origin": return "A contaminação não parece aleatória: existem padrões de coleta, transporte e isolamento." if level>=2 else "Há material biológico que não deveria estar aqui."
		"signal": return "A repetição tem estrutura; provavelmente é uma transmissão intencional." if level>=2 else "O padrão não parece ruído."
		"farming": return "A conservação foi feita para atravessar mais de uma estação." if level>=2 else "As sementes parecem viáveis."
		"hunting": return "O mapa diferencia rotas de presa, água e predadores." if level>=2 else "As marcas são recentes."
		"weapons": return "O armamento foi armazenado para retirada, não abandonado ao acaso." if level>=2 else "Há munição que ainda pode servir."
		_: return "Você consegue relacionar parte dessas pistas com outros lugares da cidade." if level>=2 else "Você identifica detalhes que valem ser anotados."

func _v18_resolve_special_room(location_name:String,room_name:String,choice:String) -> void:
	var key:="%s|%s"%[location_name,room_name]; if not V18_SPECIAL_ROOMS.has(key): _search_room(location_name,room_name); return
	var meta:Dictionary=V18_SPECIAL_ROOMS[key]; var kind:=str(meta.get("kind","document")); var skill:=str(meta.get("skill","survival")); var level:=int(skills.get(skill,0)); var chain:=str(meta.get("chain",""))
	if choice=="leave":
		v18_special_rooms_seen[key]=true; _add_event(location_name,"Você deixou %s sem mexer no que encontrou."%room_name); _search_room(location_name,room_name); return
	_v12_advance_time(15 if choice=="study" else 25,"examinar %s"%room_name.to_lower(),0.12,true); _v7_gain_skill(skill,3 if choice=="study" else 5); var careful:=choice=="study" or level>=2
	match kind:
		"food":
			materials.salt+=1; materials.preserved_meat+=1 if careful else 0; inventory.food+=1; _add_event(location_name,"Você recuperou alimento preservado e material de conservação.")
		"medical":
			inventory.bandage+=1
			if careful:
				inventory.med+=1
			else:
				stress=mini(100,stress+2)
			_add_event(location_name,"O material médico aproveitável foi separado do que já estava contaminado.")
		"mechanics":
			materials.mechanical+=2 if careful else 1; materials.scrap+=1; if chain=="vehicle_parts_end": _v7_add_special_item("CONJUNTO DE PEÇAS DA CAMINHONETE","VEÍCULO",78,"RARO"); _add_event(location_name,"Peças úteis foram recuperadas sem desmontar tudo às cegas.")
		"human":
			morale=mini(100,morale+2); community_cohesion=mini(100,community_cohesion+1); _add_event(location_name,"O lugar conta uma história de pessoas, não apenas de recursos.")
		"document":
			lore_archive.append("Dia %d — %s / %s: %s"%[day,location_name,room_name,str(meta.get("title","Documento"))]); research_points+=1; _add_event("ARQUIVO","Uma nova peça da cronologia foi registrada.")
		"weapons":
			inventory.ammo+=rng.randi_range(2,5); if careful and inventory.pistol<=0: inventory.pistol=1; equipped_firearm="PISTOLA" if inventory.pistol>0 and equipped_firearm=="NENHUMA" else equipped_firearm
		"signal":
			radio_signal=mini(100,radio_signal+6); research_points+=1; _add_event("RÁDIO","Você anotou uma frequência e uma direção aproximada.")
		"mutation", "origin":
			inventory.samples+=1; research_points+=2 if careful else 1; infection=mini(100,infection+(0 if careful else 2)); _add_event("PESQUISA","Uma amostra e novas pistas sobre a origem foram registradas.")
		"power":
			materials.copper+=2; materials.electronics+=1; if careful: world_state.power_grid=mini(100,int(world_state.power_grid)+4); _add_event("ENERGIA","O diagrama da rede agora faz mais sentido.")
		"farming":
			materials.seeds+=2; animals.feed+=1; _add_event("FAZENDA","Sementes e técnicas de conservação entraram no planejamento do abrigo.")
		"hunting":
			wildlife_density=mini(100,wildlife_density+4); _add_event("CAÇA","Rotas de animais e pontos de água foram adicionados ao mapa.")
		"finale":
			mutation_pressure=mini(100,mutation_pressure+4); research_points+=3
	v18_special_rooms_seen[key]=true; v18_story_flags[chain]=true if chain!="" else true; _v18_apply_chain_outcome(chain); _v18_chain_followup(chain); _v18_mark_chain_progress(location_name,room_name); _v19_unlock_blueprint_from_discovery(location_name,room_name,chain); _add_event(location_name,"Descoberta em %s: %s"%[room_name,str(meta.get("title","pista"))]); _save_game(); _search_room(location_name,room_name)

func _v18_apply_chain_outcome(chain:String) -> void:
	# End-of-chain discoveries change the campaign instead of becoming disposable flavor text.
	match chain:
		"patient_302_end":
			inventory.antibiotic+=2; morale=mini(100,morale+2); research_points+=1; _add_event("HISTÓRIA","O prontuário do 302 fecha o caso da Farmácia. Os antibióticos restantes voltam para o abrigo.")
		"school_survivor_end":
			community_cohesion=mini(100,community_cohesion+5); community_tension=maxi(0,community_tension-3); _add_event("COMUNIDADE","Os nomes da Igreja explicam quem passou pela Escola. A comunidade entende parte daquela fuga.")
		"evac_order_end":
			v18_route_experience[_v18_route_key("ESTAÇÃO","BECOS")]=maxi(4,int(v18_route_experience.get(_v18_route_key("ESTAÇÃO","BECOS"),0))); v18_route_experience[_v18_route_key("TÚNEIS","BECOS")]=maxi(3,int(v18_route_experience.get(_v18_route_key("TÚNEIS","BECOS"),0))); _add_event("MAPA","A Rota 17-B virou um atalho real no seu mapa.")
		"sample_14_end":
			research_points+=3; mutation_pressure=maxi(0,mutation_pressure-4); _add_event("PESQUISA","As cápsulas dos Túneis confirmam a ligação com a Gaveta 14. Parte do padrão de mutação agora é previsível.")
		"surgery_grid_end":
			city_projects["power"]=true; world_state.power_grid=mini(100,int(world_state.get("power_grid",0))+18); radio_signal=mini(100,radio_signal+8); _add_event("ENERGIA","A Subestação voltou a alimentar linhas essenciais. Hospital e bairro ganharam energia intermitente.")
		"vehicle_parts_end":
			vehicles["CARRO"]["found"]=true; vehicles["CARRO"]["condition"]=maxi(38,int(vehicles["CARRO"].get("condition",18))); materials.mechanical+=2; _add_event("GARAGEM","As peças da caminhonete permitem colocar o carro do abrigo novamente em condição de reparo.")
		"lake_signal_end":
			radio_signal=mini(100,radio_signal+15); v18_route_experience[_v18_route_key("TÚNEIS","ROTA SILENCIOSA")]=maxi(4,int(v18_route_experience.get(_v18_route_key("TÚNEIS","ROTA SILENCIOSA"),0))); _add_event("RÁDIO","A antena do Silo triangulou a transmissão. Uma rota silenciosa até os Túneis foi marcada.")
		"origin_truth":
			research_points+=5; lore_archive.append("Dia %d — as amostras da Câmara Selada são anteriores ao primeiro caso oficial."%day); _add_mission("v18_lower_level","ABAIXO DO LABORATÓRIO","Use as provas da Câmara Selada para localizar e entrar no nível inferior.",1,"Fim do capítulo • verdade sobre o surto"); _add_event("ARQUIVO","Você agora tem provas de que o surto começou antes da versão oficial.")
		"lower_level":
			v18_story_flags["chapter_one_complete"]=true; morale=mini(100,morale+4); research_points+=5; _add_event("CAPÍTULO","O nível inferior confirma que a cidade foi parte de algo muito maior. O primeiro grande capítulo foi concluído.")
		_: pass

func _v18_chain_followup(chain:String) -> void:
	match chain:
		"patient_302": _add_mission("v18_patient_302","O PACIENTE DO 302","Procure o apartamento 302 citado nos registros da Farmácia.",1,"Antibióticos • história do bairro")
		"school_survivor": _add_mission("v18_school_church","NOMES E SETAS","Descubra por que as anotações da Escola apontam para a Igreja.",1,"Coesão • pista sobre sobreviventes")
		"evac_order": _add_mission("v18_route17","ROTA 17-B","Siga a ordem de evacuação até o túnel de serviço da Estação.",1,"Atalho urbano • arquivo pré-surto")
		"surgery_grid": _add_mission("v18_power_hospital","A ENERGIA QUE FALTOU","Investigue a Sala de Controle da Subestação ligada ao Hospital.",1,"Conhecimento elétrico • rede urbana")
		"vehicle_parts": _add_mission("v18_blue_truck","A CAMINHONETE AZUL","Rastreie as peças da caminhonete entre Posto, Oficina e Ferro-Velho.",1,"Peças de veículo")
		"lake_signal": _add_mission("v18_silo_signal","FREQUÊNCIA DO SILO","Suba à torre do Silo e tente recuperar a transmissão captada no Lago.",1,"Coordenadas dos Túneis")
		"amber_protocol": _add_mission("v18_amber","PROTOCOLO ÂMBAR","Encontre a Câmara Selada citada nos registros da Quarentena.",1,"Origem do surto • capítulo final")
		"origin_truth": _add_mission("v18_origin","ANTES DO PRIMEIRO DIA","Leve as provas da Câmara Selada até o abrigo e organize a cronologia.",1,"Arquivo completo • grande revelação")
		_: pass

func _v18_mark_chain_progress(location_name:String,room_name:String) -> void:
	var key:="%s|%s"%[location_name,room_name]
	match key:
		"APARTAMENTOS|APTO 302": _mission_progress("v18_patient_302",1)
		"IGREJA|PORÃO": _mission_progress("v18_school_church",1)
		"ESTAÇÃO|TÚNEL DE SERVIÇO": _mission_progress("v18_route17",1)
		"SUBESTAÇÃO|SALA DE CONTROLE": _mission_progress("v18_power_hospital",1)
		"FERRO-VELHO|PÁTIO DE CARROS": _mission_progress("v18_blue_truck",1)
		"SILO|TORRE": _mission_progress("v18_silo_signal",1)
		"LABORATÓRIO|CÂMARA SELADA": _mission_progress("v18_amber",1)
		"LABORATÓRIO|NÍVEL INFERIOR": _mission_progress("v18_lower_level",1)
		_: pass

# -----------------------------------------------------------------------------
# AFTERFALL V16 — manutenção do abrigo, sono seguro e saúde coletiva avançada
# -----------------------------------------------------------------------------
func _v16_reset_systems() -> void:
	shelter_integrity=82; shelter_cleanliness=68; shelter_heat=54; maintenance_debt=0; roof_leak=false; shelter_maintenance_history=[]; v16_story_flags={}; v16_last_maintenance_day=0; v16_camp_active=false; v16_camp_name=""; v16_camp_quality=0

func _v16_guard_bonus() -> int:
	var bonus:=0
	for person in survivors:
		if not bool(person.get("alive",true)): continue
		var n:=str(person.get("name",""))
		if str(survivor_tasks.get(n,""))=="VIGIA": bonus+=8
	if int(facilities.get("motion_alarm",0))>0: bonus+=7
	if int(animals.get("dog",0))>0: bonus+=4
	return mini(18,bonus)

func _v16_maintenance_grade(value:int) -> String:
	if value>=80: return "ÓTIMO"
	if value>=60: return "ESTÁVEL"
	if value>=40: return "DESGASTADO"
	if value>=20: return "CRÍTICO"
	return "COLAPSO IMINENTE"

func _v16_show_shelter_maintenance() -> void:
	_v8_show_page("production","MANUTENÇÃO DO ABRIGO","UMA BASE SEGURA PRECISA SER MANTIDA, NÃO APENAS CONSTRUÍDA","",[["ABRIGO",Callable(self,"_show_shelter")],["PRODUÇÃO",Callable(self,"_show_production_panel")],["ENFERMARIA",Callable(self,"_v15_show_shelter_health")]])
	v8_page_body.visible=false; v8_page_cards.visible=true; v8_page_cards.columns=2; v8_page_cards.position=Vector2(28,142); v8_page_cards.size=Vector2(820,500)
	for c in v8_page_cards.get_children(): c.queue_free()
	var cards=[
		["ESTRUTURA",shelter_integrity,_v16_maintenance_grade(shelter_integrity),"Telhado, paredes e vedação. Temporal e vento forte desgastam a base."],
		["HIGIENE",shelter_cleanliness,_v16_maintenance_grade(shelter_cleanliness),"Sujeira, lixo e umidade aumentam doença e deterioração de comida."],
		["CALOR",shelter_heat,_v16_maintenance_grade(shelter_heat),"Retenção térmica do abrigo. No inverno, calor baixo piora sono e doença."],
		["DÍVIDA DE MANUTENÇÃO",100-maintenance_debt,_v16_maintenance_grade(100-maintenance_debt),"Pequenos reparos ignorados acumulam problemas e tornam falhas maiores mais prováveis."]
	]
	for spec in cards:
		v8_page_cards.add_child(_v16_make_maintenance_card(str(spec[0]),int(spec[1]),str(spec[2]),str(spec[3])))
	_v8_clear_actions(v8_page_actions)
	var actions=[
		["INSPECIONAR • 10 MIN",Callable(self,"_v16_inspect_shelter")],
		["REPARAR ESTRUTURA • 45 MIN",Callable(self,"_v16_repair_structure")],
		["LIMPAR / ORGANIZAR • 40 MIN",Callable(self,"_v16_clean_shelter")],
		["AQUECER ABRIGO • 30 MIN",Callable(self,"_v16_heat_shelter")],
		["ABRIGO",Callable(self,"_show_shelter")]
	]
	for a in actions:
		var b:=_make_dark_button(str(a[0]),Vector2(438,52)); b.pressed.connect(a[1]); v8_page_actions.add_child(b)

func _v16_make_maintenance_card(title:String,value:int,grade:String,desc:String) -> Panel:
	var card:=Panel.new(); card.custom_minimum_size=Vector2(390,215); var col:=GREEN if value>=60 else (GOLD if value>=35 else RED_BRIGHT); card.add_theme_stylebox_override("panel",_flat(Color(0.025,0.024,0.021,0.93),col,7,2))
	var t:=Label.new(); t.position=Vector2(20,18); t.size=Vector2(340,36); t.text=title; t.add_theme_font_size_override("font_size",22); t.add_theme_color_override("font_color",BONE); card.add_child(t)
	var big:=Label.new(); big.position=Vector2(20,58); big.size=Vector2(150,54); big.text="%d%%"%value; big.add_theme_font_size_override("font_size",36); big.add_theme_color_override("font_color",col); card.add_child(big)
	var g:=Label.new(); g.position=Vector2(170,70); g.size=Vector2(190,30); g.text=grade; g.add_theme_font_size_override("font_size",16); g.add_theme_color_override("font_color",col); card.add_child(g)
	var d:=Label.new(); d.position=Vector2(20,122); d.size=Vector2(345,72); d.text=desc; d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.add_theme_font_size_override("font_size",14); d.add_theme_color_override("font_color",MUTED); card.add_child(d)
	return card

func _v16_inspect_shelter() -> void:
	_v12_advance_time(10,"inspecionar abrigo",0.02,false)
	var notes:Array[String]=[]
	if roof_leak: notes.append("Há infiltração ativa perto da janela.")
	if shelter_integrity<55: notes.append("A estrutura precisa de reparos antes do próximo temporal.")
	if shelter_cleanliness<50: notes.append("Umidade e sujeira estão se acumulando.")
	if shelter_heat<40: notes.append("O abrigo está perdendo calor rápido demais.")
	if notes.is_empty(): notes.append("Nada urgente. Pequenos reparos preventivos ainda valem o tempo.")
	_add_event("MANUTENÇÃO"," ".join(notes)); _save_game(); _v16_show_shelter_maintenance()

func _v16_repair_structure() -> void:
	if int(materials.get("wood",0))<2 or int(materials.get("nails",0))<2:
		_toast("Faltam 2 madeira e 2 pregos."); return
	materials.wood-=2; materials.nails-=2; _v12_advance_time(45,"reparar estrutura",0.28,false); shelter_integrity=mini(100,shelter_integrity+28+int(skills.get("carpentry",0))*3); maintenance_debt=maxi(0,maintenance_debt-24); roof_leak=false; _v7_gain_skill("carpentry",6); _v16_log_maintenance("Estrutura reparada e infiltrações vedadas."); _save_game(); _v16_show_shelter_maintenance()

func _v16_clean_shelter() -> void:
	if inventory.water<=0:
		_toast("Você precisa de pelo menos 1 água para uma limpeza completa."); return
	inventory.water-=1; _v12_advance_time(40,"limpar e organizar abrigo",0.18,false); shelter_cleanliness=mini(100,shelter_cleanliness+34); hygiene=mini(100,hygiene+10); community_tension=maxi(0,community_tension-2); _v16_log_maintenance("Abrigo limpo, lixo removido e superfícies secas."); _save_game(); _v16_show_shelter_maintenance()

func _v16_heat_shelter() -> void:
	if int(materials.get("wood",0))<=0:
		_toast("Sem madeira para manter o abrigo aquecido."); return
	materials.wood-=1; _v12_advance_time(30,"aquecer abrigo",0.08,false); shelter_heat=mini(100,shelter_heat+35); body_temperature=move_toward(body_temperature,36.7,0.35); wetness=maxi(0,wetness-12); _v16_log_maintenance("Fogão mantido aceso; roupas e paredes começaram a secar."); _save_game(); _v16_show_shelter_maintenance()

func _v16_log_maintenance(text:String) -> void:
	shelter_maintenance_history.append({"day":day,"text":text}); while shelter_maintenance_history.size()>12: shelter_maintenance_history.pop_front(); _add_event("ABRIGO",text)

func _v16_shelter_daily_tick() -> void:
	var integrity_loss:=1
	if weather_severity>=2: integrity_loss+=2+weather_severity
	if wind_speed>=35: integrity_loss+=2
	if wind_speed>=50: integrity_loss+=2
	if int(upgrades.get("fence",0))>=2: integrity_loss=maxi(0,integrity_loss-1)
	shelter_integrity=maxi(0,shelter_integrity-integrity_loss)
	var people:=maxi(1,survivor_count); shelter_cleanliness=maxi(0,shelter_cleanliness-(2+int(people/3)))
	var feel:=_v12_feels_like(); if feel<12: shelter_heat=maxi(0,shelter_heat-(5+int((12-feel)/3)))
	elif feel>24: shelter_heat=mini(100,shelter_heat+2)
	maintenance_debt=clampi(maintenance_debt+1+integrity_loss,0,100)
	if weather_severity>=2 and shelter_integrity<58 and rng.randi_range(1,100)<=32:
		roof_leak=true; shelter_comfort=maxi(0,shelter_comfort-2); _add_event("ABRIGO","A chuva encontrou uma fresta no telhado. O piso amanheceu molhado.")
	if roof_leak and weather_severity>0:
		shelter_cleanliness=maxi(0,shelter_cleanliness-5); shelter_heat=maxi(0,shelter_heat-4)
	if shelter_integrity<35 and not bool(v16_story_flags.get("repair_mission",false)):
		v16_story_flags["repair_mission"]=true; _add_mission("v16_repair","ANTES QUE CAIA","Eleve a estrutura do abrigo para pelo menos 60% antes do próximo temporal.",1,"+15 Moral • abrigo seguro")
	v16_last_maintenance_day=day

func _v16_advanced_health_tick() -> void:
	# Ambiente ruim cria problemas previsíveis, não doenças aleatórias sem causa.
	if shelter_cleanliness<35:
		if rng.randi_range(1,100)<=18: diseases["GASTROENTERITE"]=maxi(1,int(diseases.get("GASTROENTERITE",0)))
		if rng.randi_range(1,100)<=14: diseases["IRRITAÇÃO RESPIRATÓRIA"]=maxi(1,int(diseases.get("IRRITAÇÃO RESPIRATÓRIA",0)))
	if season=="INVERNO" and shelter_heat<32 and rng.randi_range(1,100)<=18:
		diseases["GRIPE"]=maxi(1,int(diseases.get("GRIPE",0)))
	if diseases.has("RESFRIADO") and int(diseases.get("RESFRIADO",1))>=3 and int(v14_disease_days.get("RESFRIADO",0))>=3 and rng.randi_range(1,100)<=28:
		diseases.erase("RESFRIADO"); v14_disease_days.erase("RESFRIADO"); diseases["BRONQUITE"]=1; v14_disease_days["BRONQUITE"]=0; _add_event("SAÚDE","A tosse piorou e desceu para o peito. O resfriado evoluiu para bronquite.")
	# Doença coletiva pode surgir do abrigo sujo ou frio.
	for p in survivors:
		if not bool(p.get("alive",true)) or str(p.get("illness",""))!="": continue
		var chance:=0; var kind:=""
		if shelter_cleanliness<30: chance+=8; kind="GASTROENTERITE"
		if season=="INVERNO" and shelter_heat<28: chance+=8; kind="GRIPE"
		if chance>0 and rng.randi_range(1,100)<=chance:
			p["illness"]=kind; p["illness_severity"]=1; p["illness_days"]=0; _add_event("ENFERMARIA","%s acordou com sintomas de %s."%[str(p.get("name","Sobrevivente")),kind])

func _v16_leak_repair() -> void:
	if int(materials.get("wood",0))<1 or int(materials.get("nails",0))<2:
		_toast("Falta 1 madeira e 2 pregos para vedar a infiltração."); return
	materials.wood-=1; materials.nails-=2; _v12_advance_time(35,"reparo de emergência no telhado",0.22,false); roof_leak=false; shelter_integrity=mini(100,shelter_integrity+16); maintenance_debt=maxi(0,maintenance_debt-12); _v13_finish_event("Você vedou a fresta antes que a água chegasse ao estoque.")

func _v16_leak_move_supplies() -> void:
	_v12_advance_time(25,"mover suprimentos para área seca",0.18,false); fatigue=mini(100,fatigue+3); shelter_cleanliness=maxi(0,shelter_cleanliness-3); maintenance_debt=mini(100,maintenance_debt+4); _v13_schedule_delayed("mold_problem",day+2,{}); _v13_finish_event("As caixas foram salvas, mas a parede continua molhada. O reparo ficou para depois.")

func _v16_leak_ignore() -> void:
	shelter_integrity=maxi(0,shelter_integrity-7); shelter_cleanliness=maxi(0,shelter_cleanliness-8); maintenance_debt=mini(100,maintenance_debt+12); _v13_schedule_delayed("mold_problem",day+1,{}); _v13_finish_event("Você deixou a água correr. Nada desabou — ainda — mas parte da parede ficou encharcada.")

func _v16_pests_trap() -> void:
	if int(materials.get("wood",0))<1 or int(materials.get("wire",0))<1:
		_toast("Falta 1 madeira e 1 fio para improvisar armadilhas."); return
	materials.wood-=1; materials.wire-=1; _v12_advance_time(30,"armar ratoeiras",0.10,false); traps_set+=1; shelter_cleanliness=mini(100,shelter_cleanliness+8); _v13_finish_event("Você montou armadilhas e reorganizou as caixas. O barulho atrás da parede diminuiu.")

func _v16_pests_clean() -> void:
	if inventory.water<=0:
		_toast("Você precisa de água para uma limpeza pesada."); return
	inventory.water-=1; _v12_advance_time(55,"limpeza pesada do estoque",0.24,false); shelter_cleanliness=mini(100,shelter_cleanliness+38); hygiene=mini(100,hygiene+8); _v13_finish_event("O estoque foi esvaziado, limpo e reorganizado. As pragas perderam comida e esconderijos.")

func _v16_pests_ignore() -> void:
	var lost:=mini(int(inventory.food),rng.randi_range(1,2)); inventory.food-=lost; shelter_cleanliness=maxi(0,shelter_cleanliness-8); community_tension=mini(100,community_tension+2); _v13_finish_event("Você ignorou o problema. %d ração(ões) foram estragadas durante a noite."%lost)

func _v16_after_sleep_event(minutes_slept:int, interrupted:bool) -> void:
	if minutes_slept<240: return
	var guard:=_v16_guard_bonus()
	if interrupted and guard>0:
		_add_event("VIGIA","A ronda percebeu movimento do lado de fora antes que chegasse à porta.")
	if guard==0 and threat>=45 and rng.randi_range(1,100)<=16:
		if inventory.food>0:
			inventory.food-=1; _add_event("NOITE","Alguém entrou pelo fundo durante a madrugada. Uma ração desapareceu.")
		elif inventory.scrap>0:
			inventory.scrap-=1; _add_event("NOITE","Você encontrou a porta lateral aberta. Parte da sucata desapareceu.")
		community_tension=mini(100,community_tension+4)
	elif guard>=8 and threat>=45 and rng.randi_range(1,100)<=22:
		_add_event("VIGIA","A pessoa de guarda viu uma silhueta rondando o abrigo e manteve todos em silêncio até ela ir embora.")

func _v18_homecoming_story_tick() -> void:
	if bool(v18_story_flags.get("origin_truth",false)) and not bool(v18_story_flags.get("origin_archived",false)):
		v18_story_flags["origin_archived"]=true; _mission_progress("v18_origin",1); journal.append("Dia %d — organizei no abrigo as provas trazidas da Câmara Selada."%day); _add_event("ARQUIVO","As provas da Câmara Selada foram copiadas, organizadas e escondidas em dois lugares diferentes.")
	if bool(v18_story_flags.get("chapter_one_complete",false)) and not bool(v18_story_flags.get("chapter_one_home",false)):
		v18_story_flags["chapter_one_home"]=true; morale=mini(100,morale+3); community_cohesion=mini(100,community_cohesion+3); _add_event("ABRIGO","Você voltou com a história que ninguém queria encontrar. A comunidade passa a discutir o que fazer com a verdade.")

func _v16_seek_temporary_shelter() -> void:
	if not v8_travel_active: return
	_v12_advance_time(15,"procurar abrigo temporário",0.12,true)
	var district:=_v8_street_district(); var risk:=20
	if v8_travel_destination!="ABRIGO" and CITY_LOCATIONS.has(v8_travel_destination): risk=int(CITY_LOCATIONS[v8_travel_destination].risk)
	var score:=42+int(skills.get("survival",0))*11+int(fitness/8)-int(risk/5)-weather_severity*5
	if _v12_is_night(): score-=4
	if rng.randi_range(1,100)<=clampi(score,18,88):
		var names=["APARTAMENTO VAZIO","OFICINA FECHADA","SALA DOS FUNDOS","PORTARIA ABANDONADA","GARAGEM SECA"]
		var quality:=clampi(48+int(skills.get("survival",0))*5-rng.randi_range(0,14)-weather_severity*3,30,78)
		_v16_open_camp(str(names[rng.randi_range(0,names.size()-1)]),quality)
	else:
		stress=mini(100,stress+4); fatigue=mini(100,fatigue+2); _v8_render_street("[b]NENHUM LUGAR PARECE SEGURO[/b]\n\nVocê testa duas portas e observa uma garagem, mas há sinais de movimento ou entradas demais para vigiar. Quinze minutos se foram e você continua na rua.",[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _v16_open_camp(place:String, quality:int) -> void:
	v16_camp_active=true; v16_camp_name=place; v16_camp_quality=clampi(quality,20,85)
	var desc:="[b]%s[/b]\n\nVocê encontrou um espaço que pode ser defendido por algumas horas. Não é o abrigo: não há estoque, cama boa nem certeza de que ninguém vai tentar entrar.\n\nQualidade do refúgio: %d%%\nAgora: %s • %d°C • fadiga %d • sede %d • fome %d"%[place,v16_camp_quality,_v12_clock_text(),temperature,fatigue,thirst,hunger]
	_v8_render_street(desc,[["DESCANSAR • 2H",func(): _v16_camp_sleep(120,false)],["DORMIR ATÉ AMANHECER",func(): _v16_camp_sleep(0,true)],["COMER / BEBER",Callable(self,"_v16_camp_supplies")],["SEGUIR VIAGEM",Callable(self,"_v16_leave_camp")]])

func _v16_camp_sleep(minutes_sleep:int, until_dawn:bool=false) -> void:
	if not v16_camp_active: return
	var duration:=minutes_sleep
	if until_dawn:
		var now:=_v12_clock_minutes(); duration=sunrise_minute-now if now<sunrise_minute else (1440-now)+sunrise_minute; duration=clampi(duration,60,600)
	var danger:=clampi(42-v16_camp_quality/2+int(threat/8)+weather_severity*3-int(skills.get("survival",0))*3,5,55)
	_v12_advance_time(duration,"descansar fora do abrigo",0.0,false)
	var hours_f:=float(duration)/60.0; var recovery:=int(hours_f*(2.6+float(v16_camp_quality)/30.0)); fatigue=maxi(0,fatigue-recovery); energy=mini(100,energy+int(recovery*0.65)); stress=maxi(0,stress-int(hours_f))
	var incident:="Você acorda algumas vezes com o barulho da rua, mas consegue descansar."
	if rng.randi_range(1,100)<=danger:
		stress=mini(100,stress+6); fatigue=mini(100,fatigue+4); incident="Passos e arranhões na porta interrompem o sono. Você espera em silêncio até os sons se afastarem."
		if rng.randi_range(1,100)<=18: noise=mini(100,noise+8); threat=mini(100,threat+3)
	_add_event("ABRIGO TEMPORÁRIO","%s • %dh%02d • qualidade %d%%."%[incident,int(duration/60),duration%60,v16_camp_quality]); _save_game(); _v16_open_camp(v16_camp_name,v16_camp_quality)

func _v16_camp_supplies() -> void:
	var did:=false
	if inventory.water>0 and thirst>=35: inventory.water-=1; thirst=maxi(0,thirst-32); did=true
	if inventory.food>0 and hunger>=35: inventory.food-=1; hunger=maxi(0,hunger-28); did=true
	if did: _v12_advance_time(10,"comer e beber no abrigo temporário",0.0,false); _add_event("EXPEDIÇÃO","Você usou parte dos suprimentos enquanto esperava fora de casa.")
	else: _toast("Você não tem suprimentos necessários ou não precisa deles agora.")
	_v16_open_camp(v16_camp_name,v16_camp_quality)

func _v16_leave_camp() -> void:
	v16_camp_active=false; var place:=v16_camp_name; v16_camp_name=""; v16_camp_quality=0; _v8_render_street("Você deixa %s e volta para a rua. O tempo passou; o caminho ainda precisa ser percorrido."%place,[["CONTINUAR",Callable(self,"_v8_next_segment")]])

func _run_v18_qa() -> void:
	_start_new_game(false); var failures:Array[String]=[]
	if int(JSON.parse_string(JSON.stringify({"v":18})).get("v",0))!=18: failures.append("json")
	if V18_SPECIAL_ROOMS.size()<24: failures.append("special_rooms")
	if not V18_LOCATION_TEX.has("HOSPITAL") or not V18_LOCATION_TEX.has("QUARENTENA"): failures.append("visual_families")
	inventory.water=3; inventory.food=1; inventory.bandage=1; inventory.knife=1; equipped_melee="FACA"; var prep:=_v18_expedition_preparation("HOSPITAL"); if int(prep.score)<45: failures.append("prep_score")
	v18_route_experience={}
	var before:Dictionary = _v12_travel_estimate("HOSPITAL","BECOS")
	for i in range(5):
		_v18_gain_route_xp("HOSPITAL","BECOS")
	var route_after:Dictionary = _v12_travel_estimate("HOSPITAL","BECOS")
	if int(route_after.minutes)>=int(before.minutes):
		failures.append("route_learning")
	skills["medicine"]=2; v18_special_rooms_seen={}; _v18_resolve_special_room("HOSPITAL","CIRURGIA","study"); if not bool(v18_special_rooms_seen.get("HOSPITAL|CIRURGIA",false)): failures.append("special_resolution")
	if not _mission_exists_v18("v18_power_hospital"): failures.append("story_chain")
	_save_game(); var saved_story:=v18_story_flags.duplicate(true); v18_story_flags={}; if not _load_game(): failures.append("save_load"); if saved_story.size()>0 and v18_story_flags.size()==0: failures.append("v18_state")
	print("V18_QA special=%d prep=%d route_before=%d route_after=%d story=%d failures=%s"%[V18_SPECIAL_ROOMS.size(),int(prep.score),int(before.minutes),int(route_after.minutes),v18_story_flags.size(),str(failures)]); get_tree().quit(0 if failures.is_empty() else 2)

func _mission_exists_v18(id:String) -> bool:
	for m in missions:
		if str(m.get("id",""))==id: return true
	return false

func _run_v16_qa() -> void:
	_start_new_game(false); var failures:Array[String]=[]
	# Temporal deve desgastar abrigo.
	shelter_integrity=70; shelter_cleanliness=60; shelter_heat=50; maintenance_debt=0; weather="TEMPORAL"; weather_severity=3; wind_speed=48; temperature=6; var before_integrity:=shelter_integrity; _v16_shelter_daily_tick(); if shelter_integrity>=before_integrity: failures.append("maintenance_weather")
	# Reparo deve consumir material e recuperar estrutura.
	materials.wood=4; materials.nails=4; var damaged:=shelter_integrity; _v16_repair_structure(); if shelter_integrity<=damaged or int(materials.wood)!=2: failures.append("repair_action")
	# Limpeza deve alterar higiene do abrigo.
	shelter_cleanliness=25; inventory.water=2; _v16_clean_shelter(); if shelter_cleanliness<=25: failures.append("clean_action")
	# Evento do abrigo deve usar o mesmo sistema de storylets.
	v13_pending_event={}; shelter_cleanliness=20; _v13_queue_event("pests"); if str(v13_pending_event.get("id",""))!="pests": failures.append("pest_event"); v13_pending_event={}
	# Saúde ambiental: sujeira severa deve ser capaz de gerar condição com RNG forçado via repetição.
	shelter_cleanliness=0; season="INVERNO"; shelter_heat=0; var got_condition:=false
	for i in range(40): _v16_advanced_health_tick(); if diseases.has("GASTROENTERITE") or diseases.has("GRIPE") or diseases.has("IRRITAÇÃO RESPIRATÓRIA"): got_condition=true; break
	if not got_condition: failures.append("environment_health")
	# Delegar manutenção deve reduzir o trabalho manual em campanhas longas.
	survivors=[_v7_make_survivor("IVO","MECÂNICO",70)]; survivor_count=2; survivor_tasks={"IVO":"MANUTENÇÃO"}; maintenance_debt=40; shelter_cleanliness=45; var debt_before:=maintenance_debt; _v9_survivor_work_daily(); if maintenance_debt>=debt_before: failures.append("delegated_maintenance")
	# Abrigo temporário deve avançar tempo e recuperar parte da fadiga sem virar cama perfeita.
	v8_travel_active=true; v8_travel_destination="HOSPITAL"; v8_travel_route="BECOS"; hour=22; minute=0; fatigue=86; energy=18; stress=20; diseases={}; threat=10; weather="SECO"; weather_severity=0; v16_camp_active=true; v16_camp_name="QA"; v16_camp_quality=60; var clock_before_camp:=(day*1440)+_v12_clock_minutes(); var fatigue_before_camp:=fatigue; _v16_camp_sleep(120,false); var clock_after_camp:=(day*1440)+_v12_clock_minutes(); print("V16_CAMP_QA before_clock=",clock_before_camp," after_clock=",clock_after_camp," before_fatigue=",fatigue_before_camp," after_fatigue=",fatigue," day=",day," time=",_v12_clock_text()); if clock_after_camp<=clock_before_camp or fatigue>=fatigue_before_camp: failures.append("temporary_shelter")
	# Save/load V16.
	shelter_integrity=47; shelter_cleanliness=39; shelter_heat=31; maintenance_debt=55; roof_leak=true; _save_game(); shelter_integrity=99; shelter_cleanliness=99; shelter_heat=99; maintenance_debt=0; roof_leak=false; if not _load_game(): failures.append("save_load")
	if shelter_integrity!=47 or shelter_cleanliness!=39 or shelter_heat!=31 or maintenance_debt!=55 or not roof_leak: failures.append("v16_state")
	print("V16_QA integrity=%d clean=%d heat=%d debt=%d roof=%s diseases=%s failures=%s"%[shelter_integrity,shelter_cleanliness,shelter_heat,maintenance_debt,str(roof_leak),str(diseases),str(failures)]); get_tree().quit(0 if failures.is_empty() else 2)

func _capture_after_frames(path: String) -> void:
	await get_tree().process_frame
	await get_tree().process_frame
	await get_tree().process_frame
	var image := get_viewport().get_texture().get_image()
	var err := image.save_png(path)
	print("CAPTURE_RESULT=", err, " path=", path)
	get_tree().quit()


func _v17_add_map_road(parent:Control,a:Vector2,b:Vector2,width:float=4.0) -> void:
	var line:=ColorRect.new(); var delta:=b-a; line.position=a; line.size=Vector2(delta.length(),width); line.rotation=atan2(delta.y,delta.x); line.color=Color(0.47,0.43,0.35,0.40); line.mouse_filter=Control.MOUSE_FILTER_IGNORE; parent.add_child(line)

func _v17_map_district_label(parent:Control,text_value:String,pos:Vector2,col:Color) -> void:
	var l:=Label.new(); l.position=pos; l.size=Vector2(220,26); l.text=text_value; l.add_theme_font_size_override("font_size",12); l.add_theme_color_override("font_color",col.lightened(0.25)); l.mouse_filter=Control.MOUSE_FILTER_IGNORE; parent.add_child(l)

func _v17_map_position(district:String,index:int) -> Vector2:
	var bases:Dictionary={"BAIRRO DO ABRIGO":Vector2(120,335),"CENTRO":Vector2(435,215),"ZONA INDUSTRIAL":Vector2(750,330),"PERIFERIA":Vector2(420,410),"QUARENTENA":Vector2(830,120)}
	var offsets:Array=[Vector2(-80,-55),Vector2(40,-65),Vector2(-100,30),Vector2(30,25),Vector2(120,10),Vector2(75,80),Vector2(-25,90),Vector2(145,-55)]
	return Vector2(bases.get(district,Vector2(400,300)))+Vector2(offsets[index%offsets.size()])

func _v17_map_pin(name:String,pos:Vector2) -> Button:
	var spec:Dictionary=CITY_LOCATIONS[name]; var st:Dictionary=location_states.get(name,{}); var risk:=int(spec.get("risk",0)); var infestation:=int(st.get("infestation",0)); var boss:=_boss_at_location(name); var edge:=GREEN if risk<35 and infestation<20 else (RED_BRIGHT if infestation>=55 or boss!="" else GOLD)
	var b:=Button.new(); b.position=pos; b.size=Vector2(150,58); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.025,0.024,0.021,0.96),edge,14,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.11,0.07,0.04,0.99),edge.lightened(0.18),14,3))
	var dot:=ColorRect.new(); dot.position=Vector2(10,18); dot.size=Vector2(12,12); dot.color=edge; dot.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(dot)
	var t:=Label.new(); t.position=Vector2(29,8); t.size=Vector2(112,22); t.text=name; t.add_theme_font_size_override("font_size",11); t.add_theme_color_override("font_color",BONE); t.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(t)
	var d:=Label.new(); d.position=Vector2(29,30); d.size=Vector2(112,18); d.text="%.1f km"%float(V12_LOCATION_DISTANCE_KM.get(name,1.0)); d.add_theme_font_size_override("font_size",9); d.add_theme_color_override("font_color",edge.lightened(0.28)); d.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(d); b.pressed.connect(func(): _v8_prepare_travel(name)); return b

func _v17_side_art(tex:Texture2D,height:int=180) -> void:
	var art:=TextureRect.new(); art.custom_minimum_size=Vector2(360,height); art.texture=tex; art.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; art.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; art.modulate=Color(0.88,0.84,0.76,0.92); v8_page_actions.add_child(art)

# -----------------------------------------------------------------------------
# AFTERFALL V17 — segunda passada visual: telas com identidade própria
# -----------------------------------------------------------------------------
func _v17_side_note(title_text:String, body_text:String, min_h:int=145) -> void:
	var p:=Panel.new(); p.custom_minimum_size=Vector2(390,min_h); p.add_theme_stylebox_override("panel",_flat(Color(0.028,0.025,0.021,0.92),Color("#6f604c"),6,2))
	var t:=Label.new(); t.position=Vector2(18,14); t.size=Vector2(350,28); t.text=title_text; t.add_theme_font_size_override("font_size",18); t.add_theme_color_override("font_color",Color("#d2bc95")); p.add_child(t)
	var b:=Label.new(); b.position=Vector2(18,48); b.size=Vector2(350,min_h-58); b.text=body_text; b.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; b.add_theme_font_size_override("font_size",13); b.add_theme_color_override("font_color",MUTED); p.add_child(b); v8_page_actions.add_child(p)

func _v17_side_button(text_value:String, cb:Callable) -> void:
	var b:=_make_dark_button(text_value,Vector2(390,48)); b.pressed.connect(cb); v8_page_actions.add_child(b)

func _v17_inventory_card(key:String,label_text:String,count:int,tex:Texture2D) -> Button:
	var b:=Button.new(); b.custom_minimum_size=Vector2(176,132); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.025,0.023,0.020,0.94),Color("#5e5548"),5,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.10,0.065,0.038,0.98),Color("#c29a61"),5,3))
	var icon:=TextureRect.new(); icon.position=Vector2(18,12); icon.size=Vector2(92,82); icon.texture=tex; icon.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; icon.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED; icon.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(icon)
	var q:=Label.new(); q.position=Vector2(122,18); q.size=Vector2(42,28); q.text="x%d"%count; q.horizontal_alignment=HORIZONTAL_ALIGNMENT_RIGHT; q.add_theme_font_size_override("font_size",15); q.add_theme_color_override("font_color",Color("#d3b57f")); q.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(q)
	var lab:=Label.new(); lab.position=Vector2(10,99); lab.size=Vector2(156,25); lab.text=label_text; lab.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER; lab.add_theme_font_size_override("font_size",12); lab.add_theme_color_override("font_color",BONE); lab.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(lab)
	b.pressed.connect(func(): _v8_inventory_select(key,label_text,count)); return b

func _v17_recipe_card(id:String, recipe:Dictionary) -> Button:
	var ok:=_v7_recipe_available(id); var col:=Color("#55705b") if ok else Color("#835049")
	var b:=Button.new(); b.custom_minimum_size=Vector2(370,126); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.027,0.024,0.020,0.95),col,6,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.075,0.055,0.035,0.98),col.lightened(0.18),6,3))
	var t:=Label.new(); t.position=Vector2(18,14); t.size=Vector2(330,30); t.text=str(recipe.get("name",id)).to_upper(); t.add_theme_font_size_override("font_size",18); t.add_theme_color_override("font_color",BONE); t.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(t)
	var d:=Label.new(); d.position=Vector2(18,49); d.size=Vector2(330,45); d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.text="%s Nv.%d • %s"%[str(V7_SKILL_NAMES.get(str(recipe.get("skill","survival")),str(recipe.get("skill","survival")))),int(recipe.get("level",0)),"PRONTO" if ok else "FALTAM REQUISITOS"]; d.add_theme_font_size_override("font_size",12); d.add_theme_color_override("font_color",col.lightened(0.28)); d.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(d)
	var hint:=Label.new(); hint.position=Vector2(18,98); hint.size=Vector2(330,18); hint.text="TOQUE PARA FABRICAR" if ok else "ESTUDE / REÚNA MATERIAIS"; hint.add_theme_font_size_override("font_size",10); hint.add_theme_color_override("font_color",MUTED); hint.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(hint)
	b.disabled=not ok
	if ok: b.pressed.connect(func(): _craft_v7(id))
	return b

func _v17_text_card(title_text:String,body_text:String,col:Color,cb:Callable=Callable()) -> Button:
	var b:=Button.new(); b.custom_minimum_size=Vector2(350,150); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.028,0.025,0.021,0.94),col,6,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.08,0.055,0.035,0.98),col.lightened(0.18),6,3))
	var t:=Label.new(); t.position=Vector2(18,16); t.size=Vector2(310,30); t.text=title_text; t.add_theme_font_size_override("font_size",19); t.add_theme_color_override("font_color",BONE); t.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(t)
	var d:=Label.new(); d.position=Vector2(18,54); d.size=Vector2(310,78); d.text=body_text; d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.add_theme_font_size_override("font_size",13); d.add_theme_color_override("font_color",MUTED); d.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(d)
	if cb.is_valid(): b.pressed.connect(cb)
	return b

func _v17_prod_card(title_text:String,body_text:String,tex:Texture2D,col:Color,cb:Callable) -> Button:
	var b:=Button.new(); b.custom_minimum_size=Vector2(510,158); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.026,0.024,0.020,0.94),col,7,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.075,0.055,0.034,0.98),col.lightened(0.18),7,3))
	var icon:=TextureRect.new(); icon.position=Vector2(22,27); icon.size=Vector2(88,88); icon.texture=tex; icon.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; icon.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_CENTERED; icon.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(icon)
	var t:=Label.new(); t.position=Vector2(128,24); t.size=Vector2(350,34); t.text=title_text; t.add_theme_font_size_override("font_size",22); t.add_theme_color_override("font_color",BONE); t.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(t)
	var d:=Label.new(); d.position=Vector2(128,65); d.size=Vector2(350,62); d.text=body_text; d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.add_theme_font_size_override("font_size",13); d.add_theme_color_override("font_color",MUTED); d.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(d)
	var a:=Label.new(); a.position=Vector2(128,129); a.size=Vector2(350,20); a.text="ABRIR  →"; a.add_theme_font_size_override("font_size",11); a.add_theme_color_override("font_color",col.lightened(0.30)); a.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(a); b.pressed.connect(cb); return b

func _v17_survivor_card(index:int) -> Button:
	var p:Dictionary=survivors[index]; _v7_normalize_survivor(p)
	var meta:=_v10_character_by_name(str(p.get("name",""))); var cid:=str(meta.get("id","starter")); if cid=="": cid="starter"
	var rarity:=str(p.get("rarity","COMUM")); var col:Color=V10_RARITY_COLORS.get(rarity,MUTED); var task:=str(survivor_tasks.get(str(p.name),"SEM FUNÇÃO"))
	var b:=Button.new(); b.custom_minimum_size=Vector2(510,190); b.focus_mode=Control.FOCUS_NONE; b.text=""; b.add_theme_stylebox_override("normal",_flat(Color(0.024,0.022,0.019,0.96),col,6,2)); b.add_theme_stylebox_override("hover",_flat(Color(0.075,0.06,0.045,0.98),col.lightened(0.18),6,3))
	var strip:=ColorRect.new(); strip.position=Vector2(0,0); strip.size=Vector2(8,190); strip.color=col; strip.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(strip)
	var portrait:=TextureRect.new(); portrait.position=Vector2(18,15); portrait.size=Vector2(128,158); portrait.texture=_v12_portrait_texture(cid); portrait.expand_mode=TextureRect.EXPAND_IGNORE_SIZE; portrait.stretch_mode=TextureRect.STRETCH_KEEP_ASPECT_COVERED; portrait.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(portrait)
	var name_l:=Label.new(); name_l.position=Vector2(165,16); name_l.size=Vector2(315,34); name_l.text=str(p.name); name_l.add_theme_font_size_override("font_size",22); name_l.add_theme_color_override("font_color",BONE); name_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(name_l)
	var role_l:=Label.new(); role_l.position=Vector2(165,52); role_l.size=Vector2(315,28); role_l.text="%s • %s"%[str(p.role),rarity]; role_l.add_theme_font_size_override("font_size",12); role_l.add_theme_color_override("font_color",col.lightened(0.22)); role_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(role_l)
	var status_l:=Label.new(); status_l.position=Vector2(165,88); status_l.size=Vector2(315,76); status_l.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; status_l.text="%s\nFUNÇÃO: %s\nConfiança %d • estresse %d"%[_v7_social_read(p),task,int(p.get("trust",0)),int(p.get("stress",0))]; status_l.add_theme_font_size_override("font_size",11); status_l.add_theme_color_override("font_color",MUTED); status_l.mouse_filter=Control.MOUSE_FILTER_IGNORE; b.add_child(status_l)
	b.pressed.connect(func(): selected_survivor_index=index; _v10_show_survivor_dossier())
	return b

func _v17_journal_card(title_text:String,body_text:String) -> Panel:
	var p:=Panel.new(); p.custom_minimum_size=Vector2(510,128); p.add_theme_stylebox_override("panel",_flat(Color(0.72,0.66,0.54,0.93),Color("#4a4034"),5,2))
	var t:=Label.new(); t.position=Vector2(18,12); t.size=Vector2(470,26); t.text=title_text; t.add_theme_font_size_override("font_size",15); t.add_theme_color_override("font_color",Color("#261f19")); p.add_child(t)
	var d:=Label.new(); d.position=Vector2(18,43); d.size=Vector2(470,70); d.text=body_text; d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.add_theme_font_size_override("font_size",13); d.add_theme_color_override("font_color",Color("#302820")); p.add_child(d); return p

func _v17_status_card(title_text:String,value_text:String,body_text:String,col:Color) -> Panel:
	var p:=Panel.new(); p.custom_minimum_size=Vector2(350,155); p.add_theme_stylebox_override("panel",_flat(Color(0.026,0.025,0.023,0.94),col,7,2))
	var t:=Label.new(); t.position=Vector2(18,15); t.size=Vector2(310,26); t.text=title_text; t.add_theme_font_size_override("font_size",15); t.add_theme_color_override("font_color",col.lightened(0.30)); p.add_child(t)
	var v:=Label.new(); v.position=Vector2(18,48); v.size=Vector2(310,34); v.text=value_text; v.add_theme_font_size_override("font_size",20); v.add_theme_color_override("font_color",BONE); p.add_child(v)
	var d:=Label.new(); d.position=Vector2(18,90); d.size=Vector2(310,53); d.text=body_text; d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.add_theme_font_size_override("font_size",11); d.add_theme_color_override("font_color",MUTED); p.add_child(d); return p

func _v17_disease_summary() -> String:
	if diseases.is_empty(): return "Nenhuma doença ativa."
	var parts:Array[String]=[]
	for k in diseases:
		var sev:=int(diseases.get(k,1)); var days:=int(v14_disease_days.get(k,0)); parts.append("%s • estágio %d • %d dia(s)"%[str(k),sev,days])
	return "\n".join(parts)

func _v17_injury_summary() -> String:
	var parts:Array[String]=[]
	if int(injuries.get("bleeding",0))>0: parts.append("SANGRAMENTO")
	if int(injuries.get("fracture",0))>0: parts.append("FRATURA")
	if int(injuries.get("arm",0))>0: parts.append("BRAÇO FERIDO")
	if int(injuries.get("leg",0))>0: parts.append("PERNA FERIDA")
	return "SEM FERIMENTO GRAVE" if parts.is_empty() else " • ".join(parts)

func _v17_show_radio_visual() -> void:
	_v8_show_page("radio","RÁDIO / FREQUÊNCIAS","VOZES, BOATOS E NOTÍCIAS DE UM MUNDO QUE CONTINUA LÁ FORA","",[])
	_v9_set_immersive_page(true); v8_page_bg.texture=V8_SCREEN_TEX["radio"]; v8_page_shade.color=Color(0.006,0.008,0.008,0.42)
	v8_page_info.position=Vector2(30,120); v8_page_info.size=Vector2(1120,674); v8_page_side.position=Vector2(1170,120); v8_page_side.size=Vector2(440,674)
	v8_page_body.visible=true; v8_page_body.position=Vector2(24,18); v8_page_body.size=Vector2(1060,78); v8_page_body.text="Sinal do abrigo  [b]%d%%[/b] • estação %s • vento %d km/h\n[color=#8fa1a5]A qualidade do sinal muda com energia, antena, clima e distância.[/color]"%[radio_signal,season,wind_speed]
	v8_page_cards.visible=true; v8_page_cards.columns=2; v8_page_cards.position=Vector2(24,110); v8_page_cards.size=Vector2(1065,535); v8_page_cards.add_theme_constant_override("h_separation",14); v8_page_cards.add_theme_constant_override("v_separation",14)
	for c in v8_page_cards.get_children(): c.queue_free()
	v8_page_cards.add_child(_v17_radio_card("93.7 — RÁDIO CIVIL","Mensagens de sobreviventes, pequenos anúncios e música fragmentada.",Color("#6c765d")))
	v8_page_cards.add_child(_v17_radio_card("101.2 — EMERGÊNCIA","Alertas automáticos, clima, água e rotas de evacuação antigas.",Color("#806248")))
	v8_page_cards.add_child(_v17_radio_card("117.8 — MILITAR","Sinais curtos, códigos e operações que nem sempre fazem sentido.",Color("#596a70")))
	v8_page_cards.add_child(_v17_radio_card("88.4 — VOZ LIVRE","Boatos, comunidades, denúncias e informações que podem estar erradas.",Color("#725663")))
	_v8_clear_actions(v8_page_actions); _v17_side_note("ÚLTIMAS TRANSMISSÕES",_recent_events_bbcode(4).replace("[b]","").replace("[/b]",""),190)
	_v17_side_button("VARRER FREQUÊNCIAS (45 MIN)",Callable(self,"_scan_radio")); _v17_side_button("NOTÍCIAS / MUNDO",Callable(self,"_show_world_panel")); _v17_side_button("ARQUIVO DO COLAPSO",Callable(self,"_show_lore_panel")); _v17_side_button("VOLTAR AO ABRIGO",Callable(self,"_show_shelter"))

func _v17_radio_card(title_text:String,body_text:String,col:Color) -> Panel:
	var p:=Panel.new(); p.custom_minimum_size=Vector2(510,220); p.add_theme_stylebox_override("panel",_flat(Color(0.022,0.025,0.025,0.94),col,7,2))
	var freq:=Label.new(); freq.position=Vector2(20,18); freq.size=Vector2(465,34); freq.text=title_text; freq.add_theme_font_size_override("font_size",20); freq.add_theme_color_override("font_color",col.lightened(0.30)); p.add_child(freq)
	var waveform:=ColorRect.new(); waveform.position=Vector2(20,67); waveform.size=Vector2(465,3); waveform.color=col; p.add_child(waveform)
	var d:=Label.new(); d.position=Vector2(20,88); d.size=Vector2(465,96); d.text=body_text; d.autowrap_mode=TextServer.AUTOWRAP_WORD_SMART; d.add_theme_font_size_override("font_size",13); d.add_theme_color_override("font_color",BONE); p.add_child(d)
	var st:=Label.new(); st.position=Vector2(20,188); st.size=Vector2(465,22); st.text="SINAL INSTÁVEL" if radio_signal<45 else "SINAL RECEBÍVEL"; st.add_theme_font_size_override("font_size",10); st.add_theme_color_override("font_color",MUTED); p.add_child(st); return p


