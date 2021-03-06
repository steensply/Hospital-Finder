class StaticPagesController < ApplicationController
  def home
    @hospitals = Hospital.all
    @hash = Gmaps4rails.build_markers(@hospitals) do |hospital, marker|
      hospital_path = view_context.link_to hospital.name, hospital_url(hospital)
      marker.lat hospital.latitude
      marker.lng hospital.longitude
      marker.infowindow "<b>#{hospital_path}</b>"
    end
    
    if params[:search]
      @hospitals = Hospital.name_like("%#{params[:search]}%").order('name')
    else
    end
    
  end

  def about
  end
end
