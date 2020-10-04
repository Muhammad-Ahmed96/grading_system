class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy, :view_grades, :delete_user, :show_user,:view_grades_details]
  def index
    @users = User.where(user_type: 0)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User updated successfully..."
      redirect_to users_path
    else
      render :edit
    end
  end

  def view_grades
    @course = Course.find(params[:course_id]);
    @assessments = @course.assessments
    @assessments.each do |as|
      AssessmentGrade.find_or_create_by(assessment_id: as.id, user_id: @user.id);
    end
    @as_grades = @user.assessment_grades.where(assessment_id: @assessments.pluck(:id)).order("assessment_grades.created_at")
  end

  def view_grades_details
    @course = Course.find(params[:course_id]);
    @assessments = @course.assessments
    @assessments.each do |as|
      AssessmentGrade.find_or_create_by(assessment_id: as.id, user_id: @user.id);
    end
    @as_grades = @user.assessment_grades.where(assessment_id: @assessments.pluck(:id)).order("assessment_grades.created_at")
  end

  def save_grades
    if params[:q][:grades].present?
      params[:q][:grades].each do |p|
        as_grade = AssessmentGrade.find_by(user_id: params[:q][:assessment][:user_id], assessment_id: p[0])
        as_grade.update(grade: p[1]) if as_grade.present?
      end
    end
    flash[:notice] = 'Grades updated successfully...'
    redirect_to enrolled_students_path(params[:q][:assessment][:course_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def delete_user
    @user.destroy
    flash[:notice] = 'User deleted successfully...'
    redirect_to users_path
  end

  def show_user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :user_type, :email, :password)
  end
end
