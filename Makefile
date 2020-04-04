TOOLBOX_IMAGE ?= aroq/toolbox:0.3.1

# If the first argument is "toolbox"...
ifeq (toolbox,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "toolbox"
  TOOLBOX_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(TOOLBOX_ARGS):;@:)
endif

.PHONY: toolbox
toolbox:
	docker run --rm -it -v "$$(pwd)":"$$(pwd)" -w "$$(pwd)" $(TOOLBOX_IMAGE) toolbox $(TOOLBOX_ARGS)

