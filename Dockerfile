FROM python:3.11
LABEL authors="mashaco"

ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN pip install --upgrade pip

COPY task_3 .
CMD ["gunicorn", "task_3.wsgi:application", "--bind", "0.0.0.0:8000"]