class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = current_user.doctors.all
  end

  def new
    @doctor = current_user.doctors.new
  end

  def create
    @doctor = current_user.doctors.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end

  end

  def show
  end

  def edit

  end

  def update

    if @doctor.update(doctor_params)
      redirect_to doctors_path
    else
      render :edit
    end

  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private
    def set_doctor
      @doctor = current_user.doctors.find(params[:id])
    end

    def doctor_params
      binding.pry
      params.require(:doctor).permit(:first_name, :last_name, :gender)
    end

end
