component "nssm" do |pkg, settings, platform|
  pkg.version "2.24"
  pkg.md5sum "b2edd0e4a7a7be9d157c0da0ef65b1bc"
  pkg.url "https://nssm.cc/release/nssm-#{pkg.get_version}.zip"
  pkg.mirror "http://buildsources.delivery.puppetlabs.net/nssm-#{pkg.get_version}.zip"

  build_arch = platform.architecture == "x64" ? "x64" : "Win32"
  platform_toolset = 'v141'
  target_platform_version = '8.1'

  pkg.install do
    [
      "#{settings[:msbuild]} nssm.vcxproj /detailedsummary /p:Configuration=Release /p:OutDir=./out /p:Platform=#{build_arch} /p:PlatformToolset=#{platform_toolset} /p:TargetPlatformVersion=#{target_platform_version}",
    ]
  end

  pkg.install_file "nssm-2.24/#{win_arch}/nssm.exe", "#{settings[:service_dir]}/nssm.exe"
end
