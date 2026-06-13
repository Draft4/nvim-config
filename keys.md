# Neovim / LazyVim 快捷键与基础操作速查

更新时间：2026-06-08  
当前配置来源：本目录 `lazyvim.json`、`lua/config/keymaps.lua`，以及当前已安装 LazyVim 的实际 keymap 抽取结果。  
当前 `<leader>` 是空格键 `<Space>`，`<localleader>` 是反斜杠 `\`。

## 0. 先记住这几个规则

- LazyVim 使用 `which-key.nvim`。在普通模式按 `<leader>` 后停一下，会弹出后续可用按键提示。
- 本文里的 `<leader>ff` 等价于“先按空格，再按 `f`，再按 `f`”。
- `<C-x>` 表示 `Ctrl+x`，`<A-x>` 表示 `Alt/Option+x`，`<S-x>` 表示 `Shift+x`。
- `n` 表示普通模式，`i` 插入模式，`v` 可视模式，`x` 可视选择模式，`o` 操作符等待模式，`t` 终端模式。
- 大多数 Vim 命令都可以带次数：`3j` 下移 3 行，`5dd` 删除 5 行，`2w` 向后移动 2 个单词。
- 很多编辑命令遵循“操作符 + 移动”的语法：`d{motion}` 删除，`y{motion}` 复制，`c{motion}` 修改。

## 1. 模式切换

| 按键 | 作用 |
| --- | --- |
| `i` | 在光标前进入插入模式 |
| `I` | 到行首第一个非空字符前插入 |
| `a` | 在光标后进入插入模式 |
| `A` | 到行尾追加 |
| `o` | 在当前行下方新建一行并插入 |
| `O` | 在当前行上方新建一行并插入 |
| `Esc` | 回到普通模式；LazyVim 里还会清除搜索高亮、停止 snippet |
| `v` | 字符可视模式 |
| `V` | 行可视模式 |
| `<C-v>` | 块可视模式 |
| `:` | 命令行模式 |
| `/` | 向下搜索 |
| `?` | 向上搜索 |

常见习惯：编辑时尽量短暂停留在插入模式，完成输入后按 `Esc` 回普通模式，再用移动、复制、删除等命令操作文本。

## 2. 基础移动

| 按键 | 作用 |
| --- | --- |
| `h` / `j` / `k` / `l` | 左 / 下 / 上 / 右 |
| `w` | 到下一个单词开头 |
| `W` | 到下一个以空白分隔的 WORD 开头 |
| `b` | 到上一个单词开头 |
| `B` | 到上一个 WORD 开头 |
| `e` | 到当前或下一个单词结尾 |
| `E` | 到当前或下一个 WORD 结尾 |
| `0` | 到行首 |
| `^` | 到本行第一个非空字符 |
| `$` | 到行尾 |
| `g_` | 到本行最后一个非空字符 |
| `gg` | 到文件开头 |
| `G` | 到文件结尾 |
| `{number}G` | 到指定行，例如 `42G` |
| `:{number}` | 到指定行，例如 `:42` |
| `%` | 在匹配括号、标签等之间跳转 |
| `f{char}` | 在当前行向右找字符，例如 `fa` |
| `F{char}` | 在当前行向左找字符 |
| `t{char}` | 到右侧某字符之前 |
| `T{char}` | 到左侧某字符之后 |
| `;` | 重复上一次 `f/F/t/T` |
| `,` | 反向重复上一次 `f/F/t/T` |
| `<C-d>` | 向下滚动半屏 |
| `<C-u>` | 向上滚动半屏 |
| `<C-f>` | 向下滚动一屏 |
| `<C-b>` | 向上滚动一屏 |
| `zz` | 当前行居中 |
| `zt` | 当前行置顶 |
| `zb` | 当前行置底 |

LazyVim 改进了普通模式和可视模式里的 `j` / `k`：没有次数时按屏幕折行移动，有次数时按真实行移动。因此长行被自动换行时，`j` 更接近日常直觉。

## 3. 复制、粘贴、删除、修改

Vim 里“复制”叫 yank，也就是 `y`。

| 按键 | 作用 |
| --- | --- |
| `yy` / `Y` | 复制整行 |
| `yw` | 从光标复制到单词末尾 |
| `yiw` | 复制光标所在单词，不含周围空白 |
| `yaw` | 复制光标所在单词，包含一个周围空白 |
| `y$` | 复制到行尾 |
| `y^` | 复制到本行第一个非空字符 |
| `p` | 粘贴到光标后；行内容会粘到下一行 |
| `P` | 粘贴到光标前；行内容会粘到上一行 |
| `gp` | 粘贴后把光标放到粘贴内容后面 |
| `dd` | 删除整行，并放入寄存器 |
| `D` | 删除到行尾 |
| `dw` | 删除一个单词 |
| `diw` | 删除当前单词 |
| `d$` | 删除到行尾 |
| `x` | 删除当前字符 |
| `X` | 删除光标前一个字符 |
| `cc` | 修改整行 |
| `C` | 修改到行尾 |
| `cw` | 修改一个单词 |
| `ciw` | 修改当前单词 |
| `s` | 删除当前字符并进入插入模式；注意 LazyVim 中普通模式 `s` 被 Flash 占用 |
| `S` | 修改整行；注意 LazyVim 中普通模式 `S` 被 Flash Treesitter 占用 |
| `r{char}` | 替换当前字符，例如 `ra` |
| `R` | 进入替换模式 |
| `J` | 把下一行合并到当前行 |

常用组合：

- `d2w`：删除两个单词。
- `yap`：复制一个段落。
- `dap`：删除一个段落。
- `ci"`：修改双引号内的内容。
- `ci(` 或 `ci)`：修改括号内的内容。
- `ca"`：修改包含双引号在内的整个引号对象。
- `va{`：选中一对大括号及其内容。
- `viw` 后 `y`：可视选中当前单词再复制。

