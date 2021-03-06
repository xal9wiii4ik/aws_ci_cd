FROM python:3.9-slim as base
WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install --no-install-recommends -y curl build-essential

RUN pip3 install --upgrade pip
COPY ./app ./

RUN pip3 install -r ./requirements.txt

RUN chmod +x ./web_entrypoint.sh

ENTRYPOINT ["/usr/src/app/web_entrypoint.sh"]
