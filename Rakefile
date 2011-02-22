require 'pathname'

dotfiles = FileList[
                 ".bashrc",
                 ".bashrc.d/rvm.bash",
                 ".bashrc.d/perlbrew.bash",
                 ".bash_profile",
                 ".gitconfig",
                 ".gitignore",
                 ".irssi/config",
                 ".mrconfig",
                 ".vimrc",
                 ".offlineimaprc",
                 ".rvm/gemsets/default.gems",
                 ".sup/config.yaml",
                 ".sup/colors.yaml",
                 ".sup/hooks/before-add-message.rb",
                 ".signature",
                 ".msmtprc",
                 ".gnupg/gpg.conf",
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
  desc "imports dotfiles from home dir"
  task :import => local_copy
end

task :export_to_homedir do
  dotfiles.each do |target|
    local_copy = target.sub(home_dir, dotfiles_dir)
    unless target.parent.directory?
      mkdir target.parent
    end
    cp local_copy, target, :verbose => true
  end
end

task :bootstrap_devel_env do
  sh 'bash -c "$(curl http://rvm.beginrescueend.com/releases/rvm-install-head)"' 
end
