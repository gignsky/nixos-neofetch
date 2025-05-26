{ config, pkgs, lib, ... }:

let
  username = config.username;
  group = config.users.users.${username}.group or "users";
  home = config.users.users.${username}.home;
in
{
  options.username = lib.mkOption {
    type = lib.types.str;
    description = "The username for which to install Neofetch config.";
    example = "alice";
  };

  config = {
    assertions = [
      {
        assertion = config ? username && config.users.users ? ${username};
        message = "You must set 'username' and define users.users.${username} in your configuration.";
      }
    ];
  };

  system.activationScripts.neofetch = ''
    		mkdir -p ${home}/.config
    		chown ${username}:${group} ${home}/.config
    		chmod 700 ${home}/.config

    		rm -rf ${home}/.config/neofetch
    		mkdir ${home}/.config/neofetch
    		chown ${username}:${group} ${home}/.config/neofetch
    		chmod 700 ${home}/.config/neofetch

    		cp ${./config.conf} ${home}/.config/neofetch/config.conf
    		chown ${username}:${group} ${home}/.config/neofetch/config.conf
    		chmod 600 ${home}/.config/neofetch/config.conf
    	'';

  environment.systemPackages = with pkgs; [
    neofetch
  ];
}
