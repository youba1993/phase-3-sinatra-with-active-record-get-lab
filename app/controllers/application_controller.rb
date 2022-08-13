class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get '/bakeries' do
      bakeries = Bakery.all
      bakeries.to_json
    end

    get '/bakeries/:id' do
       bakerie = Bakery.find(params[:id])
       bakerie.to_json(include: :baked_goods)
    end

    get '/baked_good/by_price' do
        baked_good = BakedGood.all.order(:price).reverse
        #baked_good = BakedGood.all.order(price: :desc)
        baked_good.to_json
    end

    get '/baked_goods/most_expensive' do
        baked_good = BakedGood.all.order(price: :desc).first
        baked_good.to_json
    end

end
