class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.10.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "c62e152e7377cac2b676d6da2d0cf88067273c1cf9c05fedac79336127f131d9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.10.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "15b45517c01d13eeeb8897a013356b19846488ecca0d99d215d4d01a1608230b"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.10.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "095327445276364dae3e270531864c6390ae6f7f353c8a0270edc8e79e17b044"
    end
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    bin.install "proqi"
    bash_completion.install "completions/proqi.bash" => "proqi"
    zsh_completion.install "completions/_proqi"
    fish_completion.install "completions/proqi.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proqi --version")
    assert_match "schema_version", shell_output("#{bin}/proqi capabilities --json")
  end
end
