class Snugdb < Formula
  desc "SnugDB: A fun, simple, and local document database"
  homepage "https://github.com/Giac3/snugdb"
  url "https://github.com/Giac3/snugdb/archive/v0.0.5-alpha.tar.gz"
  sha256 "5b3a218311f1415a0cc111e03216e3ff90168807e1a8fcb51502db1ff48b672e"
  license "MIT"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      bin.install "snugdb-cli"
      bin.install "snugdb-server"
    end
  end

  test do
    system "#{bin}/snugdb-cli", "--version"
    system "#{bin}/snugdb-server", "--version"
  end
end