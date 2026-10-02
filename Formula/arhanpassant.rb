class Arhanpassant < Formula
  desc "UCI chess engine that improves itself through self-play (NNUE)"
  homepage "https://github.com/arhancanli/arhanpassant"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.7.0/arhanpassant-macos-arm64"
      sha256 "09420c95acbd1469a48d8ad066810ee6cf3e9506c1a3b21d53ff942fb6d4993b"
    end
    on_intel do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.7.0/arhanpassant-macos-x86_64"
      sha256 "34c69eaf67dde185384675de361c2c1c5ff58058c362ed9aa447ff4ee7fad3ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.7.0/arhanpassant-linux-x86_64"
      sha256 "12e8df6b0f856ba03303dda8c2e9e87208e86e414e68d449f05ade207e0353f8"
    end
  end

  def install
    bin.install Dir["arhanpassant-*"].first => "arhanpassant"
  end

  test do
    assert_match "uciok", pipe_output("#{bin}/arhanpassant", "uci\nquit\n")
  end
end
