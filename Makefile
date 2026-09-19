MYSQL_VERSION := 9.7.2

.PHONY: help
help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: almalinux10 almalinux9 almalinux8 rockylinux10 rockylinux9 amazonlinux2023

.PHONY: almalinux10
almalinux10: ## Build for AlmaLinux 10
	./build.sh almalinux10

.PHONY: almalinux9
almalinux9: ## Build for AlmaLinux 9
	./build.sh almalinux9

.PHONY: almalinux8
almalinux8: ## Build for AlmaLinux 8
	./build.sh almalinux8

.PHONY: rockylinux10
rockylinux10: ## Build for Rocky Linux 10
	./build.sh rockylinux10

.PHONY: rockylinux9
rockylinux9: ## Build for Rocky Linux 9
	./build.sh rockylinux9

.PHONY: rockylinux8
rockylinux8: ## Build for Rocky Linux 8
	./build.sh rockylinux8

.PHONY: amazonlinux2027
amazonlinux2027: ## Build for Amazon Linux 2027
	./build.sh amazonlinux2027

.PHONY: amazonlinux2023
amazonlinux2023: ## Build for Amazon Linux 2023
	./build.sh amazonlinux2023
