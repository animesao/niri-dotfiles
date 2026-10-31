#!/usr/bin/env bash
# ==============================================================================
# Setup SDDM Theme: TUF Stealth + MaidMintFantome Cursor
# ==============================================================================

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$EUID" -ne 0 ]; then
    echo "==> Перезапуск скрипта с правами sudo..."
    exec sudo bash "$0" "$@"
fi

echo "==> Установка темы SDDM TUF Stealth..."
mkdir -p /etc/sddm.conf.d
mkdir -p /usr/share/sddm/themes
mkdir -p /usr/share/icons

# 1. Установка конфигурации темы
cp "${DIR}/etc/sddm.conf.d/10-theme.conf" /etc/sddm.conf.d/10-theme.conf

# 2. Установка самой темы
cp -r "${DIR}/sddm/themes/tuf-stealth" /usr/share/sddm/themes/

# 3. Системная установка курсора MaidMintFantome для SDDM
if [ -d "${DIR}/assets/icons/MaidMintFantome" ]; then
    cp -r "${DIR}/assets/icons/MaidMintFantome" /usr/share/icons/
fi

echo "==> Тема SDDM TUF Stealth успешно установлена!"
echo "Для проверки внешнего вида экрана входа выполните:"
echo "  sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/tuf-stealth"
