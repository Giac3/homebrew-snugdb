class Snugdb < Formula
  desc "SnugDB: A fun, simple, and local document database"
  homepage "https://github.com/Giac3/snugdb"
  url "https://github.com/Giac3/snugdb/archive/v0.0.1.tar.gz"
  sha256 "bd16a5c861be536f7e4664efaf713cc1eab10a66a9014c6d87f6a3bfb68361f3"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    bin.install "snugdb_server"
    bin.install "snugdb_cli"
  end

  test do
    system "#{bin}/snugdb_server", "--version"
    system "#{bin}/snugdb_cli", "--version"
  end
end