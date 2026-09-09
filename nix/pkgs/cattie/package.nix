{
  stdenvNoCC,
  lib,
  fetchzip,
  installFonts,
  unzip,
}:
stdenvNoCC.mkDerivation {
  pname = "cattie";
  version = "2023-02-20";

  src = fetchzip {
    url = "https://dl.dafont.com/dl/?f=cattie_2";
    extension = "zip";
    stripRoot = false; # Expect flat list of files
    hash = "sha256-lINFbx42BqUqY1/1NUhtUAZpCArCCFwMX8d8kjMut7o=";
  };

  nativeBuildInputs = [ installFonts ];

  meta = with lib; {
    description = "Stylish and cute decorative font";
    # Non-commercial, non redistributable, no derivatives
    # license = licenses.unfree;
    maintainers = with maintainers; [ weathercold ];
    platforms = platforms.all;
  };
}
