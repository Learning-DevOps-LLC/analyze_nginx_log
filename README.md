# analyze_nginx_log
https://roadmap.sh/projects/nginx-log-analyser

# 🧾 Nginx Access Log Analyzer (Shell Script)

This project is a simple shell script tool that analyzes an Nginx access log and gives you useful insights from the command line.

---

## 📌 Features

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

---

## 🔧 Requirements

- Bash shell
- `awk`, `sort`, `uniq`, `head`, `curl`

---

## 📥 Sample Log File

You can use this [sample Nginx access log file](https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log) provided by [@kamranahmedse](https://github.com/kamranahmedse).

The script will prompt you to download it automatically, or you can analyze your own log file.

---

## 🚀 How to Run

```bash
# Make the script executable
chmod +x analyze_nginx_log.sh

# Run it
./analyze_nginx_log.sh

You’ll be asked:

Do you want to download the sample nginx access log from Kamran Ahmed's Gist? (y/n): y
 

📊 Example Output

Top 5 IP addresses with the most requests:
45.76.135.253 - 1000 requests
...

Top 5 most requested paths:
/api/v1/users - 1000 requests
...

Top 5 response status codes:
200 - 1000 requests
...

Top 5 user agents:
Mozilla/5.0... - 800 requests
...

![image](https://github.com/user-attachments/assets/029071c8-c06d-40b5-b4e1-3d05bc9dfe2a)

🧠 Concepts Used
awk for field extraction

sort, uniq, head for counting and ranking

curl for downloading remote files

