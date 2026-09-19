MYSQL_VERSION := 9.7.2

.PHONY: help
help:
	@echo "Makefile targets:"
	@echo "  all    - Build everything"
	@echo "  almalinux10 - Build for AlmaLinux 10"
	@echo "  rockylinux10 - Build for Rocky Linux 10"
	@echo "  amazonlinux2023 - Build for Amazon Linux 2023"

.PHONY: all
all: almalinux10 rockylinux10 amazonlinux2023

.PHONY: almalinux10
almalinux10:
	./build.sh almalinux10

.PHONY: rockylinux10
rockylinux10:
	./build.sh rockylinux10

.PHONY: amazonlinux2023
amazonlinux2023:
	./build.sh amazonlinux2023
