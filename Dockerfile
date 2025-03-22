FROM python:3.8-slim
WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
RUN apt update && apt install -y make
COPY . .
EXPOSE 8000
CMD ["make", "run-server"]