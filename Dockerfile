FROM apache/jena-fuseki:4.9.0

# Indica dónde está instalado Fuseki en la imagen oficial
ENV FUSEKI_HOME=/jena-fuseki

# Copiamos tu dataset TDB2 a la carpeta que Fuseki espera
COPY run/databases/Juegos /jena-fuseki/databases/Juegos

# Copiamos el config.ttl a la raíz de FUSEKI_HOME
COPY dataset/config.ttl /jena-fuseki/config.ttl

# (Opcional) documentamos que abrimos 3030
EXPOSE 3030

# Arrancamos Fuseki a 0.0.0.0:$PORT con tu config
CMD [ \
  "--config=/jena-fuseki/config.ttl", \
  "--host=0.0.0.0", \
  "--port=${PORT}" \
]
