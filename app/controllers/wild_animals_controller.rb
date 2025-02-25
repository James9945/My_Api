class WildAnimalsController < ApplicationController
    before_action :set_wild_animal, only: [:show, :update, :destroy]
    before_action :doorkeeper_authorize!, except: [:index, :show]

  
    # GET /wild_animals
    def index
      animals = WildAnimal.page(params[:page]).per(20)
      cached_data = Rails.cache.fetch("wild_animals_page_#{params[:page]}", expires_in: 12.hours) do
        animals.to_json
      end
      render json: cached_data
    end
  
    # GET /wild_animals/:id
    def show
      cached_animal = Rails.cache.fetch("wild_animal_#{@wild_animal.id}", expires_in: 12.hours) do
        @wild_animal.to_json
      end
      render json: cached_animal
    end
  
    # POST /wild_animals
    def create
      wild_animal = WildAnimal.new(wild_animal_params)
      if wild_animal.save
        Rails.cache.delete_matched("wild_animals_page_*") # Clear cached index pages
        render json: wild_animal, status: :created
      else
        render json: { errors: wild_animal.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /wild_animals/:id
    def update
      if @wild_animal.update(wild_animal_params)
        Rails.cache.delete("wild_animal_#{@wild_animal.id}")
        render json: @wild_animal
      else
        render json: { errors: @wild_animal.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /wild_animals/:id
    def destroy
      @wild_animal.destroy
      Rails.cache.delete("wild_animal_#{@wild_animal.id}")
      Rails.cache.delete_matched("wild_animals_page_*")
      head :no_content
    end
  
    private
  
    def set_wild_animal
      @wild_animal = WildAnimal.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Wild Animal not found' }, status: :not_found
    end
  
    def wild_animal_params
      params.require(:wild_animal).permit(:name, :scientific_name, :classification, :habitat, :diet, :conservation_status, :region)
    end
  end
  