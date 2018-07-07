
def assert_eq value, expected
  expect(value).to eq expected
end

RSpec.describe SpookyHashV2 do

  specify 'gem version' do
    expect(SpookyHashV2::VERSION).not_to be nil
  end

  specify 'spooky version' do
    assert_eq SpookyHashV2.spooky_version, 'V2'
  end

end

text_empty = ''
text_short = 'foo'
text_long  = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'

RSpec.describe 'hash128' do

  specify 'validate input' do
    expect { SpookyHashV2.hash128      }.to raise_error ArgumentError
    expect { SpookyHashV2.hash128(nil) }.to raise_error TypeError
    expect { SpookyHashV2.hash128(1)   }.to raise_error TypeError
    expect { SpookyHashV2.hash128('')  }.not_to raise_error
  end

  specify 'hash short' do
    assert_eq SpookyHashV2.hash128(text_empty), '8b72ee65b4e851c7232706fc6bf50919'
    assert_eq SpookyHashV2.hash128(text_short), '551cd7274e8402267f843a73314fcf27'
  end

  specify 'hash padded' do
    assert_eq SpookyHashV2.hash128('test'), '0b6f98a8d5ffac607b01e8bcec0d8b75'
  end

  specify 'hash long' do
    assert_eq SpookyHashV2.hash128(text_long), '28a050be9b171a5bb6e1542b9044ed66'
  end

end

RSpec.describe 'hash64' do

  specify 'validate input' do
    expect { SpookyHashV2.hash64      }.to raise_error ArgumentError
    expect { SpookyHashV2.hash64(nil) }.to raise_error TypeError
    expect { SpookyHashV2.hash64(1)   }.to raise_error TypeError
    expect { SpookyHashV2.hash64('')  }.not_to raise_error
  end

  specify 'hash short' do
    assert_eq SpookyHashV2.hash64(text_empty), '232706fc6bf50919'
    assert_eq SpookyHashV2.hash64(text_short), '7f843a73314fcf27'
  end

  specify 'hash padded' do
    assert_eq SpookyHashV2.hash64('test000026'), '0c1b2b3ba63f3e46'
  end

  specify 'hash long' do
    assert_eq SpookyHashV2.hash64(text_long), 'b6e1542b9044ed66'
  end

end

RSpec.describe 'hash32' do

  specify 'validate input' do
    expect { SpookyHashV2.hash32      }.to raise_error ArgumentError
    expect { SpookyHashV2.hash32(nil) }.to raise_error TypeError
    expect { SpookyHashV2.hash32(1)   }.to raise_error TypeError
    expect { SpookyHashV2.hash32('')  }.not_to raise_error
  end

  specify 'hash short' do
    assert_eq SpookyHashV2.hash32(text_empty), '6bf50919'
    assert_eq SpookyHashV2.hash32(text_short), '314fcf27'
  end

  specify 'hash padded' do
    assert_eq SpookyHashV2.hash32('test000005'), '058d37c4'
  end

  specify 'hash long' do
    assert_eq SpookyHashV2.hash32(text_long), '9044ed66'
  end

end
