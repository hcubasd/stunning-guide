# stunning-guide

Projeto universitario em LaTeX com compilacao automatizada por `latexmk` + `biber`
e publicacao de PDF por tag semantica no GitHub Actions.

## Estrutura

- `src/main.tex`: documento principal com preambulo e ordem das secoes.
- `src/abstract.tex`: secao modular em formato `standalone`.
- `src/introduction.tex`: introducao modular em formato `standalone`.
- `src/search_strings.tex`: apendice modular com floats de strings de busca.
- `src/search-strings/`: arquivos externos usados pelos listings das strings.
- `src/references.bib`: base bibliografica.
- `Makefile`: fluxo local de build para `build/` e `dist/`.
- `.github/workflows/release.yml`: release automatizado em tags `v*.*.*`.

## Build Local

Instalar dependencias TeX Live:

```sh
sh scripts/install-dependencies.sh
```

Gerar o PDF final:

```sh
make clean dist
```

O artefato final fica em `dist/main.pdf`.

## Modulos Standalone

As secoes em `src/*.tex` usam a classe `standalone`, entao podem ser mantidas
como arquivos autocontidos ao mesmo tempo em que sao consumidas pelo
`src/main.tex`.
