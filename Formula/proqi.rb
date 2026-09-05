class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.8.0/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "e6ba0205481f8b2f432c13b920605acf9d3d022f7bbd1cdd87fae437043b1f52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.8.0/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "6397bb090aba2dea5e8ef5ff35f23fd257e42eae78a83c2b0e5fb4f30962fe08"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.8.0/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "89c73e513909629daee32f7474fe06619fdc3a72b692de089b3734af9929a74e"
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
