class PageObject < ActiveRecord::Base
  include ThriveSmartObjectMethods
  self.caching_default = :any_page_update #[in :forever, :page_update, :any_page_update, 'data_update[datetimes]', :never, 'interval[5]']

  
  belongs_to :header
  
  attr_protected :header_id
  # validates_presence_of :header_id  -- Interferes with the code below, when header is a new object
  
  # Pass the buck and actually save the header
  after_update :save_header
  
  # Creates a new header if it doesn't exist for the sent in organization
  def self.new_by_organization_uid(organization_uid, attr_hash)
    header = Header.find_by_organization_uid(organization_uid)
    if header.nil?
      header = Header.new
      header.organization_uid = organization_uid
    end
    new(attr_hash.merge({:header => header}))
  end
  
  def validate
    unless header.valid?
      errors.add(:header, " has an error that must be corrected.")
    end
  end
  
  # Passes the buck of the hash passed in to the actual header model
  def assigned_header=(hash)
    self.header.attributes = hash
  end
  
  protected
    def save_header
      header.save
    end
end
