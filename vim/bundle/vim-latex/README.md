vim-latex
=========

Mirror of vim-latex from Sourceforge (http://sourceforge.net/projects/vim-latex/files/snapshots/)

Homepage: http://vim-latex.sourceforge.net/index.php?subject=manual&title=Manual#user-manual

Current Version: vim-latex-1.8.23-20130116.788-git2ef9956.tar.gz (287.7 kB)


Installation Instructions (The old school way)
----------------------------------------------
#### Step 1 of 4: Download and extract the archives (Modern way)

*  [Pathogen][1]
  *  `git clone https://github.com/Maxlufs/vim-latex ~/.vim/bundle/vim-latex`
*  [NeoBundle][2]
  *  `NeoBundle 'Maxlufs/vim-latex'`
*  [Vundle][3]
  *  `Bundle 'Maxlufs/vim-latex'`
*  [VAM][4]
  *  `call vam#ActivateAddons([ 'vim-latex' ])`
*  manual
  *  See the old school way

##### (The old school way)
Extract one of the archives into your ~/vimfiles directory (if you are using windows) or ~/.vim directory (if you are using *nix).

If you are updating after a long time, it might be a good idea to remove the ~/vimfiles/ftplugin/latex-suite directory from previous installations before reinstalling.

NOTE: If you already have some latex ftplugin files, read the Advanced Installation Instructions (http://vim-latex.sourceforge.net/index.php?subject=download&title=Download#advanced) to make sure you do not over-write any of your files.

#### Step 2 of 4: Set a few things in .vimrc

    " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
    filetype plugin on
    
    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash
    
    " IMPORTANT: grep will sometimes skip displaying the file name if you
    " search in a singe file. This will confuse Latex-Suite. Set your grep
    " program to always generate a file-name.
    set grepprg=grep\ -nH\ $*
    
    " OPTIONAL: This enables automatic indentation as you type.
    filetype indent on
    
    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'

In addition, the following settings could go in your ~/.vim/ftplugin/tex.vim file: 

    " this is mostly a matter of taste. but LaTeX looks good with just a bit
    " of indentation.
    set sw=2
    " TIP: if you write your \label's as \label{fig:something}, then if you
    " type in \ref{fig: and press <C-n> you will automatically cycle through
    " all the figure labels. Very useful!
    set iskeyword+=:
    
#### Step 3 of 4: Install the help files
To install the included latex-suite.txt and latexhelp.txt files as vim help files, start vim and do the following:

* [Pathogen][1]
  *  `:Helptags`

* manual
  *  `:helptags ~/.vim/doc         (for *nix users)`
  *  `"helptags ~/vimfiles/doc     (for windows users)`

#### Step 4 of 4: Done!
Thats it! You are done! Now start editing a latex file in vim. Latex-Suite should start up automatically. You can do

    :help latex-suite.txt

from within vim to get the online Latex-Suite reference. 


[1]: https://github.com/tpope/vim-pathogen
[2]: https://github.com/Shougo/neobundle.vim
[3]: https://github.com/gmarik/vundle
[4]: https://github.com/MarcWeber/vim-addon-manager
