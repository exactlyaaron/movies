RSpec.describe "Movies Main Menu", :integration do
  context "Prints a menu" do

    it "should print the main menu items" do
      actual = run_movies_with_input()
      expected = "1. My Liked Movies\n" +
                 "2. Get Suggestions\n" +
                 "3. Browse all movies\n" +
                 "4. Add a movie\n"
      expect(actual).to include(expected)
    end

    context "when we type an incorrect command" do
      let(:output){ run_movies_with_input('remove') }
      it "prints an informative message" do
        expect(output).to include("I don't know the 'remove' command.")
      end
    end
  end
end
