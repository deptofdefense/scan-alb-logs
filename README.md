# Scan ALB Logs

This repository is a set of scritps and binaries that makes scanning AWS Application Load Balancer (ALB) logs stored in
AWS S3 easier.

## Installation

Installation requires you have a few utilities already available. Use homebrew to install them for macOS.

```sh
brew install jq go gunzip
```

## Build the tools

Before using this tool build the tools:

```sh
make build
```

You must have `./bin` and `./scripts` on your `$PATH`. You can use [direnv](https://direnv.net/) to do so or you can manage it manually.

## Examples

Example with no date (uses current UTC date):

```sh
../scripts/scan-alb-logs bucket_name app-prod 403
```

Example for single code 504:

```sh
../scripts/scan-alb-logs bucket_name app-prod 504 2019/02/14,2019/02/16
```

Example with Pattern matching all 5XX codes:

```sh
 ../scripts/scan-alb-logs bucket_name app-prod "5" 2019/02/22
```

Example with Pattern matching all 5XX codes for a domain:

```sh
 ../scripts/scan-alb-logs bucket_name app-prod "5" 2019/02/22 example.com
```
