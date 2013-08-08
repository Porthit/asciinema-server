require 'spec_helper'

describe "Asciicast upload" do
  it 'returns the URL to the uploaded asciicast' do
    post '/api/asciicasts', :asciicast => {
      :meta          => fixture_file_upload("spec/fixtures/meta.json", "application/json"),
      :stdout        => fixture_file_upload("spec/fixtures/stdout", "application/octet-stream"),
      :stdout_timing => fixture_file_upload("spec/fixtures/stdout.time", "application/octet-stream")
    }

    expect(response.body).to eq(asciicast_url(Asciicast.last))
  end
end
