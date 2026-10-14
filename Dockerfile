FROM python:slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

RUN useradd --system --uid 10001 --no-create-home app

COPY --chown=app:app app.py .

USER app

EXPOSE 8080

CMD ["python", "/app/app.py"]
