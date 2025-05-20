# Imagen base oficial de Fuseki
FROM stain/jena-fuseki:4.8.0

# Directorio de trabajo por convención
WORKDIR /jena-fuseki

# Copiar base de datos y configuraciones
COPY run/databases/Juegos /jena-fuseki/databases/Juegos
COPY dataset/config.ttl    /jena-fuseki/config.ttl
COPY dataset/shiro.ini     /jena-fuseki/shiro.ini

# Exponer el puerto 3030 (usado por Fuseki)
EXPOSE 3030

# Comando de arranque sin la opción --host (no es válida)
CMD ["fuseki-server", "--config=config.ttl", "--port=3030"]
