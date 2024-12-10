# Management DHCP server using puppet

1. **Install Puppet server**
- For this, the follow server is using:
  - Puppet v8

2. **Install DHCP server**
```bash
dnf install dhcpd-server
```
3. **Configure the YAML files**

We have 2 files: common.yaml and dhcp_config.yaml

![image](https://github.com/user-attachments/assets/8b322228-0f15-47e1-b18c-7e69fc9ed9ee)

They have all the necessary dhcp parameters for a basic dhcp server, It is possible to change it if you want.  

4. **Add or remove hosts**

In this file below, you can add/edit or remove hosts:

![image](https://github.com/user-attachments/assets/53267c5f-d56a-4a99-960e-60c8734cdeef)


4. **Run puppet**

initially, the dhcpd conf will not have anything as shown:

![image](https://github.com/user-attachments/assets/4544a9de-9f69-4c5d-8a42-5ec42c4e07ec)

```bash
puppet agent -t
```

![image](https://github.com/user-attachments/assets/1a18467b-8df1-4ce6-a353-acd666ea0ef6)

file /etc/dhcpd.conf

![image](https://github.com/user-attachments/assets/3bafbe40-655a-45a3-b506-d417b68d6178)


# Ideas
We have a class called `tftp` that manages the `tftp.service`. If you want to use it, just uncomment the class below:

![image](https://github.com/user-attachments/assets/049e6835-7d38-404a-9b24-eae7762e7586)

