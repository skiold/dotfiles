require 'pathname'

dotfiles = [
                 ".irssi/config",
                 ]
dotfiles_dir = Pathname.new "~/dotfiles"
dotfiles_dir = dotfiles_dir.expand_path

if not dotfiles_dir == Pathname.getwd
  raise "bad base dir. Using #{dotfiles_dir} by convention"
end

task :import do
  dotfiles.each do |path_to_dotfile|
    puts path_to_dotfile
  end
end
