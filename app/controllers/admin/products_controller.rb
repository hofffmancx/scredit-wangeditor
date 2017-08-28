class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :admin_required
  layout "admin"

  # ---CRUD---

  def index
    @products = Product.all.order("position ASC").paginate(:page => params[:page], :per_page => 5)       # 按照制定顺序排序
  end

  def show
    @product = Product.find(params[:id])
    @projects = @product.projects
  end

  def new
    @product = Product.new
    @country_categories = CountryCategory.all.map { |c| [c.title, c.id] }
  end

  def create
    @product = Product.new(product_params)
    @product.country_category_id = params[:country_category_id]

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @country_categories = CountryCategory.all.map { |c| [c.title, c.id] }
  end

  def update
    @product = Product.find(params[:id])
        @product.country_category_id = params[:country_category_id]
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      redirect_to admin_products_path
  end


  # ---后台排序按钮功能---

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to :back
  end


  # ---admin权限---

  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "你没有管理员权限!"
    end
  end


  # ---private---

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :particulars, :category, :yieldly, :courseimg,:country_category_id)
  end

end
