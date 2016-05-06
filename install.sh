#!/usr/bin/env ruby
require 'fileutils'

def link(path, link_name)
  path = File.expand_path path
  link_name = File.expand_path link_name

  puts "linking #{link_name}..."

  if File.symlink? link_name
    puts "\tRemoving symlink..."
    FileUtils.rm link_name
  elsif File.exists? link_name
    puts "\tSkipping because a file already exists."
    return
  end

  FileUtils.ln_s(path, link_name)
end

puts "Bootstrapping Evan's Dotfiles..."
link "~/.dotfiles/neovim", "~/.neovim"
link "~/.dotfiles/bash/.bash_profile", "~/.bash_profile"
link "~/.dotfiles/bash/.bashrc", "~/.bashrc"
link "~/.dotfiles/bash-it", "~/.bash_it"
link "~/.dotfiles/git/.gitconfig", "~/.gitconfig"
link "~/.dotfiles/git/.gitignore_global", "~/.gitignore_global"
link "~/.dotfiles/ssh/config", "~/.ssh/config"
link "~/.dotfiles/config/i3", "~/.config/i3"
link "~/.dotfiles/config/nvim/", "~/.config/nvim/"
link "~/.dotfiles/config/terminator", "~/.config/terminator"
link "~/.dotfiles/wallpaper", "~/.wallpaper"

puts "done"
