# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Mpr < Formula
  desc "Create pull requests for updating a specific file or directory across multiple GitHub repositories"
  homepage "https://github.com/koriym/mpr"
  url "https://github.com/koriym/mpr/archive/refs/tags/1.0.0.tar.gz"
  sha256 "406e704561c9f50112fd4d809ab09d63339afad4f7443636ab6805070ef8f330"
  license "MIT"

  depends_on "gh"

  def install
    bin.install "mpr.sh" => "mpr"
  end

  def caveats
    <<~EOS
      Before using mpr, make sure you authenticate GitHub CLI:
        gh auth login

      Ensure your token has the necessary scopes: repo, workflow, and read:org.
    EOS
  end

  test do
    assert_match "Usage: mpr <file_or_directory_path> <commit_message> <repo1> <repo2> ...", shell_output("#{bin}/mpr 2>&1", 1)
  end
end
