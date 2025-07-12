# Winget 发布指南

本文档记录了将 Hello CLI 发布到 Windows Package Manager (winget) 的完整流程。

## 前置要求

- [ ] GitHub 账号
- [ ] Windows 10/11 环境（用于测试）
- [ ] 已发布的 GitHub Release
- [ ] 二进制文件的 SHA256 值

## 发布流程

### 1. Claude Code 已完成的部分 ✅

#### 1.1 创建 Manifest 文件结构
```
winget-manifests/
└── manifests/
    └── d/
        └── dongzhenye/
            └── hello-cli/
                └── 0.1.0/
                    ├── dongzhenye.hello-cli.yaml          # 版本文件
                    ├── dongzhenye.hello-cli.installer.yaml # 安装程序信息
                    └── dongzhenye.hello-cli.locale.en-US.yaml # 默认语言包
```

#### 1.2 生成的文件说明

- **版本文件**: 定义包标识符、版本号和清单类型
- **安装程序文件**: 包含下载 URL、架构、SHA256 等信息
- **语言文件**: 包含描述、标签、发布说明等元数据

#### 1.3 SHA256 更新脚本
已创建 `winget-manifests/update-sha256.sh` 脚本，用于自动获取二进制文件的 SHA256 值。

### 2. 需要手动完成的部分 ❌

#### 2.1 更新 SHA256 值
```bash
# 在 macOS/Linux 上运行（需要先发布 Release）
cd winget-manifests
./update-sha256.sh
```

#### 2.2 Fork 仓库
1. 访问 https://github.com/microsoft/winget-pkgs
2. 点击右上角的 "Fork" 按钮
3. 等待 Fork 完成

#### 2.3 克隆并创建分支
```bash
# 克隆你的 fork
git clone https://github.com/YOUR_USERNAME/winget-pkgs.git
cd winget-pkgs

# 创建新分支
git checkout -b add-hello-cli-0.1.0
```

#### 2.4 复制 manifest 文件
```bash
# 将生成的 manifest 文件复制到正确位置
cp -r path/to/hello-cli/winget-manifests/manifests/d/dongzhenye/hello-cli/0.1.0 \
      manifests/d/dongzhenye/hello-cli/
```

#### 2.5 本地验证（Windows 环境）
```powershell
# 启用本地 manifest 文件
winget settings --enable LocalManifestFiles

# 验证 manifest
winget validate manifests\d\dongzhenye\hello-cli\0.1.0

# 测试安装
winget install --manifest manifests\d\dongzhenye\hello-cli\0.1.0
```

#### 2.6 提交并推送
```bash
# 添加文件
git add manifests/d/dongzhenye/hello-cli/0.1.0

# 提交
git commit -m "New package: dongzhenye.hello-cli version 0.1.0"

# 推送到你的 fork
git push origin add-hello-cli-0.1.0
```

#### 2.7 创建 Pull Request
1. 访问你的 fork: `https://github.com/YOUR_USERNAME/winget-pkgs`
2. 点击 "Compare & pull request" 按钮
3. 填写 PR 描述：
   ```
   ## New Package: dongzhenye.hello-cli
   
   - **Package**: dongzhenye.hello-cli
   - **Version**: 0.1.0
   - **Description**: Say hello to your terminal — and it finally answers
   - **Publisher**: Zhenye Dong
   - **License**: MIT
   
   ### Testing
   - [ ] Tested installation on Windows 10/11
   - [ ] Verified silent install works
   - [ ] Command `hello` works after installation
   ```

### 3. 审核流程

提交 PR 后，Microsoft Bot 会自动：
1. 验证 YAML 格式
2. 检查必填字段
3. 测试下载链接
4. 验证 SHA256
5. 运行安装测试

如果有问题，Bot 会添加标签并留言。你有 7 天时间修复问题。

### 4. 后续版本更新

可以使用 WingetCreate 工具简化更新流程：
```powershell
# 安装 WingetCreate
winget install Microsoft.WingetCreate

# 更新到新版本
wingetcreate update dongzhenye.hello-cli -v 0.2.0 -u https://github.com/dongzhenye/hello-cli/releases/download/v0.2.0/hello_0.2.0_windows_amd64.exe
```

## 注意事项

1. **命名规范**: PackageIdentifier 必须是 `Publisher.Package` 格式
2. **版本号**: 使用语义化版本，去掉 `v` 前缀
3. **静默安装**: portable 类型自动支持静默安装
4. **测试**: 务必在 Windows 环境测试安装
5. **更新频率**: 避免频繁更新，建议稳定版本再提交

## 常见问题

### Q: SHA256 在哪里获取？
A: 运行提供的 `update-sha256.sh` 脚本，或在 Windows 上使用：
```powershell
CertUtil -hashfile hello.exe SHA256
```

### Q: 为什么选择 portable 类型？
A: Hello CLI 是单个可执行文件，无需安装程序，portable 类型最合适。

### Q: 提交后多久会合并？
A: 通常 1-3 天，取决于审核队列长度。

## 相关链接

- [Winget 官方文档](https://learn.microsoft.com/windows/package-manager/)
- [Manifest 架构参考](https://github.com/microsoft/winget-cli/blob/master/doc/ManifestSpecv1.6.md)
- [winget-pkgs 仓库](https://github.com/microsoft/winget-pkgs)
- [WingetCreate 工具](https://github.com/microsoft/winget-create)