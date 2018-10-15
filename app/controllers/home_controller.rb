class HomeController < ApplicationController
    def index
        @home_page = true
        @events = Event.all
    end

    def interest
        @interests = {
            'Outdoors' => ['Cycling', 'Camping', 'Hiking', 'Fishing'],
            'Technology' => ['Crypto', 'SEO', 'E-Commerce'],
            'Health' => ['Fitness', 'Nutrition', 'Yoga'],
            'Education' => ['Math', 'Engineering', 'Science'],
            'Food & Drink' => ['Coffee', 'Vegan', 'Wine'],
        }
        @category = @interests.keys.each { |cat| cat }   
        @sub_category = @interests.values.each { |sub| sub } 
    end

    def search
        @events = Event.where(nil)
        @searched_results = @events.filter(filtering_params(params)).order(:updated_at)
        # @searched_results = @events.where("title ILIKE :search OR category ILIKE :search", {search: "%#{params[:search_fields]}%"})
        @category = @events.order(:category).distinct.pluck(:category)
        @date = @events.where(date: Date.today)

        respond_to do |format|
          format.html
          format.json { render json: @searched_results }
          format.js # remote: true is sent a js format and sends you to search.js.erb
        end
      end
    
      private

      def filtering_params(params)
        params.slice(:search_fields)
      end

end
