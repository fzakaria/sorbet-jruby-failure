let
  pkgs =
    import <nixpkgs> {};

in with pkgs;
mkShell {
  name = "warbler-shell";
  buildInputs = [jruby];
}