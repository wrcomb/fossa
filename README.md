# fossa

Migration plan on Fossa

## Step 1 - install ansible

`ansible.sh` install ansible into pyenv-virtualenv. Just run it `./ansible.sh`

## Step 2 - apply the ansible playbook

Apply the playbook
```
pyenv activate ansible
ansible-playbook step2.yml -K
```
