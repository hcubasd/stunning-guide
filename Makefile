SRC_DIR := src
BUILD_DIR := build
DIST_DIR := dist
TEX_FILE := $(SRC_DIR)/main.tex
TEX_NAME := main.tex
PDF_FILE := main.pdf
TEXLIVE_BIN := $(shell kpsewhich -var-value=SELFAUTOLOC 2>/dev/null)
LATEXMK := $(if $(TEXLIVE_BIN),$(TEXLIVE_BIN)/latexmk,latexmk)

.PHONY: all install-dependencies build dist deploy clean

all: dist

install-dependencies:
	sh scripts/install-dependencies.sh

build:
	mkdir -p $(BUILD_DIR)
	cd $(SRC_DIR) && PATH="$(PATH):$(TEXLIVE_BIN)" $(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error -outdir=../$(BUILD_DIR) $(TEX_NAME)

dist: build
	mkdir -p $(DIST_DIR)
	cp $(BUILD_DIR)/$(PDF_FILE) $(DIST_DIR)/$(PDF_FILE)

deploy: dist

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)
