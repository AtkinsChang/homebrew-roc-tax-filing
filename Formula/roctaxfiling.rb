
class Roctaxfiling < Formula
  desc "Service for filing taxes in ROC"
  homepage "http://moica.nat.gov.tw/rac_plugin.html"
  url "http://api-hisecurecdn.cdn.hinet.net/HiPKILocalSignServer/mac/HiPKILocalSignServer.pkg"
  mirror "http://moica.nat.gov.tw/download/File/HiPKILocalSignServer/mac/HiPKILocalSignServer.pkg"
  version "1.3.4.7"
  sha256 "f010bfcb89077ac336034c7114be76f4dac5493d319d047735c4bd6631ea5706"

  bottle :unneeded

  def install
    system "pkgutil", "--expand", "HiPKILocalSignServer.pkg", "expand"
    system "unzip", "-qq", "expand/HiPKILocalSignServer.pkg/Scripts/HiPKILocalSignServer_install.zip"

    lng = `defaults read .GlobalPreferences AppleLanguages`.gsub! /\s/, ""
    inreplace "HiPKILocalSignServer_install/runHIPKILocalServer.sh", "~/Library/HiPKILocalSignServer", libexec

    lib.install ["HiPKILocalSignServer_install/HiPKILocalSignServer_common/libHicos_p11v1.dylib"]
    libexec.install Dir["HiPKILocalSignServer_install/HiPKILocalSignServer_common/*"]
    if lng[2..3] == "en"
      libexec.install Dir["HiPKILocalSignServer_install/HiPKILocalSignServer_en/*"]
    else
      libexec.install Dir["HiPKILocalSignServer_install/HiPKILocalSignServer_zhTW/*"]
    end
    bin.install "HiPKILocalSignServer_install/checkHIPKILocalServer.sh"
    bin.install "HiPKILocalSignServer_install/stopHIPKILocalServer.sh"
    bin.install "HiPKILocalSignServer_install/runHIPKILocalServer.sh"
  end
end
