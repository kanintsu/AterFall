# AFTERFALL: Buried Days — V18

V18 parte da reconstrução visual V17 e aprofunda exploração, rotas, narrativa e combate.

## Implementado nesta versão

- Abrigo scene-first com arte aprovada e hotspots físicos invisíveis em cama, rádio, bancada, estoque, porta e janela.
- HUD compacto e menu contextual herdados da V17; navegação lateral antiga não volta ao abrigo.
- 24 locais com identidade visual/família de arte e descrição atmosférica própria.
- 29 salas especiais com leitura por habilidade/profissão e três abordagens de decisão.
- Cadeias narrativas entre locais: Farmácia→Apto 302, Escola→Igreja, Delegacia→Estação, Hospital→Subestação, Posto/Oficina→Ferro-Velho, Hospital→Túneis, Lago→Silo, Quarentena→Laboratório.
- Consequências persistentes: energia restaurada, carro revelado para reparo, atalhos aprendidos, antibióticos, coesão, pesquisa e progressão do capítulo do Laboratório.
- Preparo de expedição 0–100 considerando água, comida, primeiros socorros, arma, munição, peso, corpo, hora, clima, risco e roupa.
- Familiaridade de rota reduz tempo de viagem; conhecimento local reduz risco e tempo ao vasculhar.
- Combate V18 com distância tática, cobertura, mira, defesa, aproximação/recuo e comportamentos de inimigos.
- Ambientes sonoros V18 para rua/noite, industrial e interiores, além de chuva/vento já existentes.
- Save dedicado V18 e persistência dos novos sistemas.
- QA estática reforçada para assets, callbacks, funções duplicadas, dados V18, configuração Android e regressões de UI.

## Exportação Android

Preset: `Android`, arm64-v8a, package `com.afterfall.burieddays`, versão 0.18 / code 18.
Execute `tools/build_android.sh` em um ambiente com Godot 4.7.2 e templates de exportação instalados.
O script roda QA V18 + regressões principais antes de criar o APK.
