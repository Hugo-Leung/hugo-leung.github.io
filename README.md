# My Personal webpage
[![CC BY-NC-ND 4.0][cc-by-nc-nd-shield]][cc-by-nc-nd]
[![Deploy Hugo site to Pages](https://github.com/Hugo-Leung/hugo-leung.github.io/actions/workflows/hugo.yml/badge.svg)](https://github.com/Hugo-Leung/hugo-leung.github.io/actions/workflows/hugo.yml)

Website sources for my personal webpage
The content under `content/` is license under CC-BY-NC-ND-4.0

## Prerequisites

This website uses [Hugo](https://gohugo.io/). To build the sources, you need to install it first.

Linux:
```bash
sudo snap install hugo
```


## Build website

Install NPM dependencies

Compile website:
```bash
hugo
```

The compiled HTML files will be stored in the `public` folder.

Instead of building static HTML files, you can also start a Hugo development server with live reload:
```bash
hugo serve
```


[cc-by-nc-nd]: http://creativecommons.org/licenses/by-nc-nd/4.0/
[cc-by-nc-nd-image]: https://licensebuttons.net/l/by-nc-nd/4.0/88x31.png
[cc-by-nc-nd-shield]: https://img.shields.io/badge/License-CC%20BY--NC--ND%204.0-lightgrey.svg

