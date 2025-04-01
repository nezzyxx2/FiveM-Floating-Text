Got it! Here's your updated `README.md` with a fixed config style section, clearly marked as **Client-Side Only**, and focused only on what matters for the client script:

---

```markdown
# 🧠 ESX Floating Text System (Client-Side Only)

A lightweight, client-side script for **Old and New ESX** that displays 3D floating help text based on player proximity and job.  
Designed for **0.00ms resmon idle**, making it ideal for performance-sensitive servers.

---

## 🚀 Features

- ✅ **0.00ms resmon idle** — Optimized for performance.
- 🔁 **Supports Old & New ESX** — Easily switch in config.
- 🔒 **Job-Based Access** — Set specific jobs or allow all players.
- ⚙️ **Fully Configurable** — Change locations, text, and access easily.
- 🧼 **Clean Client-Side Code** — Simple to read, edit, and expand.

---

## 🛠️ Configuration (Client-Side Only)

### `Config.OldESX`
Choose your ESX version:
```lua
Config = {}
Config.OldESX = false -- true = Old ESX | false = New ESX
```

### Floating Text Setup
Define locations, messages, and job access in this table:
```lua
local floatingTextConfig = {
  {
    text = "~r~[E] ~s~ - Owner Panel",
    coords = vector3(-931.3951, -1179.8030, 5.0156),
    job = "cookies" -- set to nil to allow everyone
  },
  {
    text = "~r~[E] ~s~ - Farming",
    coords = vector3(-926.5614, -1173.2567, -0.9026),
    job = "cookies"
  }
}
```

---

## ⚙️ How It Works

- ✅ Loads ESX based on config.
- 🧍 Checks player job and proximity to each defined location.
- 💬 If conditions are met, displays floating help text (3D-style GTA UI).
- ⏱️ Uses efficient wait handling when no text is nearby.

---

## 📎 Notes

- **No server-side script required** — this is 100% client-side.
- **Compatible with any ESX version** — thanks to the dynamic loader.

---

## 👤 Created by Verdict

Part of the [Verdict](https://discord.gg/vdct) project — Join us for FiveM development, bots, and server tools.
```
