{% if grains['osarch'] == 'amd64' %}
  {% set arch = '64' %}
{% else %}
  {% set arch = '32' %}
{% endif %}
  
{% if grains['os'] == 'Windows' %}
  {% set os = 'windows' %}
{% else %}
  {% set os = 'linux' %}
{% endif %}

Extract GoPhish:
  archive.extracted:
    - name: /opt/GoPhish
    - source: salt://offline_installers/gophish/gophish-v0.3-{{ os }}-{{ arch }}bit.zip

/opt/GoPhish/gophish-v0.3-{{ os }}-{{ arch }}bit/config.json:
  file.managed:
    - source: salt://phishing-gophish/config.json

/opt/GoPhish/gophish-v0.3-{{ os }}-{{ arch }}bit/gophish:
  file.managed:
    - mode: 500

# Start GoPhish in a screen session
screen -m -d -S "gophish" bash -c "/opt/GoPhish/gophish-v0.3-{{ os }}-{{ arch }}bit/gophish":
  cmd.run:
    - cwd : /opt/GoPhish/gophish-v0.3-{{ os }}-{{ arch }}bit/
