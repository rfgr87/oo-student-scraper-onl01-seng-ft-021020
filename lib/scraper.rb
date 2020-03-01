require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    
    doc = Nokogiri::HTML(open(index_url))
    @students_array =[]

    doc.css("div.roster-cards-container").each do |student|
      student.css(".student-card a").each do |x| 
        student_name = x.css(".student-name").text
        student_location = x.css(".student-location").text
        student_profile = "#{x.attr('href')}"
        @students_array << {
        name: student_name,
        location: student_location,
        profile_url: student_profile
        }
      end
    end
    @students_array
  end

  def self.scrape_profile_page(profile_url)
    
    doc = Nokogiri::HTML(open(profile_url))
    @student_hash = {}

    doc.css("div.main-wrapper div.vitals-container").each do |info|
      info.css(".social-icon-container a").map { |link| link['href'] }.each do |x|
        if x.include?("twitter")
          twitter = x
        elsif x.include?("linkedin")
          linkedin = x
        elsif x.include?("github")
          github = x
        else 
          blog = x
        end
      end
    end
    profile_quote = doc.css("div.main-wrapper div.vitals-container").css("div.vitals-text-container").css("div.profile-quote").text
    bio = doc.css("div.main-wrapper").css("div.details-container").css("div.description-holder p").text
    @student_hash[:bio] = @bio
    @student_hash[:blog] = @blog
    @student_hash[:github] = @github
    @student_hash[:linkedin] = @linkedin
    @student_hash[:twitter] = @twitter
    @student_hash[:profile_quote] = @profile_quote
    @student_hash
    binding.pry
  end
end        
        
  

# require "spec_helper"



#   describe "#scrape_profile_page" do
#     it "is a class method that scrapes a student's profile page and returns a hash of attributes describing an individual student" do
#       profile_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/students/joe-burgess.html"
#       scraped_student = Scraper.scrape_profile_page(profile_url)
#       expect(scraped_student).to be_a(Hash)
#       expect(scraped_student).to match(student_joe_hash)
#     end

#     it "can handle profile pages without all of the social links" do
#       profile_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/students/david-kim.html"
#       scraped_student = Scraper.scrape_profile_page(profile_url)
#       expect(scraped_student).to be_a(Hash)
#       expect(scraped_student).to match(student_david_hash)
#     end
#   end
# end



# <div class=“vitals-text-container”
# 	<div class=“profile-quote. .text
# <div class=“details-container”
# 	<p .text

# <div class=“social-icon-container”
# 	<a href.  [0]

#html = File.read(https://learn-co-curriculum.github.io/student-scraper-test-page/index.html)
    #html = File.read(index_url)
    #doc = Nokogiri::HTML(html)
    
    #doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))

    # <dic class=“roster-cards-container”
    # <div class=“student-card”

    # <a href //student!!!!!!! html

    # <div class=“card-text-container”
    # 	<h4 class=“student-name”. .text
    # 	<p class=“student-location” . text
    
    # doc.css(".roster-cards-container div.card-text-container h4.student-name")   array of names
    # doc.css(".roster-cards-container div.card-text-container p.student-location") array of locations
    # doc.css(".roster-cards-container a").map{|link| link['href']} array of students index_url
    

