SHELL := /bin/bash

DEST ?= ~/.local/bin
MODE ?= 755

.PHONY: install
install: korona.sh
	@echo "Installing as: $(DEST)/korona"
	@cp korona.sh /tmp/korona
	@install -Dm $(MODE) -t $(DEST) /tmp/korona  
	@echo "Done."

.PHONY: remove
remove: $(DEST)/korona
	@echo "Removing: $(DEST)/korona"
	@rm $(DEST)/korona
	@echo "Done."