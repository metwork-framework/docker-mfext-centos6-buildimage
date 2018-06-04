NAME=metwork/mfext-centos6-buildimage
VERSION=$(shell ./git_human_version.sh --just-branch)

build:
	docker build -f Dockerfile -t $(NAME):$(VERSION) .

release: build
	if test "${DOCKER_PASSWORD}" != ""; then docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"; docker push $(NAME):$(VERSION); fi
