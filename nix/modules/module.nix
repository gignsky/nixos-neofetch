{ inputs, config, lib, ... }:
{
  flake.nixosModules = {
    neofetch = {
      imports = [
        ../../config.nix
        ../../configuration.nix
        inputs.nixos-typovrak.nixosModules.variables
      ];
    };
  };
}
