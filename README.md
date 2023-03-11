# IETF RFCs

This repo contains the markdown files required to create a searchable, offline copy of the IETF RFCs.

You'll need `pandoc` and `pagefind` on your `$PATH`.

Pagefind allows for offline searching as long as you disable CORB on the browser.

Pandoc coverts the files from markdown to html.

## Building

To build the site, run `make`, and to build the accompanying search index, run `make build_index`. The site will be built in `site/`.
