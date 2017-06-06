class PatientsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def show
  end

  def edit

  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end

  private
    def set_doctor
      @patient = Patient.find(params[:id])
    end

    def doctor_params
      params.require(:patient).permit(:first_name, :last_name, :race, :age, :gender, :insurance)
    end

end
