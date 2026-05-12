#!/bin/bash
# Setup Git pour ce dossier Dropbox + push vers github.com/vpourdesign/chiro
# Usage : dans Terminal, cd dans ce dossier, puis: bash setup-git.sh

set -e
cd "$(dirname "$0")"

echo "→ Nettoyage des locks Dropbox/Git..."
rm -f .git/index.lock .git/HEAD.lock 2>/dev/null || true

echo "→ Dire à Dropbox d'ignorer le dossier .git (évite les futurs conflits)..."
xattr -w com.dropbox.ignored 1 .git 2>/dev/null || true

echo "→ Récupération du readme.txt depuis origin..."
git checkout origin/main -- readme.txt 2>/dev/null || true

echo "→ Ajout des fichiers..."
git add .gitignore readme.txt guide-telus-sante-mobile.html Audit_Google_Ads_Centre_Chiro_Sante.docx Audit_Google_Ads_Centre_Chiro_Sante.pdf 2>/dev/null || true

echo "→ Commit..."
git commit -m "Initial commit: audit Google Ads + guide TELUS Santé"

echo "→ Push vers github.com/vpourdesign/chiro..."
git push -u origin main

echo ""
echo "✓ Terminé. Ton dossier Dropbox est maintenant un clone Git de vpourdesign/chiro."
echo "  Pour les prochains changements : git add <fichier> && git commit -m \"...\" && git push"
