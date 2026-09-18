#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:-$ROOT/Afterfall-Buried-Days-V18.apk}"

find_godot() {
  if [[ -n "${GODOT:-}" && -x "${GODOT}" ]]; then printf '%s\n' "$GODOT"; return 0; fi
  for g in \
    "$ROOT/.toolchain/Godot_v4.7.2-stable_linux.x86_64" \
    "/mnt/data/godot_toolchain/godot/Godot_v4.7.2-stable_linux.x86_64" \
    "/mnt/data/godot47local/godot/Godot_v4.7.2-stable_linux.x86_64" \
    "$(command -v godot4 2>/dev/null || true)" \
    "$(command -v godot 2>/dev/null || true)"; do
    [[ -n "$g" && -x "$g" ]] && { printf '%s\n' "$g"; return 0; }
  done
  return 1
}

G="$(find_godot || true)"
if [[ -z "$G" ]]; then
  echo "ERRO: Godot 4.7.2 não encontrado. Defina GODOT=/caminho/para/Godot_v4.7.2-stable_linux.x86_64" >&2
  exit 3
fi

echo "[1/4] QA estática"
python3 "$ROOT/tools_static_qa.py"

echo "[2/4] Parse + QA V18 no engine"
"$G" --headless --path "$ROOT" -- --qa_v18

echo "[3/4] Regressão essencial"
for q in qa_v16 qa_v14 qa_v12 qa_v10 qa_v8 qa_v7 qa_campaign qa_all; do
  echo "  -> $q"
  "$G" --headless --path "$ROOT" -- --"$q"
done

echo "[4/4] Export Android debug arm64"
"$G" --headless --path "$ROOT" --export-debug "Android" "$OUT"
[[ -s "$OUT" ]] || { echo "ERRO: APK não foi criado" >&2; exit 4; }
echo "APK_OK: $OUT ($(du -h "$OUT" | cut -f1))"
