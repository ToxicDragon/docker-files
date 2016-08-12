# latex
This repository provides a LaTeX (Texlive) distribution and needed tools for a properly working LaTeX environment. It is based on Ubuntu 16.04 minimal ISO and reduced by deleting unnecessary documentation. One example usecase may be the continuous integration in GitLab CI for building LaTeX documents. An example .gitlab-ci.yml file may look like follows:

    compile_pdf:
      image: toxicdragon/latex
      script:
        - latexmk -pdf -cd ./path/to/latex/root-document.tex
      artifacts:
        paths:
          - root-document.pdf