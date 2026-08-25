class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.1.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "5ab5d9bae43a94be0bb1b9ec5bf688fdf2600e3130f555808732306eb26e9fd1"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.1.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "cfc2ca12052f9118b65cdf2a94611fbdd19334bc4a673ee6c93eaef36afd4870"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/oborchers/proqi/releases/download/v0.1.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a053e672e1ad2db6cce617d121a8b0781415a20a68e626bbb3476065c6eba60"
    end
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
