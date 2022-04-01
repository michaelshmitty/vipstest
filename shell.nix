let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby_3_1
  ];

  shellHook = ''
    export GEM_HOME="$PWD/vendor/bundle/$(ruby -e 'puts RUBY_VERSION')"
    export PATH="$GEM_HOME/bin:$PATH"
  '';
}
