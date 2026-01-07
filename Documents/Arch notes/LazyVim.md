# ⚡ LazyVim Master Guide

LazyVim is my IDE. The **Leader Key** is `Space`.

## 🔍 Navigation (The VS Code Translation)
| VS Code Action | LazyVim Keybind |
| :--- | :--- |
| **Ctrl + P** (Find File) | `<Space><Space>` or `<Space>ff` |
| **Ctrl + Shift + F** (Global Search) | `<Space>/` or `<Space>sg` |
| **Ctrl + B** (Sidebar) | `<Space>e` (Neo-tree) |
| **Ctrl + `** (Terminal) | `<Ctrl + />` |
| **Ctrl + S** (Save) | `<Ctrl + s>` (Works in all modes) |

---

## 🚀 High-Use "Pro" Commands
### 1. The "Picker" (Telescope)
- `<Space>sk` — **Search Keymaps**. *The most important command! If you forget a key, type this and search for the action.*
- `<Space>fb` — **Find Buffers**. Switch between open files.
- `<Space>fr` — **Recent Files**. Open what you were just working on.

### 2. Coding & LSP (IntelliSense)
- `K` — **Hover**. Shows documentation for the word under the cursor.
- `<Space>ca` — **Code Action**. Fixes errors, imports, or refactors.
- `<Space>cr` — **Rename**. Changes a variable name everywhere in the project.
- `gd` — **Go to Definition**. Jumps to where a function is defined.

### 3. Buffers (Tabs)
- `H` or `Shift + h` — Move to the tab on the **Left**.
- `L` or `Shift + l` — Move to the tab on the **Right**.
- `<Space>bd` — **Close** current tab.

---

## 🪄 Tricks for Speed
- **Multi-Line Edit:** `Ctrl + v` (Visual Block), select lines, `I` (Capital I), type text, `ESC`.
- **Change Inside:** `ci"` (Change inside quotes), `ci(` (Change inside brackets). Deletes text and puts you in Insert mode.
- **Join Lines:** `J` (Capital J) joins the line below to your current line.
- **Search & Replace:** `/` to search, then `:%s/old/new/g` to replace all.

---

## ⚙️ Maintenance
- `<Space>l` — Open **Lazy** (Update plugins).
- `:Mason` — Open **Mason** (Install new Language Servers/Formatters).
- `:checkhealth` — Run this if things feel broken.