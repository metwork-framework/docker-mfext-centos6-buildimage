NAME=metwork/mfext-centos6-buildimage
VERSION=$(shell ./git_human_version.sh --just-branch)

build:
	docker build -f Dockerfile -t $(NAME):$(VERSION) .

release: build
	./release.sh $(NAME) $(VERSION)
