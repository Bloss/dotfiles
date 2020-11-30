# mysql env
if [ -z "$MYSQL" ]; then
	MYSQL=/usr/local/mysql/bin
	export PATH=${PATH}:$MYSQL
fi

# maven env
if [ -z "$M2_HOME" ]; then
	M2_HOME=$HOME/tools/apache-maven-3.5.2/bin
	export PATH=${PATH}:$M2_HOME
fi

# android env
if [ -z "$ANDROID_HOME" ]; then
	ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi

# ak env
if [ -z "$AK_HOME" ]; then
    AK_HOME=$HOME/tools/pha-all/arcanist/bin/
    export PATH=${PATH}:$AK_HOME
fi

# subl env
if [ -z "$SUBL_HOME" ]; then
    SUBL_HOME=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/
    export PATH=${PATH}:$SUBL_HOME
fi

# rustup env
if [ -z "$CARGO_HOME" ];then
    CARGO_HOME=$HOME/.cargo
    export PATH=${PATH}:$CARGO_HOME/bin
fi

# # ghcup env
# if [ -z "$GHCUP_HOME" ];then
#     GHCUP_HOME=$HOME/.ghcup
#     export PATH=${PATH}:$GHCUP_HOME/bin
# fi

export PATH=${PATH}:$HOME/bin

# nvm env
# export NVM_DIR="$HOME/.nvm" 
# . "/usr/local/opt/nvm/nvm.sh"
