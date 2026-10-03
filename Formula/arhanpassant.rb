class Arhanpassant < Formula
  desc "UCI chess engine that improves itself through self-play (NNUE)"
  homepage "https://arhanpassant.com"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.9.0/arhanpassant-macos-arm64"
      sha256 "363568159652e3e120e4da1ce9c413654d6be77bd71952ec965866de644ad1dd"
    end
    on_intel do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.9.0/arhanpassant-macos-x86_64"
      sha256 "b9f87769536c78ba6a6d5ce43291b8415b37feddce8560584d582eb6837e18b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/arhancanli/arhanpassant/releases/download/v0.9.0/arhanpassant-linux-x86_64"
      sha256 "0838d05946730e8399702c7fddd1536c7006e9ae4a36a5a2e0e8600cb458e16a"
    end
  end

  def install
    bin.install Dir["arhanpassant-*"].first => "arhanpassant"
  end

  test do
    assert_match "uciok", pipe_output("#{bin}/arhanpassant", "uci\nquit\n")
  end
end
