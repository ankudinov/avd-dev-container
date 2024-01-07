CURRENT_DIR = $(shell pwd)

demo: ## run a demo with specified number by using `make DEMO=01` for ex
	devcontainer up --workspace-folder $(CURRENT_DIR)/demo-$(DEMO) ; \
	devcontainer open $(CURRENT_DIR)/demo-$(DEMO)
