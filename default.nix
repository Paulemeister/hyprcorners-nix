{
  pkgs ? import <nixpkgs> {},
  lib,
}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "hyprcorners";
  version = "0.1.0";

  # GitHub-Repo
  src = pkgs.fetchFromGitHub {
    owner = "ArnoDarkrose";
    repo = "hyprcorners";
    rev = "0.1.0"; # Commit, Tag oder Branch
    sha256 = "sha256-IF8RmE29r8q758km7k+4Z/6rhjlr8ll88wYLyBXmfWA="; # Hier nix-hash eintragen
  };

  cargoHash = "sha256-92L4qaAvy5F93UabbgPv+qAvx+WxOdEhcP1WXAYAEvI=";

  # Installiere die Binary systemweit
  installPhase = ''
    mkdir -p $out/bin
    cp target/x86_64-unknown-linux-gnu/release/hot-corners $out/bin/hyprcorners
  '';

  meta = with pkgs.lib; {
    description = "My Rust binary from GitHub";
    license = licenses.mit;
    maintainers = with maintainers; ["Paulemeister"];
  };
}
