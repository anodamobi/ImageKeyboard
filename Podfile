platform :ios, '11.0'

abstract_target 'GoogleDriveKeyboardAbstract' do
    use_frameworks!
    inhibit_all_warnings!
    
    target 'GoogleDriveKeyboard' do
        pod 'SnapKit'
        pod 'AlisterSwift', :git => 'https://github.com/anodamobi/AlisterSwift.git', :branch => 'develop', :commit => 'ff395f6'
        pod 'Kingfisher'
        pod 'Reveal-SDK'
        pod 'GoogleAPIClientForREST/Sheets', '~> 1.2.1'
        pod 'GoogleSignIn', '~> 4.1.1'
    end
    
    target 'KeyboardViewController' do
        pod 'SnapKit'
        pod 'AlisterSwift', :git => 'https://github.com/anodamobi/AlisterSwift.git', :branch => 'develop', :commit => 'ff395f6'
        pod 'Kingfisher'
    end
end

