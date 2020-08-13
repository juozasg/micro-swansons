require "../config/application"

# This file is for setting up your seeds.
#
# To run seeds execute `amber db seed`

# Example:
# User.create(name: "example", email: "ex@mple.com")

# require "../src/models/**"
Message.create!(protocol: "grpc", sender: "mojo jojo", body: "listen up!", sent_at:Time.local, received_at: Time.local)