FROM python:3.11-slim

WORKDIR /app

RUN pip install flask

COPY dice_roll.py .          # ← Copy the renamed file

EXPOSE 5000

CMD ["python", "dice_roll.py"]  # ← Run the correct filename
