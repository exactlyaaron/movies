RSpec.describe "Getting suggestions based on director", :integration do
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
      run_movies_with_input("4", "Snatch", "Here is a short plot...", "action, crime", "Guy Ritchie")
      run_movies_with_input("4", "Revolver", "Here is a short plot...", "action", "Guy Ritchie")
      run_movies_with_input("4", "RockNRolla", "Here is a short plot...", "crime, action", "Guy Ritchie")
      run_movies_with_input("4", "Enter the Dragon", "Here is a short plot...", "martial arts, crime", "director")
      run_movies_with_input("4", "Ong Bak", "Here is a short plot...", "martial arts", "director")
      run_movies_with_input("4", "Ninja Assassin", "Here is a short plot...", "martial arts, ninja, thriller", "director")
      run_movies_with_input("4", "Flubber", "Here is a short plot...", "comedy", "director")
    end

    context "valid input" do
      let!(:output){ run_movies_with_input("2", "1", "Guy Ritchie") }

      it "should give three movies" do
        expect(output).to include("Here are suggestions based on your input of 'Guy Ritchie'")
      end
    end

  end

end
