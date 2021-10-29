
# General
!constant WORKSPACE_NAME "Arquitectura de salud"
!constant HEALTHCARE_SYSTEM_NAME "Sistema de Software de Salud"
!constant HEALTHCARE_SYSTEM_DESCRIPTION "Permite a los usuarios atenderse en el la organización de salud"
!constant ENTERPRISE_NAME "Organización de Salud"

# Roles
!constant PATIENT "Paciente"
!constant PATIENT_DESCRIPTION "Paciente que busca atenderse en el sistema de salud publico."
!constant SUPPORT_AGENT "Agente de soporte"
!constant SUPPORT_AGENT_DESCRIPTION "Agente encargado de tareas administrativas dentro del sistema."
!constant PHYSICIAN "Médico" 
!constant PHYSICIAN_DESCRIPTION "Médico que presta servicios en una organización de salud."

# clients
!constant PATIENT_MOBILE_APP "Aplicacion movil para el paciente"
!constant PATIENT_MOBILE_APP_DESCRIPTION "Aplicacion movil que sera usada por el paciente para interactuar con el sistema"
!constant PATIENT_SINGLE_PAGE_WEB_APPLICATION "Aplicacion web para el paciente"
!constant PATIENT_SINGLE_PAGE_WEB_APPLICATION_DESCRIPTION "Aplicacion web que sera usada por el paciente para interactuar con el sistema"
!constant PHYSICIAN_MOBILE_APP "Aplicacion movil para el médico"
!constant PHYSICIAN_MOBILE_APP_DESCRIPTION "Aplicacion movil que sera usada por el médico para interactuar con el sistema"
!constant SUPPORT_STAFF_SINGLE_PAGE_WEB_APPLICATION "Aplicacion web para el agente de soporte"
!constant SUPPORT_STAFF_SINGLE_PAGE_WEB_APPLICATION_DESCRIPTION "Aplicacion web que sera usada por el agente de soporte para gestionar accesos."
!constant PHYSICIAN_SINGLE_PAGE_WEB_APPLICATION "Aplicación web para médicos"
!constant PHYSICIAN_SINGLE_PAGE_WEB_APPLICATION_DESCRIPTION "Aplicación web que sera usada por médicos para interactuar con el sistema"

# Tags
!constant GOLANG_TAG "Golang"
!constant DOCKER_TAG "Docker"
!constant FLUTTER_TAG "Flutter"
!constant ANGULAR_TAG "Angular"
!constant MOBILE_APP_TAG "Mobile App"
!constant ANDROID_TAG "Android"
!constant IOS_TAG "IOS"
!constant WEB_BROWSER_TAG "Navegador Web"
!constant HTTPS_TAG "Https"
!constant WEBSOCKETS_TAG "Websockets"
!constant NET_CORE_TAG ".NET Core"
!constant JSON_TAG "JSON"
!constant TCP_TAG "TCP"
!constant XMPP_TAG "XMPP"

