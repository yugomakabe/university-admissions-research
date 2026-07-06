#!/bin/bash
# exam-report-format/scripts/format-report.sh
# 大学入試調査レポート整形の前処理スクリプト
# 使い方: bash .claude/skills/exam-report-format/scripts/format-report.sh <入力ファイル> <出力ファイル>
#
# 役割: 入出力パスの検証と出力先ディレクトリの作成を行う
#       実際の整形処理はClaudeが担当する

set -euo pipefail

INPUT_FILE="$1"
OUTPUT_FILE="$2"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE="$SCRIPT_DIR/../templates/exam-report-template.md"

# 入力ファイルの存在確認
if [ ! -f "$INPUT_FILE" ]; then
  echo "エラー：入力ファイルが見つかりません: $INPUT_FILE" >&2
  exit 1
fi

# テンプレートの存在確認
if [ ! -f "$TEMPLATE" ]; then
  echo "エラー：テンプレートが見つかりません: $TEMPLATE" >&2
  exit 1
fi

# 出力先ディレクトリを作成（存在しない場合）
OUTPUT_DIR="$(dirname "$OUTPUT_FILE")"
mkdir -p "$OUTPUT_DIR"

echo "=========================================="
echo "大学入試調査レポート整形スクリプト"
echo "=========================================="
echo "入力：$INPUT_FILE"
echo "出力：$OUTPUT_FILE"
echo "テンプレート：$TEMPLATE"
echo "整形準備完了。Claudeが整形を開始します。"
