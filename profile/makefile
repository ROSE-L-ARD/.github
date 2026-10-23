# Project directories
TYP_DIR    := typst
ASSETS_DIR := assets

# Discover all .typ files and map them to their corresponding .svg targets
SOURCES := $(wildcard $(TYP_DIR)/*.typ)
TARGETS := $(patsubst $(TYP_DIR)/%.typ, $(ASSETS_DIR)/%.svg, $(SOURCES))

.PHONY: all clean watch help

all: $(TARGETS)

$(ASSETS_DIR)/%.svg: $(TYP_DIR)/%.typ
	@mkdir -p $(ASSETS_DIR)
	@echo "Compiling $< -> $@"
	typst compile --root . $< $@

clean:
	@echo "Cleaning up generated assets..."
	rm -f $(TARGETS)

FILE ?= consortium-dark
watch:
	@mkdir -p $(ASSETS_DIR)
	@echo "Starting typst watch on $(TYP_DIR)/$(FILE).typ..."
	typst watch --root . $(TYP_DIR)/$(FILE).typ $(ASSETS_DIR)/$(FILE).svg

help:
	@echo "Available targets:"
	@echo "  make         - Compiles any modified .typ files into assets/*.svg"
	@echo "  make clean   - Removes all compiled SVGs"
	@echo "  make watch   - Live compiles on file changes (e.g. make watch FILE=consortium-dark)"
