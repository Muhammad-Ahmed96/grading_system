class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :add_assessment, :enrolled_students, :add_student, :remove_student, :new_student, :view_course_details]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.where(user_id: current_user.id)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  def add_assessment
    if @course.assessments.present?
      @course.assessments
    else
      @course.assessments.build
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def enrolled_students
    @students = @course.users
  end

  def new_student
    @students = User.where(user_type: 0).includes(:courses)
  end

  def add_student
    @enrolled = EnrolledCourse.create(user_id: params[:student_id], course_id: @course.id)
  end

  def remove_student
    @enrolled=EnrolledCourse.where(user_id: params[:student_id], course_id: @course.id).first
    @enrolled.destroy
    flash[:notice] = 'Student Removed Successfully.'
    redirect_to enrolled_students_path(id: @course.id)
  end

  def view_course_details
    @assessments = @course.assessments
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:code, :name, :semester, :catalog_data, :user_id,
        assessments_attributes: [:id, :name, :weight, :_destroy]) #without id it will insert record 2 times
    end
end
