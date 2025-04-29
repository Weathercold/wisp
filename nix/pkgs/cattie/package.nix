{
  stdenvNoCC,
  lib,
  fetchurl,
}:
stdenvNoCC.mkDerivation {
  pname = "cattie";
  version = "2023-02-20";

  src = fetchurl {
    url = "https://dl.dafont.com/dl/?f=cattie_2";
    hash = "sha256-zXEz67oLHoI5kJtlLSsshqMKokEWrkkwD216xdhTpM4=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 "$src" "$out/share/fonts/truetype/Cattie-Regular.ttf"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Stylish and cute decorative font";
    # Non-commercial, non redistributable, no derivatives
    # license = licenses.unfree;
    maintainers = with maintainers; [ weathercold ];
    platforms = platforms.all;
  };
}
