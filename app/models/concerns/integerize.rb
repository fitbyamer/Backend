module Integerize
  extend ActiveSupport::Concern

  class_methods do
    
    def integerize attribute, *flags

      define_method "#{attribute}_name" do
        flags[send(attribute)]
      end

      flags.to_a.each_with_index do |flag, index|

        define_method "#{flag}?" do
          send(attribute.to_s) == index
        end

        define_method "to_#{flag}" do
          send("#{attribute}=", index)
        end

        define_method "to_#{flag}!" do
          update_attribute attribute, index
        end

        define_singleton_method "#{flag}_value" do
          index
        end

        scope "where_#{flag}", ->{ where(role: index) }
        scope "where_not_#{flag}", ->{ where.not(role: index) }
      end
    end
  end
end
