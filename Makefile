
install:
	ansible-playbook install.yml --ask-become-pass

install-check:
	ansible-playbook --check install.yml --ask-become-pass

install-diff:
	ansible-playbook --diff install.yml --ask-become-pass

link:
	ansible-playbook link.yml

link-check:
	ansible-playbook --check link.yml

link-diff:
	ansible-playbook --diff link.yml

all:
	ansible-playbook install.yml
	ansible-playbook link.yml

check:
	ansible-playbook --check install.yml
	ansible-playbook --check link.yml

diff:
	ansible-playbook --diff install.yml
	ansible-playbook --diff link.yml
