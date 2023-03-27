FROM python:3.9

RUN apt-get update && apt-get install -y git

RUN mkdir /materialbestellung
WORKDIR /materialbestellung

RUN git clone https://github.com/timoheld/materialbestellung.git .

COPY requirements.txt .

#COPY entrypoint.sh /materialbestellung/entrypoint.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN pip install -r requirements.txt
#ENV FLASK_APP=materialbestellung.py

CMD ["/usr/local/bin/entrypoint.sh"]
#CMD ["/bin/bash", "/materialbestellung/entrypoint.sh"]
