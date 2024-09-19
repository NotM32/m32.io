{ pkgs ? (import <nixpkgs> {}), extraBuildInputs ? [] }:
with pkgs;
mkShell {
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
  ] ++ extraBuildInputs;
}
