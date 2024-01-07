CURRENT_DIR = $(shell pwd)

demo: ## run a demo with specified number
	devcontainer up --workspace-folder $(CURRENT_DIR)/demo-$(NUM) ; \
	devcontainer open $(CURRENT_DIR)/demo-$(NUM)
