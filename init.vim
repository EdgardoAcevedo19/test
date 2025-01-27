" ~/.config/nvim/init.vim

" Llamar a init.lua desde init.vim
lua require('init')


"Sintaxis
syntax on
syntax enable


" Configuración básica
set autoindent " Identación automática
set backspace=indent,eol,start " Funcionabilidades con la tecla retroceso
set background=dark " Establece el fondo del editor con una tonalidad oscura
set cmdheight=2 " Establece que la barra de estado sea de 2 cm
set colorcolumn=140 " Resalta la columna 140
set conceallevel=1 " Quita resaltado conceal 
set cursorcolumn " Resalta la columna en la que esta el cursor
set cursorline " Resalta la fila en la que esta el cursor
set encoding=UTF-8 " Establece la codificación de caracteres usada en vim
set expandtab " En el modo edición las tabulaciones son reemplazados por espacios
set fileformat=unix " Evita que se inserten símbolos extraños 
set fileencoding=utf-8
set foldcolumn=1 " Se esconderá el código con pliegues
set foldmethod=manual " Los pliegues se realizan en función del archivo
set hidden " Habilita características para mostrar/dividir/ocultar archivos
set history=1000 " Guarda los últimos 1000 comandos
set hlsearch " Resalta la palabra cuando se busca con '/' o '?'
set ignorecase " En la búsqueda con '/' o '?' no importan las mayúsculas y minúsculas
set incsearch " Habilitar búsqueda mientras escribes
set langmenu=es_ES.UTF-8 " Establece a vim en español
set laststatus=2 " La barra de estado se muestra siempre, indepeniente de la cantidad de ventanas
"set lazyredraw " Cuando vim carga algo grande no se muestra hasta que termine (ayuda con rendimiento)
set linebreak " En caso de que la línea sobrepase el límite, la línea se ajustará para que se vea
set magic " Resalta metacarácteres como '?', '+', '(', '[', '{', '\'
set mat=2 " Cuando se busca con '/' o '?' resaltará las coincidencias ('n'siguiente ; 'N' previo)
set nomodeline " Habilita interpretación de lineas de modelo
set mouse=a " El mouse puede usarse en modo normal, visual, inserción, comandos, copiar y pegar
set nobackup " Evita que se cree un archivo adicional *.[extensión]~
set nocompatible " Desactiva el modo compatibilidad con 'vi'
set noerrorbells " Desactiva los sonidos y parpadeos cuando hay errores
set nolist
set norelativenumber " En la línea dada se muestra la distancia que posee con las demás
set noswapfile " Para evitar crear archivos *.[extensión].swp
set novisualbell " Se evita mostrar un efecto visual (cuando hay errores)
set number " Enumera las líneas
set numberwidth=1 " Espacio de la enumeración
set ruler " Añade información de la línea y columna actual en la barra de estado
"set scrolloff=5 " Mantiene 5 líneas visibles tanto arriba como abajo de la línea actual
set shiftwidth=4 " Establece que la tecla shift haga 4 espacios
set showcmd " Muestra las teclas que se apretan cuando se escribe en modo normal
set showmatch " Cuando el cursor está en un paréntesis se resalta el que lo cierra
set showmode " Muestra el modo en el que se encuentra
set smartindent " Identado inteligente
set smarttab " Cuando se haga tabulación se ajustará con la tabulaciones hechas antes
set softtabstop=4 " Cuando se haga una tabulación se harán 4 espacios
set spell " Correcciones otrográficas que considere necesarias
set spelllang=es " Las correciones se harán en español
set splitbelow " Las nuevas ventanas se abren sobre la actual
set splitright " Las nuevas ventanas se abren a la derecha de la actual
set tabstop=4 " Tabulación de 4 espacios en modo inserción
set termguicolors " La terminal usará colores de alta calidad
set title " VIM actualiza automáticamente el título de la terminal con el nombre del archivo
set ttimeout " Habilia tiempo de espera máximo al hacer secuencia de comandos
set ttimeoutlen=1500 " Tiempo en milisegundos que espera un comando para hacer secuencias de teclas
set ttyfast " Mejora velocidad de respuesta en caso de demoras
set textwidth=500 " Establece el ancho máximo del texto en una línea antes de que se haga el ajuste automático
set undofile " Guarda cambios ilimitados en el historial de deshacer en un archivo
set undolevels=1000 " Los cambios que le sigan al cambio 1000 no serán guardados
set undoreload=10000 " Controla la frecuencia con la que se recarga el archivo de historial de deshacer
set wildmenu " Habilita menú de sugerencias en la línea de comandos
set whichwrap+=<,>,h,l " Configura que teclas permiten que se mueva el cursor cuando se llegue al borde
set wrap " Si el texto es muy largo, lo recoge para que se vea en la pantalla
set wrapmargin=100 " Margen dll

