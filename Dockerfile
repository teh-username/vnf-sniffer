FROM python:3.6

RUN apt-get update && apt-get install -y net-tools iproute

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY main.py main.py

ENV SON_EMU_CMD "python main.py"

CMD /bin/bash
