--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-05-22 13:57:37 EDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 180 (class 3079 OID 12018)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 180
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 24686)
-- Name: agenda; Type: TABLE; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE TABLE agenda (
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    number text,
    status text
);


ALTER TABLE agenda OWNER TO toronto_api_user;

--
-- TOC entry 178 (class 1259 OID 24684)
-- Name: agenda_id_seq; Type: SEQUENCE; Schema: public; Owner: toronto_api_user
--

CREATE SEQUENCE agenda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agenda_id_seq OWNER TO toronto_api_user;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 178
-- Name: agenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toronto_api_user
--

ALTER SEQUENCE agenda_id_seq OWNED BY agenda.id;


--
-- TOC entry 175 (class 1259 OID 16421)
-- Name: councillor; Type: TABLE; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE TABLE councillor (
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    email text,
    image_url text,
    first_name text,
    last_name text,
    bio text,
    phone text,
    ward integer,
    website_url text,
    twitter_handle text,
    facebook_handle text,
    terms json
);


ALTER TABLE councillor OWNER TO toronto_api_user;

--
-- TOC entry 174 (class 1259 OID 16419)
-- Name: councillor_id_seq; Type: SEQUENCE; Schema: public; Owner: toronto_api_user
--

CREATE SEQUENCE councillor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE councillor_id_seq OWNER TO toronto_api_user;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 174
-- Name: councillor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toronto_api_user
--

ALTER SEQUENCE councillor_id_seq OWNED BY councillor.id;


--
-- TOC entry 171 (class 1259 OID 16399)
-- Name: sails_migrations; Type: TABLE; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE TABLE sails_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE sails_migrations OWNER TO toronto_api_user;

--
-- TOC entry 170 (class 1259 OID 16397)
-- Name: sails_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: toronto_api_user
--

CREATE SEQUENCE sails_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sails_migrations_id_seq OWNER TO toronto_api_user;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 170
-- Name: sails_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toronto_api_user
--

ALTER SEQUENCE sails_migrations_id_seq OWNED BY sails_migrations.id;


--
-- TOC entry 173 (class 1259 OID 16407)
-- Name: user; Type: TABLE; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    email text,
    password text,
    "avatarUrl" text,
    "firstName" text,
    "lastName" text
);


ALTER TABLE "user" OWNER TO toronto_api_user;

--
-- TOC entry 172 (class 1259 OID 16405)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: toronto_api_user
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO toronto_api_user;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 172
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toronto_api_user
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- TOC entry 177 (class 1259 OID 16457)
-- Name: ward; Type: TABLE; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE TABLE ward (
    id integer NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone,
    number text,
    region text,
    geo json,
    councillor integer
);


ALTER TABLE ward OWNER TO toronto_api_user;

--
-- TOC entry 176 (class 1259 OID 16455)
-- Name: ward_id_seq; Type: SEQUENCE; Schema: public; Owner: toronto_api_user
--

CREATE SEQUENCE ward_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ward_id_seq OWNER TO toronto_api_user;

--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 176
-- Name: ward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: toronto_api_user
--

ALTER SEQUENCE ward_id_seq OWNED BY ward.id;


--
-- TOC entry 2121 (class 2604 OID 24689)
-- Name: id; Type: DEFAULT; Schema: public; Owner: toronto_api_user
--

ALTER TABLE ONLY agenda ALTER COLUMN id SET DEFAULT nextval('agenda_id_seq'::regclass);


--
-- TOC entry 2119 (class 2604 OID 16424)
-- Name: id; Type: DEFAULT; Schema: public; Owner: toronto_api_user
--

ALTER TABLE ONLY councillor ALTER COLUMN id SET DEFAULT nextval('councillor_id_seq'::regclass);


--
-- TOC entry 2117 (class 2604 OID 16402)
-- Name: id; Type: DEFAULT; Schema: public; Owner: toronto_api_user
--

ALTER TABLE ONLY sails_migrations ALTER COLUMN id SET DEFAULT nextval('sails_migrations_id_seq'::regclass);


--
-- TOC entry 2118 (class 2604 OID 16410)
-- Name: id; Type: DEFAULT; Schema: public; Owner: toronto_api_user
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- TOC entry 2120 (class 2604 OID 16460)
-- Name: id; Type: DEFAULT; Schema: public; Owner: toronto_api_user
--

ALTER TABLE ONLY ward ALTER COLUMN id SET DEFAULT nextval('ward_id_seq'::regclass);


--
-- TOC entry 2258 (class 0 OID 24686)
-- Dependencies: 179
-- Data for Name: agenda; Type: TABLE DATA; Schema: public; Owner: toronto_api_user
--

COPY agenda (id, "createdAt", "updatedAt", number, status) FROM stdin;
\.


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 178
-- Name: agenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toronto_api_user
--

SELECT pg_catalog.setval('agenda_id_seq', 1, false);


--
-- TOC entry 2254 (class 0 OID 16421)
-- Dependencies: 175
-- Data for Name: councillor; Type: TABLE DATA; Schema: public; Owner: toronto_api_user
--

