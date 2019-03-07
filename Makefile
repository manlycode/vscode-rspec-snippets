VERSION = $(shell node -p -e "require('./package.json').version")
TARGET := rspec-snippets-doublequotes-$(VERSION).vsix
EXTENSION_DIR := $(HOME)/.vscode/extensions

.PHONY: default
default: $(TARGET)

.PHONY: clean
clean:
	rm $(TARGET)

.PHONY: install
install:
	cp $(TARGET) $(EXTENSION_DIR)

.PHONY: publish
publish: $(TARGET)


$(TARGET):
	vsce package