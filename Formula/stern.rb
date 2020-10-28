class Stern < Formula
  desc "Tail multiple Kubernetes pods & their containers"
  homepage "https://github.com/stern/stern"
  url "https://github.com/stern/stern.git",
      tag:      "v1.12.1",
      revision: "2d4bd0de2d950b189eba7a7ebf8120283b7009c0"
  license "Apache-2.0"
  head "https://github.com/stern/stern.git",
    shallow: false

  bottle do
    cellar :any_skip_relocation
    sha256 "886c99c34ee64ae8ea2292822b268324b573449fb3d621b874c0746d071a5082" => :catalina
    sha256 "f862bab034a7d05b995e762e7feae5d840db9099faba8465e4e20daa548f02f7" => :mojave
    sha256 "fd68b5ceb1ef3a1cbdb51653530f0ac0625e59adb55b02c1b7dad2268db7e4b3" => :high_sierra
    sha256 "01a7f817326d1172201d36df18cbee1ceca864d83e9cc528e301018b1510872f" => :sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags",
             "-s -w -X github.com/stern/stern/cli.version=#{version} -X github.com/stern/stern/cli.commit=#{stable.specs[:revision]}",
             *std_go_args
  end

  test do
    system "#{bin}/stern", "--version"
  end
end