## 4. 系统剪贴板与寄存器

| 按键 / 命令 | 作用 |
| --- | --- |
| `"+y` | 复制到系统剪贴板 |
| `"+yy` | 复制当前行到系统剪贴板 |
| `"+p` | 从系统剪贴板粘贴 |
| `"+P` | 从系统剪贴板粘贴到前面 |
| `"0p` | 粘贴最近一次 yank 的内容；常用于避免刚删除的内容覆盖复制内容 |
| `"_d{motion}` | 删除但不污染默认寄存器，例如 `"_dd` |
| `"ay{motion}` | 复制到寄存器 `a` |
| `"ap` | 从寄存器 `a` 粘贴 |
| `:reg` | 查看寄存器 |
| `:%y+` | 全文复制到系统剪贴板 |

重要理解：

- `d`、`c`、`x` 删除的内容也会进入寄存器，所以它们可能覆盖你刚 `y` 的内容。
- 最近一次 yank 通常在 `0` 寄存器里，`"0p` 很有用。
- 系统剪贴板是 `+` 寄存器。macOS、Linux、Windows 的终端剪贴板支持可能不同；如果 `"+p` 不工作，先检查 `:checkhealth clipboard`。

## 5. 撤销、重做、重复

| 按键 | 作用 |
| --- | --- |
| `u` | 撤销 |
| `<C-r>` | 重做 |
| `.` | 重复上一次修改 |
| `U` | 撤销当前行最近改动；不如 `u` 常用 |
| `:earlier 5m` | 回到 5 分钟前的编辑状态 |
| `:later 5m` | 前进到 5 分钟后的编辑状态 |

`.` 是 Vim 的核心效率键。例如执行一次 `ciwfoo<Esc>` 后，移动到另一个单词上按 `.`，就会把那个单词也替换成 `foo`。

## 6. 搜索与替换

