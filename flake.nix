{
  description = "static personal website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];

      systems = [ "x86_64-linux" "aarch64-linux" ];
      perSystem = { pkgs, self', ... }: {
        devShells = {
          default = (import ./shell.nix) {
            inherit pkgs;
            extraBuildInputs = [];
          };
        };
      };

      flake = {
      };

    };

  nixConfig = {
    extra-experimental-features = "nix-command flakes recursive-nix";
  };

}
