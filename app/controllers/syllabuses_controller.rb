
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
    @problem = Problem.new
    @tag = Tag.new
    @class_info = {
      "id": "58740898-bcdc-4a77-a924-ccb50108ce4d",
      "course_id": "5bc3f127-b33a-457e-ae47-d4ec9a8fa706",
      "course_title": "Algebra",
      "subject": "Algebra",
      "school_year": "2016",
      "staff": [
        {
          "id": "b3b83f93-de22-4231-a171-dddd0f302480",
          "last_name": "morgan",
          "first_name": "emma",
          "middle_name": "null"
        }
      ],
      "students": [
        {
          "id": "141791cd-cb40-4142-b55f-40c7fe820a43",
          "last_name": "watts",
          "first_name": "bertha",
          "middle_name": "null"
        },
        {
          "id": "2868e9d0-f6f0-4dba-be0b-576d24c992ce",
          "last_name": "weaver",
          "first_name": "jessie",
          "middle_name": "null"
        },
        {
          "id": "48608c29-66cb-4240-b834-e5fb8c23ec68",
          "last_name": "barnes",
          "first_name": "marc",
          "middle_name": "null"
        },
        {
          "id": "87453ffa-4ce8-49e8-9195-1860eed4ab47",
          "last_name": "prescott",
          "first_name": "arlene",
          "middle_name": "null"
        },
        {
          "id": "9e5ce90f-3755-4519-8b9b-faddb7aa274a",
          "last_name": "riley",
          "first_name": "erin",
          "middle_name": "null"
        },
        {
          "id": "b1adcabe-e0f2-4b1b-a81c-62885cd985ea",
          "last_name": "pena",
          "first_name": "gertrude",
          "middle_name": "null"
        },
        {
          "id": "bd182b76-08a3-4c5d-a243-035aa606d300",
          "last_name": "morgan",
          "first_name": "emma",
          "middle_name": "null"
        },
        {
          "id": "d949a8a7-dfb4-4b0c-90dd-fd827a9b547b",
          "last_name": "elliott",
          "first_name": "chris",
          "middle_name": "null"
        },
        {
          "id": "e75a2456-2e71-4304-9c5f-6e4eaa4b7934",
          "last_name": "dean",
          "first_name": "joseph",
          "middle_name": "null"
        },
        {
          "id": "fc1ce8c6-8cf9-4194-a9bc-cf607ec8e19f",
          "last_name": "mcdonalid",
          "first_name": "jose",
          "middle_name": "null"
        }
      ],
      "term": [
        {
          "id": "4dcccac4-19bf-11e5-b60b-1697f925ec7b",
          "meeting_time": [
            {
              "time_table_day": "Monday",
              "time_table_period": "Period 5",
              "time": [
                {
                  "start_time": "9AM",
                  "end_time": "10AM"
                }
              ]
            },
            {
              "time_table_day": "Tuesday",
              "time_table_period": "Period 5",
              "time": [
                {
                  "start_time": "9AM",
                  "end_time": "10AM"
                }
              ]
            },
            {
              "time_table_day": "Wednesday",
              "time_table_period": "Period 5",
              "time": [
                {
                  "start_time": "9AM",
                  "end_time": "10AM"
                }
              ]
            }
          ],
          "rooms": [
            {
              "room_number": "Room A"
            },
            {
              "room_number": "Room A"
            },
            {
              "room_number": "Room B"
            }
          ]
        }
      ]
    }
    @syllabus = Syllabus.find(params[:id])
    @topics = [];
    @syllabus.topics.each do |topic|
      t = { topic: topic, tags: [] }
      topic.tags.each do |tag|
        t[:tags].push({ tag: tag, problems: tag.problems })
      end
      @topics.push(t)
    end
    # @syllabus = @syllabus.to_json(:include => {:topics => {:include => {:tags => {:include => :problems}}}})
  end

  # GET /syllabuses/new
  def new
    api = {
      "user": {
        "id": "b3b83f93-de22-4231-a171-dddd0f302480",
        "user_id": "emma_morgan_teacher_833ee4a6-14dd-4897-814b-1d2d9441eeaa.hmhco.com",
        "last_name": "morgan",
        "first_name": "emma",
        "middle_name": "",
        "phone": "  888-555-0012",
        "email": "emma_morgan_teacher_833ee4a6-14dd-4897-814b-1d2d9441eeaa.hmhco.com@hmhco.com",
        "role": "Instructor"
      },
      "data": [
        {
          "id": "58740898-bcdc-4a77-a924-ccb50108ce4d",
          "course_id": "5bc3f127-b33a-457e-ae47-d4ec9a8fa706",
          "course_title": "Algebra",
          "subject": "Algebra",
          "school_year": "2016",
          "staff": [
            {
              "id": "b3b83f93-de22-4231-a171-dddd0f302480",
              "last_name": "morgan",
              "first_name": "emma",
              "middle_name": "null"
            }
          ],
          "students": [
            {
              "id": "141791cd-cb40-4142-b55f-40c7fe820a43",
              "last_name": "watts",
              "first_name": "bertha",
              "middle_name": "null"
            },
            {
              "id": "2868e9d0-f6f0-4dba-be0b-576d24c992ce",
              "last_name": "weaver",
              "first_name": "jessie",
              "middle_name": "null"
            },
            {
              "id": "48608c29-66cb-4240-b834-e5fb8c23ec68",
              "last_name": "barnes",
              "first_name": "marc",
              "middle_name": "null"
            },
            {
              "id": "87453ffa-4ce8-49e8-9195-1860eed4ab47",
              "last_name": "prescott",
              "first_name": "arlene",
              "middle_name": "null"
            },
            {
              "id": "9e5ce90f-3755-4519-8b9b-faddb7aa274a",
              "last_name": "riley",
              "first_name": "erin",
              "middle_name": "null"
            },
            {
              "id": "b1adcabe-e0f2-4b1b-a81c-62885cd985ea",
              "last_name": "pena",
              "first_name": "gertrude",
              "middle_name": "null"
            },
            {
              "id": "bd182b76-08a3-4c5d-a243-035aa606d300",
              "last_name": "morgan",
              "first_name": "emma",
              "middle_name": "null"
            },
            {
              "id": "d949a8a7-dfb4-4b0c-90dd-fd827a9b547b",
              "last_name": "elliott",
              "first_name": "chris",
              "middle_name": "null"
            },
            {
              "id": "e75a2456-2e71-4304-9c5f-6e4eaa4b7934",
              "last_name": "dean",
              "first_name": "joseph",
              "middle_name": "null"
            },
            {
              "id": "fc1ce8c6-8cf9-4194-a9bc-cf607ec8e19f",
              "last_name": "mcdonalid",
              "first_name": "jose",
              "middle_name": "null"
            }
          ],
          "term": [
            {
              "id": "4dcccac4-19bf-11e5-b60b-1697f925ec7b",
              "meeting_time": [
                {
                  "time_table_day": "Monday",
                  "time_table_period": "Period 5",
                  "time": [
                    {
                      "start_time": "9AM",
                      "end_time": "10AM"
                    }
                  ]
                },
                {
                  "time_table_day": "Tuesday",
                  "time_table_period": "Period 5",
                  "time": [
                    {
                      "start_time": "9AM",
                      "end_time": "10AM"
                    }
                  ]
                },
                {
                  "time_table_day": "Wednesday",
                  "time_table_period": "Period 5",
                  "time": [
                    {
                      "start_time": "9AM",
                      "end_time": "10AM"
                    }
                  ]
                }
              ],
              "rooms": [
                {
                  "room_number": "Room A"
                },
                {
                  "room_number": "Room A"
                },
                {
                  "room_number": "Room B"
                }
              ]
            }
          ]
        },
        {
          "id": "46792e0b-4792-422f-b59d-82a260acfb8d",
          "course_id": "e43b668d-7a64-49a8-b64d-dc5380cf7668",
          "course_title": "Algebra 2",
          "subject": "Algebra 2",
          "school_year": "2016",
          "staff": [
            {
              "id": "b3b83f93-de22-4231-a171-dddd0f302480",
              "last_name": "morgan",
              "first_name": "emma",
              "middle_name": "null"
            }
          ],
          "students": [
            {
              "id": "206a25a4-07df-4848-adb1-fa073d2ab1e8",
              "last_name": "newman",
              "first_name": "jennie",
              "middle_name": "null"
            },
            {
              "id": "2b1e855f-4e1b-4304-b7fd-b4c084f84640",
              "last_name": "sims",
              "first_name": "christine",
              "middle_name": "null"
            },
            {
              "id": "3af01d0c-19a5-4172-8f04-71c5aaadebcb",
              "last_name": "mitchell",
              "first_name": "anna",
              "middle_name": "null"
            },
            {
              "id": "62c023c4-b0ea-48e4-9277-298271b8a585",
              "last_name": "marshall",
              "first_name": "cory",
              "middle_name": "null"
            },
            {
              "id": "680936c1-2487-4c16-8840-3222ccd8bf3c",
              "last_name": "young",
              "first_name": "edith",
              "middle_name": "null"
            },
            {
              "id": "7f4aeae4-b3a5-4b90-b063-27cc7fac5ce3",
              "last_name": "brooks",
              "first_name": "clyde",
              "middle_name": "null"
            },
            {
              "id": "7f955361-efbd-4abe-a58a-02279dfd884a",
              "last_name": "gilbert",
              "first_name": "tamara",
              "middle_name": "null"
            },
            {
              "id": "c3936999-0db4-4cf9-906f-f9789b611618",
              "last_name": "reynolds",
              "first_name": "same",
              "middle_name": "null"
            },
            {
              "id": "fce1ab66-176b-4d88-965e-89edeff461ec",
              "last_name": "mitchelle",
              "first_name": "beverly",
              "middle_name": "null"
            },
            {
              "id": "fe70a0da-a5b0-4638-9e91-a55a00e84884",
              "last_name": "wood",
              "first_name": "regina",
              "middle_name": "null"
            }
          ],
          "term": [
            {
              "id": "4dcccac4-19bf-11e5-b60b-1697f925ec7b",
              "meeting_time": [
                {
                  "time_table_day": "Monday",
                  "time_table_period": "Period 4",
                  "time": [
                    {
                      "start_time": "9AM",
                      "end_time": "10AM"
                    }
                  ]
                },
                {
                  "time_table_day": "Tuesday",
                  "time_table_period": "Period 4",
                  "time": [
                    {
                      "start_time": "9AM",
                      "end_time": "10AM"
                    }
                  ]
                },
                {
                  "time_table_day": "Wednesday",
                  "time_table_period": "Period 4",
                  "time": [
                    {
                      "start_time": "9AM",
                      "end_time": "10AM"
                    }
                  ]
                }
              ],
              "rooms": [
                {
                  "room_number": "Room A"
                },
                {
                  "room_number": "Room A"
                },
                {
                  "room_number": "Room B"
                }
              ]
            }
          ]
        }
      ],
      "links": {
        "self": "http://sandbox.graph.hmhco.com/v4/rosters",
        "first": "http://sandbox.graph.hmhco.com/v4/rosters",
        "last": "http://sandbox.graph.hmhco.com/v4/rosters"
      }
    }
    @api = api
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

        # create pdf object
        pdf = PDF::Reader.new(params[:syllabus][:up_load].tempfile)
        # new string variable
        # str = String.new
        # set string to blod of text from pages
        str = pdf.page(1).text
        # scrub string and turn to json
        str.scrub!

        bool = system("curl --request POST --url http://52.5.47.112:8080/ --header 'cache-control: no-cache' --header 'content-type: application/json' --header 'postman-token: e58dd45c-3985-2e19-4648-111a702f1f12' --data '#{str}'")

        # byebug

        if bool
          res = `curl --request POST --url http://52.5.47.112:8080/ --header 'cache-control: no-cache' --header 'content-type: application/json' --header 'postman-token: e58dd45c-3985-2e19-4648-111a702f1f12' --data '#{str}'`
          # res = {:topics=>[{:topic=>"Introduction to Functions and Polynomials", :tags=>["Function", "Polynomial"]}, {:topic=>"Equations and Factoring", :tags=>["Equation", "Factoring"]}, {:topic=>"Quadratic and Exponential Functions", :tags=>["Quadratic Function", "Exponent", "Function"]}], :title=>"Mrs. Johnson's Algebra II Class"}
          res = JSON.parse(res, symbolize_names: true)

          @syllabus.update_attributes(course_name: res[:title])
          res[:result].each do |topic|

            @t = Topic.find_or_create_by(name: topic[:topic])
            @t.update_attributes(date: topic[:date])

            topic[:tags].each do |tag|
              tagg = Tag.find_or_create_by(name: tag)

              if tagg.save
                @t.tags << tagg
              end

            end
            @t.save
            @syllabus.topics << @t
          end
        end

        # {:topics=>[{:topic=>"Introduction to Functions and Polynomials", :tags=>["Function", "Polynomial"]}, {:topic=>"Equations and Factoring", :tags=>["Equation", "Factoring"]}, {:topic=>"Quadratic and Exponential Functions", :tags=>["Quadratic Function", "Exponent", "Function"]}], :title=>"Mrs. Johnson's Algebra II Class"}
        #   @syllabus.topics << topics_arr
        #

        # convert pdf to text
        # send prem text blob
        # json_obj = {x: 1}
        # json_obj = json_obj.to_json
        # get response and create topics / tags

        format.html { redirect_to @syllabus, notice: 'Syllabus was successfully created.' }
        # format.html { redirect_to @syllabus.as_json(:include => {:topics => {:include => {:tags => {:include => :problems}}}}), notice: 'Syllabus was successfully created.' }
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
