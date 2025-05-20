# 1. Usamos la imagen oficial de Fuseki
FROM stain/jena-fuseki:4.0.0

# 2. Le decimos dónde está Fuseki internamente
ENV FUSEKI_HOME=/fuseki

# 2. Creamos el working dir
WORKDIR /fuseki

# 3. Copiamos la base de datos TDB2
COPY run/databases/Juegos /fuseki/databases/Juegos

# 4. Copiamos el config de Fuseki
COPY dataset/config.ttl /fuseki/config.ttl

# 6. Exponemos el puerto 3030
EXPOSE 3030

# 7. Arrancamos Fuseki con la configuración
CMD /fuseki/fuseki-server \
    --config=/fuseki/config.ttl \
    --host=0.0.0.0 \
    --port=${PORT}