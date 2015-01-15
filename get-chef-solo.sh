#!/usr/bin/env bash
rm -rf chef-solo
wget https://github.com/cmaxw/chef-solo/tarball/master
tar zxf master
mv cmaxw-chef-solo* chef-solo
rm master
cd chef-solo && ./install-cookbooks.sh
