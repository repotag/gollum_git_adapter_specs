require 'spec_helper'

describe Gollum::Git::Ref do

  let(:repo) { Gollum::Git::Repo.new(fixture('dot_bare_git'), is_bare: true) }

  subject(:ref) { repo.head }

  it "has a name method" do
    expect(ref).to respond_to(:name)
  end

  it "returns a Gollum::Git::Commit for Ref#commit" do
    expect(ref.commit).to be_a Gollum::Git::Commit
  end

end