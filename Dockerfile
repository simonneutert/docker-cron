FROM alpine:3.7
LABEL maintainer "Patrick Baber <patrick.baber@ueber.io>"

# Configure cron
COPY crontab /etc/cron/crontab

# Init cron
RUN crontab /etc/cron/crontab

CMD ["crond", "-f"]
