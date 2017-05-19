class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    binding.pry

    merchant_id = 'A3QCQLYZKBHFRS'
    access_key = 'AKIAJ7QFPDNE5WCULPAQ'
    secret_key = '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'

    client = PayWithAmazon::Client.new(
      merchant_id,
      access_key,
      secret_key,
      sandbox: true,
      currency_code: :jpy,
      region: :jp
    )

    amazon_order_reference_id = params[:order_reference_id]
    amount = 10

    binding.pry
    res = client.set_order_reference_details(
      amazon_order_reference_id,
      amount,
      seller_note: 'Lorem ipsum dolor',
      seller_order_id: '5678-23',
      store_name: 'CourtAndCherry.com',
      mws_auth_token: 'amzn.mws.4ea38b7b-f563-7709-4bae-87aeaEXAMPLE'
    )

    binding.pry
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
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
      params.require(:user).permit(:name, :login_id, :role_id, :password, :password_confirmation)
    end
end
