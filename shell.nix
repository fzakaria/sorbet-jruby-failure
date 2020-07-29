{ pkgs ? import <nixpkgs> { } }:
with pkgs;
with stdenv;
with stdenv.lib;
let
  jruby-9_2_9_0 = jruby.overrideAttrs (oldAtrrs: rec {
    version = "9.2.9.0";
    src = fetchurl {
      url =
        "https://s3.amazonaws.com/jruby.org/downloads/${version}/jruby-bin-${version}.tar.gz";
      sha256 = "04grdf57c1dgragm17yyjk69ak8mwiwfc1vjzskzcaag3fwgplyf";
    };
  });
in mkShell {
  name = "warbler-shell";

  buildInputs = [
    jruby-9_2_9_0
    openjdk8_headless
  ];

  # we need a CA file otherwise HTTPS or git over TLS won't work
  SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";
  # Looker expects this as the default encoding otherwise does not start
  LANG = "en_US.UTF-8";
  # https://nixos.org/nixpkgs/manual/#locales
  LOCALE_ARCHIVE =
    optionalString isLinux "${glibcLocales}/lib/locale/locale-archive";

  shellHook = ''
    	export GEM_HOME=$(${jruby-9_2_9_0}/bin/ruby -e 'puts Gem.user_dir')
      export GEM_PATH=$GEM_HOME
      export PATH=$GEM_HOME/bin:$PATH
      '';
}
