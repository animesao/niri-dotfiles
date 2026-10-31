# 🦅 ASUS TUF Stealth Rice (Niri + Noctalia + SDDM)

Минималистичный, строгий и высокопроизводительный сетап для Wayland в стиле **ASUS TUF Stealth** (графитовый чёрный, титановое серебро, матовые плашки).

---

## 🎨 Компоненты оформления

| Компонент | Программа / Тема | Описание |
|---|---|---|
| **Экран входа** | [SDDM](https://github.com/sddm/sddm) | Кастомная тема TUF Stealth с фоном и курсором |
| **Compositor** | [Niri](https://github.com/YaLTeR/niri) | Scrollable-tiling оконный менеджер Wayland |
| **Shell / Bar** | [Noctalia](https://noctalia.dev) | Капсульная плавающая панель, виджеты, календарь |
| **Цветовая палитра** | Custom `Monochrome` | Матовый титан (`#d8dadf`), стелс-чёрный (`#111317`) |
| **Терминал** | [Alacritty](https://alacritty.org) | Прозрачность 0.5, без рамок, отступы 18px, курсор `Beam` |
| **Промпт** | [Starship](https://starship.rs) | Минималистичный однострочный промпт с ветками Git и иконками |
| **Инфо-скрин** | [Fastfetch](https://github.com/fastfetch-cli/fastfetch) | Кастомный минималистичный вывод информации о системе |
| **Шелл** | [Fish](https://fishshell.com) | Алиасы `eza` (иконки, дерево), `bat`, `zoxide` (умный `cd`) |
| **Курсор** | MaidMintFantome (24px) | Аниме-курсор с форсированием для Xwayland/игр |
| **Иконки** | Tela Circle Black Dark | Тёмно-графитовые папки и круглые иконки |
| **Обои** | ASUS TUF Stealth & Minimal | `assets/wallpapers/tuf_stealth.jpg`, `tuf_minimal.jpg` |

---

## 📁 Структура репозитория

```text
dotfiles/
├── .config/
│   ├── alacritty/          # Настройки терминала (шрифт Nerd Font, прозрачность 0.5, Beam-курсор)
│   ├── fastfetch/          # Кастомный конфиг Fastfetch со значками и лаконичным выводом
│   ├── fish/               # Fish шелл с алиасами (eza, bat, git) и интеграцией starship
│   ├── environment.d/      # Системные переменные курсора для systemd-сессии
│   ├── gtk-3.0/            # Настройки GTK 3 (иконки, курсор, dark theme)
│   ├── gtk-4.0/            # Настройки GTK 4 (libadwaita)
│   ├── micro/              # Конфиг текстового редактора micro
│   ├── niri/               # Модульная конфигурация Niri (cfg/*.kdl, фикс прозрачности)
│   ├── noctalia/           # Конфигурация Noctalia Shell (панель, капсулы)
│   └── starship.toml       # Однострочный Starship промпт в стиле TUF Stealth
├── .local/state/noctalia/  # Настройки темы и кастомная палитра Monochrome
├── assets/
│   ├── wallpapers/         # Обои tuf_stealth.jpg и tuf_minimal.jpg
│   └── icons/              # Пакет курсора MaidMintFantome
├── etc/sddm.conf.d/        # Конфигурация SDDM (тема tuf-stealth, курсор MaidMintFantome)
├── sddm/themes/tuf-stealth # Тема экрана входа SDDM под ASUS TUF
├── setup-sddm.sh           # Скрипт установки темы SDDM в систему
├── .bashrc                 # Резервный Bash с переменными
├── .gtkrc-2.0              # GTK 2 темы
├── .icons/default/         # X11 / Xwayland дефолтный курсор
├── install.sh              # Скрипт автоматической установки и применения райса
├── packages.txt            # Список пакетов
└── README.md
```

---

## 🚀 Быстрая установка

1. **Применение настроек пользователя (Niri, Noctalia, Alacritty, иконки, курсор):**
   ```bash
   cd ~/dotfiles
   ./install.sh
   ```

2. **Установка темы экрана входа (SDDM):**
   ```bash
   sudo ./setup-sddm.sh
   ```

---

## ⌨️ Горячие клавиши (Niri)

| Сочетание клавиш | Действие |
|---|---|
| `Mod + Enter` | Запуск терминала (Alacritty) |
| `Mod + Space` | Меню приложений (Noctalia Launcher) |
| `Mod + Q` | Закрыть активное окно |
| `Mod + F` | Развернуть окно на весь экран / вернуть размер |
| `Mod + Shift + E` | Открыть текстовый редактор Micro |
| `Win + Space` / `Alt + Shift` | Переключение раскладки клавиатуры (US / RU) |
| `Ctrl + Shift + S` / `Print` | Скриншот области экрана |
| `Mod + Print` | Скриншот всего экрана |
| `Mod + 1..9` | Переключение рабочих столов 1–9 |
| `Mod + Shift + 1..9` | Перемещение окна на рабочий стол 1–9 |
| `Mod + H / J / K / L` | Навигация по колонкам и окнам |

---

## 📦 Необходимые пакеты (Arch / CachyOS)

```bash
sudo pacman -S niri alacritty nautilus micro eza bat fzf sddm
yay -S noctalia
```
