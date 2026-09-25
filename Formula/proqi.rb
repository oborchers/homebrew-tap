class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.14.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "44954637294ca19bf011ba9b49701aa6f4d75729bee96c5ef5cec02b666a3bec"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.14.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "9784893ea8065d2ed50c5b4425c62ad9aac02259536b6115d23d9d5cc695d303"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.14.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "3f17d457abfc819ce783c36add37b8c290824e2ec69e556ab41c52a1028cbd93"
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
