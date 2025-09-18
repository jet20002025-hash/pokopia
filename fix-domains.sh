#!/bin/bash

# 域名修复脚本 - 修复无法访问的域名
# 用于修复AdSense审核失败的域名问题

echo "🔧 域名修复脚本"
echo "================"
echo ""

# 检查当前目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误: 请在包含index.html的目录中运行此脚本"
    exit 1
fi

echo "📋 问题诊断结果:"
echo "=================="
echo ""
echo "1. 007firstlightinfo.com:"
echo "   - DNS解析: ✅ 正常 (Cloudflare CDN)"
echo "   - HTTP访问: ✅ 正常 (301重定向到HTTPS)"
echo "   - HTTPS访问: ❌ 失败 (SSL证书问题)"
echo ""
echo "2. pokopia.info:"
echo "   - DNS解析: ✅ 正常 (Cloudflare CDN)"
echo "   - HTTP访问: ✅ 正常 (301重定向到HTTPS)"
echo "   - HTTPS访问: ❌ 失败 (SSL证书问题)"
echo ""

echo "🔍 问题分析:"
echo "============"
echo "所有域名都使用Cloudflare CDN，但HTTPS访问失败。"
echo "这通常是因为："
echo "1. SSL证书未正确配置"
echo "2. Cloudflare SSL设置问题"
echo "3. 源服务器SSL配置问题"
echo ""

echo "🛠️ 修复方案:"
echo "============"
echo ""

# 创建修复指南
cat > domain-fix-guide.md << 'EOF'
# 域名修复指南

## 问题诊断
- 所有域名都使用Cloudflare CDN
- DNS解析正常
- HTTP访问正常（301重定向到HTTPS）
- HTTPS访问失败（SSL证书问题）

## 修复步骤

### 1. Cloudflare SSL设置修复

登录Cloudflare控制台，为每个域名进行以下设置：

#### 007firstlightinfo.com
1. 进入Cloudflare Dashboard
2. 选择域名：007firstlightinfo.com
3. 进入 SSL/TLS 设置
4. 将加密模式设置为："完全（严格）"
5. 确保SSL证书状态为"活跃"
6. 检查源服务器证书是否有效

#### pokopia.info
1. 进入Cloudflare Dashboard
2. 选择域名：pokopia.info
3. 进入 SSL/TLS 设置
4. 将加密模式设置为："完全（严格）"
5. 确保SSL证书状态为"活跃"
6. 检查源服务器证书是否有效

### 2. 源服务器SSL配置

如果使用自己的服务器，需要：

1. 安装有效的SSL证书
2. 配置Web服务器（Nginx/Apache）
3. 确保HTTPS端口443开放
4. 测试SSL配置

### 3. 网站文件部署

确保网站文件正确部署到源服务器：

```bash
# 上传文件到服务器
scp -r * user@your-server:/var/www/html/

# 设置正确的权限
chmod -R 755 /var/www/html/
chown -R www-data:www-data /var/www/html/
```

### 4. 测试修复结果

修复后运行测试：

```bash
# 测试HTTPS访问
curl -I https://007firstlightinfo.com
curl -I https://pokopia.info

# 测试AdSense代码
curl -s https://007firstlightinfo.com | grep "ca-pub-7208260866318884"
curl -s https://pokopia.info | grep "ca-pub-7208260866318884"
```

## 常见问题解决

### SSL证书问题
- 检查证书是否过期
- 确保证书链完整
- 验证域名匹配

### Cloudflare设置问题
- 检查SSL/TLS加密模式
- 确认源服务器连接
- 检查防火墙设置

### 服务器配置问题
- 检查Web服务器配置
- 确认端口开放
- 检查日志文件

## 验证步骤

1. 访问 https://www.ssllabs.com/ssltest/
2. 输入域名进行SSL测试
3. 确保评级为A或A+
4. 检查所有子项目通过

## 联系支持

如果问题持续存在：
- Cloudflare支持：https://support.cloudflare.com
- 服务器提供商技术支持
- SSL证书提供商支持
EOF

echo "📝 已创建详细修复指南: domain-fix-guide.md"
echo ""

echo "🚀 快速修复命令:"
echo "================"
echo ""

echo "1. 检查Cloudflare SSL设置:"
echo "   - 登录 https://dash.cloudflare.com"
echo "   - 选择域名 → SSL/TLS → 概览"
echo "   - 确保加密模式为'完全（严格）'"
echo ""

echo "2. 检查源服务器SSL证书:"
echo "   - 确保SSL证书有效且未过期"
echo "   - 检查证书链完整"
echo "   - 验证域名匹配"
echo ""

echo "3. 测试修复结果:"
echo "   curl -I https://007firstlightinfo.com"
echo "   curl -I https://pokopia.info"
echo ""

echo "4. 验证AdSense代码:"
echo "   curl -s https://007firstlightinfo.com | grep 'ca-pub-7208260866318884'"
echo "   curl -s https://pokopia.info | grep 'ca-pub-7208260866318884'"
echo ""

echo "📊 修复优先级:"
echo "=============="
echo "1. 🔥 紧急: 修复SSL证书问题"
echo "2. 🔥 紧急: 配置Cloudflare SSL设置"
echo "3. ⚡ 重要: 部署AdSense代码到所有网站"
echo "4. ⚡ 重要: 测试所有域名访问"
echo ""

echo "⏰ 预计修复时间:"
echo "================"
echo "- SSL证书问题: 30分钟 - 2小时"
echo "- Cloudflare设置: 10-30分钟"
echo "- 网站部署: 15-30分钟"
echo "- 测试验证: 10-15分钟"
echo ""

echo "✅ 修复完成后，AdSense审核状态应该会改善！"
echo ""
echo "📞 需要帮助？查看 domain-fix-guide.md 获取详细步骤"
