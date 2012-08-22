default: clean
	@echo "========>> PATCHING"
	@echo 
	@echo 
	cd ../frameworks/base/ && patch -p1 < ../../patchafari/patches/rocker/rocker_framework.diff
	cd ../packages/apps/Settings/ && patch -p1 < ../../../patchafari/patches/rocker/rocker_settings.diff
	
	@echo "========>> DONE"
	@echo

clean:
	@echo "========>> REVERTING..."
	@echo
	cd ../frameworks/base/ && git checkout core/java/android/provider/Settings.java policy/src/com/android/internal/policy/impl/PhoneWindowManager.java
	cd ../packages/apps/Settings/ && git checkout res/xml/sound_settings.xml src/com/android/settings/SoundSettings.java
