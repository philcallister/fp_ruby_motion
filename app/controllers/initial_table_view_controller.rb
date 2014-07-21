class InitialTableViewController < UITableViewController

  extend IB

  def viewDidLoad
    super
    @menus ||= 
    [ 
      { :menu => 'Words', :func => :load_view, :params => { :id => 'WordSegue'}, :deselect => true },
      { :menu => 'Questions', :func => :load_view, :params => { :id => 'QuestionSegue'}, :deselect => true },
      { :menu => 'Answers', :func => :load_view, :params => { :id => 'AnswerSegue'}, :deselect => true }
    ]
  end


  ############################################################################
  # Table Delegate

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, heightForRowAtIndexPath:path)
    70
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @menus.length
  end

  def tableView(tableView, cellForRowAtIndexPath:path)
    item = @menus[path.row]
    cell = tableView.dequeueReusableCellWithIdentifier(MenuCell.name)
    cell.populate(item[:menu])
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:path)
    item = @menus[path.row]
    if self.respond_to?(item[:func])
      self.send(item[:func], item[:params])
    end
    tableView.deselectRowAtIndexPath(path, animated:true) if item[:deselect]
  end

  # We do this to avoid having separators after the last cell
  def tableView(tableView, heightForFooterInSection:section)
    return 0.01
  end


  ############################################################################
  # Internal...can't make private or can't be called

  def load_view(params=nil)
    if params
      self.performSegueWithIdentifier(params[:id], sender:self)
    end
  end

end
