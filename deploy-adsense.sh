#!/bin/bash

# AdSense代码部署脚本
# 将AdSense代码部署到所有可访问的网站

echo "📢 AdSense代码部署脚本"
echo "====================="
echo ""

# AdSense配置
ADSENSE_CLIENT="ca-pub-7208260866318884"
ADSENSE_SLOT_1="XXXXXXXXXX"  # 需要替换为实际的广告位ID
ADSENSE_SLOT_2="XXXXXXXXXX"  # 需要替换为实际的广告位ID
ADSENSE_SLOT_3="XXXXXXXXXX"  # 需要替换为实际的广告位ID

echo "🔍 检查当前AdSense配置..."
echo "AdSense Client ID: $ADSENSE_CLIENT"
echo ""

# 检查index.html中的AdSense代码
if grep -q "$ADSENSE_CLIENT" index.html; then
    echo "✅ index.html 已包含AdSense代码"
else
    echo "❌ index.html 缺少AdSense代码"
fi

echo ""
echo "📋 需要部署AdSense代码的网站:"
echo "============================="
echo ""

# 可访问的网站列表
ACCESSIBLE_SITES=(
    "ilovegame.online"
    "silksongmap.store" 
    "silksong.store"
)

for site in "${ACCESSIBLE_SITES[@]}"; do
    echo "🌐 检查网站: $site"
    
    # 检查网站是否可访问
    if curl -s --max-time 10 "https://$site" > /dev/null 2>&1; then
        echo "  ✅ 网站可访问"
        
        # 检查AdSense代码
        if curl -s --max-time 10 "https://$site" | grep -q "$ADSENSE_CLIENT"; then
            echo "  ✅ 已包含AdSense代码"
        else
            echo "  ❌ 缺少AdSense代码 - 需要部署"
        fi
    else
        echo "  ❌ 网站无法访问"
    fi
    echo ""
done

echo "🛠️ AdSense代码部署方案:"
echo "======================"
echo ""

# 创建AdSense代码模板
cat > adsense-template.html << 'EOF'
<!-- Google AdSense -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-7208260866318884"
        crossorigin="anonymous"></script>

<!-- Ad Unit 1: Header Banner -->
<div class="ad-container hero-ad">
    <ins class="adsbygoogle"
         style="display:block"
         data-ad-client="ca-pub-7208260866318884"
         data-ad-slot="XXXXXXXXXX"
         data-ad-format="auto"
         data-full-width-responsive="true"></ins>
</div>

<!-- Ad Unit 2: Content Banner -->
<div class="ad-container content-ad">
    <ins class="adsbygoogle"
         style="display:block"
         data-ad-client="ca-pub-7208260866318884"
         data-ad-slot="XXXXXXXXXX"
         data-ad-format="auto"
         data-full-width-responsive="true"></ins>
</div>

<!-- Ad Unit 3: Sidebar Ad -->
<div class="ad-container sidebar-ad">
    <ins class="adsbygoogle"
         style="display:block"
         data-ad-client="ca-pub-7208260866318884"
         data-ad-slot="XXXXXXXXXX"
         data-ad-format="rectangle"
         data-ad-layout="in-article"></ins>
</div>

<!-- Ad Unit 4: Footer Banner -->
<div class="ad-container footer-ad">
    <ins class="adsbygoogle"
         style="display:block"
         data-ad-client="ca-pub-7208260866318884"
         data-ad-slot="XXXXXXXXXX"
         data-ad-format="auto"
         data-full-width-responsive="true"></ins>
</div>

<!-- AdSense CSS Styles -->
<style>
.ad-container {
    margin: 20px 0;
    text-align: center;
    background: #f8f9fa;
    border-radius: 8px;
    padding: 10px;
    border: 1px solid #e9ecef;
}

.ad-container.hero-ad {
    margin: 30px 0;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
}

.ad-container.content-ad {
    margin: 40px 0;
    background: #ffffff;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.ad-container.sidebar-ad {
    margin: 30px 0;
    background: #f8f9fa;
    border: 2px dashed #dee2e6;
}

.ad-container.footer-ad {
    margin: 20px 0;
    background: #343a40;
    color: white;
    border: none;
}

@media (max-width: 768px) {
    .ad-container {
        margin: 15px 0;
        padding: 8px;
    }
}
</style>

<!-- Initialize AdSense -->
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
(adsbygoogle = window.adsbygoogle || []).push({});
(adsbygoogle = window.adsbygoogle || []).push({});
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
EOF

echo "📝 已创建AdSense代码模板: adsense-template.html"
echo ""

echo "📋 部署步骤:"
echo "============"
echo ""
echo "1. 🔧 获取AdSense广告位ID:"
echo "   - 登录AdSense控制台"
echo "   - 创建新的广告单元"
echo "   - 复制广告位ID"
echo ""

echo "2. 📝 更新代码模板:"
echo "   - 编辑 adsense-template.html"
echo "   - 替换所有 'XXXXXXXXXX' 为实际广告位ID"
echo ""

echo "3. 🚀 部署到各网站:"
echo "   - 将代码添加到各网站的HTML文件中"
echo "   - 确保代码在 <head> 和 <body> 中正确放置"
echo ""

echo "4. ✅ 验证部署:"
echo "   - 访问各网站检查广告显示"
echo "   - 使用浏览器开发者工具检查控制台错误"
echo ""

echo "🎯 部署优先级:"
echo "=============="
echo "1. 🔥 紧急: ilovegame.online (可访问，缺少AdSense)"
echo "2. 🔥 紧急: silksongmap.store (可访问，缺少AdSense)"
echo "3. ⚡ 重要: silksong.store (可访问，已有AdSense，需验证)"
echo ""

echo "📊 AdSense审核要求:"
echo "=================="
echo "- 网站必须完全可访问"
echo "- 必须有足够的原创内容"
echo "- 必须有隐私政策和服务条款"
echo "- 必须有正确的AdSense代码"
echo "- 网站必须符合AdSense政策"
echo ""

echo "🔗 有用链接:"
echo "============"
echo "- AdSense控制台: https://www.google.com/adsense"
echo "- AdSense政策: https://support.google.com/adsense/answer/23921"
echo "- 广告位创建: https://support.google.com/adsense/answer/181947"
echo ""

echo "✅ 完成部署后，AdSense审核状态应该会显著改善！"
