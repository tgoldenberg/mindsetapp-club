class Syllabus < ActiveRecord::Base

	belongs_to :teacher
	has_many :topics

	has_attached_file :up_load,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
	validates_attachment_content_type :up_load, content_type: "application/pdf"

  def s3_credentials
    {:bucket => "fresh-set", :access_key_id => "AKIAJLKKNJGIRJRQYZUA", :secret_access_key => "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"}
  end

  # GET INSTANCE AND PUBLIC URL
  # s.up_load.s3_object.public_url.to_s => "https://fresh-set.s3.amazonaws.com/syllabuses/up_loads/3/finite_general.pdf"

  # READ AND CREATE PDF OBJECT FROM S3
  # io = open(s.up_load.s3_object.public_url)
  # reader = PDF::Reader.new(io)
  # reader.page(2).text => Class::String

  # PARSING OF EXAMPLE
  # text_arr = reader.page(2).text.split('Chapter')
  # results = []
  # 7.downto(1) {|n| results << arr[-n].strip.split("\n")[0].gsub(/\s+/, ' ')}
  # 
  # =>  1.1: Problem Solving – Patterns
  #     2: Sets
  #     3 Logic
  #     8: Geometry
  #     10: Counting Techniques
  #     11: Probability
  #     12: Statistics

end
