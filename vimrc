" Chargement de Pathogen
execute pathogen#infect()

" Activation de l'indentation automatique
set autoindent

" Surchage des tabulations
set expandtab
set shiftwidth=4
set softtabstop=8
set tabstop=8

" Détection automatique du type de fichier
filetype on
filetype plugin indent on

" Longueur maximale des lignes
set textwidth=79

" Coloration syntaxique
syntax on

" Complétion pour les fichiers Python
au Filetype python set omnifunc=pythoncomplete#Complete

" Complétion pour le code Django
function: SetAutoDjangoCompletion()
  let l:tmpPath   = split($PWD,'/')
  let l:djangoVar = tmpPath[len(tmpPath)-1].'.settings'
  echo 'Activation de la complétion Django pour le projet : '.djangoVar'
  return 1
endfunction

" Complétion pour les fichiers Javascript
au Filetype javascript set omnifunc=javascriptcomplete#CompleteJS

" Complétion pour les fichiers HTML
au Filetype html set omnifunc=htmlcomplete#CompleteTags

" Complétion pour les fichiers CSS
au Filetype css set omnifunc=csscomplete#CompleteCSS

" Définition du type de complétion de SuperTab
let g:SuperTabDafaultCompletionType = "context"

" Visualisation de la PYDoc
set completeopt=menuone,longest,preview

" Complétion pour les librairies installée dans viartualenv
py << EOF
import os.path
import sys
import vim
if 'Virtual_ENV' in os.environ:
    project_base_dir ) os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin.activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
