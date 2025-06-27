# 🤖 InfoGenie: A Multifunctional Chatbot for College Management

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![Flask](https://img.shields.io/badge/Framework-Flask-green)
![spaCy](https://img.shields.io/badge/NLP-spaCy-blue)
![SQLite](https://img.shields.io/badge/Database-SQLite-lightgrey)

**InfoGenie** is a multifunctional, role-based chatbot application built using Flask and spaCy. Tailored for college management systems, it enables students, faculty, and administrators to interact with institutional services via natural language queries. From retrieving room details to accessing academic information, InfoGenie bridges communication gaps and streamlines operations.

---

## ✨ Features

- 🔐 Secure login and registration with role-based access
- 💬 Natural Language Processing chatbot using `spaCy`
- 🏫 Multi-user support: students, faculty, admin
- 📦 Lightweight database using SQLite
- 🎨 Clean, responsive UI with Bootstrap
- 📁 Modular and scalable codebase

---

## 🧱 Tech Stack

| Layer          | Technology                 |
|--------------- |----------------------------|
| Language       | Python 3.8+                |
| Framework      | Flask                      |
| Database       | SQLite                     |
| NLP Engine     | spaCy (`en_core_web_sm`)   |
| Frontend       | HTML5, CSS3, JS, Bootstrap |
| Templating     | Jinja2                     |
| Environment    | Python Virtualenv          |

---

## 📂 Project Structure
InfoGenie/
│
├── app.py # Main Flask application
├── chatbot.py # NLP logic (spaCy integration)
├── database.sqlite3 # SQLite database file
├── static/ # CSS, JS, images, fonts
├── templates/ # HTML templates
├── Images_ss/ # Screenshots
├── .gitignore
├── README.md
└── chatbot/ # Virtual environment (ignored in git)

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- Git
- Virtualenv (recommended)

### Installation Steps

1. Clone the repository:
cd InfoGenie
2. Create a virtual environment:
   python -m venv chatbot
   chatbot\Scripts\activate   # On Windows
3. Install dependencies:
    Download the spaCy language model:
    python -m spacy download en_core_web_sm
4. Run the app:
    python app.py
5. Open in browser:
   http://127.0.0.1:5000/
 
 