COPY councillor (id, "createdAt", "updatedAt", email, image_url, first_name, last_name, bio, phone, ward, website_url, twitter_handle, facebook_handle, terms) FROM stdin;
1	2015-05-14 14:56:02-04	2015-05-14 14:56:02-04	mayor_tory@toronto.ca	/images/jtory.jpg	John	Tory	John Tory is the 65th Mayor of Toronto.\n\nBorn and raised in Toronto, Mayor Tory has spent his career promoting and giving back to the city he loves.\n\nAs a lawyer, talk show host, businessman, Member of Provincial Parliament and Leader of the Official Opposition at Queen’s Park, and finally as Mayor, he has long believed that the diversity of Toronto is its strength. As Mayor, John’s focus will be on bringing the city together as One Toronto.\n\nAmong Mayor Tory’s top priorities are tackling transit and traffic congestion. He is focused on taking action to reduce commute times so Toronto residents can get to work on time and home to their families sooner. Mayor Tory is also getting to work on Toronto’s transit crisis by getting on with the Scarborough subway and beginning work on the SmartTrack line, a 53 kilometre, 22 station surface subway that would provide all day, two-way service across the city and bring needed relief to the congested Yonge subway.\n\nThe early years of Mayor Tory’s career were spent practicing law in Toronto, and he was later elected as a managing partner of one of Canada’s biggest law firms. In the 1980’s he served as Principal Secretary to Premier Bill Davis and as Associate Secretary of the Ontario Cabinet. In September 2004, Mayor Tory was elected leader of the Progressive Conservative Party of Ontario. In 2005, as PC Party Leader, Mayor Tory would serve as the Leader of the Official Opposition at Queen’s Park.\n\nMayor Tory has an extensive background in volunteer community service. He served as volunteer Chairman and Commissioner of the Canadian Football League and has chaired fundraising campaigns for St. Michael’s Hospital and the United Way. He has also held leadership positions in a wide range of charitable organizations ranging from Canadian Paraplegic Association, Crimestoppers, St. Michael's Hospital, Toronto Association for Community Living, the United Way, and the Women's Legal Education & Action Fund (LEAF).\n\nMayor Tory’s community work has been widely recognized. Mayor Tory was a founding Board Member and Chair of the Greater Toronto CivicAction Alliance. He is a recipient of both the Paul Harris and Mel Osborne Awards from the Rotary and Kiwanis organizations respectively and was named a Life Member of the Salvation Army Advisory Board. He is also the recipient of an African Canadian Achievement Award and the Harry Jerome Award.  Mayor Tory was recently awarded the Order of Ontario for being a “consummate champion for the Greater Toronto Region.”\n\nBorn on May 28, 1954, Mayor Tory is a lifelong, and long-suffering, Toronto Maple Leafs fan. Mayor Tory and his wife Barbara have been married for 32 years. They raised their four children, John Jr, Chris, Susan and George in Toronto and are now delighted to have four grandchildren to spoil.	4163972489	\N	\N	\N	\N	\N
3	2015-05-14 15:15:47-04	2015-05-14 15:15:47-04	Councillor_DiCiano@toronto.ca	/images/j-diciano.jpg	Justin	Di Ciano	Justin Di Ciano was elected City Councillor for Ward 5 on October 27th 2014. Justin has lived in the Etobicoke-Lakeshore community his entire adult life. Justin lives with his wife Kristen and their two young children Makayla and Julien.\n\nPrior to being elected to office, Justin owned and operated businesses in the financial, medical and commercial real estate industries. In 2009, Justin was recognized as one of the Top 40 Under 40 Italian-Canadians in Canada by the Italian Canadian Chamber of Commerce for his efforts in business and leadership in his community.\n\nJustin’s extensive philanthropic initiatives include support for many of Canada’s most established charities and educational institutions. Mr. Di Ciano is a Social Entrepreneur with the PACT Urban Peace Program, an award winning charity that in Partnership with the TDSB works with inner city youth across Toronto.\n\nAs a long standing member of the Rotary Club of Etobicoke, Justin is Chair of Toronto Ribfest Food & Music Festival, one of Canada’s largest annual fundraisers. Justin is also the co-founder of the Jean Augustine Centre for Young Women’s Empowerment, a privately funded teaching and training centre focusing on education, nutrition and real-world job training for underprivileged youth in Etobicoke.	4163924040	\N	\N	\N	\N	\N
4	2015-05-14 15:15:47-04	2015-05-14 15:15:47-04	councillor_mcconnell@toronto.ca	/images/pmcconnell.jpg	Pam	McConnell	Pam McConnell has served the residents of downtown Toronto since 1982, first as a school trustee for 12 years, and since 1994, as a City Councillor.  Pam has focussed her public service on working with residents and groups to build healthy communities for all Torontonians.\n\nCurrently in her seventh term as City Councillor, Pam is also serving as Deputy Mayor, with the responsibility of leading Toronto's Poverty Reduction Strategy.  Pam is a member of the Government Management Committee, which oversees the City's assets and administrative operations, the Affordable Housing Committee, which directs investment to affordable housing opportunities, and Toronto & East York Community Council, which is responsible for local planning and neighbourhood issues.\n\nAs City Councillor for Ward 28 (Toronto Centre-Rosedale), Pam continues to oversee many important city building projects, such as the revitalization of Regent Park, including the recently opened aquatic centre and central park.  With community members, Pam is leading improvements to the St. Lawrence Market Precinct and secured funding for the new $94-million North Market building.  She continues to work with residents and Waterfront Toronto on the development of the West Don Lands and East Bayfront neighbourhoods, creating healthy, sustainable and vibrant communities, as well as a reimagining of the Jack Layton Ferry Terminal and Harbour Square Park.  Pam is also working on plans for the First Parliament Site and improvements to parks and greenspaces in Corktown, Cabbagetown, and St. James Town.\n\nSome of Pam’s initial work as a Councillor centred around children. As a member of the Children and Youth Action Committee, she led the campaign against user fees in City recreation centres and developed the Children’s Report Card. This work for children and youth continues, and in 2005, she celebrated the opening of the Wellesley Community Centre, the first built in Toronto since amalgamation, and recently secured funding for an aquatic centre for St. James Town.\n\nIn addition to her duties at City Hall, Pam is an active and well-respected participant in national and international arenas.  Since 1999, she has represented Toronto at the Board of Directors of the Federation of Canadian Municipalities (FCM), and she currently serves as the Vice-Chair of FCM's Social-Economic Development Committee.  Pam also represents Toronto as an Executive member at United Cities and Local Governments (UCLG), an international organization of local governments that advocates and shares best practices among municipalities.\n\nSome of her most significant work at FCM has been as a founding member of the Standing Committee on Increasing Women's Participation in Municipal Government and served as its Chair from 2007 to 2012. She has been instrumental in the formation of the action plan to encourage and support women seeking municipal office and in the creation of materials and programs being implemented across the country.\n\nAs Chair of the Toronto Police Services Board from 2004 to 2005, and Vice-Chair from 2005 to 2010, Pam worked to address racial profiling in the Service, challenging the police complaints system to ensure independent civilian oversight, bringing community policing back to the City’s neighbourhoods, and launching an investigation into paid duty to save tax dollars.\n\nIn her time as school trustee, and as Chair of the Toronto Board of Education in 1992, Pam was well known as an advocate for children living in poverty. Her accomplishments during that time include helping to found Parents for Better Beginnings in Regent Park, the Brighter Futures – St. James Town health project, and the Student Nutrition Coalition, which began the breakfast and lunch programs in Toronto schools.\n\nIn 1997, she received an award from the Duke of Edinburgh for her work with inner city youth. In 2013, Pam received the Queen’s Diamond Jubilee medal, in recognition of her decades of public service.\n\nAfter living for almost 40 years in Spruce court Co-op in Cabbagetown, Pam and her family now live in the revitalized Regent Park.	4163927916	\N	\N	\N	\N	\N
19	2015-05-22 11:42:54-04	2015-05-22 11:42:54-04	Councillor_Campbell@toronto.ca	/images/j-campbell.jpg	John	Campbell	John Campbell was elected to City Council as Councillor for Ward 4 (Etobicoke Centre) in the October 27, 2014 municipal election.\n\nPrior to serving as Councillor, his public service record consists of seven years (2003-2010) as a trustee with the TDSB, with two years as Chair of the Board (2008, 2009) and three years as the Chair of the Administration, Finance and Accountability Committee. The TDSB is Canada’s largest school board and its budget, at the time, was $2.6 billion.\n\nA graduate of the University of Toronto (Political Science and Economics), John’s business career has been in consumer goods sales management and marketing for over 30 years. Since 2008, he has operated his own company representing and distributing products for companies from Canada, the US, Australia, and the UK to national retailers.\n\nIn 1999, John earned an MBA from the Schulich School of Business (Finance and Strategic Management) after four and a half years of evening study.\n\nHe is proud to call Etobicoke home and has lived in Etobicoke Centre for over 35 years where his two daughters were raised and attended local schools. Each is now attending post-graduate studies.\n\nOne of John’s priorities is to maintain the existing city services provided to local residents while providing effective growth opportunities that yield tangible benefits to the community.	4163921369	\N	\N	\N	\N	\N
22	2015-05-22 12:01:39-04	2015-05-22 12:01:39-04	Councillor_CarmichaelGreb@toronto.ca	/images/c-carmichaelgreb.jpg	Christin	Carmichael Greb	Christin Carmichael Greb was elected as the City Councillor for Ward 16 (Eglinton-Lawrence) in the 2014 municipal election and was sworn into office on December 2, 2014.\n\nChristin has deep roots in Ward 16. As someone who was born and raised in North Toronto, she is motivated to serve and represent the community. Her husband and their two boys are proud to call ward 16 home. Christin has always believed that strong families are the fabric that makes up strong communities.\n\nHaving long envisioned her children growing up in a city that continues to flourish, she wants to contribute to good governance at City Hall. As such, her decisions will be the product of consultation and collaboration with her constituents, the expert advice from City staff and the principles and commitments that she was elected upon.\n\nTop priorities:\n\nMaking every customer service interaction matter\nGetting Toronto moving while keeping local streets safe\nEngaging communities to manage growth responsibly\nInvesting in vital infrastructure while respecting taxpayers	4163924090	\N	\N	\N	\N	\N
2	2015-05-14 15:10:23-04	2015-05-21 19:38:24-04	councillor_ainslie@toronto.ca	/images/painslie.jpg	Paul	Ainslie	As an effective member of Toronto City Council Paul brings an experienced perspective to Council. Having experience at all three levels of government has given Paul an edge when navigating through policy.\n\nWith a strong belief in the value of public service, Paul has been involved in a number of community organizations including the Boy Scouts of Canada, the Canadian Cancer Society, the Knights of Columbus, and the Friends of Fort York to name a few.\n\nPaul will uphold his belief that residents need local government to provide police and fire protection, maintain streets, provide parks and collecting our garbage and above all else represent the residents of the City of Toronto. Among the many issues facing the Ward and the City, Paul believes that residents should be engaged so they feel connected to their community.\n\nAs Chair of the Government Management Committee Paul along with the City Clerk's Office envision a city in which all are fully engaged to an open and accessible local government. Transparent and accountable government is the measure for which Paul will strive as he with the City Clerk's Office work diligently to build public trust and confidence in our local government.	4163694286	\N	\N	\N	\N	\N
7	2015-05-22 10:37:44-04	2015-05-22 10:37:44-04	councillor_digiorgio@toronto.ca	/images/f-digiorgio.jpg	Frank	Di Giorgio	Frank Di Giorgio started his political career in 1985 as a Councillor in the former City of North York. In 2000, he was elected Toronto City Councillor for York South-Weston. A former Budget Chief for the City of Toronto, Frank serves on a variety of committees.\n\nWhile in North York, Frank served as a member of the Executive Committee and chaired all major standing committees, including Works, Transportation, Planning Advisory, Library Board, Parks and Recreation, and Capital Planning.\n\nA graduate of McMaster University in Mathematics and the University of Western Ontario Business School, Frank has a diverse background that encompasses teaching, coaching, business management, and politics.\n\nAs a teacher, Frank was an Assistant Head of Mathematics at Western Technology Secondary School, and an Associate of the Ontario College of Education. He also coached championship football teams before pursuing postgraduate training in business administration.\n\nFrank has consistently focused on improving the quality of life for residents of both his ward and the City of Toronto.\n\nFrank and his wife Mary have two children, Liana and Daniel.	4163924066	\N	\N	\N	\N	\N
5	2015-05-21 19:18:16-04	2015-05-21 19:41:12-04	councillor_augimeri@toronto.ca	/images/maugimeri.jpg	Maria	Augimeri	Maria Augimeri is the City of Toronto Councillor for York Centre - Ward 9. Councillor Augimeri was first elected in 1982 as a School Trustee and was subsequently elected to the City of North York Council in 1985. She has continued to represent the area of Downsview as a City Councillor, acting as an advocate for her residents and championing key local issues.\n\nCouncillor Augimeri is committed to the revitalization of Downsview, results which can be seen throughout the Ward 9 area. The revitalization of major road ways and the planting of thousands of trees have improved the appearance of the community. At the corner of Keele and Wilson, the Downsview Memorial Parkette has been redesigned to act as a welcoming oasis into the neighbourhood. Councillor Augimeri states that, "revitalizing and beautifying the Downsview area is a key priority and I will use all of the municipal planning tools to do just that." In this spirit Councillor Augimeri forged ahead to have Wilson Avenue chosen as an "Avenue" as per the City's Official Plan to be slated for improvement. As a result, a detailed Streetscape Plan with a new Zoning By-law will facilitate real and positive change for the local area.\n\nCouncillor Augimeri led the construction of the new Robert (Bob) Leek Memorial Park in Downsview which has the honour of being named one of Toronto's 10 Best Places by the Toronto Star. The Councillor was also instrumental in the building of the award-winning Jane/Sheppard Library, which increased readership by 76% among local youth just four months after its opening.\n\nReaching out to residents, Councillor Augimeri has operated a Community Service Office for the past 25 years, where she meets with her constituents on a one-on-one basis. She has held annual Property Tax and Assessment Clinics to inform local residents of their rights under the law. Councillor Augimeri is committed to City-wide initiatives, evidenced by her success in brokering agreements between the City of Toronto and the school board to maximize community access to space in schools and community centres. Her "After School" programs and innovative childcare projects are used as models for the rest of the City.\n\nMaria Augimeri is an Honours Graduate of English and Anthropology and a former instructor of Social Anthropology at York University. She is an award-winning author of three published works on the Italian-Canadian community. Ms. Augimeri's poetry has also been published in Canada. Some of her books may be found in Toronto public libraries and the libraries of York University.	4163924021	\N	http://www.mariaaugimeri.com	\N	\N	\N
8	2015-05-22 10:40:21-04	2015-05-22 10:40:21-04	councillor_mcmahon@toronto.ca	/images/mmcmahon.jpg	Mary-Margaret	McMahon	Councillor McMahon and her family have lived in both the Beach and Danforth areas of Ward 32 for 19 years and have worked actively to bring about change. The Councillor has organized and hosted community strategy sessions, seminars, and fairs; and worked with Toronto Council on environment, community and education issues. She has supported many local businesses, creating and implementing ideas that integrate businesses, schools and government bodies with the community.\n\nShe helped found the East Lynn Farmers Market on Danforth, and enhance it with summer movie nights and festivals. She has worked to help developers understand infrastructure challenges, flooding and the unique character of the Beach and Danforth neighbourhoods. A former senior manager and education leader, she is concerned with wasted budgets and opportunities; and is working at developing underutilized schools as community hubs for residents of all ages at all hours. She is calling for a complete audit of empty city real property and leased premises, better approaches for City contracts; and term limits to optimize the efforts of City Councillors.\n\nThe daughter of a popular Mayor and a community leader, Councillor McMahon has literally hundreds of initiatives on her full list of achievements; including heavy involvement with community planning and sustainability groups. She is not loyal to political parties or interest groups. She is instead loyal to citizens, good ideas and effective execution.	4163921376	\N	http://www.councillormcmahon.com	\N	\N	\N
9	2015-05-22 10:46:20-04	2015-05-22 10:46:20-04	councillor_bailao@toronto.ca	/images/abailao.jpg	Ana	Bailão	Ana Bailão is the City Councillor for Ward 18 and a woman proud to be rooted in the rich cultural diversity of the Davenport area. Her commitment to social equity and her strong work ethic are products of a humble beginning and the support that she received during her early days in Canada.\n\nGrowing up in Ward 18, Ana attended West Toronto Collegiate and studied Sociology at the University of Toronto. Ana's strong passion for community and city building projects continued after graduation, where she participated in initiatives like “Digin” and “GreenHere”, and co-founded the “Friends of Dovercourt Park." Ana also championed issues important to New Canadians, serving as President of the Federation of Portuguese Canadian Business and Professionals and President of the Working Women Community Centre, where she helped immigrant and refugee women and their families integrate into their new communities.\n\nPrior to serving as a City Councillor, Ana Bailão achieved success in the private sector, developing leadership and consensus building skills while holding senior roles in the banking and healthcare IT sector. Running on a platform of fair, accessible and community-based representation, Ana was first elected as City Councillor for Ward 18 in 2010. Ana became quickly recognized as a leader on Council. With her deep community connection and strong private sector experience, Ana was able to deliver results on complex issues such as affordable housing, employee protection and social procurement.\n\nWhen asked to Chair the Affordable Housing Committee in her first term, it was at a time when external housing funding was shrinking. Ana created new opportunities by reducing obstacles for private-sector builders and providing incentives to build more affordable housing. Ana went on to lead the charge against the mass sale of Toronto Community Housing Corporation (TCHC)’s single-family homes, championing a solution that maintained the portfolio and restored its financial viability.\n\nRe-elected in 2014, Ana was hand-picked by newly elected Mayor John Tory to lead Toronto's housing agenda as Council's Housing Advocate. In this role, Ana has been tasked with implementing and shaping Toronto's multi-faceted strategy to improve housing affordability and expand housing services.\n\nIn addition to Affordable Housing, Ana has also served as a strong advocate for the arts in Toronto as a board member of Artscape and the Toronto Arts Council. Locally, Ana has championed projects like the Toronto Media Arts Centre while securing new affordable live/work space for Toronto artists.\n\nAna remains a dynamic and energetic voice for women, low-income families and New Canadians and continues to live in Ward 18, the same community that welcomed her when she first arrived in Canada at the age of 15.	4163927012	\N	http://www.anabailao.com	\N	\N	\N
10	2015-05-22 10:48:04-04	2015-05-22 10:48:04-04	councillor_doucette@toronto.ca	/images/sdoucette.jpg	Sarah	Doucette	Sarah Doucette became Councillor for Ward 13 on December 1, 2010. This year Sarah will be celebrating her 20th year in Swansea where she raised her children with her husband Alan.  Since moving to the ward, Sarah has been a successful neighbourhood volunteer, engaging the community to build playgrounds, keep swimming pools open, and save the Swansea Memorial Library from closing, amongst other advocacy work.\n\nSince becoming Councillor, Sarah has continued to work hard for Ward 13.  She saved the High Park Zoo, the Lambton bus, and the Runnymede CI and Keele PS pools from closing.  She has also stopped cuts to our library hours and TTC services, while successfully expanding childcare services.  With our local residents' associations, Sarah has fought to protect our avenues from unreasonable development and is implementing the tools for planning and heritage studies.  Currently, Sarah is working to return skating to Grenadier pond, and improve safety regulations on our residential streets.\n\nAs City Councillor Sarah has listened to her residents and worked hard improving the services that are vital to making Ward 13 an amazing place to live work and play.	4163924072	\N	http://www.ward13.ca	\N	\N	\N
11	2015-05-22 10:51:48-04	2015-05-22 10:51:48-04	councillor_mihevc@toronto.ca	/images/j-mihevc.jpg	Joe	Mihevc	Joe Mihevc has served the midtown area as City Councillor for the former City of York and the new City of Toronto. His deep concern for social issues has led him to be an advocate for strong neighbourhoods, healthy communities, a clean environment and safe streets.\n\nJoe has a M.A. and Ph.D. in Theology and Social Ethics (theses on Holocaust Studies and Canadian Mennonites, respectively). He has served in a variety of capacities that have allowed him to demonstrate his concerns for democratic, accessible and responsible government.\n\nAs a City Councillor, Joe has helped transform his area with a variety of innovative projects. These include the building of the Artscape Wychwood Barns and Park, the Cedarvale Outdoor Ice Rink, the Oakwood Village Library and Arts Centre, the creation of Roseneath Park, the re-building of St. Clair Avenue West's light rail transit infrastructure and public realm, and securing a home for the heritage Tollkeeper's Cottage. Joe also oversaw the redevelopment of the Maria A. Schkuka library branch, which included the construction next door of more than 60 units of affordable housing. With the support of many community leaders, Joe has spearheaded the refurbishment of playground equipment in many local parks across his ward.\n\nJoe is a hands-on Councillor who believes that a healthy ward is active and engaged. To this end, he spearheads many community-building initiatives. Speaker series, information meetings, shop local campaigns, environmental festivals, ward-wide check-in meetings and family-friendly movie nights are among his priorities to promote civic engagement. He also facilitates and supports many initiatives and projects led by local organizations.\n\nJoe was elected Chair of the Board of Health in February 2013. As Vice Chair of the Board from 2010 to 2012, his accomplishments include championing the city's Student Nutrition Program. As Chair of the Board of Health from 2000 to 2003, Joe led many initiatives to help improve health and safety across the city. These efforts included the implementation of the Green-Yellow-Red restaurant disclosure system, the restaurant smoking by-law, the adoption of a pesticide by-law, the investment in control measures to prevent the spread of West Nile Virus, and the management of the SARS outbreak.\n\nAs Vice-Chair of the Toronto Transit Commission (TTC) from 2003 to 2010, Joe has led the way on key projects to improve public transit in Toronto. He has provided important leadership to the St. Clair transit improvement project, which included significant improvements to the public realm. Joe also led the charge at the TTC to replace the aging fleet of streetcars with new, modern Light Rail Vehicles.\n\nJoe is a past member of the city's Budget Committee and has chaired the Community Services Committee, the Roundtable on Access and Equity and Human Rights, the Disability Issues Committee and the Ethics Steering Committee. He is a recipient of a Bob Marley Award recognizing commitment to diversity, and the 2011 African Canadian Achievement Award for his long-time work with the Scotiabank Caribbean Carnival Toronto, and has received the keys to the City of Soyapango, El Salvador, for his work on public health capacity building initiatives in that city. He also has been involved with the City's interfaith community and Jewish-Christian Dialogue work.\n\nCurrently, Joe is Chair of the Toronto Board of Health, Vice-Chair of the Community Development and Recreation Committee, a member of the Affordable Housing Committee and the Toronto and East York Community Council, and the City Council Liaison to the Scotiabank Caribbean Carnival Toronto.	4163927460	\N	http://www.joemihevc.com	\N	\N	\N
21	2015-05-22 11:59:55-04	2015-05-22 11:59:55-04	councillor_nunziata@toronto.ca	/images/fnunziata.jpg	Frances	Nunziata	Frances Nunziata has been a resident of the former City of York since 1963. Her political career began in 1985, as the separate school representative for the Board of Education for the City of York. She went on to serve four terms as Councillor and one term as Mayor of the City of York, prior to amalgamation of the Municipality of Metropolitan Toronto. She is currently serving her fourth term of office in the amalgamated City of Toronto.  In past terms of office, Frances has been the Chair of the Civic Appointments Committee, the Community Safety Task Force and Etobicoke York Community Council. She has also served on the Licensing and Standards Committee, Planning and Growth Management Committee, Parks and Environment Committee, Budget Committee, Toronto Community Housing Board of Directors, and the Toronto Police Services Board. She currently serves on the Government Management Committee, Audit Committee, York Employees Pension and Benefits Committee (Chair), Etobicoke York Community Council, and is Council Speaker.  Locally, Frances serves on the Weston Village BIA, the Mount Dennis BIA, the Syme 55+ Centre Board of Directors, the Humber Community Seniors Services Board of Directors, and the George Bell Arena Board of Management.	4163924091	\N	http://francesnunziata.com	\N	\N	\N
14	2015-05-22 11:03:52-04	2015-05-22 11:03:52-04	councillor_filion@toronto.ca	/images/jfilion.jpg	John	Filion	Prior to being elected to the new City of Toronto Council, John Filion was councillor for Ward 11 in the City of North York from 1991 to 1997. He was first elected to political office in 1982 as a member of the North York Board of Education, on which he served for nine years, including four years (1987-1990) as chairman. Before his election to North York Council, Filion worked as a journalist and book editor. He was born in 1950 and has an Honours Bachelor of Arts degree from York University.\n\nDuring his 25 years in municipal politics Councillor Filion is known for involving the community in government decision making. Among his many accomplishments; as a School Board Trustee he established child care in schools; as a North York Councillor he added new parks, playgrounds and recreational facilities; as a Toronto Councillor and Chair of the Board of Health he introduced a restaurant rating system and a ban on smoking in restaurants.\n\nCouncillor Filion has held the following positions:\n\nToronto City Councillor\nNorth York Councillor\nChair, Liaison Committee of Boards of Health in the Toronto Area\nChair, Mayor's Advisory Committee on Substance Abuse Prevention\nChair, North York Board of Education\nChair, North York Board of Health\nChair, North York Environment Committee\nChair, North York Parks and Recreation\nChair and Member, Toronto Board of Health\nChair, Toronto Centre for the Performing Arts Advisory Committee\nMember, Community and Neighbourhood Services Committee\nMember, Economic Development Committee\nMember, Planning and Transportation Committee\nMember, Toronto Zoo Board of Directors\nCouncillor Filion believes that cities are collections of neighbourhoods. To maintain and build a strong city, council must focus on the needs of our communities and neighbourhoods. Residents should be involved in a real and meaningful way in all decisions which affect them. In determining all areas of policy for the new city, council should balance city-wide interests with the needs of individual communities.	4163920210	\N	http://www.johnfilion.ca	\N	\N	\N
12	2015-05-22 10:53:16-04	2015-05-22 10:55:57-04	councillor_berardinetti@toronto.ca	/images/mberardinetti.jpg	Michelle	Berardinetti	Michelle Berardinetti was elected City Councillor for Ward 35, Scarborough Southwest on October 25th, 2010.  She has over 15 years prior experience as a political advisor and consultant to corporate, non-profit and community organizations.\n\nMichelle’s experience includes working with former Deputy Prime Minister Herb Gray and other prominent Members of Parliament.  In 2005, Michelle moved on to become a government relations specialist working with organizations such as Toronto’s Bid for the World Expo 2015, Variety - The Children’s Charity, Providence Healthcare and Toronto Humane Society.\n\nAs Councillor, Michelle served as Chair of Scarborough Community Council, Chair of Parks and Environment Committee, Member of Executive Committee, Budget Committee, Public Works and Infrastructure Committee, and several agencies, boards and commissions.\n\nDuring this time, Michelle successfully led the charge for the Scarborough Subway, improved commute times for all road users, secured major funding for projects located in Ward 35, expanded library hours, opened a new fire station, obtained operating funding for the new Warden Hilltop Community Centre, and significantly improved the City’s response to basement flooding.  Michelle successfully fought to add Ward 35 to the major water infrastructure renewal program.\n\nMichelle has an honours degree in International Relations and has taken additional course related studies at University of Toronto. She is an avid runner and regularly participates in charity runs including the Toronto Scotiabank Marathon on October 19th, 2014.  Michelle is a long-term resident of Ward 35 where she lives with her husband Lorenzo and their 2 rescue cats.	4163920213	\N	http://www.councillorberardinetti.com	CouncillorMB	\N	\N
15	2015-05-22 11:28:17-04	2015-05-22 11:28:17-04	councillor_minnan-wong@toronto.ca	/images/d-minnanwong.jpg	Denzil	Minnan-Wong	Denzil Minnan-Wong is honoured to serve as Deputy Mayor for the City of Toronto and City Councillor for Ward 34, Don Valley East.\n\nDenzil is a leader on Toronto City Council and in his community. Along with his role as Deputy Mayor, Denzil is also the Chair of the Striking Committee, the Employee and Labour Relations Committee, and the Civic Appointments Committee.  He is the Vice-Chair of the Executive Committee and sits on the TTC Board, the Employee and Labour Relations Committee, the Debenture Committee, the Committee of Revision, and is part of the Nominating Panel for Facilities and Finance.\n\nDenzil also acts as the Mayor's designate on the Boards of Waterfront Toronto, BUILD Toronto, and Invest Toronto and sits on the Board of Toronto Hydro.\n\nIn past terms of office, he has been the Chair of the Public Works and Infrastructure Committee, Economic Development Committee, Parks and Recreation Committee and Culture Committee and has chaired the North York Community Council.  He has also played important roles on the Employee and Labour Relations Committee, Planning and Transportation Committee, Community Services Committee, Works and Emergency Services Committee, Audit Committee, Toronto and Regional Conservation Board, the TTC Board, Toronto Library Board, the Toronto Financial Service Advisory Committee and the SARS Recovery Task Force.\n\nIn his role as Chair of the Public Works and Infrastructure Committee, Denzil was instrumental in increasing investment in roads and bridges to record levels.  He also led the push to privatize garbage west of Yonge St, saving the City approximately $88 million over the life of the contract.  Under his watch, the City developed the Downtown Transportation Operations Study and Congestion Management Plan, and retimed hundreds of signal lights to allow traffic to flow more smoothly.  He also championed the development of a safe and connected downtown bike lane network and saved the BIXI bike share program at no cost to the taxpayer.\n\nAs a strong believer in the need for greater transparency and accountability to the taxpayer, Denzil championed the establishment of Canada's first municipal Auditor General.  In 2014, he hosted a Roundtable on Procurement which recommended the establishment of a permanent working group on public procurement in the City.  He was also in the forefront in initiating the first census of the homeless in our city. As the Chair of the Economic Development, Parks and Recreation and Culture Committee, he was able to deliver a balanced budget. As the Chair of the Council Staff Working Group for 311, Denzil saved the City millions of dollars. In the fight to keep taxes down, Denzil led the opposition to the Vehicle Registration Tax and the Land Transfer Tax in 2008.\n\nIn his capacity as Chair of the Taxi Reform Committee, Denzil was instrumental in drafting reforms designed to ensure a higher standard of service for Toronto's taxi industry to better serve the customer. This includes the establishment of a Passenger Bill of Rights and the introduction of the new Ambassador Class taxicab.\n\nDenzil has also been a strong advocate for cleaning up our neighbourhoods. He has successfully fought for more resources to clean up our streets and has championed initiatives to combat graffiti and bring about a tough new anti-postering by-law throughout the city.\n\nLocally, Denzil has worked as a volunteer for the North York General Hospital Foundation and the Toronto Police 33 Division Community Liaison Committee. He sponsors annual community clean-up days, has annual skating parties and created the Community Spirit Award. Denzil continues to work with schools and community groups in the ward to improve safety and traffic, especially in school zones. He also works with neighbourhoods to oppose development applications that are not in keeping with the community. Denzil continues to be a strong advocate for improving community infrastructure. In 2010, he was successful in securing millions of dollars from the federal government for roads, parks and community centres in the ward.	4163979256	\N	http://www.ward34.com	\N	\N	\N
16	2015-05-22 11:31:02-04	2015-05-22 11:31:02-04	Councillor_Burnside@toronto.ca	/images/j-burnside.jpg	John	Burnside	Jon Burnside was a Toronto police officer from 1991 – 2001 and then a successful business owner until his election to Toronto City Council in October 2014.\n\nBorn in 1966, Jon grew up in Leaside before securing an Honours B.A. in Political Science at the University of Western Ontario.\n\nHe has been involved in the community for over 25 years – from creating free house league hockey for children in Flemingdon Park to being a member of the Trillium Grant Review team.  As a police officer, Jon worked in his home community of Ward 26; an experience that gave him unique insight into the needs of the neighbourhood and inspired him to try to provide children and youth in his community with the same opportunities which he'd been so fortunate to have.\n\nAfter serving 10 years in the Toronto Police, Jon fulfilled his ambition of becoming a successful entrepreneur – launching and operating several businesses in the health food sector.\n\nJon is a dog lover and is passionate about animal rights issues. He has rescued eight dogs to date and currently shares his home with Nik Nak and May Day. 	4163920215	\N	\N	\N	\N	\N
17	2015-05-22 11:32:40-04	2015-05-22 11:32:40-04	councillor_fletcher@toronto.ca	/images/pfletcher.jpg	Paula	Fletcher	Paula Fletcher has served Ward 30 residents for several years, becoming involved as a leader in the East End Parent Network, then working as Public School Trustee. In 2003 Paula was elected to City Council for Ward 30 Toronto-Danforth, and has been advocating for the Ward for 10 years. Paula works with residents, business owners and community agencies to build vibrant, healthy neighbourhoods, and is a strong voice at City Hall defending the services residents expect from their City.\n\nPaula has served many capacities in her role as City Councillor. She is the Chair of the Toronto and East York Community Council which is responsible for local planning and neighbourhood issues; and a member of the Community Development and Recreation Committee.	4163924060	\N	http://councillorpaulafletcher.ca/	\N	\N	\N
18	2015-05-22 11:40:52-04	2015-05-22 11:40:52-04	councillor_moeser@toronto.ca	/images/rmoeser.jpg	Ron	Moeser	Ron brings eighteen years of experience to this New City Council, nine years as Councillor for Scarborough and nine years as Councillor for the City of Toronto.\n\nRon believes:\n\n"That the community's goals should be respected and considered first. It is important that the constituents be consulted on all changes that impact on the future of the residents. Ron's goal is to support and implement changes that enhance the quality of life in Ward 44."\n\nRon has been involved and he accomplished many important objectives during his tenure as Councillor for Ward 44.\n\nOrganized and fought for the preservation of the Rouge Valley.\nBrought together all the Community Associations in Scarborough (C.O.S.C.A.) to help create Canada's Largest Urban Park.\nSecured funding and approvals for the Port Union Waterfront and Village Common including the tunnel to the waterfront.\nGot funding for the Morningside Library on Lawrence Avenue at Heron Park.\nRon was instrumental in the rebuilding of Heron Park Community Centre and the restoration of the swimming pool and children's play park.\nSecured and maintained funding for the 43 Division Police Station.\nWas instrumental in securing the funds for the Bill Dempsey EcoPark located at the head waters of the Centennial Creek in Highland Creek.\nWorked with Darlene Cross to assure the Crossroads Skateboard Facility was built for the youth of our community.\nObtained funding for the purchase and restoration of the Morrish Store in Highland Creek.\nDuring his 15 year tenure not one creek system was buried in Ward 44.\nSecured funding to rebuild Lawrence Ave. from Beechgrove to Kingston Rd.\nWorked with GO Transit to add parking north of Village Common for waterfront and Go Parking.\nPast committees and agencies include:\n\nBudget Committee 1990-2003\nPast chair of the Scarborough Community Council\nToronto Regional Conservation Authority (T.R.C.A.) -Past Chair Finance Committee - (To assure funding for Waterfront Trail)\nPast Board Member of Toronto Hydro\nToronto Zoo Board\nC.N.E. Board of Managers\nCity of Toronto Seniors Committees\nBoard of Centenary Hospital for six years\nG.T.A. Committee - to look at future growth in GTA area\nPast Member of the Rouge Park Alliance\nRon his wife Heather and 3 daughters have lived in Ward 44 for the last 30 years and have enjoyed participating in the many activities of our community.	4163385306	\N	http://www.ronmoeser.ca	ron_moeser	\N	\N
20	2015-05-22 11:55:52-04	2015-05-22 11:55:52-04	councillor_ford@toronto.ca	/images/rford.jpg	Rob	Ford	\N	4163979255	\N	\N	\N	\N	\N
43	2015-05-22 13:46:34-04	2015-05-22 13:46:34-04	councillor_davis@toronto.ca	/images/j-davis.jpg	Janet	Davis	\N	4163924035	\N	http://www.councillordavis.com	\N	\N	\N
23	2015-05-22 12:03:08-04	2015-05-22 12:03:08-04	councillor_fragedakis@toronto.ca	/images/mfragedakis.jpg	Mary	Fragedakis	Mary Fragedakis was elected to Toronto City Council in 2010. As a life-long resident of Ward 29, Mary brings extensive business expertise and strong community-building experience to her role as Councillor.\n\nPrior to her election, Mary served as Vice President of a business-to-business conference company. In 2008, her company was awarded Best Overall Performance for Small Business in Toronto. The award also won Mary recognition for her green advocacy efforts in promoting conferences dedicated to eco-marketing and best practices. Mary is fiscally prudent, having completed the Canadian Securities Course and held several positions in the financial sector.\n\nMary's dedication to community services led her to co-found the Broadview Community Youth Group (BCYG) in 2007 to engage East York youth from all walks of life in activities to build self-confidence, self-worth and a strong sense of community. As Board Vice President, she has been instrumental in building bridges and partnerships with local charities, not-for profits, businesses and government agencies to expand the BCYG, which recently moved into larger quarters at the Danforth Baptist Church on the Danforth.\n\nMary has worked to break down barriers for people of all cultural and socio-economic backgrounds as an outreach community volunteer of the Royal Ontario Museum for 15 years. With her dedication to the arts, Mary participated in the first pilot project in Toronto to make many of Ontario's public museums and galleries more accessible to new Canadians.\n\nMary, who lives in Ward 29, holds an MA in Political Science from the University of Toronto (1996).	4163924032	\N	http://maryfragedakis.com	\N	\N	\N
24	2015-05-22 12:04:49-04	2015-05-22 12:07:07-04	councillor_palacio@toronto.ca	/images/cpalacio.jpg	Cesar	Palacio	Cesar Palacio was born in Loja, Ecuador and is Toronto's first Hispanic City Councillor. Fluent in English, Spanish, Portuguese and Italian, Cesar has lived, worked and raised his family in the Davenport-St. Clair-Dufferin neighbourhood for most of his life, one of Toronto's most ethnically diverse communities.\n\n\\Prior to being elected in 2003 and re-elected in 2006, Cesar served as Executive Assistant to former Councillor Betty Disero from 1985 - 2003, except for 8 months in 2000 when he was appointed as interim Councillor to replace former Councillor Dennis Fotinos.\n\nIn the community Cesar has served as Chair of the Police Community Partnership 12 Division, Chair of the Ward 17 Crime Task Force, Founding Member of St. Clair West Revitalization Committee, Member of the Hispanic Canadian Foundation and as an Honorary Member of the Casa das Beiras Cultural Community Centre. In the early 1990s, Cesar is proud to have organized Toronto's first ever "Community Clean-up Day" and "Community Compost Day", which are now Citywide annual events each year. In 2005 Cesar also received a Life Time Achievement Award for his outstanding contribution to multicultural communities by the prestigious "Premios Somos" organization.\n\nCesar knows that healthy communities and Cities are built street by street, block by block and neighbourhood by neighbourhood. He has always believed that a Councillor must represent the views and wishes of citizens at City Hall, and not simply push City Hall's agenda on the community. Cesar is working toward a safe, green, clean community, with genuine revitalization and fair property taxes that don't penalize Toronto's most vulnerable citizens. He is committed to being accessible, accountable and building on his reputation for getting things done.	4163927011	\N	http://www.cesarpalacio.com	\N	\N	\N
25	2015-05-22 13:12:20-04	2015-05-22 13:12:20-04	councillor_carroll@toronto.ca	/images/scarroll.jpg	Shelley	Carroll	Shelley Carroll is the City Councillor for Ward 33 - Don Valley East. First elected in 2003, she quickly established herself as one of Toronto City Council's brightest newcomers. Shelley is committed to creating a more inclusive and equitable city - one that is economically sustainable and environmentally friendly.\n\nIn her first term, Shelley worked as a member of the Budget Committee to make City Hall more efficient, finding over $200 million in savings while protecting our essential services. She served as Chair of the Works Committee, which deals with Toronto's most pressing issues like garbage, recycling, water, sewers and roads. In 2006, Shelley became Toronto's Budget Chief, managing the City's $9.2-billion budget, and achieved $576 million in ongoing operating efficiencies over four years.\n\nShelley has also proven herself as a strong advocate for our community. With the completion of the Sheppard subway, Ward 33 came under tremendous development pressure. In response, Shelley worked with her community to develop, understand and control development applications, fighting at the OMB, and negotiating record-breaking community benefits, including a new $20-million community centre in Parkway Forest.\n\nOn August 19, 2005 a terrible rainstorm flooded homes, parks, and streets in North York. Thousands of homes were damaged by floodwaters and sewage as the storm overwhelmed the sewer network. Her leadership as Chair of the Works Committee helped to establish the $4-million City Flood Grant Program and $50 million of Flood Mitigation Projects in Ward 33 to help increase the capacity of our sewer system.\n\nShelley Carroll has been a Don Valley East resident since 1967, where she lives with her family. Shelley has been involved in her community for many years before becoming an official public servant, working with parents and teachers of the North York Parent Assembly and fighting the Harris government for a better education system. In 2000, Shelley was elected School Board Trustee for the TDSB.	4163924038	\N	http://www.shelleycarroll.ca	\N	\N	\N
26	2015-05-22 13:14:13-04	2015-05-22 13:14:13-04	councillor_grimes@toronto.ca	/images/mgrimes.jpg	Mark	Grimes	Mark Grimes was elected City Councillor for Ward 6 on November 10, 2003. Mark is proud to say that he is a man rooted in the Etobicoke-Lakeshore community. His commitment to family and community is a product of a life nurtured in the heart of the Lakeshore. Mark knows the ground he walks in South Etobicoke.\n\nBefore entering politics, Mark was the President/Owner of a business in South Etobicoke where he and his brothers operate a thriving logistics business. From this experience he became keenly aware of the pressing economic issues for local businesses. Prior to starting his own business, Mark worked as a Professional Trader and Market Maker for a major financial firm for 13 years on the Toronto Stock Exchange.\n\nAs City Councillor, Mark has initiated and been involved with a number of successful projects, including: Mimico Linear Park, the MasterCard Centre for Hockey Excellence, business revitalization on the Lakeshore, defeating 700 Evans at City Council, funding/construction of a new skateboard park for local youth, Lakeshore Mardi Gras and the Argos Stop the Violence Campaign.\n\nIn continuing his commitment to community safety, Mark worked hard to have a Temporary Storefront Police Station installed on Lake Shore Boulevard, he worked with Toronto Police to finalize the Police College plans, he initiated Community Safety Seminars and he stays in regular contact with local police from 22 Division.\n\nMark works to protect the interests of local residents by holding public consultation meetings to get community input on new projects. This process ensures that residents have a voice when development decisions are made.\n\nMark lives in the community with his wife and five children.	4163979273	\N	http://www.markgrimes.ca	\N	\N	\N
27	2015-05-22 13:15:58-04	2015-05-22 13:15:58-04	councillor_pasternak@toronto.ca	/images/jpasternak.jpg	James	Pasternak	James Pasternak was elected to City Council in 2010. He comes to City Council as the representative for Ward 10 after serving on the Toronto District School Board (TDSB) since 2006. Councillor Pasternak has deep roots in Ward 10 having lived here with his family for 22 years.\n\nFormer TDSB Director Gerry Connelly described James Pasternak's role at Canada's largest school board as "transformative." His work contributed to TDSB pools being kept open, more robust after-school programs, and building corporate partnerships. His advocacy resulted in a new football team at a local high school and new musical instruments and partnerships for schools in priority neighbourhoods. While accompanying a school visit to the Ontario Legislature representatives from all three political parties rose to praise school initiatives that James Pasternak supported and advanced.\n\nAt the TDSB, James Chaired the Audit and Special Education Advisory committees and played a leadership role in advancing alternative schools. As a trustee, James Pasternak voted in favour of balanced budgets while being a tireless advocate for children and adults with special needs. He also fought for creating the position of Parent Advocate, Special Education for parents with special needs children. This pioneering initiative received widespread support across the province as parents seek supports and counsel in identifying the best programs for their sons and daughters.\n\nJames Pasternak was elected by his fellow trustees to serve with former Toronto Mayor David Crombie as a representative on the board of the Toronto Lands Corporation (TLC). As a director of the TLC, James was part of a team that helped bring fiscal responsibility to the Toronto District School Board. James Pasternak worked with a group of agencies to bring a soon-to-be-built two-story 15,000 square foot $9 million hub and community centre to the campus of Northview Heights Secondary School at Bathurst Street and Finch Avenue.\n\nCouncillor Pasternak has earned degrees from the London School of Economics and Political Science, the University of Western Ontario and York University. He is a graduate of Toronto's Leaside High School.	4163921371	\N	http://www.jamespasternak.ca	JamesPasternak	CouncillorJamesPasternak	\N
28	2015-05-22 13:17:43-04	2015-05-22 13:17:43-04	councillor_cho@toronto.ca	/images/r-cho.jpg	Raymond	Cho	Before being elected, Dr. Raymond Cho worked as a Social Worker for the Catholic Children's Aid Society, the Toronto Board of Education, and the Scarborough Board of Education.\n\nRaymond was first elected to Metropolitan Toronto Council for Scarborough-Malvern in 1991, and was re-elected to Metro in 1994. In 1997, Raymond was elected Toronto City Councillor for the new City of Toronto representing Scarborough-Malvern. In 2000, he was again re-elected and represents the new ward of Scarborough Rouge-River.\n\nThroughout his political career, Councillor Cho has been a member of various boards and standing committees. He was Chairman of the Toronto Zoo for two successive terms, and is on the Board of Management for the Zoo. His interests lie in improving opportunities for the youth, safety in the community, a clean community, human rights, environmental concerns, and economic development for the city.\n\nHe was a strong promoter and advocate for saving the Glen Eagles site and worked closely with all three levels of government in saving this valuable 10-acres site at the entrance to the Rouge Park from future development. In addition, he worked with the Provincial Government and helped to save the Anndale Site of 10 acres from future residential development.\n\nSince his first election, he has mobilized hundreds of volunteers on an annual basis, and together, they have planted over 30,000 trees in the Rouge Valley over the years. He has organized and delivered over 100,000 pounds of food for the Daily Bread Food Bank.\n\nCouncillor Cho lives in Scarborough with his wife, Sue, and they have three adult sons, two of whom are medical doctors, and the youngest son is a secondary school teacher. Councillor Cho holds both his Masters' Degree in Social Work and Doctorate Degree in Education from the University of Toronto.	4163924076	\N	http://www.raymondcho.com	\N	\N	\N
29	2015-05-22 13:18:29-04	2015-05-22 13:18:29-04	councillor_holyday@toronto.ca	/images/s-holyday.jpg	Stephen	Holyday	\N	4163924002	\N	\N	\N	\N	\N
30	2015-05-22 13:19:52-04	2015-05-22 13:19:52-04	councillor_perks@toronto.ca	/images/gperks.jpg	Gord	Perks	Gord Perks was elected to represent Parkdale-High Park in 2006. Gord has an impressive record on environmental initiatives that began in 1987, with such environmental organizations as Pollution Probe, Greenpeace Canada, the Better Transportation Coalition, and the Toronto Environmental Alliance. Gord's emphasis has been on waste reduction and public transit, he is the principal author of the Canadian Green Consumer Guide, one of Canada's best selling non-fiction books. Gord Perks was an Environment columnist for Eye Weekly Magazine and an Adjunct Professor with the University of Toronto's Environmental Studies Department.\n\nIn his work as a City Councillor, Gord's priority is investing in public space: protecting library services, community centre programs, and providing more green space within the ward. Additionally, Gord's vision for the city extends beyond ward boundaries. Gord led the fight to get the TTC to adopt the Ridership Growth Strategy, making Dufferin, King and Queen priority streets for improved transit servicing. Similarly, he was fundamental to the expansion of the City of Toronto's blue and grey box program. He was successful in his fight to introduce a pesticide by-law that banned the use of cosmetic use of dangerous chemicals on all outdoor properties.\n\nGord currently sits on the Parks and Environment Committee, Subcommittee on Climate Change Mitigation and Adaptation, Tribunal Nominating Panel, Toronto Atmospheric Fund Board of Directors, Golden Horseshoe Food and Farming Alliance and Greater Toronto Area Agricultural Action committee.\n\nGord Perks studied at the University of Toronto.	4163927919	\N	http://www.gordperks.ca	gordperks	\N	\N
31	2015-05-22 13:21:29-04	2015-05-22 13:21:50-04	councillor_colle@toronto.ca	/images/J-colle.jpg	Josh	Colle	Josh was elected in October 2010 to represent the area of Ward 15 Eglinton-Lawrence. In addition, he was elected to serve as Chair of the TTC in 2015.\n\nBorn and raised in Toronto, Josh brings a wealth of private sector and community experience to City Hall. He has worked in Toronto's financial services sector, the transportation industry, and served as Vice President of an energy and infrastructure firm.\n\nHe has previously served residents of Eglinton-Lawrence as a school board trustee from 2000 to 2003, is a former Director of 5 Points Community Action residents group, served as Director for an environmental organization, and is President of the St. Michael's College alumni association.\n\nAs Ward 15 Councillor at City Hall, Josh sits on a number of committees, boards, and agencies including the North York Community Council, the Community Development and Recreation Committee, Striking Committee, Toronto Arts Council, UrbanArts Community Arts Council, Toronto Music Advisory Council, North Toronto Arena Board and serves as the TTC Chair. In addition, Josh maintains an active presence on the Boards of the York-Eglinton, Fairbank Village, Dufferin-Wingold and Oakwood Village Business Improvement Areas.\n\nJosh obtained an Honours BA in Political Science from McGill University and graduated from St. Michael's College High School at Bathurst & St. Clair. Josh has lived in the Oakwood and Vaughan area for over 30 years, where he continues to reside with his wife and three children.	4163924027	\N	http://www.joshcolle.ca	joshcolle	josh.colle	\N
32	2015-05-22 13:24:53-04	2015-05-22 13:24:53-04	councillor_karygiannis@toronto.ca	/images/j-karygiannis.jpg	Jim	Karygiannis	The Honourable Jim Karygiannis elected to Toronto City Council on October 27, 2014.\n\nMr. Karygiannis is the former Member of Parliament for Scarborough-Agincourt.  He has been an effective voice for the people of Scarborough-Agincourt, with vast political experience and a proven record of public service.\n\nHe was the Liberal Party Critic for Veterans Affairs and the Liberal Party Critic for Multiculturalism, with responsibility for stakeholder and community outreach.  He served a Parliamentary Secretary to the Minister of Human Resources and Skills Development.  Prior to this appointment, he served as the Parliamentary Secretary to the Minister of Transport, with special emphasis on Transport and the Environment.\n\nDuring his tenure, Mr. Karygiannis forged good working relationships with his colleagues at the municipal, provincial and federal levels of government.  Together, they worked on issues of critical importance to the community including: establishing, with law enforcement agencies and various government departments, a Task Force to combat marijuana grow houses.  He also worked with his colleagues to help strengthen community safety and helped to ensure the safety of residents of rooming houses in Scarborough-Agincourt.\n\nWhen the SARS epidemic struck Toronto and Canada, the Scarborough Grace Hospital was the epicenter of the outbreak. Working with his colleagues in Ottawa, Jim was able to quickly address the issue of salaries, through Employment Insurance, for people who were affected and working on the front lines.\n\nAs the Parliamentary Secretary to the Minister of Transport, Jim worked with City of Toronto officials, the people of Ward 39, Scarborough-Agincourt and GO Transit, to ensure the sound of loud train whistles on GO Trains traveling south, along the eastern border of Ward 39, Scarborough-Agincourt, did not disturb area residents.\n\nJim Karygiannis is a resident of Ward 39, Scarborough-Agincourt, one of the most ethnically diverse neighborhoods in the City of Toronto.  He has worked with, and will continue to work with, the Canadian Diasporas of many multicultural communities with respect to the protection of human rights; economic sustainability for nation-building; and, social justice issues.  He has also worked with Canadian Diasporas and the Government of Canada to help secure humanitarian aid to assist the victims of natural and man-made disasters.\n\nFor his work with a number of communities, Jim has received recognition, including being awarded:\n\n'The Mkhitar Gosh Medal’ from the Government of The Republic of Armenia for his substantial input in international recognition of the Armenian Genocide;\nThe ‘25 Year of Karabakh Movement’ Gold Medal by the Government of The Nagorno-Karabakh Republic as the first Canadian to visit the Republic in 2012 to observe the Presidential Elections; and,\nThe decoration of the ‘Officer’s Gold Cross of the Order of Phoenix’ by the Hellenic Republic in recognition of his many public service contributions.\n\nJim was born in Athens, Greece in 1955.  He immigrated to Canada with his family in 1966.  Jim graduated in 1978 from the University of Toronto with a Bachelor of Applied Science in Industrial Engineering. He also holds a Fellowship of Business Administration from the Canadian School of Management. Jim worked in the family business until 1988 when he was elected as a Member of Parliament.\n\nJim Karygiannis is married and is the father of five daughters and two sons-in-law.	4163921374	\N	http://www.karygiannis.net	\N	\N	\N
33	2015-05-22 13:25:59-04	2015-05-22 13:25:59-04	councillor_perruzza@toronto.ca	/images/aperruzza.jpg	Anthony	Perruzza	Councillor Anthony Perruzza was re-elected to Toronto City Council in 2014, where he has served since 2006 and is a member of Toronto's North York Community Council, Public Works and Infrastructure Committee, is an Executive Member of the Toronto & Region Conservation Authority (TRCA), and Dufferin- Finch BIA. An experienced representative, Councillor Perruzza was a Trustee in the Metro Toronto Separate School Board (1985-88), a North York Councillor (1988-90), and a Member of Provincial Parliament (1990-95). As the former Chair of the Spadina Subway Extension Committee, Councillor Perruzza played an important role in the TTC subway extension to York University and beyond and is very proud to see it underway.\n\nThroughout his political career, Councillor Perruzza has delivered many beneficial projects to the community he has represented. A strong advocate for community programming and education, he secured funding for the expansion of the York Woods Library Theatre, the construction of the Oakdale Community Centre, and supported agencies such as the Elspeth Heyworth Centre for Women which provide help and support to the most vulnerable in our community. Anthony also helped fund the reconstruction of St. Basil-the-Great, College School, and helped bring Seneca College to York University. As a Member of Provincial Parliament, Anthony successfully led the fight in extending the subway to Downsview Station.\n\nAn outspoken advocate on the need for greater public transit, Councillor Perruzza strongly opposed the scrapping of the Transit City Plan, and has been fighting to bring it back in order to improve gridlock across the city.\n\nCouncillor Perruzza immigrated to Canada at age 9, and has since lived in York West since. His mother did factory shift work and his father was a carpenter. Educated at local schools, Anthony attended St. Jude's Elementary School, St. Basil's High School, and is a graduate of York University.	4163385335	\N	\N	\N	\N	\N
34	2015-05-22 13:27:55-04	2015-05-22 13:27:55-04	councillor_crawford@toronto.ca	/images/g-crawford.jpg	Gary	Crawford	Public service has always been an important goal for Gary Crawford. He moved to Ward 36 to raise his family because of its great schools, unique neighbourhoods, good friends and strong sense of community.\n\nGary is currently serving his second term as a Toronto City Councillor and has been appointed by Council as Budget Chair and as a member of the Executive Committee.\n\nPrevious to his role on Council, Gary served a seven year term as a TDSB Trustee. His experience included appointment as Co-chair of the Board, Chair of Facilities Management and Chair of Negotiations. During his 11 years of public service, Gary has gained a sound knowledge base, a breadth of experience and a keen overview of public sector organizations.\n\nAs City Councillor, his experience holding a variety of positions gave him a clear understanding of fiscal governance. Gary served on numerous committees including Budget, Planning and Growth, Economic Development and the Executive Committee. He also served on City Boards and Agencies including East Metro Youth Centre, Sony Centre for the Performing Arts (as Interim Chair), Harbourfront Centre, St. Lawrence Centre for the Performing Arts, the Toronto Centre for the Arts and the Toronto Arts Council. He has chaired the Mayor's Task Force on the Arts, the Theatres Working Group and Co-chaired the Film Board.\n\nGary is a passionate advocate for arts and culture and was instrumental in historic funding increases for the arts. Before becoming a Councillor he was a professional artist and a part time musician.\n\nGary has the ability and skills to work with people from a broad array of political backgrounds and to build the necessary consensus required for effective Council and Committee decisions. His mature approach and capacity to build common goals has earned him the respect of his peers at Council and the many Boards and Committees he participates on.\n\nGary has a business background holding both senior management and consultant positions. He received a Bachelor of Fine Arts Honours degree from York University.\n\nGary is passionate about Ward 36 and the City of Toronto. With his leadership, Scarborough Southwest has a visible and important place at City Hall.	4163924052	\N	http://www.councillorcrawford.ca	CllrCrawford	pages/Councillor-Gary-Crawford/226933110655693	\N
35	2015-05-22 13:32:55-04	2015-05-22 13:32:55-04	councillor_kelly@toronto.ca	/images/nkelly.jpg	Norm	Kelly	Councillor Norm Kelly is a trained Historian. He studied Canadian political history at the University of Western Ontario (undergraduate) and Carleton and Queen's universities (post-graduate).\n\nAmong his most important accomplishments was his two year research for the best-selling books in the field of Canadian History: The National Dream and The Last Spike.\n\nThe National Dream won Canada's most prestigious literary prize, The Governor General's Award, and was transferred to television by the CBC in a very popular, award-winning documentary series of the same name.\n\nIn researching these two volumes, Mr. Kelly was the first historian to detail the contribution of Chinese workers toward the construction of the Canadian Pacific Railway (the CPR) in the province of British Columbia. The importance of Chinese labour to the building of the railroad that functioned as Canada's economic and political spine for the first 100 years of Confederation was recently recognized by the erection of a statue in their honour in Toronto by the Chinese community of that city.\n\nShortly after completing his research on the CPR in 1973, Mr. Kelly was appointed Chairman of the History Department at Canada's internationally renowned private college, Upper Canada College (UCC).\n\nDuring his stay at UCC, Mr. Kelly also served three successive terms in political office as an Alderman on the Municipal Council of the then Borough of Scarborough (1974 - 1980).\n\n In 1980, Mr. Kelly resigned from Upper Canada College when he won a seat as a Liberal in the Federal House of Commons under the leadership of the Right Honourable Pierre Elliot Trudeau.\n\nAs a Member of Parliament, Mr. Kelly was twice appointed Parliamentary Secretary: first, to the Ministry of Supply and Services and then to the President of the Treasury Board. In this latter capacity, Mr. Kelly was given the responsibility of guiding the Government's reorganization of its Crown Corporations, Bill C-124, through the House of Commons and its Committees.\n\nMr. Kelly also served on a number of Standing Committees of the House of Commons, among them: (1) Energy, Mines and Resources (through which he met the leading businessmen in Canada in this field); (2) Industry Trade and Commerce; and, (3) Public Accounts, which monitors, with the Assistance of the Auditor General, the expenditures of the Government of Canada.\n\nOf particular note in Mr. Kelly's parliamentary career was his appointment in 1983 to the Special Committee on Visible Minorities in Canadian Society. This Committee was charged with the responsibility of doing the initial research on the status of visible minorities in Canadian society. Mr. Kelly played a leading role in that Committee, whose deliberations took it across Canada and into all of its communities.\n\nMr. Kelly also played a prominent role in preparing the committee's report, Equality Now, containing eighty ground-breaking recommendations aimed at protecting visible minority cultures in Canada while integrating their members into the Canadian mainstream.\n\nAfter the defeat of the Liberal Government in 1984, Mr. Kelly opted to go into business in Toronto, where he operated a successful real estate brokerage until 1994, when he returned to public office at the regional level as a Metro Councillor in the Government of Canada's largest city, Metropolitan Toronto. In 1997, Mr. Kelly was returned as a Councillor in the amalgamated City and has been returned to office in every election since then.	4163924047	\N	http://normkelly.com	norm	\N	\N
36	2015-05-22 13:34:34-04	2015-05-22 13:34:34-04	councillor_robinson@toronto.ca	/images/jrobinson.jpg	Jaye	Robinson	Jaye Robinson is the City Councillor for Ward 25 – Don Valley West and the Chair of the Public Works & Infrastructure Committee.\n\nJaye also sits on the Executive Committee, Striking Committee, North York Community Council, the Art Gallery of Ontario Board, the Canadian Film Centre Board, the Committee of Adjustment Nominating Panel and the Civic Theatres Nominating Panel.\n\nRe-elected in 2014 with one of the city’s highest pluralities, Jaye brings a 20-year track record as a community leader and senior manager in economic development to City Hall.\n\nIn her first term, Jaye played a key role in four fiscally responsible budgets and helped put Toronto back on a solid financial foundation. Accountability and integrity were central to her approach, and she spoke out repeatedly about the need for professionalism and transparency in city government. She also oversaw the continued growth and success of our renowned library system as Vice Chair of the Toronto Public Library Board.\n\nWard 25's priorities were front and centre and Jaye delivered results. She passed more than 100 successful motions improving traffic and pedestrian safety, creating new avenues for engagement on planning issues and keeping our neighbourhoods strong and vibrant.\n\nJaye also opened the Don Mills Trail and a brand new park at Yonge and York Mills, brought capital improvements to more than a dozen Ward 25 parks and rebuilt or resurfaced more than 45 Ward 25 roads.\n\nBefore running for office, Jaye was a senior manager in the city’s Economic Development Division. With an entrepreneurial approach, she successfully merged arts and community building initiatives with economic development strategies, creating a vibrant roster of annual events with significant economic impacts, including Nuit Blanche, Summerlicious and Winterlicious.\n\nGoing into her second term, Jaye remains focused on innovative, fiscally sound solutions to Toronto’s goals and priorities – moving our city forward through consensus and clear, evidence-based decision making.\n\nJaye lives in Ward 25 – Don Valley West with her husband, three boys and dog, Scout.	4163956408	\N	http://jayerobinson.ca	jayerobinson	robinsonward25	\N
37	2015-05-22 13:35:47-04	2015-05-22 13:35:47-04	Councillor_Cressy@toronto.ca	/images/j-cressy.jpg	Joe	Cressy	Joe Cressy was born and raised in downtown Toronto, in a family whose defining values are community building and public service – values that have driven him his whole life.\n\nHe has worked on poverty issues while living in South Africa and Ghana, led literacy programs in fly-in Aboriginal reserves in Northern Ontario, and managed environmental campaigns to protect Canada's freshwater.  Before being elected, he served as a Director of Campaigns and Outreach at the Stephen Lewis Foundation, which supports community-based HIV/AIDS organizations in sub-Saharan Africa.\n\nJoe understands that strong infrastructure and social services are vital to the quality of life in a big city, and his passion for social justice translates to his work at City Hall. In his various appointments, including to the Board of Health, Toronto Community Housing Corporation Board of Directors, Sub-committee on Climate Change and Adaptation, and in his role as Toronto's Youth Equity Advocate, he is committed to making life better in Toronto.\n\nAs Councillor for Ward 20, Joe works tirelessly to build better neighbourhoods, expand and improve public green spaces, and make life in downtown Toronto more equitable.	4163924044	\N	\N	\N	\N	\N
38	2015-05-22 13:38:07-04	2015-05-22 13:38:07-04	councillor_layton@toronto.ca	/images/mlayton.jpg	Mike	Layton	Mike is a resident of Ward 19 and has lived in Trinity-Spadina for over 25 years.\n\nBefore being elected on October 25, 2010 to serve as one of Toronto's youngest Councillors, Mike worked for political change from the other side of the table, as an environmental leader and community organizer. As Deputy Outreach Director for Environmental Defence, one of Canada's leading environmental groups, he championed a variety of successful initiatives including the Green Energy and Green Economy Act, green building standards, water conservation and source water protection.\n\nMike holds a LEEDs Accreditation (Leadership in Energy and Environmental Design), in addition to earning a Masters in Environmental Studies, with a focus on citizen participation in urban planning. These qualifications followed his BA in Political Science and Environmental Management.\n\nMike's volunteer accomplishments include serving as Vice President of the Board of Directors of Freshwater Future and as the Lake Ontario Board Member for Great Lakes United. He served on the Environment Canada Great Lakes Canadian Advisory Panel for the negotiations to amend the Great Lakes Water Quality Agreement and on the Great Lakes Commission Wind Collaborative Steering Committee, advising this international organization on wind power development in the Great Lakes.\n\nMike also worked for six years as a manager for a popular downtown restaurant where he learned first-hand the challenges of small business ownership and the role the City of Toronto plays in fostering entrepreneurship.\n\nSon of the late NDP Leader and former City Councillor Jack Layton, Mike has been active since an early age on a variety of issues and causes including fundraising for the White Ribbon Campaign to end male violence against women, and working with special needs children.	4163924009	\N	http://mikelayton.to	m_layton	layton.mike	\N
39	2015-05-22 13:39:21-04	2015-05-22 13:39:21-04	councillor_shiner@toronto.ca	/images/dshiner.jpg	David	Shiner	Councillor David Shiner is the proud representative of Ward 24 - Willowdale. From 1991-1997 he served on the North York City Council, and since 1998 has continued to represent the constituents of Ward 24 on both Toronto City Council and North York Community Council.\n\nHaving lived in Willowdale for many years, raising a family there and with lots of friends in the area, David is aware of the issues affecting the community. He is very active in the ward and at City Hall, ensuring that he and his team are available to assist residents.\n\nCurrently, David serves as Chair of the Planning and Growth Management Committee, as a member of the Executive Committee and on the Board of Directors for BUILD Toronto. He is also a member of the Striking Committee.\n\nAs a long-time board member of Eva's Initiatives, which operates two youth shelters in North York (Eva's Place and Eva's Satellite) and one in downtown Toronto (Eva's Phoenix), David is committed to representing all members of the community including our youth and seniors.\n\nIn the course of his political career, Councillor Shiner has served on numerous Boards, Agencies and Commissions. As a former Chair of the City of Toronto's Budget Committee, he was instrumental in implementing changes to the budget process, establishing greater transparency and accountability, which continues today.\n\nHe has also served as a Commissioner on the Toronto Transit Committee, Chair of the Government Management Committee, Chair of the TTC Budget Committee and Vice Chair of the Executive Committee. He continues to be a staunch advocate of dedicated annual funding for the expansion of Toronto's transit network.\n\nDavid works closely with his fellow Council members, his colleagues in the provincial and federal governments and elected representatives throughout the GTA. He engages regularly with the people of Ward 24 – Willowdale including residents associations and condo boards, and is greatly honoured by their ongoing support and the privilege of representing them on City Council.	4163956413	\N	\N	\N	\N	\N
40	2015-05-22 13:40:47-04	2015-05-22 13:40:47-04	councillor_crisanti@toronto.ca	/images/vcrisanti.jpg	Vincent	Crisanti	Vincent Crisanti was elected as City Councillor for Ward 1 - Etobicoke North in October 2010. A councillor in the former City of Etobicoke, Vincent brings a background in public service, community involvement and success in the private sector. Vincent is committed to providing exceptional service for constituents in Ward 1 and to working with the Mayor, Council and the community to make Etobicoke North and the entire City of Toronto a better place to live and work.\n\nAs a councillor in the former City of Etobicoke, Vincent was instrumental in bringing the DARE anti-drug program into local schools. Vincent recognizes that safe and healthy communities are created through partnerships and relationships between individuals, community groups, charities and the City of Toronto.\n\nThrough his professional activities, Vincent has developed a keen sense of how to make business work. Prior to his election, he managed a GTA-based outdoor signage business and a real estate company. Vincent is engaged with the Albion Islington Square Business Improvement Area and with local businesses to bring good jobs to the community.\n\nVincent is a 32-year resident of North Etobicoke. He is married with two children and has two grandchildren.	4163920205	\N	http://vincentcrisanti.ca	\N	\N	\N
41	2015-05-22 13:43:47-04	2015-05-22 13:43:47-04	councillor_lee@toronto.ca	/images/clee.jpg	Chin	Lee	Chin Lee was elected to Toronto Council in 2006.\n\nPrior to entering politics, Chin was a consultant and manager in the private sector Information Technology industry. With over 30 years of business experience, Chin knows the importance of providing excellent and cost effective service. He looks forward to using his management expertise to make Toronto a model of fiscal accountability and to improving our environment.\n\nAs a 17 year resident of Ward 41, Chin has been an advocate for building strong communities. He's served as the President of the Goldhawk Community Association and co-founded the Scarborough Homeowner Alliance for Fair Taxation (SHAFT). Through SHAFT, Chin was involved in challenging the province's unfair system of property assessment and helped reduce property taxes for over 90% of Ward 41 homeowners.\n\nIn 1993 Chin was part of a grassroots community organization, Scarborough Needs Accountable Politicians (SNAP), which was formed to hold local politicians more accountable to the electorate. Chin's other volunteer accomplishments include:\n\nMember, of the Chinese Community Liaison Committee - 42nd Division Toronto Police\nMember, Milliken Park Community Centre Advisory Committee\nMember, Prince of Peace School Parent Council\nInitiated Neighbourhood Watch in Goldhawk Community\n\nChin, his wife Rita and two children live in the Agincourt Community of Ward 41. He is a graduate of York University and Ryerson.	4163921375	\N	https://chinlee41.wordpress.com	CncllrChinLee	pages/Chin-Lee/1427255057510026	\N
42	2015-05-22 13:45:23-04	2015-05-22 13:45:23-04	councillor_thompson@toronto.ca	/images/mthompson.jpg	Michael	Thompson	Michael Thompson is Chair of Toronto's Economic Development and Culture Committee, Chair of Invest Toronto, a member of the Executive Committee and the Employee and Labour Relations Committee,  a board member of Build Toronto and the City Councillor representing Ward 37, Scarborough Centre.\n\nNow in his fourth term as City Councillor, Michael has earned a reputation as one of Toronto's hardest working political leaders.\n\nMichael's commitment to economic development is longstanding. In his first term in office, he spearheaded the creation of the Wexford Heights Business Improvement Area and established a Job Fair that annually brings thousands of job seekers together with dozens of employers. He maintains a widespread network of business relationships that has helped to enhance business retention, promote growth and increase private sector employment. His active engagement with business has helped speed the launch of new business ventures, resolved business/residential conflicts and gained business participation in a wide range of community-building initiatives. In 2010, thanks to his persistent salesmanship, the National Society of Black Engineers (NSBE), the world's largest student run professional association, held its annual conference in Toronto, bringing more than 10,000 young engineers (and millions of dollars) to the city.\n\nA believer in the critical value of culture as a builder of strong communities, Michael co-founded the Taste of Lawrence Avenue East Festival, which brings together tens of thousands of people each year to experience local performing arts and cuisine. He also created the "Scarborough Rocks" community image building campaign, which emphasizes Scarborough's unique cultural blend.\n\nMichael has been equally active on behalf of Toronto's youth. In 2006, He brought together businesses, schools, 41 Division Police and the Future Aces program to create Ontario's first Positive Ticketing program for youth. The program rewards good behaviour with valuable tickets and coupons. He also successfully spearheaded the creation of new recreation facilities in his Ward (including a state-of-the-art skateboard park), and introduced floor tennis to schools in key neighbourhoods city-wide. In conjunction with Project Engagement, an initiative he co-founded in 2006, he continues to promote the development of young leaders from a wide range of cultural and economic backgrounds.\n\nMichael received his public school education in Scarborough, and his BA from Concordia University in Montreal. Prior to entering politics, Mr. Thompson earned his business credentials as an entrepreneur in the business and financial services sector. He is the recipient of the African Achievement Award for Excellence in Politics, the York University International Award, the Jain Society of Toronto Community Award, and the Bob Marley Award. He continues to work with a number of charitable organizations including participation in the LIUNA Local 506 scholarship fund. He is a hockey and basketball dad who enjoys a range of activities that includes hockey, soccer, basketball and all things sports.	4163979274	\N	\N	\N	\N	\N
45	2015-05-22 13:51:42-04	2015-05-22 13:51:42-04	councillor_wongtam@toronto.ca	/images/k-wongtam.jpg	Kristyn	Wong-Tam	Councillor Kristyn Wong-Tam has an extensive career investing in the City of Toronto through both the public and private sectors. Her contributions have led to the development and support of numerous social planning programs, business ventures, art endeavours and successful community initiatives.\n\nPrior to being elected to City Council in 2010, Councillor Wong-Tam was an accomplished real estate professional and supporter of the arts. She has curated art installations for Scotiabank's Nuit Blanche and is the principal of a Toronto-based contemporary fine art gallery. As a founding member of the Church-Wellesley Village Business Improvement Association, her business advocacy and entrepreneurship focusing on urban economic development, earned her a seat on Mayor David Miller's Economic Competitiveness Advisory Committee which produced the Agenda for Prosperity in 2008.\n\nCouncillor Wong-Tam has a distinguished track record of human rights advocacy and was a co-founder of Asian Canadians For Equal Marriage, and the past president of the Chinese Canadian National Council Toronto Chapter which helped successfully lobbied the federal government for the head tax apology and redress.\n\nAs a tireless community advocate, Councillor Wong-Tam has championed for the expansion of green public spaces, farmers' markets, community gardens including improvements to parks and ravines. She has led efforts to defend the rights of tenants to obtain affordable and decent standards of rental housing and helped create a neighbourhood association to preserve and protect heritage buildings and historical landscapes in the ward. Councillor Wong-Tam continues to be a champion for sustainable living and environmental health and plays a vital role in ensuring the vibrancy of our city and its economic and social development.	4163927903	\N	http://ward27news.ca	kristynwongtam	kristynwongtamward27	\N
44	2015-05-22 13:48:27-04	2015-05-22 13:52:12-04	councillor_mammoliti@toronto.ca	/images/gmammoliti.jpg	Giorgio	Mammoliti	Councillor Giorgio Mammoliti is the City Councillor for Ward 7 - York West and is currently the Chair of the Community Development & Recreation committee and a member of the Mayor's Executive Committee.\n\nWith a political career spanning over 20 years, Councillor Mammoliti has represented Ward 7 - York West for the past 16, in which he has served as Chair of the Affordable Housing Committee, Chair of the Toronto Zoo Board, Co-Chair of Canada Municipalities Housing Action Network - Federation of Canadian Municipalities (FCM), and Chair of the City's International Committee. Prior to his election as Ward 7 Councillor, Giorgio represented York West as MPP from 1990 to 1995. During his term as MPP, he served as Parliamentary Assistant to the Solicitor General and Minister of Correctional Services, Parliamentary Assistant to the Minister of Correctional Services and Parliamentary Assistant to the Minister of Health.\n\nAs former Chair of the Affordable Housing Committee, his commitment to safe and affordable housing was illustrated by his work on the Housing Opportunities Toronto (HOT) Action Plan 2010-2020, which was authored by Giorgio and adopted by Council on August 5, 2009.	4163956401	\N	http://giorgiomammoliti.ca	\N	\N	\N
46	2015-05-22 13:53:04-04	2015-05-22 13:53:04-04	councillor_debaeremaeker@toronto.ca	/images/gdebaeremaeker.jpg	Glenn	De Baeremaeker	\N	4163920204	\N	\N	\N	\N	\N
47	2015-05-22 13:54:38-04	2015-05-22 13:54:38-04	councillor_matlow@toronto.ca	/images/jmatlow.jpg	Josh	Matlow	Josh Matlow is a resident of Ward 22, St. Paul's and was elected to Toronto City Council on October 25th, 2010.\n\nCouncillor Matlow was a radio broadcaster and co-director of Earthroots, a Toronto-based environmental non-governmental organization where he championed efforts to achieve protection legislation for the Oak Ridges Moraine -- the Oak Ridges Moraine Conservation Act.\n\nAs St. Paul's School Trustee (2003-2010), he initiated a "Green Grid" project for renewable energy generators (such as solar panels) on school rooftops, homework policy reform, campaigned to keep Toronto's school pools open, advocated for governance and accountability reform, demanded genuine consultation processes for his community, initiated a "Financial Literacy" curriculum to teach students about matters including credit cards, budgets and the stock market, worked with his community to rebuild North Toronto Collegiate Institute and championed initiatives to curb youth violence.\n\nAs a community advocate, Councillor Matlow has fought for the protection of local green space, tenants who need a strong voice, transit riders, support for local business areas, farmers markets and arts and cultural events, preservation of Toronto's Mount Pleasant Cemetery, revitalization of neighbourhoods and parks, abolishment of the Ontario Municipal Board from Toronto, a strategic plan for Toronto's seniors to create an age-friendly city, campaigned for public transit and for solutions to gridlock and has advocated for governance reform at every level of government. Councillor Matlow holds regular town hall meetings with the residents of Ward 22. Please check his community website for meeting notices.\n\nJosh Matlow has been a Toronto Star's "Newsmakers of the Year" and "People to Watch", The Village Post and North Toronto Post Magazines: Toronto's Best Public Official, Town Crier's "Pillar of the Community" and Now Magazine's "Top Activists of the Year". He has written articles, columns and opinion pieces for the Toronto Sun, Toronto Star, Globe and Mail and Town Crier Newspapers, Post City Magazines, and was a weekly co-host on Toronto talk-radio stations, AM 640 and CIUT. Josh wrote a weekly column, City Hall Diary, every Monday about City Hall in the Toronto Star and hosted the Newstalk 1010 radio show, The City with Josh Matlow.	4163927906	\N	http://joshmatlow.ca	JoshMatlow	joshmatlow	\N
\.


