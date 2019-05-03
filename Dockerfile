FROM  busybox:latest
LABEL maintainer="MTD"

RUN wget -O /usr/sbin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 && \
    chmod +x /usr/sbin/gitlab-runner
RUN mkdir -p /gitlab-runner && \
    chmod 0770 /gitlab-runner && \
    chown -R nobody:root /gitlab-runner

USER       nobody
EXPOSE     9090
VOLUME     [ "/gitlab-runner" ]
WORKDIR    /gitlab-runner
ENTRYPOINT [ "/usr/sbin/gitlab-runner" ]
CMD        ["run", "--working-directory=/gitlab-runner"]
