class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.5.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "4ca76809fc827a957aba0f1b295b19d0bb59143f92d40bb7c26b22e8571f926b"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.5.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "7af146edbc7ac5d867055acf003cd41ce9c5d3d60625a2cbe8d06f649e99313d"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.5.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "83568bb4e2fb37096d5612b18e0c2aec6230a50aceb5c8697c5ce4b751d78d57"
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
