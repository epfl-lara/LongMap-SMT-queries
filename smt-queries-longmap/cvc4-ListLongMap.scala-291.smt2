; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4852 () Bool)

(assert start!4852)

(declare-fun b_free!1337 () Bool)

(declare-fun b_next!1337 () Bool)

(assert (=> start!4852 (= b_free!1337 (not b_next!1337))))

(declare-fun tp!5495 () Bool)

(declare-fun b_and!2219 () Bool)

(assert (=> start!4852 (= tp!5495 b_and!2219)))

(declare-fun res!22427 () Bool)

(declare-fun e!23416 () Bool)

(assert (=> start!4852 (=> (not res!22427) (not e!23416))))

(declare-datatypes ((B!744 0))(
  ( (B!745 (val!872 Int)) )
))
(declare-datatypes ((tuple2!1404 0))(
  ( (tuple2!1405 (_1!713 (_ BitVec 64)) (_2!713 B!744)) )
))
(declare-datatypes ((List!976 0))(
  ( (Nil!973) (Cons!972 (h!1540 tuple2!1404) (t!3737 List!976)) )
))
(declare-datatypes ((ListLongMap!981 0))(
  ( (ListLongMap!982 (toList!506 List!976)) )
))
(declare-fun lm!252 () ListLongMap!981)

(declare-fun p!304 () Int)

(declare-fun forall!172 (List!976 Int) Bool)

(assert (=> start!4852 (= res!22427 (forall!172 (toList!506 lm!252) p!304))))

(assert (=> start!4852 e!23416))

(declare-fun e!23415 () Bool)

(declare-fun inv!1632 (ListLongMap!981) Bool)

(assert (=> start!4852 (and (inv!1632 lm!252) e!23415)))

(assert (=> start!4852 tp!5495))

(assert (=> start!4852 true))

(declare-fun b!37036 () Bool)

(declare-fun res!22424 () Bool)

(assert (=> b!37036 (=> (not res!22424) (not e!23416))))

(declare-fun isEmpty!201 (ListLongMap!981) Bool)

(assert (=> b!37036 (= res!22424 (not (isEmpty!201 lm!252)))))

(declare-fun b!37037 () Bool)

(declare-fun e!23414 () Bool)

(declare-fun lt!13668 () ListLongMap!981)

(declare-fun size!1303 (List!976) Int)

(assert (=> b!37037 (= e!23414 (>= (size!1303 (toList!506 lt!13668)) (size!1303 (toList!506 lm!252))))))

(declare-fun b!37038 () Bool)

(declare-fun res!22426 () Bool)

(assert (=> b!37038 (=> (not res!22426) (not e!23414))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!457 (ListLongMap!981 (_ BitVec 64)) Bool)

(assert (=> b!37038 (= res!22426 (contains!457 lt!13668 k!388))))

(declare-fun b!37039 () Bool)

(assert (=> b!37039 (= e!23416 e!23414)))

(declare-fun res!22428 () Bool)

(assert (=> b!37039 (=> (not res!22428) (not e!23414))))

(assert (=> b!37039 (= res!22428 (forall!172 (toList!506 lt!13668) p!304))))

(declare-fun tail!100 (ListLongMap!981) ListLongMap!981)

(assert (=> b!37039 (= lt!13668 (tail!100 lm!252))))

(declare-fun b!37040 () Bool)

(declare-fun res!22423 () Bool)

(assert (=> b!37040 (=> (not res!22423) (not e!23416))))

(declare-fun head!844 (List!976) tuple2!1404)

(assert (=> b!37040 (= res!22423 (not (= (_1!713 (head!844 (toList!506 lm!252))) k!388)))))

(declare-fun b!37041 () Bool)

(declare-fun res!22425 () Bool)

(assert (=> b!37041 (=> (not res!22425) (not e!23416))))

(assert (=> b!37041 (= res!22425 (contains!457 lm!252 k!388))))

(declare-fun b!37042 () Bool)

(declare-fun tp!5494 () Bool)

(assert (=> b!37042 (= e!23415 tp!5494)))

(assert (= (and start!4852 res!22427) b!37041))

(assert (= (and b!37041 res!22425) b!37036))

(assert (= (and b!37036 res!22424) b!37040))

(assert (= (and b!37040 res!22423) b!37039))

(assert (= (and b!37039 res!22428) b!37038))

(assert (= (and b!37038 res!22426) b!37037))

(assert (= start!4852 b!37042))

(declare-fun m!29863 () Bool)

(assert (=> start!4852 m!29863))

(declare-fun m!29865 () Bool)

(assert (=> start!4852 m!29865))

(declare-fun m!29867 () Bool)

(assert (=> b!37038 m!29867))

(declare-fun m!29869 () Bool)

(assert (=> b!37036 m!29869))

(declare-fun m!29871 () Bool)

(assert (=> b!37039 m!29871))

(declare-fun m!29873 () Bool)

(assert (=> b!37039 m!29873))

(declare-fun m!29875 () Bool)

(assert (=> b!37040 m!29875))

(declare-fun m!29877 () Bool)

(assert (=> b!37037 m!29877))

(declare-fun m!29879 () Bool)

(assert (=> b!37037 m!29879))

(declare-fun m!29881 () Bool)

(assert (=> b!37041 m!29881))

(push 1)

(assert (not b_next!1337))

(assert b_and!2219)

(assert (not b!37038))

(assert (not b!37039))

(assert (not b!37036))

(assert (not b!37037))

(assert (not start!4852))

(assert (not b!37040))

(assert (not b!37042))

(assert (not b!37041))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2219)

