
---

# 🗂️ Automatic Daily Home Directory Backup (Bash + rsync + cron)

## 📌 Overview

This project provides a **production‑ready Bash script** that performs an **automatic daily backup** of a Linux directory (default: `/home`) using `rsync`.

The script is designed with **system administration and security best practices**, including:

* Incremental backups using `rsync`
* Timestamped backup directories
* Centralized logging
* Safe default behavior
* Full compatibility with `cron`

---

## ✨ Features

* ✅ Automatic daily backups
* ✅ Uses `rsync` (fast and efficient)
* ✅ Timestamped backup folders
* ✅ Detailed logging (`backup.log`)
* ✅ Prints every successful operation
* ✅ Sensible defaults when no input is provided
* ✅ Cron‑friendly (non‑interactive)

---

## 📁 Backup Structure

If no input is provided, backups are created like this:

```
/home/
 ├── user1
 ├── user2
 └── backups/
     ├── 2025-12-19_07-00-00/
     ├── 2025-12-20_07-00-00/
     └── backup.log
```

---

## 🛠 Requirements

* Linux system
* Bash shell
* `rsync` installed
* Cron service enabled

Check rsync:

```bash
rsync --version
```

---

## 📥 Installation

1️⃣ Clone the repository:

```bash
git clone https://github.com/yourusername/daily-backup-script.git
cd daily-backup-script
```

2️⃣ Make the script executable:

```bash
chmod +x daily_backup.sh
```

---

## ▶️ Usage

### 🔹 Run with default settings

```bash
./daily_backup.sh
```

**Behavior:**

* Source directory: `/home`
* Backup directory: `/home/backups/`
* Log file: `$HOME/backup.log`

---

### 🔹 Run with custom source and destination

```bash
./daily_backup.sh /home/username /mnt/backup
```

* First argument → source directory
* Second argument → backup destination

---

## ⏰ Automating with Cron (Daily at 7:00 AM)

1️⃣ Open crontab:

```bash
crontab -e
```

2️⃣ Add the following line:

```bash
0 7 * * * /full/path/to/daily_backup.sh
```

📌 **Important Notes:**

* Always use the **full path** to the script
* Ensure the script has execute permission
* Cron uses a limited environment (no aliases)

3️⃣ Verify:

```bash
crontab -l
```

---

## 🧾 Logs

All operations are logged to:

```bash
$HOME/backup.log
```

Each log entry includes:

* Timestamp
* Operation details
* Success or failure status

---

## 🔐 Why rsync?

`rsync` is preferred over `cp` because it:

* Copies only changed files
* Preserves permissions and timestamps
* Supports mirroring with `--delete`
* Is ideal for backups and recovery

---

## 🚀 Possible Enhancements

* Backup compression (`tar.gz`)
* Backup encryption (`gpg`)
* Email alerts on failure
* Excluding directories (`--exclude`)
* Remote backups over SSH

---

## 📄 License

This project is released for educational and personal use.
You are free to modify and extend it.

---

## 👤 Author

**Shady Ahmed**
Computer Science Student | Cybersecurity Enthusiast
Focus: Linux, Automation, Backup Systems, Security Engineering

---
