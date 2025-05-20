# 1. Imagen base que existe y sabemos que funciona
FROM stain/jena-fuseki:4.8.0

# 2. Pon tu working dir donde Fuseki está instalado
WORKDIR /jena-fuseki

# 3. Copia tu dataset ya indexado
COPY run/databases/Juegos /jena-fuseki/databases/Juegos

# 4. Copia tu config.ttl y tu shiro.ini al directorio correcto
COPY dataset/config.ttl  /jena-fuseki/config.ttl
COPY dataset/shiro.ini   /jena-fuseki/shiro.ini

# 5. Documenta el puerto que Fuseki va a usar
EXPOSE 3030

# 6. Pasa SOLO flags al ENTRYPOINT oficial (que internamente hace 'exec fuseki-server "$@"')
#    Fíjalo en 0.0.0.0:3030 para que Render lo detecte sin problemas
CMD ["--config=/jena-fuseki/config.ttl", "--host=0.0.0.0", "--port=3030"]
