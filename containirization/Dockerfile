FROM python:slim-bullseye@sha256:1226f32ad1c1c36e0b6e79706059761c58ada308f4a1ad798e55dab346e10e91 as build

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/app

RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

FROM python:slim-bullseye@sha256:1226f32ad1c1c36e0b6e79706059761c58ada308f4a1ad798e55dab346e10e91

RUN useradd -r -u 999 -U python \
   && mkdir /usr/app && chown python:python /usr/app
   
WORKDIR /usr/app

COPY --chown=python:python --from=build /usr/app/venv ./venv
COPY --chown=python:python app.py .

USER 999

ENV PATH="/usr/app/venv/bin:$PATH"
CMD [ "gunicorn", "--bind", "0.0.0.0:5000", "app:app" ]
