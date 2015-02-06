soft-mv = [ -a $(1) ] && mv -r $(1) $(2)

all:
	find $(PWD) -regex ".*html?" -exec tidy -indent -modify -quiet {} \;
	$(call soft-mv  _site/CNAME tmp)
	$(call soft-mv  _site/README.md tmp)

	$(PWD)/site clean
	$(PWD)/site build


	$(call soft-mv tmp/CNAME  _site/ )
	$(call soft-mv tmp/README.md  _site/ )

clean:
	$(PWD)/site clean

distclean: clean
	rm site
	rm dist
	rm cabal-dev
	rm *.o
	rm *.hi
	rm *.chi
	rm *.chs.h
	rm *.dyn_o
	rm *.dyn_hi
	rm .virtualenv
	rm .hpc
	rm .hsenv
	rm -r .cabal-sandbox/
	rm cabal.sandbox.config
	rm cabal.config
	rm *.prof
	rm *.aux
	rm *.hp

push: all
	git subtree push --prefix _site origin master

.PHONY: all clean distclean push
