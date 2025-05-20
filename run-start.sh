exec fuseki-server \
  --port=${PORT:-3030} \
  --host=0.0.0.0 \
  --config=/jena-fuseki/config.ttl