(assert (not b_next!1337))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5683 () Bool)

(declare-fun lt!13671 () Int)

(assert (=> d!5683 (>= lt!13671 0)))

(declare-fun e!23419 () Int)

(assert (=> d!5683 (= lt!13671 e!23419)))

(declare-fun c!4241 () Bool)

(assert (=> d!5683 (= c!4241 (is-Nil!973 (toList!506 lt!13668)))))

(assert (=> d!5683 (= (size!1303 (toList!506 lt!13668)) lt!13671)))

(declare-fun b!37047 () Bool)

(assert (=> b!37047 (= e!23419 0)))

(declare-fun b!37048 () Bool)

(assert (=> b!37048 (= e!23419 (+ 1 (size!1303 (t!3737 (toList!506 lt!13668)))))))

(assert (= (and d!5683 c!4241) b!37047))

(assert (= (and d!5683 (not c!4241)) b!37048))

(declare-fun m!29883 () Bool)

(assert (=> b!37048 m!29883))

(assert (=> b!37037 d!5683))

(declare-fun d!5691 () Bool)

(declare-fun lt!13672 () Int)

(assert (=> d!5691 (>= lt!13672 0)))

(declare-fun e!23420 () Int)

(assert (=> d!5691 (= lt!13672 e!23420)))

(declare-fun c!4242 () Bool)

(assert (=> d!5691 (= c!4242 (is-Nil!973 (toList!506 lm!252)))))

(assert (=> d!5691 (= (size!1303 (toList!506 lm!252)) lt!13672)))

(declare-fun b!37049 () Bool)

(assert (=> b!37049 (= e!23420 0)))

(declare-fun b!37050 () Bool)

(assert (=> b!37050 (= e!23420 (+ 1 (size!1303 (t!3737 (toList!506 lm!252)))))))

(assert (= (and d!5691 c!4242) b!37049))

(assert (= (and d!5691 (not c!4242)) b!37050))

(declare-fun m!29885 () Bool)

(assert (=> b!37050 m!29885))

(assert (=> b!37037 d!5691))

(declare-fun d!5693 () Bool)

(declare-fun e!23438 () Bool)

(assert (=> d!5693 e!23438))

(declare-fun res!22434 () Bool)

(assert (=> d!5693 (=> res!22434 e!23438)))

(declare-fun lt!13708 () Bool)

(assert (=> d!5693 (= res!22434 (not lt!13708))))

(declare-fun lt!13705 () Bool)

(assert (=> d!5693 (= lt!13708 lt!13705)))

(declare-datatypes ((Unit!839 0))(
  ( (Unit!840) )
))
(declare-fun lt!13706 () Unit!839)

(declare-fun e!23437 () Unit!839)

(assert (=> d!5693 (= lt!13706 e!23437)))

(declare-fun c!4254 () Bool)

(assert (=> d!5693 (= c!4254 lt!13705)))

(declare-fun containsKey!49 (List!976 (_ BitVec 64)) Bool)

(assert (=> d!5693 (= lt!13705 (containsKey!49 (toList!506 lt!13668) k!388))))

(assert (=> d!5693 (= (contains!457 lt!13668 k!388) lt!13708)))

(declare-fun b!37078 () Bool)

(declare-fun lt!13707 () Unit!839)

(assert (=> b!37078 (= e!23437 lt!13707)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!46 (List!976 (_ BitVec 64)) Unit!839)

(assert (=> b!37078 (= lt!13707 (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!506 lt!13668) k!388))))

(declare-datatypes ((Option!91 0))(
  ( (Some!90 (v!1959 B!744)) (None!89) )
))
(declare-fun isDefined!47 (Option!91) Bool)

