Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Robbyrussell

$env:path += ";C:\Program Files\LLVM\bin"
$env:path += ";C:\Users\sanke\LocalBin"
$env:path += ";C:\Users\sanke\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.8_qbz5n2kfra8p0\LocalCache\local-packages\Python38\Scripts"

Set-Alias -Name vi -Value vim 
Set-Alias -Name grep -Value Select-String

# Git Aliases, adapted from
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh#L28
Set-Alias -Name  g -Value 'git'
function ga { git add @args }
function gaa  { git add --all @args }
function gapa  { git add --patch @args }
function gau  { git add --update @args }
function gav  { git add --verbose @args }
function gap  { git apply @args }
function gapt  { git apply --3way @args }
function gb { git branch @args }
function gba { git branch -a @args }
function gbd { git branch -d @args }
function gbda { git branch --no-color --merged | command grep -vE "^(\+|\*|\s*(master|development|develop|devel|dev)\s*$)" | command xargs -n 1 git branch -d @args }
function gbD { git branch -D @args }
function gbl { git blame -b -w @args }
function gbnm { git branch --no-merged @args }
function gbr { git branch --remote @args }
function gbs { git bisect @args }
function gbsb { git bisect bad @args }
function gbsg { git bisect good @args }
function gbsr { git bisect reset @args }
function gbss { git bisect start @args }
function gc { git commit -v --amend @args }
function gcn { git commit -v --no-edit --amend @args }
function gca { git commit -v -a @args }
function gca { git commit -v -a --amend @args }
function gcan { git commit -v -a --no-edit --amend @args }
function gcans { git commit -v -a -s --no-edit --amend @args }
function gcam { git commit -a -m @args }
function gcsm { git commit -s -m @args }
function gcb { git checkout -b @args }
function gcf { git config --list @args }
function gcl { git clone --recurse-submodules @args }
function gclean { git clean -id @args }
function gcd { git checkout develop @args }
function gcmsg { git commit -m @args }
function gco { git checkout @args }
function gcom { git checkout master @args }
function gcount { git shortlog -sn @args }
function gcp { git cherry-pick @args }
function gcpa { git cherry-pick --abort @args }
function gcpc { git cherry-pick --continue @args }
function gd { git diff @args }
function gdca { git diff --cached @args }
function gdcw { git diff --cached --word-diff @args }
function gdct { git describe --tags $(git rev-list --tags --max-count=1) @args }
function gds { git diff --staged @args }
function gdt { git diff-tree --no-commit-id --name-only -r @args }
function gdw { git diff --word-diff @args }
function glg { git log --stat @args }
function glgp { git log --stat -p @args }
function glgg { git log --graph @args }
function glgga { git log --graph --decorate --all @args }
function glgm { git log --graph --max-count=10 @args }
function glo { git log --oneline --decorate @args }
function glol { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' @args }
function glols { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat @args }
function glod { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' @args }
function glods { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short @args }
function glola { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all @args }
function glog { git log --oneline --decorate --graph @args }
function gloga { git log --oneline --decorate --graph --all @args }
function glp { _git_log_prettily @args }
