#!/bin/bash

# Скрипт для генерації іконок з SVG файлу
# Потрібен imagemagick: brew install imagemagick (на macOS)

echo "🎨 Генерація іконок для Chrome розширення..."

# Перевірка наявності imagemagick
if ! command -v convert &> /dev/null; then
    echo "❌ ImageMagick не знайдено!"
    echo ""
    echo "📦 Встановіть його:"
    echo "  macOS:  brew install imagemagick"
    echo "  Ubuntu: sudo apt-get install imagemagick"
    echo "  Fedora: sudo dnf install imagemagick"
    echo ""
    echo "✨ Рекомендуємо використати веб-генератор (найпростіший спосіб):"
    echo "  1. Відкрийте icon-generator.html в браузері"
    echo "  2. Натисніть '📥 Завантажити всі іконки (ZIP)'"
    echo "  3. Розпакуйте архів в цю папку"
    echo ""
    echo "📝 Альтернативний спосіб:"
    echo "  1. Відкрийте logo.svg в браузері"
    echo "  2. Зробіть screenshot"
    echo "  3. Використайте онлайн сервіс для resize (iloveimg.com)"
    echo "  4. Створіть 4 файли: icon16.png, icon32.png, icon48.png, icon128.png"
    exit 1
fi

cd "$(dirname "$0")"

# Перевірка наявності logo.svg
if [ ! -f "logo.svg" ]; then
    echo "❌ Файл logo.svg не знайдено!"
    echo "Переконайтеся, що ви запускаєте скрипт з папки icons/"
    exit 1
fi

echo "📐 Генерація PNG іконок..."

# Генерація PNG з різними розмірами
convert logo.svg -resize 16x16 icon16.png 2>/dev/null
convert logo.svg -resize 32x32 icon32.png 2>/dev/null
convert logo.svg -resize 48x48 icon48.png 2>/dev/null
convert logo.svg -resize 128x128 icon128.png 2>/dev/null

# Перевірка успіху
if [ -f "icon16.png" ] && [ -f "icon32.png" ] && [ -f "icon48.png" ] && [ -f "icon128.png" ]; then
    echo "✅ Іконки створено успішно!"
    echo "  ✓ icon16.png  (16×16 px)"
    echo "  ✓ icon32.png  (32×32 px)"
    echo "  ✓ icon48.png  (48×48 px)"
    echo "  ✓ icon128.png (128×128 px)"
    echo ""
    echo "🚀 Розширення готове до встановлення!"
else
    echo "⚠️  Увага: Деякі іконки можливо не створилися"
    echo "💡 Спробуйте використати icon-generator.html для кращого результату"
    exit 1
fi
