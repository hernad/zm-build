
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

#DEPLOY_TASK=--task=ALL
#DEPLOY_TASK=--task=DEPLOY

BUILD_NO=32020

./build.pl $DEPLOY_TASK --build-no=$BUILD_NO --build-ts=`date +'%Y%m%d%H%M%S'` \
  --build-release=DEVETKA --build-release-no=9.0.0 \
  --build-release-candidate=GA --build-type=FOSS \
  --build-thirdparty-server=files.zimbra.com --no-interactive