--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 174
-- Name: councillor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toronto_api_user
--

SELECT pg_catalog.setval('councillor_id_seq', 47, true);


--
-- TOC entry 2250 (class 0 OID 16399)
-- Dependencies: 171
-- Data for Name: sails_migrations; Type: TABLE DATA; Schema: public; Owner: toronto_api_user
--

COPY sails_migrations (id, name, batch, migration_time) FROM stdin;
1	20150514135014_init.js	1	2015-05-14 13:55:51.658-04
2	20150514153621_init.js	2	2015-05-14 16:00:42.141-04
4	20150521124130_UpdateCouncillor.js	3	2015-05-21 12:45:13.838-04
5	20150521131830_CreateAgenda.js	4	2015-05-21 13:24:27.278-04
\.


--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 170
-- Name: sails_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toronto_api_user
--

SELECT pg_catalog.setval('sails_migrations_id_seq', 5, true);


--
-- TOC entry 2252 (class 0 OID 16407)
-- Dependencies: 173
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: toronto_api_user
--

COPY "user" (id, "createdAt", "updatedAt", email, password, "avatarUrl", "firstName", "lastName") FROM stdin;
\.


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 172
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toronto_api_user
--

SELECT pg_catalog.setval('user_id_seq', 2, true);


--
-- TOC entry 2256 (class 0 OID 16457)
-- Dependencies: 177
-- Data for Name: ward; Type: TABLE DATA; Schema: public; Owner: toronto_api_user
--

