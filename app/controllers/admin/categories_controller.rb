class Admin::CategoriesController < Admin::BaseController
    def index
    end

    def new
     @category = Category.new
    end

    def create
      @category = Category.new(category_param)

      if @category.save
        redirect_to admin_categories_path, notice:"新增分類成功"
      else
      end  
    end
    private
    def category_param
     params.require(:category).permit(:name)
    end
end
