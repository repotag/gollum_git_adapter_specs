require 'spec_helper'

describe Gollum::Git::Repo do

  subject(:repo) { Gollum::Git::Repo.new(fixture('dot_bare_git'), is_bare: true) }

  it "has a Gollum::Git::Repo::init_bare method" do
    expect(Gollum::Git::Repo).to respond_to(:init_bare)
  end
  
  it "has a path method" do
    expect(repo).to respond_to(:path)
  end

  it "returns a Gollum::Git::Git object for Repo#git" do
    expect(repo.git).to be_a Gollum::Git::Git
  end

  it "returns an array of Gollum::Git::Commit objects for Repo#commits" do
    expect(repo.commits).to be_a Array
    repo.commits.each{|commit| expect(commit).to be_a Gollum::Git::Commit}
  end

  it "returns a Gollum::Git::Ref object for Repo#head" do
    expect(repo.head).to be_a Gollum::Git::Ref
  end

  it "returns an array of Gollum::Git::Commit objects for log" do
    expect(repo).to respond_to(:log).with(3).arguments
    expect(repo.log.first).to be_a Gollum::Git::Commit
  end

  it "has a diff method" do
    (2..3).each{|i| expect(repo).to respond_to(:diff).with(i).arguments}
  end

end
