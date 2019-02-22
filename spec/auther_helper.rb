module AutherHelper
  def help
    :available
  end

  def load
    Dir["../app/services/*.rb"].each {|file|
      require file
    }
  end
end
