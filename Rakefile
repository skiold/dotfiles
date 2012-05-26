require 'pathname'

dotfiles = FileList[
                   ".bash_profile",
                   ".bashrc",
                   ".bashrc.d/gitcircling.bash",
                   ".bashrc.d/haskell.bash",
                   ".bashrc.d/perlbrew.bash",
                   ".bashrc.d/ruby-envs.bash",
                   ".bashrc.d/ssh-agent.bash",
                   ".bashrc.d/ssh-completion.bash",
                   ".git-completion.bash",
                   ".gitconfig",
                   ".gitignore",
                   ".gnupg/gpg-agent.conf",
                   ".gnupg/gpg.conf",
                   ".irssi/config",
                   ".mrconfig",
                   ".msmtprc",
                   ".offlineimaprc",
                   ".rvm/gemsets/default.gems",
                   ".signature",
                   ".sup/colors.yaml",
                   ".sup/config.yaml",
                   ".sup/hooks/before-add-message.rb",
                   ".vim/after/ftplugin/c.vim",
                   ".vim/ftdetect/puppet.vim",
                   ".vim/syntax/puppet.vim",
                   ".vimrc",
                   ".xinitrc",
                   ".xmobarrc",
                   ".xmonad/xmonad.hs",
                   ".Xresources"].map do |dotfile_path|
  full_path = Pathname.new "~/" + dotfile_path
  full_path.expand_path
end

dotfiles_dir = Pathname.new "~/dotfiles"
dotfiles_dir = dotfiles_dir.expand_path
home_dir = dotfiles_dir.parent

if not dotfiles_dir == Pathname.getwd
  raise "bad base dir. Using #{dotfiles_dir} by convention"
end


dotfiles.each do |source|
  local_copy = source.sub(home_dir.to_s, dotfiles_dir.to_s)
  file local_copy => source do
    unless local_copy.parent.directory?
      mkdir local_copy.parent
    end
    cp source, local_copy, :verbose => true
  end
  desc "imports dotfiles from home into the dotfiles repo"
  task :import => local_copy
end

desc "updates home with the dotfiles dir content"
task :export_to_homedir do
  dotfiles.each do |target|
    local_copy = target.sub(home_dir.to_s, dotfiles_dir.to_s)
    unless target.parent.directory?
      mkdir_p target.parent
    end
    cp local_copy, target, :verbose => true
  end
end

task :bootstrap_devel_env do
  sh 'bash -c "$(curl http://rvm.beginrescueend.com/releases/rvm-install-head)"' 
end
