{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation {
  pname = "playpen-sans";
  version = "2.000";

  src = fetchFromGitHub {
    owner = "google";
    repo = "fonts";
    sparseCheckout = [ "ofl/playpensans/PlaypenSans[wght].ttf" ];
    rev = "1aeb8cfe2bc6b5898a3df72e17d5c9580387857b";
    hash = "sha256-ep9v/DcVtIfwWajFXEJvhQt/Zyx4nS1g/JXRaMLOlNI=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 "$src/ofl/playpensans/PlaypenSans[wght].ttf" "$out/share/fonts/truetype/PlaypenSans.ttf"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Casual handwriting font";
    longDescription = ''
      Playpen Sans has seven versions of each casual character, a built-in
      shuffler so no single shape is repeated in close proximity, and emojis.
      The result is text with spontaneous inconsistencies that feel fun and
      organic.
    '';
    license = licenses.ofl;
    maintainers = with maintainers; [ weathercold ];
    platforms = platforms.all;
  };
}
