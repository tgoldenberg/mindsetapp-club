class SyllabusesController < ApplicationController
  before_action :set_syllabus, only: [:show, :edit, :update, :destroy]

  # GET /syllabuses
  # GET /syllabuses.json
  def index
    @syllabuses = Syllabus.all
  end

  # GET /syllabuses/1
  # GET /syllabuses/1.json
  def show
  end

  # GET /syllabuses/new
  def new
    @syllabus = Syllabus.new
  end

  # GET /syllabuses/1/edit
  def edit
  end

  # POST /syllabuses
  # POST /syllabuses.json
  def create

    @syllabus = Syllabus.new(syllabus_params)

    respond_to do |format|
      if @syllabus.save

        # # create pdf object 
        # pdf = PDF::Reader.new(params[:syllabus][:up_load].tempfile)
        # # new string variable
        # str = String.new
        # # set string to blod of text from pages
        # pdf.pages.each {|p| str += p.text}
        # # scrub string and turn to json
        # str.scrub!
        # bool = system("curl --request POST --url http://52.5.47.112:8080/ --header 'cache-control: no-cache' --header 'content-type: application/json' --header 'postman-token: e58dd45c-3985-2e19-4648-111a702f1f12' --data '#{str}'")
        #   byebug
        # if bool
        #   res = `curl --request POST --url http://52.5.47.112:8080/ --header 'cache-control: no-cache' --header 'content-type: application/json' --header 'postman-token: e58dd45c-3985-2e19-4648-111a702f1f12' --data '#{str}'`
        #   # res = {:topics=>[{:topic=>"Introduction to Functions and Polynomials", :tags=>["Function", "Polynomial"]}, {:topic=>"Equations and Factoring", :tags=>["Equation", "Factoring"]}, {:topic=>"Quadratic and Exponential Functions", :tags=>["Quadratic Function", "Exponent", "Function"]}], :title=>"Mrs. Johnson's Algebra II Class"}
        #   res = JSON.parse(res, symbolize_names: true)
         
        #   res[:topics].each do |topic|
          
        #     @t = Topic.find_or_create_by(name: topic[:topic])

        #     topic[:tags].each do |tag|
        #       tagg = Tag.find_or_create_by(name: tag)

        #       if tagg.save
        #         @t.tags << tagg
        #       end

        #     end
        #     @t.save
        #     @syllabus.topics << @t
        #   end
        # end

        # {:topics=>[{:topic=>"Introduction to Functions and Polynomials", :tags=>["Function", "Polynomial"]}, {:topic=>"Equations and Factoring", :tags=>["Equation", "Factoring"]}, {:topic=>"Quadratic and Exponential Functions", :tags=>["Quadratic Function", "Exponent", "Function"]}], :title=>"Mrs. Johnson's Algebra II Class"}
        #   @syllabus.topics << topics_arr
        #   

        # convert pdf to text
        # send prem text blob
        # json_obj = {x: 1}
        # json_obj = json_obj.to_json
        # get response and create topics / tags

        format.html { redirect_to @syllabus, notice: 'Syllabus was successfully created.' }
        format.json { render :show, status: :created, location: @syllabus }
      else
        format.html { render :new }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /syllabuses/1
  # PATCH/PUT /syllabuses/1.json
  def update
    respond_to do |format|
      if @syllabus.update(syllabus_params)
        format.html { redirect_to @syllabus, notice: 'Syllabus was successfully updated.' }
        format.json { render :show, status: :ok, location: @syllabus }
      else
        format.html { render :edit }
        format.json { render json: @syllabus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syllabuses/1
  # DELETE /syllabuses/1.json
  def destroy
    @syllabus.destroy
    respond_to do |format|
      format.html { redirect_to syllabuses_url, notice: 'Syllabus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_syllabus
      @syllabus = Syllabus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def syllabus_params
      params.require(:syllabus).permit(:up_load)
    end
end
