RSpec.describe "Listing Movies", :integration do
  context "all movies in the database" do
    # let!(:movie1){ run_movies_with_input("4", "Thor", "Here is a short plot...", "genre", "director") }
    # let!(:movie2){ run_movies_with_input("4", "Iron Man", "Here is a short plot...", "genre", "director") }
    # let!(:movie3){ run_movies_with_input("4", "Captain America", "Here is a short plot...", "genre", "director") }
    # let!(:movie4){ run_movies_with_input("4", "The Incredible Hulk", "Here is a short plot...", "genre", "director") }
    # let!(:movie5){ run_movies_with_input("4", "The Avengers", "Here is a short plot...", "genre", "director") }

    before do
      run_movies_with_input("4", "Thor", "Here is a short plot...", "genre", "director")
      run_movies_with_input("4", "Iron Man", "Here is a short plot...", "genre1, genre2", "director")
      run_movies_with_input("4", "Captain America", "Here is a short plot...", "genre", "director")
      run_movies_with_input("4", "The Incredible Hulk", "Here is a short plot...", "genre", "director")
      run_movies_with_input("4", "The Avengers", "Here is a short plot...", "genre", "director")
    end

    it "should print the main menu items" do
      actual = run_movies_with_input('3')
      expected = "1. Thor\n" +
                 "2. Iron Man\n" +
                 "3. Captain America\n" +
                 "4. The Incredible Hulk\n" +
                 "5. The Avengers\n"
      expect(actual).to include(expected)
    end

    it "should show the details for a movie" do
      actual = run_movies_with_input('3', '2')
      expected = "IRON MAN\n" +
                 "========================\n" +
                 "Genre(s): genre1, genre2\n" +
                 "Director(s): director\n" +
                 "Plot Summary:\n" +
                 "Here is a short plot...\n"
      expect(actual).to include(expected)
    end

    context "invalid input - letters" do
      let(:output){ run_movies_with_input("3", "asdf") }

      it "should print an error message" do
        expect(output).to include("I don't know the 'asdf' command.")
      end
    end

    context "invalid input - number not in the list" do
      let(:output){ run_movies_with_input("3", "8") }

      it "should print an error message" do
        expect(output).to include("That number is not in the list")
      end
    end
  end
end
