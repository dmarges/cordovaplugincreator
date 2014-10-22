#Cordova Plugin Creator

###Author: Don Marges

###License: MIT

###Description:
I created this gem because creating Cordova Plugins from scratch can be kind of a pain since it's easy to
forget a config option or leave something out. This gem creates the structure and all files needed to start developing
a plugin for Cordova. Right now it's for iOS and Android only and doesn't create the scaffolding needed for other platforms
such as Windows Phone and BlackBerry but could be added in the future.

###Installation:

From your prompt just type "gem install cordovaplugincreator"


###Arguments:
-n = Name - Name of your plugin                                     *required
-p = Path - Path where your plugin will reside                      *required
-b = Bundle ID - The "com.yourcompany" used in the config files     *optional
-v --verbose = Verbose - Used for debugging                         *optional


###Usage:

From your prompt you can run "cordovaplugincreator -n nameofyourplugin -p /path/for/your/plugin -b com.yourcompany



