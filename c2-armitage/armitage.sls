armitage_archive:
    archive.extracted:
      - name: /opt/armitage
      - source: salt://c2-armitage/armitage150813.tgz
#      - archive_format: tar
#      - tar_options: v
      - if_missing: /opt/armitage/

/opt/armitage/armitage:
    file.symlink:
      - target: /usr/local/bin/armitage

/opt/armitage/teamserver:
    file.symlink:
      - target: /usr/local/bin/teamserver

echo java -jar /opt/armitage/armitage/armitage.jar \$\* > /opt/armitage/armitage/armitage:
    cmd.run

perl -pi -e 's/armitage.jar/\/opt\/armitage\/armitage.jar/g' /opt/armitage/teamserver:
    cmd.run
