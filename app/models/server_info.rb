require 'open3'
# class ShellError < StandardError; end

class ServerInfo < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :app_technology,:ide, :server_name, :scm, :configuration_management, :ci_server

  validates :server_name, presence: true
  validates :app_technology, presence: true

  after_save :server_log

  def server_log
    MultiLogger.add_logger(server_name)
  end

  def set_script
  	system("locate *.in | tee -a log/#{server_name}.log")     
  end

  def system_quietly(cmd)
  	exit_status=nil
  	err=nil
  	out=nil
  	Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thread|
  		err = stderr.gets(nil)
  		out = stdout.gets(nil)
  		[stdin, stdout, stderr].each{|stream| stream.send('close')}
  		exit_status = wait_thread.value
  	end
  	if exit_status.to_i > 0
  		err = err.chomp if err
  		raise ShellError, err
  	elsif out
  		return out.chomp
  	else
  		return true
  	end
  end

end
