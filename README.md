A  Vagrant setup to contribute to OpenStack documentation.
================
This vagrant setup will allow you to contribute to OpenStack documentation in a simple way.

Prerequsities-
* [An OpenStack.org Account](http://www.openstack.org)
* [A Gerrit Account ](https://review.openstack.org)
* You'll need to generate a SSH keypair for contributing and place them in this directory. 

	They need to be named 
~~~
id_rsa
id_rsa.pub
~~~
**I recommend generating keys just for this and not using your existing keys**

	You can generate them by running:
~~~
ssh-keygen -f id_rsa -t rsa -N ''
~~~

	Once you generate the keys, you need to add the 	public one to your account on gerrit:
	[https://review.openstack.org/#/settings/ssh-keys]	(https://review.openstack.org/#/settings/ssh-keys)

##### Gerrit Config
you need to edit the gitconfig.txt file in this directory and supply your name, email address and gerrit username
~~~
[user]
	name = Joe User
	email = username@domain.com

[gitreview]
    username=gerrituser
~~~

After that, you start this ubuntu VM with
~~~
vagrant up
~~~
as usual.

What happens is:
* The VM is booted up
* All the prerequisites are installed
* Your SSH keys are installed
* The git repository for the openstack manuals is cloned locally
* git review is setup with your gerrit account

Your local git repo is stored in /vagrant on the ubuntu machine so it means it is available in this directory here. 

You're now ready to contribute!

[Check out this link for the next steps](https://wiki.openstack.org/wiki/Documentation/HowTo/FirstTimers)

The key commands are:
* After assinging yourself a bug, creating a branch to work on it- where nnnnnn is the bug number
```
 	git checkout -b fix-bug-nnnnnn
```

* After editing the docs, you'll want to run the tests

```
 	tox -v
```

* If all the tests come back ok, you're ready to commit.
```
 	git commit -a
```

* Edit your commit message [following the guidelines](https://wiki.openstack.org/wiki/GitCommitMessages)
* Push your commit up to gerrit

```
 	git review -v
```

* It will output a url to your change where you can see it in gerrit