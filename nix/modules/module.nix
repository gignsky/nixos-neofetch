{ inputs, ... }:
{
  flake.nixosModules = {
    neofetch = import ../../configuration.nix;
    default = import ../../configuration.nix;
  };
}
