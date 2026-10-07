set windows-shell := ["cmd.exe", "/c"]

[windows]
default:
  @echo this must run on an isolated WSL or native linux (vm)


[linux]
default:
  just --list

# hello world example
hw:
  echo "hello world"

# run local jekyll server to test pages
[linux]
run:
  jekyll serve --host 0.0.0.0 --livereload

# build the blog to docs/ folder
[linux]
build:
  jekyll build

# deploy the blog by pushing commits to github
[linux]
deploy: build
  git push github main

# setup ruby and jekyll to build pages locally
[linux]
setup:
  #!/usr/bin/env bash
  set -euo pipefail

  has_ruby=1
  has_jekyll=1
  command -v ruby >/dev/null 2>&1 || has_ruby=0
  command -v jekyll >/dev/null 2>&1 || has_jekyll=0

  if [ "$has_ruby" -eq 1 ] && [ "$has_jekyll" -eq 1 ]; then
    echo "Ruby and Jekyll are already installed."
    ruby -v
    jekyll -v
    exit 0
  fi

  missing=""
  if [ "$has_ruby" -eq 0 ]; then missing="$missing ruby"; fi
  if [ "$has_jekyll" -eq 0 ]; then missing="$missing jekyll"; fi

  echo "The following dependencies are missing:$missing"
  read -r -p "Do you want to install them now? [y/N] " confirm
  case "$confirm" in
    [yY][eE][sS]|[yY])
      echo "Installing missing dependencies..."
      SUDO=""
      if [ "$(id -u)" -ne 0 ]; then SUDO="sudo"; fi
      if command -v apt-get >/dev/null 2>&1; then
        $SUDO apt-get update
        $SUDO apt-get install -y ruby-full jekyll build-essential
      elif command -v gem >/dev/null 2>&1; then
        gem install jekyll bundler
      else
        echo "Error: Neither apt-get nor gem found to install dependencies." >&2
        exit 1
      fi
      ;;
    *)
      echo "Installation cancelled."
      exit 1
      ;;
  esac

  echo "Verifying installation..."
  ruby -v
  jekyll -v
  echo "Setup completed successfully."
