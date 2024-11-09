install_nix () {
	sudo apt install -y nix
}

build () {
	nix build github:notm32/m32.io --out-link /result
}

install_nix
build