(declare-fun getValueByKey!86 (List!976 (_ BitVec 64)) Option!91)

(assert (=> b!37078 (isDefined!47 (getValueByKey!86 (toList!506 lt!13668) k!388))))

(declare-fun b!37079 () Bool)

(declare-fun Unit!844 () Unit!839)

(assert (=> b!37079 (= e!23437 Unit!844)))

(declare-fun b!37080 () Bool)

(assert (=> b!37080 (= e!23438 (isDefined!47 (getValueByKey!86 (toList!506 lt!13668) k!388)))))

(assert (= (and d!5693 c!4254) b!37078))

(assert (= (and d!5693 (not c!4254)) b!37079))

(assert (= (and d!5693 (not res!22434)) b!37080))

(declare-fun m!29901 () Bool)

(assert (=> d!5693 m!29901))

(declare-fun m!29903 () Bool)

(assert (=> b!37078 m!29903))

(declare-fun m!29905 () Bool)

(assert (=> b!37078 m!29905))

(assert (=> b!37078 m!29905))

(declare-fun m!29907 () Bool)

(assert (=> b!37078 m!29907))

(assert (=> b!37080 m!29905))

(assert (=> b!37080 m!29905))

(assert (=> b!37080 m!29907))

(assert (=> b!37038 d!5693))

(declare-fun d!5703 () Bool)

(declare-fun res!22448 () Bool)

(declare-fun e!23453 () Bool)

(assert (=> d!5703 (=> res!22448 e!23453)))

(assert (=> d!5703 (= res!22448 (is-Nil!973 (toList!506 lm!252)))))

(assert (=> d!5703 (= (forall!172 (toList!506 lm!252) p!304) e!23453)))

(declare-fun b!37096 () Bool)

(declare-fun e!23454 () Bool)

(assert (=> b!37096 (= e!23453 e!23454)))

(declare-fun res!22449 () Bool)

(assert (=> b!37096 (=> (not res!22449) (not e!23454))))

(declare-fun dynLambda!174 (Int tuple2!1404) Bool)

(assert (=> b!37096 (= res!22449 (dynLambda!174 p!304 (h!1540 (toList!506 lm!252))))))

(declare-fun b!37097 () Bool)

(assert (=> b!37097 (= e!23454 (forall!172 (t!3737 (toList!506 lm!252)) p!304))))

(assert (= (and d!5703 (not res!22448)) b!37096))

(assert (= (and b!37096 res!22449) b!37097))

(declare-fun b_lambda!1835 () Bool)

(assert (=> (not b_lambda!1835) (not b!37096)))

(declare-fun t!3741 () Bool)

(declare-fun tb!751 () Bool)

(assert (=> (and start!4852 (= p!304 p!304) t!3741) tb!751))

(declare-fun result!1281 () Bool)

(assert (=> tb!751 (= result!1281 true)))

(assert (=> b!37096 t!3741))

(declare-fun b_and!2223 () Bool)

(assert (= b_and!2219 (and (=> t!3741 result!1281) b_and!2223)))

(declare-fun m!29921 () Bool)

(assert (=> b!37096 m!29921))

(declare-fun m!29923 () Bool)

(assert (=> b!37097 m!29923))

(assert (=> start!4852 d!5703))

(declare-fun d!5709 () Bool)

(declare-fun isStrictlySorted!184 (List!976) Bool)

(assert (=> d!5709 (= (inv!1632 lm!252) (isStrictlySorted!184 (toList!506 lm!252)))))

(declare-fun bs!1429 () Bool)

(assert (= bs!1429 d!5709))

(declare-fun m!29927 () Bool)

(assert (=> bs!1429 m!29927))

(assert (=> start!4852 d!5709))

(declare-fun d!5713 () Bool)

(declare-fun res!22454 () Bool)

(declare-fun e!23459 () Bool)

(assert (=> d!5713 (=> res!22454 e!23459)))

(assert (=> d!5713 (= res!22454 (is-Nil!973 (toList!506 lt!13668)))))

(assert (=> d!5713 (= (forall!172 (toList!506 lt!13668) p!304) e!23459)))

(declare-fun b!37102 () Bool)

(declare-fun e!23460 () Bool)

(assert (=> b!37102 (= e!23459 e!23460)))

(declare-fun res!22455 () Bool)

(assert (=> b!37102 (=> (not res!22455) (not e!23460))))

(assert (=> b!37102 (= res!22455 (dynLambda!174 p!304 (h!1540 (toList!506 lt!13668))))))

(declare-fun b!37103 () Bool)

