class SplashViewController < UIViewController
  
  def viewDidLoad
    super
    ai = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle(UIActivity::UIActivityIndicatorViewStyleWhite)
    ai.center = self.view.center
    ai.startAnimating
    self.view.addSubview(ai)
  end

  def viewDidAppear(animated)
    super
    Words.load
    inc = self.storyboard.instantiateViewControllerWithIdentifier('InitialNavigation')
    self.presentViewController(inc, animated:true, completion:nil)
  end

end