COPY ward (id, "createdAt", "updatedAt", number, region, geo, councillor) FROM stdin;
2	2015-05-14 16:12:44-04	2015-05-14 16:12:44-04	43	Scarborough East	\N	2
\.


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 176
-- Name: ward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: toronto_api_user
--

SELECT pg_catalog.setval('ward_id_seq', 2, true);


--
-- TOC entry 2139 (class 2606 OID 24694)
-- Name: agenda_pkey; Type: CONSTRAINT; Schema: public; Owner: toronto_api_user; Tablespace: 
--

ALTER TABLE ONLY agenda
    ADD CONSTRAINT agenda_pkey PRIMARY KEY (id);


--
-- TOC entry 2131 (class 2606 OID 16431)
-- Name: councillor_email_unique; Type: CONSTRAINT; Schema: public; Owner: toronto_api_user; Tablespace: 
--

ALTER TABLE ONLY councillor
    ADD CONSTRAINT councillor_email_unique UNIQUE (email);


--
-- TOC entry 2133 (class 2606 OID 16429)
-- Name: councillor_pkey; Type: CONSTRAINT; Schema: public; Owner: toronto_api_user; Tablespace: 
--

ALTER TABLE ONLY councillor
    ADD CONSTRAINT councillor_pkey PRIMARY KEY (id);