(assert (=> b!37103 (= e!23460 (forall!172 (t!3737 (toList!506 lt!13668)) p!304))))

(assert (= (and d!5713 (not res!22454)) b!37102))

(assert (= (and b!37102 res!22455) b!37103))

(declare-fun b_lambda!1837 () Bool)

(assert (=> (not b_lambda!1837) (not b!37102)))

(declare-fun t!3743 () Bool)

(declare-fun tb!753 () Bool)

(assert (=> (and start!4852 (= p!304 p!304) t!3743) tb!753))

(declare-fun result!1283 () Bool)

(assert (=> tb!753 (= result!1283 true)))

(assert (=> b!37102 t!3743))

(declare-fun b_and!2225 () Bool)

(assert (= b_and!2223 (and (=> t!3743 result!1283) b_and!2225)))

(declare-fun m!29929 () Bool)

(assert (=> b!37102 m!29929))

(declare-fun m!29931 () Bool)

(assert (=> b!37103 m!29931))

(assert (=> b!37039 d!5713))

(declare-fun d!5717 () Bool)

(declare-fun tail!101 (List!976) List!976)

(assert (=> d!5717 (= (tail!100 lm!252) (ListLongMap!982 (tail!101 (toList!506 lm!252))))))

(declare-fun bs!1431 () Bool)

(assert (= bs!1431 d!5717))

(declare-fun m!29939 () Bool)

(assert (=> bs!1431 m!29939))

(assert (=> b!37039 d!5717))

(declare-fun d!5723 () Bool)

(assert (=> d!5723 (= (head!844 (toList!506 lm!252)) (h!1540 (toList!506 lm!252)))))

(assert (=> b!37040 d!5723))

(declare-fun d!5727 () Bool)

(declare-fun e!23469 () Bool)

(assert (=> d!5727 e!23469))

(declare-fun res!22459 () Bool)

(assert (=> d!5727 (=> res!22459 e!23469)))

(declare-fun lt!13723 () Bool)

(assert (=> d!5727 (= res!22459 (not lt!13723))))

(declare-fun lt!13720 () Bool)

(assert (=> d!5727 (= lt!13723 lt!13720)))

(declare-fun lt!13721 () Unit!839)

(declare-fun e!23468 () Unit!839)

(assert (=> d!5727 (= lt!13721 e!23468)))

(declare-fun c!4260 () Bool)

(assert (=> d!5727 (= c!4260 lt!13720)))

(assert (=> d!5727 (= lt!13720 (containsKey!49 (toList!506 lm!252) k!388))))

(assert (=> d!5727 (= (contains!457 lm!252 k!388) lt!13723)))

(declare-fun b!37115 () Bool)

(declare-fun lt!13722 () Unit!839)

(assert (=> b!37115 (= e!23468 lt!13722)))

(assert (=> b!37115 (= lt!13722 (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!506 lm!252) k!388))))

(assert (=> b!37115 (isDefined!47 (getValueByKey!86 (toList!506 lm!252) k!388))))

(declare-fun b!37116 () Bool)

(declare-fun Unit!847 () Unit!839)

(assert (=> b!37116 (= e!23468 Unit!847)))

(declare-fun b!37117 () Bool)

(assert (=> b!37117 (= e!23469 (isDefined!47 (getValueByKey!86 (toList!506 lm!252) k!388)))))

(assert (= (and d!5727 c!4260) b!37115))

(assert (= (and d!5727 (not c!4260)) b!37116))

(assert (= (and d!5727 (not res!22459)) b!37117))

(declare-fun m!29951 () Bool)

(assert (=> d!5727 m!29951))

(declare-fun m!29953 () Bool)

(assert (=> b!37115 m!29953))

(declare-fun m!29957 () Bool)

(assert (=> b!37115 m!29957))

(assert (=> b!37115 m!29957))

(declare-fun m!29959 () Bool)

(assert (=> b!37115 m!29959))

(assert (=> b!37117 m!29957))

(assert (=> b!37117 m!29957))

(assert (=> b!37117 m!29959))

(assert (=> b!37041 d!5727))

(declare-fun d!5733 () Bool)

(declare-fun isEmpty!204 (List!976) Bool)

(assert (=> d!5733 (= (isEmpty!201 lm!252) (isEmpty!204 (toList!506 lm!252)))))

(declare-fun bs!1433 () Bool)

(assert (= bs!1433 d!5733))

(declare-fun m!29975 () Bool)

(assert (=> bs!1433 m!29975))

(assert (=> b!37036 d!5733))

(declare-fun b!37131 () Bool)

(declare-fun e!23479 () Bool)

