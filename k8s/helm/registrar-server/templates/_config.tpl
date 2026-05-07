{{- define "registrar-server.config" }}
#!KAMAILIO

## global Macros to set/unset modules, routes, etc
#!trydefenvs WITH_DEBUG
#!trydefenvs WITH_SIPTRACE
#!trydefenvs WITH_PROM_STATS
#!trydefenvs WITH_LOG_STDERR
#!trydefenvs WITH_DMQUEUE

{{ range .Values.listens }}
listen={{ . }}
{{- end }}

{{- range .Values.aliases }}
alias={{ . }}
{{- end }}

#!ifdef WITH_PROM_STATS
   tcp_accept_no_cl=yes

   #!defenv PROM_STATS_LISTEN
   listen=PROM_STATS_LISTEN
#!endif

/* DB definition */
#!defenvs DB_CONNECTION

{{- end }}
