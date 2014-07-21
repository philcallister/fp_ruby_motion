class QuestionTableViewController < UITableViewController

  extend IB

  def viewDidLoad
    super
    dict = Words.dictionary
    @questions = dict.unique_segments(false, true)
  end


  ############################################################################
  # Table Delegate

  def numberOfSectionsInTableView(tableView)
    1
  end

  # use this to add index section to right of tableview. Sorry...I don't have
  # time to implement this one tonight...
  # def sectionIndexTitlesForTableView(tableView)
  # end

  def tableView(tableView, heightForRowAtIndexPath:path)
    30
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @questions.length
  end

  def tableView(tableView, cellForRowAtIndexPath:path)
    question = @questions[path.row]
    cell = tableView.dequeueReusableCellWithIdentifier(QuestionCell.name)
    cell.populate(question)
    cell
  end

  # We do this to avoid having separators after the last cell
  def tableView(tableView, heightForFooterInSection:section)
    return 0.01
  end

end