# Services
!constant API_GATEWAY "API Gateway"
!constant API_GATEWAY_DESCRIPTION "Componente de microservicios que enruta peticiones a microservicios segun corresponda"
!constant SERVICE_REGISTRY "Service Registry"
!constant SERVICE_REGISTRY_DESCRIPTION "Componente de microservicios que contiene información de estilo metadata sobre los microservicios"
!constant DELIVERY_SERVICE "Servicio de delivery"
!constant DELIVERY_SERVICE_DESCRIPTION "Servicio de delivery que encuentra rutas optimas y estratégicas para conectar motorizados o furgonetas, a destinos cercanos donde se necesiten distintos medicamentos."
!constant CHAT_SERVICE "Servicio de chat"
!constant CHAT_SERVICE_DESCRIPTION "Servicio que permite comunicación a través de mensajeria directa entre dos usuarios. Utiliza una cola de mensajes para gestionar la transmisión de mensajes."
!constant ACCOUNT_SERVICE "Servicio de cuentas"
!constant ACCOUNT_SERVICE_DESCRIPTION "Servicio sigue los principios de Active Directory. Con principios lógicos de autenticación y autorización, con una fuerte segmentación entre ambos y orientado a la seguridad de los datos del paciente."
!constant RESERVATION_SERVICE "Servicio de reservas"
!constant RESERVATION_SERVICE_DESCRIPTION "Servicio que se rige bajo el principio de que las personas no creen reservas o citas de por sí, si no, intenciones de cita. A la hora de asignación automática de citas, también se evaluará la prioridad de los pacientes."
!constant NOTIFICATION_SERVICE "Servicio de notificaciones"
!constant NOTIFICATION_SERVICE_DESCRIPTION "Servicio de sistema de recordatorios. Cuando personas tienen citas activas, se utilizará una cola de tareas distribuida para enviar notificaciones a los usuarios."
!constant RESOURCES_SERVICE "Servicio de recursos"
!constant RESOURCES_SERVICE_DESCRIPTION "Servicio que se encarga de la persistencia y distribución de recursos relacionados a dato de los pacientes."
!constant MEDICAL_HISTORY_SERVICE "Servicio de historial médico"
!constant MEDICAL_HISTORY_SERVICE_DESCRIPTION "Servicio que gestiona el historial médico de cada paciente que se atiende en el sistema de salud."

# Healthcare System Relationships
!constant PATIENT_ACTION_HEALTH_CARE_SYSTEM "Utiliza para gestionar su acceso y consumo sobre servicios de salud."
!constant PHYSICIAN_ACTION_HEALTH_CARE_SYSTEM "Utiliza el sistema para poder gestionar los servicios que brinda."
!constant SUPPORT_AGENT_ACTION_HEALTH_CARE_SYSTEM "Utiliza el sistema para poder gestionar roles y permisos dentro del sistema."

# Resource service relationships
!constant MEDICAL_HISTORY_SERVICE__RESOURCE_SERVICE "Consume documentos virtuales en formato de archivos json"

# Account Service Relationships
!constant GENERIC_RELATIONSHIP_TO_ACCOUNT_SERVICE "Extrae datos de cuenta desde"

# Chat Service Relationships
!constant GENERIC_RELATIONSHIP_TO_CHAT_SERVICE "Usa para integrar funcionalidad de chat"

# Service Registry Relationships
!constant GENERIC_RELATIONSHIP_TO_SERVICE_REGISTRY "Fetches information about latest service updates"

# User actions to clients
!constant PATIENT_ACTION_MOBILE_APP "Agenda citas y recibe notificaciones a través de"
!constant PHYSICIAN_ACTION_MOBILE_APP "Gestiona horarios y conversa con pacientes a través de"
!constant PATIENT_ACTION_WEB_APP "Agenda citas a través de"
!constant PHYSICIAN_ACTION_WEB_APP "Gestiona horarios y conversa con pacientes a través de"
!constant SUPPORT_AGENT_ACTION_WEB_APP "Asigna roles y maneja permisos a través de"
!constant GENERAL_USAGE "Usa para obtener y manipular información"

# Hooks
!constant NOTIFICATION_SERVICE__PATIENT_MOBILE_APPLICATION "Envia notificaciones través de una conexión stream"
!constant NOTIFICATION_SERVICE__PHYSICIAN_MOBILE_APPLICATION "Envia notificaciones través de una conexión stream"
!constant NOTIFICATION_SERVICE__PHYSICIAN_MOBILE_APPLICATION "Envia notificaciones través de una conexión stream"

# Consumer
!constant DELIVERY_SERVICE__NOTIFICATION_SERVICE "Envia mensajes en tiempo real a la cola de notificaciones, sobre procesos de pedidos"
!constant RESERVATION_SERVICE__NOTIFICATION_SERVICE "Envia mensajes en tiempo real a la cola de notificaciones, sobre procesos de reserva"

