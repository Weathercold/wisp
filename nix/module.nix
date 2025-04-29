{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf mkDefault;
  cfg = config.programs.wisp;
in

{
  options.programs.wisp.enable = mkEnableOption "one of the shells of all time";

  config = mkIf cfg.enable {
    services.power-profiles-daemon.enable = mkDefault true;
    fonts.packages = with pkgs; [
      cattie
      material-symbols
      playpen-sans
    ];
    environment.systemPackages = with pkgs; [ wisp ];
  };
}
