SOURCE = ./*.md ./*.html ./posts/*
PRODUCTION = production
RM = rm- rf


build: _site/*

_site/index.html: $(SOURCE)
	jekyll build --incremental

deploy:
	git push $(PRODUCTION) master

serve:
	jekyll serve

clean:
	$(RM) ./_site

.PHONY: deploy serve clean

