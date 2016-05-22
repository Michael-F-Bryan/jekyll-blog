SOURCE := $(wildcard ./*.md ./*.html ./posts/*)
OUTPUT := $(wildcard ./_site/*)
PRODUCTION := production
RM = rm -rf


build: _site/index.html

$(OUTPUT): $(SOURCE)
	jekyll build 

deploy:
	git push $(PRODUCTION) master

serve:
	jekyll serve --watch --open-url

clean:
	$(RM) ./_site

.PHONY: deploy serve clean

