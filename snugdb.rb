class Snugdb < Formula
  desc "SnugDB: A fun, simple, and local document database"
  homepage "https://github.com/Giac3/snugdb"
  url "https://github.com/Giac3/snugdb/archive/v0.0.4-alpha.tar.gz"
  sha256 "af038d601faef78cd4f232dc0635a5f2cdfc7229d4b22b32e8162d852363e543"
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