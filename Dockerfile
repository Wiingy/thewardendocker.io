FROM python:3.6

LABEL version='1.0'

EXPOSE 33777

RUN apt-get update && \
    apt-get install -y python3 python3-pip build-essential git && \
    pip3 install --upgrade pip==19.2.3

COPY . /app/thewarden
WORKDIR /app/thewarden

#RUN git clone https://github.com/pxsocs/thewarden.git
#RUN pip3 install virtualenv
#RUN virtualenv cb_env
#RUN . cb_env/bin/activate
RUN pip3 install -r requirements.txt

CMD ["python3", "-u", "warden.py", "--host", "0.0.0.0"]
