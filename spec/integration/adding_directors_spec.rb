RSpec.describe "Adding directors", :integration do

  context "adding movie and single director" do
    context "valid input" do
      let!(:output){ run_movies_with_input("4", "Anchorman", "Here is a short plot summary...", "Comedy", "Judd Apatow") }

      it "should add a movie record" do
        expect(Movie.count).to eql 1
      end

      it "should create genre_detail records" do
        expect(DirectorDetail.count).to eql 1
      end

      it "should create genre records" do
        expect(Director.count).to eql 1
      end

      it "should save the movie genres accurately" do
        expect(Movie.last.directors.count).to eql 1
        expect(Movie.last.directors[0].name).to include("Judd Apatow")
      end

      it "should print a success message" do
        expect(output).to include("Movie has been added to the database.")
      end
    end
  end

  context "adding movie and multiple directors" do
    context "valid input" do
      let!(:output){ run_movies_with_input("4", "The Hobbit", "Here is a short plot summary...", "Fantasy, Action", "Peter Jackson, Andy Serkis") }

      it "should add a movie record" do
        expect(Movie.count).to eql 1
      end

      it "should create genre_detail records" do
        expect(DirectorDetail.count).to eql 2
      end

      it "should create genre records" do
        expect(Director.count).to eql 2
      end

      it "should save the movie genres accurately" do
        expect(Movie.last.directors.count).to eql 2
        expect(Movie.last.directors[0].name).to include("Peter Jackson")
        expect(Movie.last.directors[1].name).to include("Andy Serkis")
      end

      it "should print a success message" do
        expect(output).to include("Movie has been added to the database.")
      end
    end
  end

end
