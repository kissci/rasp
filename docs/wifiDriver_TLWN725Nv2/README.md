# Install 
A kernelhez megfelelő drivert kell megkeresni.

```
wget https://dl.dropboxusercontent.com/u/80256631/8188eu-20131219.tar.gz
tar -zxvf 8188eu-20131219.tar.gz
sudo install -p -m 644 8188eu.ko /lib/modules/3.6.XX+/kernel/drivers/net/wireless
sudo insmod /lib/modules/3.6.XX+/kernel/drivers/net/wireless/8188eu.ko
sudo depmod -a
```