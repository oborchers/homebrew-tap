class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.11.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "ef2c6c4ae0623e3cc6816e3912f32855a386728dbd9657d67d438b8cc2753fa7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.11.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "a63ebf82cf3bcef7ea2e41c717f64621cd8f9a2cd4e2aa370c6f211ad90bf39c"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.11.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "006a5e8c329ddd04c4b73defac560cda0a3938edda70f13f8741f7b256b44961"
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
