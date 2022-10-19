Rails.application.routes.draw do
  resources :movies, only: [:index, :create]

  def create 
    movie = Movie.create!(movie_params)
    render json: movie, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

end
