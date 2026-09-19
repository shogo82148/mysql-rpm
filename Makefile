MYSQL_VERSION := 9.7.2

.PHONY: help
help:
	@echo "Makefile targets:"
	@echo "  all    - Build everything"
	@echo "  almalinux10 - Build for AlmaLinux 10"

.PHONY: all
all:

.PHONY: almalinux10
almalinux10:
	./build.sh almalinux10
