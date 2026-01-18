require "rails_helper"

describe V1::ContactsController, type: :controller do
  it "request index returns success  (200)" do
    request.accept = "application/vnd.api+json"
    get :index
    expect(response).to have_http_status(:ok)
  end

  it "request without accept header returns error (406)" do
    get :index
    expect(response.status).to eq(406)
  end

  it "GET v1/contacts/:id" do
    contact = Contact.first
    request.accept = "application/vnd.api+json"
    get :show, params: { id: contact.id }
    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response.fetch(:data).fetch(:id)).to eq(contact.id.to_s)
    expect(json_response.fetch(:data).fetch(:type)).to eq("contacts")
    expect(json_response.fetch(:data).fetch(:attributes).fetch(:name)).to eq(contact.name)
    expect(json_response.fetch(:data).fetch(:attributes).fetch(:email)).to eq(contact.email)
    expect(json_response.fetch(:data).fetch(:attributes).fetch(:birthdate)).to eq(contact.birthdate.to_time.iso8601)
  end
end