(declare-fun tp_is_empty!1663 () Bool)

(declare-fun tp!5498 () Bool)

(assert (=> b!37131 (= e!23479 (and tp_is_empty!1663 tp!5498))))

(assert (=> b!37042 (= tp!5494 e!23479)))

(assert (= (and b!37042 (is-Cons!972 (toList!506 lm!252))) b!37131))

(declare-fun b_lambda!1845 () Bool)

(assert (= b_lambda!1837 (or (and start!4852 b_free!1337) b_lambda!1845)))

(declare-fun b_lambda!1847 () Bool)

(assert (= b_lambda!1835 (or (and start!4852 b_free!1337) b_lambda!1847)))

(push 1)

(assert (not b!37097))

(assert (not b!37050))

(assert (not b!37078))

(assert (not b_lambda!1847))

(assert (not b!37048))

(assert (not b_next!1337))

(assert (not b_lambda!1845))

(assert (not d!5693))

(assert (not d!5733))

(assert (not b!37103))

(assert (not b!37131))

(assert b_and!2225)

(assert (not b!37117))

(assert (not b!37115))

(assert tp_is_empty!1663)

(assert (not b!37080))

(assert (not d!5709))

(assert (not d!5727))

(assert (not d!5717))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2225)

(assert (not b_next!1337))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5775 () Bool)

(assert (=> d!5775 (= (tail!101 (toList!506 lm!252)) (t!3737 (toList!506 lm!252)))))

(assert (=> d!5717 d!5775))

(declare-fun d!5777 () Bool)

(assert (=> d!5777 (isDefined!47 (getValueByKey!86 (toList!506 lm!252) k!388))))

(declare-fun lt!13738 () Unit!839)

(declare-fun choose!229 (List!976 (_ BitVec 64)) Unit!839)

(assert (=> d!5777 (= lt!13738 (choose!229 (toList!506 lm!252) k!388))))

(declare-fun e!23527 () Bool)

(assert (=> d!5777 e!23527))

(declare-fun res!22488 () Bool)

(assert (=> d!5777 (=> (not res!22488) (not e!23527))))

(assert (=> d!5777 (= res!22488 (isStrictlySorted!184 (toList!506 lm!252)))))

(assert (=> d!5777 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!506 lm!252) k!388) lt!13738)))

(declare-fun b!37201 () Bool)

(assert (=> b!37201 (= e!23527 (containsKey!49 (toList!506 lm!252) k!388))))

(assert (= (and d!5777 res!22488) b!37201))

(assert (=> d!5777 m!29957))

(assert (=> d!5777 m!29957))

(assert (=> d!5777 m!29959))

(declare-fun m!30025 () Bool)

(assert (=> d!5777 m!30025))

(assert (=> d!5777 m!29927))

(assert (=> b!37201 m!29951))

(assert (=> b!37115 d!5777))

(declare-fun d!5789 () Bool)

(declare-fun isEmpty!207 (Option!91) Bool)

(assert (=> d!5789 (= (isDefined!47 (getValueByKey!86 (toList!506 lm!252) k!388)) (not (isEmpty!207 (getValueByKey!86 (toList!506 lm!252) k!388))))))

(declare-fun bs!1439 () Bool)

(assert (= bs!1439 d!5789))

(assert (=> bs!1439 m!29957))

(declare-fun m!30027 () Bool)

(assert (=> bs!1439 m!30027))

(assert (=> b!37115 d!5789))

(declare-fun b!37230 () Bool)

(declare-fun e!23549 () Option!91)

(assert (=> b!37230 (= e!23549 (getValueByKey!86 (t!3737 (toList!506 lm!252)) k!388))))

(declare-fun b!37228 () Bool)

(declare-fun e!23548 () Option!91)

(assert (=> b!37228 (= e!23548 (Some!90 (_2!713 (h!1540 (toList!506 lm!252)))))))

(declare-fun b!37229 () Bool)

(assert (=> b!37229 (= e!23548 e!23549)))

(declare-fun c!4288 () Bool)

(assert (=> b!37229 (= c!4288 (and (is-Cons!972 (toList!506 lm!252)) (not (= (_1!713 (h!1540 (toList!506 lm!252))) k!388))))))

(declare-fun b!37231 () Bool)

(assert (=> b!37231 (= e!23549 None!89)))

(declare-fun d!5791 () Bool)

(declare-fun c!4287 () Bool)

(assert (=> d!5791 (= c!4287 (and (is-Cons!972 (toList!506 lm!252)) (= (_1!713 (h!1540 (toList!506 lm!252))) k!388)))))

