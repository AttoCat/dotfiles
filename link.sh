#!bin/fish
set BASEDIR $HOME/dotfiles
cd $BASEDIR
echo $BASEDIR
echo "---Link some dotfiles---"

if [ ! -e "$HOME/dotfiles-backup" ]
    echo "dotfiles-backup does not exist, create..."
else
    rm -r $HOME/dotfiles-backup
end
mkdir $HOME/dotfiles-backup

#Global link
for f in .??*;
    echo "$f"
    [ "$f" = ".gitignore" ]; and continue
    [ "$f" = ".git" ]; and continue
    if [ -e "$HOME/$f" ]
        echo "$f is already created, move..."
        mv -f "$HOME/$f" "$HOME/dotfiles-backup"
    end
    ln -snfv $BASEDIR/$f $HOME/$f
end

#Mac link
if [ $(uname) = Darwin ]
    if [ ! -e "$HOME/.ssh" ]
        mkdir $HOME/.ssh
    end
    if [ ! -e "$HOME/.ssh/config" ]
        mv -f "$HOME/.ssh/config" "$HOME/dotfiles-backup"
    end
    ln -snfv $BASEDIR/Mac/.ssh/config $HOME/.ssh/config

    ln -snfv $BASEDIR/Mac/karabiner $HOME/.config/karabiner
    ln -snfv $BASEDIR/Mac/raycast $HOME/.config/raycast
end


cd $HOME
