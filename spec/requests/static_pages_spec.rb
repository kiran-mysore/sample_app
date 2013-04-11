require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
  	it "should have the h1 'Sample App'" do
  		#visit "/static_pages/home"
      visit root_path
  		#page.should have_h1('Sample App')
      page.should have_selector('h1', :text => 'Sample App')

  	end


 	it "should have the base title" do
  		visit root_path
  		#page.should have_h1('Sample App')
  		
     # page.should have_selector('title', 
     #   :text => 'Sample App using Rails | Home')
      page.should have_selector('title', 
        text: 'Sample App using Rails')

  	end 

    it "should not have custom page title"  do
      visit "/static_pages/home"
       page.should_not have_selector('title', text: '| Home')
    end


  end

  describe "Help page" do
  	it "should have the h1 'Help'" do
  		#visit "/static_pages/help"
      visit help_path
  		#page.should have_h1('Help')
  		page.should have_selector('h1', text: 'Help')
  	end

    it "should have the title 'Help'" do
      visit help_path
      #page.should have_h1('Sample App')
      page.should have_selector('title', 
          text: 'Sample App using Rails | Help')

    end   
  end

    describe "About page" do
    it "should have the h1 'About Us'" do
      #visit "/static_pages/about"
      visit about_path
      #page.should have_h1('About Us')
      page.should have_selector('h1', text: 'About Us')
    end

    it "should have the title 'About Us'" do
      #visit "/static_pages/about"
      visit about_path
      #page.should have_h1('Sample App')
      page.should have_selector('title', 
          text: 'Sample App using Rails | About Us')

    end 


  end

  describe "Contact page" do
    it "should have the h1 'Contact'" do
      #visit "/static_pages/contact"
      visit contact_path
      #page.should have_h1('About Us')
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have the title 'Contact'" do
      #visit "/static_pages/contact"
      visit contact_path
      #page.should have_h1('Sample App')
      page.should have_selector('title', 
          text:  'Sample App using Rails | Contact')

    end 
  end

end


  
