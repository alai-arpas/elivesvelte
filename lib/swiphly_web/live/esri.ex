defmodule SwiphlyWeb.Esri do
  use SwiphlyWeb, :live_view

  alias Swiphly.RestVari

  def mount(_params, _session, socket) do
    idro = RestVari.idro_from_csv()
    {:ok, assign(socket, anagrafica: idro)}
  end

  def render(assigns) do
    ~H"""
      <.live_component module={SwiphlyWeb.SvelteComponent} id="esri" name="AgisSvelte" props={%{anagrafica: @anagrafica}} />
    """
  end

  def primo do
    %{
      GlobalID: "c4b2ba35-12a4-427b-bbf8-edf0314b92c4",
      altra_denominazione: "Rio Posada a Torpè",
      attivo: "",
      cae_nome: "Posada a Torpè",
      cae_station_id: "758200",
      cod_srv: "F00",
      localita: "Ponte S. Martino strada comunale",
      nota_m_slm: "[m]",
      note: "",
      objectid: "1",
      s1: "2.5",
      s2: "3.8",
      s3: "4.7",
      scala_fatta: "SI",
      sensore_principale: "58608",
      ss_cod_staz: "NU004B620",
      time: "2023-01-02T15:00:00",
      tipomisura: "Alveo",
      trend: "-0.001",
      value: "-0.533",
      x: "9.64770443141156",
      y: "40.6338077649236",
      zero: "5.26"
    }
  end
end
