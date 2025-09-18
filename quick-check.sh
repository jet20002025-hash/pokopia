#!/bin/bash
echo "🔍 快速域名检查"
echo "==============="
for domain in "007firstlightinfo.com" "pokopia.info" "ilovegame.online" "silksongmap.store" "silksong.store"; do
    echo "检查: $domain"
    curl -I https://$domain 2>/dev/null | head -1
    echo ""
done