| 按键 / 命令 | 作用 |
| --- | --- |
| `/text` | 向下搜索 `text` |
| `?text` | 向上搜索 `text` |
| `n` | 下一个搜索结果；LazyVim 会让方向更符合 `/` 或 `?` |
| `N` | 上一个搜索结果 |
| `*` | 搜索光标下单词，向下 |
| `#` | 搜索光标下单词，向上 |
| `<leader>ur` | 清除搜索高亮、刷新 diff、重绘屏幕 |
| `:%s/old/new/g` | 全文件替换 |
| `:%s/old/new/gc` | 全文件替换并逐个确认 |
| `:s/old/new/g` | 当前行替换 |
| `:'<,'>s/old/new/g` | 可视选区替换 |
| `<leader>sr` | LazyVim 多文件搜索替换，打开 grug-far |

确认替换时常见按键：`y` 确认当前，`n` 跳过当前，`a` 全部确认，`q` 退出。

## 7. 可视模式

| 按键 | 作用 |
| --- | --- |
| `v` | 字符选择 |
| `V` | 行选择 |
| `<C-v>` | 块选择 |
| `o` | 在选区两端之间切换光标 |
| `y` | 复制选区 |
| `d` | 删除选区 |
| `c` | 修改选区 |
| `>` | 选区右缩进；LazyVim 会保持选区 |
| `<` | 选区左缩进；LazyVim 会保持选区 |
| `gv` | 重新选中上一次选区 |
| `=` | 自动缩进选区 |
| `gc` | LazyVim 中切换注释选区 |

块选择例子：

1. `<C-v>` 进入块选择。
2. 用 `j/k` 选择多行同一列。
3. 按 `I` 在块前插入，输入内容。
4. 按 `Esc` 应用到所有行。

## 8. 文本对象

文本对象常和 `d`、`y`、`c`、`v` 搭配。`i` 表示 inner，`a` 表示 around。

