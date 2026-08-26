class Proqi < Formula
  desc "Agent-optimized terminal scratchpad for follow-up prompts"
  homepage "https://github.com/oborchers/proqi"
  url "https://github.com/oborchers/proqi/releases/download/v0.1.2/proqi-x86_64-unknown-linux-gnu.tar.gz"
  sha256 "d68b8336568eed17baa821f2d24c34fa2d14d2176e580d60784bb384ed6fac7e"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/oborchers/proqi/releases/download/v0.1.2/proqi-aarch64-apple-darwin.tar.gz"
      sha256 "9d68199725a649e3337781beb4703fb03a95586d51819eea2d9a75fcada7aa1c"
    else
      url "https://github.com/oborchers/proqi/releases/download/v0.1.2/proqi-x86_64-apple-darwin.tar.gz"
      sha256 "bc2edf5f3273d46c2f8036401b86fd5852144a7cab5a764c44e2d917a52f47dd"
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
