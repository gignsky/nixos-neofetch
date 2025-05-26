{ inputs, ... }:
{
  flake.nixosModules = {
    neofetch = {
      imports = [
        ../../configuration.nix
        inputs.nixos-typovrak.nixosModules.variables
      ];
    };
  };
}