(assert (=> d!5791 (= (getValueByKey!86 (toList!506 lm!252) k!388) e!23548)))

(assert (= (and d!5791 c!4287) b!37228))

(assert (= (and d!5791 (not c!4287)) b!37229))

(assert (= (and b!37229 c!4288) b!37230))

(assert (= (and b!37229 (not c!4288)) b!37231))

(declare-fun m!30047 () Bool)

(assert (=> b!37230 m!30047))

(assert (=> b!37115 d!5791))

(declare-fun d!5807 () Bool)

(declare-fun res!22503 () Bool)

(declare-fun e!23551 () Bool)

(assert (=> d!5807 (=> res!22503 e!23551)))

(assert (=> d!5807 (= res!22503 (is-Nil!973 (t!3737 (toList!506 lm!252))))))

(assert (=> d!5807 (= (forall!172 (t!3737 (toList!506 lm!252)) p!304) e!23551)))

(declare-fun b!37233 () Bool)

(declare-fun e!23552 () Bool)

(assert (=> b!37233 (= e!23551 e!23552)))

(declare-fun res!22504 () Bool)

(assert (=> b!37233 (=> (not res!22504) (not e!23552))))

(assert (=> b!37233 (= res!22504 (dynLambda!174 p!304 (h!1540 (t!3737 (toList!506 lm!252)))))))

(declare-fun b!37234 () Bool)

(assert (=> b!37234 (= e!23552 (forall!172 (t!3737 (t!3737 (toList!506 lm!252))) p!304))))

(assert (= (and d!5807 (not res!22503)) b!37233))

(assert (= (and b!37233 res!22504) b!37234))

(declare-fun b_lambda!1867 () Bool)

(assert (=> (not b_lambda!1867) (not b!37233)))

(declare-fun t!3759 () Bool)

(declare-fun tb!769 () Bool)

(assert (=> (and start!4852 (= p!304 p!304) t!3759) tb!769))

(declare-fun result!1305 () Bool)

(assert (=> tb!769 (= result!1305 true)))

(assert (=> b!37233 t!3759))

(declare-fun b_and!2241 () Bool)

(assert (= b_and!2225 (and (=> t!3759 result!1305) b_and!2241)))

(declare-fun m!30049 () Bool)

(assert (=> b!37233 m!30049))

(declare-fun m!30051 () Bool)

(assert (=> b!37234 m!30051))

(assert (=> b!37097 d!5807))

(declare-fun d!5809 () Bool)

(declare-fun res!22515 () Bool)

(declare-fun e!23563 () Bool)

(assert (=> d!5809 (=> res!22515 e!23563)))

(assert (=> d!5809 (= res!22515 (and (is-Cons!972 (toList!506 lm!252)) (= (_1!713 (h!1540 (toList!506 lm!252))) k!388)))))

(assert (=> d!5809 (= (containsKey!49 (toList!506 lm!252) k!388) e!23563)))

(declare-fun b!37245 () Bool)

(declare-fun e!23564 () Bool)

(assert (=> b!37245 (= e!23563 e!23564)))

(declare-fun res!22516 () Bool)

(assert (=> b!37245 (=> (not res!22516) (not e!23564))))

(assert (=> b!37245 (= res!22516 (and (or (not (is-Cons!972 (toList!506 lm!252))) (bvsle (_1!713 (h!1540 (toList!506 lm!252))) k!388)) (is-Cons!972 (toList!506 lm!252)) (bvslt (_1!713 (h!1540 (toList!506 lm!252))) k!388)))))

(declare-fun b!37246 () Bool)

(assert (=> b!37246 (= e!23564 (containsKey!49 (t!3737 (toList!506 lm!252)) k!388))))

(assert (= (and d!5809 (not res!22515)) b!37245))

(assert (= (and b!37245 res!22516) b!37246))

(declare-fun m!30055 () Bool)

(assert (=> b!37246 m!30055))

(assert (=> d!5727 d!5809))

(assert (=> b!37117 d!5789))

(assert (=> b!37117 d!5791))

(declare-fun d!5813 () Bool)

(assert (=> d!5813 (= (isEmpty!204 (toList!506 lm!252)) (is-Nil!973 (toList!506 lm!252)))))

(assert (=> d!5733 d!5813))

(declare-fun d!5817 () Bool)

(declare-fun lt!13744 () Int)

(assert (=> d!5817 (>= lt!13744 0)))

(declare-fun e!23568 () Int)

(assert (=> d!5817 (= lt!13744 e!23568)))

(declare-fun c!4289 () Bool)

(assert (=> d!5817 (= c!4289 (is-Nil!973 (t!3737 (toList!506 lm!252))))))

