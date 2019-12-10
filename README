A cookiecutter for an l3build simple, flat module
=================================================

This repository is a cookiecutter for basic latex packages, using the directory
structure suggested by the l3build “simple, flat” example.

Who is this for?
================

If you have a glob of LaTeX macros in a `.sty` file, and you want to add
documentation, version control, and testing to it, you can use this to get a
clean repository, and fold that code into it.

Usage
=====

From the command line:

    cookiecutter /path/to/here

Fill in the fields.  You get to choose a module name, which for documentation
purposes we will call `demopkg`.  You also get to choose a repository name,
which we will call `latex-demopkg`.

You will get a directory `latex-demopkg` with files:

* `demopkg.dtx`.  In here goes the package documentation and implementation in
  standard docstrip format.  You can read more about docstrip from `texdoc
  docstrip`.

* `demopkg.ins`.  Installation file.  You will not need to edit this.

* `demopkg.tex` and `demopkg-code.tex`.  These two files, when typeset, will provide
  the package documentation (and implementation, in the second case) stripped
  from `demopkg.dtx`.

* `build.lua`.  This is the configuration for the `l3build` process.

To reiterate: you should only need to edit `demopkg.dtx` to put your package's
functionality.

TODO: Add a `README` to the cookiecutter.

Next steps
==========

* More about docstrip

* More about l3build 

* More about semantic versioning
