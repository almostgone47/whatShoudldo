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
end
