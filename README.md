This is the [Hakyll](http://jaspervdj.be/hakyll/) source for the uWaterloo Open Design Consortium's [Github Pages site.](http://uwaterloo-open-design.github.io)

Installation is simple:

First, ensure you have `git`, `make`, and The Glorious Glasgow Haskell Compilation System (`ghc`) installed, then just `clone` and `make` the project.

GHC's Cabal will build any dependencies from source, so you'll have time for a leisurely cup of coffee before getting down to work.

``` bash
> git clone https://github.com/uwaterloo-open-design/uwaterloo-open-design.github.io
> cd uwaterloo-open-design.github.io
> make
```

The build and site generation process is automated using GNU Make:

``` bash
> make all 		# Rebuild static site, including all site content. Builds site executable if required.
> make 			# Equivalent to 'make'
> make site		# Build site generator executable from site.hs
> make clean 		# Remove all generated site content
> make distclean 	# Restore directory tree to initial sanitized state.
> make push 		# Deploy the current version of the _site directory to Github Pages.
```

That just about covers things.
