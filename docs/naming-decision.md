# 项目命名决策文档

## 调研概述
- **调研日期**: 2025-07-12
- **调研目的**: 确定项目在各平台的最佳命名策略，平衡营销效果和用户体验

## 调研结果

### 1. Google 搜索竞争分析

#### "hello" 搜索结果
- **问题**: 搜索结果充斥大量无关内容
- **主要干扰**:
  - Hello World 编程教程
  - hello-rust/hello (社交媒体提交工具)
  - 各种语言的 Hello World 示例项目
- **结论**: 品牌识别度低，容易被淹没

#### "hello-cli" 搜索结果
- **优势**: 搜索结果更精准，主要是 CLI 工具相关内容
- **竞争**: 较少直接竞争对手
- **结论**: 定位清晰，用户搜索意图明确

### 2. NPM 包占用情况

#### "hello" 包
- **状态**: 已被占用
- **描述**: "👋 Hello from GitHub profiles. On the command line"
- **周下载量**: 60-347（波动较大）
- **最后更新**: 2023年11月22日（2年前）
- **版本**: 0.6.2
- **维护状态**: 基本停止维护

#### "hello-cli" 包
- **状态**: 已被占用但基本废弃
- **版本**: 0.0.3
- **最后更新**: 9年前
- **问题**: 无 README 文档
- **周下载量**: 极少
- **相关包**: 
  - @shortthirdman/hello-cli (4年前)
  - hello-cli-dp (5年前)
  - hello-cli-vic (8年前)

### 3. 其他平台占用情况

#### Homebrew
- **hello**: 被 GNU hello 占用（系统示例程序）
- **hello-cli**: 未被占用

#### Winget
- **hello**: 未被占用
- **hello-cli**: 未被占用

#### GitHub
- **hello 相关项目**:
  - HelloWorld CLI - 生成各语言 Hello World 模板的工具
  - hello-rust - 社交媒体提交工具
  - 多个教学示例项目
- **hello-cli 相关项目**:
  - nickgeudens/hello-cli (4 stars, Go 语言)
  - yunser/hello-cli (npm 包)
  - 均为小型项目，影响力有限

### 4. 其他包管理器
- **Cargo (Rust)**: 主要是示例项目，无主流占用
- **PyPI (Python)**: 有测试包但非主流
- **RubyGems**: 有示例包但非主流

## 最终决策

### 推荐方案：使用 `hello-cli`

#### 理由
1. **品牌识别度高**: "hello" 过于通用，而 "hello-cli" 明确表明是 CLI 工具
2. **搜索优势**: 避免被 Hello World 教程淹没，提高搜索精准度
3. **竞争环境**: NPM 上虽有同名包但已废弃，容易超越
4. **行业惯例**: 符合 CLI 工具命名习惯（如 vue-cli、angular-cli）
5. **营销效果**: 用户搜索 "hello-cli" 时意图明确，转化率更高

### 具体命名策略
- **项目名称**: Hello CLI
- **GitHub 仓库**: `dongzhenye/hello-cli`
- **用户命令**: `hello`（保持简短易用）
- **包管理器名称**:
  - NPM: 优先 `hello-cli`，备选 `@dongzhenye/hello`
  - Homebrew: `hello-cli`
  - Winget: `hello-cli`
  - 其他平台: 统一使用 `hello-cli`

### 执行建议
1. 保持现有项目结构和配置
2. 将 GitHub 仓库设置为 `dongzhenye/hello-cli`
3. 在各平台发布时统一使用 `hello-cli` 作为包名
4. 命令行工具保持 `hello` 以确保用户体验

## 备注
- 虽然 `hello` 更简短，但在当前互联网环境下，适度的描述性后缀反而有助于品牌建设
- 类比成功案例：`git` 是自造词所以不需要后缀，而 `hello` 作为通用词需要 `-cli` 来明确定位