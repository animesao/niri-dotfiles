# 🦅 ASUS TUF Stealth Rice (Niri + Noctalia)

Минималистичный, строгий и высокопроизводительный сетап для Wayland в стиле **ASUS TUF Stealth** (графитовый чёрный, титановое серебро, матовые плашки).

---

## 🎨 Компоненты оформления

| Компонент | Программа / Тема | Описание |
|---|---|---|
| **Compositor** | [Niri](https://github.com/YaLTeR/niri) | Scrollable-tiling оконный менеджер Wayland |
| **Shell / Bar** | [Noctalia](https://noctalia.dev) | Капсульная плавающая панель, виджеты, календарь |
| **Цветовая палитра** | Custom `Monochrome` | Матовый титан (`#d8dadf`), стелс-чёрный (`#111317`) |
| **Терминал** | [Alacritty](https://alacritty.org) | Прозрачность 0.8, палитра `#121417` / `#c0c4cc` |
| **Курсор** | MaidMintFantome (24px) | Аниме-курсор с форсированием для Xwayland/игр |
| **Иконки** | Tela Circle Black Dark | Тёмно-графитовые папки и круглые иконки |
| **Обои** | ASUS TUF Stealth Geometric | `assets/wallpapers/tuf_stealth.jpg` |

---

## 📁 Структура репозитория

```text
dotfiles/
├── .config/
│   ├── alacritty/          # Настройки терминала (прозрачность, стелс-цвета)
│   ├── environment.d/      # Системные переменные курсора для systemd-сессии
│   ├── gtk-3.0/            # Настройки GTK 3 (иконки, курсор, dark theme)
│   ├── gtk-4.0/            # Настройки GTK 4 (libadwaita)
│   ├── niri/               # Модульная конфигурация Niri (cfg/*.kdl)
│   └── noctalia/           # Конфигурация Noctalia Shell (панель, капсулы)
├── .local/state/noctalia/  # Настройки темы и кастомная палитра Monochrome
├── assets/
│   ├── wallpapers/         # Фирменные обои ASUS TUF
│   └── icons/              # Пакет курсора MaidMintFantome
├── .gtkrc-2.0              # GTK 2 темы
├── .icons/default/         # X11 / Xwayland дефолтный курсор
├── install.sh              # Скрипт автоматической установки и применения
└── README.md
```

---

## 🚀 Быстрая установка

Для применения райса на новой системе или восстановления:

```bash
cd ~/dotfiles
./install.sh
```

---

## ⌨️ Горячие клавиши (Niri)

| Сочетание клавиш | Действие |
|---|---|
| `Mod + Enter` | Запуск терминала (Alacritty) |
| `Mod + Space` | Меню приложений (Noctalia Launcher) |
| `Mod + Q` | Закрыть активное окно |
| `Mod + F` | Развернуть окно на весь экран / вернуть размер |
| `Win + Space` / `Alt + Shift` | Переключение раскладки клавиатуры (US / RU) |
| `Ctrl + Shift + S` / `Print` | Скриншот области экрана |
| `Mod + Print` | Скриншот всего экрана |
| `Mod + 1..9` | Переключение рабочих столов 1–9 |
| `Mod + Shift + 1..9` | Перемещение окна на рабочий стол 1–9 |
| `Mod + H / J / K / L` | Навигация по колонкам и окнам |

---

## 📦 Необходимые пакеты (Arch / CachyOS)

```bash
sudo pacman -S niri alacritty nautilus
# Noctalia shell (установлен через репозиторий CachyOS / AUR)
yay -S noctalia
```
