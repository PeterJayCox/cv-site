#!/usr/bin/env bash
# Peter Cox CV — publish build for cv.peterjaycox.com (GitHub Pages, main/docs).
# Source of truth is the working copy in ~/Desktop/Hermes/Peter Cox CV/;
# this stages the 4 deploy files into docs/ inside THIS standalone repo.
# PRIVATE SITE: index.html carries <meta name="robots" content="noindex, nofollow">
# and robots.txt is Disallow: / — never publish without both intact.
set -euo pipefail
SRC=~/Desktop/Hermes/"Peter Cox CV"
OUT="$(cd "$(dirname "$0")/.." && pwd)"
rm -rf "$OUT/docs"
mkdir -p "$OUT/docs"
cp "$SRC/Peter Cox CV.html" "$OUT/docs/index.html"
cp "$SRC/peter-cox.png" "$OUT/docs/"
cp "$SRC/robots.txt" "$OUT/docs/"
printf 'cv.peterjaycox.com' > "$OUT/docs/CNAME"
printf 'cv.peterjaycox.com' > "$OUT/CNAME"
echo "CV publish build OK — docs/ has $(ls "$OUT/docs" | wc -l | tr -d ' ') file(s)"
grep -q 'noindex' "$OUT/docs/index.html" && echo "noindex meta: present" || { echo "FATAL: noindex meta missing"; exit 1; }
grep -q 'Disallow: /' "$OUT/docs/robots.txt" && echo "robots Disallow: present" || { echo "FATAL: robots Disallow missing"; exit 1; }