# 1. Partimos de la imagen que ya habíamos verificado (stain/jena-fuseki:4.0.0)
FROM stain/jena-fuseki:4.0.0

# 2. Dónde está Fuseki internamente
ENV FUSEKI_HOME=/fuseki

# 3. Carpeta de trabajo
WORKDIR /fuseki

# 4. Copiamos tu dataset TDB2
COPY run/databases/Juegos /fuseki/databases/Juegos

# 5. Copiamos config.ttl y shiro.ini al lugar que espera Fuseki
COPY dataset/config.ttl /fuseki/config.ttl
COPY dataset/shiro.ini   /fuseki/shiro.ini

# 6. Documentamos el puerto
EXPOSE 3030

# 7. Arrancamos directamente el binario en shell form para que
#    1) expanda $PORT
#    2) use la ruta absoluta => no “not found”
CMD /fuseki/fuseki-server \
    --config=/fuseki/config.ttl \
    --host=0.0.0.0 \
    --port=$PORT
