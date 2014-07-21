class AnswerTableViewController < UITableViewController

  extend IB

  def viewDidLoad
    super
    dict = Words.dictionary
    @answers = dict.unique_segments(true, true)
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
    @answers.length
  end

  def tableView(tableView, cellForRowAtIndexPath:path)
    answer = @answers[path.row].last.first
    cell = tableView.dequeueReusableCellWithIdentifier(AnswerCell.name)
    cell.populate(answer)
    cell
  end

  # We do this to avoid having separators after the last cell
  def tableView(tableView, heightForFooterInSection:section)
    return 0.01
  end

end
