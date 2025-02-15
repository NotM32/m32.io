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
        packages = with pkgs; rec {
          # * The static website files as a package
          static = stdenv.mkDerivation rec {
            pname = "m32.io-static";
            version = "${self.shortRev or self.dirtyShortRev}";
            src = self;

            buildInputs = with pkgs; [
              zola
              tailwindcss

              # Perl
              perl
              perlPackages.GitRepository
              perlPackages.Git
              git
              perlPackages.CPAN
              perlPackages.RESTClient
              perlPackages.YAML
              perlPackages.DataDumper
            ];

            phases = [ "unpackPhase" "configurePhase" "buildPhase" "installPhase" ];

            configurePhase = ''
              export PATH="$PATH:${pkgs.lib.makeBinPath buildInputs}"

              cp ${self'.packages.data-file} .nix-data.json
            '';

            buildPhase = ''
              	           tailwindcss -i sass/style.scss -o static/styles/main.css
                           zola build
            '';

            installPhase = ''
              mkdir -p $out
              cp -r ./public/* $out
            '';
          };

          data-file = writeText "nix-data.json"
            (builtins.toJSON { inherit (self.sourceInfo) lastModified lastModifiedDate;
                               rev = self.sourceInfo.rev or self.sourceInfo.dirtyRev;
                               shortRev = self.sourceInfo.shortRev or self.sourceInfo.dirtyShortRev;
                             });

          dev-server = writeShellScript "dev-server"
            ''
              #!/bin/sh
              fetch_data () {
                         cp $(${pkgs.nix}/bin/nix build .#data-file --no-link --print-out-paths) $PWD/.nix-data.json
              }

              cleanup () {
                      local pids=$(jobs -pr)
                      [ -n $pids ] && kill $pids
              }

              echo "Building and linking nix data file"
              fetch_data

              echo "Starting Tailwind watch process"
	            ${pkgs.tailwindcss}/bin/tailwindcss -i sass/style.scss -o static/styles/main.css --watch &
              sleep 2

              echo "Starting Zola watch process"
              ${pkgs.zola}/bin/zola serve &

              while true; do
                    fetch_data
                    sleep 10
              done;

              trap "cleanup" SIGINT SIGTERM EXIT
            '';

          default = static;
        };

        apps.default = {
          type = "app";
          program = "${self'.packages.dev-server}";
        };

        devShells.default = with pkgs;
          mkShell {
            nativeBuildInputs = [
              rlwrap
              perlPackages.PerlLanguageServer

              xq
              tree
              git
            ] ++ self'.packages.static.buildInputs;
          };
      };
    };

  nixConfig = {
    extra-experimental-features = "nix-command flakes recursive-nix";
  };

}
