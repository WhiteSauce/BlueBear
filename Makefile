export ARCHS = armv7 arm64
export TARGET = iphone:clang:8.1:8.1

include theos/makefiles/common.mk

TWEAK_NAME = bluebear
bluebear_FILES = Tweak.xm
bluebear_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += bluebear
include $(THEOS_MAKE_PATH)/aggregate.mk
