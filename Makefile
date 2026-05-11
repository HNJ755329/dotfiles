
install:
	ansible-playbook install.yml

link:
	ansible-playbook link.yml

all:
	ansible-playbook install.yml
	ansible-playbook link.yml

check:
	ansible-playbook --check install.yml
	ansible-playbook --check link.yml

diff:
	ansible-playbook --diff install.yml
	ansible-playbook --diff link.yml
