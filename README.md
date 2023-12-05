# Python CLI cookiecutter template

[Cookiecutter](https://github.com/cookiecutter/cookiecutter) template that I use for
[my Python CLI projects](https://github.com/topics/liskin-cookiecutter-python-cli).

## Starting a new project

```console
$ mkdir my-project
$ cd my-project
$ ~/src/cookiecutter-python-cli/update.sh \
    -t "$(realpath --relative-to=. ~/src/cookiecutter-python-cli)" \
    -p . -b template name=my-project
$ git reset --hard template
$ gh repo create --public --source=. my-project
$ git push -u origin main template
```

## Updating an existing project

```console
$ make template-merge
$ git push origin main template
```
