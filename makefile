bitmap_lib_dir=../pony.bitmap/lib
build_dir=./build
lib_dir=./lib

all: yoga pony run

yoga:
	cd ./libyoga && make

check:
	@mkdir -p $(build_dir)
	@mkdir -p $(lib_dir)

pony: check copy-libs
	corral run -- ponyc --extfun --print-code -p $(lib_dir) -o ./build/ ./yoga

copy-libs:
	@cp ./libyoga/build/osx/lib/libyoga.a $(lib_dir)/libyoga-osx.a
	@cp ./libyoga/build/ios/lib/libyoga.a $(lib_dir)/libyoga-ios.a
	@cp ${bitmap_lib_dir}/*.a ./lib/

clean:
	rm -rf $(build_dir)

run:
	./build/yoga

test: check-folders copy-libs
	corral run -- ponyc --extfun -V=0 -p $(lib_dir) -o ./build/ ./yoga
	./build/yoga





corral-fetch:
	@corral clean -q
	@corral fetch -q

corral-local:
	-@rm corral.json
	-@rm lock.json
	@corral init -q
	@corral add /Volumes/Development/Development/pony/pony.fileExt -q
	@corral add /Volumes/Development/Development/pony/pony.flow -q
	@corral add /Volumes/Development/Development/pony/pony.bitmap -q
	@corral add /Volumes/Development/Development/pony/pony.png -q

corral-git:
	-@rm corral.json
	-@rm lock.json
	@corral init -q
	@corral add github.com/KittyMac/pony.fileExt.git -q
	@corral add github.com/KittyMac/pony.flow.git -q
	@corral add github.com/KittyMac/pony.bitmap.git -q
	@corral add github.com/KittyMac/pony.png.git -q

ci: bitmap_lib_dir = ./_corral/github_com_KittyMac_pony_bitmap/lib/
ci: corral-git corral-fetch all
	
dev: corral-local corral-fetch all

