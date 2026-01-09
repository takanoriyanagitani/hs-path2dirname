iwasi=./hs-path2dirname.wasm

wasm-opt \
	-Oz \
	-o opt.wasm \
	--enable-bulk-memory \
	--enable-nontrapping-float-to-int \
	"${iwasi}"
