# Option
#===============================================================
OS                   := $(shell uname | tr A-Z a-z )
SHELL                := /bin/bash
APP_ENV              := dev
STACK_NAME           := $(shell basename $$(realpath "./"))

# Const
#===============================================================
name                 := $(shell basename $$(realpath "./"))
bin_dir              := bin
cdk_dir              := deployments/cdk

include $(cdk_dir)/Makefile

# Task
#===============================================================

# 必要なツール類をセットアップします
setup:
ifeq ($(shell command -v make2help 2> /dev/null),)
	go get -u github.com/Songmu/make2help/cmd/make2help
endif
	git secrets --register-aws
	@cd $(cdk_dir) && $(MAKE) cdk-setup

## 全てのソースの整形を行います
fmt:
	@echo "TODO: added formatter"

## 全てのソースのLINTを実行します
lint:
	@echo "TODO: added linter"

## ユニットテストを実行します
test:
	@echo "TODO: added test"

## ビルドを実行します
build:
	@echo "TODO: added build"

## リリースビルドを実行します
release: fmt lint test build

## デプロイします
deploy: release
	@$(MAKE) cdk-deploy APP_ENV=$(APP_ENV)

## デプロイした環境を破棄します
destroy:
	@$(MAKE) cdk-destroy APP_ENV=$(APP_ENV)

## ヘルプ
help:
	@make2help $(MAKEFILE_LIST)

.PHONY: setup release deploy destroy help
.DEFAULT_GOAL := release
