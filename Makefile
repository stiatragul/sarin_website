
.PHONY: deploy
deploy: build upload

.PHONY: upload
upload:
	rclone sync public sarintiatragul:sarintiatragul/sarintiatragul.com --progress

.PHONY: build
build:
	hugo

.PHONY: serve
	hugo serve -DEF