FROM stain/jena-fuseki

COPY ./dataset /fuseki/databases/juegos

ENV ADMIN_PASSWORD=admin
ENV FUSEKI_DATASET=juegos
ENV FUSEKI_PASSWORDS=fuseki-passwords
ENV FUSEKI_BASE=/fuseki
