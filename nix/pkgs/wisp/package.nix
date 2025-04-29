{
  stdenv,
  lib,
  makeWrapper,
  quickshell,
}:
stdenv.mkDerivation {
  pname = "wisp";
  version = "0.0.1-unstable";

  src = ../../..;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    makeWrapper ${lib.getExe quickshell} "$out/bin/wisp" --add-flags "-p $src"

    runHook postInstall
  '';
}
