module Moip2
  class Response < SimpleDelegator
    def initialize(resp, json)
      if json.is_a?(Hash) || json.is_a?(Array)
        # super(RecursiveOpenStruct.new(json, recurse_over_arrays: true))
        super(JSON.parse(json.to_json, object_class: RecursiveOpenStruct))
      else
        super(resp)
      end
      @resp = resp
    end

    def success?
      (200..299).cover? @resp.code.to_i
    end

    def client_error?
      (400..499).cover? @resp.code.to_i
    end
  end
end
