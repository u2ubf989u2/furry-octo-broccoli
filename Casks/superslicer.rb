cask "superslicer" do
  version "2.3.57.6,211118"
  sha256 "c2890de52e06fb56ac39c4060ee3254ecaf69b1608f6747a77b803889cfe955a"

  url "https://github.com/supermerill/SuperSlicer/releases/download/#{version.before_comma}/SuperSlicer_#{version.before_comma}_macos_#{version.after_comma}.dmg"
  name "SuperSlicer"
  desc "Convert 3D models into G-code instructions or PNG layers"
  homepage "https://github.com/supermerill/SuperSlicer"

  livecheck do
    url "https://github.com/supermerill/SuperSlicer/releases/latest"
    strategy :page_match do |page|
      match = page.match(%r{href=.*?/SuperSlicer_(\d+(?:\.\d+)+)_macos_(\d+)\.dmg}i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  app "SuperSlicer.app"

  zap trash: "~/Library/Application Support/SuperSlicer"
end
