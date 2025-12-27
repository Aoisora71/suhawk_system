--
-- PostgreSQL database dump
--

\restrict yY03FEAuBswKrEGMRZgwlpk30Isp5xhpp0gb7cosB4IAWZ9U9Lqd0JbF5g0NaBe

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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

ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_job_id_fkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_department_id_fkey;
ALTER TABLE IF EXISTS ONLY public.surveys DROP CONSTRAINT IF EXISTS surveys_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.survey_progress DROP CONSTRAINT IF EXISTS survey_progress_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.survey_progress DROP CONSTRAINT IF EXISTS survey_progress_survey_id_fkey;
ALTER TABLE IF EXISTS ONLY public.password_reset_tokens DROP CONSTRAINT IF EXISTS password_reset_tokens_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_summary DROP CONSTRAINT IF EXISTS organizational_survey_summary_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_summary DROP CONSTRAINT IF EXISTS organizational_survey_summary_survey_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_results DROP CONSTRAINT IF EXISTS organizational_survey_results_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_results DROP CONSTRAINT IF EXISTS organizational_survey_results_survey_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_free_text_responses DROP CONSTRAINT IF EXISTS organizational_survey_free_text_responses_uid_fkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_free_text_responses DROP CONSTRAINT IF EXISTS organizational_survey_free_text_responses_qid_fkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_free_text_responses DROP CONSTRAINT IF EXISTS organizational_survey_free_text_responses_osid_fkey;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS notifications_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS notifications_survey_id_fkey;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS notifications_created_by_fkey;
ALTER TABLE IF EXISTS ONLY public.login_logs DROP CONSTRAINT IF EXISTS login_logs_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_summary DROP CONSTRAINT IF EXISTS growth_survey_summary_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_summary DROP CONSTRAINT IF EXISTS growth_survey_summary_survey_id_fkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_responses DROP CONSTRAINT IF EXISTS growth_survey_responses_gsid_fkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_responses DROP CONSTRAINT IF EXISTS growth_survey_responses_gqid_fkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_free_text_responses DROP CONSTRAINT IF EXISTS growth_survey_free_text_responses_uid_fkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_free_text_responses DROP CONSTRAINT IF EXISTS growth_survey_free_text_responses_gsid_fkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_free_text_responses DROP CONSTRAINT IF EXISTS growth_survey_free_text_responses_gqid_fkey;
ALTER TABLE IF EXISTS ONLY public.departments DROP CONSTRAINT IF EXISTS departments_parent_id_fkey;
DROP TRIGGER IF EXISTS trg_organizational_survey_free_text_responses_updated_at ON public.organizational_survey_free_text_responses;
DROP TRIGGER IF EXISTS trg_growth_survey_free_text_responses_updated_at ON public.growth_survey_free_text_responses;
DROP INDEX IF EXISTS public.idx_users_role;
DROP INDEX IF EXISTS public.idx_users_job_id;
DROP INDEX IF EXISTS public.idx_users_email;
DROP INDEX IF EXISTS public.idx_users_dept_job;
DROP INDEX IF EXISTS public.idx_users_department_id;
DROP INDEX IF EXISTS public.idx_users_created_at;
DROP INDEX IF EXISTS public.idx_surveys_status;
DROP INDEX IF EXISTS public.idx_surveys_dates;
DROP INDEX IF EXISTS public.idx_survey_progress_user_survey;
DROP INDEX IF EXISTS public.idx_survey_progress_user_id;
DROP INDEX IF EXISTS public.idx_survey_progress_survey_id;
DROP INDEX IF EXISTS public.idx_survey_progress_question_id;
DROP INDEX IF EXISTS public.idx_survey_progress_category_id;
DROP INDEX IF EXISTS public.idx_rate_limits_identifier;
DROP INDEX IF EXISTS public.idx_rate_limits_expires;
DROP INDEX IF EXISTS public.idx_problems_question_type;
DROP INDEX IF EXISTS public.idx_problems_display_order_copy1;
DROP INDEX IF EXISTS public.idx_problems_display_order;
DROP INDEX IF EXISTS public.idx_problems_created_at_copy1;
DROP INDEX IF EXISTS public.idx_problems_created_at;
DROP INDEX IF EXISTS public.idx_problems_category_id_copy1;
DROP INDEX IF EXISTS public.idx_problems_category_id;
DROP INDEX IF EXISTS public.idx_problems_category_copy1;
DROP INDEX IF EXISTS public.idx_problems_category;
DROP INDEX IF EXISTS public.idx_password_reset_tokens_user_id;
DROP INDEX IF EXISTS public.idx_password_reset_tokens_token;
DROP INDEX IF EXISTS public.idx_organizational_survey_summary_uid;
DROP INDEX IF EXISTS public.idx_organizational_survey_summary_osid;
DROP INDEX IF EXISTS public.idx_organizational_survey_summary_created_at;
DROP INDEX IF EXISTS public.idx_organizational_survey_results_uid;
DROP INDEX IF EXISTS public.idx_organizational_survey_results_response;
DROP INDEX IF EXISTS public.idx_organizational_survey_results_osid;
DROP INDEX IF EXISTS public.idx_organizational_survey_results_created_at;
DROP INDEX IF EXISTS public.idx_organizational_survey_free_text_responses_uid;
DROP INDEX IF EXISTS public.idx_organizational_survey_free_text_responses_qid;
DROP INDEX IF EXISTS public.idx_organizational_survey_free_text_responses_osid;
DROP INDEX IF EXISTS public.idx_organizational_survey_free_text_responses_created_at;
DROP INDEX IF EXISTS public.idx_notifications_user_id_is_read;
DROP INDEX IF EXISTS public.idx_notifications_user_id;
DROP INDEX IF EXISTS public.idx_notifications_created_at;
DROP INDEX IF EXISTS public.idx_login_logs_user_id;
DROP INDEX IF EXISTS public.idx_login_logs_status;
DROP INDEX IF EXISTS public.idx_login_logs_login_at;
DROP INDEX IF EXISTS public.idx_login_logs_email;
DROP INDEX IF EXISTS public.idx_jobs_name;
DROP INDEX IF EXISTS public.idx_growth_survey_summary_uid;
DROP INDEX IF EXISTS public.idx_growth_survey_summary_gsid;
DROP INDEX IF EXISTS public.idx_growth_survey_summary_created_at;
DROP INDEX IF EXISTS public.idx_growth_survey_responses_result;
DROP INDEX IF EXISTS public.idx_growth_survey_responses_gsid;
DROP INDEX IF EXISTS public.idx_growth_survey_responses_gqid;
DROP INDEX IF EXISTS public.idx_growth_survey_responses_created_at;
DROP INDEX IF EXISTS public.idx_growth_survey_responses_cid;
DROP INDEX IF EXISTS public.idx_growth_survey_questions_question_type;
DROP INDEX IF EXISTS public.idx_growth_survey_questions_display_order;
DROP INDEX IF EXISTS public.idx_growth_survey_free_text_responses_uid;
DROP INDEX IF EXISTS public.idx_growth_survey_free_text_responses_gsid;
DROP INDEX IF EXISTS public.idx_growth_survey_free_text_responses_gqid;
DROP INDEX IF EXISTS public.idx_growth_survey_free_text_responses_created_at;
DROP INDEX IF EXISTS public.idx_growth_questions_weight;
DROP INDEX IF EXISTS public.idx_growth_questions_focus_area;
DROP INDEX IF EXISTS public.idx_growth_questions_category;
DROP INDEX IF EXISTS public.idx_departments_parent_id;
DROP INDEX IF EXISTS public.idx_departments_name;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_email_key;
ALTER TABLE IF EXISTS ONLY public.surveys DROP CONSTRAINT IF EXISTS surveys_pkey;
ALTER TABLE IF EXISTS ONLY public.survey_progress DROP CONSTRAINT IF EXISTS survey_progress_user_id_survey_id_question_id_key;
ALTER TABLE IF EXISTS ONLY public.survey_progress DROP CONSTRAINT IF EXISTS survey_progress_pkey;
ALTER TABLE IF EXISTS ONLY public.rate_limits DROP CONSTRAINT IF EXISTS rate_limits_pkey;
ALTER TABLE IF EXISTS ONLY public.rate_limits DROP CONSTRAINT IF EXISTS rate_limits_identifier_created_at_key;
ALTER TABLE IF EXISTS ONLY public.problems DROP CONSTRAINT IF EXISTS problems_pkey;
ALTER TABLE IF EXISTS ONLY public.problems_copy1 DROP CONSTRAINT IF EXISTS problems_copy1_pkey;
ALTER TABLE IF EXISTS ONLY public.password_reset_tokens DROP CONSTRAINT IF EXISTS password_reset_tokens_token_key;
ALTER TABLE IF EXISTS ONLY public.password_reset_tokens DROP CONSTRAINT IF EXISTS password_reset_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_summary DROP CONSTRAINT IF EXISTS organizational_survey_summary_uid_osid_key;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_summary DROP CONSTRAINT IF EXISTS organizational_survey_summary_pkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_results DROP CONSTRAINT IF EXISTS organizational_survey_results_uid_osid_key;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_results DROP CONSTRAINT IF EXISTS organizational_survey_results_pkey;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_free_text_responses DROP CONSTRAINT IF EXISTS organizational_survey_free_text_responses_uid_osid_qid_key;
ALTER TABLE IF EXISTS ONLY public.organizational_survey_free_text_responses DROP CONSTRAINT IF EXISTS organizational_survey_free_text_responses_pkey;
ALTER TABLE IF EXISTS ONLY public.notifications DROP CONSTRAINT IF EXISTS notifications_pkey;
ALTER TABLE IF EXISTS ONLY public.login_logs DROP CONSTRAINT IF EXISTS login_logs_pkey;
ALTER TABLE IF EXISTS ONLY public.jobs DROP CONSTRAINT IF EXISTS jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.jobs DROP CONSTRAINT IF EXISTS jobs_name_key;
ALTER TABLE IF EXISTS ONLY public.growth_survey_summary DROP CONSTRAINT IF EXISTS growth_survey_summary_uid_gsid_key;
ALTER TABLE IF EXISTS ONLY public.growth_survey_summary DROP CONSTRAINT IF EXISTS growth_survey_summary_pkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_responses DROP CONSTRAINT IF EXISTS growth_survey_responses_pkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_responses DROP CONSTRAINT IF EXISTS growth_survey_responses_gqid_gsid_key;
ALTER TABLE IF EXISTS ONLY public.growth_survey_questions DROP CONSTRAINT IF EXISTS growth_survey_questions_pkey;
ALTER TABLE IF EXISTS ONLY public.growth_survey_free_text_responses DROP CONSTRAINT IF EXISTS growth_survey_free_text_responses_uid_gsid_gqid_key;
ALTER TABLE IF EXISTS ONLY public.growth_survey_free_text_responses DROP CONSTRAINT IF EXISTS growth_survey_free_text_responses_pkey;
ALTER TABLE IF EXISTS ONLY public.departments DROP CONSTRAINT IF EXISTS departments_pkey;
ALTER TABLE IF EXISTS ONLY public.departments DROP CONSTRAINT IF EXISTS departments_name_key;
ALTER TABLE IF EXISTS public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.surveys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.survey_progress ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.rate_limits ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.problems ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.password_reset_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.organizational_survey_summary ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.organizational_survey_results ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.organizational_survey_free_text_responses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.notifications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.login_logs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.growth_survey_summary ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.growth_survey_responses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.growth_survey_questions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.growth_survey_free_text_responses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.departments ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.users_id_seq;
DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.surveys_id_seq;
DROP TABLE IF EXISTS public.surveys;
DROP SEQUENCE IF EXISTS public.survey_progress_id_seq;
DROP TABLE IF EXISTS public.survey_progress;
DROP SEQUENCE IF EXISTS public.rate_limits_id_seq;
DROP TABLE IF EXISTS public.rate_limits;
DROP TABLE IF EXISTS public.problems_copy1;
DROP SEQUENCE IF EXISTS public.problems_id_seq;
DROP TABLE IF EXISTS public.problems;
DROP SEQUENCE IF EXISTS public.password_reset_tokens_id_seq;
DROP TABLE IF EXISTS public.password_reset_tokens;
DROP SEQUENCE IF EXISTS public.organizational_survey_summary_id_seq;
DROP TABLE IF EXISTS public.organizational_survey_summary;
DROP SEQUENCE IF EXISTS public.organizational_survey_results_id_seq;
DROP TABLE IF EXISTS public.organizational_survey_results;
DROP SEQUENCE IF EXISTS public.organizational_survey_free_text_responses_id_seq;
DROP TABLE IF EXISTS public.organizational_survey_free_text_responses;
DROP SEQUENCE IF EXISTS public.notifications_id_seq;
DROP TABLE IF EXISTS public.notifications;
DROP SEQUENCE IF EXISTS public.login_logs_id_seq;
DROP TABLE IF EXISTS public.login_logs;
DROP SEQUENCE IF EXISTS public.jobs_id_seq;
DROP TABLE IF EXISTS public.jobs;
DROP SEQUENCE IF EXISTS public.growth_survey_summary_id_seq;
DROP TABLE IF EXISTS public.growth_survey_summary;
DROP SEQUENCE IF EXISTS public.growth_survey_responses_id_seq;
DROP TABLE IF EXISTS public.growth_survey_responses;
DROP SEQUENCE IF EXISTS public.growth_survey_questions_id_seq;
DROP TABLE IF EXISTS public.growth_survey_questions;
DROP SEQUENCE IF EXISTS public.growth_survey_free_text_responses_id_seq;
DROP TABLE IF EXISTS public.growth_survey_free_text_responses;
DROP SEQUENCE IF EXISTS public.departments_id_seq;
DROP TABLE IF EXISTS public.departments;
DROP FUNCTION IF EXISTS public.update_updated_at_column();
DROP FUNCTION IF EXISTS public.update_growth_survey_summary_updated_at();
--
-- Name: update_growth_survey_summary_updated_at(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_growth_survey_summary_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(50),
    description text,
    parent_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: growth_survey_free_text_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_survey_free_text_responses (
    id integer NOT NULL,
    uid integer NOT NULL,
    gsid integer NOT NULL,
    gqid integer NOT NULL,
    answer_text text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: growth_survey_free_text_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_survey_free_text_responses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_survey_free_text_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_survey_free_text_responses_id_seq OWNED BY public.growth_survey_free_text_responses.id;


--
-- Name: growth_survey_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_survey_questions (
    id integer NOT NULL,
    question_text text NOT NULL,
    category character varying(100),
    target_jobs jsonb,
    answers jsonb,
    focus_area character varying(255),
    answer_type character varying(50) DEFAULT 'scale'::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    weight numeric(5,2) DEFAULT 1.0,
    display_order integer NOT NULL,
    question_type character varying(20) DEFAULT 'single_choice'::character varying NOT NULL,
    CONSTRAINT growth_survey_questions_question_type_check CHECK (((question_type)::text = ANY (ARRAY[('single_choice'::character varying)::text, ('free_text'::character varying)::text])))
);


--
-- Name: COLUMN growth_survey_questions.weight; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.growth_survey_questions.weight IS '問題のスコア比重（カテゴリ内での割合）';


--
-- Name: COLUMN growth_survey_questions.display_order; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.growth_survey_questions.display_order IS '質問の表示順序（小さい値が先に表示される）';


--
-- Name: growth_survey_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_survey_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_survey_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_survey_questions_id_seq OWNED BY public.growth_survey_questions.id;


--
-- Name: growth_survey_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_survey_responses (
    id integer NOT NULL,
    gqid integer NOT NULL,
    gsid integer NOT NULL,
    cid character varying(100),
    result jsonb DEFAULT '[]'::jsonb NOT NULL,
    total_score numeric(10,2) DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: growth_survey_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_survey_responses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_survey_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_survey_responses_id_seq OWNED BY public.growth_survey_responses.id;


--
-- Name: growth_survey_summary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.growth_survey_summary (
    id integer NOT NULL,
    uid integer NOT NULL,
    gsid integer NOT NULL,
    cat1_score numeric(10,2) DEFAULT 0,
    cat2_score numeric(10,2) DEFAULT 0,
    cat3_score numeric(10,2) DEFAULT 0,
    cat4_score numeric(10,2) DEFAULT 0,
    cat5_score numeric(10,2) DEFAULT 0,
    total_score numeric(10,2) DEFAULT 0,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: growth_survey_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.growth_survey_summary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: growth_survey_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.growth_survey_summary_id_seq OWNED BY public.growth_survey_summary.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(50),
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: TABLE jobs; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.jobs IS 'Jobs/Positions table - department relationship removed';


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: login_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_logs (
    id integer NOT NULL,
    user_id integer,
    email character varying(255) NOT NULL,
    login_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ip_address character varying(45),
    user_agent text,
    login_status character varying(20) DEFAULT 'success'::character varying NOT NULL,
    failure_reason text
);


--
-- Name: login_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.login_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: login_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.login_logs_id_seq OWNED BY public.login_logs.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    survey_id integer,
    title character varying(255) DEFAULT 'Organizational Survey Response Request'::character varying NOT NULL,
    message text NOT NULL,
    is_read boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    read_at timestamp with time zone,
    created_by integer
);


--
-- Name: TABLE notifications; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.notifications IS 'Table to store notifications sent to employees';


--
-- Name: COLUMN notifications.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.user_id IS 'User ID who receives the notification';


--
-- Name: COLUMN notifications.survey_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.survey_id IS 'Related survey ID (optional)';


--
-- Name: COLUMN notifications.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.title IS 'Notification title';


--
-- Name: COLUMN notifications.message; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.message IS 'Notification message content';


--
-- Name: COLUMN notifications.is_read; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.is_read IS 'Read flag';


--
-- Name: COLUMN notifications.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.created_at IS 'Notification creation timestamp';


--
-- Name: COLUMN notifications.read_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.read_at IS 'Read timestamp';


--
-- Name: COLUMN notifications.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.notifications.created_by IS 'User ID of the admin who sent the notification';


--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: organizational_survey_free_text_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizational_survey_free_text_responses (
    id integer NOT NULL,
    uid integer NOT NULL,
    osid integer NOT NULL,
    qid integer NOT NULL,
    answer_text text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: organizational_survey_free_text_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizational_survey_free_text_responses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizational_survey_free_text_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizational_survey_free_text_responses_id_seq OWNED BY public.organizational_survey_free_text_responses.id;


--
-- Name: organizational_survey_results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizational_survey_results (
    id integer NOT NULL,
    uid integer NOT NULL,
    osid integer NOT NULL,
    response jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    response_rate numeric(5,2) DEFAULT 0.00
);


--
-- Name: COLUMN organizational_survey_results.response_rate; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organizational_survey_results.response_rate IS 'Percentage of questions answered out of total questions (0.00 to 100.00)';


--
-- Name: organizational_survey_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizational_survey_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizational_survey_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizational_survey_results_id_seq OWNED BY public.organizational_survey_results.id;


--
-- Name: organizational_survey_summary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizational_survey_summary (
    id integer NOT NULL,
    uid integer NOT NULL,
    osid integer NOT NULL,
    category1_score numeric(10,2) DEFAULT 0,
    category2_score numeric(10,2) DEFAULT 0,
    category3_score numeric(10,2) DEFAULT 0,
    category4_score numeric(10,2) DEFAULT 0,
    category5_score numeric(10,2) DEFAULT 0,
    category6_score numeric(10,2) DEFAULT 0,
    category7_score numeric(10,2) DEFAULT 0,
    category8_score numeric(10,2) DEFAULT 0,
    total_score numeric(10,2) DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: organizational_survey_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizational_survey_summary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizational_survey_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizational_survey_summary_id_seq OWNED BY public.organizational_survey_summary.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    used_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.password_reset_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problems (
    id integer NOT NULL,
    question_text text NOT NULL,
    category character varying(100),
    answer1_score numeric(10,2) DEFAULT 1.00 NOT NULL,
    answer2_score numeric(10,2) DEFAULT 2.00 NOT NULL,
    answer3_score numeric(10,2) DEFAULT 3.00 NOT NULL,
    answer4_score numeric(10,2) DEFAULT 4.00 NOT NULL,
    answer5_score numeric(10,2) DEFAULT 5.00 NOT NULL,
    answer6_score numeric(10,2) DEFAULT 6.00 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    category_id integer,
    display_order integer NOT NULL,
    question_type character varying(20) DEFAULT 'single_choice'::character varying NOT NULL,
    CONSTRAINT problems_question_type_check CHECK (((question_type)::text = ANY (ARRAY[('single_choice'::character varying)::text, ('free_text'::character varying)::text])))
);


--
-- Name: COLUMN problems.display_order; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.problems.display_order IS '質問の表示順序（小さい値が先に表示される）';


--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.problems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- Name: problems_copy1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problems_copy1 (
    id integer DEFAULT nextval('public.problems_id_seq'::regclass) NOT NULL,
    question_text text NOT NULL,
    category character varying(100) NOT NULL,
    answer1_score numeric(10,2) DEFAULT 1.00 NOT NULL,
    answer2_score numeric(10,2) DEFAULT 2.00 NOT NULL,
    answer3_score numeric(10,2) DEFAULT 3.00 NOT NULL,
    answer4_score numeric(10,2) DEFAULT 4.00 NOT NULL,
    answer5_score numeric(10,2) DEFAULT 5.00 NOT NULL,
    answer6_score numeric(10,2) DEFAULT 6.00 NOT NULL,
    created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP,
    category_id integer,
    display_order integer NOT NULL
);


--
-- Name: COLUMN problems_copy1.display_order; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.problems_copy1.display_order IS '質問の表示順序（小さい値が先に表示される）';


--
-- Name: rate_limits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rate_limits (
    id integer NOT NULL,
    identifier text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone NOT NULL
);


--
-- Name: rate_limits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rate_limits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rate_limits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rate_limits_id_seq OWNED BY public.rate_limits.id;


--
-- Name: survey_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.survey_progress (
    id integer NOT NULL,
    user_id integer NOT NULL,
    survey_id integer NOT NULL,
    question_id integer NOT NULL,
    category_id integer NOT NULL,
    answer_value integer NOT NULL,
    score numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT survey_progress_answer_value_check CHECK (((answer_value >= 1) AND (answer_value <= 6)))
);


--
-- Name: survey_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.survey_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: survey_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.survey_progress_id_seq OWNED BY public.survey_progress.id;


--
-- Name: surveys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.surveys (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status character varying(50) DEFAULT 'active'::character varying NOT NULL,
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    survey_type character varying(32) DEFAULT 'organizational'::character varying NOT NULL
);


--
-- Name: surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.surveys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.surveys_id_seq OWNED BY public.surveys.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    date_of_birth date,
    department character varying(255),
    "position" character varying(255),
    role character varying(50) DEFAULT 'employee'::character varying NOT NULL,
    years_of_service integer,
    address character varying(500),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    department_id integer,
    job_id integer,
    pending_password_hash text,
    password_reset_requested_at timestamp with time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: growth_survey_free_text_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_free_text_responses ALTER COLUMN id SET DEFAULT nextval('public.growth_survey_free_text_responses_id_seq'::regclass);


--
-- Name: growth_survey_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_questions ALTER COLUMN id SET DEFAULT nextval('public.growth_survey_questions_id_seq'::regclass);


--
-- Name: growth_survey_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_responses ALTER COLUMN id SET DEFAULT nextval('public.growth_survey_responses_id_seq'::regclass);


--
-- Name: growth_survey_summary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_summary ALTER COLUMN id SET DEFAULT nextval('public.growth_survey_summary_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: login_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_logs ALTER COLUMN id SET DEFAULT nextval('public.login_logs_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: organizational_survey_free_text_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_free_text_responses ALTER COLUMN id SET DEFAULT nextval('public.organizational_survey_free_text_responses_id_seq'::regclass);


--
-- Name: organizational_survey_results id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_results ALTER COLUMN id SET DEFAULT nextval('public.organizational_survey_results_id_seq'::regclass);


--
-- Name: organizational_survey_summary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_summary ALTER COLUMN id SET DEFAULT nextval('public.organizational_survey_summary_id_seq'::regclass);


--
-- Name: password_reset_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- Name: rate_limits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_limits ALTER COLUMN id SET DEFAULT nextval('public.rate_limits_id_seq'::regclass);


--
-- Name: survey_progress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_progress ALTER COLUMN id SET DEFAULT nextval('public.survey_progress_id_seq'::regclass);


--
-- Name: surveys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surveys ALTER COLUMN id SET DEFAULT nextval('public.surveys_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.departments (id, name, code, description, parent_id, created_at, updated_at) FROM stdin;
1	代表取締役	1	\N	\N	2025-11-02 21:11:46.179108	2025-11-25 18:47:08.653923
2	輸送事業部	2	\N	1	2025-11-02 21:11:46.179108	2025-11-25 19:20:00.167197
3	輸送一課	3	\N	2	2025-11-02 21:11:46.179108	2025-11-25 19:21:43.387507
8	輸送二課	4	\N	2	2025-11-02 21:24:01.078451	2025-11-25 19:21:49.726794
28	輸送三課	5	\N	2	2025-11-03 13:48:36.660743	2025-11-25 19:21:55.946814
32	管理課	6	\N	1	2025-11-03 13:48:48.415632	2025-11-25 19:22:00.787556
14	TWO-EIGHT事業	7	\N	1	2025-11-03 13:42:42.366567	2025-11-25 19:22:10.189034
44	葵FARM事業	8	\N	1	2025-11-03 14:35:49.247037	2025-11-25 19:22:18.447369
\.


--
-- Data for Name: growth_survey_free_text_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.growth_survey_free_text_responses (id, uid, gsid, gqid, answer_text, created_at, updated_at) FROM stdin;
27	300	24	28	addf	2025-12-21 13:47:39.364496+00	2025-12-21 14:24:25.495241+00
28	300	24	30	asdfasdf	2025-12-21 13:47:42.960815+00	2025-12-21 14:24:31.073579+00
29	300	24	33	asdfasdf	2025-12-21 13:47:49.372181+00	2025-12-21 14:24:36.248441+00
30	300	24	10	asdfasdf	2025-12-21 13:47:56.226137+00	2025-12-21 14:24:41.376068+00
31	298	24	28	sdfsdf	2025-12-21 14:32:32.777765+00	2025-12-21 14:32:32.777765+00
32	298	24	30	xcv	2025-12-21 14:56:45.819847+00	2025-12-21 14:56:45.819847+00
33	301	24	28	asdfasdf	2025-12-21 15:32:34.630298+00	2025-12-21 15:32:34.630298+00
34	301	24	30	asdfa	2025-12-21 15:32:38.00553+00	2025-12-21 15:32:38.00553+00
35	301	24	33	asdfasdf	2025-12-21 15:33:12.33407+00	2025-12-21 15:33:12.33407+00
36	301	24	10	asdfasdf	2025-12-21 15:33:21.880508+00	2025-12-21 15:33:21.880508+00
\.


--
-- Data for Name: growth_survey_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.growth_survey_questions (id, question_text, category, target_jobs, answers, focus_area, answer_type, is_active, created_at, updated_at, weight, display_order, question_type) FROM stdin;
33	6の質問に関して、具体的にどのようなルールがありますか。（1～3個）	\N	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	\N	\N	scale	t	2025-12-18 15:27:30.2758+00	2025-12-19 02:13:07.136139+00	\N	8	free_text
8	ルールの不備や変更要望を上げる仕組みがある認識ですか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "ない", "score": 0}]	\N	scale	t	2025-11-29 02:01:05.715608+00	2025-12-19 02:13:07.136139+00	1.00	13	single_choice
11	直近3か月間の内、上司から感情的な態度を取られたことはありませんか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "ない", "score": 0}]	\N	scale	t	2025-11-29 02:04:39.675497+00	2025-12-19 02:29:01.43086+00	0.00	14	single_choice
25	全社の姿勢のルール（就業規則以外で、全社員が共通で守るべき明文化されたルール）はありますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "ない", "score": 0}]	\N	scale	t	2025-12-16 16:42:12.398106+00	2025-12-19 02:13:07.136139+00	0.50	3	single_choice
30	2の質問に関して、具体的にどのようなルールがありますか。（1～3個）	\N	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	\N	\N	scale	t	2025-12-18 12:35:48.582977+00	2025-12-19 02:13:07.136139+00	\N	4	free_text
31	2の質問に関して、ルールブック化（マニュアル化）はされていますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "されている", "score": 1}, {"text": "されていない（わからない）", "score": 0}]	\N	scale	t	2025-12-18 12:41:22.743445+00	2025-12-19 02:13:07.136139+00	0.50	5	single_choice
32	姿勢のルールに関して、部署・課・係（チーム）単位の姿勢のルールはありますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "ない（わからない）", "score": 0}]	\N	scale	t	2025-12-18 15:25:45.425049+00	2025-12-19 02:13:07.136139+00	0.50	7	single_choice
4	部署単位もしくはチーム単位のルール（ブック）の格納場所を知っていますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "知っている", "score": 1}, {"text": "知らない", "score": 0}]	\N	scale	t	2025-11-29 01:52:40.125153+00	2025-12-19 02:13:07.136139+00	0.50	10	single_choice
10	10の質問で「違反したが指摘を受けたことがない」を選んだ方：どのようなルールに違反しましたか。	\N	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 0}, {"text": "ない", "score": 1}]	\N	scale	t	2025-11-29 02:03:16.418804+00	2025-12-19 02:13:07.136139+00	\N	12	free_text
17	新入社員に対する新人卒業までの育成プランが運用できていますか。	組織体制	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "できている", "score": 1}, {"text": "できていない", "score": 0}]	\N	scale	t	2025-11-29 02:10:16.482844+00	2025-12-19 02:13:07.136139+00	1.00	19	single_choice
15	組織運営の教育研修（識学理論など）が最下層まで運用できていますか。	組織体制	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "できている", "score": 1}, {"text": "できていない", "score": 0}]	\N	scale	t	2025-11-29 02:08:37.881701+00	2025-12-19 02:13:07.136139+00	1.00	20	single_choice
14	現在の組織で、より上の役職に就きたいと思いますか。	組織体制	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "思う", "score": 1}, {"text": "思わない", "score": 0}]	\N	scale	t	2025-11-29 02:08:05.116583+00	2025-12-19 02:13:07.136139+00	1.00	21	single_choice
23	週次会議の際、責任を果たすために必要な権限の相談や取得をしていますか？	週報・会議	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "行われている", "score": 1}, {"text": "行われていない", "score": 0}]	\N	scale	t	2025-11-29 02:21:33.059324+00	2025-12-19 02:13:07.136139+00	2.00	26	single_choice
9	社内または外部機関に、労務問題やハラスメントに関する相談窓口はありますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "ない", "score": 0}]	\N	scale	t	2025-11-29 02:02:05.792738+00	2025-12-19 02:13:07.136139+00	1.00	15	single_choice
12	会社の組織図を確認できる格納場所を知っていますか。	組織体制	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "知っている", "score": 1}, {"text": "知らない", "score": 0}]	\N	scale	t	2025-11-29 02:05:42.808179+00	2025-12-19 02:13:07.136139+00	1.00	16	single_choice
16	直属の上司は一人であると認識していますか。	組織体制	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "1人", "score": 1}, {"text": "複数いる", "score": 0}]	\N	scale	t	2025-11-29 02:09:17.690476+00	2025-12-19 02:13:07.136139+00	1.00	17	single_choice
13	入社時のオリエンテーションが運用できていますか。	組織体制	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "できている", "score": 1}, {"text": "できていない", "score": 0}]	\N	scale	t	2025-11-29 02:06:57.688913+00	2025-12-19 02:13:07.136139+00	1.00	18	single_choice
18	評価制度（評価項目）が試運用または本運用されている認識はありますか。	評価制度	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "ない", "score": 0}]	\N	scale	t	2025-11-29 02:16:16.47836+00	2025-12-19 02:13:07.136139+00	3.00	22	single_choice
28	回答者様ご自身について教えてください。\n企業名・所属部署・役職名・名前・直属の上司の名前・在籍期間	\N	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	\N	\N	scale	t	2025-12-18 09:40:56.504303+00	2025-12-20 18:30:20.573715+00	\N	1	free_text
5	全社ルールの確認（格納）場所を認識していますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "知っている", "score": 1}, {"text": "知らない", "score": 0}]	\N	scale	t	2025-11-29 01:53:39.980723+00	2025-12-19 02:13:07.136139+00	0.50	6	single_choice
7	6の質問に関して、ルールブック化はされていますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "されている", "score": 1}, {"text": "されていない（わからない）", "score": 0}]	\N	scale	t	2025-11-29 01:55:34.127541+00	2025-12-19 02:13:07.136139+00	0.50	9	single_choice
6	ご自身が全社またはチームの姿勢のルールを守れず、直属の上司から指摘を受けたことはありますか。	ルール	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "違反をしたことがない", "score": 1}, {"text": "違反をしたが指摘を受けたことがない", "score": 0}]	\N	scale	t	2025-11-29 01:54:50.178952+00	2025-12-19 02:13:07.136139+00	1.00	11	single_choice
19	評価制度の運用について、社内アナウンスはありましたか。	評価制度	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "あった", "score": 1}, {"text": "なかった（分からない）", "score": 0}]	\N	scale	t	2025-11-29 02:16:51.06644+00	2025-12-19 02:13:07.136139+00	2.00	23	single_choice
20	自分の役割の進捗を上司に報告する定期的な会議はありますか。	週報・会議	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "ある", "score": 1}, {"text": "ない（わからない）", "score": 0}]	\N	scale	t	2025-11-29 02:19:11.872354+00	2025-12-19 02:13:07.136139+00	2.00	24	single_choice
21	定期会議で未達だった場合、改善策（行動変化）の約束をしていますか。	週報・会議	["一般社員", "事業責任者", "代表取締役\\r\\n", "課長", "農園責任者"]	[{"text": "約束している", "score": 1}, {"text": "約束してない", "score": 0}]	\N	scale	t	2025-11-29 02:19:57.251377+00	2025-12-19 02:13:07.136139+00	2.00	25	single_choice
\.


