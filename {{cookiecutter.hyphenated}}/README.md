# {{ cookiecutter.name }}

[![PyPI Python Version badge](https://img.shields.io/pypi/pyversions/{{ cookiecutter.hyphenated }})](https://pypi.org/project/{{ cookiecutter.hyphenated }}/)
[![PyPI Version badge](https://img.shields.io/pypi/v/{{ cookiecutter.hyphenated }})](https://pypi.org/project/{{ cookiecutter.hyphenated }}/)
![License badge](https://img.shields.io/github/license/{{ cookiecutter.author_github }}/{{ cookiecutter.hyphenated }})

## Overview

{{ cookiecutter.name }} is a …

<!-- FIXME: example image -->

## Installation

Using [pipx][]:

```
pipx ensurepath
pipx install {{ cookiecutter.hyphenated }}
```

To keep a local git clone around:

```
git clone https://github.com/{{ cookiecutter.author_github }}/{{ cookiecutter.hyphenated }}
make -C {{ cookiecutter.hyphenated }} pipx
```

Alternatively, if you don't need the isolated virtualenv that [pipx][]
provides, feel free to just:

```
pip install {{ cookiecutter.hyphenated }}
```

[pipx]: https://github.com/pypa/pipx

## Usage

<!-- include .readme.md/help.md -->
<!-- end include -->

<!-- FIXME: example -->

### Configuration file

Secrets (and other options) can be set permanently in a config file,
which is located at `~/.config/{{ cookiecutter.underscored }}/config.yaml` by default
(on Linux; on other platforms see output of `--help`).

Sample config file can be generated using the `--config-sample` flag:

<!-- include .readme.md/config-sample.md -->
<!-- end include -->
{%- if cookiecutter.author_github and cookiecutter.author_paypal %}

## Donations (♥ = €)

If you like this tool and wish to support its development and maintenance,
please consider [a small donation](https://www.paypal.me/{{ cookiecutter.author_paypal }}/10EUR) or
[recurrent support through GitHub Sponsors](https://github.com/sponsors/{{ cookiecutter.author_github }}).

By donating, you'll also support the development of my other projects. You
might like these:

* <!-- FIXME: [name](link) --> – <!-- FIXME: description -->
{%- endif %}
