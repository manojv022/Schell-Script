#### User's creation:
#!/bin/bash

# Script to automatically create a new user

# Prompt for the username
read -p "Enter the username you want to create: " username

# Check if the username already exists
if id "$username" &>/dev/null; then
    echo "Error: User '$username' already exists."
    exit 1
fi

# Prompt for the user's password (optional)
read -sp "Enter password for $username: " password
echo

# Create the new user
sudo useradd -m -s /bin/bash "$username"

# Set the password for the user
echo "$username:$password" | sudo chpasswd

# Optionally, add the user to the sudo group (uncomment if needed)
# sudo usermod -aG sudo "$username"

# Optionally, set up SSH directory and key-based authentication
# sudo mkdir -p /home/$username/.ssh
# sudo chown $username:$username /home/$username/.ssh
# sudo chmod 700 /home/$username/.ssh

# Inform the admin that the user has been created
echo "User '$username' has been successfully created."

# Display user details
id "$username"
