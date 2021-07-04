#
# Dockerfile for Python Development
#
FROM python:3.9.6-buster

LABEL maintener="Koichi Murakami <koichi.murakami@kek.jp>"

#
RUN apt-get update && \
    apt-get install -y tcsh zsh sudo vim less && \
    apt-get install -y locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

#
ENV LANG ja_JP.UTF-8 \
    LANGUAGE ja_JP:ja \
    LC_ALL ja_JP.UTF-8 \
    TZ JST-9

#
RUN apt-get install -y libsasl2-dev libldap2-dev

#
ADD ./Pipfile /
ADD ./Pipfile.lock /
RUN pip install --upgrade pip && pip install pipenv

#
RUN rm -rf /var/lib/apt/lists/*

#
WORKDIR /
