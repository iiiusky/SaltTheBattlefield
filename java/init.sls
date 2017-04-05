#java:
include:
{% if grains['os'] == 'Kali' %}
  - java.orcale
#  java.orcale
{% elif grains['os'] == 'Ubuntu' %} 
  - java.openjdk
{% else %}
  OS unsupported
{% endif %}

