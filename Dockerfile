# 1. Imagen base (sabe arrancar Fuseki + entrypoint que maneja shiro.ini)
FROM stain/jena-fuseki:4.0.0

# 2. Dónde está Fuseki
ENV FUSEKI_HOME=/fuseki

# 3. Carpeta de trabajo (opcional)
WORKDIR /fuseki

# 4. Copiamos tu dataset TDB2
COPY run/databases/Juegos /fuseki/databases/Juegos

# 5. Copiamos tu configuración de servicios
COPY dataset/config.ttl /fuseki/config.ttl

# 6. Copiamos el nuevo shiro.ini al directorio que espera el entrypoint
COPY dataset/shiro.ini  /fuseki/shiro.ini

# 7. Exponemos el puerto (documental; Render usa $PORT)
EXPOSE 3030

# 8. Ejecutamos el entrypoint con los flags para host y puerto
#    El entrypoint hará internamente: exec fuseki-server "$@"
CMD ["--config=/fuseki/config.ttl","--host=0.0.0.0","--port=${PORT}"]
