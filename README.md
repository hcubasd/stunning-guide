# stunning-guide

Projeto universitario em LaTeX com compilacao automatizada por `latexmk` + `biber`
e publicacao de PDF por tag semantica no GitHub Actions.

## Estrutura

- `src/main.tex`: documento principal com preambulo compartilhado e ordem das secoes.
- `src/abstract.tex`: secao de resumo.
- `src/introduction.tex`: secao de introducao.
- `src/search_strings.tex`: apendice com floats de strings de busca.
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

## Organizacao

Cada secao vive em seu proprio arquivo dentro de `src/`, e o `main.tex` apenas
inclui essas secoes em ordem. Isso mantem o documento simples de navegar sem
duplicar preambulo entre arquivos.
