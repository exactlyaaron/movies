RSpec.describe "Getting suggestions based on genre", :integration do
  context "showing suggestion list" do
    it "should print the suggestion menu items" do
      actual = run_movies_with_input("2")
      expected = "Get suggestions based on:\n" +
                 "1. Genre\n" +
                 "2. Director\n"

      expect(actual).to include(expected)
    end
  end

  context "showing movies based on input" do
    before do
      run_movies_with_input("4", "Thor", "Here is a short plot...", "action, viking, fantasy", "director")
      run_movies_with_input("4", "Iron Man", "Here is a short plot...", "action", "director")
      run_movies_with_input("4", "Ip Man", "Here is a short plot...", "martial arts", "director")
      run_movies_with_input("4", "Enter the Dragon", "Here is a short plot...", "martial arts, crime", "director")
      run_movies_with_input("4", "Ong Bak", "Here is a short plot...", "martial arts", "director")
      run_movies_with_input("4", "Ninja Assassin", "Here is a short plot...", "martial arts, ninja, thriller", "director")
      run_movies_with_input("4", "Flubber", "Here is a short plot...", "comedy", "director")
    end

    context "valid input" do
      let!(:output){ run_movies_with_input("2", "1", "martial arts") }

      it "should give three movies" do
        expect(output).to include("Here are suggestions based on your input of 'martial arts'")
      end
    end

  end

end
