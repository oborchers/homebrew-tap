class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.12.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "0901d3a1ad982b1376257750a6e80029a06e4049190eedeb39b187f1053c7c6e"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.12.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "e8fb02f399ec7b43fb6af45147b528600c9936c94a0004c589fc43f75e34b6aa"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.12.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "16322693f615a2c4f3cd056cc0d7aaa463dfd22c23b521fed2fed0390f75e117"
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
