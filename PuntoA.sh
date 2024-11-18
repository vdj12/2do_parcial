sudo fdisk /dev/sdc
n
p
1
<Enter>
<Enter>
+1G
w
sudo fdisk /dev/sdc
n
p
2
<Enter>
<Enter>
+1G
w
sudo fdisk /dev/sdc
n
p
3
<Enter>
<Enter>
+1G
w
sudo fdisk /dev/sdc
n
e
<Enter>
<Enter>
+3G
w
sudo fdisk /dev/sdc
n
l
<Enter>
+1.5G
w
sudo fdisk /dev/sdc
n
l
<Enter>
+1.5G
w
sudo fdisk /dev/sdc
t
1
82
w
sudo mkswap /dev/sdc1
sudo swapon /dev/sdc1
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6
sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 1G vgDevelopers -n lvTesters
sudo lvcreate -L 0.9G vgDevelopers -n lvDevops
sudo lvcreate -L 2G vgAdmin -n lvAdmin
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin
sudo mkdir /mnt/lvDevelopers /mnt/lvTesters /mnt/lvDevops /mnt/lvAdmin
sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops
sudo mount /dev/mapper/vgAdmin-lvAdmin /mnt/lvAdmin
sudo lsblk -f
df -h

