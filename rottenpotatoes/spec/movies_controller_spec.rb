require 'rails_helper'

describe MoviesController, :type => :controller  do

  before do
    @movie_with_director = Movie.create!(title: "My Movie", director: "Rafa")
    @movie_without_director = Movie.create!(title: "My other Movie")
  end
  
  it "when the movie has director info" do
    get :similar, id: @movie_with_director
    expect(response).to render_template(:similar_movies)
  end

  it "when the movie has no director info" do
    get :similar, id: @movie_without_director
    expect(response).to redirect_to(movies_path)
  end

  it "should get index with title" do
    get :index, sort: "title"
    response.should be_redirect
  end

  it "should get index with release date" do
    get :index, sort: "release_date"
    response.should be_redirect
  end

  it "should get new" do
    get :new
    expect(response).to render_template(:new)
  end

  it "should get show" do
    get :show, id: @movie_with_director
    expect(response).to render_template(:show)
  end

  it "should destroy" do
    post :destroy, id: @movie_with_director
    expect(response).to redirect_to(movies_path)
  end

  it "should update" do
    post :update, id: @movie_with_director, movie: {title: "another movie!"}
    expect(response).to redirect_to(movie_path(@movie_with_director))
  end


end