--
-- TOC entry 2123 (class 2606 OID 16404)
-- Name: sails_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: toronto_api_user; Tablespace: 
--

ALTER TABLE ONLY sails_migrations
    ADD CONSTRAINT sails_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2126 (class 2606 OID 16417)
-- Name: user_email_unique; Type: CONSTRAINT; Schema: public; Owner: toronto_api_user; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_unique UNIQUE (email);


--
-- TOC entry 2128 (class 2606 OID 16415)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: toronto_api_user; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2137 (class 2606 OID 16465)
-- Name: ward_pkey; Type: CONSTRAINT; Schema: public; Owner: toronto_api_user; Tablespace: 
--

ALTER TABLE ONLY ward
    ADD CONSTRAINT ward_pkey PRIMARY KEY (id);


--
-- TOC entry 2129 (class 1259 OID 16432)
-- Name: councillor_email_index; Type: INDEX; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE INDEX councillor_email_index ON councillor USING btree (email);


--
-- TOC entry 2134 (class 1259 OID 16477)
-- Name: councillor_ward_index; Type: INDEX; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE INDEX councillor_ward_index ON councillor USING btree (ward);


--
-- TOC entry 2124 (class 1259 OID 16418)
-- Name: user_email_index; Type: INDEX; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE INDEX user_email_index ON "user" USING btree (email);


--
-- TOC entry 2135 (class 1259 OID 16471)
-- Name: ward_councillor_index; Type: INDEX; Schema: public; Owner: toronto_api_user; Tablespace: 
--

CREATE INDEX ward_councillor_index ON ward USING btree (councillor);


--
-- TOC entry 2140 (class 2606 OID 16472)
-- Name: councillor_ward_foreign; Type: FK CONSTRAINT; Schema: public; Owner: toronto_api_user
--

ALTER TABLE ONLY councillor
    ADD CONSTRAINT councillor_ward_foreign FOREIGN KEY (ward) REFERENCES ward(id);


--
-- TOC entry 2141 (class 2606 OID 16466)
-- Name: ward_councillor_foreign; Type: FK CONSTRAINT; Schema: public; Owner: toronto_api_user
--

ALTER TABLE ONLY ward
    ADD CONSTRAINT ward_councillor_foreign FOREIGN KEY (councillor) REFERENCES councillor(id);


--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: toronto_api_user
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM toronto_api_user;
GRANT ALL ON SCHEMA public TO toronto_api_user;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-05-22 13:57:37 EDT

--
-- PostgreSQL database dump complete
--

