FROM andrius/asterisk

RUN apk update && apk upgrade \
    && apk add asterisk-odbc \
    && apk add --no-cache mariadb

CMD ["asterisk", "-f"]
