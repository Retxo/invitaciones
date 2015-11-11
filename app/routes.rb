require 'sinatra'
require 'shotgun'
class Invitacion
	@@index = 0
	@@instances = []
	attr_accessor :tema, :content

	def self.save instance
		@@instances.push instance
		@@index = @@index + 1
	end

	def self.retrieve index
		@@instances[index]
	end

	def self.show_all 
		p @@instances
	end
end



def show_content(params)
	@invitacion = Invitacion.new
	@invitacion.tema = params[:tema]
	@invitacion.content = params[:content]
	@title = @invitacion.tema
	Invitacion.save(@invitacion)
	Invitacion.show_all
	@fullpath = request.fullpath
	set_url(@invitacion.tema, @invitacion.content)
	erb :tema
	#¿Por qué no me deja hacerlo así?
	#erb :boda if @tema = 'boda'
	#erb :despedida if @tema = 'despedida'
	#erb :cumpleanyos if @tema = 'cumpleanyos'
end
def set_url(tema, content)
	@url_params = "?tema=#{tema}"
	if not content.nil?
		@url_params = @url_params + "&content=#{content}" 
	end
	@url_params
end

get '/' do 
	@title = 'Invitaciones personalizadas'
	erb :formulario
end
post '/tema' do
	show_content(params)
end
get '/tema' do
	show_content(params)
end
get '/tema_by_id' do
	Invitacion.show_all
	p Invitacion.retrieve params[:index].to_i
end