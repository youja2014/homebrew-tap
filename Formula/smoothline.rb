class Smoothline < Formula
  include Language::Python::Virtualenv

  desc "Smooth, gradient statusline for Claude Code"
  homepage "https://github.com/youja2014/smoothline"
  url "https://files.pythonhosted.org/packages/2c/34/680e76a00d6178b816fda4d36db4ed6b8e4a4a3790e16adaae44b95964c6/smoothline-0.1.1.tar.gz"
  sha256 "094785c2228e85765f5b80119cd1442c358d4671d80cac269586937d38ee0bfc"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    sample = <<~JSON
      {"model":{"display_name":"Claude Opus 4.7"},"workspace":{"current_dir":"#{testpath}"},"context_window":{"used_percentage":42}}
    JSON
    output = pipe_output(bin/"smoothline", sample)
    assert_match "Claude Opus 4.7", output
    assert_match "42%", output
  end
end
