# frozen_string_literal: true

require_relative '../../lib/vocab'

LinkedRails.host = 'demo.localdev'
LinkedRails.scheme = :https

LinkedRails::Renderers.register!
