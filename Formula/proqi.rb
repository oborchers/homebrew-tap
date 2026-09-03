class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.7.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "de6741137eeb7d68044fd9e509dc698d21731eec84cdc78d523b64b4bb666645"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.7.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "abaf815a82be40abe5d73250c26f46184fa99265b854bab170dbf23cf3196579"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.7.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "9cc94ef59e2f18f91b6d09c96f5af051cbde95574f91940e9468d1183e9275d6"
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
