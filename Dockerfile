FROM ubuntu:18.04 as build
RUN apt update && \
    apt install -y curl unzip

RUN curl https://netix.dl.sourceforge.net/project/hidrdd/hidrdd-1.1.27.zip -o hidrdd.zip && \
    unzip hidrdd.zip -d hidrdd


FROM ubuntu:18.04 as final
RUN apt update && \
    apt install -y regina-rexx
COPY --from=build /hidrdd /hidrdd
WORKDIR /hidrdd
ENTRYPOINT [ "rexx" ]
