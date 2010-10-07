require 'pathname'

dotfiles = FileList[
                 ".irssi/config",
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
    puts local_copy
    unless local_copy.parent.directory?
      mkdir local_copy.parent
    end
    cp source, local_copy, :verbose => true
  end
  desc "imports dotfiles from home dir"
  task :import => local_copy
end
