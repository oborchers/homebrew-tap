class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.10.2/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "882900d97b21f18f7b2cc207b15f8635ef86cf61aec801ea08f553a8b5152ec1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.10.2/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "4b9b4dae79be46b37c6a8c23b7a0beff7858052640cb6611a34f721008e926b4"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.10.2/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "49446ffff2e5782a3eb29e7c18eadb149876ac36a9f55ebe39251b63eaa32a56"
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
