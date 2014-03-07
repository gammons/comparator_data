class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @attributes = Attribute.all
    respond_to do |format|
      format.html { render action: 'index'}
      format.json do

        json = []
        item_data = Item.all.map do |item|
          attrs = item.item_attributes.merge(id: item.id)
          ret = {}
          attrs.each do |k,v|
            attr = Attribute.where(key: k).first
            next if attr.nil?
            case attr.format
            when 'number', 'currency'
              if i = v.index('.') and i >= 0
                ret[k] = v.to_f
              else
                ret[k] = v.to_i
              end
            else
              ret[k] = v
            end
          end
          json << ret
        end

        j = {
          header: Attribute.all,
          data: json
        }
        render json: j
      end
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  def json
  end

  # GET /items/new
  def new
    @item = Item.new
    @item.item_attributes = {}
    @attributes = Attribute.all
  end

  # GET /items/1/edit
  def edit
    @attributes = Attribute.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      @item.item_attributes = params[:item_attributes]
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      @item.item_attributes = params[:item_attributes]
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def item_params
    #   params.require(:item).permit(:attributes)
    # end
end