--
-- Data for Name: growth_survey_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.growth_survey_responses (id, gqid, gsid, cid, result, total_score, created_at, updated_at) FROM stdin;
120	28	24		[{"s": null, "uid": 295}, {"s": null, "uid": 300}, {"s": null, "uid": 298}, {"s": null, "uid": 301}]	0.00	2025-12-20 18:20:03.493595+00	2025-12-21 15:32:34.633787+00
122	25	24	ルール	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 1, "uid": 298}, {"s": 1, "uid": 301}]	0.00	2025-12-20 18:20:08.739459+00	2025-12-21 15:32:36.436772+00
123	30	24		[{"s": null, "uid": 295}, {"s": null, "uid": 300}, {"s": null, "uid": 298}, {"s": null, "uid": 301}]	0.00	2025-12-20 18:20:15.550269+00	2025-12-21 15:32:38.00858+00
124	31	24	ルール	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 1, "uid": 298}, {"s": 1, "uid": 301}]	0.00	2025-12-20 18:20:18.604852+00	2025-12-21 15:32:41.199372+00
125	5	24	ルール	[{"s": 1, "uid": 295}, {"s": 1, "uid": 300}, {"s": 0, "uid": 298}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:20.307893+00	2025-12-21 15:32:45.733361+00
126	32	24	ルール	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 1, "uid": 298}, {"s": 1, "uid": 301}]	0.00	2025-12-20 18:20:22.164679+00	2025-12-21 15:33:04.174559+00
127	33	24		[{"s": null, "uid": 295}, {"s": null, "uid": 300}, {"s": null, "uid": 301}]	0.00	2025-12-20 18:20:28.200416+00	2025-12-21 15:33:12.338385+00
128	7	24	ルール	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 1, "uid": 301}]	0.00	2025-12-20 18:20:31.289836+00	2025-12-21 15:33:14.475199+00
129	4	24	ルール	[{"s": 1, "uid": 295}, {"s": 1, "uid": 300}, {"s": 1, "uid": 301}]	0.50	2025-12-20 18:20:33.089173+00	2025-12-21 15:33:17.166306+00
130	6	24	ルール	[{"s": 1, "uid": 295}, {"s": 1, "uid": 300}, {"s": 1, "uid": 301}]	1.00	2025-12-20 18:20:34.703955+00	2025-12-21 15:33:19.174231+00
131	10	24		[{"s": null, "uid": 295}, {"s": null, "uid": 300}, {"s": null, "uid": 301}]	0.00	2025-12-20 18:20:39.828368+00	2025-12-21 15:33:21.890994+00
132	8	24	ルール	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 1, "uid": 301}]	0.00	2025-12-20 18:20:42.196958+00	2025-12-21 15:33:24.253808+00
133	11	24	ルール	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 1, "uid": 301}]	0.00	2025-12-20 18:20:43.539374+00	2025-12-21 15:33:26.420395+00
134	9	24	ルール	[{"s": 1, "uid": 295}, {"s": 1, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:45.008196+00	2025-12-21 15:33:28.486298+00
135	12	24	組織体制	[{"s": 1, "uid": 295}, {"s": 1, "uid": 300}, {"s": 1, "uid": 301}]	1.00	2025-12-20 18:20:46.228405+00	2025-12-21 15:33:32.725212+00
136	16	24	組織体制	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:47.823068+00	2025-12-21 15:33:34.429743+00
137	13	24	組織体制	[{"s": 0, "uid": 295}, {"s": 1, "uid": 300}, {"s": 1, "uid": 301}]	0.00	2025-12-20 18:20:49.476532+00	2025-12-21 15:33:35.928446+00
138	17	24	組織体制	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:50.983363+00	2025-12-21 15:33:37.436997+00
139	15	24	組織体制	[{"s": 0, "uid": 295}, {"s": 1, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:52.725913+00	2025-12-21 15:33:38.872575+00
140	14	24	組織体制	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:54.280683+00	2025-12-21 15:33:40.625507+00
141	18	24	評価制度	[{"s": 1, "uid": 295}, {"s": 1, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:55.995186+00	2025-12-21 15:33:45.666084+00
142	19	24	評価制度	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:58.243514+00	2025-12-21 15:33:47.556692+00
143	20	24	週報・会議	[{"s": 0, "uid": 295}, {"s": 1, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:20:59.474609+00	2025-12-21 15:33:49.917216+00
144	21	24	週報・会議	[{"s": 1, "uid": 295}, {"s": 1, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:21:01.141822+00	2025-12-21 15:33:51.805263+00
145	23	24	週報・会議	[{"s": 1, "uid": 295}, {"s": 0, "uid": 300}, {"s": 0, "uid": 301}]	0.00	2025-12-20 18:21:02.933086+00	2025-12-21 15:33:53.85391+00
\.


--
-- Data for Name: growth_survey_summary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.growth_survey_summary (id, uid, gsid, cat1_score, cat2_score, cat3_score, cat4_score, cat5_score, total_score, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jobs (id, name, code, description, created_at, updated_at) FROM stdin;
1	代表取締役\r\n	1		2025-11-02 21:11:46.185141	2025-11-03 15:28:19.731518
3	課長	3		2025-11-02 21:11:46.185141	2025-11-03 15:28:27.740073
2	部長	2		2025-11-02 21:11:46.185141	2025-11-03 15:28:36.372262
9	一般社員	4	\N	2025-11-02 22:54:13.422025	2025-11-25 18:18:54.859952
17	農園責任者	3	\N	2025-11-25 18:24:15.740975	2025-11-25 18:24:15.740975
14	業務委託者	5	\N	2025-11-03 15:17:44.053087	2025-11-25 18:51:59.112972
4	パート	4	\N	2025-11-02 21:11:46.185141	2025-11-25 18:52:06.827928
16	事業責任者	4	\N	2025-11-25 17:53:37.77347	2025-11-25 18:52:17.838439
\.


--
-- Data for Name: login_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.login_logs (id, user_id, email, login_at, ip_address, user_agent, login_status, failure_reason) FROM stdin;
584	307	emp19@sunhawk.com	2025-12-22 02:10:35.735889	::ffff:127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	success	\N
585	7	admin@sunhawk.co.jp	2025-12-22 02:16:53.655594	::ffff:127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	success	\N
586	7	admin@sunhawk.co.jp	2025-12-22 02:20:02.480858	::ffff:127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	success	\N
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, user_id, survey_id, title, message, is_read, created_at, read_at, created_by) FROM stdin;
657	295	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	t	2025-12-18 20:39:54.133489+00	2025-12-18 22:00:05.730221+00	7
592	329	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:04.971238+00	\N	7
593	328	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:04.994177+00	\N	7
594	327	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.000373+00	\N	7
613	299	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.243063+00	2025-12-17 05:01:38.289991+00	7
624	329	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.03117+00	\N	7
667	329	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.966688+00	\N	7
616	295	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.283184+00	2025-12-18 22:00:05.730221+00	7
595	326	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.007868+00	\N	7
596	325	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.017564+00	\N	7
597	323	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.022547+00	\N	7
598	321	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.036887+00	\N	7
599	320	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.056518+00	\N	7
600	319	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.080329+00	\N	7
601	318	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.097002+00	\N	7
602	317	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.112733+00	\N	7
603	315	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.123378+00	\N	7
605	313	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.167917+00	\N	7
607	308	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.186548+00	\N	7
609	305	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.203251+00	\N	7
610	304	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.211628+00	\N	7
611	302	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.219623+00	\N	7
612	301	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.230187+00	\N	7
615	296	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.27389+00	\N	7
617	293	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.2996+00	\N	7
619	291	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.363427+00	\N	7
620	290	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.376651+00	\N	7
622	331	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.420133+00	\N	7
623	330	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	f	2025-12-10 01:01:05.438396+00	\N	7
618	292	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.332781+00	2025-12-10 01:02:04.453805+00	7
604	314	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.151985+00	2025-12-11 22:47:59.328157+00	7
621	289	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.410137+00	2025-12-16 03:35:53.290558+00	7
606	312	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.178087+00	2025-12-16 14:56:17.77149+00	7
608	307	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.193817+00	2025-12-16 15:13:40.33504+00	7
614	298	\N	組織サーベイの回答をお願いします	組織サーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月4日 ～ 12月18日\n\n	t	2025-12-10 01:01:05.255515+00	2025-12-17 19:57:47.140246+00	7
625	328	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.039667+00	\N	7
626	327	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.042168+00	\N	7
627	326	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.044267+00	\N	7
628	325	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.04727+00	\N	7
629	324	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.0497+00	\N	7
630	323	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.053218+00	\N	7
631	321	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.057716+00	\N	7
632	320	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.06052+00	\N	7
633	319	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.062892+00	\N	7
634	318	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.066004+00	\N	7
635	317	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.068084+00	\N	7
636	316	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.070966+00	\N	7
637	315	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.07334+00	\N	7
638	314	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.07585+00	\N	7
639	313	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.078549+00	\N	7
640	312	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.081521+00	\N	7
641	311	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.084852+00	\N	7
642	310	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.087716+00	\N	7
643	309	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.090732+00	\N	7
644	308	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.094088+00	\N	7
645	307	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.097579+00	\N	7
646	306	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.100222+00	\N	7
647	305	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.102447+00	\N	7
648	304	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.105407+00	\N	7
649	303	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.108353+00	\N	7
650	302	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.111993+00	\N	7
651	301	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.11474+00	\N	7
653	299	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.119706+00	\N	7
655	297	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.125657+00	\N	7
652	300	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	t	2025-12-18 20:39:54.116929+00	2025-12-18 21:13:40.867216+00	7
656	296	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.128991+00	\N	7
658	293	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.136589+00	\N	7
659	292	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.139597+00	\N	7
660	291	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.142335+00	\N	7
661	290	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.145295+00	\N	7
662	289	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.14807+00	\N	7
663	322	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.151383+00	\N	7
664	331	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.153666+00	\N	7
665	330	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.156252+00	\N	7
666	294	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	f	2025-12-18 20:39:54.158975+00	\N	7
668	328	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.977435+00	\N	7
669	327	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.979932+00	\N	7
670	326	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.982277+00	\N	7
671	325	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.985062+00	\N	7
672	324	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.986782+00	\N	7
673	323	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.988906+00	\N	7
674	321	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.991063+00	\N	7
675	320	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.993078+00	\N	7
676	319	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.995279+00	\N	7
677	318	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.997212+00	\N	7
678	317	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:04.999361+00	\N	7
679	316	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.001946+00	\N	7
680	315	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.004051+00	\N	7
681	314	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.005845+00	\N	7
682	313	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.007963+00	\N	7
683	312	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.010393+00	\N	7
684	311	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.012259+00	\N	7
685	310	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.01387+00	\N	7
686	309	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.015786+00	\N	7
687	308	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.018259+00	\N	7
688	307	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.020874+00	\N	7
689	306	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.02387+00	\N	7
690	305	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.026229+00	\N	7
691	304	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.027978+00	\N	7
692	303	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.029555+00	\N	7
693	302	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.031097+00	\N	7
694	301	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.032795+00	\N	7
696	299	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.03874+00	\N	7
698	297	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.043854+00	\N	7
699	296	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.046183+00	\N	7
701	293	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.049634+00	\N	7
702	292	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.052256+00	\N	7
703	291	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.05555+00	\N	7
704	290	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.057972+00	\N	7
705	289	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.059659+00	\N	7
706	322	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.061274+00	\N	7
707	331	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.062972+00	\N	7
708	330	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.065053+00	\N	7
709	294	\N	ソシキサーベイの回答をお願いします	hello	f	2025-12-18 20:40:05.067074+00	\N	7
697	298	\N	ソシキサーベイの回答をお願いします	hello	t	2025-12-18 20:40:05.041487+00	2025-12-18 20:44:32.150457+00	7
695	300	\N	ソシキサーベイの回答をお願いします	hello	t	2025-12-18 20:40:05.036133+00	2025-12-18 21:13:40.860689+00	7
654	298	\N	ソシキサーベイの回答をお願いします	ソシキサーベイ「12」への回答をお願いいたします。\n\nサーベイ期間: 12月17日 ～ 12月20日\n\n	t	2025-12-18 20:39:54.122705+00	2025-12-18 20:44:33.245171+00	7
700	295	\N	ソシキサーベイの回答をお願いします	hello	t	2025-12-18 20:40:05.047966+00	2025-12-18 22:00:05.730221+00	7
\.


--
-- Data for Name: organizational_survey_free_text_responses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organizational_survey_free_text_responses (id, uid, osid, qid, answer_text, created_at, updated_at) FROM stdin;
36	295	23	2267	asjkdhfas	2025-12-20 18:16:23.453289+00	2025-12-20 18:16:23.453289+00
37	295	23	2271	asdfasdf	2025-12-20 18:16:25.245947+00	2025-12-20 18:16:25.245947+00
38	295	23	2268	asdfasd, a sdfklasjdfja, asm,dhfasdl	2025-12-20 18:16:30.439214+00	2025-12-20 18:16:30.439214+00
39	295	23	2269	asdflasdl, aslkdjflkasd, asdfasdfpasdf890707sd9fasdf	2025-12-20 18:16:39.143487+00	2025-12-20 18:16:39.143487+00
40	295	23	2270	asdfjkasldf, sakjdhfasdfasdf	2025-12-20 18:16:43.817558+00	2025-12-20 18:16:43.817558+00
41	295	23	2274	sadfjklasdo870w3423, aslkdfhas78o, asidhfasd	2025-12-20 18:16:50.289561+00	2025-12-20 18:16:50.289561+00
42	295	23	2275	213897489203, 23420934, 2390409234	2025-12-20 18:16:57.856037+00	2025-12-20 18:16:57.856037+00
43	300	23	2267	324123, dsafjas, alskdfa	2025-12-21 13:44:51.32929+00	2025-12-21 13:44:51.32929+00
44	300	23	2271	asdfas	2025-12-21 13:44:53.689728+00	2025-12-21 13:44:53.689728+00
45	300	23	2268	asdfwer	2025-12-21 13:44:55.746999+00	2025-12-21 13:44:55.746999+00
46	300	23	2269	234242	2025-12-21 13:44:57.909021+00	2025-12-21 13:44:57.909021+00
47	300	23	2270	asdf	2025-12-21 13:44:59.548343+00	2025-12-21 13:44:59.548343+00
48	300	23	2274	zxcv	2025-12-21 13:45:01.109747+00	2025-12-21 13:45:01.109747+00
49	300	23	2275	asdf	2025-12-21 13:45:02.582024+00	2025-12-21 13:45:02.582024+00
50	298	23	2267	asdfasf	2025-12-21 14:32:41.041963+00	2025-12-21 14:32:41.041963+00
51	298	23	2271	asdfa	2025-12-21 14:32:42.898184+00	2025-12-21 14:32:42.898184+00
52	298	23	2268	asdf	2025-12-21 14:32:44.467564+00	2025-12-21 14:32:44.467564+00
53	298	23	2269	asdfasdfa	2025-12-21 14:32:45.970632+00	2025-12-21 14:32:45.970632+00
54	298	23	2270	asdfasdf	2025-12-21 14:32:47.607078+00	2025-12-21 14:32:47.607078+00
55	298	23	2274	fasdfasdf	2025-12-21 14:32:49.194279+00	2025-12-21 14:32:49.194279+00
56	298	23	2275	fasdf	2025-12-21 14:32:50.898897+00	2025-12-21 14:32:50.898897+00
57	301	23	2267	sdfa	2025-12-21 15:32:10.945478+00	2025-12-21 15:32:10.945478+00
58	301	23	2271	asdfasf	2025-12-21 15:32:13.34981+00	2025-12-21 15:32:13.34981+00
59	301	23	2268	asdfasdf	2025-12-21 15:32:18.327221+00	2025-12-21 15:32:18.327221+00
60	301	23	2269	asfasfd	2025-12-21 15:32:21.188843+00	2025-12-21 15:32:21.188843+00
61	301	23	2270	asfdas	2025-12-21 15:32:23.789664+00	2025-12-21 15:32:23.789664+00
62	301	23	2274	asfasdf	2025-12-21 15:32:28.172862+00	2025-12-21 15:32:28.172862+00
63	296	23	2267	sadfasd	2025-12-21 15:57:38.844557+00	2025-12-21 15:57:38.844557+00
64	296	23	2271	asdfasd	2025-12-21 15:57:40.584613+00	2025-12-21 15:57:40.584613+00
65	296	23	2268	asdfasd	2025-12-21 15:57:42.163325+00	2025-12-21 15:57:42.163325+00
66	296	23	2269	asdfas	2025-12-21 15:57:43.547879+00	2025-12-21 15:57:43.547879+00
67	296	23	2270	asdfasf	2025-12-21 15:57:45.097471+00	2025-12-21 15:57:45.097471+00
68	296	23	2274	asfasdf	2025-12-21 15:57:46.962127+00	2025-12-21 15:57:46.962127+00
69	296	23	2275	fasdf	2025-12-21 15:57:48.288479+00	2025-12-21 15:57:48.288479+00
\.


--
-- Data for Name: organizational_survey_results; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organizational_survey_results (id, uid, osid, response, created_at, updated_at, response_rate) FROM stdin;
78	295	23	[{"s": 0, "cid": 2, "qid": 2170}, {"s": 10, "cid": 3, "qid": 2171}, {"s": 7.5, "cid": 4, "qid": 2172}, {"s": 2, "cid": 5, "qid": 2173}, {"s": 8.88, "cid": 2, "qid": 2174}, {"s": 7.5, "cid": 4, "qid": 2175}, {"s": 5.72, "cid": 6, "qid": 2176}, {"s": 5.46, "cid": 7, "qid": 2177}, {"s": 4.44, "cid": 8, "qid": 2178}, {"s": 3.64, "cid": 7, "qid": 2179}, {"s": 10, "cid": 4, "qid": 2180}, {"s": 8.88, "cid": 2, "qid": 2181}, {"s": 11.44, "cid": 6, "qid": 2182}, {"s": 7.28, "cid": 7, "qid": 2183}, {"s": 7.28, "cid": 7, "qid": 2184}, {"s": 9.1, "cid": 7, "qid": 2185}, {"s": 12.5, "cid": 4, "qid": 2186}, {"s": 0, "cid": 8, "qid": 2187}, {"s": 0, "cid": 2, "qid": 2188}, {"s": 9.1, "cid": 7, "qid": 2189}, {"s": 12.5, "cid": 1, "qid": 2190}, {"s": 0, "cid": 2, "qid": 2191}, {"s": 12.5, "cid": 1, "qid": 2192}, {"s": 10, "cid": 5, "qid": 2193}, {"s": 9.1, "cid": 7, "qid": 2194}, {"s": 12.5, "cid": 1, "qid": 2195}, {"s": 11.1, "cid": 8, "qid": 2196}, {"s": 14.3, "cid": 6, "qid": 2197}, {"s": 0, "cid": 6, "qid": 2198}, {"s": 11.1, "cid": 8, "qid": 2199}, {"s": 11.1, "cid": 8, "qid": 2200}, {"s": 12.5, "cid": 3, "qid": 2201}, {"s": 9.1, "cid": 7, "qid": 2202}, {"s": 7.5, "cid": 3, "qid": 2203}, {"s": 10, "cid": 3, "qid": 2204}, {"s": 2, "cid": 5, "qid": 2205}, {"s": 2.22, "cid": 2, "qid": 2206}, {"s": 10, "cid": 4, "qid": 2207}, {"s": 0, "cid": 1, "qid": 2208}, {"s": 14.3, "cid": 6, "qid": 2209}, {"s": 5.46, "cid": 7, "qid": 2210}, {"s": 7.5, "cid": 3, "qid": 2211}, {"s": 3.64, "cid": 7, "qid": 2212}, {"s": 2.5, "cid": 3, "qid": 2213}, {"s": 0, "cid": 5, "qid": 2214}, {"s": 7.5, "cid": 4, "qid": 2215}, {"s": 7.5, "cid": 4, "qid": 2216}, {"s": 6.66, "cid": 2, "qid": 2217}, {"s": 8.58, "cid": 6, "qid": 2218}, {"s": 6.66, "cid": 8, "qid": 2219}, {"s": 6, "cid": 5, "qid": 2220}, {"s": 6, "cid": 5, "qid": 2221}, {"s": 6.66, "cid": 8, "qid": 2222}, {"s": 7.5, "cid": 1, "qid": 2223}, {"s": 6, "cid": 5, "qid": 2224}, {"s": 6, "cid": 5, "qid": 2225}, {"s": 6.66, "cid": 8, "qid": 2226}, {"s": 10, "cid": 1, "qid": 2227}, {"s": 8.88, "cid": 8, "qid": 2228}, {"s": 11.44, "cid": 6, "qid": 2229}, {"s": 10, "cid": 3, "qid": 2230}, {"s": 7.28, "cid": 7, "qid": 2231}, {"s": 7.28, "cid": 7, "qid": 2232}, {"s": 0, "cid": 1, "qid": 2233}, {"s": 10, "cid": 5, "qid": 2234}, {"s": 0, "cid": 2, "qid": 2235}, {"s": 12.5, "cid": 4, "qid": 2236}, {"s": 0, "cid": 3, "qid": 2237}, {"s": 12.5, "cid": 1, "qid": 2238}, {"s": 0, "cid": 5, "qid": 2239}, {"s": 11.1, "cid": 2, "qid": 2240}]	2025-12-21 03:17:01.813089	2025-12-21 03:19:28.040838	100.00
80	298	23	[{"s": 0, "cid": 2, "qid": 2170}, {"s": 12.5, "cid": 3, "qid": 2171}, {"s": 0, "cid": 4, "qid": 2172}]	2025-12-21 23:36:43.050946	2025-12-21 23:56:27.385313	3.85
81	296	23	[{"s": 6.66, "cid": 2, "qid": 2170}, {"s": 0, "cid": 3, "qid": 2171}, {"s": 12.5, "cid": 4, "qid": 2172}, {"s": 10, "cid": 5, "qid": 2173}, {"s": 0, "cid": 2, "qid": 2174}, {"s": 0, "cid": 4, "qid": 2175}, {"s": 14.3, "cid": 6, "qid": 2176}, {"s": 0, "cid": 7, "qid": 2177}, {"s": 0, "cid": 8, "qid": 2178}, {"s": 0, "cid": 7, "qid": 2179}, {"s": 0, "cid": 4, "qid": 2180}, {"s": 0, "cid": 2, "qid": 2181}, {"s": 0, "cid": 6, "qid": 2182}, {"s": 0, "cid": 7, "qid": 2183}, {"s": 0, "cid": 7, "qid": 2184}, {"s": 0, "cid": 7, "qid": 2185}, {"s": 0, "cid": 4, "qid": 2186}, {"s": 4.44, "cid": 8, "qid": 2187}, {"s": 4.44, "cid": 2, "qid": 2188}, {"s": 5.46, "cid": 7, "qid": 2189}, {"s": 7.5, "cid": 1, "qid": 2190}, {"s": 4.44, "cid": 2, "qid": 2191}, {"s": 7.5, "cid": 1, "qid": 2192}, {"s": 6, "cid": 5, "qid": 2193}, {"s": 5.46, "cid": 7, "qid": 2194}, {"s": 7.5, "cid": 1, "qid": 2195}, {"s": 6.66, "cid": 8, "qid": 2196}, {"s": 8.58, "cid": 6, "qid": 2197}, {"s": 5.72, "cid": 6, "qid": 2198}, {"s": 6.66, "cid": 8, "qid": 2199}, {"s": 6.66, "cid": 8, "qid": 2200}, {"s": 7.5, "cid": 3, "qid": 2201}, {"s": 5.46, "cid": 7, "qid": 2202}, {"s": 7.5, "cid": 3, "qid": 2203}, {"s": 7.5, "cid": 3, "qid": 2204}, {"s": 4, "cid": 5, "qid": 2205}, {"s": 2.22, "cid": 2, "qid": 2206}, {"s": 10, "cid": 4, "qid": 2207}, {"s": 2.5, "cid": 1, "qid": 2208}, {"s": 8.58, "cid": 6, "qid": 2209}, {"s": 7.28, "cid": 7, "qid": 2210}, {"s": 7.5, "cid": 3, "qid": 2211}, {"s": 9.1, "cid": 7, "qid": 2212}, {"s": 10, "cid": 3, "qid": 2213}, {"s": 8, "cid": 5, "qid": 2214}, {"s": 5, "cid": 4, "qid": 2215}, {"s": 10, "cid": 4, "qid": 2216}, {"s": 4.44, "cid": 2, "qid": 2217}, {"s": 5.72, "cid": 6, "qid": 2218}, {"s": 6.66, "cid": 8, "qid": 2219}, {"s": 6, "cid": 5, "qid": 2220}, {"s": 6, "cid": 5, "qid": 2221}, {"s": 6.66, "cid": 8, "qid": 2222}, {"s": 7.5, "cid": 1, "qid": 2223}, {"s": 8, "cid": 5, "qid": 2224}, {"s": 10, "cid": 5, "qid": 2225}, {"s": 8.88, "cid": 8, "qid": 2226}, {"s": 7.5, "cid": 1, "qid": 2227}, {"s": 6.66, "cid": 8, "qid": 2228}, {"s": 8.58, "cid": 6, "qid": 2229}, {"s": 10, "cid": 3, "qid": 2230}, {"s": 5.46, "cid": 7, "qid": 2231}, {"s": 3.64, "cid": 7, "qid": 2232}, {"s": 5, "cid": 1, "qid": 2233}, {"s": 4, "cid": 5, "qid": 2234}, {"s": 6.66, "cid": 2, "qid": 2235}, {"s": 5, "cid": 4, "qid": 2236}, {"s": 5, "cid": 3, "qid": 2237}, {"s": 7.5, "cid": 1, "qid": 2238}, {"s": 4, "cid": 5, "qid": 2239}, {"s": 6.66, "cid": 2, "qid": 2240}]	2025-12-22 00:57:38.852885	2025-12-22 01:00:31.42961	100.00
79	300	23	[{"s": 0, "cid": 2, "qid": 2170}, {"s": 12.5, "cid": 3, "qid": 2171}, {"s": 0, "cid": 4, "qid": 2172}, {"s": 4, "cid": 5, "qid": 2173}, {"s": 11.1, "cid": 2, "qid": 2174}, {"s": 7.5, "cid": 4, "qid": 2175}, {"s": 0, "cid": 6, "qid": 2176}, {"s": 0, "cid": 7, "qid": 2177}, {"s": 4.44, "cid": 8, "qid": 2178}, {"s": 3.64, "cid": 7, "qid": 2179}, {"s": 12.5, "cid": 4, "qid": 2180}, {"s": 11.1, "cid": 2, "qid": 2181}, {"s": 14.3, "cid": 6, "qid": 2182}, {"s": 9.1, "cid": 7, "qid": 2183}, {"s": 9.1, "cid": 7, "qid": 2184}, {"s": 9.1, "cid": 7, "qid": 2185}, {"s": 12.5, "cid": 4, "qid": 2186}, {"s": 0, "cid": 8, "qid": 2187}, {"s": 0, "cid": 2, "qid": 2188}, {"s": 9.1, "cid": 7, "qid": 2189}, {"s": 12.5, "cid": 1, "qid": 2190}, {"s": 0, "cid": 2, "qid": 2191}, {"s": 12.5, "cid": 1, "qid": 2192}, {"s": 6, "cid": 5, "qid": 2193}, {"s": 3.64, "cid": 7, "qid": 2194}, {"s": 5, "cid": 1, "qid": 2195}, {"s": 6.66, "cid": 8, "qid": 2196}, {"s": 11.44, "cid": 6, "qid": 2197}, {"s": 2.86, "cid": 6, "qid": 2198}, {"s": 8.88, "cid": 8, "qid": 2199}, {"s": 8.88, "cid": 8, "qid": 2200}, {"s": 10, "cid": 3, "qid": 2201}, {"s": 7.28, "cid": 7, "qid": 2202}, {"s": 10, "cid": 3, "qid": 2203}, {"s": 7.5, "cid": 3, "qid": 2204}, {"s": 4, "cid": 5, "qid": 2205}, {"s": 2.22, "cid": 2, "qid": 2206}, {"s": 10, "cid": 4, "qid": 2207}, {"s": 2.5, "cid": 1, "qid": 2208}, {"s": 11.44, "cid": 6, "qid": 2209}, {"s": 7.28, "cid": 7, "qid": 2210}, {"s": 10, "cid": 3, "qid": 2211}, {"s": 3.64, "cid": 7, "qid": 2212}, {"s": 2.5, "cid": 3, "qid": 2213}, {"s": 4, "cid": 5, "qid": 2214}, {"s": 10, "cid": 4, "qid": 2215}, {"s": 2.5, "cid": 4, "qid": 2216}, {"s": 11.1, "cid": 2, "qid": 2217}, {"s": 8.58, "cid": 6, "qid": 2218}, {"s": 6.66, "cid": 8, "qid": 2219}, {"s": 6, "cid": 5, "qid": 2220}, {"s": 6, "cid": 5, "qid": 2221}, {"s": 4.44, "cid": 8, "qid": 2222}, {"s": 5, "cid": 1, "qid": 2223}, {"s": 4, "cid": 5, "qid": 2224}, {"s": 2, "cid": 5, "qid": 2225}, {"s": 4.44, "cid": 8, "qid": 2226}, {"s": 5, "cid": 1, "qid": 2227}, {"s": 6.66, "cid": 8, "qid": 2228}, {"s": 5.72, "cid": 6, "qid": 2229}, {"s": 7.5, "cid": 3, "qid": 2230}, {"s": 3.64, "cid": 7, "qid": 2231}, {"s": 7.28, "cid": 7, "qid": 2232}, {"s": 5, "cid": 1, "qid": 2233}, {"s": 4, "cid": 5, "qid": 2234}, {"s": 4.44, "cid": 2, "qid": 2235}, {"s": 7.5, "cid": 4, "qid": 2236}, {"s": 2.5, "cid": 3, "qid": 2237}, {"s": 7.5, "cid": 1, "qid": 2238}, {"s": 6, "cid": 5, "qid": 2239}, {"s": 6.66, "cid": 2, "qid": 2240}]	2025-12-21 22:45:05.606836	2025-12-21 22:47:31.691788	100.00
\.


--
-- Data for Name: organizational_survey_summary; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organizational_survey_summary (id, uid, osid, category1_score, category2_score, category3_score, category4_score, category5_score, category6_score, category7_score, category8_score, total_score, created_at, updated_at) FROM stdin;
79	295	23	67.50	37.74	60.00	75.00	48.00	65.78	83.72	66.60	63.04	2025-12-21 03:17:01.826728	2025-12-21 03:19:28.043349
80	300	23	55.00	46.62	62.50	62.50	46.00	54.34	72.80	51.06	56.35	2025-12-21 22:45:05.61724	2025-12-21 22:47:31.739855
81	298	23	0.00	0.00	12.50	0.00	0.00	0.00	0.00	0.00	1.56	2025-12-21 23:36:43.068449	2025-12-21 23:56:27.413944
82	296	23	52.50	35.52	55.00	42.50	66.00	51.48	41.86	53.28	49.77	2025-12-22 00:57:50.204241	2025-12-22 01:00:31.455735
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.password_reset_tokens (id, user_id, token, expires_at, used_at, created_at) FROM stdin;
1	294	7d55037623d98510f7964670fab12bd7d751cc8c3bec24137691b9e83e9977d2	2025-12-04 10:11:27.963+00	\N	2025-12-04 09:41:27.965488+00
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.problems (id, question_text, category, answer1_score, answer2_score, answer3_score, answer4_score, answer5_score, answer6_score, created_at, updated_at, category_id, display_order, question_type) FROM stdin;
2173	優先順位をつけて仕事をするようにしている。	結果明確	0.00	2.00	4.00	6.00	8.00	10.00	2025-12-17 01:29:47.739924	2025-12-22 09:40:27.615752	5	11	single_choice
2174	現状維持が怖い。	変化意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:29:47.919208	2025-12-22 09:40:27.615752	2	12	single_choice
2200	協力して仕事をしていくことが何より大切である。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:29:56.523457	2025-12-22 09:40:27.615752	8	38	single_choice
2201	数字を追いすぎると仲が悪くなってしまうと思う。	成果視点	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:56.796557	2025-12-22 09:40:27.615752	3	39	single_choice
2202	上司とはフランクに何でも言い合える関係だ。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:57.060217	2025-12-22 09:40:27.615752	7	40	single_choice
2203	うまくいかなかったときほど、上司への報告を工夫している。	成果視点	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:57.27662	2025-12-22 09:40:27.615752	3	41	single_choice
2204	仕事をしている最中、「失敗してしまうんじゃないか」と考えることがよくある。	成果視点	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:57.806608	2025-12-22 09:40:27.615752	3	42	single_choice
2206	いま、人生の目標に向かって進んでいるという実感がある。	変化意識	0.00	2.22	4.44	6.66	8.88	11.10	2025-12-17 01:29:58.306536	2025-12-22 09:40:27.615752	2	44	single_choice
2207	やり方には非常に拘る方である。	行動優先意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:58.539944	2025-12-22 09:40:27.615752	4	45	single_choice
2208	どうすれば自分の評価が上がるのか明確である。	自己評価意識	0.00	2.50	5.00	7.50	10.00	12.50	2025-12-17 01:29:58.779324	2025-12-22 09:40:27.615752	1	46	single_choice
2209	期限を超えても品質が120点になっていれば良い。	時感覚	14.30	11.44	8.58	5.72	2.86	0.00	2025-12-17 01:29:59.002885	2025-12-22 09:40:27.615752	6	47	single_choice
2212	仕事の相談を直属の上司以外の上司にする事が多い。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:59.800382	2025-12-22 09:40:27.615752	7	50	single_choice
2213	業務中の周りの視線が気になる。	成果視点	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:30:00.03058	2025-12-22 09:40:27.615752	3	51	single_choice
2214	責任を果たすために十分な権限が与えられていないと思うことがある。	結果明確	10.00	8.00	6.00	4.00	2.00	0.00	2025-12-17 01:30:00.273726	2025-12-22 09:40:27.615752	5	52	single_choice
2215	新しいことほど、やってみないとわからない。	行動優先意識	0.00	2.50	5.00	7.50	10.00	12.50	2025-12-17 01:30:00.48115	2025-12-22 09:40:27.615752	4	53	single_choice
2216	プロジェクトの成否は「計画の精度をいかに高めることができるか」によってすべて決まる。	行動優先意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:30:00.688668	2025-12-22 09:40:27.615752	4	54	single_choice
2217	1年後の目標が明確である。	変化意識	0.00	2.22	4.44	6.66	8.88	11.10	2025-12-17 01:30:00.955063	2025-12-22 09:40:27.615752	2	55	single_choice
2172	まずは動いてから修正するということを心掛けている。	行動優先意識	0.00	2.50	5.00	7.50	10.00	12.50	2025-12-17 01:29:47.555063	2025-12-22 09:40:27.615752	4	10	single_choice
2267	あなたの性別を教えてください。	\N	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-18 12:12:18.634412	2025-12-22 09:40:27.615752	\N	1	free_text
2227	自分の評価について、「他社の友人」と「自社の同僚」だと、「他社の友人」と比べた良し悪しの方が気になる。	自己評価意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:30:03.028165	2025-12-22 09:40:27.615752	1	65	single_choice
2232	社員旅行、社内の飲み会、社内の運動会などのイベントに積極的に参加したい。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:30:04.123196	2025-12-22 09:40:27.615752	7	70	single_choice
2233	上司から何を求められているのかを基準にして、やるべきことを考えている。	自己評価意識	0.00	2.50	5.00	7.50	10.00	12.50	2025-12-17 01:30:04.446346	2025-12-22 09:40:27.615752	1	71	single_choice
2183	お客様に満足してもらえなければ意味がない。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:49.934504	2025-12-22 09:40:27.615752	7	21	single_choice
2184	上司の発言よりお客様の発言を優先すべきである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:50.198826	2025-12-22 09:40:27.615752	7	22	single_choice
2185	自分ができないことを部下に指示する上司はダメな上司だと思う。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:50.437245	2025-12-22 09:40:27.615752	7	23	single_choice
2186	仕事に取り掛かる前に、腹落ちするまで考え抜くことが重要である。	行動優先意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:50.671075	2025-12-22 09:40:27.615752	4	24	single_choice
2187	失敗した時に誰の責任なのか明確に決まっている。	免責意識	0.00	2.22	4.44	6.66	8.88	11.10	2025-12-17 01:29:50.896493	2025-12-22 09:40:27.615752	8	25	single_choice
2188	「やったことの振り返り」よりも「次はどんな新しいことをやるのか」を考えたい。	変化意識	0.00	2.22	4.44	6.66	8.88	11.10	2025-12-17 01:29:51.103694	2025-12-22 09:40:27.615752	2	26	single_choice
2219	部署が変わればもっと活躍できると思うことがある。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:30:01.415285	2025-12-22 09:40:27.615752	8	57	single_choice
2220	何のためにその業務を遂行しているのか考え込むことがよくある。	結果明確	10.00	8.00	6.00	4.00	2.00	0.00	2025-12-17 01:30:01.618049	2025-12-22 09:40:27.615752	5	58	single_choice
2221	モチベーションによって仕事のパフォーマンスに差が出るのは仕方ない。	結果明確	10.00	8.00	6.00	4.00	2.00	0.00	2025-12-17 01:30:01.824822	2025-12-22 09:40:27.615752	5	59	single_choice
2225	会社にはモチベーションを上げてくれる環境を望んでいる。	結果明確	10.00	8.00	6.00	4.00	2.00	0.00	2025-12-17 01:30:02.629181	2025-12-22 09:40:27.615752	5	63	single_choice
2226	なぜ自分がやらなければいけないのかと思う仕事がよくある。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:30:02.828874	2025-12-22 09:40:27.615752	8	64	single_choice
2271	現在のお勤め先での勤務年数を教えてください。	\N	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-18 12:17:52.49951	2025-12-22 09:40:27.615752	\N	2	free_text
2178	自分が所属していない部署であっても、気になることがあれば積極的に意見を言うべきである。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:29:48.73571	2025-12-22 09:40:27.615752	8	16	single_choice
2179	上司の指示に納得いかないことが多い。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:48.932857	2025-12-22 09:40:27.615752	7	17	single_choice
2180	どんなことでも納得してから業務に取り組むようにしている。	行動優先意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:49.134515	2025-12-22 09:40:27.615752	4	18	single_choice
2181	なるべく今の状態をキープしたい。	変化意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:29:49.341214	2025-12-22 09:40:27.615752	2	19	single_choice
2182	アウトプットの精度を高めるためであれば納期が遅れても仕方ない。	時感覚	14.30	11.44	8.58	5.72	2.86	0.00	2025-12-17 01:29:49.748172	2025-12-22 09:40:27.615752	6	20	single_choice
2175	時間制限が無い方がクリエイティブな仕事ができる。	行動優先意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:48.109583	2025-12-22 09:40:27.615752	4	13	single_choice
2176	上司にはいつも期限を確認するようにしている。	時感覚	0.00	2.86	5.72	8.58	11.44	14.30	2025-12-17 01:29:48.298002	2025-12-22 09:40:27.615752	6	14	single_choice
2177	いまの会社で生きていく上で最も重要なことは同僚とのつながりである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:48.533744	2025-12-22 09:40:27.615752	7	15	single_choice
2191	もっと仕事ができるようになりたい。	変化意識	0.00	2.22	4.44	6.66	8.88	11.10	2025-12-17 01:29:54.137961	2025-12-22 09:40:27.615752	2	29	single_choice
2192	周りの評価を気にせず、自分らしく生きる事が何より大切だ。	自己評価意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:54.670117	2025-12-22 09:40:27.615752	1	30	single_choice
2193	努力を評価して欲しいと思っている。	結果明確	10.00	8.00	6.00	4.00	2.00	0.00	2025-12-17 01:29:54.897179	2025-12-22 09:40:27.615752	5	31	single_choice
2194	誰に確認したら良いか迷うことがよくある。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:55.116974	2025-12-22 09:40:27.615752	7	32	single_choice
2195	周りから何を言われようが、自分が納得することが何より大切だ。	自己評価意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:55.36444	2025-12-22 09:40:27.615752	1	33	single_choice
2196	上司が違えばもっと成果を出せると思うことがある。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:29:55.575337	2025-12-22 09:40:27.615752	8	34	single_choice
2197	仕事を最速で終えることを意識している。	時感覚	14.30	11.44	8.58	5.72	2.86	0.00	2025-12-17 01:29:55.824486	2025-12-22 09:40:27.615752	6	35	single_choice
2198	時間を掛けて議論を深めることによって、真の問題点が見つかる。	時感覚	0.00	2.86	5.72	8.58	11.44	14.30	2025-12-17 01:29:56.049363	2025-12-22 09:40:27.615752	6	36	single_choice
2199	会社が成長する第一条件は「仲が良い職場であること」である。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:29:56.29578	2025-12-22 09:40:27.615752	8	37	single_choice
2205	仕事の優先順位に悩むことはない。	結果明確	0.00	2.00	4.00	6.00	8.00	10.00	2025-12-17 01:29:58.08461	2025-12-22 09:40:27.615752	5	43	single_choice
2269	あなたの勤務先が所在している都道府県を教えてください。	\N	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-18 12:16:56.916599	2025-12-22 09:40:27.615752	\N	4	free_text
2270	お勤め先でのあなたの役職を教えてください。	\N	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-18 12:17:09.670486	2025-12-22 09:40:27.615752	\N	5	free_text
2274	お勤め先の現在の上司の元での勤務年数を教えてください。	\N	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-18 12:18:30.717281	2025-12-22 09:40:27.615752	\N	6	free_text
2275	現在のお勤め先での入社方法について教えてください。	\N	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-18 12:19:09.202533	2025-12-22 09:40:27.615752	\N	7	free_text
2189	上司と意見が違っても自分が正しいと思うことをやり抜くべきである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:53.701067	2025-12-22 09:40:27.615752	7	27	single_choice
2190	結果よりも全力で頑張ったかどうかが大切だ。	自己評価意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:53.929231	2025-12-22 09:40:27.615752	1	28	single_choice
2234	競争がある環境は苦手である。	結果明確	10.00	8.00	6.00	4.00	2.00	0.00	2025-12-17 01:30:05.294093	2025-12-22 09:40:27.615752	5	72	single_choice
2235	なんとなくでも将来こうなりたいというイメージを持っている。	変化意識	0.00	2.22	4.44	6.66	8.88	11.10	2025-12-17 01:30:05.530487	2025-12-22 09:40:27.615752	2	73	single_choice
2236	上司の指示をしっかり吟味してから仕事に取り掛かるようにしている。	行動優先意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:30:05.72163	2025-12-22 09:40:27.615752	4	74	single_choice
2237	失敗してしまった場合、「次はどのようにするのか」を優先して考えるようにしている。	成果視点	0.00	2.50	5.00	7.50	10.00	12.50	2025-12-17 01:30:05.959374	2025-12-22 09:40:27.615752	3	75	single_choice
2238	自分の評価に納得できないことがある。	自己評価意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:30:06.251717	2025-12-22 09:40:27.615752	1	76	single_choice
2239	常に「今なにをすべきか」が明確である。	結果明確	0.00	2.00	4.00	6.00	8.00	10.00	2025-12-17 01:30:06.466556	2025-12-22 09:40:27.615752	5	77	single_choice
2240	出世はなるべくしたくない。	変化意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:30:06.693417	2025-12-22 09:40:27.615752	2	78	single_choice
2210	上司とは友達のように仲良しである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:29:59.202966	2025-12-22 09:40:27.615752	7	48	single_choice
2211	仕事が終わっていても、定時で退社するのは躊躇してしまう。	成果視点	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:59.426027	2025-12-22 09:40:27.615752	3	49	single_choice
2218	仕事をするときは常に期限を意識している。	時感覚	0.00	2.86	5.72	8.58	11.44	14.30	2025-12-17 01:30:01.18994	2025-12-22 09:40:27.615752	6	56	single_choice
2222	転職すればもっと活躍できると思うことがある。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:30:02.025433	2025-12-22 09:40:27.615752	8	60	single_choice
2223	自分が正しいと思えば周りの反応は気にしない。	自己評価意識	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:30:02.221351	2025-12-22 09:40:27.615752	1	61	single_choice
2224	次に何をしようかという瞬間がよくある。	結果明確	10.00	8.00	6.00	4.00	2.00	0.00	2025-12-17 01:30:02.438868	2025-12-22 09:40:27.615752	5	62	single_choice
2268	あなたの年齢を教えてください。	\N	0.00	0.00	0.00	0.00	0.00	0.00	2025-12-18 12:16:39.340018	2025-12-22 09:40:27.615752	\N	3	free_text
2170	将来の目標を明確に持っている。	変化意識	0.00	2.22	4.44	6.66	8.88	11.10	2025-12-17 01:29:47.023758	2025-12-22 09:40:27.615752	2	8	single_choice
2171	目標を達成できなかったときのことを考えることがよくある。	成果視点	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:29:47.262861	2025-12-22 09:40:27.615752	3	9	single_choice
2228	自分の責任範囲でなくても、他部署の人が困っていれば、自主的に助けるべきである。	免責意識	11.10	8.88	6.66	4.44	2.22	0.00	2025-12-17 01:30:03.234838	2025-12-22 09:40:27.615752	8	66	single_choice
2229	期限よりも早く終えることに価値はない。	時感覚	14.30	11.44	8.58	5.72	2.86	0.00	2025-12-17 01:30:03.458412	2025-12-22 09:40:27.615752	6	67	single_choice
2230	上司からのプレッシャーを感じることがある。	成果視点	12.50	10.00	7.50	5.00	2.50	0.00	2025-12-17 01:30:03.711693	2025-12-22 09:40:27.615752	3	68	single_choice
2231	同僚同士の飲み会に自分の上司を誘いたい。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-12-17 01:30:03.920257	2025-12-22 09:40:27.615752	7	69	single_choice
\.


--
-- Data for Name: problems_copy1; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.problems_copy1 (id, question_text, category, answer1_score, answer2_score, answer3_score, answer4_score, answer5_score, answer6_score, created_at, updated_at, category_id, display_order) FROM stdin;
24	周りの評価を気にせず、自分らしく生きる事が何より大切だ。	自己評価意識	10.00	8.00	6.00	4.00	2.00	0.00	2025-11-17 07:08:46.964524	2025-12-16 03:58:35.586734	1	2
36	上司からのプレッシャーを感じることがある。	成果視点	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 07:15:53.012556	2025-12-16 03:58:35.586734	3	14
37	失敗してしまった場合、「次はどのようにするのか」を優先して考えるようにしている。	成果視点	0.00	2.86	5.72	8.58	11.44	14.30	2025-11-17 07:16:13.650173	2025-12-16 03:58:35.586734	3	16
38	いまの会社で生きていく上で最も重要なことは同僚とのつながりである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:25:13.852835	2025-12-16 03:58:35.586734	7	17
39	上司の指示に納得いかないことが多い。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:25:29.78549	2025-12-16 03:58:35.586734	7	18
22	上司と意見が違っても自分が正しいと思うことをやり抜くべきである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	6.00	2025-11-17 07:07:23.205954	2025-12-16 03:58:35.586734	7	19
40	お客様に満足してもらえなければ意味がない。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:25:38.677036	2025-12-16 03:58:35.586734	7	20
41	上司の発言よりお客様の発言を優先すべきである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:25:55.894677	2025-12-16 03:58:35.586734	7	21
42	自分ができないことを部下に指示する上司はダメな上司だと思う。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:26:05.558585	2025-12-16 03:58:35.586734	7	22
65	もっと仕事ができるようになりたい。	変化意識	0.00	1.82	3.64	5.46	7.28	9.10	2025-11-17 08:09:06.037736	2025-12-16 03:58:35.586734	2	42
34	仕事が終わっていても、定時で退社するのは躊躇してしまう。	成果視点	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 07:15:06.716461	2025-12-16 03:58:35.586734	3	5
31	目標を達成できなかったときのことを考えることがよくある。	成果視点	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 07:14:11.431525	2025-12-16 03:58:35.586734	3	9
32	うまくいかなかったときほど、上司への報告を工夫している。	成果視点	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 07:14:25.725736	2025-12-16 03:58:35.586734	3	11
33	仕事をしている最中、「失敗してしまうんじゃないか」と考えることがよくある。	成果視点	13.92	11.44	8.58	5.72	2.86	6.00	2025-11-17 07:14:57.362198	2025-12-16 03:58:35.586734	3	12
35	業務中の周りの視線が気になる。	成果視点	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 07:15:43.908677	2025-12-16 03:58:35.586734	3	13
43	誰に確認したら良いか迷うことがよくある。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:26:24.77698	2025-12-16 03:58:35.586734	7	23
44	上司とはフランクに何でも言い合える関係だ。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:26:38.750277	2025-12-16 03:58:35.586734	7	24
45	上司とは友達のように仲良しである。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:26:55.952634	2025-12-16 03:58:35.586734	7	25
46	仕事の相談を直属の上司以外の上司にする事が多い。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:27:11.68647	2025-12-16 03:58:35.586734	7	26
50	失敗した時に誰の責任なのか明確に決まっている。	免責意識	0.00	1.16	3.32	4.98	6.64	8.34	2025-11-17 07:34:31.702595	2025-12-16 03:58:35.586734	8	29
51	上司が違えばもっと成果を出せると思うことがある。	免責意識	8.34	6.64	4.98	3.32	1.16	0.00	2025-11-17 07:34:39.805062	2025-12-16 03:58:35.586734	8	30
49	自分が所属していない部署であっても、気になることがあれば積極的に意見を言うべきである。	免責意識	8.34	6.64	4.98	3.32	1.16	0.00	2025-11-17 07:34:17.612746	2025-12-16 03:58:35.586734	8	31
54	数字を追いすぎると仲が悪くなってしまうと思う。	成果視点	8.34	6.64	4.98	3.32	1.16	6.00	2025-11-17 07:35:09.094625	2025-12-16 03:58:35.586734	3	15
47	同僚同士の飲み会に自分の上司を誘いたい。	組織内位置認識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 07:27:31.936311	2025-12-16 03:58:35.586734	7	28
28	なぜ自分がやらなければいけないのかと思う仕事がよくある。	免責意識	10.00	8.00	6.00	4.00	2.00	6.00	2025-11-17 07:10:45.982567	2025-12-16 03:58:35.586734	8	32
52	会社が成長する第一条件は「仲が良い職場であること」である��	免責意識	8.34	6.64	4.98	3.32	1.16	0.00	2025-11-17 07:34:52.532979	2025-12-16 03:58:35.586734	8	33
53	協力して仕事をしていくことが何より大切である。	免責意識	8.34	6.64	4.98	3.32	1.16	0.00	2025-11-17 07:35:01.213004	2025-12-16 03:58:35.586734	8	34
56	部署が変わればもっと活躍できると思うことがある。	免責意識	8.34	6.64	4.98	3.32	1.16	0.00	2025-11-17 07:35:29.286139	2025-12-16 03:58:35.586734	8	35
29	自分の評価について、「他社の友人」と「自社の同僚」だと、「他社の友人」と比べた良し悪しの方が気になる。	自己評価意識	10.00	8.00	6.00	4.00	2.00	0.00	2025-11-17 07:11:13.8778	2025-12-16 03:58:35.586734	1	3
25	周りから何を言われようが、自分が納得することが何より大切だ。	自己評価意識	10.00	8.00	6.00	4.00	2.00	0.00	2025-11-17 07:09:15.910327	2025-12-16 03:58:35.586734	1	4
30	自分の評価に納得できないことがある。	自己評価意識	12.50	10.00	7.50	5.00	2.50	6.00	2025-11-17 07:11:42.061281	2025-12-16 03:58:35.586734	1	6
26	どうすれば自分の評価が上がるのか明確である。	自己評価意識	1.00	2.50	5.00	7.50	10.00	12.50	2025-11-17 07:09:42.277977	2025-12-16 03:58:35.586734	1	8
58	転職すればもっと活躍できると思うことがある。	免責意識	8.34	6.64	4.98	3.32	1.16	0.00	2025-11-17 07:35:46.680562	2025-12-16 03:58:35.586734	8	36
64	「やったことの振り返り」よりも「次はどんな新しいことをやるのか」を考えたい。	変化意識	0.00	1.82	3.64	5.46	7.28	9.10	2025-11-17 08:08:57.359658	2025-12-16 03:58:35.586734	2	41
66	いま、人生の目標に向かって進んでいるという実感がある。	変化意識	0.00	1.82	3.64	5.46	7.28	9.10	2025-11-17 08:09:17.869229	2025-12-16 03:58:35.586734	2	43
70	なんとなくでも将来こうなりたいというイメージを持っている。	変化意識	0.00	1.82	3.64	5.46	7.28	9.10	2025-11-17 08:09:58.429063	2025-12-16 03:58:35.586734	2	45
71	出世はなるべくしたくない。	変化意識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 08:10:07.439548	2025-12-16 03:58:35.586734	2	46
72	まずは動いてから修正するということを心掛けている。	行動優先意識	0.00	2.86	5.72	8.58	11.44	14.30	2025-11-17 08:13:39.270983	2025-12-16 03:58:35.586734	4	47
74	やり方には非常に拘る方である。	行動優先意識	0.00	2.86	5.72	8.58	11.44	14.30	2025-11-17 08:14:04.501056	2025-12-16 03:58:35.586734	4	49
21	時間制限が無い方がクリエイティブな仕事ができる。	行動優先意識	14.33	11.43	8.58	5.72	2.86	6.00	2025-11-17 07:06:10.585858	2025-12-16 03:58:35.586734	4	53
1850	アウトプットの精度を高めるためであれば納期が遅れても仕方ない。	時感覚	14.30	11.44	8.58	5.72	2.86	6.00	2025-12-16 02:40:32.625928	2025-12-16 03:58:35.586734	6	59
83	期限よりも早く終えることに価値はない。	時感覚	16.66	13.32	9.99	6.66	3.33	0.00	2025-11-17 09:39:49.88512	2025-12-16 03:58:35.586734	6	61
59	会社にはモチベーションを上げてくれる環境を望んでいる。	結果明確	8.34	6.64	4.98	3.32	1.16	6.00	2025-11-17 07:35:54.879943	2025-12-16 03:58:35.586734	5	62
57	モチベーションによって仕事のパフォーマンスに差が出るのは仕方ない。	結果明確	8.34	6.64	4.98	3.32	1.16	6.00	2025-11-17 07:35:38.385404	2025-12-16 03:58:35.586734	5	63
84	優先順位をつけて仕事をするようにしている。	結果明確	0.00	2.86	5.72	8.58	11.44	14.30	2025-11-17 09:43:47.333716	2025-12-16 03:58:35.586734	5	64
55	責任を果たすために十分な権限が与えられていないと思うことがある。	結果明確	8.34	6.64	4.98	3.32	1.16	6.00	2025-11-17 07:35:20.999448	2025-12-16 03:58:35.586734	5	66
23	結果よりも全力で頑張ったかどうかが大切だ。	自己評価意識	12.50	1.00	7.50	5.00	2.50	6.00	2025-11-17 07:08:17.15607	2025-12-16 03:58:35.586734	1	1
80	仕事を最速で終えることを意識している。	時感覚	0.00	3.33	6.66	9.99	13.32	16.66	2025-11-17 09:35:38.373548	2025-12-16 03:58:35.586734	6	56
81	時間を掛けて議論を深めることによって、真の問題点が見つかる。	時感覚	16.66	13.32	9.99	6.66	3.33	0.00	2025-11-17 09:36:04.027599	2025-12-16 03:58:35.586734	6	57
82	仕事をするときは常に期限を意識している。	時感覚	0.00	3.33	6.66	9.99	13.32	16.66	2025-11-17 09:39:29.562507	2025-12-16 03:58:35.586734	6	58
48	上司から何を求められているのかを基準にして、やるべきことを考えている。	自己評価意識	1.00	2.50	5.00	7.50	10.00	12.50	2025-11-17 07:27:44.01849	2025-12-16 03:58:35.586734	1	7
73	どんなことでも納得してから業務に取り組むようにしている。	行動優先意識	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 08:13:56.384731	2025-12-16 03:58:35.586734	4	48
75	新しいことほど、やってみないとわからない。	行動優先意識	0.00	2.86	5.72	8.58	11.44	14.30	2025-11-17 08:14:13.060311	2025-12-16 03:58:35.586734	4	50
76	プロジェクトの成否は「計画の精度をいかに高めることができるか」によってすべて決まる。	行動優先意識	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 08:14:26.335413	2025-12-16 03:58:35.586734	4	51
77	上司の指示をしっかり吟味してから仕事に取り掛かるようにしている。	行動優先意識	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 08:14:37.115922	2025-12-16 03:58:35.586734	4	52
78	仕事に取り掛かる前に、腹落ちするまで考え抜くことが重要である。	行動優先意識	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 08:14:46.099266	2025-12-16 03:58:35.586734	4	54
79	上司にはいつも期限を確認するようにしている。	時感覚	0.00	3.33	6.66	9.99	13.32	16.66	2025-11-17 09:35:08.460129	2025-12-16 03:58:35.586734	6	55
68	社員旅行、社内の飲み会、社内の運動会などのイベントに積極的に参加したい。	組織内位置認識	1.00	1.82	3.64	5.46	7.28	9.10	2025-11-17 08:09:39.254416	2025-12-16 03:58:35.586734	7	27
60	自分の責任範囲でなくても、他部署の人が困っていれば、自主的に助けるべきである。	免責意識	8.34	6.64	4.98	3.32	1.16	0.00	2025-11-17 07:36:03.205874	2025-12-16 03:58:35.586734	8	37
61	将来の目標を明確に持っている。	変化意識	0.00	1.82	3.64	5.46	7.28	9.10	2025-11-17 08:07:21.223744	2025-12-16 03:58:35.586734	2	38
62	現状維持が怖い。	変化意識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 08:08:32.333923	2025-12-16 03:58:35.586734	2	39
63	なるべく今の状態をキープしたい。	変化意識	9.10	7.28	5.46	3.64	1.82	0.00	2025-11-17 08:08:47.053939	2025-12-16 03:58:35.586734	2	40
87	期限を超えても品質が120点になっていれば良い。	時感覚	14.30	11.44	8.58	5.72	2.86	6.00	2025-11-17 09:44:36.616227	2025-12-16 03:58:35.586734	6	60
85	努力を評価して欲しいと思っている。	結果明確	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 09:44:03.676989	2025-12-16 03:58:35.586734	5	65
86	仕事の優先順位に悩むことはない。	結果明確	0.00	2.86	5.72	8.58	11.44	14.30	2025-11-17 09:44:21.829763	2025-12-16 03:58:35.586734	5	68
88	何のためにその業務を遂行しているのか考え込むことがよくある。	結果明確	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 09:44:56.828278	2025-12-16 03:58:35.586734	5	69
89	次に何をしようかという瞬間がよくある。	結果明確	14.30	11.44	8.58	5.72	2.86	0.00	2025-11-17 09:45:17.805523	2025-12-16 03:58:35.586734	5	70
27	自分が正しいと思えば周りの反応は気にしない。	自己評価意識	12.50	10.00	7.50	5.00	2.50	6.00	2025-11-17 07:10:09.60466	2025-12-16 03:58:35.586734	1	10
67	1年後の目標が明確である。	変化意識	0.00	1.82	3.64	5.46	7.28	9.10	2025-11-17 08:09:26.441495	2025-12-16 03:58:35.586734	2	44
69	競争がある環境は苦手である。	結果明確	9.10	7.28	5.46	3.64	1.82	6.00	2025-11-17 08:09:50.175956	2025-12-16 03:58:35.586734	5	67
90	常に「今なにをすべ���か」が明確である。	結果明確	0.00	2.86	5.72	8.58	11.44	14.30	2025-11-17 09:45:35.439497	2025-12-16 03:58:35.586734	5	71
\.


--
-- Data for Name: rate_limits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rate_limits (id, identifier, created_at, expires_at) FROM stdin;
\.


--
-- Data for Name: survey_progress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.survey_progress (id, user_id, survey_id, question_id, category_id, answer_value, score, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: surveys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.surveys (id, name, start_date, end_date, status, created_by, created_at, updated_at, survey_type) FROM stdin;
23	2025-12-22	2025-12-21	2025-12-22	active	7	2025-12-21 03:15:42.134761	2025-12-21 03:15:42.134761	organizational
24	12-22	2025-12-21	2025-12-22	active	7	2025-12-21 03:15:57.337533	2025-12-21 03:15:57.337533	growth
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, password_hash, name, date_of_birth, department, "position", role, years_of_service, address, created_at, updated_at, department_id, job_id, pending_password_hash, password_reset_requested_at) FROM stdin;
7	admin@sunhawk.co.jp	$2b$10$Rz3TqC7fgXjnLvEiJDPik.k4X3E.d7Qo4mTfxH4/tFQfX5s/OvCGi	佐藤慎太郎	\N	経営	\N	admin	\N	\N	2025-11-02 19:20:53.537877	2025-12-10 16:06:23.258554	1	1	\N	\N
329	emp41@sunhawk.com	$2b$10$NbnbQ8RiIfA1.56vpacdBepjK3ki1aXaeyoZewqIM.cN7UvfhZ8si	浅野大樹	\N	輸送二課	業務委託者	employee	\N	\N	2025-11-25 18:43:28.10856	2025-12-05 17:20:26.164719	8	14	\N	\N
328	emp40@sunhawk.com	$2b$10$erowImHHlzS0LqaLfmqDHO/DMyuz6IjZ0B5lUM1kyEAgNHXrmteeK	髙橋弘晴	\N	輸送二課	業務委託者	employee	\N	\N	2025-11-25 18:43:28.052768	2025-12-05 17:20:26.166777	8	14	\N	\N
327	emp39@sunhawk.com	$2b$10$sy0njsPtAlHjyjzY1T7McO4HuRL8AhsNmxd7qFacetk0Yhhtxg7Xy	松本友樹	\N	輸送二課	業務委託者	employee	\N	\N	2025-11-25 18:43:27.997147	2025-12-05 17:20:26.168595	8	14	\N	\N
326	emp38@sunhawk.com	$2b$10$moQNGZrykk04fqU7Hwb9JeGF8dt5trOwU8/eHD5v.aGLGAMdm8i/S	杉原栄寿	\N	輸送一課	業務委託者	employee	\N	\N	2025-11-25 18:43:27.941863	2025-12-05 17:20:26.170436	3	14	\N	\N
325	emp37@sunhawk.com	$2b$10$oJcJIGabOALAShmm/sDDW.dQatWncOh1gYhmCdGCnv5uZDCprJjQm	尾関巧磨	\N	輸送一課	業務委託者	employee	\N	\N	2025-11-25 18:43:27.886498	2025-12-05 17:20:26.172295	3	14	\N	\N
324	emp36@sunhawk.com	$2b$10$7kdCRZBKygZLtUVzVd6HJ.KYjQBLasH71CNQd5LgLfZtxz969cStm	ラクマルジャヤコディ	\N	輸送一課	業務委託者	employee	\N	\N	2025-11-25 18:43:27.831258	2025-12-05 17:20:26.174062	3	14	\N	\N
323	emp35@sunhawk.com	$2b$10$y/pvjenwbUPizVty0Ccr7.uMyn7Ryt2lpFLLfyFHGHXAEHM8Mrwhq	白木幹夫	\N	葵FARM事業	パート	employee	\N	\N	2025-11-25 18:43:27.77395	2025-12-05 17:20:26.176745	44	4	\N	\N
321	emp33@sunhawk.com	$2b$10$BxRIgm5Sxi9BdHZkektmD.NtNNdV9DSDDqbjlwPYN2A3P/l9bFcN.	舟橋菜保子	\N	管理課	一般社員	employee	\N	\N	2025-11-25 18:43:27.662875	2025-12-05 17:20:26.180643	32	9	\N	\N
320	emp32@sunhawk.com	$2b$10$eI2.n/XB83o1QqFksnEL9OlLyzYYv7QhJ89uUBuuhir5b8KyTrwXS	佐藤栞	\N	管理課	課長	employee	\N	\N	2025-11-25 18:43:27.607783	2025-12-05 17:20:26.183418	32	3	\N	\N
319	emp31@sunhawk.com	$2b$10$DsN4tOtY6/BtkZcOIY4TGO./4Ch0dbIZK1oYr6xLqj49K9rMR5e2.	小出隆一	\N	輸送三課	一般社員	employee	\N	\N	2025-11-25 18:43:27.548379	2025-12-05 17:20:26.186326	28	9	\N	\N
318	emp30@sunhawk.com	$2b$10$7LcXbZPtoC3UqRHI6qgS8.XiHI9GK55mXIiixAWkHlUgCotg/hfCK	和田祐希	\N	輸送三課	一般社員	employee	\N	\N	2025-11-25 18:43:27.493051	2025-12-05 17:20:26.188468	28	9	\N	\N
317	emp29@sunhawk.com	$2b$10$95OVeLG8G85nUbCmSyUfGu/rLBKXe5k7oyC.fMWLf6P9F6/6Le4MS	林蓮太	\N	輸送三課	一般社員	employee	\N	\N	2025-11-25 18:43:27.43788	2025-12-05 17:20:26.190418	28	9	\N	\N
316	emp28@sunhawk.com	$2b$10$kwAHo4q2VDvjl.ofcNv6i.jM9RqLEqyAMrOq8pcLikQhLJvtiSGKK	赤尾尚輝	\N	輸送三課	一般社員	employee	\N	\N	2025-11-25 18:43:27.381583	2025-12-05 17:20:26.192957	28	9	\N	\N
315	emp27@sunhawk.com	$2b$10$7arUQVIBOPLt6AxIQ85MterGfObNm7eP7sRu8Xp9eJ0UYJg6qzVza	松本真一郎	\N	輸送三課	一般社員	employee	\N	\N	2025-11-25 18:43:27.326547	2025-12-05 17:20:26.194889	28	9	\N	\N
314	emp26@sunhawk.com	$2b$10$ubFnHcfksQKTNAvoqpr5X.gzzWOTOa/fsl.5XGrzVCmV1SXoayRqO	福田夏樹	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:27.271132	2025-12-05 17:20:26.196855	8	9	\N	\N
313	emp25@sunhawk.com	$2b$10$X8BTFRUDXhAJOHFmacXrsOzKI5MP6loqQ1Qnj9SJxWoWbrQjJWIc6	栗本真衣	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:27.215773	2025-12-05 17:20:26.198729	8	9	\N	\N
312	emp24@sunhawk.com	$2b$10$1ftO1nAuawbIU3LjD.6EPOA9eTUnu2vtSuFpNcroWI0/cZKyuOhrK	河野天徳	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:27.156574	2025-12-05 17:20:26.200676	8	9	\N	\N
311	emp23@sunhawk.com	$2b$10$QqCcS3xZ7ksmMs3TtAIuR.r1skBNm6MyHc.f6pfBTWTYTZRSREoNW	中丸浩明	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:27.098398	2025-12-05 17:20:26.202588	8	9	\N	\N
310	emp22@sunhawk.com	$2b$10$mezuoMO3xHHGr8PQhRB7CeEYieUedc6JE2Gn/JP1uf1Xf9Tf523HC	村上勇希	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:27.042136	2025-12-05 17:20:26.20447	8	9	\N	\N
309	emp21@sunhawk.com	$2b$10$6sI3TmLjjt5Ci5mDqny/ieeqzQcdMWuDny6IIkaBONJcxXjTz7Ooa	宮田康弘	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:26.985184	2025-12-05 17:20:26.206391	8	9	\N	\N
308	emp20@sunhawk.com	$2b$10$kW7T3tz0yEgCFac1tYRQMerJR3MWHaECsZxt8Rb7Ahy5ftOPFPn4q	南谷知加	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:26.929043	2025-12-05 17:20:26.208465	8	9	\N	\N
307	emp19@sunhawk.com	$2b$10$2pwwnQAZAqNL1U.BQ5eV8O8y26GaRJTKdi424vkBXe3GQUGuL6hsC	名和駿	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:26.872903	2025-12-05 17:20:26.210437	8	9	\N	\N
306	emp18@sunhawk.com	$2b$10$VJ3c4y6sHmnFozC6vFxNG.vVfUqBHIrfNg3SErwJtwQMyq6B7cI6e	松本一樹	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:26.817421	2025-12-05 17:20:26.212007	8	9	\N	\N
305	emp17@sunhawk.com	$2b$10$F.PKFAb6fI44LQ3/geif4uK3K6Y9lDNQcFtmQhVIg6xfH1kekYi.2	渡辺豊	\N	輸送二課	一般社員	employee	\N	\N	2025-11-25 18:43:26.760554	2025-12-05 17:20:26.213576	8	9	\N	\N
304	emp16@sunhawk.com	$2b$10$qIPwq3qrW//j48zK2DZVjeeJvC4de7cOOyGjG1rya79fdfEWap/6K	吉田一輝	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.703915	2025-12-05 17:20:26.215358	3	9	\N	\N
303	emp15@sunhawk.com	$2b$10$CEN4Dd6BuxXVpnYJcBtUEuXKPZ7ZAmb0tYoKDVFHdzAMN4Ja/H31C	五藤大斗	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.648153	2025-12-05 17:20:26.216973	3	9	\N	\N
302	emp14@sunhawk.com	$2b$10$uogFFXBHGQ21WUl3fJmHxuJs9PuiPe2G8WrYIvOxzViPNa3pxwOcC	安部功章	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.592829	2025-12-05 17:20:26.21849	3	9	\N	\N
301	emp13@sunhawk.com	$2b$10$zKQM4EmXe8ut0q.dIlnPv.fPORWbyP7XNUnFZG1EmZAX6hgUvhs0u	小久保良祐	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.536206	2025-12-05 17:20:26.22023	3	9	\N	\N
300	emp12@sunhawk.com	$2b$10$VXK4aNFfRwC8ZFnE.0IboenOEsi.Vad.w2TYE5C9BbkODF7QW3SeG	渋谷雅則	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.480856	2025-12-05 17:20:26.221883	3	9	\N	\N
299	emp11@sunhawk.com	$2b$10$fiJaZObYWEl0DN14CtRF0eNPQMvyFmPeQx12xuDbOzwKFJ3p8IYXK	加藤大悟	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.425477	2025-12-05 17:20:26.223717	3	9	\N	\N
298	emp10@sunhawk.com	$2b$10$sfMzPE.TPD0Fvp4DPxc7nucMZuZdI/e48i0qc2Tns/7zGXI.Zvyn2	石田賢吾	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.369029	2025-12-05 17:20:26.226381	3	9	\N	\N
297	emp9@sunhawk.com	$2b$10$u3KBo6RnmZak2TY6CTvbrOJg7GbeANUzUWxd3wIuZf5Bjx/tYkqvG	中村圭祐	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.312976	2025-12-05 17:20:26.228208	3	9	\N	\N
296	emp8@sunhawk.com	$2b$10$/7a13TztoGPVdDtfQveI0ugKK2znzb1Cj6V7.lP.GbGux3QUFLgE2	福井隼人	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.252334	2025-12-05 17:20:26.230055	3	9	\N	\N
295	emp7@sunhawk.com	$2b$10$I2UW2hH7fi/hi3mo5Wknp.6.p/AgZLyT9ynLgT7alv0m41zX5iTg.	高橋克寿	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.188205	2025-12-05 17:20:26.231842	3	9	\N	\N
293	emp5@sunhawk.com	$2b$10$kfwlyl.VLqT/Nae1tXR7EezrAfIUKKlHDOgrUEERoce.BQ.EId8/.	吉田誠亮	\N	輸送一課	業務委託者	employee	\N	\N	2025-11-25 18:43:26.064443	2025-12-05 17:20:26.235841	3	14	\N	\N
292	emp4@sunhawk.com	$2b$10$ssDk5k4qIHRW/FsOQBDP0e7wDLMQaPQ4yOm8s2V3.gQYPjHgvctAS	佐田直輝	\N	輸送一課	一般社員	employee	\N	\N	2025-11-25 18:43:26.005534	2025-12-05 17:20:26.238071	3	9	\N	\N
291	emp3@sunhawk.com	$2b$10$U/ayJ6EhwaPa8Y7jIXhX1OWEpe4So83nP4X9jN0BNf1aMSVAXZ.FC	山端清吾	\N	管理課	課長	employee	\N	\N	2025-11-25 18:43:25.944687	2025-12-05 17:20:26.239826	32	3	\N	\N
290	emp2@sunhawk.com	$2b$10$ywFITNpUE39vJfkyE/onSuTzRvJiJuJBLh7q8x48ak9ULKLLcXiAm	武山時良	\N	輸送三課	課長	employee	\N	\N	2025-11-25 18:43:25.884283	2025-12-05 17:20:26.242129	28	3	\N	\N
289	emp1@sunhawk.com	$2b$10$pt8V0yHmeKQt2UtXL8KrtenXH7tAGPINwtCpBjEZ37si6OhDcvnr2	浅田昌輝	\N	輸送事業部	部長	employee	\N	\N	2025-11-25 18:43:25.818737	2025-12-05 17:20:26.243889	2	2	\N	\N
322	emp34@sunhawk.com	$2b$10$nYw7OK1aatWA3/jZB7zD4uCOoFVJVAlf8QWc1L0NTP2HH/htamctS	河原穂波	\N	管理課	一般社員	employee	\N	\N	2025-11-25 18:43:27.718234	2025-12-06 04:19:14.736542	32	9	\N	\N
331	emp43@sunhawk.com	$2b$10$Cq3/8lJfN5TXBgSO3.S1ouVD29SagE7ykac.28I7zGWvgRTnFftOG	浜田啓史	\N	TWO-EIGHT事業	事業責任者	employee	\N	\N	2025-11-25 18:43:28.219653	2025-12-05 17:20:26.160873	14	16	\N	\N
330	emp42@sunhawk.com	$2b$10$U.3mnFaND2vyHvUGEORsfeg7b0NpVauzyP87WDRyvhdpceKACYMRW	神山隼也	\N	輸送二課	業務委託者	employee	\N	\N	2025-11-25 18:43:28.163957	2025-12-05 17:20:26.162846	8	14	\N	\N
294	emp6@sunhawk.com	$2b$10$6CU6zOGCmgb.K/KEVqbBq.L/CZGUl0R2Hs2zGNlPNeokOBgCAqL0K	佐藤孝典	\N	葵FARM事業	農園責任者	employee	\N	\N	2025-11-25 18:43:26.12522	2025-12-05 17:20:26.233532	44	17	\N	\N
\.


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.departments_id_seq', 55, true);


--
-- Name: growth_survey_free_text_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.growth_survey_free_text_responses_id_seq', 36, true);


--
-- Name: growth_survey_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.growth_survey_questions_id_seq', 33, true);


--
-- Name: growth_survey_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.growth_survey_responses_id_seq', 145, true);


--
-- Name: growth_survey_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.growth_survey_summary_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 20, true);


--
-- Name: login_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_logs_id_seq', 586, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 709, true);


--
-- Name: organizational_survey_free_text_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.organizational_survey_free_text_responses_id_seq', 69, true);


--
-- Name: organizational_survey_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.organizational_survey_results_id_seq', 81, true);


--
-- Name: organizational_survey_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.organizational_survey_summary_id_seq', 82, true);


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 4, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.problems_id_seq', 2275, true);


--
-- Name: rate_limits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rate_limits_id_seq', 73, true);


--
-- Name: survey_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.survey_progress_id_seq', 1, false);


--
-- Name: surveys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.surveys_id_seq', 24, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 345, true);


--
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: growth_survey_free_text_responses growth_survey_free_text_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_free_text_responses
    ADD CONSTRAINT growth_survey_free_text_responses_pkey PRIMARY KEY (id);


--
-- Name: growth_survey_free_text_responses growth_survey_free_text_responses_uid_gsid_gqid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_free_text_responses
    ADD CONSTRAINT growth_survey_free_text_responses_uid_gsid_gqid_key UNIQUE (uid, gsid, gqid);


--
-- Name: growth_survey_questions growth_survey_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_questions
    ADD CONSTRAINT growth_survey_questions_pkey PRIMARY KEY (id);


--
-- Name: growth_survey_responses growth_survey_responses_gqid_gsid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_responses
    ADD CONSTRAINT growth_survey_responses_gqid_gsid_key UNIQUE (gqid, gsid);


--
-- Name: growth_survey_responses growth_survey_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_responses
    ADD CONSTRAINT growth_survey_responses_pkey PRIMARY KEY (id);


--
-- Name: growth_survey_summary growth_survey_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_summary
    ADD CONSTRAINT growth_survey_summary_pkey PRIMARY KEY (id);


--
-- Name: growth_survey_summary growth_survey_summary_uid_gsid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_summary
    ADD CONSTRAINT growth_survey_summary_uid_gsid_key UNIQUE (uid, gsid);


--
-- Name: jobs jobs_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_name_key UNIQUE (name);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: login_logs login_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_logs
    ADD CONSTRAINT login_logs_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: organizational_survey_free_text_responses organizational_survey_free_text_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_free_text_responses
    ADD CONSTRAINT organizational_survey_free_text_responses_pkey PRIMARY KEY (id);


--
-- Name: organizational_survey_free_text_responses organizational_survey_free_text_responses_uid_osid_qid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_free_text_responses
    ADD CONSTRAINT organizational_survey_free_text_responses_uid_osid_qid_key UNIQUE (uid, osid, qid);


--
-- Name: organizational_survey_results organizational_survey_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_results
    ADD CONSTRAINT organizational_survey_results_pkey PRIMARY KEY (id);


--
-- Name: organizational_survey_results organizational_survey_results_uid_osid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_results
    ADD CONSTRAINT organizational_survey_results_uid_osid_key UNIQUE (uid, osid);


--
-- Name: organizational_survey_summary organizational_survey_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_summary
    ADD CONSTRAINT organizational_survey_summary_pkey PRIMARY KEY (id);


--
-- Name: organizational_survey_summary organizational_survey_summary_uid_osid_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_summary
    ADD CONSTRAINT organizational_survey_summary_uid_osid_key UNIQUE (uid, osid);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_token_key UNIQUE (token);


--
-- Name: problems_copy1 problems_copy1_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems_copy1
    ADD CONSTRAINT problems_copy1_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: rate_limits rate_limits_identifier_created_at_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_limits
    ADD CONSTRAINT rate_limits_identifier_created_at_key UNIQUE (identifier, created_at);


--
-- Name: rate_limits rate_limits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rate_limits
    ADD CONSTRAINT rate_limits_pkey PRIMARY KEY (id);


--
-- Name: survey_progress survey_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_progress
    ADD CONSTRAINT survey_progress_pkey PRIMARY KEY (id);


--
-- Name: survey_progress survey_progress_user_id_survey_id_question_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_progress
    ADD CONSTRAINT survey_progress_user_id_survey_id_question_id_key UNIQUE (user_id, survey_id, question_id);


--
-- Name: surveys surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_departments_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_departments_name ON public.departments USING btree (name);


--
-- Name: idx_departments_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_departments_parent_id ON public.departments USING btree (parent_id);


--
-- Name: idx_growth_questions_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_questions_category ON public.growth_survey_questions USING btree (category);


--
-- Name: idx_growth_questions_focus_area; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_questions_focus_area ON public.growth_survey_questions USING btree (focus_area);


--
-- Name: idx_growth_questions_weight; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_questions_weight ON public.growth_survey_questions USING btree (weight);


--
-- Name: idx_growth_survey_free_text_responses_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_free_text_responses_created_at ON public.growth_survey_free_text_responses USING btree (created_at);


--
-- Name: idx_growth_survey_free_text_responses_gqid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_free_text_responses_gqid ON public.growth_survey_free_text_responses USING btree (gqid);


--
-- Name: idx_growth_survey_free_text_responses_gsid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_free_text_responses_gsid ON public.growth_survey_free_text_responses USING btree (gsid);


--
-- Name: idx_growth_survey_free_text_responses_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_free_text_responses_uid ON public.growth_survey_free_text_responses USING btree (uid);


--
-- Name: idx_growth_survey_questions_display_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_questions_display_order ON public.growth_survey_questions USING btree (display_order);


--
-- Name: idx_growth_survey_questions_question_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_questions_question_type ON public.growth_survey_questions USING btree (question_type);


--
-- Name: idx_growth_survey_responses_cid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_responses_cid ON public.growth_survey_responses USING btree (cid);


--
-- Name: idx_growth_survey_responses_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_responses_created_at ON public.growth_survey_responses USING btree (created_at);


--
-- Name: idx_growth_survey_responses_gqid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_responses_gqid ON public.growth_survey_responses USING btree (gqid);


--
-- Name: idx_growth_survey_responses_gsid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_responses_gsid ON public.growth_survey_responses USING btree (gsid);


--
-- Name: idx_growth_survey_responses_result; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_responses_result ON public.growth_survey_responses USING gin (result);


--
-- Name: idx_growth_survey_summary_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_summary_created_at ON public.growth_survey_summary USING btree (created_at);


--
-- Name: idx_growth_survey_summary_gsid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_summary_gsid ON public.growth_survey_summary USING btree (gsid);


--
-- Name: idx_growth_survey_summary_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_growth_survey_summary_uid ON public.growth_survey_summary USING btree (uid);


--
-- Name: idx_jobs_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jobs_name ON public.jobs USING btree (name);


--
-- Name: idx_login_logs_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_login_logs_email ON public.login_logs USING btree (email);


--
-- Name: idx_login_logs_login_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_login_logs_login_at ON public.login_logs USING btree (login_at);


--
-- Name: idx_login_logs_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_login_logs_status ON public.login_logs USING btree (login_status);


--
-- Name: idx_login_logs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_login_logs_user_id ON public.login_logs USING btree (user_id);


--
-- Name: idx_notifications_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_created_at ON public.notifications USING btree (created_at DESC);


--
-- Name: idx_notifications_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_user_id ON public.notifications USING btree (user_id);


--
-- Name: idx_notifications_user_id_is_read; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_user_id_is_read ON public.notifications USING btree (user_id, is_read);


--
-- Name: idx_organizational_survey_free_text_responses_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_free_text_responses_created_at ON public.organizational_survey_free_text_responses USING btree (created_at);


--
-- Name: idx_organizational_survey_free_text_responses_osid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_free_text_responses_osid ON public.organizational_survey_free_text_responses USING btree (osid);


--
-- Name: idx_organizational_survey_free_text_responses_qid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_free_text_responses_qid ON public.organizational_survey_free_text_responses USING btree (qid);


--
-- Name: idx_organizational_survey_free_text_responses_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_free_text_responses_uid ON public.organizational_survey_free_text_responses USING btree (uid);


--
-- Name: idx_organizational_survey_results_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_results_created_at ON public.organizational_survey_results USING btree (created_at);


--
-- Name: idx_organizational_survey_results_osid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_results_osid ON public.organizational_survey_results USING btree (osid);


--
-- Name: idx_organizational_survey_results_response; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_results_response ON public.organizational_survey_results USING gin (response);


--
-- Name: idx_organizational_survey_results_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_results_uid ON public.organizational_survey_results USING btree (uid);


--
-- Name: idx_organizational_survey_summary_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_summary_created_at ON public.organizational_survey_summary USING btree (created_at);


--
-- Name: idx_organizational_survey_summary_osid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_summary_osid ON public.organizational_survey_summary USING btree (osid);


--
-- Name: idx_organizational_survey_summary_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_organizational_survey_summary_uid ON public.organizational_survey_summary USING btree (uid);


--
-- Name: idx_password_reset_tokens_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_password_reset_tokens_token ON public.password_reset_tokens USING btree (token);


--
-- Name: idx_password_reset_tokens_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_password_reset_tokens_user_id ON public.password_reset_tokens USING btree (user_id);


--
-- Name: idx_problems_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_category ON public.problems USING btree (category);


--
-- Name: idx_problems_category_copy1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_category_copy1 ON public.problems_copy1 USING btree (category);


--
-- Name: idx_problems_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_category_id ON public.problems USING btree (category_id);


--
-- Name: idx_problems_category_id_copy1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_category_id_copy1 ON public.problems_copy1 USING btree (category_id);


--
-- Name: idx_problems_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_created_at ON public.problems USING btree (created_at);


--
-- Name: idx_problems_created_at_copy1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_created_at_copy1 ON public.problems_copy1 USING btree (created_at);


--
-- Name: idx_problems_display_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_display_order ON public.problems USING btree (display_order);


--
-- Name: idx_problems_display_order_copy1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_display_order_copy1 ON public.problems_copy1 USING btree (display_order);


--
-- Name: idx_problems_question_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_problems_question_type ON public.problems USING btree (question_type);


--
-- Name: idx_rate_limits_expires; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rate_limits_expires ON public.rate_limits USING btree (expires_at);


--
-- Name: idx_rate_limits_identifier; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rate_limits_identifier ON public.rate_limits USING btree (identifier, created_at);


--
-- Name: idx_survey_progress_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_survey_progress_category_id ON public.survey_progress USING btree (category_id);


--
-- Name: idx_survey_progress_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_survey_progress_question_id ON public.survey_progress USING btree (question_id);


--
-- Name: idx_survey_progress_survey_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_survey_progress_survey_id ON public.survey_progress USING btree (survey_id);


--
-- Name: idx_survey_progress_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_survey_progress_user_id ON public.survey_progress USING btree (user_id);


--
-- Name: idx_survey_progress_user_survey; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_survey_progress_user_survey ON public.survey_progress USING btree (user_id, survey_id);


--
-- Name: idx_surveys_dates; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_surveys_dates ON public.surveys USING btree (start_date, end_date);


--
-- Name: idx_surveys_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_surveys_status ON public.surveys USING btree (status);


--
-- Name: idx_users_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_users_created_at ON public.users USING btree (created_at DESC);


--
-- Name: idx_users_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_users_department_id ON public.users USING btree (department_id);


--
-- Name: idx_users_dept_job; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_users_dept_job ON public.users USING btree (department_id, job_id);


--
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_users_email ON public.users USING btree (email);


--
-- Name: idx_users_job_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_users_job_id ON public.users USING btree (job_id);


--
-- Name: idx_users_role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_users_role ON public.users USING btree (role);


--
-- Name: growth_survey_free_text_responses trg_growth_survey_free_text_responses_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_growth_survey_free_text_responses_updated_at BEFORE UPDATE ON public.growth_survey_free_text_responses FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: organizational_survey_free_text_responses trg_organizational_survey_free_text_responses_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_organizational_survey_free_text_responses_updated_at BEFORE UPDATE ON public.organizational_survey_free_text_responses FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: departments departments_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.departments(id);


--
-- Name: growth_survey_free_text_responses growth_survey_free_text_responses_gqid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_free_text_responses
    ADD CONSTRAINT growth_survey_free_text_responses_gqid_fkey FOREIGN KEY (gqid) REFERENCES public.growth_survey_questions(id) ON DELETE CASCADE;


--
-- Name: growth_survey_free_text_responses growth_survey_free_text_responses_gsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_free_text_responses
    ADD CONSTRAINT growth_survey_free_text_responses_gsid_fkey FOREIGN KEY (gsid) REFERENCES public.surveys(id) ON DELETE CASCADE;


--
-- Name: growth_survey_free_text_responses growth_survey_free_text_responses_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_free_text_responses
    ADD CONSTRAINT growth_survey_free_text_responses_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: growth_survey_responses growth_survey_responses_gqid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_responses
    ADD CONSTRAINT growth_survey_responses_gqid_fkey FOREIGN KEY (gqid) REFERENCES public.growth_survey_questions(id) ON DELETE CASCADE;


--
-- Name: growth_survey_responses growth_survey_responses_gsid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_responses
    ADD CONSTRAINT growth_survey_responses_gsid_fkey FOREIGN KEY (gsid) REFERENCES public.surveys(id) ON DELETE CASCADE;


--
-- Name: growth_survey_summary growth_survey_summary_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_summary
    ADD CONSTRAINT growth_survey_summary_survey_id_fkey FOREIGN KEY (gsid) REFERENCES public.surveys(id) ON DELETE CASCADE;


--
-- Name: growth_survey_summary growth_survey_summary_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.growth_survey_summary
    ADD CONSTRAINT growth_survey_summary_user_id_fkey FOREIGN KEY (uid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: login_logs login_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_logs
    ADD CONSTRAINT login_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: notifications notifications_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES public.surveys(id) ON DELETE SET NULL;


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: organizational_survey_free_text_responses organizational_survey_free_text_responses_osid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_free_text_responses
    ADD CONSTRAINT organizational_survey_free_text_responses_osid_fkey FOREIGN KEY (osid) REFERENCES public.surveys(id) ON DELETE CASCADE;


--
-- Name: organizational_survey_free_text_responses organizational_survey_free_text_responses_qid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_free_text_responses
    ADD CONSTRAINT organizational_survey_free_text_responses_qid_fkey FOREIGN KEY (qid) REFERENCES public.problems(id) ON DELETE CASCADE;


--
-- Name: organizational_survey_free_text_responses organizational_survey_free_text_responses_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_free_text_responses
    ADD CONSTRAINT organizational_survey_free_text_responses_uid_fkey FOREIGN KEY (uid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: organizational_survey_results organizational_survey_results_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_results
    ADD CONSTRAINT organizational_survey_results_survey_id_fkey FOREIGN KEY (osid) REFERENCES public.surveys(id) ON DELETE CASCADE;


--
-- Name: organizational_survey_results organizational_survey_results_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_results
    ADD CONSTRAINT organizational_survey_results_user_id_fkey FOREIGN KEY (uid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: organizational_survey_summary organizational_survey_summary_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_summary
    ADD CONSTRAINT organizational_survey_summary_survey_id_fkey FOREIGN KEY (osid) REFERENCES public.surveys(id) ON DELETE CASCADE;


--
-- Name: organizational_survey_summary organizational_survey_summary_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizational_survey_summary
    ADD CONSTRAINT organizational_survey_summary_user_id_fkey FOREIGN KEY (uid) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: password_reset_tokens password_reset_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: survey_progress survey_progress_survey_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_progress
    ADD CONSTRAINT survey_progress_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES public.surveys(id) ON DELETE CASCADE;


--
-- Name: survey_progress survey_progress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.survey_progress
    ADD CONSTRAINT survey_progress_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: surveys surveys_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.surveys
    ADD CONSTRAINT surveys_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: users users_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: users users_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(id);


--
-- PostgreSQL database dump complete
--

\unrestrict yY03FEAuBswKrEGMRZgwlpk30Isp5xhpp0gb7cosB4IAWZ9U9Lqd0JbF5g0NaBe

