describe "ssh-keygen" do
  it "generates a signature" do
    sig = File.read("spec/fixtures/ssh-keygen-signature.txt")
    `cd spec/fixtures && ssh-keygen -Y sign -n file -f id_rsa claim.txt`
    expect(File.read("spec/fixtures/claim.txt.sig")).to eq(sig)
    `rm spec/fixtures/claim.txt.sig`
  end
end
