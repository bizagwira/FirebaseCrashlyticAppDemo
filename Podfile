# Uncomment the next line to define a global platform for your project

platform :ios, '10.0'

target 'MapwizeUI' do
  workspace 'PoleStarAppDemo'
  project './MapwizeUI.xcodeproj'
  use_frameworks!
  pod 'MapwizeSDK'
end

target 'PoleStarAppDemo' do
  workspace 'PoleStarAppDemo'
  project './PoleStarAppDemo.xcodeproj'
  use_frameworks!
  pod 'NAOSDK', :git => 'https://bitbucket.org/polestarusa/naosdk.git'  
  pod 'MapwizeUI', path: '.'
end
