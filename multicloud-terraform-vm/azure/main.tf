provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-rg"
  location = var.location
  
  tags = {
    Environment = "Terraform-Multicloud"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  
  tags = {
    Environment = "Terraform-Multicloud"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "tf-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "tf-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  tags = {
    Environment = "Terraform-Multicloud"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "tf-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  
  tags = {
    Environment = "Terraform-Multicloud"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_public_ip" "public_ip" {
  name                = "tf-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  
  tags = {
    Environment = "Terraform-Multicloud"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "tf-azure-vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = "Standard_B1s"
  admin_username        = var.admin_username
  network_interface_ids = [azurerm_network_interface.nic.id]
  
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  disable_password_authentication = true
  
  tags = {
    Environment = "Terraform-Multicloud"
    ManagedBy   = "Terraform"
  }
  
  lifecycle {
    prevent_destroy = false
  }
}
