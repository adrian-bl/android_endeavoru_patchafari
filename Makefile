default: tidy
	@echo "========>> PATCHING"
	@echo 
	@echo 
	cd ../frameworks/base/ && patch -p1 < ../../patchafari/patches/rocker/10_rocker_framework.diff
	cd ../packages/apps/Settings/ && patch -p1 < ../../../patchafari/patches/rocker/20_rocker_settings.diff

	cd ../frameworks/base/ && patch -p1 < ../../patchafari/patches/rotation/10_frameworks_base.diff
	cd ../packages/apps/Settings/ && patch -p1 < ../../../patchafari/patches/rotation/20_apps_settings.diff
	
	@echo "========>> DONE"
	@echo

tidy:
	@echo "========>> REVERTING..."
	@echo
	cd ../frameworks/base/ && git checkout core/java/android/provider/Settings.java policy/src/com/android/internal/policy/impl/PhoneWindowManager.java
	cd ../packages/apps/Settings/ && git checkout res/xml/sound_settings.xml src/com/android/settings/SoundSettings.java res/xml/display_settings.xml src/com/android/settings/DisplaySettings.java

clean: tidy
	(cd .. && repo status )
