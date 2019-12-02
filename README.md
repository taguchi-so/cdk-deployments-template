# cdk-deployments-template

Template for injecting deploy code into the repository

## Prerequisites

node

```shell
nodenv install 12.12.0
nodenv local 12.12.0
npm install -g npm
```

cdk

```shell
npm install -g aws-cdk@1.18.0
cdk --version
```

git-secrets

```shell
brew install git-secrets
```

## Installing

- set up repository

```shell
git clone https://github.com/taguchi-so/cdk-deployments-template.git
cd cdk-deployments-template
make setup
make help
```

## Edit　Files for My Reposoitory

- makefile

```Makefile
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
```

- cdk code
  - deployments/cdk/package.json(このリポジトリ用のCDKコードで使用するライブラリを追加)
  - deployments/cdk/lib/cdk-stack.ts(このリポジトリ用のCDKコードを記述)
  - deployments/cdk/test/cdk.test.ts(テスト)
	- cdk.json(各環境のコンフィグ)

## Deployment(CDK)

- set environments

```shell
export CDK_DEFAULT_ACCOUNT="999999999999"
export CDK_DEFAULT_REGION="ap-northeast-1"
```

- release: fmt lint test build

```shell
make release
```

- deploy

```shell
make deploy APP_ENV=dev
```

- destroy

```shell
make destroy APP_ENV=dev
```
