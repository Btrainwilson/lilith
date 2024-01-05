if [[ ! -d "$HOME/.config" ]]; then
  echo "Making dotfiles directory"
  mkdir -p "$INSTALLDIR/.config"
fi

echo "Installing fish to $INSTALLDIR/.config/fish"
ln -sf "$SCRIPTDIR/dotfiles/fish" "$INSTALLDIR/.config"

echo "Installing nvim to $INSTALLDIR/.config/nvim"
ln -sf "$SCRIPTDIR/dotfiles/nvim" "$INSTALLDIR/.config"

echo "Installing i3 to $INSTALLDIR/.config/i3"
ln -sf "$SCRIPTDIR/dotfiles/i3" "$INSTALLDIR/.config"

echo "Installing tmux to $INSTALLDIR/.tmux.conf"
ln -sf "$SCRIPTDIR/dotfiles/tmux/.tmux.conf" "$INSTALLDIR"

echo "Installing bashrc to $INSTALLDIR/.bashrc"
cp -sf "$SCRIPTDIR/dotfiles/bash/.bashrc" "$INSTALLDIR"


for file in shell/*; do

    local resp
    if [ "$YESMODE" = false ]; then
      read -p "Install $file? (y/n) " resp
    else
      resp="y"
    fi

    if [ -z "$resp" ] || [ "$resp" = "y" ]; then
        filename=$(basename -- "$file")
        ln -sf "$SCRIPTDIR/$file" "$INSTALLDIR/.$filename"
        echo "Added .$filename to $INSTALLDIR/.bashrc"
        echo "source $INSTALLDIR/.$filename" >> "$INSTALLDIR/.bashrc"
    fi
done

local resp
if [ "$YESMODE" = false ]; then
  read -p "Install CodeNewRomanFont? (y/n) " resp
else
  resp="y"
fi

if [ -z "$resp" ] || [ "$resp" = "y" ]; then
  for file in fonts/*; do
      filename=$(basename -- "$file")
      ln -sf "$SCRIPTDIR/$file" "$INSTALLDIR/.local/share/fonts/$filename"
      echo "Added font $filename to $INSTALLDIR/.local/share/fonts"
  done
  sudo fc-cache -f -v
fi


