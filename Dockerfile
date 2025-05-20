# Imagen base que ya sabes que funciona
FROM stain/jena-fuseki:4.8.0

# Working dir por convención
WORKDIR /jena-fuseki

# Copiamos base de datos y configuraciones
COPY run/databases/Juegos /jena-fuseki/databases/Juegos
COPY dataset/config.ttl    /jena-fuseki/config.ttl
COPY dataset/shiro.ini     /jena-fuseki/shiro.ini

# Puerto para Render
EXPOSE 3030

# Aquí usamos el binario explícitamente
CMD ["./fuseki-server", "--config=config.ttl", "--host=0.0.0.0", "--port=3030"]
