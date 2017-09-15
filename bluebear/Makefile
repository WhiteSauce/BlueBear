include theos/makefiles/common.mk

BUNDLE_NAME = bluebear
bluebear_FILES = bluebear.mm
bluebear_INSTALL_PATH = /Library/PreferenceBundles
bluebear_FRAMEWORKS = UIKit
bluebear_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bluebear.plist$(ECHO_END)
