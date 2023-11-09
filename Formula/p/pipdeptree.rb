class Pipdeptree < Formula
  include Language::Python::Virtualenv

  desc "CLI to display dependency tree of the installed Python packages"
  homepage "https://github.com/tox-dev/pipdeptree"
  url "https://files.pythonhosted.org/packages/b5/82/127215bd6bf6f1c0d98c89052eb91c67e34258b743395e3ebd24bc7a3816/pipdeptree-2.13.1.tar.gz"
  sha256 "1e1acdb2ddc2abdca1718f27ca8dc21622c896a00b8980ec3d42c2208a841a10"
  license "MIT"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "b9c8240eb9f5d21c56e1223729e0212f39a331f5a04a62c16a84c86756dc6d1c"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "e7f8cb379bea9bd1b7834a8b63614cfa1312c27fb90e41b9216c25eb8d81ee49"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "a825aa23fc52f5abcda7814164795f0d4c1a4ef027297bc61fbf731bee9129c1"
    sha256 cellar: :any_skip_relocation, sonoma:         "8ec5b5b43f0870b7d9683595a743ce8be557ec2a2e93c16538e7512364095b6f"
    sha256 cellar: :any_skip_relocation, ventura:        "643014c232003e22ec8bd73fc5725c9af8e1b0cd5fb9b986b479bde18750de4b"
    sha256 cellar: :any_skip_relocation, monterey:       "076ca7deb8f8f900d3501dadb30dc00f77064e912254828e9da852c166cf772b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c8f5f370aaf05a9deaa4413db9af01d9befbac7a57fdf82253b1bbb21c30685c"
  end

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "pipdeptree==#{version}", shell_output("#{bin}/pipdeptree --all")

    assert_empty shell_output("#{bin}/pipdeptree --user-only").strip

    assert_equal version.to_s, shell_output("#{bin}/pipdeptree --version").strip
  end
end
