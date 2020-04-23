# fossa

Migration plan on Fossa

## Step 1 - install ansible

This step installs ansible into `ansible` virtual environment:
```
cd fossa
. ansible.sh
```

## Step 2 - apply the ansible playbook

Apply the playbook
```
cd fossa
pyenv activate ansible
ansible-playbook step2.yml -K
```
