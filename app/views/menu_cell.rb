class MenuCell < UITableViewCell

  include CellSelectable

  extend IB

  # outlet
  outlet :name, UILabel

  def populate(name)
    self.name.text = name
    self.selectColor([self.name])
  end

end