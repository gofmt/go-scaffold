VERSION := $(shell cat ./VERSION)

install:
	go get github.com/goreleaser/goreleaser

image:
	docker build -t go-build .

# test:
# 	cd ./lib && go test -v

# fmt:
# 	go fmt
# 	cd ./lib && go fmt


release:
	git tag -a $(VERSION) -m "$(VERSION) Release" || true
	git push origin $(VERSION)
	# goreleaser --rm-dist

# .PHONY: install test image fmt release
.PHONY: install image release