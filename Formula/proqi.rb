class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.10.1/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "b139dbccb586311e0088bd875d8e380cbe903bb64305547a8b8f13e0a92f19c8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.10.1/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "5d8136465859e439ae736eff12e6e4bff5fc18dcba3a3676f3d9c0d1e6541d89"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.10.1/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "daaa85e3597f1bfbc266f6a87f0d720fb436f9138a18539756b3469caa119ab9"
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
