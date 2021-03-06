RSpec.describe Movie do
  context "validations" do
    it { should have_many(:genres).through(:genre_details) }
    it { should ensure_length_of(:name).
         is_at_most(30).
         with_message("must be less than 30 characters") }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).
          with_message("already exists") }

    # it { should validate_presence_of(:plot) }

    context "validating name format" do
      let!(:movie){ Movie.create(name: "12sadfkljasldkfj asdflkjsadflkjsadlfkjsdaf asldfkjsdf sdflakjdsflkjsdf") }

      it "should have an appropriate error message" do
        expect(movie.errors.full_messages_for(:name)
              ).to include("Name must be less than 30 characters")
      end

      it "shouldn't save the new record" do
        expect(Movie.count).to eq 0
      end
    end

    context "validating plot format" do
      let!(:movie){ Movie.create(name: "Test Movie") }

      it "should have an appropriate error message" do
        movie.update(plot: "")
        expect(movie.errors.full_messages_for(:plot)
              ).to include("Plot can't be blank")
      end
    end
  end
end
