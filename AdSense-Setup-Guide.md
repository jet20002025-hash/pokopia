# Google AdSense 设置指南

## 🎯 已完成的集成

### ✅ 1. AdSense 脚本已添加
- 在 `<head>` 中添加了 AdSense 脚本
- 更新了 CSP 策略以允许 AdSense 脚本
- 添加了 `crossorigin="anonymous"` 属性

### ✅ 2. 广告单元已添加
- **Hero Banner**: 页面顶部横幅广告
- **Content Banner**: 内容区域横幅广告  
- **Sidebar Ad**: 侧边栏矩形广告
- **Footer Banner**: 页面底部横幅广告

### ✅ 3. CSS 样式已添加
- 响应式广告容器样式
- 不同位置的广告样式
- 移动端适配

### ✅ 4. JavaScript 初始化已添加
- AdSense 广告自动初始化脚本

## 🔧 需要您完成的步骤

### 1. 申请 AdSense 账户
1. 访问 [Google AdSense](https://www.google.com/adsense/)
2. 点击 "开始使用"
3. 选择 "网站" 作为内容类型
4. 输入您的网站 URL: `https://pokopia.info`

### 2. 获取 AdSense 代码
1. 登录 AdSense 控制台
2. 点击 "广告" → "按广告单元"
3. 创建新的广告单元
4. 复制您的 `ca-pub-` 代码

### 3. 替换代码中的占位符
在 `index.html` 中找到以下占位符并替换：

```html
<!-- 替换这个 -->
data-ad-client="ca-pub-XXXXXXXXXXXXXXXX"

<!-- 替换为您的实际代码 -->
data-ad-client="ca-pub-1234567890123456"
```

```html
<!-- 替换这个 -->
data-ad-slot="XXXXXXXXXX"

<!-- 替换为您的实际广告位代码 -->
data-ad-slot="1234567890"
```

### 4. 更新 AdSense 脚本
```html
<!-- 替换这个 -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-XXXXXXXXXXXXXXXX"

<!-- 替换为您的实际代码 -->
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-1234567890123456"
```

## 📍 广告位置说明

### 1. Hero Banner (页面顶部)
- **位置**: 在主要内容区域上方
- **类型**: 自动调整横幅
- **样式**: 渐变背景，突出显示

### 2. Content Banner (内容区域)
- **位置**: 在游戏介绍和 Pokédex 之间
- **类型**: 自动调整横幅
- **样式**: 白色背景，阴影效果

### 3. Sidebar Ad (侧边栏)
- **位置**: 在 Pokédex 和 Wiki 之间
- **类型**: 矩形广告
- **样式**: 虚线边框，灰色背景

### 4. Footer Banner (页面底部)
- **位置**: 在主要内容和页脚之间
- **类型**: 自动调整横幅
- **样式**: 深色背景

## 🎨 广告样式特点

- **响应式设计**: 自动适配移动端和桌面端
- **美观集成**: 与网站设计风格一致
- **用户体验**: 不影响内容阅读
- **性能优化**: 异步加载，不阻塞页面

## ⚠️ 重要提醒

### AdSense 政策要求
1. **内容质量**: 确保网站内容原创且有价值
2. **流量要求**: 需要一定的访问量
3. **政策合规**: 遵守 AdSense 内容政策
4. **审核时间**: 通常需要 1-7 天审核

### 优化建议
1. **广告密度**: 不要超过 3 个广告单元
2. **用户体验**: 确保广告不影响用户阅读
3. **移动优化**: 确保移动端显示正常
4. **加载速度**: 监控页面加载性能

## 🚀 部署步骤

1. **更新代码**: 替换所有占位符
2. **上传文件**: 将更新后的 `index.html` 上传到 GitHub
3. **测试网站**: 确保网站正常显示
4. **提交审核**: 在 AdSense 中提交网站审核
5. **等待批准**: 通常需要 1-7 天

## 📊 预期效果

- **收入来源**: 通过广告点击和展示获得收入
- **用户体验**: 保持网站美观和功能完整
- **SEO 影响**: 最小化对搜索引擎优化的影响
- **性能影响**: 异步加载，不影响页面速度

## 🔍 故障排除

### 常见问题
1. **广告不显示**: 检查 AdSense 代码是否正确
2. **审核被拒**: 检查内容质量和政策合规性
3. **收入较低**: 优化广告位置和网站流量
4. **移动端问题**: 检查响应式设计

### 联系支持
- AdSense 帮助中心: https://support.google.com/adsense
- 社区论坛: https://productforums.google.com/forum/#!forum/adsense

---

**注意**: 请确保在替换代码后测试网站功能，确保所有功能正常工作！

