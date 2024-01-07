CURRENT_DIR = $(shell pwd)

demo: ## run a demo with specified number by using `make demo=01` for ex
	devcontainer up --workspace-folder $(CURRENT_DIR)/demo-$(demo) ; \
	devcontainer open $(CURRENT_DIR)/demo-$(demo)
