class Smoothline < Formula
  include Language::Python::Virtualenv

  desc "Smooth, gradient statusline for Claude Code"
  homepage "https://github.com/youja2014/smoothline"
  url "https://files.pythonhosted.org/packages/d6/79/97d37ff929148c7dd0d2086cfb28a8fe6b9b955d96012675a298577f379f/smoothline-0.1.0.tar.gz"
  sha256 "1788b72adbc7c117e32d64198c74831d24fdb2d989bac3dfd9bb37cf020f31a8"
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
