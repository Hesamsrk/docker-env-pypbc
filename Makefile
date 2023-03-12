#!make

tag=py-pbc


mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))


build:
	docker build --tag $(tag) --file dockerfile .

run:
	docker run --volume "$(mkfile_dir)dev:/app/dev"  --name $(tag)_container --rm -it  $(tag)

br:
	make build && make run

rm:
	docker rm -f $(tag)_container

pwd:
	echo $(mkfile_dir)/dev:/app/dev