{ inputs, config, lib, ... }:
{
  flake.nixosModules = {
    neofetch = {
      imports = [
        ../../config-maker.nix
        ../../configuration.nix
        inputs.nixos-typovrak.nixosModules.variables
      ];
    };
  };
}
