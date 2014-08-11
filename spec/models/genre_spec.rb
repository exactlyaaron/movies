RSpec.describe Genre do
  context "validations" do
    it { should have_many(:movies).through(:genre_details) }
    it { should ensure_length_of(:name).
         is_at_most(30).
         with_message("must be less than 30 characters") }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).
          with_message("already exists") }

    context "validating format" do
      let!(:genre){ Genre.create(name: "12sadfkljasldkfj asdflkjsadflkjsadlfkjsdaf asldfkjsdf sdflakjdsflkjsdf") }

      it "should have an appropriate error message" do
        expect(genre.errors.full_messages_for(:name)
              ).to include("Name must be less than 30 characters")
      end

      it "shouldn't save the new record" do
        expect(Genre.count).to eq 0
      end
    end
  end
end
