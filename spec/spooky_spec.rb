RSpec.describe SpookyHashV2 do

  specify 'has gem version' do
    expect(SpookyHashV2::VERSION).not_to be nil
  end

  specify 'has spooky version' do
    expect(SpookyHashV2.spooky_version).to eq 'V2'
  end

end
