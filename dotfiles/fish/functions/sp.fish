function sp --wraps='sudo pacman -S' --description 'alias sp=sudo pacman -S'
  sudo pacman -S $argv
        
end
