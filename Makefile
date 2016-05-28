SOURCE := $(wildcard ./*.md ./*.html ./posts/*)
OUTPUT := $(wildcard ./_site/*)
PRODUCTION := production
RM = rm -rf

build: _site/index.html

$(OUTPUT): $(SOURCE)
	jekyll build 

deploy:
	@git diff-index --quiet HEAD -- || (printf "Please commit your changes first.\n\n"; exit 1)
	git push $(PRODUCTION) master

serve:
	( sleep 2 && firefox 'http://localhost:4000/' ) &
	jekyll serve --watch 

clean:
	$(RM) ./_site

.PHONY: deploy serve clean

