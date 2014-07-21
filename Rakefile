# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")

begin
  require 'motion/project/template/ios'
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'FastPencil'
  app.identifier = 'com.philcallister.FastPencil'
  app.info_plist['UIMainStoryboardFile'] = 'MainStoryboard'
  app.interface_orientations = [:portrait]
  app.prerendered_icon = false
  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = false

  app.development do
    # This entitlement is required during development but must not be used for release.
    app.codesign_certificate = "iPhone Developer: Phil Callister (UHKN5WEMMP)"
    app.provisioning_profile = "/Users/philcallister/Library/MobileDevice/Provisioning\ Profiles/1AB6DBA0-7A3B-41A1-8E0D-BC008377C58E.mobileprovision"
    app.entitlements['get-task-allow'] = true
  end

end