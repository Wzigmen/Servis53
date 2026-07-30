from flask import Flask, request
from flask_cors import CORS
import requests

TOKEN = "8871942207:AAFR1uHRMTR_VeWyFk7mkAws5kZPgDrSx_I"
CHAT_ID = "2001541259" # мой айти

app = Flask(__name__)
CORS(app, resources={
    r"/*": {
        "origins": "http://localhost:5173"
    }
})
@app.post("/send")
def send():

    data = request.json

    text = f"""
📥 Новая заявка

👤 Имя: {data["name"]}

📞 Телефон: {data["phone"]}

📧 Email: {data["email"]}

🛠 Услуга: {data["service"]}

💬 Сообщение:

{data["message"]}
"""

    requests.post(
        f"https://api.telegram.org/bot{TOKEN}/sendMessage",
        json={
            "chat_id": CHAT_ID,
            "text": text
        }
    )

    return {"ok": True}


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5001,
        debug=False
    )