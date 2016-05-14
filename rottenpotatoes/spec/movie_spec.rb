require 'rails_helper'

describe Movie do


  it "#similar returns movies withe the same director" do
    movie1 = Movie.create!(title: "Movie 1", director: "Woody")
    movie2 = Movie.create!(title: "Movie 2", director: "Woody")
    movie3 = Movie.create!(title: "Movie 3", director: "Stanley")
    movie4 = Movie.create!(title: "Movie 4", director: "Quentin")

    expect(movie1.similar).to eq([movie1, movie2])
  end


end