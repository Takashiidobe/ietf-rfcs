SOURCE_DOCS := $(shell find src -type f -name "*.md")

HTML_FILES=$(SOURCE_DOCS:src/%.md=site/%.html)

all: html copy_files
	firefox site/index.html

deploy: html copy_files build_index
	ntl deploy --prod

html: mkdirs $(HTML_FILES)

site/%.html: src/%.md templates/site.html
	pandoc -f markdown+fenced_divs -s $< -o $@ --table-of-contents --template templates/site.html

build_index: $(SOURCE_DOCS)
	/usr/local/bin/pagefind --source site

copy_files:
	cp templates/*{.css,.js} site/

clean:
	rm -r site/**/*.html

.PHONY: mkdirs
mkdirs:
	rsync -a --include='*/' \
	--include="*.png" \
	--include="*.jpg" \
	--include="*.jpeg" \
	--exclude='*' src/ site/
