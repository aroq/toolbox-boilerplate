TOOLBOX_IMAGE ?= aroq/toolbox:0.2.6

.PHONY: toolbox/%
toolbox/%:
	docker run --rm -it -v "$$(pwd)":"$$(pwd)" -w "$$(pwd)" $(TOOLBOX_IMAGE) $*
