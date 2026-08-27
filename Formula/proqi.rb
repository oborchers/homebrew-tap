class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.4.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "5ca15f7fa98d068f9ae7e73c382be6868f63d3bea17a3b22977b03c441cd0445"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.4.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "4e6f631e83706faf60f3d163ad526b00d61c7941c473dab98a52e0f51f52b34e"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.4.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "ca25e7001259b9e0f9f6312e53b4e25eed42b8807abc378b3ae5b55c94dcab6c"
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
