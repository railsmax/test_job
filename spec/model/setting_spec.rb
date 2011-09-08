require_relative '../spec_helper'
  describe Setting do
        
    it "should create setting" do
      Setting.count.should == 0
      @setting = create_setting  
      Setting.find(:last).should == @setting    
    end
    
    it "should validate incorrect settings" do
      #should not create without integer_setting and float_setting 
      args = {:string_setting => "test@test.com"}
      create_setting_with_args(args)
      Setting.count.should == 0   
      #should not create if integer_setting is not a number
      args = {:string_setting => "test@test.com", :integer_setting=>"sdf"}
      create_setting_with_args(args)
      Setting.count.should == 0  
      #should not create if string_setting is not email
      args = {:string_setting => "testtest.com", :integer_setting=>234}
      create_setting_with_args(args)
      Setting.count.should == 0  
      #should not create if float_setting is not a number wthout integer_setting 
      args = {:string_setting => "test@test.com", :float_setting=>"sdf"}
      create_setting_with_args(args)
      Setting.count.should == 0                         
      #should not create without string_setting
      args = {:integer_setting=>45}
      create_setting_with_args(args)
      Setting.count.should == 0  
      #should not create with integer_setting < 0
      args = {:integer_setting=>-45, :string_setting=>'test@test.com'}
      create_setting_with_args(args)
      Setting.count.should == 0 
      #should not create with float_setting < 0
      args = {:float_setting=>-45, :string_setting=>'test@test.com'}
      create_setting_with_args(args)
      Setting.count.should == 0  
    end
    
    it "should correct calculate summ of int and flot setting" do
      @setting = create_setting
      @setting.int_float_summ.should == 12357.45  
    end
    
end

