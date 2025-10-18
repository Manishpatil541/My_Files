--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: SEM; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "SEM";


ALTER SCHEMA "SEM" OWNER TO postgres;

--
-- Name: SCHEMA "SEM"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "SEM" IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE "SEM".auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".auth_group_id_seq OWNED BY "SEM".auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "SEM".auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".auth_group_permissions_id_seq OWNED BY "SEM".auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE "SEM".auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".auth_permission_id_seq OWNED BY "SEM".auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE "SEM".auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE "SEM".auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".auth_user_groups_id_seq OWNED BY "SEM".auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".auth_user_id_seq OWNED BY "SEM".auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE "SEM".auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".auth_user_user_permissions_id_seq OWNED BY "SEM".auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE "SEM".django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".django_admin_log_id_seq OWNED BY "SEM".django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE "SEM".django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".django_content_type_id_seq OWNED BY "SEM".django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE "SEM".django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".django_migrations_id_seq OWNED BY "SEM".django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE "SEM".django_session OWNER TO postgres;

--
-- Name: sem_controller; Type: TABLE; Schema: SEM; Owner: postgres
--

CREATE TABLE "SEM".sem_controller (
    id bigint NOT NULL,
    alaram_option character varying(50) NOT NULL,
    high_temp_alarm_threshold numeric(10,2),
    low_temp_alarm_threshold numeric(10,2),
    alarm_hysteresis numeric(10,2),
    alarm_delay integer NOT NULL,
    startup_alarm_delay integer NOT NULL,
    discharge_air_sensor_failure boolean NOT NULL,
    defrost_temp_sensor_failure boolean NOT NULL,
    sensor_3_failure boolean NOT NULL,
    condensing_unit_sensor_failure boolean NOT NULL,
    high_temp_alarm boolean NOT NULL,
    low_temp_alarm boolean NOT NULL,
    external_alarm boolean NOT NULL,
    pressure_switches_trip boolean NOT NULL,
    door_open_status boolean NOT NULL,
    condensing_unit_high_temp_alarm boolean NOT NULL,
    condensing_unit_low_temp_alarm boolean NOT NULL,
    auxiliary_relay_action character varying(50) NOT NULL,
    auxiliary_relay_setpoint numeric(10,2),
    auxiliary_relay_differential numeric(10,2),
    auxiliary_relay_probe_selection character varying(50) NOT NULL,
    auxiliary_relay_switched_off_during_defrost character varying(50) NOT NULL,
    defrost_mode character varying(50) NOT NULL,
    defrost_termination_setpoint numeric(10,2),
    defrost_interval integer NOT NULL,
    max_defrost_duration integer NOT NULL,
    defrost_delay integer NOT NULL,
    drip_time integer NOT NULL,
    defrost_delay_after_fast_freezing numeric(10,2),
    fan_mode character varying(50) NOT NULL,
    fan_delay_after_defrost integer NOT NULL,
    fan_temp_hystersis numeric(10,2),
    fan_stop_temp_setpoint numeric(10,2),
    fan_ontime integer NOT NULL,
    fan_offtime integer NOT NULL,
    compressor_fan_status_when_door_open character varying(50) NOT NULL,
    probe_sensor_type character varying(50) NOT NULL,
    discharge_air_temp numeric(10,2),
    defrost_temp_read numeric(10,2),
    probe_3_value numeric(10,2),
    probe_4_value numeric(10,2),
    dl1_status boolean NOT NULL,
    dl2_status boolean NOT NULL,
    defrost_status boolean NOT NULL,
    alarm_status boolean NOT NULL,
    light_status boolean NOT NULL,
    fan_status boolean NOT NULL,
    aux_relay_status boolean NOT NULL,
    compressor_status boolean NOT NULL,
    buzzer_status boolean NOT NULL,
    device_override boolean NOT NULL,
    defrost_override boolean NOT NULL,
    pulldown_override boolean NOT NULL,
    keyboard_lock_unlock_status boolean NOT NULL,
    mute_alarm_override boolean NOT NULL,
    light_override boolean NOT NULL,
    auxiliary_relay_override boolean NOT NULL,
    differential_for_cut_in numeric(10,2),
    minimum_setpoint_limit numeric(10,2),
    maximum_setpoint_limit numeric(10,2),
    compressor_startup_delay integer NOT NULL,
    minimum_compressor_off_time integer NOT NULL,
    pulldown_duration numeric(10,2),
    pulldown_setpoint numeric(10,2),
    failsafe_compressor_on_time integer NOT NULL,
    failsafe_compressor_off_time integer NOT NULL,
    temp_measurement_unit character varying(50) NOT NULL,
    active_setpoint numeric(10,2),
    control_setpoint numeric(10,2),
    modbus_slave_address integer NOT NULL,
    controller_enable character varying(50) NOT NULL,
    controller_status character varying(50) NOT NULL,
    neutral_zone_status boolean NOT NULL,
    energy_saving_status boolean NOT NULL,
    created_on timestamp with time zone NOT NULL,
    modified_on timestamp with time zone NOT NULL
);


ALTER TABLE "SEM".sem_controller OWNER TO postgres;

--
-- Name: sem_controller_id_seq; Type: SEQUENCE; Schema: SEM; Owner: postgres
--

CREATE SEQUENCE "SEM".sem_controller_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SEM".sem_controller_id_seq OWNER TO postgres;

--
-- Name: sem_controller_id_seq; Type: SEQUENCE OWNED BY; Schema: SEM; Owner: postgres
--

ALTER SEQUENCE "SEM".sem_controller_id_seq OWNED BY "SEM".sem_controller.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group ALTER COLUMN id SET DEFAULT nextval('"SEM".auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('"SEM".auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_permission ALTER COLUMN id SET DEFAULT nextval('"SEM".auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user ALTER COLUMN id SET DEFAULT nextval('"SEM".auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_groups ALTER COLUMN id SET DEFAULT nextval('"SEM".auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('"SEM".auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_admin_log ALTER COLUMN id SET DEFAULT nextval('"SEM".django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_content_type ALTER COLUMN id SET DEFAULT nextval('"SEM".django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_migrations ALTER COLUMN id SET DEFAULT nextval('"SEM".django_migrations_id_seq'::regclass);


--
-- Name: sem_controller id; Type: DEFAULT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".sem_controller ALTER COLUMN id SET DEFAULT nextval('"SEM".sem_controller_id_seq'::regclass);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: sem_controller sem_controller_pkey; Type: CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".sem_controller
    ADD CONSTRAINT sem_controller_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON "SEM".auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON "SEM".auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON "SEM".auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON "SEM".auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON "SEM".auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON "SEM".auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON "SEM".auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON "SEM".auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON "SEM".auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON "SEM".django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON "SEM".django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON "SEM".django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: SEM; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON "SEM".django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES "SEM".auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES "SEM".auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES "SEM".django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES "SEM".auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "SEM".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES "SEM".auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "SEM".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES "SEM".django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: SEM; Owner: postgres
--

ALTER TABLE ONLY "SEM".django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES "SEM".auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

