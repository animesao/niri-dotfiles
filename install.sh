#!/usr/bin/env bash
# ==============================================================================
# ASUS TUF Stealth Rice Installer
# Setup: Niri + Noctalia Shell + Alacritty + Tela Icons + MaidMintFantome Cursor
# ==============================================================================

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Установка dotfiles из ${DOTFILES_DIR}..."

# 1. Создание необходимых директорий
mkdir -p "${HOME}/.config/niri"
mkdir -p "${HOME}/.config/noctalia"
mkdir -p "${HOME}/.config/alacritty"
mkdir -p "${HOME}/.config/gtk-3.0"
mkdir -p "${HOME}/.config/gtk-4.0"
mkdir -p "${HOME}/.config/environment.d"
mkdir -p "${HOME}/.local/state/noctalia/community-palettes"
mkdir -p "${HOME}/.local/share/icons"
mkdir -p "${HOME}/.icons/default"
mkdir -p "${HOME}/Изображения/Wallpapers"
mkdir -p "${HOME}/Изображения/Screenshots"

# 2. Копирование конфигураций .config
echo "==> Копирование конфигураций..."
cp -r "${DOTFILES_DIR}/.config/niri/"* "${HOME}/.config/niri/"
cp "${DOTFILES_DIR}/.config/noctalia/config.toml" "${HOME}/.config/noctalia/"
cp "${DOTFILES_DIR}/.config/alacritty/alacritty.toml" "${HOME}/.config/alacritty/"
cp "${DOTFILES_DIR}/.config/gtk-3.0/settings.ini" "${HOME}/.config/gtk-3.0/"
cp "${DOTFILES_DIR}/.config/gtk-4.0/settings.ini" "${HOME}/.config/gtk-4.0/"
cp "${DOTFILES_DIR}/.config/environment.d/10-cursor.conf" "${HOME}/.config/environment.d/"
cp "${DOTFILES_DIR}/.gtkrc-2.0" "${HOME}/.gtkrc-2.0"

# 3. Тема Noctalia и палитра
echo "==> Настройка темы Noctalia..."
cp "${DOTFILES_DIR}/.local/state/noctalia/settings.toml" "${HOME}/.local/state/noctalia/"
cp "${DOTFILES_DIR}/.local/state/noctalia/community-palettes/Monochrome.json" "${HOME}/.local/state/noctalia/community-palettes/"

# 4. Обои
echo "==> Установка обоев..."
cp "${DOTFILES_DIR}/assets/wallpapers/tuf_stealth.jpg" "${HOME}/Изображения/Wallpapers/tuf_stealth.jpg"

# 5. Курсор MaidMintFantome
echo "==> Установка курсора MaidMintFantome..."
cp -r "${DOTFILES_DIR}/assets/icons/MaidMintFantome" "${HOME}/.local/share/icons/"
ln -sfn "${HOME}/.local/share/icons/MaidMintFantome" "${HOME}/.icons/MaidMintFantome"
cp "${DOTFILES_DIR}/.icons/default/index.theme" "${HOME}/.icons/default/index.theme"

# Принудительный оверрайд capitaine-cursors для Xwayland/Java/игр
mkdir -p "${HOME}/.local/share/icons/capitaine-cursors" "${HOME}/.icons/capitaine-cursors"
ln -sfn "${HOME}/.local/share/icons/MaidMintFantome/cursors" "${HOME}/.local/share/icons/capitaine-cursors/cursors"
ln -sfn "${HOME}/.local/share/icons/MaidMintFantome/cursors" "${HOME}/.icons/capitaine-cursors/cursors"

# 6. Иконки Tela-circle-black-dark
if [ ! -d "${HOME}/.local/share/icons/Tela-circle-black-dark" ]; then
    echo "==> Скачивание и сборка Tela-circle иконок..."
    git clone --depth 1 https://github.com/vinceliuice/Tela-circle-icon-theme.git /tmp/tela-circle-install
    (cd /tmp/tela-circle-install && ./install.sh -d "${HOME}/.local/share/icons" black grey)
    rm -rf /tmp/tela-circle-install
fi

# 7. Применение тем в gsettings
echo "==> Применение настроек интерфейса..."
gsettings set org.gnome.desktop.interface cursor-theme 'MaidMintFantome'
gsettings set org.gnome.desktop.interface cursor-size 24
gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-black-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# 8. Перезагрузка служб при запущенной сессии
if command -v noctalia &>/dev/null; then
    echo "==> Обновление Noctalia..."
    noctalia msg wallpaper-set "${HOME}/Изображения/Wallpapers/tuf_stealth.jpg" 2>/dev/null || true
    noctalia msg color-scheme-set community Monochrome 2>/dev/null || true
    noctalia msg config-reload 2>/dev/null || true
fi

if command -v niri &>/dev/null; then
    echo "==> Перезагрузка конфигурации Niri..."
    niri msg action load-config-file 2>/dev/null || true
fi

echo "=========================================================="
echo " Готово! Райс ASUS TUF Stealth успешно применён! "
echo "=========================================================="
