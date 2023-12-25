module Weather
  class API < Grape::API
    format :json

    desc 'Текущая температура'
    get :current do
      Temperatures::CurrentCelsiusService.new(MOSCOW_LOCATION_ID).call
    end

    desc 'Почасовая температура за последние 24 часа'
    resource :historical do
      get do
        Temperatures::HistoricalService.new(MOSCOW_LOCATION_ID).call
      end

      desc 'Максимальная температура за 24 часа'
      get :max do
        Temperatures::MaxCelsiusService.new(MOSCOW_LOCATION_ID).call
      end

      desc 'Минимальная температура за 24 часа'
      get :min do
        Temperatures::MinCelsiusService.new(MOSCOW_LOCATION_ID).call
      end

      desc 'Средняя температура за 24 часа'
      get :avg do
        Temperatures::AvgCelsiusService.new(MOSCOW_LOCATION_ID).call
      end
    end

    desc 'Найти температуру ближайшую к переданному timestamp'
    params do
      requires :timestamp, type: Integer, desc: 'Timestamp'
    end
    get :by_time do
      Temperatures::CelsiusByNearestService.new(MOSCOW_LOCATION_ID, params[:timestamp]).call
    end
  end
end
