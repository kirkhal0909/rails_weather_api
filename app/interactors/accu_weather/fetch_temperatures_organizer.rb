class AccuWeather::FetchTemperaturesOrganizer
  include Interactor::Organizer

  organize AccuWeather::GetWeatherInteractor,
           AccuWeather::PrepareTemperaturesInteractor,
           AccuWeather::SaveTemperaturesInteractor
end
