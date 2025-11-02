{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,
  ...
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "hyprcorners";
  version = "0.1.0";

  # GitHub-Repo
  src = pkgs.fetchFromGitHub {
    owner = "ArnoDarkrose";
    repo = "hyprcorners";
    rev = "97c9b78243f0d8716bb93d390cad46611a3eb32a";
    sha256 = "sha256-Wk5lAMmb+caXo8mZTApOpuQia0zEVuZOrhGdL8rUrpQ="; # Hier nix-hash eintragen
  };

  cargoHash = "sha256-zQbd1j77kbE+ZJTx7HfnESLrKOy7JVtRYuUSv8iyT7w=";

  meta = with pkgs.lib; {
    description = "My Rust binary from GitHub";
    license = licenses.mit;
    maintainers = ["Paulemeister"];
  };
}
