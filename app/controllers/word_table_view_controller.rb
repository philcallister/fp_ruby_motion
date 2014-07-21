class WordTableViewController < UITableViewController

  extend IB

  def viewDidLoad
    super
    @words = Words::WORDS
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
    @words.length
  end

  def tableView(tableView, cellForRowAtIndexPath:path)
    word = @words[path.row]
    cell = tableView.dequeueReusableCellWithIdentifier(WordCell.name)
    cell.populate(word)
    cell
  end

  # We do this to avoid having separators after the last cell
  def tableView(tableView, heightForFooterInSection:section)
    return 0.01
  end

end
