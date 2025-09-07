FROM python:3.10-slim
WORKDIR /app
COPY app.py /app/app.py
RUN pip install flask
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 8080
CMD ["python", "app.py"]
