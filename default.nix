{ self ? { }, pkgs ? (import <nixpkgs> { }), extraBuildInputs ? [], ... }:
with pkgs;
let
  pname = "m32-io-static";
in stdenv.mkDerivation rec {
  inherit pname;
  version = "${self.short-rev or self.dirtyShortRev or "dev"}";
  src = self;

  doCheck = true;

  phases = [ "buildPhase" "installPhase" ];

  buildInputs = [
    zola
    tailwindcss

    # Perl
    rlwrap
    perl
    perlPackages.GitRepository
    perlPackages.Git
    perlPackages.CPAN
    perlPackages.PerlLanguageServer
    perlPackages.RESTClient
    perlPackages.YAML
    perlPackages.DataDumper

    # bash
    xq
    tree
    git
  ] ++ extraBuildInputs;

  buildPhase = ''
             # export PATH="${pkgs.lib.makeBinPath buildInputs}"
             cd $src
             zola build --output-dir $out
	           tailwindcss -i sass/style.scss -o $out/styles/main.css
  '';

  installPhase = ''
               mkdir -p $out
               cp -r ./public/* $out
  '';
}
