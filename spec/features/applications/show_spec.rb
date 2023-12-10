require "rails_helper"

RSpec.describe "the application show page" do
  it "shows the application and all its attributes" do
    shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
    pet = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
    applicant = Application.create(name: "Shaggy", street_address: "123 Mystery Lane", city: "Irvine", state: "CA", zip_code: "91010", description: "Because Scoob and I love Scooby Snacks")

    visit "/applications/#{applicant.id}"

    expect(page).to have_content(applicant.name)
    expect(page).to have_content(applicant.street_address)
    expect(page).to have_content(applicant.city)
    expect(page).to have_content(applicant.state)
    expect(page).to have_content(applicant.zip_code)
    expect(page).to have_content(applicant.description)
  end

  # it "allows the user to delete a pet" do
  #   shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
  #   pet = Pet.create(name: "Scrappy", age: 1, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)

  #   visit "/pets/#{pet.id}"

  #   click_on("Delete #{pet.name}")

  #   expect(page).to have_current_path("/pets")
  #   expect(page).to_not have_content(pet.name)
  # end
end