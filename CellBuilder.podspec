Pod::Spec.new do |c|
  c.name             = 'CellBuilder'
  c.version          = '1.1.0'
  c.summary          = "If you're eager to integrate your existing UIView, UITableViewCell or UICollectionViewCell components into SwiftUI, then this framework is just what you need! Let's make your development journey both exciting and efficient!"
  c.homepage         = 'https://github.com/sonmbol/CellBuilder'
  c.license          = { :type => 'MIT', :file => 'LICENSE' }
  c.author           = { 'Ahmed Suliman' => 'dev.a7med95@gmail.com' }
  c.source           = { :git => 'https://github.com/sonmbol/CellBuilder.git', :tag => c.version.to_s }
  c.ios.deployment_target = '14.0'
  c.swift_version = '5.0'
  c.source_files = 'Sources/**/*'
  c.platform = :ios
end
