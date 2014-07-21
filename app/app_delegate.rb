class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    application.setStatusBarStyle(UIStatusBarStyleLightContent)

    true
  end

  def applicationWillResignActive(application)
  end

  def applicationWillEnterForeground(application)
  end

  def applicationDidEnterBackground(application)
  end

  def applicationDidBecomeActive(application)
  end
  
  def applicationWillTerminate(application)
  end

  # Cannot define these using attr_accessor :window. 
  def window
    @window
  end
  
  def setWindow(window)
    @window = window
  end

end
