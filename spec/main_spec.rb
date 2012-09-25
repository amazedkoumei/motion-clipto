# -*- coding: utf-8 -*-
describe "Application 'clipTo'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

end