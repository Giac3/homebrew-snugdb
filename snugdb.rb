class Snugdb < Formula
  desc "SnugDB: A fun, simple, and local document database"
  homepage "https://github.com/Giac3/snugdb"
  url "https://github.com/Giac3/snugdb/archive/v0.0.2.tar.gz"
  sha256 "451464b6b2f226969347564756b52e401c9185481fc779b28d8ab0fde989f273"
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