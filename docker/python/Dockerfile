FROM python
RUN mkdir app
COPY ./dt.py /app/app.py
WORKDIR /app
ENTRYPOINT [ "python", "app.py" ]
#CMD [ "app.py" ]
# flashing python output
ENV PYTHONUNBUFFERED=1
