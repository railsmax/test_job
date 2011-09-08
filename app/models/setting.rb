class Setting < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  validates_presence_of :string_setting,:message=>"Email can't be blank"
  validates_format_of :string_setting,:message=>"Please insert correct email", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :integer_setting, :message=>"Integer setting can't be blank", :if=>Proc.new{|m| m.float_setting.blank?}
  validates_presence_of :float_setting, :message=>"Float setting can't be blank", :if=>Proc.new{|m| m.integer_setting.blank?}
  validates_numericality_of :integer_setting, :message=>"Integer setting should be number", :if=>Proc.new{|m| m.float_setting.blank?}
  validates_numericality_of :float_setting, :message=>"Float setting should be number", :if=>Proc.new{|m| m.integer_setting.blank?}
  validates_uniqueness_of :string_setting, :message=>"Email should be uniq"
  
  validate :integer_setting_is_over_null
  
  def integer_setting_is_over_null
    errors.add(:integer_setting,"value should be positiv") if ( self.integer_setting &&  self.integer_setting < 0 ) || ( self.float_setting && self.float_setting < 0 )
  end  
  
  def int_float_summ
    self.integer_setting + self.float_setting 
  end
  memoize :int_float_summ
end
