module RSpec
  module GraphQLResponse
    module Matchers
      module HaveErrors
        extend RSpec::Matchers::DSL

        matcher :have_errors do |count|
          match do |response|
            have_errors = Validators::HaveErrors.new(response, expected_count: count, expected_messages: @messages)

            @result = have_errors.validate
            @result.valid?
          end

          failure_message do |response|
            @result.reason
          end

          failure_message_when_negated do |response|
            @result.negated_reason
          end

          chain :with_messages do |*messages|
            @messages = messages
          end
        end
      end
    end
  end
end
