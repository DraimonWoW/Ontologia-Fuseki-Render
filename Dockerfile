# 1. Usamos la imagen oficial de Fuseki
FROM stain/jena-fuseki:4.0.0

# 2. Creamos el working dir
WORKDIR /fuseki

# 3. Copiamos la base de datos TDB2
COPY run/databases/Juegos /fuseki/databases/Juegos

# 4. Copiamos el config de Fuseki
COPY dataset/config.ttl /fuseki/config.ttl

# 5. Indicamos que use ese config al arrancar
ENV FUSEKI_CONFIG=/fuseki/config.ttl

# 6. Exponemos el puerto 3030
EXPOSE 3030

# 7. Arrancamos Fuseki con la configuración
CMD fuseki-server \
    --config=/fuseki/config.ttl \
    --port=3030 \
    --host=0.0.0.0