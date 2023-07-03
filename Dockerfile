FROM python:3.10-slim-buster

LABEL maintainer="Olha Padalka olha.pad@gmail.com"

ARG UID=1000
ARG GID=1000
ENV UID=${UID}
ENV GID=${GID}

RUN useradd -m -u $UID docker_user
USER docker_user

WORKDIR /home/docker_user/app

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONBUFFERED=1

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . .

CMD ["python3", "-m", "bot.main"]