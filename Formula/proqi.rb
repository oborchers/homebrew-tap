class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.9.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "07f5a40e73c8ad7a3fca2d3e545a4326773a52add6c39bb07a6ff6f9ac8b19ec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.9.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "518bfabbd1f330a502f40cd3cb97b20c548026746a0bda8bfeaaaed1db76b531"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.9.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "e1be3fdfa2f9e9a34c1ef1f90d785652ee1d7e5c1ef2e1a06f83bca53cebe37c"
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
