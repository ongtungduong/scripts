# Update APT index to refresh the system packages
sudo apt update -y

# Enable PostgreSQL official package repository
echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Import the GPG signing key for the repository. Do this by running the following command.
wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null

# Update the system packages so that the changes above can take effect.
sudo apt update -y

# Install the PostgreSQL Database Client.
# sudo apt install postgresql-client -y

# Install the PostgreSQL Database Server.
sudo apt install postgresql -y
