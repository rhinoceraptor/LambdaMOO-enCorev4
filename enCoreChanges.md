Changes made to the enCore Database to support the JavaScript telnet client
---------------------------------------------------------------------------


Two verbs have been changed for the js_telnet branch's copy of the enCore database, ```#147``` - ```java_html```, and ```#148``` - ```standalone_html```. Here are those verbs by themselves:


# ```#147``` - ```java_html```

> "===========================================================";
> "Copyright (C) 1999-2004, Jan Rune Holmevik and Sindre Soerensen";
> "The original code and Javascript functions written by Sindre Soerensen.";
> "Simplified and modified to allow more browsers to run Xpress.";
> "Jan, January, 2003-2004";
> "Modified to display parameters for new interface project.";
> "KRJ Dec 14 2014";
> "Modified further to display needed HTML and link to CSS and JS for new interface";
> "John Lewis December 30 2014";
> "===========================================================";
> if (!caller_perms().wizard)
>   return E_PERM;
> endif
> user = args[1];
> base_url = tostr("http://", $network.site, "/");
> style = 0;
> "CSS for the JavaScript MOO client";
> body = {tostr("<link rel=\"stylesheet\" href=\"", base_url, "encore/client/lib/css/lw.css\">")};
> "JavaScript object containing parameters for the Javascript MOO telnet client";
> body = {@body, tostr("<script type=\"text/javascript\"> ")};
> body = {@body, tostr("var params = {")};
> body = {@body, tostr("\"MOOname\": \"", $network.MOO_name, "\",")};
> body = {@body, tostr("\"HostName\": \"", $network.site, "\",")};
> body = {@body, tostr("\"port\": \"", $network.port, "\",")};
> body = {@body, tostr("\"SocketServer\": \"", $network.site, "\",")};
> body = {@body, tostr("\"autologin\": \"autoconnect ", user, " ", crypt(user.web_access_code), "\",")};
> body = {@body, tostr("\"font\": \"", user.java_font, "\",")};
> body = {@body, tostr("\"fontsize\": \"", user.java_font_size, "\",")};
> body = {@body, tostr("\"localecho\": \"", user.java_client_localecho, "\"")};
> body = {@body, tostr("}; </script>")};
> "Text Areas used in the MOO telnet client";
> body = {@body, tostr("<ul class=\"text-mode-ul\">")};
> body = {@body, tostr("<li><textarea readonly rows=\"20\" class=\"text-mode\" id=\"text-backlog\" type=\"text\">    </textarea></li>")};
> body = {@body, tostr("<li><textarea rows=\"3\" class=\"text-mode\" id=\"text-input\" type=\"text\"     placeholder=\"Enter text here\"></textarea></li>")};
> body = {@body, tostr("</ul>")};
> "Include JavaScript source files for the Telnet client";
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/js/jquery-2.1.1.min.js\" type=\"text/javascript\"></script>")};
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/js/socket.io-1.2.1.js\" type=\"text/javascript\"></script>")};
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/app/moo.js\" type=\"text/javascript\"></script>")};
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/app/text_handler.js\" type=\"text/javascript\"></script>")};
> result = this:build(user, body, "MOOtcan", "", "", "", "", "", style);
> return result;
> "Last modified Sun Dec 28 17:50:18 2014 EST by Wizard (#2).";

# ```#148``` - ```standalone_html```

> "===========================================================";
> "Copyright (C) 1999-2004, Jan Rune Holmevik";
> "Run MOOtcan as a standalone application";
> "Modified December 30 2014 to display new JavaScript telnet client standalone";
> "===========================================================";
> if (!caller_perms().wizard)
>   return E_PERM;
> endif
> user = args[1];
> base_url = tostr("http://", $network.site, "/");
> style = 0;
> "CSS for the JavaScript MOO client";
> body = {tostr("<link rel=\"stylesheet\" href=\"", base_url, "encore/client/lib/css/lw.css\">")};
> "JavaScript object containing parameters for the Javascript MOO telnet client";
> body = {@body, tostr("<script type=\"text/javascript\"> ")};
> body = {@body, tostr("var params = {")};
> body = {@body, tostr("\"MOOname\": \"", $network.MOO_name, "\",")};
> body = {@body, tostr("\"HostName\": \"", $network.site, "\",")};
> body = {@body, tostr("\"port\": \"", $network.port, "\",")};
> body = {@body, tostr("\"SocketServer\": \"", $network.site, "\",")};
> body = {@body, tostr("\"font\": \"", user.java_font, "\",")};
> body = {@body, tostr("\"fontsize\": \"", user.java_font_size, "\",")};
> body = {@body, tostr("\"localecho\": \"", user.java_client_localecho, "\"")};
> body = {@body, tostr("} </script>")};
> "Text Areas used in the MOO telnet client";
> body = {@body, tostr("<ul class=\"text-mode-ul\">")};
> body = {@body, tostr("<li><textarea readonly rows=\"20\" class=\"text-mode\" id=\"text-backlog\" type=\"text\">    </textarea></li>")};
> body = {@body, tostr("<li><textarea rows=\"3\" class=\"text-mode\" id=\"text-input\" type=\"text\"     placeholder=\"Enter text here\"></textarea></li>")};
> body = {@body, tostr("</ul>")};
> "Include JavaScript source files for the Telnet client";
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/js/jquery-2.1.1.min.js\" type=\"text/javascript\"></script>")};
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/js/socket.io-1.2.1.js\" type=\"text/javascript\"></script>")};
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/app/moo.js\" type=\"text/javascript\"></script>")};
> body = {@body, tostr("<script src=\"", base_url, "encore/client/lib/app/text_handler.js\" type=\"text/javascript\"></script>")};
> result = this:build(user, body, "MOOtcan", "", "", "", "", "", style);
> return result;
> "Last modified Sun Dec 28 03:51:11 2014 EST by Wizard (#2).";
