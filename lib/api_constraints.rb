class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    req.headers['Accept'].include?("application/api_fit_by_amer_ios.v#{@version}") || @default
  end
end
