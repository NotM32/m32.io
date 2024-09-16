{
  description = "static personal website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];

      imports = [ ];

      perSystem = { pkgs, self', ... }: {
        devShells = {
          default = pkgs.mkShell {

          };
        }
        packages = {
          website = pkgs.callPackage ./default.nix { inherit pkgs; };
        };
      };

      flake = {
      };

    };

  nixConfig = {
    extra-experimental-features = "nix-command flakes recursive-nix";
  };

}
