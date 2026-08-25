class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.1.1/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "885878735413049c0a49f2c5af4430994e93ee160006ce832bd4c2323dd811bb"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.1.1/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "187066a15faa8e935768cbf29c531a5debf263745463d1300de7320a456d10c1"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.1.1/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "18e4892069c13b007a641fd4d9a0b3d4e47275a695aaf004f3aedc6cad4337bb"
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
