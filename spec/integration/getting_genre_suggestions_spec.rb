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

end
