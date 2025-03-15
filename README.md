# Managing DHCP Server with Puppet

This module provides a comprehensive solution to manage ISC DHCP servers using Puppet automation. It handles installation, configuration, and service management for reliable and scalable DHCP deployments.

## Module Structure

The module follows standard Puppet structure:

```
dhcp/
├── README.md
├── manifests/
│   ├── init.pp        # Main class for DHCP server management
│   └── config.pp      # Configuration class for DHCP settings
├── templates/
│   └── dhcpd.conf.epp # Template for generating dhcpd.conf
└── data/
    ├── dhcp_config.yaml # Global DHCP configuration
    └── hosts.yaml       # Host reservation configuration
```

## Features

- **Dynamic and Static IP Assignment**: Configure both dynamic address pools and static host reservations
- **Network Configuration**: Easily manage multiple subnets and network segments
- **Host Reservations**: Reserve specific IPs for devices based on MAC addresses
- **Data-Driven Configuration**: Use Hiera for flexible data configuration
- **Service Management**: Automatic management of the DHCP service

## Usage

### Basic Usage

```puppet
include dhcp
```

### Configuration

The module uses Hiera for data configuration. Example data structure:

```yaml
dhcp:
  domain_name: 'example.com'
  domain_name_servers:
    - '192.168.1.10'
    - '192.168.1.11'
  default_lease_time: 3600
  max_lease_time: 86400
  networks:
    office:
      subnet: '192.168.1.0'
      netmask: '255.255.255.0'
      routers: '192.168.1.1'
      # Additional network configuration...
  hosts:
    printer01:
      mac: '00:11:22:33:44:55'
      ip: '192.168.1.50'
    # Additional host reservations...
```

## Requirements

- Puppet 6.x or higher
- Supported operating systems:
  - RHEL/CentOS 7, 8, 9
  - Debian 10, 11
  - Ubuntu 18.04, 20.04, 22.04

## Implementation Details

The module implements:

1. **Package Installation**: Installs the ISC DHCP server package
2. **Configuration Management**: Generates dhcpd.conf from templates
3. **Service Management**: Ensures the DHCP service is running
4. **Host Configuration**: Configures static mappings for hosts

## License

Apache License 2.0