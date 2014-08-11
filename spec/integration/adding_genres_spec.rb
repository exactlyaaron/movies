RSpec.describe "Adding genres", :integration do

  context "adding movie and one genre" do
    context "valid input" do
      let!(:output){ run_movies_with_input("4", "Anchorman", "Here is a short plot summary...", "Comedy") }

      it "should add a movie record" do
        expect(Movie.count).to eql 1
      end

      it "should create genre_detail records" do
        expect(GenreDetail.count).to eql 1
      end

      it "should create genre records" do
        expect(Genre.count).to eql 1
      end

      it "should save the movie genres accurately" do
        expect(Movie.last.genres.count).to eql 1
        expect(Movie.last.genres[0].name).to include("Comedy")
      end

      it "should print a success message" do
        expect(output).to include("Movie has been added to the database.")
      end
    end
  end

  context "adding movie and two genres" do
    context "valid input" do
      let!(:output){ run_movies_with_input("4", "Rush Hour", "Here is a short plot summary...", "Action, Comedy") }

      it "should add a movie record" do
        expect(Movie.count).to eql 1
      end

      it "should create genre_detail records" do
        expect(GenreDetail.count).to eql 2
      end

      it "should create genre records" do
        expect(Genre.count).to eql 2
      end

      it "should save the movie genres accurately" do
        expect(Movie.last.genres.count).to eql 2
        expect(Movie.last.genres[0].name).to include("Action")
        expect(Movie.last.genres[1].name).to include("Comedy")
      end

      it "should print a success message" do
        expect(output).to include("Movie has been added to the database.")
      end
    end
  end

  context "adding movies that share one genre" do
    let!(:output){ run_movies_with_input("4", "Anchorman", "Here is a short plot summary...", "Comedy") }

    before do
      # movie1 = Movie.create(name: "Talladega Nights", plot: "Racing is where you go fast.")
      # genre1 = Genre.create(name: "Comedy")
      # movie1.genres << genre1
      # movie1.save
      run_movies_with_input("4", "Talladega Nights", "Here is a short plot summary...", "Comedy")
    end

    it "should add a movie record" do
      expect(Movie.count).to eql 2
    end

    it "should create only one genre record" do
      expect(Genre.count).to eql 1
    end

    it "should save the movie genres accurately" do
      expect(Movie.last.genres.count).to eql 1
      expect(Movie.last.genres[0].name).to include("Comedy")
    end

    it "should print a success message" do
      expect(output).to include("Movie has been added to the database.")
    end
  end

end
