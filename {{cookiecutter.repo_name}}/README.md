{%- set year, month, day = cookiecutter.date.split('-') -%}
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

## License

Copyright (C) {{ year }} by {{ cookiecutter.author_name }} <{{ cookiecutter.author_email }}>.

{% if cookiecutter.license == "LPPL" -%}

Released under the LaTeX Project Public License v1.3c or later
See https://www.latex-project.org/lppl.txt

{% elif cookiecutter.license == "MIT" -%}

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

{% endif %}