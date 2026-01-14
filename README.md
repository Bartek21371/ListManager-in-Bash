# 📋 ListManager-in-Bash

Simple **Manager list To-Do writed in Bash**, working in terminal.
Allowing create,edit,show,delete lists write as text files.

## ✨ Functions

- ➕ Create new lists
- 📂 Show existing lists
- ✏️ Edit of list (opening in "nano")
- 🗑️ Delete list after confirmation
- 🎨 Colorfully output in terminal
- 📁 Automation managing folder with lists

## 📂 Structure of files
```text
ListManager-in-Bash/
├── todo.sh
├── list_text/
│   ├── shopping.txt
│   ├── work.txt
│   └── ...
└── README.md
```

> All lists is in folder 'list_text/', creating automatically above script

---

## 🚀 How run script

### 1️⃣ Clon repo
```bash
git clone git@github.com:Bartek21371/ListManager-in-Bash.git
cd ListManager-in-Bash
```
### 2️⃣ Give permissions to run script
```bash
chmod +x todo.sh
```
### 3️⃣ Run script
```bash
./todo.sh
```

## 🖥️ Requritments
- Linux/macOS
- Bash
- Editor like "nano" for example

## 🧠 How it works
1. Script automatically find own location
2. Create folder "list_text/" if not exists
3. Every list is single file ".txt"
4. Edit of file working in "nano"
5. Menu is service by "select"

## 🔐Security
- Delete list require confirmation
- Validation of file name (no empty file names)
- No operations outside project folder

## 📝 TODO
Planned improvements and ideas for this project are listed in
👉[TODO.md](TODO.md)

### 👤 Author
Bartek21731-Bartosz M.
