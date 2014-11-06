class CategoriesController < ActionController::Base

  def add
  end

  def create
    file = params[:file]
    contents = Spreadsheet.open file.path
    sheet = contents.worksheet 0

    Category.delete_all
    Catsubreddit.delete_all
    sheet.each do |row|
      row.each_with_index do |item, index|
        puts index
        if index == 0
          Category.find_or_create_by(:name => item.to_s)
        end

        if index != 0
          category = Category.find_by_name(row[0].to_s)
            item_string = item.to_s
            puts item_string
            url = "/r/#{item_string}/"
          Catsubreddit.find_or_create_by(:name => item.to_s, :category_id => category.id, :url => url)
        end
      end
    end
  end

  def get_categories
    categories = []
    Category.find_each do |category|
     category_with_subreddits =  {:category => category, :subreddits => category.catsubreddits}
      categories << category_with_subreddits
    end

    respond_to do |format|
      msg = { :allCategories => categories }
      format.json  { render :json => msg } 
    end 
  end
end

