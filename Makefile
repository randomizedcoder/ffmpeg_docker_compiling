VERSION_FILE := $(shell cat VERSION)

local_builddocker_ffmpeg_builder:
	docker buildx build --build-arg GOPRIVATE --file build/containers/ffmpeg/builder/Dockerfile . --tag "siden-ffmpeg-builder:${VERSION_FILE}" --tag siden-ffmpeg-builder:latest

local_builddocker_ffmpeg_compiler:
	docker buildx build --build-arg GOPRIVATE --build-arg VERSION_FILE=${VERSION_FILE} --file build/containers/ffmpeg/compiler/Dockerfile . --tag "siden-ffmpeg-compiler:${VERSION_FILE}" --tag siden-ffmpeg-compiler:latest