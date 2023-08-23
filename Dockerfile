FROM rust:1.67

RUN curl https://sh.rustup.rs -sSf -y | sh

RUN rustup install nightly

RUN cargo install diesel_cli --no-default-features --features "postgres"

ADD . /app

WORKDIR /app
# RUN chmod 777 /app/kek.sh
# RUN /app/kek.sh


EXPOSE 8000
RUN chmod 777 /app/entrypoint.sh
ENTRYPOINT /app/entrypoint.sh