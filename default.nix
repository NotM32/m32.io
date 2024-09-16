{ pkgs ? (import <nixpkgs> { })}:
with pkgs;
mkDerivation {
  pname = "m32";
  buildInputs = "";
}
