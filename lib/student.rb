class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    
    @student = Student.new(student_hash)
    @student.send(
      :name=, student_hash[:name],
      :location=, student_hash[:location], 
      :profile_url=, student_hash[:profile_url]
      )
      @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
      Student.new(student)
    end 
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each{|key, value| self.send(("#{key}="), value)}
  
  #     :twitter=, student_hash[:twitter], 
  #     :linkedin=, student_hash[:linkedin], 
  #     :github=, student_hash[:student], 
  #     :blog=, student_hash[:blog], 
  #     :profile_quote=, student_hash[:profile_quote], 
  #     :bio=, student_hash[:bio], 
  # end

  def self.all
    @@all
  end
end

