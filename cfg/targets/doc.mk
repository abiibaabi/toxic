# Doc target
doc: $(MANFILES:%=$(DOC_DIR)/%)

$(DOC_DIR)/%: $(DOC_DIR)/%.asc
	@echo "  MAN   $(@F)"
	@a2x -f manpage -a revdate=$(shell git log -1 --date=short --format="%ad" $<) \
		-a manmanual="Toxic Manual" -a mansource=toxic \
		-a manversion=__VERSION__ -a datadir=__DATADIR__ $<

.PHONY: doc
