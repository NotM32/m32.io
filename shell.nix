{ pkgs ? (import <nixpkgs> {}), extraBuildInputs ? [] }:
with pkgs;
mkShell {
  buildInputs = [
    zola
    tailwindcss

    # Perl
    rlwrap
    perl
    perlPackages.CPAN
    perlPackages.PerlLanguageServer
    perlPackages.RESTClient
    perlPackages.JSON
    perlPackages.DataDumper

    # bash
    xq
  ] ++ extraBuildInputs;
}
