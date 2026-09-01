class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.6.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "4dfcaefbc5f4c83d0f0bc2d26fbb81704ea563e3255aa5c1b9ee300a512ba402"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.6.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "f9e982c2d63d62fd46ec77607db2f418a3b08502aa06ef3cb62a81758e1a55af"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.6.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "8492d0600646e732db1a6973cda3bf46a2817318021156b8aec3a863ae442432"
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
