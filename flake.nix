{
  description = "Weathercold's Desktop Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qml-niri = {
      url = "github:imiric/qml-niri";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        quickshell.follows = "quickshell";
      };
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      flake = {
        overlays = {
          default = self.overlays.wisp;
          wisp = final: _prev: {
            wisp = final.callPackage ./nix/pkgs/wisp/package.nix {
              inherit (inputs.qml-niri.packages.${final.stdenv.hostPlatform.system}) quickshell;
            };
            cattie = final.callPackage ./nix/pkgs/cattie/package.nix { };
            playpen-sans = final.callPackage ./nix/pkgs/playpen-sans/package.nix { };
          };
        };

        nixosModules = {
          default = self.nixosModules.wisp;
          wisp = ./nix/module.nix;
        };
      };

      perSystem =
        {
          self',
          inputs',
          pkgs,
          ...
        }:
        let
          pkgsExt = pkgs.extend self.overlays.wisp;
        in
        {
          packages = {
            default = self'.packages.wisp;
            inherit (pkgsExt) wisp cattie playpen-sans;
          };

          formatter = pkgs.nixfmt-rfc-style;

          devShells = {
            default = self'.devShells.wisp;
            wisp = pkgs.mkShell {
              buildInputs = with pkgs; [
                matugen
                nixd
                nixfmt-rfc-style
                nodejs # For building code blocks parsers
                kdePackages.qtdeclarative # For qmlls
                inputs'.qml-niri.packages.quickshell
                self'.packages.wisp
              ];

              inputsFrom = [ self'.packages.wisp ];

              shellHook = ''
                # Export Qt environment variables
                eval "$(
                  printf '%s ' "''${qtWrapperArgs[@]}" \
                  | sed -E 's/--prefix (\S+) : (\S+)/export \1="\2:$\1"/g'
                )"
                # qmlls needs QML2_IMPORT_PATH
                export QML2_IMPORT_PATH="$NIXPKGS_QT6_QML_IMPORT_PATH"
                export NIXPKGS_ALLOW_UNFREE=1
              '';
            };
          };
        };
    };
}
