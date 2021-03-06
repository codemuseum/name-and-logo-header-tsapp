class Header < ActiveRecord::Base
  has_many :page_objects
  
  attr_protected :organization_uid
  validates_uniqueness_of :organization_uid
  validates_presence_of :organization_uid
  validates_inclusion_of :layout, :in => %w(left hidden)
  
  before_validation :set_default_layout
  
  def layout_hidden?
    self.layout == 'hidden'
  end
  
  def picture?
    ThriveSmart::Helpers::AssetHelper::asset?(asset_type, asset_urn)
  end
  
  def picture_url
    @picture_url ||= ThriveSmart::Helpers::AssetHelper::asset_url(asset_type, asset_urn)
  end
  
  def after_initialize
    if new_record?
      self.layout = 'left'
    end
  end
  
  protected
  
  def set_default_layout
    self.layout = 'left' if self.layout.blank?
  end
end