| 文本对象 | 示例 | 作用 |
| --- | --- | --- |
| `iw` / `aw` | `ciw`、`daw` | 当前单词 / 当前单词加空白 |
| `is` / `as` | `das` | 句子 |
| `ip` / `ap` | `yap` | 段落 |
| `i"` / `a"` | `ci"` | 双引号内 / 包含双引号 |
| `i'` / `a'` | `ci'` | 单引号内 / 包含单引号 |
| `` i` `` / `` a` `` | `` ci` `` | 反引号内 / 包含反引号 |
| `i(` / `a(` | `di(` | 小括号内 / 包含小括号 |
| `i[` / `a[` | `yi[` | 中括号内 / 包含中括号 |
| `i{` / `a{` | `va{` | 大括号内 / 包含大括号 |
| `it` / `at` | `cit` | HTML/XML 标签内部 / 整个标签 |

当前 LazyVim 默认启用了 `mini.ai`，额外增加了一批代码文本对象：

| 文本对象 | 作用 |
| --- | --- |
| `af` / `if` | 函数外部 / 函数内部 |
| `ac` / `ic` | 类外部 / 类内部 |
| `ao` / `io` | 代码块、条件、循环外部 / 内部 |
| `ag` / `ig` | 整个 buffer |
| `au` / `iu` | 函数调用 |
| `aU` / `iU` | 更宽松函数名匹配的函数调用 |
| `an` / `in` | Treesitter 父节点 / 子节点选择 |

## 9. 缩进、格式化、注释

| 按键 | 作用 |
| --- | --- |
| `>>` | 当前行右缩进 |
| `<<` | 当前行左缩进 |
| `=` + motion | 自动缩进，例如 `=ap` 格式化段落缩进 |
| `gg=G` | 全文件按缩进规则重排 |
| `<leader>cf` | LazyVim 格式化当前文件或选区 |
| `<leader>cF` | LazyVim 格式化注入语言 |
| `gcc` | 切换当前行注释 |
| `gc` | 在可视模式切换选区注释；在普通模式可配 motion，例如 `gcap` |
| `gco` | 在下方新增注释行 |
| `gcO` | 在上方新增注释行 |

## 10. 文件、buffer、窗口、tab

### 文件与 buffer

| 按键 / 命令 | 作用 |
| --- | --- |
| `<C-s>` | 保存当前文件 |
| `<D-s>` | 当前本地自定义：普通/插入/可视模式保存所有文件，即 `:wa` |
| `:w` | 保存当前文件 |
| `:wa` | 保存所有文件 |
| `:q` | 关闭当前窗口 |
| `:qa` | 退出全部 |
| `:wq` | 保存并退出 |
| `:q!` | 不保存强制退出当前窗口 |
| `:e file` | 打开文件 |
| `:ene` | 新建空 buffer |
| `<leader>fn` | 新建文件 |
| `<S-h>` / `[b` | 上一个 buffer |
| `<S-l>` / `]b` | 下一个 buffer |
| `<leader>bb` / `<leader>\`` | 切换到另一个 buffer |
| `<leader>bd` | 删除当前 buffer |
| `<leader>bD` | 删除 buffer 和窗口 |
| `<leader>bo` | 删除其他 buffer |
| `<leader>bp` | bufferline 固定/取消固定 |
| `<leader>bP` | 删除未固定 buffer |
| `<leader>bl` | 删除左侧 buffer |
| `<leader>br` | 删除右侧 buffer |
| `[B` / `]B` | 移动 buffer 顺序 |
| `<leader>,` | buffer 列表 |
| `<leader>fb` | buffer 列表 |
| `<leader>fB` | 全部 buffer 列表 |

### 窗口

| 按键 | 作用 |
| --- | --- |
| `<C-h>` | 到左侧窗口 |
| `<C-j>` | 到下方窗口 |
| `<C-k>` | 到上方窗口 |
| `<C-l>` | 到右侧窗口 |
| `<leader>-` | 水平分屏 |
| `<leader>|` | 垂直分屏 |
| `<leader>wd` | 删除当前窗口 |
| `<leader>wm` | 最大化/还原当前窗口 |
| `<leader>uZ` | 同 `<leader>wm`，切换 zoom |
| `<leader>uz` | Zen 模式 |
| `<C-Up>` | 增加窗口高度 |
| `<C-Down>` | 减少窗口高度 |
| `<C-Left>` | 减少窗口宽度 |
| `<C-Right>` | 增加窗口宽度 |
| `<C-w><Space>` | which-key 窗口 hydra 模式 |

### Tab

| 按键 | 作用 |
| --- | --- |
| `<leader><tab><tab>` | 新建 tab |
| `<leader><tab>d` | 关闭当前 tab |
| `<leader><tab>]` | 下一个 tab |
| `<leader><tab>[` | 上一个 tab |
| `<leader><tab>f` | 第一个 tab |
| `<leader><tab>l` | 最后一个 tab |
| `<leader><tab>o` | 只保留当前 tab |

注意：LazyVim 的顶部“标签”通常是 bufferline，不等同于 Vim tab。日常切文件优先用 buffer：`<S-h>`、`<S-l>`、`<leader>,`。

## 11. LazyVim 查找、搜索、文件树

当前配置使用 LazyVim 默认的 Snacks picker/explorer。

| 按键 | 作用 |
| --- | --- |
| `<leader><Space>` | 查找文件，根目录 |
| `<leader>ff` | 查找文件，根目录 |
| `<leader>fF` | 查找文件，当前工作目录 |
| `<leader>fg` | Git 文件 |
| `<leader>fc` | 查找 Neovim 配置文件 |
| `<leader>fr` | 最近文件 |
| `<leader>fR` | 当前工作目录最近文件 |
| `<leader>/` | 全局文本搜索，根目录 |
| `<leader>sg` | 全局文本搜索，根目录 |
| `<leader>sG` | 全局文本搜索，当前工作目录 |
| `<leader>sw` | 搜索当前单词或可视选区，根目录 |
| `<leader>sW` | 搜索当前单词或可视选区，当前工作目录 |
| `<leader>sB` | 在打开的 buffers 中 grep |
| `<leader>e` | 文件浏览器，根目录 |
| `<leader>E` | 文件浏览器，当前工作目录 |
| `<leader>fe` | 文件浏览器，根目录 |
| `<leader>fE` | 文件浏览器，当前工作目录 |
| `<leader>fp` | Projects |
| `<leader>sp` | 搜索插件 spec |

Picker 内部常见操作通常可用 `?` 或界面提示查看，常见按键包括输入过滤、方向键或 `<C-j>/<C-k>` 移动、`<CR>` 打开。

## 12. LazyVim 搜索面板、帮助、历史

| 按键 | 作用 |
| --- | --- |
| `<leader>sk` | Keymaps 列表 |
| `<leader>?` | 当前 buffer 的 keymaps |
| `<leader>sh` | Help Pages |
| `<leader>sH` | Highlights |
| `<leader>sM` | Man Pages |
| `<leader>s"` | Registers |
| `<leader>s/` | Search History |
| `<leader>sc` | Command History |
| `<leader>sC` | Commands |
| `<leader>sa` | Autocmds |
| `<leader>sb` | Buffer Lines |
| `<leader>sj` | Jumps |
| `<leader>sm` | Marks |
| `<leader>sl` | Location List |
| `<leader>sq` | Quickfix List |
| `<leader>sR` | Resume 上一次 picker |
| `<leader>sd` | Diagnostics |
| `<leader>sD` | 当前 buffer diagnostics |
| `<leader>su` | Undotree |
| `<leader>si` | Icons |

学习快捷键时最推荐经常用 `<leader>sk` 和 `<leader>?`，它们能直接查当前实际生效的映射。

## 13. Flash 快速跳转

| 按键 | 模式 | 作用 |
| --- | --- | --- |
| `s` | n / x / o | Flash 跳转 |
| `S` | n / x / o | Flash Treesitter |
| `r` | o | Remote Flash |
| `R` | x / o | Treesitter Search |
| `<C-s>` | 命令行模式 | 切换 Flash Search |
| `<C-Space>` | n / x / o | Treesitter 增量选择 |

使用方式：按 `s` 后输入要跳的位置字符，屏幕上出现标签，再按标签字符跳过去。因为普通模式 `s` 被 Flash 占用，原生“删除当前字符并插入”的 `s` 不再是日常默认选择，可以用 `cl` 或 `xi` 替代。

## 14. LSP、代码动作、诊断

这些按键只有在当前 buffer 有 LSP server 附着，并且 server 支持对应能力时才生效。

| 按键 | 作用 |
| --- | --- |
| `K` | Hover 文档 |
| `gK` | Signature Help |
| `<C-k>` | 插入模式 Signature Help |
| `gd` | 跳到定义 |
| `gD` | 跳到声明 |
| `gr` | 查找引用 |
| `gI` | 跳到实现 |
| `gy` | 跳到类型定义 |
| `<leader>cl` | LSP 信息 |
| `<leader>ca` | Code Action |
| `<leader>cA` | Source Action |
| `<leader>cr` | 重命名符号 |
| `<leader>cR` | 重命名文件 |
| `<leader>cc` | 运行 Codelens |
| `<leader>cC` | 刷新并显示 Codelens |
| `<leader>cd` | 当前行诊断浮窗 |
| `]d` / `[d` | 下一个 / 上一个诊断 |
| `]e` / `[e` | 下一个 / 上一个错误 |
| `]w` / `[w` | 下一个 / 上一个警告 |
| `]]` / `[[` | 下一个 / 上一个引用高亮 |
| `<A-n>` / `<A-p>` | 下一个 / 上一个引用高亮 |
| `<leader>cm` | Mason |

Trouble 诊断面板：

| 按键 | 作用 |
| --- | --- |
| `<leader>xx` | 全项目诊断 |
| `<leader>xX` | 当前 buffer 诊断 |
| `<leader>cs` | Symbols |
| `<leader>cS` | LSP references/definitions 面板 |
| `<leader>xL` | Location List |
| `<leader>xQ` | Quickfix List |
| `]q` / `[q` | 下一个 / 上一个 Trouble 或 quickfix 项 |

## 15. Git 与 Todo

| 按键 | 作用 |
| --- | --- |
| `<leader>gs` | Git Status |
| `<leader>gd` | Git Diff hunks |
| `<leader>gD` | Git Diff origin |
| `<leader>gS` | Git Stash |
| `<leader>gl` | Git Log，根目录 |
| `<leader>gL` | Git Log，当前工作目录 |
| `<leader>gb` | 当前行 Git blame |
| `<leader>gf` | 当前文件历史 |
| `<leader>gB` | Git Browse 打开 URL |
| `<leader>gY` | Git Browse 复制 URL |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghS` | Stage buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghR` | Reset buffer |
| `<leader>ghp` | 预览 hunk |
| `<leader>ghb` | Blame line |
| `<leader>ghB` | Blame buffer |
| `<leader>ghd` | Diff this |
| `<leader>ghD` | Diff this against `~` |
| `]h` / `[h` | 下一个 / 上一个 hunk |
| `]H` / `[H` | 最后一个 / 第一个 hunk |
| `<leader>st` | Todo |
| `<leader>sT` | Todo/Fix/Fixme |
| `<leader>xt` | Todo Trouble |
| `<leader>xT` | Todo/Fix/Fixme Trouble |
| `]t` / `[t` | 下一个 / 上一个 todo comment |

如果系统安装了 `lazygit`，LazyVim 还会启用：

| 按键 | 作用 |
| --- | --- |
| `<leader>gg` | Lazygit，根目录 |
| `<leader>gG` | Lazygit，当前工作目录 |

## 16. 终端、会话、通知、UI 切换

| 按键 | 作用 |
| --- | --- |
| `<C-/>` | 打开/隐藏根目录浮动终端 |
| `<leader>ft` | 终端，根目录 |
| `<leader>fT` | 终端，当前工作目录 |
| `<leader>qs` | 恢复当前项目 session |
| `<leader>ql` | 恢复上一次 session |
| `<leader>qd` | 不保存当前 session |
| `<leader>qS` | 选择 session |
| `<leader>qq` | 退出全部 |
| `<leader>n` | 通知历史 |
| `<leader>un` | 清除所有通知 |
| `<leader>sn` | Noice 分组 |
| `<leader>snh` | Noice 历史 |
| `<leader>snl` | Noice 最后一条消息 |
| `<leader>sna` | Noice 全部 |
| `<leader>snd` | 清除 Noice 消息 |
| `<leader>snt` | Noice picker |

UI / 选项切换：

| 按键 | 作用 |
| --- | --- |
| `<leader>uC` | 选择 colorscheme |
| `<leader>uf` | 开关自动格式化 |
| `<leader>uF` | 开关当前 buffer 自动格式化 |
| `<leader>us` | 拼写检查 |
| `<leader>uw` | 自动换行 |
| `<leader>uL` | 相对行号 |
| `<leader>ul` | 行号 |
| `<leader>ud` | 诊断显示 |
| `<leader>uc` | conceal level |
| `<leader>uA` | tabline |
| `<leader>uT` | Treesitter |
| `<leader>ub` | 深色/浅色背景 |
| `<leader>uD` | dim |
| `<leader>ua` | 动画 |
| `<leader>ug` | 缩进参考线 |
| `<leader>uS` | 平滑滚动 |
| `<leader>uh` | LSP inlay hints |
| `<leader>uG` | Git signs |
| `<leader>ui` | Inspect Pos |
| `<leader>uI` | Inspect Tree |
| `<leader>L` | LazyVim Changelog |

## 17. Lazy.nvim 与 LazyExtras

| 命令 / 按键 | 作用 |
| --- | --- |
| `<leader>l` | 打开 Lazy.nvim 插件管理器 |
| `:Lazy` | 打开 Lazy.nvim |
| `:Lazy sync` | install + clean + update |
| `:Lazy update` | 更新插件并更新 lockfile |
| `:Lazy restore` | 按 lockfile 恢复插件版本 |
| `:Lazy check` | 检查更新 |
| `:Lazy log` | 查看更新日志 |
| `:Lazy profile` | 启动耗时分析 |
| `:Lazy health` | 检查 lazy.nvim 健康状态 |
| `:LazyExtras` | 打开 LazyVim extras 管理界面 |

Lazy.nvim UI 内：

| 按键 | 作用 |
| --- | --- |
| `?` | 打开 UI 内帮助，查看所有当前可用按键 |
| `<CR>` | 展开/折叠插件详情 |
| `K` | 查看 hover 信息，例如 URL、commit、help tag |
| `q` | 关闭 UI |

LazyExtras UI 内：

| 按键 | 作用 |
| --- | --- |
| `x` | 启用或禁用光标所在 extra |
| `q` | 关闭窗口 |
| `/` | 搜索 extra 名称或描述 |
| `j` / `k` | 上下移动 |
| `gg` / `G` | 到顶部 / 底部 |

LazyExtras 启用或禁用 extra 后，通常需要重启 Neovim 才能完全生效。当前本机启用的 extras：

- `lazyvim.plugins.extras.lang.clangd`
- `lazyvim.plugins.extras.lang.python`
- `lazyvim.plugins.extras.ui.dashboard-nvim`

## 18. Dashboard 当前首页快捷键

你本地覆盖了 dashboard 标题图案，但中心按钮仍是 LazyVim dashboard-nvim 的常用入口。

| 首页按键 | 作用 |
| --- | --- |
| `f` | Find File |
| `n` | New File |
| `r` | Recent Files |
| `g` | Find Text |
| `c` | Config |
| `s` | Restore Session |
| `x` | Lazy Extras |
| `l` | Lazy |
| `q` | Quit |

## 19. 当前启用的语言 extras

### Python extra

启用内容：

- 默认 Python LSP 是 `pyright`。
- 默认 Ruff LSP/工具是 `ruff`。
- 自动启用 Python 相关 Treesitter、LSP、venv 选择器。
- 如果安装了 test/dap 相关 optional 插件，会补上 Python 测试和调试能力。

| 按键 | 作用 |
| --- | --- |
| `<leader>co` | Organize Imports；Python 文件中由 Ruff 提供 |
| `<leader>cv` | Select VirtualEnv；Python 文件中打开 venv-selector |
| `<leader>dPt` | Debug Method；需要 DAP 相关 optional 插件 |
| `<leader>dPc` | Debug Class；需要 DAP 相关 optional 插件 |

### clangd extra

启用内容：

- C/C++ Treesitter。
- `clangd_extensions.nvim`。
- `clangd` LSP，带 `--background-index`、`--clang-tidy`、`--header-insertion=iwyu` 等参数。
- 如果安装了 DAP optional 插件，会配置 `codelldb`。

| 按键 | 作用 |
| --- | --- |
| `<leader>ch` | C/C++ 源文件和头文件切换 |

## 20. Marks、宏、折叠、跳转列表

| 按键 / 命令 | 作用 |
| --- | --- |
| `m{a-z}` | 设置局部 mark，例如 `ma` |
| `` `{mark}` `` | 跳到 mark 的精确位置 |
| `'{mark}` | 跳到 mark 所在行 |
| `` `` `` | 回到上一次跳转前的位置 |
| `''` | 回到上一次跳转前的行 |
| `<C-o>` | 跳转列表后退 |
| `<C-i>` | 跳转列表前进 |
| `:jumps` | 查看跳转列表 |
| `q{a-z}` | 开始录制宏到寄存器 |
| `q` | 停止录制宏 |
| `@{a-z}` | 执行宏 |
| `@@` | 重复上一次宏 |
| `zf{motion}` | 创建折叠 |
| `zo` | 打开折叠 |
| `zc` | 关闭折叠 |
| `za` | 切换折叠 |
| `zR` | 打开所有折叠 |
| `zM` | 关闭所有折叠 |

宏例子：`qaI// <Esc>jq` 会把“到行首插入 `// `，下移一行”录到寄存器 `a`。之后按 `@a` 执行一次，`10@a` 执行 10 次。

## 21. 命令行模式常用技巧

| 按键 / 命令 | 作用 |
| --- | --- |
| `<Tab>` | 命令或路径补全 |
| `<C-r>"` | 在命令行插入默认寄存器内容 |
| `<C-r>+` | 在命令行插入系统剪贴板内容 |
| `:%!cmd` | 用外部命令过滤全文 |
| `:read !cmd` | 把外部命令输出插入当前 buffer |
| `:set number` | 开启行号 |
| `:set nonumber` | 关闭行号 |
| `:set paste` | 粘贴模式；现代终端通常不需要 |
| `:checkhealth` | 健康检查 |
| `:verbose map {key}` | 查看某个按键是谁设置的 |
| `:map` / `:nmap` / `:imap` / `:vmap` | 查看映射 |

## 22. 学习顺序建议

1. 先熟练模式切换：`i`、`a`、`o`、`Esc`、`v`、`V`。
2. 练移动：`hjkl`、`w/b/e`、`0/^/$`、`gg/G`。
3. 练操作符组合：`d`、`y`、`c` 搭配 `w`、`$`、`iw`、`ap`。
4. 练复制粘贴：`yy`、`p`、`P`、`"+y`、`"+p`、`"0p`。
5. 练搜索：`/`、`n`、`N`、`*`、`:%s///gc`。
6. 再练 LazyVim：`<leader>` 等 which-key 弹窗、`<leader>ff`、`<leader>sg`、`<leader>e`、`<leader>sk`。
7. 最后学习 LSP、Git、Trouble、LazyExtras。

每天 10 分钟练习组合比背完整表更有效。最有价值的组合是 `ciw`、`yiw`、`diw`、`ci"`、`va{`、`gg=G`、`<leader>ff`、`<leader>sg`、`gd`、`K`。

## 23. 如何自己查当前真实按键

| 方法 | 说明 |
| --- | --- |
| `<leader>` 后等待 | which-key 显示所有 leader 后续按键 |
| `<leader>sk` | 打开 keymaps picker |
| `<leader>?` | 查看当前 buffer 的 keymaps |
| `:verbose map <key>` | 查看某个映射从哪个文件来 |
| `:map` | 查看全部模式映射 |
| `:nmap` | 查看普通模式映射 |
| `:imap` | 查看插入模式映射 |
| `:LazyExtras` | 管理 extras |
| `:Lazy` | 管理插件 |

例如想查 `<leader>ff`：

```vim
:verbose nmap <leader>ff
```

## 24. 本文参考来源

- LazyVim 官方 Keymaps：https://www.lazyvim.org/keymaps
- LazyVim Keymaps 配置说明：https://www.lazyvim.org/configuration/keymaps
- LazyVim Extras：https://www.lazyvim.org/extras
- LazyVim Python extra：https://www.lazyvim.org/extras/lang/python
- LazyVim Clangd extra：https://www.lazyvim.org/extras/lang/clangd
- LazyVim dashboard-nvim extra：https://www.lazyvim.org/extras/ui/dashboard-nvim
- lazy.nvim Usage：https://lazy.folke.io/usage
- Neovim change / yank / put 文档：https://neovim.io/doc/user/change/
- Neovim editing 文档：https://neovim.io/doc/user/editing/
- Neovim options / clipboard 文档：https://neovim.io/doc/user/options/
