CREATE TABLE `1a_country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1b_state` (
  `idstate` int(11) NOT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idstate`),
  UNIQUE KEY `state_name_UNIQUE` (`state_name`),
  KEY `countryl3_idx` (`country_id`),
  CONSTRAINT `countryl3` FOREIGN KEY (`country_id`) REFERENCES `1a_country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1c_city` (
  `idcity` int(11) NOT NULL,
  `city_name` varchar(45) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcity`),
  UNIQUE KEY `city_name_UNIQUE` (`city_name`),
  KEY `statel1_idx` (`state_id`),
  CONSTRAINT `statel1` FOREIGN KEY (`state_id`) REFERENCES `1b_state` (`idstate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1d_activity` (
  `idactivity` int(11) NOT NULL,
  `activity_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idactivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1f_permissions` (
  `idpermissions` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `read_access` tinyint(4) DEFAULT NULL,
  `write_access` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idpermissions`),
  KEY `roles_idx` (`role_id`),
  CONSTRAINT `roles` FOREIGN KEY (`role_id`) REFERENCES `1e_roles` (`idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1e_roles` (
  `idroles` int(11) NOT NULL,
  `roles_name` varchar(20) DEFAULT NULL,
  `date_of_creation` date DEFAULT NULL,
  `date_of_change` date DEFAULT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idroles`),
  KEY `comapny_idx` (`company_id`),
  CONSTRAINT `comapny_id` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1g_company` (
  `idcompany` varchar(10) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `company_address` varchar(45) DEFAULT NULL,
  `company_webpage` varchar(45) DEFAULT NULL,
  `company_ph_no_1` int(11) DEFAULT NULL,
  `company_ph_no_2` int(11) DEFAULT NULL,
  `company_email` varchar(20) DEFAULT NULL,
  `company_country` varchar(20) DEFAULT NULL,
  `comapny_state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1h_employee` (
  `idemployee` varchar(20) NOT NULL,
  `company_id` varchar(10) DEFAULT NULL,
  `employee_name` varchar(20) DEFAULT NULL,
  `employee_date_join` date DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `employee_username` varchar(20) DEFAULT NULL,
  `employee_pass` varchar(20) DEFAULT NULL,
  `employee_date_leave` date DEFAULT NULL,
  `employee_active_or_inactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idemployee`),
  UNIQUE KEY `company_id_UNIQUE` (`company_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `companyl2` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `1e_roles` (`idroles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1k_portofimport` (
  `idportofimport` varchar(20) NOT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `portofimport_name` varchar(45) DEFAULT NULL,
  `portofimport_country` varchar(45) DEFAULT NULL,
  `portofimport_state` varchar(45) DEFAULT NULL,
  `portofimport_city_town` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idportofimport`),
  KEY `companyl3_idx` (`company_id`),
  CONSTRAINT `companyl3` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1j_clients` (
  `idclient` int(11) NOT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `client_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idclient`),
  KEY `companyl8_idx` (`company_id`),
  CONSTRAINT `companyl8` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1i_locations` (
  `idlocations` int(11) NOT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `location_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idlocations`),
  KEY `comapnyl1_idx` (`company_id`),
  CONSTRAINT `comapnyl1` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1l_segments` (
  `idsegments` varchar(20) NOT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `segment_name` varchar(20) DEFAULT NULL,
  `segments_client` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idsegments`),
  KEY `companyl4_idx` (`company_id`),
  CONSTRAINT `companyl4` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1m_certificates` (
  `idcertificates` varchar(20) NOT NULL,
  `certificates_name` varchar(20) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `certificates_relevance` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idcertificates`),
  KEY `activityl1_idx` (`activity_id`),
  CONSTRAINT `activityl1` FOREIGN KEY (`activity_id`) REFERENCES `1d_activity` (`idactivity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1n_activitytarget` (
  `idactivitytarget` int(11) NOT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `activitytarget_date` date DEFAULT NULL,
  `activitytarget_unit_measure` varchar(25) DEFAULT NULL,
  `activitytarget_target` int(11) DEFAULT NULL,
  PRIMARY KEY (`idactivitytarget`),
  KEY `companyl5_idx` (`company_id`),
  KEY `activityl2_idx` (`activity_id`),
  CONSTRAINT `activityl2` FOREIGN KEY (`activity_id`) REFERENCES `1d_activity` (`idactivity`),
  CONSTRAINT `companyl5` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1o_operators` (
  `idoperators` int(11) NOT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `operators_name` varchar(20) DEFAULT NULL,
  `operators_address` varchar(30) DEFAULT NULL,
  `operators_email` varchar(30) DEFAULT NULL,
  `operators_country` varchar(20) DEFAULT NULL,
  `operators_state` varchar(20) DEFAULT NULL,
  `operators_pincode` int(11) DEFAULT NULL,
  `operators_website` varchar(45) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idoperators`),
  KEY `locationl1_idx` (`location_id`),
  CONSTRAINT `locationl1` FOREIGN KEY (`location_id`) REFERENCES `1i_locations` (`idlocations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1p_operatorcontacts` (
  `idoperatorcontacts` int(11) NOT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `segment_id` varchar(20) DEFAULT NULL,
  `operatorcontacts_name` varchar(25) DEFAULT NULL,
  `operatorcontacts_designation` varchar(45) DEFAULT NULL,
  `operatorcontacts_email` varchar(25) DEFAULT NULL,
  `operatorcontacts_active_inavtive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idoperatorcontacts`),
  KEY `operatoridl1_idx` (`operator_id`),
  KEY `companyl6_idx` (`company_id`),
  KEY `locationl2_idx` (`location_id`),
  KEY `segmentl1_idx` (`segment_id`),
  CONSTRAINT `companyl6` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`),
  CONSTRAINT `locationl2` FOREIGN KEY (`location_id`) REFERENCES `1i_locations` (`idlocations`),
  CONSTRAINT `operatoridl1` FOREIGN KEY (`operator_id`) REFERENCES `1o_operators` (`idoperators`),
  CONSTRAINT `segmentl1` FOREIGN KEY (`segment_id`) REFERENCES `1l_segments` (`idsegments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1r_documents` (
  `iddocuments` int(11) NOT NULL,
  `documents_number` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `segment_id` varchar(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `certificate_id` varchar(20) DEFAULT NULL,
  `emp_id` varchar(20) DEFAULT NULL,
  `time_of_creation` time DEFAULT NULL,
  `date_of_creation` date DEFAULT NULL,
  PRIMARY KEY (`iddocuments`),
  KEY `operatorl4_idx` (`operator_id`),
  KEY `segmentl3_idx` (`segment_id`),
  KEY `locationl4_idx` (`location_id`),
  KEY `contractl1_idx` (`contract_id`),
  KEY `certificatel2_idx` (`certificate_id`),
  KEY `empl4_idx` (`emp_id`),
  KEY `clientl1_idx` (`client_id`),
  CONSTRAINT `certificatel2` FOREIGN KEY (`certificate_id`) REFERENCES `1m_certificates` (`idcertificates`),
  CONSTRAINT `clientl1` FOREIGN KEY (`client_id`) REFERENCES `1j_clients` (`idclient`),
  CONSTRAINT `contractl1` FOREIGN KEY (`contract_id`) REFERENCES `1q_contracts` (`idcontracts`),
  CONSTRAINT `empl4` FOREIGN KEY (`emp_id`) REFERENCES `1h_employee` (`idemployee`),
  CONSTRAINT `locationl4` FOREIGN KEY (`location_id`) REFERENCES `1i_locations` (`idlocations`),
  CONSTRAINT `operatorl4` FOREIGN KEY (`operator_id`) REFERENCES `1o_operators` (`idoperators`),
  CONSTRAINT `segmentl3` FOREIGN KEY (`segment_id`) REFERENCES `1l_segments` (`idsegments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1q_contracts` (
  `idcontracts` int(11) NOT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `company_id` varchar(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `contracts_number` int(11) DEFAULT NULL,
  `contracts_validity` tinyint(4) DEFAULT NULL,
  `segment_id` varchar(20) DEFAULT NULL,
  `operatorcontacts_id` int(11) DEFAULT NULL,
  `emp_id_1` varchar(20) DEFAULT NULL,
  `emp_id_2` varchar(20) DEFAULT NULL,
  `emp_id_3` varchar(20) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcontracts`),
  KEY `operatorl2_idx` (`operator_id`),
  KEY `comapnyl7_idx` (`company_id`),
  KEY `locationl3_idx` (`location_id`),
  KEY `segmentl2_idx` (`segment_id`),
  KEY `empl1_idx` (`emp_id_1`),
  KEY `empl2_idx` (`emp_id_2`),
  KEY `empl3_idx` (`emp_id_3`),
  CONSTRAINT `comapnyl7` FOREIGN KEY (`company_id`) REFERENCES `1g_company` (`idcompany`),
  CONSTRAINT `empl1` FOREIGN KEY (`emp_id_1`) REFERENCES `1h_employee` (`idemployee`),
  CONSTRAINT `empl2` FOREIGN KEY (`emp_id_2`) REFERENCES `1h_employee` (`idemployee`),
  CONSTRAINT `empl3` FOREIGN KEY (`emp_id_3`) REFERENCES `1h_employee` (`idemployee`),
  CONSTRAINT `locationl3` FOREIGN KEY (`location_id`) REFERENCES `1i_locations` (`idlocations`),
  CONSTRAINT `operatorl2` FOREIGN KEY (`operator_id`) REFERENCES `1o_operators` (`idoperators`),
  CONSTRAINT `segmentl2` FOREIGN KEY (`segment_id`) REFERENCES `1l_segments` (`idsegments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `1s_documentactivity` (
  `iddocumentactivity` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  `doc_date_of_creation` date DEFAULT NULL,
  `doc_date_of_allottment` date DEFAULT NULL,
  `emp_id` varchar(20) DEFAULT NULL,
  `allotted_to_emp_id` varchar(20) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddocumentactivity`),
  KEY `documentl2_idx` (`document_id`),
  KEY `empl5_idx` (`emp_id`),
  KEY `empl6_idx` (`allotted_to_emp_id`),
  CONSTRAINT `documentl2` FOREIGN KEY (`document_id`) REFERENCES `1r_documents` (`iddocuments`),
  CONSTRAINT `empl5` FOREIGN KEY (`emp_id`) REFERENCES `1h_employee` (`idemployee`),
  CONSTRAINT `empl6` FOREIGN KEY (`allotted_to_emp_id`) REFERENCES `1h_employee` (`idemployee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
