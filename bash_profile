if [ -f ~/.bashrc ]; then
source ~/.bashrc
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
      . /opt/local/etc/profile.d/bash_completion.sh
fi
# MacPorts Installer addition on 2014-11-25_at_20:22:18: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
