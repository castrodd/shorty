class SitesController < ApplicationController
    def index
      @site = Site.all
    end

    def new
      @site = Site.new
    end

    def show
      @site = Site.where({id: params['id'].to_i})
    end

    def create
      @site = Site.create(site_params)

      if @site.save
        redirect_to '/sites/:id'
      else
        redirect_to new_site_path
      end
    end

    private

    def site_params
      allow = [:name]
      params.require(:site).permit(allow)
    end
end
