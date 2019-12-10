# {{ cookiecutter.module_name }}

{{ cookiecutter.module_description }}

## Installation

Download or clone the repository.  Within the repository's directory, execute:

    $ l3build install

This should install the package in a place that your TeX installation can find it
and also that you can write to.  But if you're nervous, run this first:

    $ l3build install --dry-run

This will prepare the installation in the `build/` subdirectory and inform you
where it *would* install.

A full installation will build/install documentation and source files in the
proper place:

    $ l3build install --full

Again, the `--dry-run` option will prepare without installation.

If your TeX installation doesn't have `l3build` (that is, you can an error
message like `l3build: command not found`), try instead:

    $ texlua build.lua install --full

But you should probably update your TeX distribution.

If the `--full` option isn't recognized, skip
it and install the documentation separately:

    $ cp -r build/doc/* `kpsewhich --var-value TEXMFHOME`/doc 

But again, you should probably update your TeX distribution. 

## Documentation

Within the repository, this command will build the documentation:

    $ l3build doc

The user documentation is in the file `{{ cookiecutter.module_name }}.pdf`.  The
file `{{ cookiecutter.module_name }}-code.pdf` will have the user documentation
and pretty-printed code.

After installation, you can execute 

    $ texdoc {{ cookiecutter.module_name }}

anwhere from the command line.
