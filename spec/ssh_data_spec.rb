describe "ssh_data" do
  it "can verify ssh-keygen generated signatures" do
    public_key = SSHData::PublicKey.parse_openssh(File.read("spec/fixtures/id_rsa.pub"))
    signature = SSHData::Signature.parse_pem(File.read("spec/fixtures/ssh-keygen-signature.txt"))
    claim = File.read("spec/fixtures/claim.txt")
    expect(signature.verify(claim)).to eq(true)
  end
end
