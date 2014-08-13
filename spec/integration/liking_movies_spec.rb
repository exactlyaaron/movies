RSpec.describe "Liking movies", :integration do
  context "specifying a movie as liked" do
    let!(:movie1){ run_movies_with_input("4", "Twilight", "Here is a short plot...", "fantasy, romance", "someone") }
    let!(:movie2){ run_movies_with_input("4", "Snatch", "Here is a short plot...", "action, crime", "Guy Ritchie") }
    let!(:output){ run_movies_with_input("3", "2", "y") }

    it "should mark the movie as liked" do
      expect(Movie.where(name: 'Snatch').first.liked).to eq 1
    end

    it "should print a confirmation message" do
      expect(output).to include("Congrats, Snatch was added to your 'liked' list.")
    end

    it "should not have altered other movies" do
      expect(Movie.where(name: 'Twilight').first.liked).to eq 0
    end
  end

  context "specifying a movie as not liked" do
    let!(:movie1){ run_movies_with_input("4", "Twilight", "Here is a short plot...", "fantasy, romance", "someone") }
    let!(:output){ run_movies_with_input("3", "1", "n") }

    it "should not mark the movie as liked" do
      expect(Movie.last.liked).to eq 0
    end

  end

  context "updating a movie's liked status" do
    let!(:movie2){ run_movies_with_input("4", "Snatch", "Here is a short plot...", "action, crime", "Guy Ritchie") }
    let!(:output){ run_movies_with_input("3", "1", "y") }
    let!(:output2){ run_movies_with_input("3", "1", "n") }

    it "should tell if a movie has already been liked" do
      expect(output2).to include("You like the movie, Snatch")
    end

    it "should update the liked status if 'n' is selected" do
      expect(Movie.last.liked).to eq 0
    end
  end

  context "showing liked movies" do
    let!(:movie1){ run_movies_with_input("4", "Thor", "Here is a short plot...", "genre", "director") }
    let!(:movie2){ run_movies_with_input("4", "Iron Man", "Here is a short plot...", "genre1, genre2", "director") }
    let!(:movie3){ run_movies_with_input("4", "Captain America", "Here is a short plot...", "genre", "director") }
    let!(:movie4){ run_movies_with_input("4", "The Incredible Hulk", "Here is a short plot...", "genre", "director") }
    let!(:movie5){ run_movies_with_input("4", "The Avengers", "Here is a short plot...", "genre", "director") }
    let(:output){ run_movies_with_input("1") }

    before do
      run_movies_with_input("3", "1", "y")
      run_movies_with_input("3", "2", "y")
      run_movies_with_input("3", "3", "y")
    end

    it "should print the movies that have been liked" do
      expected = "1. Thor\n" +
                 "2. Iron Man\n" +
                 "3. Captain America\n"
      expect(output).to include(expected)
    end
  end
end
