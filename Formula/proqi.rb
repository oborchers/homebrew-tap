class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.3.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "71aaa28c556d4c0ba8471f89b4f6642826e0b157c96a8e8782be273f226986ca"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.3.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "4d9160498842add1c6d0b8b2b5bcd41fad39446cce60b46dffc10a6927ff1902"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.3.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "7fc972d98152c23893ad3f6b9df726e5f53fc16f67787e26520465a73499a8c1"
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
