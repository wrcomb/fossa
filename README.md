# fossa

Migration plan on Fossa

## Step 1 - install ansible

This step installs ansible into `ansible` virtual environment:
```
cd fossa
. ansible.sh
```

## Step 2 - apply the ansible playbook

Log in into system. Open GNOME Terminal, Preferences, then increase and decrease "Initial termianl size" by one.

Apply the playbook
```
cd fossa
ansible-playbook step2.yml -K
```
## TODO

 - [ ] Waiting https://download.docker.com/linux/ubuntu/dists/fossa
 - [ ] Create a GNOME Terminal profile dconf directory automatically