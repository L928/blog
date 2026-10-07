module Jekyll
  class StaticFile
    def copy_file(dest_path)
      FileUtils.cp(path, dest_path)
      begin
        File.utime(File.atime(path), mtime, dest_path)
      rescue Errno::EPERM
      end
    end
  end
end
