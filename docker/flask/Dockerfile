FROM python
# install python packages Flask and redis
RUN pip install Flask redis
RUN mkdir app
COPY ./app.py /app/app.py
WORKDIR /app
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
EXPOSE 5000
