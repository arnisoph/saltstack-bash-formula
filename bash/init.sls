#!jinja|yaml

{% from "bash/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('bash:lookup')) %}

bash:
  pkg:
    - installed
    - pkgs: {{ datamap.pkgs }}

{% for u in salt['pillar.get']('bash:config:manage:users', []) %}
  {% set homedir = salt['user.info'](u).home|default('/home/' ~ u) %}
user_{{ u }}_bash_profile:
  file:
    - managed
    - name: {{ homedir ~ '/.bash_profile' }}
    - source: salt://bash/files/userdir/.bash_profile
    - template: jinja
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}

user_{{ u }}_bash_logout:
  file:
    - managed
    - name: {{ homedir ~ '/.bash_logout' }}
    - source: salt://bash/files/userdir/.bash_logout
    - template: jinja
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}

user_{{ u }}_bash_aliases:
  file:
    - managed
    - name: {{ homedir ~ '/.bash_aliases' }}
    - source: salt://bash/files/userdir/.bash_aliases
    - template: jinja
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}

user_{{ u }}_bashrc:
  file:
    - managed
    - name: {{ homedir ~ '/.bashrc' }}
    - source: salt://bash/files/userdir/.bashrc
    - template: jinja
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}
{% endfor %}
