class PagesController < ApplicationController

    def home
    end

    def browse
        @region = Region.all
    end

end