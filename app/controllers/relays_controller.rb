class RelaysController < ApplicationController

  # Line added to avoid the verification of the authenticity_token when
  # receiving the POST request back from the payment page.
  skip_before_action :verify_authenticity_token, only: [:create]

  before_action :set_relay, only: [:show, :edit, :update, :destroy]

  # GET /relays
  # GET /relays.json
  def index
    @relays = Relay.all
  end

  # GET /relays/1
  # GET /relays/1.json
  def show
  end

  # GET /relays/new
  def new
    @relay = Relay.new
  end

  # GET /relays/1/edit
  def edit
  end

  # POST /relays
  # POST /relays.json
  def create
    @relay = Relay.new(create_params)

    respond_to do |format|
      if @relay.save
        format.html { redirect_to @relay, notice: 'A new Register in Relay was successfully created.' }
        # The following line allows to render a specific HTTP status code (comment out the previous line to make it work and modify the http_status_page in the relays views with the right HTTP code)
        # "If you try to render content along with a non-content status code (100-199, 204, 205 or 304), it will be dropped from the response."
        # Source: http://guides.rubyonrails.org/layouts_and_rendering.html
        #format.html { render 'http_status_page.html.erb', status: 507 }
        format.json { render :show, status: :created, location: @relay }
      else
        format.html { render :new }
        format.json { render json: @relay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relays/1
  # PATCH/PUT /relays/1.json
  def update
    respond_to do |format|
      if @relay.update(relay_params)
        format.html { redirect_to @relay, notice: 'The Register in Relay was successfully updated.' }
        format.json { render :show, status: :ok, location: @relay }
      else
        format.html { render :edit }
        format.json { render json: @relay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relays/1
  # DELETE /relays/1.json
  def destroy
    @relay.destroy
    respond_to do |format|
      format.html { redirect_to relays_url, notice: 'Relay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relay
      @relay = Relay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # The create actions has different params due to the HCO relay feature
    def relay_params
      params.require(:relay).permit(:x_type, :x_login, :x_show_form, :x_tax_exempt, :x_zip, :exact_wsp_version, :x_auth_code, :x_ship_to_last_name, :x_fax, :x_company, :exact_issname, :x_amount, :x_description, :x_avs_code, :x_ship_to_company, :x_last_name, :x_method, :x_currency_code, :x_ship_to_first_name, :x_ship_to_state, :x_ship_to_city, :x_address, :x_freight, :exact_issconf, :x_fp_sequence, :x_first_name, :x_response_subcode, :x_invoice_num, :x_fp_timestamp, :x_response_code, :x_trans_id, :x_tax, :x_email, :x_city, :x_cvv2_resp_code, :x_country, :x_ship_to_country, :x_phone, :x_ship_to_address, :x_cavv_response, :x_response_reason_code, :x_duty, :x_reference_3, :exact_ctr, :x_cust_id, :x_po_num, :x_state, :x_ship_to_zip, :x_response_reason_text, :tax2_amount, :tax1_amount, :x_recurring_billing, :x_recurring_billing_id, :x_recurring_billing_amount)
    end

    # Specific params for create action, without "require"
    # These params allow the relay response to save to the DB
    def create_params
      params.permit(:x_type, :x_login, :x_show_form, :x_tax_exempt, :x_zip, :exact_wsp_version, :x_auth_code, :x_ship_to_last_name, :x_fax, :x_company, :exact_issname, :x_amount, :x_description, :x_avs_code, :x_ship_to_company, :x_last_name, :x_method, :x_currency_code, :x_ship_to_first_name, :x_ship_to_state, :x_ship_to_city, :x_address, :x_freight, :exact_issconf, :x_fp_sequence, :x_first_name, :x_response_subcode, :x_invoice_num, :x_fp_timestamp, :x_response_code, :x_trans_id, :x_tax, :x_email, :x_city, :x_cvv2_resp_code, :x_country, :x_ship_to_country, :x_phone, :x_ship_to_address, :x_cavv_response, :x_response_reason_code, :x_duty, :x_reference_3, :exact_ctr, :x_cust_id, :x_po_num, :x_state, :x_ship_to_zip, :x_response_reason_text, :tax2_amount, :tax1_amount)
    end
end
