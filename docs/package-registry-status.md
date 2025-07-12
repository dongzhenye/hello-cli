# 包管理平台发布状态

> 最后更新: 2025-07-12

## 项目基本信息
- **项目名称**: Hello CLI
- **命令名称**: `hello`
- **GitHub 仓库**: `dongzhenye/hello-cli`
- **官方网站**: （待建设）

## 各平台发布计划

### 1. NPM (Node Package Manager)
- **包名称**: `hello-cli`
- **备选名称**: `@dongzhenye/hello`
- **发布状态**: 🔴 未发布
- **现有占用**: 存在同名包，但已废弃（9年未更新）
- **发布命令**: `npm publish`
- **安装命令**: `npm install -g hello-cli`

### 2. Homebrew (macOS/Linux)
- **包名称**: `hello-cli`
- **发布状态**: 🔴 未发布
- **发布方式**: 
  - 官方仓库：需要满足一定条件（如 GitHub stars > 75）
  - 个人 Tap：`dongzhenye/tap/hello-cli`
- **安装命令**: 
  - 官方：`brew install hello-cli`
  - Tap：`brew tap dongzhenye/tap && brew install hello-cli`

### 3. Winget (Windows Package Manager)
- **包名称**: `hello-cli`
- **发布状态**: 🔴 未发布
- **发布方式**: 提交 PR 到 microsoft/winget-pkgs
- **包 ID**: `dongzhenye.hello-cli`
- **安装命令**: `winget install hello-cli`

### 4. Scoop (Windows)
- **包名称**: `hello-cli`
- **发布状态**: 🔴 未发布
- **发布方式**: 
  - 官方 bucket：需要一定知名度
  - 个人 bucket：`dongzhenye/scoop-bucket`
- **安装命令**: `scoop install hello-cli`

### 5. Cargo (Rust)
- **包名称**: `hello-cli`
- **发布状态**: 🔴 未发布
- **说明**: 当前项目使用 Go 语言，不适用

### 6. Go Modules
- **模块路径**: `github.com/dongzhenye/hello-cli`
- **发布状态**: ✅ 自动可用
- **说明**: 通过 GitHub 仓库自动提供
- **安装命令**: `go install github.com/dongzhenye/hello-cli@latest`

### 7. AUR (Arch User Repository)
- **包名称**: `hello-cli`
- **发布状态**: 🔴 未发布
- **维护者**: （待定）
- **安装命令**: `yay -S hello-cli` 或 `paru -S hello-cli`

### 8. Snap Store (Linux)
- **包名称**: `hello-cli`
- **发布状态**: 🔴 未发布
- **安装命令**: `snap install hello-cli`

### 9. APT/YUM 仓库
- **包名称**: `hello-cli`
- **发布状态**: 🔴 未发布
- **说明**: 需要构建 .deb/.rpm 包

## 发布优先级

1. **高优先级**
   - GitHub Releases ✅
   - Go Modules ✅
   - NPM
   - Homebrew
   - Winget

2. **中优先级**
   - Scoop
   - AUR
   - Snap Store

3. **低优先级**
   - APT/YUM 仓库
   - 其他平台

## 发布检查清单

- [ ] 确保版本号一致性
- [ ] 更新 README 中的安装说明
- [ ] 创建发布标签（tag）
- [ ] 生成二进制文件（通过 GoReleaser）
- [ ] 编写发布说明（Release Notes）
- [ ] 更新本文档状态

## 版本命名规范

遵循语义化版本规范（Semantic Versioning）：
- 格式：`v主版本.次版本.修订号`
- 示例：`v1.0.0`
- 预发布：`v1.0.0-beta.1`

## 注意事项

1. **命名一致性**: 所有平台统一使用 `hello-cli` 作为包名
2. **命令保持简短**: 用户实际使用的命令为 `hello`
3. **自动化发布**: 建议配置 GitHub Actions 自动发布到各平台
4. **文档同步**: 每次发布后更新本文档状态
5. **用户反馈**: 在各平台维护用户反馈渠道

## 相关链接

- [GitHub 仓库](https://github.com/dongzhenye/hello-cli)
- [发布页面](https://github.com/dongzhenye/hello-cli/releases)
- [问题反馈](https://github.com/dongzhenye/hello-cli/issues)