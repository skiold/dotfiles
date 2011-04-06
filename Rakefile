require 'pathname'

dotfiles = FileList[
                 ".bashrc",
                 ".bashrc.d/gitcircling.bash",
                 ".bashrc.d/homebrew.bash",
                 ".bashrc.d/rvm.bash",
                 ".bashrc.d/perlbrew.bash",
                 ".bash_profile",
                 ".gitconfig",
                 ".gitignore",
                 ".irssi/config",
                 ".mrconfig",
                 ".offlineimaprc",
                 ".rvm/gemsets/default.gems",
                 ".sup/config.yaml",
                 ".sup/colors.yaml",
                 ".sup/hooks/before-add-message.rb",
                 ".signature",
                 ".msmtprc",
                 ".gnupg/gpg.conf",
                 ".gnupg/gpg-agent.conf",
                 ".vim/ftdetect/puppet.vim",
                 ".vim/syntax/puppet.vim",
                 ".vimrc",
             ].map do |dotfile_path|
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
  local_copy = source.sub(home_dir, dotfiles_dir)
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
    local_copy = target.sub(home_dir, dotfiles_dir)
    unless target.parent.directory?
      mkdir_p target.parent
    end
    cp local_copy, target, :verbose => true
  end
end

task :bootstrap_devel_env do
  sh 'bash -c "$(curl http://rvm.beginrescueend.com/releases/rvm-install-head)"' 
end