(assert (=> d!5817 (= (size!1303 (t!3737 (toList!506 lm!252))) lt!13744)))

(declare-fun b!37250 () Bool)

(assert (=> b!37250 (= e!23568 0)))

(declare-fun b!37251 () Bool)

(assert (=> b!37251 (= e!23568 (+ 1 (size!1303 (t!3737 (t!3737 (toList!506 lm!252))))))))

(assert (= (and d!5817 c!4289) b!37250))

(assert (= (and d!5817 (not c!4289)) b!37251))

(declare-fun m!30061 () Bool)

(assert (=> b!37251 m!30061))

(assert (=> b!37050 d!5817))

(declare-fun d!5819 () Bool)

(declare-fun res!22520 () Bool)

(declare-fun e!23570 () Bool)

(assert (=> d!5819 (=> res!22520 e!23570)))

(assert (=> d!5819 (= res!22520 (and (is-Cons!972 (toList!506 lt!13668)) (= (_1!713 (h!1540 (toList!506 lt!13668))) k!388)))))

(assert (=> d!5819 (= (containsKey!49 (toList!506 lt!13668) k!388) e!23570)))

(declare-fun b!37253 () Bool)

(declare-fun e!23571 () Bool)

(assert (=> b!37253 (= e!23570 e!23571)))

(declare-fun res!22521 () Bool)

(assert (=> b!37253 (=> (not res!22521) (not e!23571))))

(assert (=> b!37253 (= res!22521 (and (or (not (is-Cons!972 (toList!506 lt!13668))) (bvsle (_1!713 (h!1540 (toList!506 lt!13668))) k!388)) (is-Cons!972 (toList!506 lt!13668)) (bvslt (_1!713 (h!1540 (toList!506 lt!13668))) k!388)))))

(declare-fun b!37254 () Bool)

(assert (=> b!37254 (= e!23571 (containsKey!49 (t!3737 (toList!506 lt!13668)) k!388))))

(assert (= (and d!5819 (not res!22520)) b!37253))

(assert (= (and b!37253 res!22521) b!37254))

(declare-fun m!30063 () Bool)

(assert (=> b!37254 m!30063))

(assert (=> d!5693 d!5819))

(declare-fun d!5821 () Bool)

(assert (=> d!5821 (isDefined!47 (getValueByKey!86 (toList!506 lt!13668) k!388))))

(declare-fun lt!13745 () Unit!839)

(assert (=> d!5821 (= lt!13745 (choose!229 (toList!506 lt!13668) k!388))))

(declare-fun e!23572 () Bool)

(assert (=> d!5821 e!23572))

(declare-fun res!22522 () Bool)

(assert (=> d!5821 (=> (not res!22522) (not e!23572))))

(assert (=> d!5821 (= res!22522 (isStrictlySorted!184 (toList!506 lt!13668)))))

(assert (=> d!5821 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!46 (toList!506 lt!13668) k!388) lt!13745)))

(declare-fun b!37255 () Bool)

(assert (=> b!37255 (= e!23572 (containsKey!49 (toList!506 lt!13668) k!388))))

(assert (= (and d!5821 res!22522) b!37255))

(assert (=> d!5821 m!29905))

(assert (=> d!5821 m!29905))

(assert (=> d!5821 m!29907))

(declare-fun m!30065 () Bool)

(assert (=> d!5821 m!30065))

(declare-fun m!30067 () Bool)

(assert (=> d!5821 m!30067))

(assert (=> b!37255 m!29901))

(assert (=> b!37078 d!5821))

(declare-fun d!5823 () Bool)

(assert (=> d!5823 (= (isDefined!47 (getValueByKey!86 (toList!506 lt!13668) k!388)) (not (isEmpty!207 (getValueByKey!86 (toList!506 lt!13668) k!388))))))

(declare-fun bs!1441 () Bool)

(assert (= bs!1441 d!5823))

(assert (=> bs!1441 m!29905))

(declare-fun m!30069 () Bool)

(assert (=> bs!1441 m!30069))

(assert (=> b!37078 d!5823))

(declare-fun b!37258 () Bool)

(declare-fun e!23574 () Option!91)

(assert (=> b!37258 (= e!23574 (getValueByKey!86 (t!3737 (toList!506 lt!13668)) k!388))))

(declare-fun b!37256 () Bool)

(declare-fun e!23573 () Option!91)

(assert (=> b!37256 (= e!23573 (Some!90 (_2!713 (h!1540 (toList!506 lt!13668)))))))

(declare-fun b!37257 () Bool)

(assert (=> b!37257 (= e!23573 e!23574)))

