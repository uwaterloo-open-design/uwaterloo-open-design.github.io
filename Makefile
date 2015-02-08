soft-mv = [ -a $(1) ] && mv -r $(1) $(2)
soft-rm = rm $(1) $(2) || true


site-exec=$(PWD)/dist/build/site/site
cabal_exists=$(shell ls -d .cabal_sandbox 2> /dev/null; echo $$? )

all: $(site-exec)
	find $(PWD) -regex ".*html?" -exec tidy -indent -modify -quiet {} \;
	$(call soft-mv  _site/CNAME tmp)
	$(call soft-mv  _site/README.md tmp)

	$(site-exec) clean
	$(site-exec) build

	$(call soft-mv tmp/CNAME  _site/ )
	$(call soft-mv tmp/README.md  _site/ )

$(site-exec): site.hs
ifneq ($(cabal_exists),0)
# If a cabal sandbox does not yet exist, initialize
#	one before checking project dependencies
	cabal sandbox init
endif
	cabal install --only-dependencies
	cabal build

clean:
	[ -x $(site-exec) ] && $(site-exec) clean || true

distclean: clean
	rm -r dist/    || true
	rm *.o         || true
	rm *.hi        || true
	rm *.chi       || true
	rm *.chs.h     || true
	rm *.dyn_o     || true
	rm *.dyn_hi    || true
	rm .virtualenv || true
	rm .hpc        || true
	rm .hsenv      || true
	rm -r .cabal-sandbox/   || true
	rm cabal.sandbox.config || true
	rm cabal.config         || true
	rm *.prof      || true
	rm *.aux       || true
	rm *.hp        || true

push: all
	git subtree push --prefix _site origin master


.PHONY: all init clean distclean push
