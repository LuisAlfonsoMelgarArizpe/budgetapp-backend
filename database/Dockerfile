# docker build -t budgetapp_database:1.0 .

# docker run -p 5433:5432 -d budgetapp_database:1.0

FROM postgres

ENV POSTGRES_PASSWORD=1234

EXPOSE 5432

ADD ./dump.sql /docker-entrypoint-initdb.d