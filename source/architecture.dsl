!include localization/spanish_constants.dsl

# EscalableDynamicModular 
# DynamicEscalableSmartModular Arquitecture

workspace ${WORKSPACE_NAME} "Arquitectura de software basada en microservicios con el objetivo de brindar atencion de manera mas eficiente" {
    model {
        patient = person ${PATIENT} ${PATIENT_DESCRIPTION}


        enterprise ${ENTERPRISE_NAME} {
            physician = person ${PHYSICIAN} ${PHYSICIAN_DESCRIPTION}
            supportStaff = person ${SUPPORT_AGENT} ${SUPPORT_AGENT_DESCRIPTION}

            healthcareSystem = softwaresystem ${HEALTHCARE_SYSTEM_NAME} ${HEALTHCARE_SYSTEM_DESCRIPTION} {
                # UI containers
                patientMobileApplication = container ${PATIENT_MOBILE_APP} ${PATIENT_MOBILE_APP_DESCRIPTION} ${FLUTTER_TAG} ${MOBILE_APP_TAG}
                physicianMobileApplication = container ${PHYSICIAN_MOBILE_APP} ${PHYSICIAN_MOBILE_APP_DESCRIPTION} ${FLUTTER_TAG} ${MOBILE_APP_TAG}
                patientSinglePageWebApplication = container ${PATIENT_SINGLE_PAGE_WEB_APPLICATION} ${PATIENT_SINGLE_PAGE_WEB_APPLICATION_DESCRIPTION} ${ANGULAR_TAG} ${WEB_BROWSER_TAG}
                physicianSinglePageWebApplication = container ${PHYSICIAN_SINGLE_PAGE_WEB_APPLICATION} {PHYSICIAN_SINGLE_PAGE_WEB_APPLICATION_DESCRIPTION} ${ANGULAR_TAG} ${WEB_BROWSER_TAG}
                supportStaffSinglePageWebApplication = container ${SUPPORT_STAFF_SINGLE_PAGE_WEB_APPLICATION} ${SUPPORT_STAFF_SINGLE_PAGE_WEB_APPLICATION_DESCRIPTION} ${WEB_BROWSER_TAG} ${ANGULAR}

                # microservice components
                apiGateway = container ${API_GATEWAY} ${API_GATEWAY_DESCRIPTION} ${GOLANG_TAG} ${GATEWAY_TAG}
                serviceRegistry = container ${SERVICE_REGISTRY} ${SERVICE_REGISTRY_DESCRIPTION} ${GOLANG_TAG} ${DOCKER_TAG}

                # service containers
                notificationsService = container ${NOTIFICATIONS_SERVICE} ${NOTIFICATIONS_SERVICE_DESCRIPTION} ${APACHE_KAFKA_TAG} ${DOCKER_TAG} 

                accountService = container ${ACCOUNTS_SERVICE} ${ACCOUNTS_SERVICE_DESCRIPTION} ${DOCKER_TAG}
                accountDatabase = container ${ACCOUNTS_DATABASE} ${ACCOUNTS_DATABASE_DESCRIPTION} ${SQL_SERVER_TAG} ${DOCKER_TAG} 

                reservationsService = container ${RESERVATIONS_SERVICE} ${RESERVATIONS_SERVICE_DESCRIPTION} ${NET_CORE_TAG} ${DOCKER_TAG}
                reservationDatabase = container ${RESERVATIONS_DATABASE} ${RESERVATIONS_DATABASE_DESCRIPTION} ${SQL_SERVER_TAG} ${DOCKER_TAG} 

                deliveryService = container ${DELIVERY_SERVICE} ${DELIVERY_SERVICE_DESCRIPTION} ${DOCKER_TAG}
                deliveryDatabase = container ${DELIVERY_DATABASE} ${DELIVERY_DATABASE_DESCRIPTION} ${SQL_SERVER_TAG} ${DOCKER_TAG} 
                
                resourcesService = container ${RESOURCES_SERVICE} ${RESOURCES_SERVICE_DESCRIPTION} ${NET_CORE_TAG} ${DOCKER_TAG}
                resourcesDatabase = container ${RESOURCES_DATABASE} ${RESOURCES_DATABASE_DESCRIPTION} ${BLOB_STORAGE_TAG}

                medicalHistoryService = container ${MEDICAL_HISTORY_SERVICE} ${MEDICAL_HISTORY_SERVICE_DESCRIPTION} ${NET_CORE_TAG} ${DOCKER_TAG}
                medicalHistoryDatabase = container ${MEDICAL_HISTORY_DATABASE} ${MEDICAL_HISTORY_DATABASE_DESCRIPTION} ${MONGO_DB_TAG}
                
                chatService = container ${CHAT_SERVICE} ${CHAT_SERVICE_DESCRIPTION} ${NET_CORE_TAG} ${DOCKER_TAG}
            }
        }

        # hooks
        notificationsService -> patientMobileApplication ${NOTIFICATION_SERVICE__PATIENT_MOBILE_APPLICATION} ${WEBSOCKETS_TAG}
        notificationsService -> physicianMobileApplication ${NOTIFICATION_SERVICE__PHYSICIAN_MOBILE_APPLICATION} ${WEBSOCKETS_TAG}

        # relationships to resources
        medicalHistoryService -> resourcesService ${MEDICAL_HISTORY_SERVICE__RESOURCE_SERVICE} ${JSON_TAG}

        # notifications consume from
        deliveryService -> notificationsService ${DELIVERY_SERVICE__NOTIFICATION_SERVICE} ${TCP_TAG}
        reservationsService -> notificationsService ${RESERVATION_SERVICE__NOTIFICATION_SERVICE} ${TCP_TAG}

        # relationships to accountService
        deliveryService -> accountService ${GENERIC_RELATIONSHIP_TO_ACCOUNT_SERVICE} ${HTTPS_TAG}
        reservationsService -> accountService ${GENERIC_RELATIONSHIP_TO_ACCOUNT_SERVICE} ${HTTPS_TAG}
        notificationsService -> accountService ${GENERIC_RELATIONSHIP_TO_ACCOUNT_SERVICE} ${HTTPS_TAG}
        resourcesService -> accountService ${GENERIC_RELATIONSHIP_TO_ACCOUNT_SERVICE} ${HTTPS_TAG}
        medicalHistoryService -> accountService ${GENERIC_RELATIONSHIP_TO_ACCOUNT_SERVICE} ${HTTPS_TAG}
        chatService -> accountService ${GENERIC_RELATIONSHIP_TO_ACCOUNT_SERVICE} ${HTTPS_TAG}

        # relationships between people and software systems
        patient -> healthcareSystem ${PATIENT_ACTION_HEALTH_CARE_SYSTEM}
        physician -> healthcareSystem ${PHYSICIAN_ACTION_HEALTH_CARE_SYSTEM}
        supportStaff -> healthcareSystem ${SUPPORT_AGENT_ACTION_HEALTH_CARE_SYSTEM}

        # relationships to database
        accountService -> accountDatabase ${GENERIC_RELATIONSHIP_TO_DATABASE} ${TCP_TAG}
        reservationsService -> reservationDatabase ${GENERIC_RELATIONSHIP_TO_DATABASE} ${TCP_TAG}
        deliveryService -> deliveryDatabase ${GENERIC_RELATIONSHIP_TO_DATABASE} ${TCP_TAG}
        resourcesService -> resourcesDatabase ${GENERIC_RELATIONSHIP_TO_DATABASE} ${TCP_TAG}
        medicalHistoryService -> medicalHistoryDatabase ${GENERIC_RELATIONSHIP_TO_DATABASE} ${TCP_TAG}

        # relationships to/from containers
        patient -> patientMobileApplication ${PATIENT_ACTION_MOBILE_APP} ${ANDROID_TAG} ${IOS_TAG}
        physician -> physicianMobileApplication ${PHYSICIAN_ACTION_MOBILE_APP} ${ANDROID_TAG} ${IOS_TAG}

        patient -> patientSinglePageWebApplication ${PATIENT_ACTION_WEB_APP} ${WEB_BROWSER_TAG}
        physician -> physicianSinglePageWebApplication ${PHYSICIAN_ACTION_WEB_APP} ${WEB_BROWSER_TAG}
        supportStaff -> supportStaffSinglePageWebApplication ${SUPPORT_AGENT_ACTION_WEB_APP} ${WEB_BROWSER_TAG}

        patientMobileApplication -> apiGateway ${GENERAL_USAGE} ${HTTPS_TAG}
        physicianMobileApplication -> apiGateway ${GENERAL_USAGE} ${HTTPS_TAG}
        patientSinglePageWebApplication -> apiGateway ${GENERAL_USAGE} ${HTTPS_TAG}
        physicianSinglePageWebApplication -> apiGateway ${GENERAL_USAGE} ${HTTPS_TAG}
        supportStaffSinglePageWebApplication -> apiGateway ${GENERAL_USAGE} ${HTTPS_TAG}

        apiGateway -> accountService "" ${HTTPS_TAG}
        apiGateway -> reservationsService "" ${HTTPS_TAG}
        apiGateway -> deliveryService "" ${HTTPS_TAG}
        apiGateway -> resourcesService "" ${HTTPS_TAG}
        apiGateway -> medicalHistoryService "" ${HTTPS_TAG}
        patientMobileApplication -> chatService ${GENERIC_RELATIONSHIP_TO_CHAT_SERVICE} ${XMPP_TAG} ${WEBSOCKETS_TAG}
        physicianMobileApplication -> chatService ${GENERIC_RELATIONSHIP_TO_CHAT_SERVICE} ${XMPP_TAG} ${WEBSOCKETS_TAG}

        apiGateway -> serviceRegistry ${GENERIC_RELATIONSHIP_TO_SERVICE_REGISTRY}
    }

    views {
        systemcontext healthcareSystem "SystemContext" {
            include *
            animation {
                healthcareSystem
                patient
                physician
                supportStaff
            }
            autoLayout
        }

        container healthcareSystem "Containers" {
            include *
            animation {
                physician
                patient
                supportStaff
                patientMobileApplication
                physicianMobileApplication
                patientSinglePageWebApplication
                physicianSinglePageWebApplication
                supportStaffSinglePageWebApplication
                apiGateway
                accountService
                reservationsService
                deliveryService
                notificationsService
                resourcesService
                medicalHistoryService
                serviceRegistry
                accountDatabase
                reservationDatabase
                deliveryDatabase
                resourcesDatabase
                medicalHistoryDatabase
            }
            autoLayout
        }
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
                background #08427b
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element ${WEB_BROWSER_TAG} {
                shape WebBrowser
            }
            element ${MOBILE_APP_TAG} {
                shape MobileDeviceLandscape
            }
            element ${SQL_SERVER_TAG} {
                shape Cylinder
            }
            element ${APACHE_KAFKA_TAG} {
                shape Pipe
            }
            element ${GATEWAY_TAG} {
                shape Hexagon
            }
        }
    }
}