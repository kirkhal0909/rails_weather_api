module Weather
  class API < Grape::API
    format :json

    desc 'Текущая температура'
    get :current do
      # Логика для получения текущей температуры
    end

    desc 'Почасовая температура за последние 24 часа'
    get :historical do
      # Логика для получения почасовой температуры за последние 24 часа
    end

    desc 'Максимальная температура за 24 часа'
    get :historical_max do
      # Логика для получения максимальной температуры за последние 24 часа
    end

    desc 'Минимальная температура за 24 часа'
    get :historical_min do
      # Логика для получения минимальной температуры за последние 24 часа
    end

    desc 'Средняя температура за 24 часа'
    get :historical_avg do
      # Логика для получения средней температуры за последние 24 часа
    end

    desc 'Найти температуру ближайшую к переданному timestamp'
    params do
      requires :timestamp, type: Integer, desc: 'Timestamp'
    end
    get :by_time do
      # Логика для поиска температуры ближайшей к переданному timestamp
    end
  end
end
