include theos/makefiles/common.mk

BUNDLE_NAME = LowPowerFlipswitch
LowPowerFlipswitch_FILES = Switch.xm
LowPowerFlipswitch_FRAMEWORKS = UIKit
LowPowerFlipswitch_PRIVATE_FRAMEWORKS = CoreDuet
LowPowerFlipswitch_LIBRARIES = flipswitch
LowPowerFlipswitch_INSTALL_PATH = /Library/Switches

include theos/makefiles/bundle.mk

# internal-stage::
#     #PreferenceLoader plist
#     $(ECHO_NOTHING)if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LowPowerFlipswitch; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LowPowerFlipswitch/; fi$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
