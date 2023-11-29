# Demo DEMO

[![PyPI Python Version badge](https://img.shields.io/pypi/pyversions/demo-demo)](https://pypi.org/project/demo-demo/)
[![PyPI Version badge](https://img.shields.io/pypi/v/demo-demo)](https://pypi.org/project/demo-demo/)
![License badge](https://img.shields.io/github/license/liskin/demo-demo)

## Overview

Demo DEMO is a …

<!-- FIXME: example image -->

## Installation

Using [pipx][]:

```
pipx ensurepath
pipx install demo-demo
```

To keep a local git clone around:

```
git clone https://github.com/liskin/demo-demo
make -C demo-demo pipx
```

Alternatively, if you don't need the isolated virtualenv that [pipx][]
provides, feel free to just:

```
pip install demo-demo
```

[pipx]: https://github.com/pypa/pipx

## Usage

<!-- include tests/readme/help.md -->
    $ demo-demo --help
    Usage: demo-demo [OPTIONS]
    
    Options:
      --config FILE    Read configuration from FILE.  [default:
                       /home/user/.config/demo_demo/config.yaml]
      --config-sample  Show sample configuration file
      --help           Show this message and exit.
<!-- end include -->

<!-- FIXME: example -->

### Configuration file

Secrets (and other options) can be set permanently in a config file,
which is located at `~/.config/demo_demo/config.yaml` by default
(on Linux; on other platforms see output of `--help`).

Sample config file can be generated using the `--config-sample` flag:

<!-- include tests/readme/config-sample.md -->
    $ demo-demo --config-sample
<!-- end include -->

## Donations (♥ = €)

If you like this tool and wish to support its development and maintenance,
please consider [a small donation](https://www.paypal.me/lisknisi/10EUR) or
[recurrent support through GitHub Sponsors](https://github.com/sponsors/liskin).

By donating, you'll also support the development of my other projects. You
might like these:

* <!-- FIXME: [name](link) --> – <!-- FIXME: description -->
