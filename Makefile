VERSION = $(shell node -p -e "require('./package.json').version")
PUBLISHER = $(shell node -p -e "require('./package.json').publisher")
EXTENSION_NAME = $(shell node -p -e "require('./package.json').name")
FULL_NAME = $(PUBLISHER).$(EXTENSION_NAME)
EXTENSION_DIR := $(HOME)/.vscode/extensions

TARGET := $(EXTENSION_NAME)-$(VERSION).vsix

.PHONY: default
default: $(TARGET)

.PHONY: clean
clean:
	rm $(TARGET)

.PHONY: uninstall
uninstall:
	code --ununinstall-extension $(FULL_NAME)

.PHONY: install
install: $(TARGET) uninstall
	code --install-extension $<

.PHONY: publish
publish: $(TARGET)

$(TARGET):
	vsce package