(declare-fun c!4291 () Bool)

(assert (=> b!37257 (= c!4291 (and (is-Cons!972 (toList!506 lt!13668)) (not (= (_1!713 (h!1540 (toList!506 lt!13668))) k!388))))))

(declare-fun b!37259 () Bool)

(assert (=> b!37259 (= e!23574 None!89)))

(declare-fun d!5825 () Bool)

(declare-fun c!4290 () Bool)

(assert (=> d!5825 (= c!4290 (and (is-Cons!972 (toList!506 lt!13668)) (= (_1!713 (h!1540 (toList!506 lt!13668))) k!388)))))

(assert (=> d!5825 (= (getValueByKey!86 (toList!506 lt!13668) k!388) e!23573)))

(assert (= (and d!5825 c!4290) b!37256))

(assert (= (and d!5825 (not c!4290)) b!37257))

(assert (= (and b!37257 c!4291) b!37258))

(assert (= (and b!37257 (not c!4291)) b!37259))

(declare-fun m!30071 () Bool)

(assert (=> b!37258 m!30071))

(assert (=> b!37078 d!5825))

(declare-fun d!5827 () Bool)

(declare-fun lt!13746 () Int)

(assert (=> d!5827 (>= lt!13746 0)))

(declare-fun e!23575 () Int)

(assert (=> d!5827 (= lt!13746 e!23575)))

(declare-fun c!4292 () Bool)

(assert (=> d!5827 (= c!4292 (is-Nil!973 (t!3737 (toList!506 lt!13668))))))

(assert (=> d!5827 (= (size!1303 (t!3737 (toList!506 lt!13668))) lt!13746)))

(declare-fun b!37260 () Bool)

(assert (=> b!37260 (= e!23575 0)))

(declare-fun b!37261 () Bool)

(assert (=> b!37261 (= e!23575 (+ 1 (size!1303 (t!3737 (t!3737 (toList!506 lt!13668))))))))

(assert (= (and d!5827 c!4292) b!37260))

(assert (= (and d!5827 (not c!4292)) b!37261))

(declare-fun m!30073 () Bool)

(assert (=> b!37261 m!30073))

(assert (=> b!37048 d!5827))

(declare-fun d!5829 () Bool)

(declare-fun res!22523 () Bool)

(declare-fun e!23576 () Bool)

(assert (=> d!5829 (=> res!22523 e!23576)))

(assert (=> d!5829 (= res!22523 (is-Nil!973 (t!3737 (toList!506 lt!13668))))))

(assert (=> d!5829 (= (forall!172 (t!3737 (toList!506 lt!13668)) p!304) e!23576)))

(declare-fun b!37262 () Bool)

(declare-fun e!23577 () Bool)

(assert (=> b!37262 (= e!23576 e!23577)))

(declare-fun res!22524 () Bool)

(assert (=> b!37262 (=> (not res!22524) (not e!23577))))

(assert (=> b!37262 (= res!22524 (dynLambda!174 p!304 (h!1540 (t!3737 (toList!506 lt!13668)))))))

(declare-fun b!37263 () Bool)

(assert (=> b!37263 (= e!23577 (forall!172 (t!3737 (t!3737 (toList!506 lt!13668))) p!304))))

(assert (= (and d!5829 (not res!22523)) b!37262))

(assert (= (and b!37262 res!22524) b!37263))

(declare-fun b_lambda!1875 () Bool)

(assert (=> (not b_lambda!1875) (not b!37262)))

(declare-fun t!3761 () Bool)

(declare-fun tb!771 () Bool)

(assert (=> (and start!4852 (= p!304 p!304) t!3761) tb!771))

(declare-fun result!1307 () Bool)

(assert (=> tb!771 (= result!1307 true)))

(assert (=> b!37262 t!3761))

(declare-fun b_and!2243 () Bool)

(assert (= b_and!2241 (and (=> t!3761 result!1307) b_and!2243)))

(declare-fun m!30075 () Bool)

(assert (=> b!37262 m!30075))

(declare-fun m!30077 () Bool)

(assert (=> b!37263 m!30077))

(assert (=> b!37103 d!5829))

(declare-fun d!5831 () Bool)

(declare-fun res!22529 () Bool)

(declare-fun e!23582 () Bool)

(assert (=> d!5831 (=> res!22529 e!23582)))

(assert (=> d!5831 (= res!22529 (or (is-Nil!973 (toList!506 lm!252)) (is-Nil!973 (t!3737 (toList!506 lm!252)))))))

(assert (=> d!5831 (= (isStrictlySorted!184 (toList!506 lm!252)) e!23582)))

