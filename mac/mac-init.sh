if ! type -t brew ; then
    echo "---Install and update Homebrew---"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "---Installed!!---"
else
    echo "---Homebrew is already installed, update...---"
fi
brew update > /dev/null
echo "---Install some packages with HomeBrew---"
brew bundle > /dev/null 2>&1
echo "---Installed!---"
echo "---Restore config of software---"
defaults import com.codefalling.MacGesture ./Mac/macgesture-backup.plist
defaults import org.p0deje.Maccy ./Mac/macgesture-backup.plist
echo "---Restored!---"