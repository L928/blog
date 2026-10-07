set windows-shell := ["cmd.exe", "/c"]

[windows]
default:
  @echo this must run on WSL


[linux]
default:
  just --list

# hello world example
hw:
  echo "hello world"

# setup ruby and jekyll to build pages locally
[linux]
setup:
  echo "not implementwed yet"
