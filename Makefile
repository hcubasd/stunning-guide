SRC_DIR := src
BUILD_DIR := build
DIST_DIR := dist
TEX_FILE := $(SRC_DIR)/main.tex
PDF_FILE := main.pdf

.PHONY: all install-dependencies build dist deploy clean

all: dist

install-dependencies:
	sh scripts/install-dependencies.sh

build:
	mkdir -p $(BUILD_DIR)
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR) $(TEX_FILE)

dist: build
	mkdir -p $(DIST_DIR)
	cp $(BUILD_DIR)/$(PDF_FILE) $(DIST_DIR)/$(PDF_FILE)

deploy: dist

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
