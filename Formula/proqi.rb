class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.2.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "a0c1785d6ad1f7822f70dda27ea0383b4690c230159ababc1578a42c609d95f2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.2.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "49600fd201e8b6bc8193986c59c1aff29d0917795cf3208ba7a71824f965305d"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.2.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "013a4b35b32c644be010b751da9b661b8b048b6042ea8b87508b8b9233cb04d8"
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
