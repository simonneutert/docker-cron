# docker-cron
simple Dockerfiles with working cron, taken from this German blog post on [ueberdosis.io](https://ueberdosis.io/artikel/auf-die-minute-genau-cronjobs-im-docker-container/) written by Patrick Baber

### Sample crontab file
```
* * * * * echo "Hello world" >> /dev/stdout 2>&1
# crontab requires an empty line at the end of the file
```

### Dockerfile

```

FROM alpine:3.7
LABEL maintainer "Patrick Baber <patrick.baber@ueber.io>"

# Configure cron
COPY crontab /etc/cron/crontab

# Init cron
RUN crontab /etc/cron/crontab

CMD ["crond", "-f"]
```

### Build
`$ docker image build -t cron-image .`

### Run
`$ docker container run -d --rm --name cron-container cron-image`

### See Logs
`$ docker container logs cron-container`
