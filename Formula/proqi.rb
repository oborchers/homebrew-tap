class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.15.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "8e8037e9217b0c0bb1818b7508c78155b05b8eb29508d997d855e9b3c709a6dd"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.15.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "d4f356cd7f9b9d18ab4974de9ede44ef5df6805f8337bc09836f3dc384d5b863"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.15.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "818b464120220c9ddf1c1a6f780a53745bf45a78084276757a110049b715aa0e"
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
