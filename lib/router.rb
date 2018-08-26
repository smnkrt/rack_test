# nodoc
class Router
  require 'dry-initializer'
  extend Dry::Initializer
  param :request
  param :routes_config

  def resolver_for
    matched_resolver || fallback_resolver
  end

  private

  def matched_resolver
    method    = request.request_method.downcase.to_sym
    path_info = request.path_info
    routes_config.routes[method][path_info]
  end

  def fallback_resolver
    routes_config.not_found_resolver
  end
end
