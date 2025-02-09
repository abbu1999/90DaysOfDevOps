# **Solution Documentation**

## **Week 3 Challenge 1: User Account Management**

### **Overview**
This challenge involves creating a Bash script to manage user accounts. The script provides functionality for account creation, deletion, password resetting, listing users, and displaying help information.

### **Script: `user_management.sh`**

#### **Features Implemented:**
- `-c` or `--create` → Create a new user account.
- `-d` or `--delete` → Delete an existing user account.
- `-r` or `--reset` → Reset the password of an existing user.
- `-l` or `--list` → List all available user accounts.
- `-h` or `--help` → Display usage instructions.

#### **Usage Examples:**
```bash
# Create a new user
./user_management.sh -c

# Delete an existing user
./user_management.sh -d

# Reset user password
./user_management.sh -r

# List all system users
./user_management.sh -l

# Display help information
./user_management.sh -h
```

#### **Implementation Highlights:**
- Ensures usernames are checked before creation/deletion.
- Uses `passwd` to set/reset passwords securely.
- Lists users in a structured table format using `awk` and `column`.
- Implements error handling for invalid inputs.

---

## **Week 3 Challenge 2: Automated Backup & Recovery using Cron**

### **Overview**
This challenge involves creating a Bash script that backs up a specified directory with a timestamped archive and maintains only the last three backups.

### **Script: `backup_with_rotation.sh`**

#### **Features Implemented:**
- Creates a **backup folder** in `/opt/backup`.
- Archives the provided directory using `tar` with timestamps.
- Retains only the last **three backups**, deleting older ones.

#### **Usage Examples:**
```bash
# Run the backup script for /home/user/documents
./backup_with_rotation.sh /home/user/documents
```

#### **Implementation Highlights:**
- Uses `mkdir -p` to ensure the backup directory exists.
- Utilizes `tar` to create a compressed `.tar.gz` backup.
- Implements rotation logic using `ls`, `awk`, and `xargs` to keep only the last three backups.
- Reference Links:
  - [Linux `expr` command for calculations](https://vitux.com/linux-expr-command/#:~:text=10%20%2B%2020%20%2B%2030-,Subtraction,and%20expr%20command%20as%20follows.)
  - [Keeping only recent files in Linux](https://stackoverflow.com/questions/73641093/is-there-any-linux-command-to-keep-only-5-recent-files-that-start-with-ref-in-a)

---

## **Conclusion**
Both scripts are designed for efficient **user management** and **automated backups** while ensuring proper validation and error handling. They can be further enhanced with logging and automation using `cron` for scheduled backups.