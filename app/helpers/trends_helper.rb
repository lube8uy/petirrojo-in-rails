module TrendsHelper

	def linkify(text)
      text = text.gsub(/(http:\/\/[\w\.\-\_\#\~\:\/\?\[\]\@\!\$\&\'\(\)\*\+\,\;\=\%]*)/){"<a href='#{$1}'>#{$1}</a>"}
      #terminos de busqueda al principio de texto
      text = text.gsub(/^(#[\S]*)/){link_to($1, trend_search_path(q:CGI::escape($1)))}
      #terminos de busqueda en el medio del texto
      text = text.gsub(/(\s+)(#[\S]*)/){$1 + link_to($2, trend_search_path(q:CGI::escape($2)))}
      #nombres de usuario
      text = text.gsub(/@([A-Za-z0-9_]+)/){link_to('@' + $1, twiterer_path(CGI::escape($1)))}
    end

end
