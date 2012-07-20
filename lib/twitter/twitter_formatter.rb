  require 'cgi'
  
  class TwitterFormatter
      
    ##
    # Encapsula entre tags "a" las urls que comienzan por http para
    # que se conviertan en texto navegable en una pagina html, vincula
    # los terminos que comiencen por "@" a un usuario de twitter y los que comienzan por
    # "#" a una busqueda de twits.
    #
    # @todo link a usuarios
    ##  
    def TwitterFormatter.linkify(text)
      text = text.gsub(/(http:\/\/[\w\.\-\_\#\~\:\/\?\[\]\@\!\$\&\'\(\)\*\+\,\;\=\%]*)/){"<a href='#{$1}'>#{$1}</a>"}
      #terminos de busqueda al principio de texto
      text = text.gsub(/^(#[\S]*)/){ActionController::Base.helpers.link_to($1, "search?q=" + CGI::escape($1))}
      #terminos de busqueda en el medio del texto
      text = text.gsub(/(\s+)(#[\S]*)/){$1 + ActionController::Base.helpers.link_to($2, "search?q=" + CGI::escape($2))}
    end
    
  end