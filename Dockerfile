FROM python:3.8
COPY . /app/src
WORKDIR /app/src
RUN python -m pip install --upgrade pip
RUN pip install django django-crispy-forms Pillow
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:8000"]
