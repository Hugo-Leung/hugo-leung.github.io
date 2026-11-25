# My Personal Website

[![CC BY-NC-ND 4.0][cc-by-nc-nd-shield]][cc-by-nc-nd]
[![Deploy Hugo site to Pages](https://github.com/Hugo-Leung/hugo-leung.github.io/actions/workflows/hugo.yml/badge.svg)](https://github.com/Hugo-Leung/hugo-leung.github.io/actions/workflows/hugo.yml)

The source for my personal website.

The content under `content/` is licensed under CC-BY-NC-ND-4.0, unless otherwise specified.

## Prerequisites

To build this website, install:

- [Hugo](https://gohugo.io/) 0.146.0 or newer
- [Dart Sass](https://sass-lang.com/dart-sass/)
- Node.js and [npm](https://www.npmjs.com/)
- Git submodule

Or uses the `ghcr.io/gohugoio/hugo:latest` image, which includes all of them.

## Setup

Initialize the [personal-web theme](https://github.com/Hugo-Leung/personal-web), which is installed as a Git submodule:

```bash
git submodule update --init --recursive
```

Install the npm dependencies:

```bash
npm ci
```

For a deployment environment that needs only production assets:

```bash
npm ci --omit=dev
```

### npm dependencies

**Development dependencies:**

- [`cspell-cli`](https://github.com/streetsidesoftware/cspell-cli) — spell checking
- [`husky`](https://typicode.github.io/husky/) — Git hooks
- [`lint-staged`](https://github.com/lint-staged/lint-staged) — pre-commit checks
- [`prettier`](https://prettier.io/) — Markdown formatting

**Deployment dependencies:**

- [`@fortawesome/fontawesome-free`](https://fontawesome.com/) — icons used by the theme
- [`katex`](https://katex.org/) — mathematics rendering

The deployment dependencies are provided through the `packages/hugoautogen` npm workspace.

## Development build

Start a Hugo development server with live reload:

```bash
hugo server
```

## Production build

Build and minify the website:

```bash
hugo --minify --baseURL "https://hugo-leung.github.io/"
```

The generated website is written to `public/`.

[cc-by-nc-nd]: http://creativecommons.org/licenses/by-nc-nd/4.0/
[cc-by-nc-nd-shield]: https://img.shields.io/badge/License-CC%20BY--NC--ND%204.0-lightgrey.svg
