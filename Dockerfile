FROM  busybox:latest
LABEL maintainer="MTD"

RUN wget -O /usr/sbin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 && \
    chmod +x /usr/sbin/gitlab-runner
RUN mkdir -p /gitlab-runner && \
    chown -R nobody:nogroup /gitlab-runner

USER       nobody
EXPOSE     9090
VOLUME     [ "/gitlab-runner" ]
WORKDIR    /gitlab-runner
ENTRYPOINT [ "/usr/sbin/gitlab-runner" ]
CMD        ["run", "--working-directory=/home/gitlab-runner"]
