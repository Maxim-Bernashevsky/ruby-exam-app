class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # caches_action :index

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    # expires_in 5.minutes
    # sleep 15e

    @users = User.all_cached
    # @stats = Rails.cache.stats.first.last
  end

  # GET /users/1
  # GET /users/1.json
  # SERIALIZED !! FOR API DEMONSTRATION
  def show
    @total_user_values = Value.where("user_id = #{current_user.id}").count
    user = User.find(params[:id])

    res_composite_diag = Image.select([ :id,
                                        :name,
                                        :file,
                                        :ave_value,
                                        :theme_id,
                                        :value,
                                        :created_at]).joins("LEFT JOIN values ON values.image_id = images.id")
                             .where("user_id = #{current_user.id} AND
                                        value BETWEEN ave_value * 0.75 AND ave_value * 1.25")

    composite_results_size = res_composite_diag.size
    @composite_results = res_composite_diag.take(composite_results_size)
    @composite_results_paged = pages_of(@composite_results, 6)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        sign_in @user
        flash.now[:notice] = "Welcome to the Experteese - sample App!"
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash.now[:alert] = "Bad registration"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
