RSpec.describe "Adding movies", :integration do
  context "valid input" do
    let!(:output){ run_movies_with_input("4", "Speed Racer") }

    it "should add a record" do
      expect(Movie.count).to eql 1
    end
    it "should save the record accurately" do
      expect(Movie.last.name).to eql "Speed Racer"
    end
    it "should print a success message" do
      expect(output).to include("Speed Racer has been added to the list of movies.")
    end
  end
  # context "invalid input" do
  #   let(:long_string){ "foo" * 12 }
  #   let!(:output){ run_zss_with_input("add", long_string) }
  #
  #   it "prints the error message for the type of invalid input" do
  #     expect(output).to include("Name must be less than 30 characters")
  #   end
  #   it "shouldn't save the new record" do
  #     expect(TrainingPath.count).to eql 0
  #   end
  # end
end
