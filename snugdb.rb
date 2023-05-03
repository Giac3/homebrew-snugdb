class Snugdb < Formula
  desc "SnugDB: A fun, simple, and local document database"
  homepage "https://github.com/Giac3/snugdb"
  url "https://github.com/Giac3/snugdb/archive/v0.0.3.tar.gz"
  sha256 "b4b9ce02f217fcf2663801db69ff902b393b437dc43b232ba783970961acdca6"
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