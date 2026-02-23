demo_branch := "demo"
demo_data := \
    'name="Demo DEMO"' + \
    ' author_name="Tomas Janousek"' + \
    ' author_email=tomi@nomi.cz' + \
    ' author_github=liskin' + \
    ' author_paypal=lisknisi'

# Generate demo project into the .tmp subdirectory.
# Specify rm="" to avoid cleaning the subdirectory first.
tmp rm="rm":
    if [ -n "{{rm}}" ]; then {{rm}} -r .tmp; fi
    cookiecutter \
        --no-input \
        --overwrite-if-exists \
        --output-dir .tmp \
        . \
        _dest_dir=. \
        _setuptools_scm_root=.. \
        {{demo_data}}

# Generate demo project into a demo branch using the update.sh machinery.
demo:
    ./update.sh --template . --branch {{demo_branch}} {{demo_data}}

# Clean (remove all gitignored files and prune worktrees).
clean:
    git clean -ffdX
    git worktree prune
