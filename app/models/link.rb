class Link < ActiveRecord::Base
  has_many :ownerships
  before_save :set_title

  private
  def set_title
    doc = Nokogiri::HTML(open( self.url ))
    self.title = doc.css('title').inner_html
  end
end
