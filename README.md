# fossa

Migration plan on Fossa

Log in into system. Open GNOME Terminal, Preferences, then increase and decrease "Initial termianl size" by one. Then:

```
cd fossa
source run.sh
```

## Step 1 - install ansible

This step installs ansible into `ansible` virtual environment:
```
source ansible.sh
```

## Step 2 - apply the ansible playbook

Apply the playbook without step3 tag
```
cd fossa && ansible-playbook step.yml -K --skip-tags step3
```
## Step 3 - apply the ansible playbook

Apply the playbook with step3 tag. Need to bash_it and linuxbrew
```
cd fossa && ansible-playbook step.yml -K -t step3
```

## TODO

 - [ ] Waiting https://download.docker.com/linux/ubuntu/dists/fossa
 - [ ] Waiting https://download.virtualbox.org/virtualbox/debian/dists/fossa
 - [ ] Create a GNOME Terminal profile dconf directory automatically

 ## Step 0

Configure bluetooth mouse
