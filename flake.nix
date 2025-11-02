{
  description = "hyprcorners";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    overlay = final: prev: {
      sidewinderd = self.packages.${system}.sidewinderd;
    };
  in {
    packages.${system} = rec {
      hyprcorners = pkgs.callPackage ./default.nix {};
      default = hyprcorners;
    };

    overlays.default = overlay;

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [pkgs.rustup pkgs.cargo pkgs.git];
      shellHook = ''
        echo "Rust dev shell ready!"
      '';
    };
  };
}
