FROM python:3.7.2
WORKDIR /app
ADD /hello /app
RUN pip install -r requirements.txt
EXPOSE  8000
CMD ["python", "hello.py"]
