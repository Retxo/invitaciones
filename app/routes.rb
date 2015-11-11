require 'sinatra'
require 'shotgun'
class Invitacion
	attr_accessor :tema, :content
end

get '/' do 
	@title = 'Invitaciones personalizadas'
	erb :formulario
end
post '/tema' do
	@invitacion = Invitacion.new
	@invitacion.tema = params[:tema]
	@invitacion.content = params[:content]
	@title = @invitacion.tema
	@fullpath = request.fullpath
	erb :tema
	#¿Por qué no me deja hacerlo así?
	#erb :boda if @tema = 'boda'
	#erb :despedida if @tema = 'despedida'
	#erb :cumpleanyos if @tema = 'cumpleanyos'
end
get '/tema' do
	p request.fullpath
end