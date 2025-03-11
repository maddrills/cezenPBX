FROM andrius/asterisk:edge

# Add edge/testing repository
# RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
RUN apk update && \
    apk upgrade && \
    apk add asterisk-odbc && \
    apk add unixodbc && \
    apk add unixodbc-dev && \
    apk add mariadb-connector-odbc
    # apk add --no-cache unixodbc unixodbc-dev mariadb-connector-odbc

# Copy custom Asterisk config files
#COPY asterisk_config/ /etc/asterisk/

# Start Asterisk in verbose mode
CMD ["asterisk", "-fvvvvv"]