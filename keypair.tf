resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

# Generate a unique suffix for the key pair name
resource "random_id" "key_pair_suffix" {
  byte_length = 8
}

# Create the key pair with a unique name
resource "aws_key_pair" "key_pair" {
  key_name   = "dynamic-ssh-key-${random_id.key_pair_suffix.hex}"
  public_key = file("~/.ssh/id_rsa.pub")
}
output "private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}