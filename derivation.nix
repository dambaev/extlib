{ stdenv, pkgs, fetchzip, fetchpatch, fetchgit, fetchurl }:
stdenv.mkDerivation {
  name = "extlib";

  src = ./.;
  buildInputs = with pkgs;
  [ ats2
    which
  ];
}
