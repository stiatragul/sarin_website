
.PHONY: deploy
deploy: build upload

.PHONY: upload
upload:
	rclone sync public sarintiatragul:sarintiatragul/sarintiatragul.com --progress
	# On Laptop use b2  or check rclone config
	# rclone sync public b2:sarintiatragul/sarintiatragul.com --progress

.PHONY: build
build:
	hugo

.PHONY: serve
	hugo serve -DEF