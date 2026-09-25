class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.13.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "e5a76905adab20be89f16f4865b57444af4aba1145568f3b0686c9e5a1fe20a5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.13.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "d78442045d7c38ae452d18d47a3b7b35cba180197fa7e109d8666d6099d65e13"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.13.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "4c20fe562a413501f92c180dbf2f56f591ce84780d263dac51161ac17aa8db89"
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
