
class Roctaxfiling < Formula
  desc "Service for filing taxes in ROC"
  homepage "http://moica.nat.gov.tw/rac_plugin.html"
  url "http://api-hisecurecdn.cdn.hinet.net/HiPKILocalSignServer/mac/HiPKILocalSignServer.pkg"
  mirror "http://moica.nat.gov.tw/download/File/HiPKILocalSignServer/mac/HiPKILocalSignServer.pkg"
  version "1.3.4.5"
  sha256 "65b83f2c8f9f165d61ee35c34bac563e86f3178417653b10cc6f5a9dfb84c808"

  bottle :unneeded

  def install
    system "tar", "xzf", "HiPKILocalSignServer.pkg/Scripts"
    system "unzip", "-qq", "HiPKILocalSignServer_install.zip"

    lng = `defaults read .GlobalPreferences AppleLanguages`.gsub! /\s/, ""
    inreplace "HiPKILocalSignServer_install/runHIPKILocalServer.sh", "~/Library/HiPKILocalSignServer", libexec

    lib.install ["HiPKILocalSignServer_install/HiPKILocalSignServer_common/libHicos_p11v1.dylib"]
    libexec.install Dir["HiPKILocalSignServer_install/HiPKILocalSignServer_common/*"]
    if lng[2..3] == "en"
      libexec.install Dir["HiPKILocalSignServer_install/HiPKILocalSignServer_en/*"]
    else
      libexec.install Dir["HiPKILocalSignServer_install/HiPKILocalSignServer_zhTW/*"]
    end
    bin.install "HiPKILocalSignServer_install/runHIPKILocalServer.sh"
  end
end
