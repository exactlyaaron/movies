RSpec.describe "Adding movies", :integration do
  context "adding movie name" do
    context "valid input" do
      let!(:output){ run_movies_with_input("4", "Speed Racer") }

      it "should add a record" do
        expect(Movie.count).to eql 1
      end
      it "should save the record accurately" do
        expect(Movie.last.name).to eql "Speed Racer"
      end
      it "should print a success message" do
        expect(output).to include("Movie has been added to the database.")
      end
    end

    context "invalid input" do
      let(:long_string){ "foo" * 12 }
      let!(:output){ run_movies_with_input("4", long_string) }

      it "prints the error message for the type of invalid input" do
        expect(output).to include("Name must be less than 30 characters")
      end
      it "shouldn't save the new record" do
        expect(Movie.count).to eql 0
      end
    end
  end

  context "adding movie name and plot" do
    context "valid input" do
      let!(:output){ run_movies_with_input("4", "Rush Hour", "Here is a short plot summary...") }

      it "should add a record" do
        expect(Movie.count).to eql 1
      end

      it "should save the record accurately" do
        expect(Movie.last.name).to eql "Rush Hour"
        expect(Movie.last.plot).to eql "Here is a short plot summary..."
      end

      it "should print a success message" do
        expect(output).to include("Movie has been added to the database.")
      end
    end
  end
end
