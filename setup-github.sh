#!/bin/bash
# ============================================================
# FitContent NL — GitHub Setup Script
# Voer uit vanuit de fitcontent-nl map
# ============================================================

echo "=== FitContent NL GitHub Setup ==="

# 1. Init git repo
git init
git add .
git commit -m "feat: initiële landing page FitContent NL"

# 2. Maak GitHub repo aan (publiek voor GitHub Pages gratis)
gh repo create fitcontent-nl \
  --public \
  --description "Nederlandstalige Instagram templates voor personal trainers" \
  --source=. \
  --remote=origin \
  --push

echo ""
echo "✅ Repo aangemaakt: https://github.com/ritco/fitcontent-nl"
echo ""

# 3. Activeer GitHub Pages via API
gh api repos/ritco/fitcontent-nl/pages \
  --method POST \
  --field source='{"branch":"main","path":"/"}' 2>/dev/null || echo "ℹ️  GitHub Pages: activeer handmatig via Settings → Pages → Branch: main"

echo ""
echo "=== Setup klaar ==="
echo "Landing page: https://ritco.github.io/fitcontent-nl"
echo "Custom domein: voeg CNAME toe in Settings → Pages"
echo ""
