# My VIM Configurations
My custom configuration for gVIM and VIM.

## Usage

### Clone the repo.
   
  git://github.com/aslamnd/my-vim-config.git ~/.vim

### Symlink the .vimrc and .gvimrc files

  ln -nfs ~/.vimrc /.vim/vimrc
   
  ln -nfs ~/.gvimrc /.vim/gvimrc

That's it!

## Update plugins

  cd ~/.vim

  git submodule init
  git submodule update
   
