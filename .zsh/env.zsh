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
