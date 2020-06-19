
sudo dnf install -y rsync vim epel-release
#sudo dnf install -y the_silver_searcher

#read

sudo chown build -R zimbra

#[build@559a470a6714 zimbra]$ cat zm-build/instructions/FOSS_remote_list.pl 
#@ENTRIES = (
#   "gh-zm" => { 'url-prefix' => "https://github.com/Zimbra", },
#   "gh-ks" => { 'url-prefix' => "https://github.com/kohlschutter", },
#   "zm-ow"  => { 'url-prefix' => q{https://github.com/Zimbra}, },
#);


#git checkout 9.0.0.p4
#git diff 9.0.0.p4 patches > ../zm-build.diff

./build.pl --build-no=32000 --build-ts=`date +'%Y%m%d%H%M%S'` \
  --build-release=DEVETKA --build-release-no=9.0.0 \
  --build-release-candidate=GA --build-type=FOSS \
  --build-thirdparty-server=files.zimbra.com --no-interactive

#[build@5969425f687c zimbra]$ mkdir /home/build/zimbra/.staging/RHEL8_64-DEVETKA-900-20200617232114-FOSS-32000/zm-build/storebuild/opt/zimbra/lib/ext/convertd
#[build@5969425f687c zimbra]$ touch /home/build/zimbra/.staging/RHEL8_64-DEVETKA-900-20200617232114-FOSS-32000/zm-build/storebuild/opt/zimbra/lib/ext/convertd/dummy.txt

