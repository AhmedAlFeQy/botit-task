FROM python:3.8

RUN mkdir /app
WORKDIR /app
ENV VIRTUAL_ENV=/opt/exvenv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt requirements.txt
RUN  pip install -r requirements.txt

EXPOSE 5000
COPY . .
ENV FLASK_APP=./src/hello.py
CMD ["flask", "run", "--host", "0.0.0.0"]
# CMD ["python", "./src/hello.py"]
