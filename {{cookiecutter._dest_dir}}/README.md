# {{ cookiecutter.name }}

[![PyPI Python Version badge](https://img.shields.io/pypi/pyversions/{{ cookiecutter.hyphenated }})](https://pypi.org/project/{{ cookiecutter.hyphenated }}/)
[![PyPI Version badge](https://img.shields.io/pypi/v/{{ cookiecutter.hyphenated }})](https://pypi.org/project/{{ cookiecutter.hyphenated }}/)
![License badge](https://img.shields.io/github/license/{{ cookiecutter.author_github }}/{{ cookiecutter.hyphenated }})

## Overview

{{ cookiecutter.name }} is a …

<!-- FIXME: example image -->

## Installation

Using [uv][]:

```console
$ uv tool install {{ cookiecutter.hyphenated }}
```

Using [pipx][]:

```console
$ pipx ensurepath
$ pipx install {{ cookiecutter.hyphenated }}
```

From a git clone:

```console
$ git clone https://github.com/{{ cookiecutter.author_github }}/{{ cookiecutter.hyphenated }}
$ uv tool install ./{{ cookiecutter.hyphenated }}
```

[uv]: https://docs.astral.sh/uv/
[pipx]: https://github.com/pypa/pipx

## Usage

<!-- include tests/readme/help.md -->
<!-- end include tests/readme/help.md -->

<!-- FIXME: example -->

### Configuration file

Secrets (and other options) can be set permanently in a config file,
which is located at `~/.config/{{ cookiecutter.underscored }}/config.yaml` by default
(on Linux; on other platforms see output of `--help`).

Sample config file can be generated using the `--config-sample` flag:

<!-- include tests/readme/config-sample.md -->
<!-- end include tests/readme/config-sample.md -->
{%- if cookiecutter.author_github and cookiecutter.author_paypal %}

## Contributing

### Code

We welcome bug fixes, (reasonable) new features, documentation improvements,
and more. Submit these as GitHub pull requests. Use GitHub issues to report
bugs and discuss non-trivial code improvements; alternatively, get in touch
via [IRC/Matrix/Fediverse](https://work.lisk.in/contact/).

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details about the code base
(including running tests locally).

Note that this project was born out of a desire to solve a problem I was
facing. While I'm excited to share it with the world, keep in mind that I'll
be prioritizing features and bug fixes that align with my personal use cases.
There may be times when I'm busy with other commitments and replies to
contributions might be delayed, or even occasionally missed. Progress may come
in bursts. Adjust your expectations accordingly.

### Donations (♥ = €)

If you like this tool and wish to support its development and maintenance,
please consider [a small donation](https://www.paypal.me/{{ cookiecutter.author_paypal }}/10EUR) or
[recurrent support through GitHub Sponsors](https://github.com/sponsors/{{ cookiecutter.author_github }}).

By donating, you'll also support the development of my other projects. You
might like these:

* <!-- FIXME: [name](link) --> – <!-- FIXME: description -->
{%- endif %}
