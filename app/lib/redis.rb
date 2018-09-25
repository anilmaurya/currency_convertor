# frozen_string_literal: true

REDIS = Redis.new(Rails.application.config_for(:redis))
