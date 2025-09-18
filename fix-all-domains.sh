#!/bin/bash

# 综合域名修复脚本
# 一键修复所有AdSense相关问题

echo "🚀 AdSense域名综合修复脚本"
echo "=========================="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 检查函数
check_domain() {
    local domain=$1
    echo -e "${BLUE}🔍 检查域名: $domain${NC}"
    
    # DNS检查
    if nslookup "$domain" > /dev/null 2>&1; then
        echo -e "  ${GREEN}✅ DNS解析: 正常${NC}"
        
        # HTTP检查
        HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://$domain" 2>/dev/null)
        if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "301" ] || [ "$HTTP_CODE" = "302" ]; then
            echo -e "  ${GREEN}✅ HTTP访问: 正常 ($HTTP_CODE)${NC}"
        else
            echo -e "  ${RED}❌ HTTP访问: 失败 ($HTTP_CODE)${NC}"
        fi
        
        # HTTPS检查
        HTTPS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://$domain" 2>/dev/null)
        if [ "$HTTPS_CODE" = "200" ]; then
            echo -e "  ${GREEN}✅ HTTPS访问: 正常 ($HTTPS_CODE)${NC}"
            
            # AdSense检查
            if curl -s --max-time 10 "https://$domain" | grep -q "ca-pub-7208260866318884"; then
                echo -e "  ${GREEN}✅ AdSense代码: 已部署${NC}"
                return 0
            else
                echo -e "  ${YELLOW}⚠️ AdSense代码: 未部署${NC}"
                return 1
            fi
        else
            echo -e "  ${RED}❌ HTTPS访问: 失败 ($HTTPS_CODE)${NC}"
            return 2
        fi
    else
        echo -e "  ${RED}❌ DNS解析: 失败${NC}"
        return 3
    fi
}

# 域名列表
DOMAINS=(
    "007firstlightinfo.com"
    "pokopia.info"
    "ilovegame.online"
    "silksongmap.store"
    "silksong.store"
)

echo "📊 域名状态检查:"
echo "================"
echo ""

# 状态统计
TOTAL_DOMAINS=${#DOMAINS[@]}
WORKING_DOMAINS=0
ADSENSE_DOMAINS=0
BROKEN_DOMAINS=0

for domain in "${DOMAINS[@]}"; do
    check_domain "$domain"
    case $? in
        0) ((WORKING_DOMAINS++)); ((ADSENSE_DOMAINS++)) ;;
        1) ((WORKING_DOMAINS++)) ;;
        2|3) ((BROKEN_DOMAINS++)) ;;
    esac
    echo ""
done

echo "📈 统计结果:"
echo "============"
echo -e "总域名数: ${BLUE}$TOTAL_DOMAINS${NC}"
echo -e "可访问域名: ${GREEN}$WORKING_DOMAINS${NC}"
echo -e "已部署AdSense: ${GREEN}$ADSENSE_DOMAINS${NC}"
echo -e "无法访问域名: ${RED}$BROKEN_DOMAINS${NC}"
echo ""

# 修复建议
echo "🛠️ 修复建议:"
echo "============"
echo ""

if [ $BROKEN_DOMAINS -gt 0 ]; then
    echo -e "${RED}🔥 紧急修复 (SSL证书问题):${NC}"
    echo "1. 登录Cloudflare控制台: https://dash.cloudflare.com"
    echo "2. 检查SSL/TLS设置，确保加密模式为'完全（严格）'"
    echo "3. 检查源服务器SSL证书配置"
    echo "4. 等待SSL证书生效（通常需要几分钟到几小时）"
    echo ""
fi

if [ $ADSENSE_DOMAINS -lt $WORKING_DOMAINS ]; then
    echo -e "${YELLOW}⚠️ AdSense部署 (缺少代码):${NC}"
    echo "1. 登录AdSense控制台: https://www.google.com/adsense"
    echo "2. 创建新的广告单元"
    echo "3. 将AdSense代码部署到缺少的网站"
    echo "4. 使用提供的 adsense-template.html 模板"
    echo ""
fi

echo -e "${GREEN}✅ 优化建议:${NC}"
echo "1. 确保所有网站都有隐私政策和服务条款"
echo "2. 添加更多原创内容"
echo "3. 优化网站加载速度"
echo "4. 提交sitemap到Google Search Console"
echo ""

# 快速修复命令
echo "🚀 快速修复命令:"
echo "================"
echo ""

echo "# 测试HTTPS访问"
for domain in "${DOMAINS[@]}"; do
    echo "curl -I https://$domain"
done
echo ""

echo "# 测试AdSense代码"
for domain in "${DOMAINS[@]}"; do
    echo "curl -s https://$domain | grep 'ca-pub-7208260866318884'"
done
echo ""

# 创建修复检查脚本
cat > quick-check.sh << 'EOF'
#!/bin/bash
echo "🔍 快速域名检查"
echo "==============="
for domain in "007firstlightinfo.com" "pokopia.info" "ilovegame.online" "silksongmap.store" "silksong.store"; do
    echo "检查: $domain"
    curl -I https://$domain 2>/dev/null | head -1
    echo ""
done
EOF

chmod +x quick-check.sh

echo "📝 已创建快速检查脚本: quick-check.sh"
echo ""

echo "⏰ 修复时间表:"
echo "=============="
echo "1. SSL证书修复: 30分钟 - 2小时"
echo "2. AdSense代码部署: 15-30分钟"
echo "3. 内容优化: 1-2小时"
echo "4. 测试验证: 15分钟"
echo ""

echo "🎯 预期结果:"
echo "============"
echo "修复完成后，AdSense审核状态应该从:"
echo "- 'Not found' → 'Getting ready'"
echo "- 'Requires review' → 'Ready'"
echo "- 'Getting ready' → 'Ready'"
echo ""

echo -e "${GREEN}✅ 修复完成后，请重新运行此脚本验证结果！${NC}"
