class Arhanpassant < Formula
  desc "UCI chess engine that improves itself through self-play (NNUE)"
  homepage "https://arhanpassant.com"
  version "0.13.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.13.0/arhanpassant-macos-arm64"
      sha256 "b924441b0058cfcebf7c9a23e150c1afda82d46b31b91cef610c59734d8e8269"
    end
    on_intel do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.13.0/arhanpassant-macos-x86_64"
      sha256 "2349a8aff86bd54efc1de6e42828ca2251a7df110c4759461822ff444e67cbef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.13.0/arhanpassant-linux-aarch64"
      sha256 "0b2ea0c9caf9667fc5cb8da84a32ecba5daf57e9293e662d73f803f0ddcf569d"
    end
    on_intel do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.13.0/arhanpassant-linux-x86_64"
      sha256 "5800e41936add66b6f9f94d37cc86a600a3cd04c48bb8acdb26d1c54ab6e29ee"
    end
  end

  def install
    bin.install Dir["arhanpassant-*"].first => "arhanpassant"
  end

  test do
    assert_match "uciok", pipe_output("#{bin}/arhanpassant", "uci\nquit\n")
  end
end
