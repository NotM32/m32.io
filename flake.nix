{
  description = "m32's static personal website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];

      perSystem = { pkgs, self', ... }: {
        devShells = {
          default = (import ./shell.nix) {
            inherit pkgs;
            extraBuildInputs = [];
          };
        };

        packages = rec {
          static = pkgs.callPackage ./default.nix {
            inherit self pkgs;
          };

          default = static;
        };
      };
    };

  nixConfig = {
    extra-experimental-features = "nix-command flakes recursive-nix";
  };

}
