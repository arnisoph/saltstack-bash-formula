#!jinja|yaml

{% from "bash/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('bash:lookup')) %}

bash:
  pkg:
    - installed
    - pkgs:
{% for p in datamap.pkgs %}
      - {{ p }}
{% endfor %}

{% for u in salt['pillar.get']('bash:config:manage:users', []) %}
userdir_bash_profile:
  file:
    - managed
    - name: {{ salt['user.info'](u).home ~ '/.bash_profile' }}
    - source: salt://bash/files/userdir/.bash_profile
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}

userdir_bash_logout:
  file:
    - managed
    - name: {{ salt['user.info'](u).home ~ '/.bash_logout' }}
    - source: salt://bash/files/userdir/.bash_logout
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}

userdir_bash_aliases:
  file:
    - managed
    - name: {{ salt['user.info'](u).home ~ '/.bash_aliases' }}
    - source: salt://bash/files/userdir/.bash_aliases
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}

userdir_bashrc:
  file:
    - managed
    - name: {{ salt['user.info'](u).home ~ '/.bashrc' }}
    - source: salt://bash/files/userdir/.bashrc
    - mode: 640
    - user: {{ u }}
    - group: {{ u }}
{% endfor %}
