# 1. Partimos de una imagen que exista en Docker Hub
FROM iomz/jena-fuseki:latest
#  o bien: FROM stain/jena-fuseki:3.7.0

# 2. Indica dónde está instalado Fuseki (la imagen ya lo usa así)
ENV FUSEKI_HOME=/fuseki

# 3. Pon el working dir (opcional)
WORKDIR /fuseki

# 4. Copia tu dataset TDB2
COPY run/databases/Juegos /fuseki/databases/Juegos

# 5. Copia tu config.ttl corregido
COPY dataset/config.ttl /fuseki/config.ttl

# 6. Documenta el puerto (Render usará $PORT)
EXPOSE 3030

# 7. Arranca Fuseki usando el entrypoint que ya trae la imagen,
#    pasándole los flags para host y puerto de Render.
CMD [ \
  "--config=/fuseki/config.ttl", \
  "--host=0.0.0.0", \
  "--port=${PORT}" \
]