if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%W\ %t
endif 


filetype plugin on
filetype indent on

" Configuración de mapeos  <leader>

    let mapleader = ','


" Utilidades 

    " Tabulaciones hacia adelante en modo normal 
    nnoremap <M-Left> << 
    inoremap <M-Left> <C-c><<a

    " Tabulaciones hacia atrás en modo normal 
    nnoremap <M-Right> >>
    inoremap <M-Right> <C-c>>>a

    " Tabulación hacia adelante en modo visual 
    vnoremap <M-Left> <gv 

    " Tabulación hacia atrás en modo visual 
    vnoremap <M-Right> >gv

    " Intercambiar línea de arriba con la actual 
    nnoremap <M-Up> :m-2<CR>
    inoremap <M-Up> <C-c>:m-2<CR>a

    " Intercambiar línea de abajo con la actual 
    nnoremap <M-Down> :m+<CR>
    inoremap <M-Down> <C-c>:m+<CR>a

    " Moverse una línea hacia arriba sin mover el cursor 
    nnoremap <C-Up> <C-y>
    inoremap <C-Up> <C-c><C-y>a

    " Moverse una línea hacia abajo sin mover el cursor
    nnoremap <C-Down> <C-e>
    inoremap <C-Down> <C-c><C-e>a

    " Abrir el archivo en el último lugar de edición
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal!g'\"" | endif

    " Comportamiento al cambiar de buffer 
    try
        set switchbuf=useopen,usetab,newtab
        set stal=2
    catch
    endtry

    " Para moverse entre pestañas

        " Arriba

        nnoremap <Leader><Up> :wincmd k<CR>

        " Abajo

        nnoremap <Leader><Down> :wincmd j<CR>

        " Izquierda

        nnoremap <Leader><Left> :wincmd h<CR>

        " Derecha

        nnoremap <Leader><Right> :wincmd l<CR>

    " Selección con Shift

    inoremap <S-Up> <C-c>v<Up>
    nnoremap <S-Up> v<Up>
    vnoremap <S-Up> <Up>

    inoremap <S-Down> <C-c>v<Down>
    nnoremap <S-Down> v<Down>
    vnoremap <S-Down> <Down>

    inoremap <S-Left> <C-c>v<Left>
    nnoremap <S-Left> v<Left>
    vnoremap <S-Left> <Left>

    inoremap <S-Right> <C-c>v<Right>
    nnoremap <S-Right> v<Right>
    vnoremap <S-Right> <Right>

    " Deshabilitar corrector ortográfico en comentarios

    hi clear Spellbad

    hi SpellBad cterm=underline

    " GVIM

        " hi SpellBad gui=undercurl

    " Para deshacer última acción

    nnoremap <C-z> :undo<CR>
    inoremap <C-z> <C-O>:undo<CR>
    vnoremap <C-z> :undo<CR>

    " Paso inverso

    nnoremap <C-X> :redo<CR>
    inoremap <C-X> <C-o>:redo<CR>
    vnoremap <C-X> :redo<CR>

    " Reemplazos automáticos por errores frecuentes

    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev wQ wq
    cnoreabbrev Wq wq
    cnoreabbrev WQ wq
    cnoreabbrev qA qa
    cnoreabbrev Qa qa
    cnoreabbrev QA qa
    cnoreabbrev qA! qa!
    cnoreabbrev Qa! qa!
    cnoreabbrev QA! qa!
    cabbrev source source %
    cabbrev Source source %


    nnoremap <leader>k <C-c>"+y
    vnoremap <leader>k "+y


    nnoremap <leader>p "+p
    vnoremap <leader>p <C-c>"+pv
