defmodule Swiphly.RestVari do
  alias Swiphly.MySettings
  alias Arpas.REST.Generico.Api, as: Gapi

  def real_rete_anagrafica do
    my_host = MySettings.my_host()
    url = "#{my_host}real_rete_anagrafica"
    IO.puts(url)
    Gapi.get(url)
  end

  def estrai(%{"cod_srv" => cod_srv}) do
    my_host = MySettings.my_host()
    url = "#{my_host}valida/estrai/#{cod_srv}?inizio=2022-12-22&fine=2022-12-31"
    IO.puts(url)

    case Gapi.get(url) do
      "Not found :(" ->
        url

      {:ok, results} ->
        results

      {:error, _} ->
        []
    end
  end

  def estrai(stringa) do
    my_host = MySettings.my_host()
    url = "#{my_host}#{stringa}"
    IO.puts(url)

    case Gapi.get(url) do
      "Not found :(" ->
        url

      {:ok, results} ->
        results

      {:error, _} ->
        []
    end
  end

  def idro_from_csv do
    lista =
      CSV.decode(File.stream!(Path.expand("idrometri_real_time_agol.csv")), headers: true)
      |> Enum.to_list()
      |> Enum.map(fn {_k, v} -> v end)

    Enum.map(lista, &string_to_key/1)
  end

  defp string_to_key(record) do
    Enum.reduce(record, %{}, fn {key, val}, acc ->
      Map.put(acc, String.to_atom(key), val)
    end)
  end
end
