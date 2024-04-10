; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75202 () Bool)

(assert start!75202)

(declare-fun b!886009 () Bool)

(declare-fun e!493154 () Bool)

(declare-fun tp_is_empty!17809 () Bool)

(declare-fun tp!54365 () Bool)

(assert (=> b!886009 (= e!493154 (and tp_is_empty!17809 tp!54365))))

(declare-fun b!886006 () Bool)

(declare-fun res!601596 () Bool)

(declare-fun e!493155 () Bool)

(assert (=> b!886006 (=> (not res!601596) (not e!493155))))

(declare-datatypes ((B!1298 0))(
  ( (B!1299 (val!8955 Int)) )
))
(declare-datatypes ((tuple2!11904 0))(
  ( (tuple2!11905 (_1!5963 (_ BitVec 64)) (_2!5963 B!1298)) )
))
(declare-datatypes ((List!17671 0))(
  ( (Nil!17668) (Cons!17667 (h!18798 tuple2!11904) (t!24948 List!17671)) )
))
(declare-fun l!906 () List!17671)

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!886006 (= res!601596 (and (is-Cons!17667 l!906) (bvslt (_1!5963 (h!18798 l!906)) key1!49)))))

(declare-fun v2!16 () B!1298)

(declare-fun b!886008 () Bool)

(declare-fun v1!38 () B!1298)

(declare-fun insertStrictlySorted!297 (List!17671 (_ BitVec 64) B!1298) List!17671)

(assert (=> b!886008 (= e!493155 (not (= (insertStrictlySorted!297 (insertStrictlySorted!297 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!297 l!906 key1!49 v2!16))))))

(assert (=> b!886008 (= (insertStrictlySorted!297 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!297 (t!24948 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30240 0))(
  ( (Unit!30241) )
))
(declare-fun lt!401068 () Unit!30240)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!13 (List!17671 (_ BitVec 64) B!1298 B!1298) Unit!30240)

(assert (=> b!886008 (= lt!401068 (lemmaInsertStrictlySortedErasesIfSameKey!13 (t!24948 l!906) key1!49 v1!38 v2!16))))

(declare-fun res!601597 () Bool)

(assert (=> start!75202 (=> (not res!601597) (not e!493155))))

(declare-fun isStrictlySorted!489 (List!17671) Bool)

(assert (=> start!75202 (= res!601597 (isStrictlySorted!489 l!906))))

(assert (=> start!75202 e!493155))

(assert (=> start!75202 e!493154))

(assert (=> start!75202 true))

(assert (=> start!75202 tp_is_empty!17809))

(declare-fun b!886007 () Bool)

(declare-fun res!601595 () Bool)

(assert (=> b!886007 (=> (not res!601595) (not e!493155))))

(assert (=> b!886007 (= res!601595 (isStrictlySorted!489 (t!24948 l!906)))))

(assert (= (and start!75202 res!601597) b!886006))

(assert (= (and b!886006 res!601596) b!886007))

(assert (= (and b!886007 res!601595) b!886008))

(assert (= (and start!75202 (is-Cons!17667 l!906)) b!886009))

(declare-fun m!825919 () Bool)

(assert (=> b!886008 m!825919))

(declare-fun m!825921 () Bool)

(assert (=> b!886008 m!825921))

(declare-fun m!825923 () Bool)

(assert (=> b!886008 m!825923))

(declare-fun m!825925 () Bool)

(assert (=> b!886008 m!825925))

(declare-fun m!825927 () Bool)

(assert (=> b!886008 m!825927))

(assert (=> b!886008 m!825925))

(declare-fun m!825929 () Bool)

(assert (=> b!886008 m!825929))

(assert (=> b!886008 m!825919))

(declare-fun m!825931 () Bool)

(assert (=> b!886008 m!825931))

(declare-fun m!825933 () Bool)

(assert (=> start!75202 m!825933))

(declare-fun m!825935 () Bool)

(assert (=> b!886007 m!825935))

(push 1)

(assert (not b!886007))

(assert (not b!886009))

(assert (not b!886008))

(assert (not start!75202))

(assert tp_is_empty!17809)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109499 () Bool)

(declare-fun res!601620 () Bool)

(declare-fun e!493172 () Bool)

(assert (=> d!109499 (=> res!601620 e!493172)))

(assert (=> d!109499 (= res!601620 (or (is-Nil!17668 l!906) (is-Nil!17668 (t!24948 l!906))))))

(assert (=> d!109499 (= (isStrictlySorted!489 l!906) e!493172)))

(declare-fun b!886038 () Bool)

(declare-fun e!493173 () Bool)

(assert (=> b!886038 (= e!493172 e!493173)))

(declare-fun res!601621 () Bool)

(assert (=> b!886038 (=> (not res!601621) (not e!493173))))

(assert (=> b!886038 (= res!601621 (bvslt (_1!5963 (h!18798 l!906)) (_1!5963 (h!18798 (t!24948 l!906)))))))

(declare-fun b!886039 () Bool)

(assert (=> b!886039 (= e!493173 (isStrictlySorted!489 (t!24948 l!906)))))

(assert (= (and d!109499 (not res!601620)) b!886038))

(assert (= (and b!886038 res!601621) b!886039))

(assert (=> b!886039 m!825935))

(assert (=> start!75202 d!109499))

(declare-fun d!109503 () Bool)

(declare-fun res!601622 () Bool)

(declare-fun e!493174 () Bool)

(assert (=> d!109503 (=> res!601622 e!493174)))

(assert (=> d!109503 (= res!601622 (or (is-Nil!17668 (t!24948 l!906)) (is-Nil!17668 (t!24948 (t!24948 l!906)))))))

(assert (=> d!109503 (= (isStrictlySorted!489 (t!24948 l!906)) e!493174)))

(declare-fun b!886040 () Bool)

(declare-fun e!493175 () Bool)

(assert (=> b!886040 (= e!493174 e!493175)))

(declare-fun res!601623 () Bool)

(assert (=> b!886040 (=> (not res!601623) (not e!493175))))

(assert (=> b!886040 (= res!601623 (bvslt (_1!5963 (h!18798 (t!24948 l!906))) (_1!5963 (h!18798 (t!24948 (t!24948 l!906))))))))

(declare-fun b!886041 () Bool)

(assert (=> b!886041 (= e!493175 (isStrictlySorted!489 (t!24948 (t!24948 l!906))))))

(assert (= (and d!109503 (not res!601622)) b!886040))

(assert (= (and b!886040 res!601623) b!886041))

(declare-fun m!825975 () Bool)

(assert (=> b!886041 m!825975))

(assert (=> b!886007 d!109503))

(declare-fun d!109505 () Bool)

(assert (=> d!109505 (= (insertStrictlySorted!297 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!297 (t!24948 l!906) key1!49 v2!16))))

(declare-fun lt!401080 () Unit!30240)

(declare-fun choose!1450 (List!17671 (_ BitVec 64) B!1298 B!1298) Unit!30240)

(assert (=> d!109505 (= lt!401080 (choose!1450 (t!24948 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109505 (isStrictlySorted!489 (t!24948 l!906))))

(assert (=> d!109505 (= (lemmaInsertStrictlySortedErasesIfSameKey!13 (t!24948 l!906) key1!49 v1!38 v2!16) lt!401080)))

(declare-fun bs!24850 () Bool)

(assert (= bs!24850 d!109505))

(assert (=> bs!24850 m!825929))

(declare-fun m!825977 () Bool)

(assert (=> bs!24850 m!825977))

(assert (=> bs!24850 m!825935))

(assert (=> bs!24850 m!825919))

(assert (=> bs!24850 m!825921))

(assert (=> bs!24850 m!825919))

(assert (=> b!886008 d!109505))

(declare-fun e!493205 () List!17671)

(declare-fun b!886090 () Bool)

(assert (=> b!886090 (= e!493205 (insertStrictlySorted!297 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun lt!401088 () List!17671)

(declare-fun e!493204 () Bool)

(declare-fun b!886091 () Bool)

(declare-fun contains!4295 (List!17671 tuple2!11904) Bool)

(assert (=> b!886091 (= e!493204 (contains!4295 lt!401088 (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886092 () Bool)

(declare-fun e!493206 () List!17671)

(declare-fun e!493208 () List!17671)

(assert (=> b!886092 (= e!493206 e!493208)))

(declare-fun c!93391 () Bool)

(assert (=> b!886092 (= c!93391 (and (is-Cons!17667 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (= (_1!5963 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun b!886093 () Bool)

(declare-fun call!39163 () List!17671)

(assert (=> b!886093 (= e!493206 call!39163)))

(declare-fun b!886094 () Bool)

(declare-fun e!493207 () List!17671)

(declare-fun call!39162 () List!17671)

(assert (=> b!886094 (= e!493207 call!39162)))

(declare-fun c!93393 () Bool)

(declare-fun b!886095 () Bool)

(assert (=> b!886095 (= c!93393 (and (is-Cons!17667 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (bvsgt (_1!5963 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> b!886095 (= e!493208 e!493207)))

(declare-fun b!886096 () Bool)

(declare-fun call!39161 () List!17671)

(assert (=> b!886096 (= e!493208 call!39161)))

(declare-fun b!886097 () Bool)

(assert (=> b!886097 (= e!493205 (ite c!93391 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (ite c!93393 (Cons!17667 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) Nil!17668)))))

(declare-fun bm!39158 () Bool)

(assert (=> bm!39158 (= call!39161 call!39163)))

(declare-fun d!109509 () Bool)

(assert (=> d!109509 e!493204))

(declare-fun res!601641 () Bool)

(assert (=> d!109509 (=> (not res!601641) (not e!493204))))

(assert (=> d!109509 (= res!601641 (isStrictlySorted!489 lt!401088))))

(assert (=> d!109509 (= lt!401088 e!493206)))

(declare-fun c!93392 () Bool)

(assert (=> d!109509 (= c!93392 (and (is-Cons!17667 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (bvslt (_1!5963 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109509 (isStrictlySorted!489 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))))

(assert (=> d!109509 (= (insertStrictlySorted!297 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38) key1!49 v2!16) lt!401088)))

(declare-fun bm!39159 () Bool)

(assert (=> bm!39159 (= call!39162 call!39161)))

(declare-fun b!886098 () Bool)

(assert (=> b!886098 (= e!493207 call!39162)))

(declare-fun bm!39160 () Bool)

(declare-fun $colon$colon!547 (List!17671 tuple2!11904) List!17671)

(assert (=> bm!39160 (= call!39163 ($colon$colon!547 e!493205 (ite c!93392 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (tuple2!11905 key1!49 v2!16))))))

(declare-fun c!93394 () Bool)

(assert (=> bm!39160 (= c!93394 c!93392)))

(declare-fun b!886099 () Bool)

(declare-fun res!601640 () Bool)

(assert (=> b!886099 (=> (not res!601640) (not e!493204))))

(declare-fun containsKey!412 (List!17671 (_ BitVec 64)) Bool)

(assert (=> b!886099 (= res!601640 (containsKey!412 lt!401088 key1!49))))

(assert (= (and d!109509 c!93392) b!886093))

(assert (= (and d!109509 (not c!93392)) b!886092))

(assert (= (and b!886092 c!93391) b!886096))

(assert (= (and b!886092 (not c!93391)) b!886095))

(assert (= (and b!886095 c!93393) b!886094))

(assert (= (and b!886095 (not c!93393)) b!886098))

(assert (= (or b!886094 b!886098) bm!39159))

(assert (= (or b!886096 bm!39159) bm!39158))

(assert (= (or b!886093 bm!39158) bm!39160))

(assert (= (and bm!39160 c!93394) b!886090))

(assert (= (and bm!39160 (not c!93394)) b!886097))

(assert (= (and d!109509 res!601641) b!886099))

(assert (= (and b!886099 res!601640) b!886091))

(declare-fun m!825983 () Bool)

(assert (=> d!109509 m!825983))

(assert (=> d!109509 m!825919))

(declare-fun m!825985 () Bool)

(assert (=> d!109509 m!825985))

(declare-fun m!825987 () Bool)

(assert (=> b!886091 m!825987))

(declare-fun m!825989 () Bool)

(assert (=> b!886099 m!825989))

(declare-fun m!825991 () Bool)

(assert (=> bm!39160 m!825991))

(declare-fun m!825993 () Bool)

(assert (=> b!886090 m!825993))

(assert (=> b!886008 d!109509))

(declare-fun b!886110 () Bool)

(declare-fun e!493215 () List!17671)

(assert (=> b!886110 (= e!493215 (insertStrictlySorted!297 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun e!493214 () Bool)

(declare-fun lt!401090 () List!17671)

(declare-fun b!886111 () Bool)

(assert (=> b!886111 (= e!493214 (contains!4295 lt!401090 (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886112 () Bool)

(declare-fun e!493216 () List!17671)

(declare-fun e!493218 () List!17671)

(assert (=> b!886112 (= e!493216 e!493218)))

(declare-fun c!93399 () Bool)

(assert (=> b!886112 (= c!93399 (and (is-Cons!17667 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (= (_1!5963 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun b!886113 () Bool)

(declare-fun call!39169 () List!17671)

(assert (=> b!886113 (= e!493216 call!39169)))

(declare-fun b!886114 () Bool)

(declare-fun e!493217 () List!17671)

(declare-fun call!39168 () List!17671)

(assert (=> b!886114 (= e!493217 call!39168)))

(declare-fun c!93401 () Bool)

(declare-fun b!886115 () Bool)

(assert (=> b!886115 (= c!93401 (and (is-Cons!17667 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (bvsgt (_1!5963 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> b!886115 (= e!493218 e!493217)))

(declare-fun b!886116 () Bool)

(declare-fun call!39167 () List!17671)

(assert (=> b!886116 (= e!493218 call!39167)))

(declare-fun b!886117 () Bool)

(assert (=> b!886117 (= e!493215 (ite c!93399 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (ite c!93401 (Cons!17667 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) Nil!17668)))))

(declare-fun bm!39164 () Bool)

(assert (=> bm!39164 (= call!39167 call!39169)))

(declare-fun d!109517 () Bool)

(assert (=> d!109517 e!493214))

(declare-fun res!601645 () Bool)

(assert (=> d!109517 (=> (not res!601645) (not e!493214))))

(assert (=> d!109517 (= res!601645 (isStrictlySorted!489 lt!401090))))

(assert (=> d!109517 (= lt!401090 e!493216)))

(declare-fun c!93400 () Bool)

(assert (=> d!109517 (= c!93400 (and (is-Cons!17667 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (bvslt (_1!5963 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109517 (isStrictlySorted!489 (insertStrictlySorted!297 l!906 key1!49 v1!38))))

(assert (=> d!109517 (= (insertStrictlySorted!297 (insertStrictlySorted!297 l!906 key1!49 v1!38) key1!49 v2!16) lt!401090)))

(declare-fun bm!39165 () Bool)

(assert (=> bm!39165 (= call!39168 call!39167)))

(declare-fun b!886118 () Bool)

(assert (=> b!886118 (= e!493217 call!39168)))

(declare-fun bm!39166 () Bool)

(assert (=> bm!39166 (= call!39169 ($colon$colon!547 e!493215 (ite c!93400 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (tuple2!11905 key1!49 v2!16))))))

(declare-fun c!93402 () Bool)

(assert (=> bm!39166 (= c!93402 c!93400)))

(declare-fun b!886119 () Bool)

(declare-fun res!601644 () Bool)

(assert (=> b!886119 (=> (not res!601644) (not e!493214))))

(assert (=> b!886119 (= res!601644 (containsKey!412 lt!401090 key1!49))))

(assert (= (and d!109517 c!93400) b!886113))

(assert (= (and d!109517 (not c!93400)) b!886112))

(assert (= (and b!886112 c!93399) b!886116))

(assert (= (and b!886112 (not c!93399)) b!886115))

(assert (= (and b!886115 c!93401) b!886114))

(assert (= (and b!886115 (not c!93401)) b!886118))

(assert (= (or b!886114 b!886118) bm!39165))

(assert (= (or b!886116 bm!39165) bm!39164))

(assert (= (or b!886113 bm!39164) bm!39166))

(assert (= (and bm!39166 c!93402) b!886110))

(assert (= (and bm!39166 (not c!93402)) b!886117))

(assert (= (and d!109517 res!601645) b!886119))

(assert (= (and b!886119 res!601644) b!886111))

(declare-fun m!826007 () Bool)

(assert (=> d!109517 m!826007))

(assert (=> d!109517 m!825925))

(declare-fun m!826009 () Bool)

(assert (=> d!109517 m!826009))

(declare-fun m!826011 () Bool)

(assert (=> b!886111 m!826011))

(declare-fun m!826013 () Bool)

(assert (=> b!886119 m!826013))

(declare-fun m!826015 () Bool)

(assert (=> bm!39166 m!826015))

(declare-fun m!826017 () Bool)

(assert (=> b!886110 m!826017))

(assert (=> b!886008 d!109517))

(declare-fun e!493225 () List!17671)

(declare-fun b!886130 () Bool)

(assert (=> b!886130 (= e!493225 (insertStrictlySorted!297 (t!24948 (t!24948 l!906)) key1!49 v2!16))))

(declare-fun e!493224 () Bool)

(declare-fun lt!401092 () List!17671)

(declare-fun b!886131 () Bool)

(assert (=> b!886131 (= e!493224 (contains!4295 lt!401092 (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886132 () Bool)

(declare-fun e!493226 () List!17671)

(declare-fun e!493228 () List!17671)

(assert (=> b!886132 (= e!493226 e!493228)))

(declare-fun c!93407 () Bool)

(assert (=> b!886132 (= c!93407 (and (is-Cons!17667 (t!24948 l!906)) (= (_1!5963 (h!18798 (t!24948 l!906))) key1!49)))))

(declare-fun b!886133 () Bool)

(declare-fun call!39175 () List!17671)

(assert (=> b!886133 (= e!493226 call!39175)))

(declare-fun b!886134 () Bool)

(declare-fun e!493227 () List!17671)

(declare-fun call!39174 () List!17671)

(assert (=> b!886134 (= e!493227 call!39174)))

(declare-fun b!886135 () Bool)

(declare-fun c!93409 () Bool)

(assert (=> b!886135 (= c!93409 (and (is-Cons!17667 (t!24948 l!906)) (bvsgt (_1!5963 (h!18798 (t!24948 l!906))) key1!49)))))

(assert (=> b!886135 (= e!493228 e!493227)))

(declare-fun b!886136 () Bool)

(declare-fun call!39173 () List!17671)

(assert (=> b!886136 (= e!493228 call!39173)))

(declare-fun b!886137 () Bool)

(assert (=> b!886137 (= e!493225 (ite c!93407 (t!24948 (t!24948 l!906)) (ite c!93409 (Cons!17667 (h!18798 (t!24948 l!906)) (t!24948 (t!24948 l!906))) Nil!17668)))))

(declare-fun bm!39170 () Bool)

(assert (=> bm!39170 (= call!39173 call!39175)))

(declare-fun d!109521 () Bool)

(assert (=> d!109521 e!493224))

(declare-fun res!601649 () Bool)

(assert (=> d!109521 (=> (not res!601649) (not e!493224))))

(assert (=> d!109521 (= res!601649 (isStrictlySorted!489 lt!401092))))

(assert (=> d!109521 (= lt!401092 e!493226)))

(declare-fun c!93408 () Bool)

(assert (=> d!109521 (= c!93408 (and (is-Cons!17667 (t!24948 l!906)) (bvslt (_1!5963 (h!18798 (t!24948 l!906))) key1!49)))))

(assert (=> d!109521 (isStrictlySorted!489 (t!24948 l!906))))

(assert (=> d!109521 (= (insertStrictlySorted!297 (t!24948 l!906) key1!49 v2!16) lt!401092)))

(declare-fun bm!39171 () Bool)

(assert (=> bm!39171 (= call!39174 call!39173)))

(declare-fun b!886138 () Bool)

(assert (=> b!886138 (= e!493227 call!39174)))

(declare-fun bm!39172 () Bool)

(assert (=> bm!39172 (= call!39175 ($colon$colon!547 e!493225 (ite c!93408 (h!18798 (t!24948 l!906)) (tuple2!11905 key1!49 v2!16))))))

(declare-fun c!93410 () Bool)

(assert (=> bm!39172 (= c!93410 c!93408)))

(declare-fun b!886139 () Bool)

(declare-fun res!601648 () Bool)

(assert (=> b!886139 (=> (not res!601648) (not e!493224))))

(assert (=> b!886139 (= res!601648 (containsKey!412 lt!401092 key1!49))))

(assert (= (and d!109521 c!93408) b!886133))

(assert (= (and d!109521 (not c!93408)) b!886132))

(assert (= (and b!886132 c!93407) b!886136))

(assert (= (and b!886132 (not c!93407)) b!886135))

(assert (= (and b!886135 c!93409) b!886134))

(assert (= (and b!886135 (not c!93409)) b!886138))

(assert (= (or b!886134 b!886138) bm!39171))

(assert (= (or b!886136 bm!39171) bm!39170))

(assert (= (or b!886133 bm!39170) bm!39172))

(assert (= (and bm!39172 c!93410) b!886130))

(assert (= (and bm!39172 (not c!93410)) b!886137))

(assert (= (and d!109521 res!601649) b!886139))

(assert (= (and b!886139 res!601648) b!886131))

(declare-fun m!826019 () Bool)

(assert (=> d!109521 m!826019))

(assert (=> d!109521 m!825935))

(declare-fun m!826023 () Bool)

(assert (=> b!886131 m!826023))

(declare-fun m!826027 () Bool)

(assert (=> b!886139 m!826027))

(declare-fun m!826031 () Bool)

(assert (=> bm!39172 m!826031))

(declare-fun m!826035 () Bool)

(assert (=> b!886130 m!826035))

(assert (=> b!886008 d!109521))

(declare-fun b!886140 () Bool)

(declare-fun e!493230 () List!17671)

(assert (=> b!886140 (= e!493230 (insertStrictlySorted!297 (t!24948 (t!24948 l!906)) key1!49 v1!38))))

(declare-fun b!886141 () Bool)

(declare-fun e!493229 () Bool)

(declare-fun lt!401093 () List!17671)

(assert (=> b!886141 (= e!493229 (contains!4295 lt!401093 (tuple2!11905 key1!49 v1!38)))))

(declare-fun b!886142 () Bool)

(declare-fun e!493231 () List!17671)

(declare-fun e!493233 () List!17671)

(assert (=> b!886142 (= e!493231 e!493233)))

(declare-fun c!93411 () Bool)

(assert (=> b!886142 (= c!93411 (and (is-Cons!17667 (t!24948 l!906)) (= (_1!5963 (h!18798 (t!24948 l!906))) key1!49)))))

(declare-fun b!886143 () Bool)

(declare-fun call!39178 () List!17671)

(assert (=> b!886143 (= e!493231 call!39178)))

(declare-fun b!886144 () Bool)

(declare-fun e!493232 () List!17671)

(declare-fun call!39177 () List!17671)

(assert (=> b!886144 (= e!493232 call!39177)))

(declare-fun b!886145 () Bool)

(declare-fun c!93413 () Bool)

(assert (=> b!886145 (= c!93413 (and (is-Cons!17667 (t!24948 l!906)) (bvsgt (_1!5963 (h!18798 (t!24948 l!906))) key1!49)))))

(assert (=> b!886145 (= e!493233 e!493232)))

(declare-fun b!886146 () Bool)

(declare-fun call!39176 () List!17671)

(assert (=> b!886146 (= e!493233 call!39176)))

(declare-fun b!886147 () Bool)

(assert (=> b!886147 (= e!493230 (ite c!93411 (t!24948 (t!24948 l!906)) (ite c!93413 (Cons!17667 (h!18798 (t!24948 l!906)) (t!24948 (t!24948 l!906))) Nil!17668)))))

(declare-fun bm!39173 () Bool)

(assert (=> bm!39173 (= call!39176 call!39178)))

(declare-fun d!109523 () Bool)

(assert (=> d!109523 e!493229))

(declare-fun res!601651 () Bool)

(assert (=> d!109523 (=> (not res!601651) (not e!493229))))

(assert (=> d!109523 (= res!601651 (isStrictlySorted!489 lt!401093))))

(assert (=> d!109523 (= lt!401093 e!493231)))

(declare-fun c!93412 () Bool)

(assert (=> d!109523 (= c!93412 (and (is-Cons!17667 (t!24948 l!906)) (bvslt (_1!5963 (h!18798 (t!24948 l!906))) key1!49)))))

(assert (=> d!109523 (isStrictlySorted!489 (t!24948 l!906))))

(assert (=> d!109523 (= (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38) lt!401093)))

(declare-fun bm!39174 () Bool)

(assert (=> bm!39174 (= call!39177 call!39176)))

(declare-fun b!886148 () Bool)

(assert (=> b!886148 (= e!493232 call!39177)))

(declare-fun bm!39175 () Bool)

(assert (=> bm!39175 (= call!39178 ($colon$colon!547 e!493230 (ite c!93412 (h!18798 (t!24948 l!906)) (tuple2!11905 key1!49 v1!38))))))

(declare-fun c!93414 () Bool)

(assert (=> bm!39175 (= c!93414 c!93412)))

(declare-fun b!886149 () Bool)

(declare-fun res!601650 () Bool)

(assert (=> b!886149 (=> (not res!601650) (not e!493229))))

(assert (=> b!886149 (= res!601650 (containsKey!412 lt!401093 key1!49))))

(assert (= (and d!109523 c!93412) b!886143))

(assert (= (and d!109523 (not c!93412)) b!886142))

(assert (= (and b!886142 c!93411) b!886146))

(assert (= (and b!886142 (not c!93411)) b!886145))

(assert (= (and b!886145 c!93413) b!886144))

(assert (= (and b!886145 (not c!93413)) b!886148))

(assert (= (or b!886144 b!886148) bm!39174))

(assert (= (or b!886146 bm!39174) bm!39173))

(assert (= (or b!886143 bm!39173) bm!39175))

(assert (= (and bm!39175 c!93414) b!886140))

(assert (= (and bm!39175 (not c!93414)) b!886147))

(assert (= (and d!109523 res!601651) b!886149))

(assert (= (and b!886149 res!601650) b!886141))

(declare-fun m!826041 () Bool)

(assert (=> d!109523 m!826041))

(assert (=> d!109523 m!825935))

(declare-fun m!826043 () Bool)

(assert (=> b!886141 m!826043))

(declare-fun m!826045 () Bool)

(assert (=> b!886149 m!826045))

(declare-fun m!826047 () Bool)

(assert (=> bm!39175 m!826047))

(declare-fun m!826051 () Bool)

(assert (=> b!886140 m!826051))

(assert (=> b!886008 d!109523))

(declare-fun e!493244 () List!17671)

(declare-fun b!886168 () Bool)

(assert (=> b!886168 (= e!493244 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v2!16))))

(declare-fun e!493243 () Bool)

(declare-fun b!886169 () Bool)

(declare-fun lt!401097 () List!17671)

(assert (=> b!886169 (= e!493243 (contains!4295 lt!401097 (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886170 () Bool)

(declare-fun e!493245 () List!17671)

(declare-fun e!493247 () List!17671)

(assert (=> b!886170 (= e!493245 e!493247)))

(declare-fun c!93423 () Bool)

(assert (=> b!886170 (= c!93423 (and (is-Cons!17667 l!906) (= (_1!5963 (h!18798 l!906)) key1!49)))))

(declare-fun b!886171 () Bool)

(declare-fun call!39184 () List!17671)

(assert (=> b!886171 (= e!493245 call!39184)))

(declare-fun b!886172 () Bool)

(declare-fun e!493246 () List!17671)

(declare-fun call!39183 () List!17671)

(assert (=> b!886172 (= e!493246 call!39183)))

(declare-fun b!886173 () Bool)

(declare-fun c!93425 () Bool)

(assert (=> b!886173 (= c!93425 (and (is-Cons!17667 l!906) (bvsgt (_1!5963 (h!18798 l!906)) key1!49)))))

(assert (=> b!886173 (= e!493247 e!493246)))

(declare-fun b!886174 () Bool)

(declare-fun call!39182 () List!17671)

(assert (=> b!886174 (= e!493247 call!39182)))

(declare-fun b!886175 () Bool)

(assert (=> b!886175 (= e!493244 (ite c!93423 (t!24948 l!906) (ite c!93425 (Cons!17667 (h!18798 l!906) (t!24948 l!906)) Nil!17668)))))

(declare-fun bm!39179 () Bool)

(assert (=> bm!39179 (= call!39182 call!39184)))

(declare-fun d!109527 () Bool)

(assert (=> d!109527 e!493243))

(declare-fun res!601655 () Bool)

(assert (=> d!109527 (=> (not res!601655) (not e!493243))))

(assert (=> d!109527 (= res!601655 (isStrictlySorted!489 lt!401097))))

(assert (=> d!109527 (= lt!401097 e!493245)))

(declare-fun c!93424 () Bool)

(assert (=> d!109527 (= c!93424 (and (is-Cons!17667 l!906) (bvslt (_1!5963 (h!18798 l!906)) key1!49)))))

(assert (=> d!109527 (isStrictlySorted!489 l!906)))

(assert (=> d!109527 (= (insertStrictlySorted!297 l!906 key1!49 v2!16) lt!401097)))

(declare-fun bm!39180 () Bool)

(assert (=> bm!39180 (= call!39183 call!39182)))

(declare-fun b!886176 () Bool)

(assert (=> b!886176 (= e!493246 call!39183)))

(declare-fun bm!39181 () Bool)

(assert (=> bm!39181 (= call!39184 ($colon$colon!547 e!493244 (ite c!93424 (h!18798 l!906) (tuple2!11905 key1!49 v2!16))))))

(declare-fun c!93426 () Bool)

(assert (=> bm!39181 (= c!93426 c!93424)))

(declare-fun b!886177 () Bool)

(declare-fun res!601654 () Bool)

(assert (=> b!886177 (=> (not res!601654) (not e!493243))))

(assert (=> b!886177 (= res!601654 (containsKey!412 lt!401097 key1!49))))

(assert (= (and d!109527 c!93424) b!886171))

(assert (= (and d!109527 (not c!93424)) b!886170))

(assert (= (and b!886170 c!93423) b!886174))

(assert (= (and b!886170 (not c!93423)) b!886173))

(assert (= (and b!886173 c!93425) b!886172))

(assert (= (and b!886173 (not c!93425)) b!886176))

(assert (= (or b!886172 b!886176) bm!39180))

(assert (= (or b!886174 bm!39180) bm!39179))

(assert (= (or b!886171 bm!39179) bm!39181))

(assert (= (and bm!39181 c!93426) b!886168))

(assert (= (and bm!39181 (not c!93426)) b!886175))

(assert (= (and d!109527 res!601655) b!886177))

(assert (= (and b!886177 res!601654) b!886169))

(declare-fun m!826061 () Bool)

(assert (=> d!109527 m!826061))

(assert (=> d!109527 m!825933))

(declare-fun m!826063 () Bool)

(assert (=> b!886169 m!826063))

(declare-fun m!826065 () Bool)

(assert (=> b!886177 m!826065))

(declare-fun m!826067 () Bool)

(assert (=> bm!39181 m!826067))

(assert (=> b!886168 m!825929))

(assert (=> b!886008 d!109527))

(declare-fun e!493256 () List!17671)

(declare-fun b!886192 () Bool)

(assert (=> b!886192 (= e!493256 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))))

(declare-fun lt!401099 () List!17671)

(declare-fun b!886193 () Bool)

(declare-fun e!493255 () Bool)

(assert (=> b!886193 (= e!493255 (contains!4295 lt!401099 (tuple2!11905 key1!49 v1!38)))))

(declare-fun b!886194 () Bool)

(declare-fun e!493257 () List!17671)

(declare-fun e!493259 () List!17671)

(assert (=> b!886194 (= e!493257 e!493259)))

(declare-fun c!93433 () Bool)

(assert (=> b!886194 (= c!93433 (and (is-Cons!17667 l!906) (= (_1!5963 (h!18798 l!906)) key1!49)))))

(declare-fun b!886195 () Bool)

(declare-fun call!39192 () List!17671)

(assert (=> b!886195 (= e!493257 call!39192)))

(declare-fun b!886196 () Bool)

(declare-fun e!493258 () List!17671)

(declare-fun call!39191 () List!17671)

(assert (=> b!886196 (= e!493258 call!39191)))

(declare-fun b!886197 () Bool)

(declare-fun c!93435 () Bool)

(assert (=> b!886197 (= c!93435 (and (is-Cons!17667 l!906) (bvsgt (_1!5963 (h!18798 l!906)) key1!49)))))

(assert (=> b!886197 (= e!493259 e!493258)))

(declare-fun b!886198 () Bool)

(declare-fun call!39190 () List!17671)

(assert (=> b!886198 (= e!493259 call!39190)))

(declare-fun b!886199 () Bool)

(assert (=> b!886199 (= e!493256 (ite c!93433 (t!24948 l!906) (ite c!93435 (Cons!17667 (h!18798 l!906) (t!24948 l!906)) Nil!17668)))))

(declare-fun bm!39187 () Bool)

(assert (=> bm!39187 (= call!39190 call!39192)))

(declare-fun d!109531 () Bool)

(assert (=> d!109531 e!493255))

(declare-fun res!601659 () Bool)

(assert (=> d!109531 (=> (not res!601659) (not e!493255))))

(assert (=> d!109531 (= res!601659 (isStrictlySorted!489 lt!401099))))

(assert (=> d!109531 (= lt!401099 e!493257)))

(declare-fun c!93434 () Bool)

(assert (=> d!109531 (= c!93434 (and (is-Cons!17667 l!906) (bvslt (_1!5963 (h!18798 l!906)) key1!49)))))

(assert (=> d!109531 (isStrictlySorted!489 l!906)))

(assert (=> d!109531 (= (insertStrictlySorted!297 l!906 key1!49 v1!38) lt!401099)))

(declare-fun bm!39188 () Bool)

(assert (=> bm!39188 (= call!39191 call!39190)))

(declare-fun b!886200 () Bool)

(assert (=> b!886200 (= e!493258 call!39191)))

(declare-fun bm!39189 () Bool)

(assert (=> bm!39189 (= call!39192 ($colon$colon!547 e!493256 (ite c!93434 (h!18798 l!906) (tuple2!11905 key1!49 v1!38))))))

(declare-fun c!93436 () Bool)

(assert (=> bm!39189 (= c!93436 c!93434)))

(declare-fun b!886201 () Bool)

(declare-fun res!601658 () Bool)

(assert (=> b!886201 (=> (not res!601658) (not e!493255))))

(assert (=> b!886201 (= res!601658 (containsKey!412 lt!401099 key1!49))))

(assert (= (and d!109531 c!93434) b!886195))

(assert (= (and d!109531 (not c!93434)) b!886194))

(assert (= (and b!886194 c!93433) b!886198))

(assert (= (and b!886194 (not c!93433)) b!886197))

(assert (= (and b!886197 c!93435) b!886196))

(assert (= (and b!886197 (not c!93435)) b!886200))

(assert (= (or b!886196 b!886200) bm!39188))

(assert (= (or b!886198 bm!39188) bm!39187))

(assert (= (or b!886195 bm!39187) bm!39189))

(assert (= (and bm!39189 c!93436) b!886192))

(assert (= (and bm!39189 (not c!93436)) b!886199))

(assert (= (and d!109531 res!601659) b!886201))

(assert (= (and b!886201 res!601658) b!886193))

(declare-fun m!826079 () Bool)

(assert (=> d!109531 m!826079))

(assert (=> d!109531 m!825933))

(declare-fun m!826081 () Bool)

(assert (=> b!886193 m!826081))

(declare-fun m!826083 () Bool)

(assert (=> b!886201 m!826083))

(declare-fun m!826085 () Bool)

(assert (=> bm!39189 m!826085))

(assert (=> b!886192 m!825919))

(assert (=> b!886008 d!109531))

(declare-fun b!886230 () Bool)

(declare-fun e!493274 () Bool)

(declare-fun tp!54374 () Bool)

(assert (=> b!886230 (= e!493274 (and tp_is_empty!17809 tp!54374))))

(assert (=> b!886009 (= tp!54365 e!493274)))

(assert (= (and b!886009 (is-Cons!17667 (t!24948 l!906))) b!886230))

(push 1)

(assert (not b!886041))

(assert (not d!109517))

(assert (not bm!39189))

(assert (not b!886192))

(assert (not b!886230))

(assert (not b!886110))

(assert (not b!886140))

(assert (not bm!39160))

(assert (not b!886168))

(assert (not bm!39175))

(assert (not b!886130))

(assert (not b!886201))

(assert (not b!886139))

(assert (not b!886169))

(assert (not b!886141))

(assert (not b!886131))

(assert (not b!886091))

(assert (not d!109531))

(assert (not d!109527))

(assert (not d!109509))

(assert (not b!886149))

(assert (not d!109521))

(assert (not bm!39172))

(assert (not b!886119))

(assert (not b!886039))

(assert (not d!109523))

(assert (not bm!39181))

(assert (not b!886090))

(assert (not b!886193))

(assert tp_is_empty!17809)

(assert (not d!109505))

(assert (not b!886099))

(assert (not b!886177))

(assert (not b!886111))

(assert (not bm!39166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109555 () Bool)

(declare-fun res!601694 () Bool)

(declare-fun e!493327 () Bool)

(assert (=> d!109555 (=> res!601694 e!493327)))

(assert (=> d!109555 (= res!601694 (or (is-Nil!17668 lt!401097) (is-Nil!17668 (t!24948 lt!401097))))))

(assert (=> d!109555 (= (isStrictlySorted!489 lt!401097) e!493327)))

(declare-fun b!886319 () Bool)

(declare-fun e!493328 () Bool)

(assert (=> b!886319 (= e!493327 e!493328)))

(declare-fun res!601695 () Bool)

(assert (=> b!886319 (=> (not res!601695) (not e!493328))))

(assert (=> b!886319 (= res!601695 (bvslt (_1!5963 (h!18798 lt!401097)) (_1!5963 (h!18798 (t!24948 lt!401097)))))))

(declare-fun b!886320 () Bool)

(assert (=> b!886320 (= e!493328 (isStrictlySorted!489 (t!24948 lt!401097)))))

(assert (= (and d!109555 (not res!601694)) b!886319))

(assert (= (and b!886319 res!601695) b!886320))

(declare-fun m!826171 () Bool)

(assert (=> b!886320 m!826171))

(assert (=> d!109527 d!109555))

(assert (=> d!109527 d!109499))

(declare-fun d!109557 () Bool)

(declare-fun lt!401117 () Bool)

(declare-fun content!395 (List!17671) (Set tuple2!11904))

(assert (=> d!109557 (= lt!401117 (set.member (tuple2!11905 key1!49 v2!16) (content!395 lt!401097)))))

(declare-fun e!493348 () Bool)

(assert (=> d!109557 (= lt!401117 e!493348)))

(declare-fun res!601708 () Bool)

(assert (=> d!109557 (=> (not res!601708) (not e!493348))))

(assert (=> d!109557 (= res!601708 (is-Cons!17667 lt!401097))))

(assert (=> d!109557 (= (contains!4295 lt!401097 (tuple2!11905 key1!49 v2!16)) lt!401117)))

(declare-fun b!886349 () Bool)

(declare-fun e!493347 () Bool)

(assert (=> b!886349 (= e!493348 e!493347)))

(declare-fun res!601709 () Bool)

(assert (=> b!886349 (=> res!601709 e!493347)))

(assert (=> b!886349 (= res!601709 (= (h!18798 lt!401097) (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886350 () Bool)

(assert (=> b!886350 (= e!493347 (contains!4295 (t!24948 lt!401097) (tuple2!11905 key1!49 v2!16)))))

(assert (= (and d!109557 res!601708) b!886349))

(assert (= (and b!886349 (not res!601709)) b!886350))

(declare-fun m!826207 () Bool)

(assert (=> d!109557 m!826207))

(declare-fun m!826209 () Bool)

(assert (=> d!109557 m!826209))

(declare-fun m!826211 () Bool)

(assert (=> b!886350 m!826211))

(assert (=> b!886169 d!109557))

(declare-fun d!109569 () Bool)

(declare-fun res!601712 () Bool)

(declare-fun e!493354 () Bool)

(assert (=> d!109569 (=> res!601712 e!493354)))

(assert (=> d!109569 (= res!601712 (or (is-Nil!17668 (t!24948 (t!24948 l!906))) (is-Nil!17668 (t!24948 (t!24948 (t!24948 l!906))))))))

(assert (=> d!109569 (= (isStrictlySorted!489 (t!24948 (t!24948 l!906))) e!493354)))

(declare-fun b!886361 () Bool)

(declare-fun e!493355 () Bool)

(assert (=> b!886361 (= e!493354 e!493355)))

(declare-fun res!601713 () Bool)

(assert (=> b!886361 (=> (not res!601713) (not e!493355))))

(assert (=> b!886361 (= res!601713 (bvslt (_1!5963 (h!18798 (t!24948 (t!24948 l!906)))) (_1!5963 (h!18798 (t!24948 (t!24948 (t!24948 l!906)))))))))

(declare-fun b!886362 () Bool)

(assert (=> b!886362 (= e!493355 (isStrictlySorted!489 (t!24948 (t!24948 (t!24948 l!906)))))))

(assert (= (and d!109569 (not res!601712)) b!886361))

(assert (= (and b!886361 res!601713) b!886362))

(declare-fun m!826213 () Bool)

(assert (=> b!886362 m!826213))

(assert (=> b!886041 d!109569))

(assert (=> b!886192 d!109523))

(declare-fun d!109571 () Bool)

(declare-fun lt!401119 () Bool)

(assert (=> d!109571 (= lt!401119 (set.member (tuple2!11905 key1!49 v1!38) (content!395 lt!401099)))))

(declare-fun e!493357 () Bool)

(assert (=> d!109571 (= lt!401119 e!493357)))

(declare-fun res!601714 () Bool)

(assert (=> d!109571 (=> (not res!601714) (not e!493357))))

(assert (=> d!109571 (= res!601714 (is-Cons!17667 lt!401099))))

(assert (=> d!109571 (= (contains!4295 lt!401099 (tuple2!11905 key1!49 v1!38)) lt!401119)))

(declare-fun b!886363 () Bool)

(declare-fun e!493356 () Bool)

(assert (=> b!886363 (= e!493357 e!493356)))

(declare-fun res!601715 () Bool)

(assert (=> b!886363 (=> res!601715 e!493356)))

(assert (=> b!886363 (= res!601715 (= (h!18798 lt!401099) (tuple2!11905 key1!49 v1!38)))))

(declare-fun b!886364 () Bool)

(assert (=> b!886364 (= e!493356 (contains!4295 (t!24948 lt!401099) (tuple2!11905 key1!49 v1!38)))))

(assert (= (and d!109571 res!601714) b!886363))

(assert (= (and b!886363 (not res!601715)) b!886364))

(declare-fun m!826221 () Bool)

(assert (=> d!109571 m!826221))

(declare-fun m!826227 () Bool)

(assert (=> d!109571 m!826227))

(declare-fun m!826229 () Bool)

(assert (=> b!886364 m!826229))

(assert (=> b!886193 d!109571))

(declare-fun d!109573 () Bool)

(declare-fun res!601716 () Bool)

(declare-fun e!493358 () Bool)

(assert (=> d!109573 (=> res!601716 e!493358)))

(assert (=> d!109573 (= res!601716 (or (is-Nil!17668 lt!401092) (is-Nil!17668 (t!24948 lt!401092))))))

(assert (=> d!109573 (= (isStrictlySorted!489 lt!401092) e!493358)))

(declare-fun b!886365 () Bool)

(declare-fun e!493359 () Bool)

(assert (=> b!886365 (= e!493358 e!493359)))

(declare-fun res!601717 () Bool)

(assert (=> b!886365 (=> (not res!601717) (not e!493359))))

(assert (=> b!886365 (= res!601717 (bvslt (_1!5963 (h!18798 lt!401092)) (_1!5963 (h!18798 (t!24948 lt!401092)))))))

(declare-fun b!886366 () Bool)

(assert (=> b!886366 (= e!493359 (isStrictlySorted!489 (t!24948 lt!401092)))))

(assert (= (and d!109573 (not res!601716)) b!886365))

(assert (= (and b!886365 res!601717) b!886366))

(declare-fun m!826233 () Bool)

(assert (=> b!886366 m!826233))

(assert (=> d!109521 d!109573))

(assert (=> d!109521 d!109503))

(declare-fun d!109577 () Bool)

(assert (=> d!109577 (= ($colon$colon!547 e!493205 (ite c!93392 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (tuple2!11905 key1!49 v2!16))) (Cons!17667 (ite c!93392 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (tuple2!11905 key1!49 v2!16)) e!493205))))

(assert (=> bm!39160 d!109577))

(declare-fun d!109585 () Bool)

(declare-fun res!601724 () Bool)

(declare-fun e!493366 () Bool)

(assert (=> d!109585 (=> res!601724 e!493366)))

(assert (=> d!109585 (= res!601724 (or (is-Nil!17668 lt!401090) (is-Nil!17668 (t!24948 lt!401090))))))

(assert (=> d!109585 (= (isStrictlySorted!489 lt!401090) e!493366)))

(declare-fun b!886373 () Bool)

(declare-fun e!493367 () Bool)

(assert (=> b!886373 (= e!493366 e!493367)))

(declare-fun res!601725 () Bool)

(assert (=> b!886373 (=> (not res!601725) (not e!493367))))

(assert (=> b!886373 (= res!601725 (bvslt (_1!5963 (h!18798 lt!401090)) (_1!5963 (h!18798 (t!24948 lt!401090)))))))

(declare-fun b!886374 () Bool)

(assert (=> b!886374 (= e!493367 (isStrictlySorted!489 (t!24948 lt!401090)))))

(assert (= (and d!109585 (not res!601724)) b!886373))

(assert (= (and b!886373 res!601725) b!886374))

(declare-fun m!826241 () Bool)

(assert (=> b!886374 m!826241))

(assert (=> d!109517 d!109585))

(declare-fun d!109589 () Bool)

(declare-fun res!601728 () Bool)

(declare-fun e!493370 () Bool)

(assert (=> d!109589 (=> res!601728 e!493370)))

(assert (=> d!109589 (= res!601728 (or (is-Nil!17668 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (is-Nil!17668 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)))))))

(assert (=> d!109589 (= (isStrictlySorted!489 (insertStrictlySorted!297 l!906 key1!49 v1!38)) e!493370)))

(declare-fun b!886377 () Bool)

(declare-fun e!493371 () Bool)

(assert (=> b!886377 (= e!493370 e!493371)))

(declare-fun res!601729 () Bool)

(assert (=> b!886377 (=> (not res!601729) (not e!493371))))

(assert (=> b!886377 (= res!601729 (bvslt (_1!5963 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38))) (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))))))))

(declare-fun b!886378 () Bool)

(assert (=> b!886378 (= e!493371 (isStrictlySorted!489 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))))))

(assert (= (and d!109589 (not res!601728)) b!886377))

(assert (= (and b!886377 res!601729) b!886378))

(declare-fun m!826243 () Bool)

(assert (=> b!886378 m!826243))

(assert (=> d!109517 d!109589))

(declare-fun d!109595 () Bool)

(declare-fun res!601730 () Bool)

(declare-fun e!493372 () Bool)

(assert (=> d!109595 (=> res!601730 e!493372)))

(assert (=> d!109595 (= res!601730 (or (is-Nil!17668 lt!401099) (is-Nil!17668 (t!24948 lt!401099))))))

(assert (=> d!109595 (= (isStrictlySorted!489 lt!401099) e!493372)))

(declare-fun b!886379 () Bool)

(declare-fun e!493373 () Bool)

(assert (=> b!886379 (= e!493372 e!493373)))

(declare-fun res!601731 () Bool)

(assert (=> b!886379 (=> (not res!601731) (not e!493373))))

(assert (=> b!886379 (= res!601731 (bvslt (_1!5963 (h!18798 lt!401099)) (_1!5963 (h!18798 (t!24948 lt!401099)))))))

(declare-fun b!886380 () Bool)

(assert (=> b!886380 (= e!493373 (isStrictlySorted!489 (t!24948 lt!401099)))))

(assert (= (and d!109595 (not res!601730)) b!886379))

(assert (= (and b!886379 res!601731) b!886380))

(declare-fun m!826245 () Bool)

(assert (=> b!886380 m!826245))

(assert (=> d!109531 d!109595))

(assert (=> d!109531 d!109499))

(assert (=> d!109505 d!109509))

(assert (=> d!109505 d!109503))

(assert (=> d!109505 d!109521))

(assert (=> d!109505 d!109523))

(declare-fun d!109599 () Bool)

(assert (=> d!109599 (= (insertStrictlySorted!297 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!297 (t!24948 l!906) key1!49 v2!16))))

(assert (=> d!109599 true))

(declare-fun _$8!133 () Unit!30240)

(assert (=> d!109599 (= (choose!1450 (t!24948 l!906) key1!49 v1!38 v2!16) _$8!133)))

(declare-fun bs!24852 () Bool)

(assert (= bs!24852 d!109599))

(assert (=> bs!24852 m!825919))

(assert (=> bs!24852 m!825919))

(assert (=> bs!24852 m!825921))

(assert (=> bs!24852 m!825929))

(assert (=> d!109505 d!109599))

(declare-fun e!493384 () List!17671)

(declare-fun b!886395 () Bool)

(assert (=> b!886395 (= e!493384 (insertStrictlySorted!297 (t!24948 (t!24948 (t!24948 l!906))) key1!49 v1!38))))

(declare-fun e!493383 () Bool)

(declare-fun lt!401123 () List!17671)

(declare-fun b!886396 () Bool)

(assert (=> b!886396 (= e!493383 (contains!4295 lt!401123 (tuple2!11905 key1!49 v1!38)))))

(declare-fun b!886397 () Bool)

(declare-fun e!493385 () List!17671)

(declare-fun e!493387 () List!17671)

(assert (=> b!886397 (= e!493385 e!493387)))

(declare-fun c!93487 () Bool)

(assert (=> b!886397 (= c!93487 (and (is-Cons!17667 (t!24948 (t!24948 l!906))) (= (_1!5963 (h!18798 (t!24948 (t!24948 l!906)))) key1!49)))))

(declare-fun b!886398 () Bool)

(declare-fun call!39235 () List!17671)

(assert (=> b!886398 (= e!493385 call!39235)))

(declare-fun b!886399 () Bool)

(declare-fun e!493386 () List!17671)

(declare-fun call!39234 () List!17671)

(assert (=> b!886399 (= e!493386 call!39234)))

(declare-fun b!886400 () Bool)

(declare-fun c!93489 () Bool)

(assert (=> b!886400 (= c!93489 (and (is-Cons!17667 (t!24948 (t!24948 l!906))) (bvsgt (_1!5963 (h!18798 (t!24948 (t!24948 l!906)))) key1!49)))))

(assert (=> b!886400 (= e!493387 e!493386)))

(declare-fun b!886401 () Bool)

(declare-fun call!39233 () List!17671)

(assert (=> b!886401 (= e!493387 call!39233)))

(declare-fun b!886402 () Bool)

(assert (=> b!886402 (= e!493384 (ite c!93487 (t!24948 (t!24948 (t!24948 l!906))) (ite c!93489 (Cons!17667 (h!18798 (t!24948 (t!24948 l!906))) (t!24948 (t!24948 (t!24948 l!906)))) Nil!17668)))))

(declare-fun bm!39230 () Bool)

(assert (=> bm!39230 (= call!39233 call!39235)))

(declare-fun d!109607 () Bool)

(assert (=> d!109607 e!493383))

(declare-fun res!601739 () Bool)

(assert (=> d!109607 (=> (not res!601739) (not e!493383))))

(assert (=> d!109607 (= res!601739 (isStrictlySorted!489 lt!401123))))

(assert (=> d!109607 (= lt!401123 e!493385)))

(declare-fun c!93488 () Bool)

(assert (=> d!109607 (= c!93488 (and (is-Cons!17667 (t!24948 (t!24948 l!906))) (bvslt (_1!5963 (h!18798 (t!24948 (t!24948 l!906)))) key1!49)))))

(assert (=> d!109607 (isStrictlySorted!489 (t!24948 (t!24948 l!906)))))

(assert (=> d!109607 (= (insertStrictlySorted!297 (t!24948 (t!24948 l!906)) key1!49 v1!38) lt!401123)))

(declare-fun bm!39231 () Bool)

(assert (=> bm!39231 (= call!39234 call!39233)))

(declare-fun b!886403 () Bool)

(assert (=> b!886403 (= e!493386 call!39234)))

(declare-fun bm!39232 () Bool)

(assert (=> bm!39232 (= call!39235 ($colon$colon!547 e!493384 (ite c!93488 (h!18798 (t!24948 (t!24948 l!906))) (tuple2!11905 key1!49 v1!38))))))

(declare-fun c!93490 () Bool)

(assert (=> bm!39232 (= c!93490 c!93488)))

(declare-fun b!886404 () Bool)

(declare-fun res!601738 () Bool)

(assert (=> b!886404 (=> (not res!601738) (not e!493383))))

(assert (=> b!886404 (= res!601738 (containsKey!412 lt!401123 key1!49))))

(assert (= (and d!109607 c!93488) b!886398))

(assert (= (and d!109607 (not c!93488)) b!886397))

(assert (= (and b!886397 c!93487) b!886401))

(assert (= (and b!886397 (not c!93487)) b!886400))

(assert (= (and b!886400 c!93489) b!886399))

(assert (= (and b!886400 (not c!93489)) b!886403))

(assert (= (or b!886399 b!886403) bm!39231))

(assert (= (or b!886401 bm!39231) bm!39230))

(assert (= (or b!886398 bm!39230) bm!39232))

(assert (= (and bm!39232 c!93490) b!886395))

(assert (= (and bm!39232 (not c!93490)) b!886402))

(assert (= (and d!109607 res!601739) b!886404))

(assert (= (and b!886404 res!601738) b!886396))

(declare-fun m!826269 () Bool)

(assert (=> d!109607 m!826269))

(assert (=> d!109607 m!825975))

(declare-fun m!826271 () Bool)

(assert (=> b!886396 m!826271))

(declare-fun m!826273 () Bool)

(assert (=> b!886404 m!826273))

(declare-fun m!826275 () Bool)

(assert (=> bm!39232 m!826275))

(declare-fun m!826277 () Bool)

(assert (=> b!886395 m!826277))

(assert (=> b!886140 d!109607))

(declare-fun d!109609 () Bool)

(declare-fun res!601754 () Bool)

(declare-fun e!493402 () Bool)

(assert (=> d!109609 (=> res!601754 e!493402)))

(assert (=> d!109609 (= res!601754 (and (is-Cons!17667 lt!401088) (= (_1!5963 (h!18798 lt!401088)) key1!49)))))

(assert (=> d!109609 (= (containsKey!412 lt!401088 key1!49) e!493402)))

(declare-fun b!886419 () Bool)

(declare-fun e!493403 () Bool)

(assert (=> b!886419 (= e!493402 e!493403)))

(declare-fun res!601755 () Bool)

(assert (=> b!886419 (=> (not res!601755) (not e!493403))))

(assert (=> b!886419 (= res!601755 (and (or (not (is-Cons!17667 lt!401088)) (bvsle (_1!5963 (h!18798 lt!401088)) key1!49)) (is-Cons!17667 lt!401088) (bvslt (_1!5963 (h!18798 lt!401088)) key1!49)))))

(declare-fun b!886420 () Bool)

(assert (=> b!886420 (= e!493403 (containsKey!412 (t!24948 lt!401088) key1!49))))

(assert (= (and d!109609 (not res!601754)) b!886419))

(assert (= (and b!886419 res!601755) b!886420))

(declare-fun m!826285 () Bool)

(assert (=> b!886420 m!826285))

(assert (=> b!886099 d!109609))

(declare-fun d!109617 () Bool)

(declare-fun res!601756 () Bool)

(declare-fun e!493404 () Bool)

(assert (=> d!109617 (=> res!601756 e!493404)))

(assert (=> d!109617 (= res!601756 (and (is-Cons!17667 lt!401093) (= (_1!5963 (h!18798 lt!401093)) key1!49)))))

(assert (=> d!109617 (= (containsKey!412 lt!401093 key1!49) e!493404)))

(declare-fun b!886421 () Bool)

(declare-fun e!493405 () Bool)

(assert (=> b!886421 (= e!493404 e!493405)))

(declare-fun res!601757 () Bool)

(assert (=> b!886421 (=> (not res!601757) (not e!493405))))

(assert (=> b!886421 (= res!601757 (and (or (not (is-Cons!17667 lt!401093)) (bvsle (_1!5963 (h!18798 lt!401093)) key1!49)) (is-Cons!17667 lt!401093) (bvslt (_1!5963 (h!18798 lt!401093)) key1!49)))))

(declare-fun b!886422 () Bool)

(assert (=> b!886422 (= e!493405 (containsKey!412 (t!24948 lt!401093) key1!49))))

(assert (= (and d!109617 (not res!601756)) b!886421))

(assert (= (and b!886421 res!601757) b!886422))

(declare-fun m!826287 () Bool)

(assert (=> b!886422 m!826287))

(assert (=> b!886149 d!109617))

(declare-fun e!493407 () List!17671)

(declare-fun b!886423 () Bool)

(assert (=> b!886423 (= e!493407 (insertStrictlySorted!297 (t!24948 (t!24948 (t!24948 l!906))) key1!49 v2!16))))

(declare-fun lt!401124 () List!17671)

(declare-fun b!886424 () Bool)

(declare-fun e!493406 () Bool)

(assert (=> b!886424 (= e!493406 (contains!4295 lt!401124 (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886425 () Bool)

(declare-fun e!493408 () List!17671)

(declare-fun e!493410 () List!17671)

(assert (=> b!886425 (= e!493408 e!493410)))

(declare-fun c!93491 () Bool)

(assert (=> b!886425 (= c!93491 (and (is-Cons!17667 (t!24948 (t!24948 l!906))) (= (_1!5963 (h!18798 (t!24948 (t!24948 l!906)))) key1!49)))))

(declare-fun b!886426 () Bool)

(declare-fun call!39238 () List!17671)

(assert (=> b!886426 (= e!493408 call!39238)))

(declare-fun b!886427 () Bool)

(declare-fun e!493409 () List!17671)

(declare-fun call!39237 () List!17671)

(assert (=> b!886427 (= e!493409 call!39237)))

(declare-fun b!886428 () Bool)

(declare-fun c!93493 () Bool)

(assert (=> b!886428 (= c!93493 (and (is-Cons!17667 (t!24948 (t!24948 l!906))) (bvsgt (_1!5963 (h!18798 (t!24948 (t!24948 l!906)))) key1!49)))))

(assert (=> b!886428 (= e!493410 e!493409)))

(declare-fun b!886429 () Bool)

(declare-fun call!39236 () List!17671)

(assert (=> b!886429 (= e!493410 call!39236)))

(declare-fun b!886430 () Bool)

(assert (=> b!886430 (= e!493407 (ite c!93491 (t!24948 (t!24948 (t!24948 l!906))) (ite c!93493 (Cons!17667 (h!18798 (t!24948 (t!24948 l!906))) (t!24948 (t!24948 (t!24948 l!906)))) Nil!17668)))))

(declare-fun bm!39233 () Bool)

(assert (=> bm!39233 (= call!39236 call!39238)))

(declare-fun d!109619 () Bool)

(assert (=> d!109619 e!493406))

(declare-fun res!601759 () Bool)

(assert (=> d!109619 (=> (not res!601759) (not e!493406))))

(assert (=> d!109619 (= res!601759 (isStrictlySorted!489 lt!401124))))

(assert (=> d!109619 (= lt!401124 e!493408)))

(declare-fun c!93492 () Bool)

(assert (=> d!109619 (= c!93492 (and (is-Cons!17667 (t!24948 (t!24948 l!906))) (bvslt (_1!5963 (h!18798 (t!24948 (t!24948 l!906)))) key1!49)))))

(assert (=> d!109619 (isStrictlySorted!489 (t!24948 (t!24948 l!906)))))

(assert (=> d!109619 (= (insertStrictlySorted!297 (t!24948 (t!24948 l!906)) key1!49 v2!16) lt!401124)))

(declare-fun bm!39234 () Bool)

(assert (=> bm!39234 (= call!39237 call!39236)))

(declare-fun b!886431 () Bool)

(assert (=> b!886431 (= e!493409 call!39237)))

(declare-fun bm!39235 () Bool)

(assert (=> bm!39235 (= call!39238 ($colon$colon!547 e!493407 (ite c!93492 (h!18798 (t!24948 (t!24948 l!906))) (tuple2!11905 key1!49 v2!16))))))

(declare-fun c!93494 () Bool)

(assert (=> bm!39235 (= c!93494 c!93492)))

(declare-fun b!886432 () Bool)

(declare-fun res!601758 () Bool)

(assert (=> b!886432 (=> (not res!601758) (not e!493406))))

(assert (=> b!886432 (= res!601758 (containsKey!412 lt!401124 key1!49))))

(assert (= (and d!109619 c!93492) b!886426))

(assert (= (and d!109619 (not c!93492)) b!886425))

(assert (= (and b!886425 c!93491) b!886429))

(assert (= (and b!886425 (not c!93491)) b!886428))

(assert (= (and b!886428 c!93493) b!886427))

(assert (= (and b!886428 (not c!93493)) b!886431))

(assert (= (or b!886427 b!886431) bm!39234))

(assert (= (or b!886429 bm!39234) bm!39233))

(assert (= (or b!886426 bm!39233) bm!39235))

(assert (= (and bm!39235 c!93494) b!886423))

(assert (= (and bm!39235 (not c!93494)) b!886430))

(assert (= (and d!109619 res!601759) b!886432))

(assert (= (and b!886432 res!601758) b!886424))

(declare-fun m!826289 () Bool)

(assert (=> d!109619 m!826289))

(assert (=> d!109619 m!825975))

(declare-fun m!826291 () Bool)

(assert (=> b!886424 m!826291))

(declare-fun m!826293 () Bool)

(assert (=> b!886432 m!826293))

(declare-fun m!826295 () Bool)

(assert (=> bm!39235 m!826295))

(declare-fun m!826297 () Bool)

(assert (=> b!886423 m!826297))

(assert (=> b!886130 d!109619))

(declare-fun lt!401126 () Bool)

(declare-fun d!109625 () Bool)

(assert (=> d!109625 (= lt!401126 (set.member (tuple2!11905 key1!49 v2!16) (content!395 lt!401092)))))

(declare-fun e!493414 () Bool)

(assert (=> d!109625 (= lt!401126 e!493414)))

(declare-fun res!601762 () Bool)

(assert (=> d!109625 (=> (not res!601762) (not e!493414))))

(assert (=> d!109625 (= res!601762 (is-Cons!17667 lt!401092))))

(assert (=> d!109625 (= (contains!4295 lt!401092 (tuple2!11905 key1!49 v2!16)) lt!401126)))

(declare-fun b!886435 () Bool)

(declare-fun e!493413 () Bool)

(assert (=> b!886435 (= e!493414 e!493413)))

(declare-fun res!601763 () Bool)

(assert (=> b!886435 (=> res!601763 e!493413)))

(assert (=> b!886435 (= res!601763 (= (h!18798 lt!401092) (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886436 () Bool)

(assert (=> b!886436 (= e!493413 (contains!4295 (t!24948 lt!401092) (tuple2!11905 key1!49 v2!16)))))

(assert (= (and d!109625 res!601762) b!886435))

(assert (= (and b!886435 (not res!601763)) b!886436))

(declare-fun m!826305 () Bool)

(assert (=> d!109625 m!826305))

(declare-fun m!826307 () Bool)

(assert (=> d!109625 m!826307))

(declare-fun m!826309 () Bool)

(assert (=> b!886436 m!826309))

(assert (=> b!886131 d!109625))

(assert (=> b!886168 d!109521))

(declare-fun e!493418 () List!17671)

(declare-fun b!886439 () Bool)

(assert (=> b!886439 (= e!493418 (insertStrictlySorted!297 (t!24948 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun lt!401127 () List!17671)

(declare-fun b!886440 () Bool)

(declare-fun e!493417 () Bool)

(assert (=> b!886440 (= e!493417 (contains!4295 lt!401127 (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886441 () Bool)

(declare-fun e!493419 () List!17671)

(declare-fun e!493421 () List!17671)

(assert (=> b!886441 (= e!493419 e!493421)))

(declare-fun c!93495 () Bool)

(assert (=> b!886441 (= c!93495 (and (is-Cons!17667 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) (= (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun b!886442 () Bool)

(declare-fun call!39241 () List!17671)

(assert (=> b!886442 (= e!493419 call!39241)))

(declare-fun b!886443 () Bool)

(declare-fun e!493420 () List!17671)

(declare-fun call!39240 () List!17671)

(assert (=> b!886443 (= e!493420 call!39240)))

(declare-fun c!93497 () Bool)

(declare-fun b!886444 () Bool)

(assert (=> b!886444 (= c!93497 (and (is-Cons!17667 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) (bvsgt (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> b!886444 (= e!493421 e!493420)))

(declare-fun b!886445 () Bool)

(declare-fun call!39239 () List!17671)

(assert (=> b!886445 (= e!493421 call!39239)))

(declare-fun b!886446 () Bool)

(assert (=> b!886446 (= e!493418 (ite c!93495 (t!24948 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) (ite c!93497 (Cons!17667 (h!18798 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) (t!24948 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)))) Nil!17668)))))

(declare-fun bm!39236 () Bool)

(assert (=> bm!39236 (= call!39239 call!39241)))

(declare-fun d!109629 () Bool)

(assert (=> d!109629 e!493417))

(declare-fun res!601767 () Bool)

(assert (=> d!109629 (=> (not res!601767) (not e!493417))))

(assert (=> d!109629 (= res!601767 (isStrictlySorted!489 lt!401127))))

(assert (=> d!109629 (= lt!401127 e!493419)))

(declare-fun c!93496 () Bool)

(assert (=> d!109629 (= c!93496 (and (is-Cons!17667 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) (bvslt (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109629 (isStrictlySorted!489 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)))))

(assert (=> d!109629 (= (insertStrictlySorted!297 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401127)))

(declare-fun bm!39237 () Bool)

(assert (=> bm!39237 (= call!39240 call!39239)))

(declare-fun b!886447 () Bool)

(assert (=> b!886447 (= e!493420 call!39240)))

(declare-fun bm!39238 () Bool)

(assert (=> bm!39238 (= call!39241 ($colon$colon!547 e!493418 (ite c!93496 (h!18798 (t!24948 (insertStrictlySorted!297 l!906 key1!49 v1!38))) (tuple2!11905 key1!49 v2!16))))))

(declare-fun c!93498 () Bool)

(assert (=> bm!39238 (= c!93498 c!93496)))

(declare-fun b!886448 () Bool)

(declare-fun res!601766 () Bool)

(assert (=> b!886448 (=> (not res!601766) (not e!493417))))

(assert (=> b!886448 (= res!601766 (containsKey!412 lt!401127 key1!49))))

(assert (= (and d!109629 c!93496) b!886442))

(assert (= (and d!109629 (not c!93496)) b!886441))

(assert (= (and b!886441 c!93495) b!886445))

(assert (= (and b!886441 (not c!93495)) b!886444))

(assert (= (and b!886444 c!93497) b!886443))

(assert (= (and b!886444 (not c!93497)) b!886447))

(assert (= (or b!886443 b!886447) bm!39237))

(assert (= (or b!886445 bm!39237) bm!39236))

(assert (= (or b!886442 bm!39236) bm!39238))

(assert (= (and bm!39238 c!93498) b!886439))

(assert (= (and bm!39238 (not c!93498)) b!886446))

(assert (= (and d!109629 res!601767) b!886448))

(assert (= (and b!886448 res!601766) b!886440))

(declare-fun m!826317 () Bool)

(assert (=> d!109629 m!826317))

(assert (=> d!109629 m!826243))

(declare-fun m!826319 () Bool)

(assert (=> b!886440 m!826319))

(declare-fun m!826321 () Bool)

(assert (=> b!886448 m!826321))

(declare-fun m!826325 () Bool)

(assert (=> bm!39238 m!826325))

(declare-fun m!826327 () Bool)

(assert (=> b!886439 m!826327))

(assert (=> b!886110 d!109629))

(declare-fun lt!401128 () Bool)

(declare-fun d!109639 () Bool)

(assert (=> d!109639 (= lt!401128 (set.member (tuple2!11905 key1!49 v2!16) (content!395 lt!401090)))))

(declare-fun e!493431 () Bool)

(assert (=> d!109639 (= lt!401128 e!493431)))

(declare-fun res!601776 () Bool)

(assert (=> d!109639 (=> (not res!601776) (not e!493431))))

(assert (=> d!109639 (= res!601776 (is-Cons!17667 lt!401090))))

(assert (=> d!109639 (= (contains!4295 lt!401090 (tuple2!11905 key1!49 v2!16)) lt!401128)))

(declare-fun b!886457 () Bool)

(declare-fun e!493430 () Bool)

(assert (=> b!886457 (= e!493431 e!493430)))

(declare-fun res!601777 () Bool)

(assert (=> b!886457 (=> res!601777 e!493430)))

(assert (=> b!886457 (= res!601777 (= (h!18798 lt!401090) (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886458 () Bool)

(assert (=> b!886458 (= e!493430 (contains!4295 (t!24948 lt!401090) (tuple2!11905 key1!49 v2!16)))))

(assert (= (and d!109639 res!601776) b!886457))

(assert (= (and b!886457 (not res!601777)) b!886458))

(declare-fun m!826331 () Bool)

(assert (=> d!109639 m!826331))

(declare-fun m!826333 () Bool)

(assert (=> d!109639 m!826333))

(declare-fun m!826335 () Bool)

(assert (=> b!886458 m!826335))

(assert (=> b!886111 d!109639))

(declare-fun d!109643 () Bool)

(declare-fun res!601780 () Bool)

(declare-fun e!493434 () Bool)

(assert (=> d!109643 (=> res!601780 e!493434)))

(assert (=> d!109643 (= res!601780 (and (is-Cons!17667 lt!401097) (= (_1!5963 (h!18798 lt!401097)) key1!49)))))

(assert (=> d!109643 (= (containsKey!412 lt!401097 key1!49) e!493434)))

(declare-fun b!886461 () Bool)

(declare-fun e!493435 () Bool)

(assert (=> b!886461 (= e!493434 e!493435)))

(declare-fun res!601781 () Bool)

(assert (=> b!886461 (=> (not res!601781) (not e!493435))))

(assert (=> b!886461 (= res!601781 (and (or (not (is-Cons!17667 lt!401097)) (bvsle (_1!5963 (h!18798 lt!401097)) key1!49)) (is-Cons!17667 lt!401097) (bvslt (_1!5963 (h!18798 lt!401097)) key1!49)))))

(declare-fun b!886462 () Bool)

(assert (=> b!886462 (= e!493435 (containsKey!412 (t!24948 lt!401097) key1!49))))

(assert (= (and d!109643 (not res!601780)) b!886461))

(assert (= (and b!886461 res!601781) b!886462))

(declare-fun m!826339 () Bool)

(assert (=> b!886462 m!826339))

(assert (=> b!886177 d!109643))

(declare-fun d!109649 () Bool)

(declare-fun res!601783 () Bool)

(declare-fun e!493437 () Bool)

(assert (=> d!109649 (=> res!601783 e!493437)))

(assert (=> d!109649 (= res!601783 (and (is-Cons!17667 lt!401090) (= (_1!5963 (h!18798 lt!401090)) key1!49)))))

(assert (=> d!109649 (= (containsKey!412 lt!401090 key1!49) e!493437)))

(declare-fun b!886464 () Bool)

(declare-fun e!493439 () Bool)

(assert (=> b!886464 (= e!493437 e!493439)))

(declare-fun res!601785 () Bool)

(assert (=> b!886464 (=> (not res!601785) (not e!493439))))

(assert (=> b!886464 (= res!601785 (and (or (not (is-Cons!17667 lt!401090)) (bvsle (_1!5963 (h!18798 lt!401090)) key1!49)) (is-Cons!17667 lt!401090) (bvslt (_1!5963 (h!18798 lt!401090)) key1!49)))))

(declare-fun b!886466 () Bool)

(assert (=> b!886466 (= e!493439 (containsKey!412 (t!24948 lt!401090) key1!49))))

(assert (= (and d!109649 (not res!601783)) b!886464))

(assert (= (and b!886464 res!601785) b!886466))

(declare-fun m!826343 () Bool)

(assert (=> b!886466 m!826343))

(assert (=> b!886119 d!109649))

(declare-fun d!109653 () Bool)

(assert (=> d!109653 (= ($colon$colon!547 e!493256 (ite c!93434 (h!18798 l!906) (tuple2!11905 key1!49 v1!38))) (Cons!17667 (ite c!93434 (h!18798 l!906) (tuple2!11905 key1!49 v1!38)) e!493256))))

(assert (=> bm!39189 d!109653))

(declare-fun d!109655 () Bool)

(declare-fun res!601788 () Bool)

(declare-fun e!493442 () Bool)

(assert (=> d!109655 (=> res!601788 e!493442)))

(assert (=> d!109655 (= res!601788 (and (is-Cons!17667 lt!401099) (= (_1!5963 (h!18798 lt!401099)) key1!49)))))

(assert (=> d!109655 (= (containsKey!412 lt!401099 key1!49) e!493442)))

(declare-fun b!886469 () Bool)

(declare-fun e!493443 () Bool)

(assert (=> b!886469 (= e!493442 e!493443)))

(declare-fun res!601789 () Bool)

(assert (=> b!886469 (=> (not res!601789) (not e!493443))))

(assert (=> b!886469 (= res!601789 (and (or (not (is-Cons!17667 lt!401099)) (bvsle (_1!5963 (h!18798 lt!401099)) key1!49)) (is-Cons!17667 lt!401099) (bvslt (_1!5963 (h!18798 lt!401099)) key1!49)))))

(declare-fun b!886470 () Bool)

(assert (=> b!886470 (= e!493443 (containsKey!412 (t!24948 lt!401099) key1!49))))

(assert (= (and d!109655 (not res!601788)) b!886469))

(assert (= (and b!886469 res!601789) b!886470))

(declare-fun m!826345 () Bool)

(assert (=> b!886470 m!826345))

(assert (=> b!886201 d!109655))

(assert (=> b!886039 d!109503))

(declare-fun e!493446 () List!17671)

(declare-fun b!886472 () Bool)

(assert (=> b!886472 (= e!493446 (insertStrictlySorted!297 (t!24948 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) key1!49 v2!16))))

(declare-fun lt!401129 () List!17671)

(declare-fun b!886473 () Bool)

(declare-fun e!493445 () Bool)

(assert (=> b!886473 (= e!493445 (contains!4295 lt!401129 (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886474 () Bool)

(declare-fun e!493447 () List!17671)

(declare-fun e!493449 () List!17671)

(assert (=> b!886474 (= e!493447 e!493449)))

(declare-fun c!93499 () Bool)

(assert (=> b!886474 (= c!93499 (and (is-Cons!17667 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) (= (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)))) key1!49)))))

(declare-fun b!886475 () Bool)

(declare-fun call!39244 () List!17671)

(assert (=> b!886475 (= e!493447 call!39244)))

(declare-fun b!886476 () Bool)

(declare-fun e!493448 () List!17671)

(declare-fun call!39243 () List!17671)

(assert (=> b!886476 (= e!493448 call!39243)))

(declare-fun b!886477 () Bool)

(declare-fun c!93501 () Bool)

(assert (=> b!886477 (= c!93501 (and (is-Cons!17667 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) (bvsgt (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> b!886477 (= e!493449 e!493448)))

(declare-fun b!886478 () Bool)

(declare-fun call!39242 () List!17671)

(assert (=> b!886478 (= e!493449 call!39242)))

(declare-fun b!886479 () Bool)

(assert (=> b!886479 (= e!493446 (ite c!93499 (t!24948 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) (ite c!93501 (Cons!17667 (h!18798 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) (t!24948 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)))) Nil!17668)))))

(declare-fun bm!39239 () Bool)

(assert (=> bm!39239 (= call!39242 call!39244)))

(declare-fun d!109657 () Bool)

(assert (=> d!109657 e!493445))

(declare-fun res!601791 () Bool)

(assert (=> d!109657 (=> (not res!601791) (not e!493445))))

(assert (=> d!109657 (= res!601791 (isStrictlySorted!489 lt!401129))))

(assert (=> d!109657 (= lt!401129 e!493447)))

(declare-fun c!93500 () Bool)

(assert (=> d!109657 (= c!93500 (and (is-Cons!17667 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) (bvslt (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> d!109657 (isStrictlySorted!489 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)))))

(assert (=> d!109657 (= (insertStrictlySorted!297 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) key1!49 v2!16) lt!401129)))

(declare-fun bm!39240 () Bool)

(assert (=> bm!39240 (= call!39243 call!39242)))

(declare-fun b!886480 () Bool)

(assert (=> b!886480 (= e!493448 call!39243)))

(declare-fun bm!39241 () Bool)

(assert (=> bm!39241 (= call!39244 ($colon$colon!547 e!493446 (ite c!93500 (h!18798 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) (tuple2!11905 key1!49 v2!16))))))

(declare-fun c!93502 () Bool)

(assert (=> bm!39241 (= c!93502 c!93500)))

(declare-fun b!886481 () Bool)

(declare-fun res!601790 () Bool)

(assert (=> b!886481 (=> (not res!601790) (not e!493445))))

(assert (=> b!886481 (= res!601790 (containsKey!412 lt!401129 key1!49))))

(assert (= (and d!109657 c!93500) b!886475))

(assert (= (and d!109657 (not c!93500)) b!886474))

(assert (= (and b!886474 c!93499) b!886478))

(assert (= (and b!886474 (not c!93499)) b!886477))

(assert (= (and b!886477 c!93501) b!886476))

(assert (= (and b!886477 (not c!93501)) b!886480))

(assert (= (or b!886476 b!886480) bm!39240))

(assert (= (or b!886478 bm!39240) bm!39239))

(assert (= (or b!886475 bm!39239) bm!39241))

(assert (= (and bm!39241 c!93502) b!886472))

(assert (= (and bm!39241 (not c!93502)) b!886479))

(assert (= (and d!109657 res!601791) b!886481))

(assert (= (and b!886481 res!601790) b!886473))

(declare-fun m!826347 () Bool)

(assert (=> d!109657 m!826347))

(declare-fun m!826349 () Bool)

(assert (=> d!109657 m!826349))

(declare-fun m!826351 () Bool)

(assert (=> b!886473 m!826351))

(declare-fun m!826353 () Bool)

(assert (=> b!886481 m!826353))

(declare-fun m!826355 () Bool)

(assert (=> bm!39241 m!826355))

(declare-fun m!826357 () Bool)

(assert (=> b!886472 m!826357))

(assert (=> b!886090 d!109657))

(declare-fun lt!401130 () Bool)

(declare-fun d!109659 () Bool)

(assert (=> d!109659 (= lt!401130 (set.member (tuple2!11905 key1!49 v2!16) (content!395 lt!401088)))))

(declare-fun e!493451 () Bool)

(assert (=> d!109659 (= lt!401130 e!493451)))

(declare-fun res!601792 () Bool)

(assert (=> d!109659 (=> (not res!601792) (not e!493451))))

(assert (=> d!109659 (= res!601792 (is-Cons!17667 lt!401088))))

(assert (=> d!109659 (= (contains!4295 lt!401088 (tuple2!11905 key1!49 v2!16)) lt!401130)))

(declare-fun b!886482 () Bool)

(declare-fun e!493450 () Bool)

(assert (=> b!886482 (= e!493451 e!493450)))

(declare-fun res!601793 () Bool)

(assert (=> b!886482 (=> res!601793 e!493450)))

(assert (=> b!886482 (= res!601793 (= (h!18798 lt!401088) (tuple2!11905 key1!49 v2!16)))))

(declare-fun b!886483 () Bool)

(assert (=> b!886483 (= e!493450 (contains!4295 (t!24948 lt!401088) (tuple2!11905 key1!49 v2!16)))))

(assert (= (and d!109659 res!601792) b!886482))

(assert (= (and b!886482 (not res!601793)) b!886483))

(declare-fun m!826359 () Bool)

(assert (=> d!109659 m!826359))

(declare-fun m!826361 () Bool)

(assert (=> d!109659 m!826361))

(declare-fun m!826363 () Bool)

(assert (=> b!886483 m!826363))

(assert (=> b!886091 d!109659))

(declare-fun d!109661 () Bool)

(declare-fun res!601794 () Bool)

(declare-fun e!493452 () Bool)

(assert (=> d!109661 (=> res!601794 e!493452)))

(assert (=> d!109661 (= res!601794 (or (is-Nil!17668 lt!401088) (is-Nil!17668 (t!24948 lt!401088))))))

(assert (=> d!109661 (= (isStrictlySorted!489 lt!401088) e!493452)))

(declare-fun b!886484 () Bool)

(declare-fun e!493453 () Bool)

(assert (=> b!886484 (= e!493452 e!493453)))

(declare-fun res!601795 () Bool)

(assert (=> b!886484 (=> (not res!601795) (not e!493453))))

(assert (=> b!886484 (= res!601795 (bvslt (_1!5963 (h!18798 lt!401088)) (_1!5963 (h!18798 (t!24948 lt!401088)))))))

(declare-fun b!886485 () Bool)

(assert (=> b!886485 (= e!493453 (isStrictlySorted!489 (t!24948 lt!401088)))))

(assert (= (and d!109661 (not res!601794)) b!886484))

(assert (= (and b!886484 res!601795) b!886485))

(declare-fun m!826365 () Bool)

(assert (=> b!886485 m!826365))

(assert (=> d!109509 d!109661))

(declare-fun d!109663 () Bool)

(declare-fun res!601796 () Bool)

(declare-fun e!493454 () Bool)

(assert (=> d!109663 (=> res!601796 e!493454)))

(assert (=> d!109663 (= res!601796 (or (is-Nil!17668 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) (is-Nil!17668 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)))))))

(assert (=> d!109663 (= (isStrictlySorted!489 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38)) e!493454)))

(declare-fun b!886486 () Bool)

(declare-fun e!493455 () Bool)

(assert (=> b!886486 (= e!493454 e!493455)))

(declare-fun res!601797 () Bool)

(assert (=> b!886486 (=> (not res!601797) (not e!493455))))

(assert (=> b!886486 (= res!601797 (bvslt (_1!5963 (h!18798 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))) (_1!5963 (h!18798 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))))))))

(declare-fun b!886487 () Bool)

(assert (=> b!886487 (= e!493455 (isStrictlySorted!489 (t!24948 (insertStrictlySorted!297 (t!24948 l!906) key1!49 v1!38))))))

(assert (= (and d!109663 (not res!601796)) b!886486))

(assert (= (and b!886486 res!601797) b!886487))

(assert (=> b!886487 m!826349))

(assert (=> d!109509 d!109663))

(declare-fun d!109665 () Bool)

(assert (=> d!109665 (= ($colon$colon!547 e!493230 (ite c!93412 (h!18798 (t!24948 l!906)) (tuple2!11905 key1!49 v1!38))) (Cons!17667 (ite c!93412 (h!18798 (t!24948 l!906)) (tuple2!11905 key1!49 v1!38)) e!493230))))

(assert (=> bm!39175 d!109665))

(declare-fun d!109667 () Bool)

(declare-fun lt!401131 () Bool)

(assert (=> d!109667 (= lt!401131 (set.member (tuple2!11905 key1!49 v1!38) (content!395 lt!401093)))))

(declare-fun e!493457 () Bool)

(assert (=> d!109667 (= lt!401131 e!493457)))

(declare-fun res!601798 () Bool)

(assert (=> d!109667 (=> (not res!601798) (not e!493457))))

(assert (=> d!109667 (= res!601798 (is-Cons!17667 lt!401093))))

(assert (=> d!109667 (= (contains!4295 lt!401093 (tuple2!11905 key1!49 v1!38)) lt!401131)))

(declare-fun b!886488 () Bool)

(declare-fun e!493456 () Bool)

(assert (=> b!886488 (= e!493457 e!493456)))

(declare-fun res!601799 () Bool)

(assert (=> b!886488 (=> res!601799 e!493456)))

(assert (=> b!886488 (= res!601799 (= (h!18798 lt!401093) (tuple2!11905 key1!49 v1!38)))))

(declare-fun b!886489 () Bool)

(assert (=> b!886489 (= e!493456 (contains!4295 (t!24948 lt!401093) (tuple2!11905 key1!49 v1!38)))))

(assert (= (and d!109667 res!601798) b!886488))

(assert (= (and b!886488 (not res!601799)) b!886489))

(declare-fun m!826367 () Bool)

(assert (=> d!109667 m!826367))

(declare-fun m!826369 () Bool)

(assert (=> d!109667 m!826369))

(declare-fun m!826371 () Bool)

(assert (=> b!886489 m!826371))

(assert (=> b!886141 d!109667))

(declare-fun d!109669 () Bool)

(assert (=> d!109669 (= ($colon$colon!547 e!493225 (ite c!93408 (h!18798 (t!24948 l!906)) (tuple2!11905 key1!49 v2!16))) (Cons!17667 (ite c!93408 (h!18798 (t!24948 l!906)) (tuple2!11905 key1!49 v2!16)) e!493225))))

(assert (=> bm!39172 d!109669))

(declare-fun d!109671 () Bool)

(declare-fun res!601800 () Bool)

(declare-fun e!493458 () Bool)

(assert (=> d!109671 (=> res!601800 e!493458)))

(assert (=> d!109671 (= res!601800 (or (is-Nil!17668 lt!401093) (is-Nil!17668 (t!24948 lt!401093))))))

(assert (=> d!109671 (= (isStrictlySorted!489 lt!401093) e!493458)))

(declare-fun b!886490 () Bool)

(declare-fun e!493459 () Bool)

(assert (=> b!886490 (= e!493458 e!493459)))

(declare-fun res!601801 () Bool)

(assert (=> b!886490 (=> (not res!601801) (not e!493459))))

(assert (=> b!886490 (= res!601801 (bvslt (_1!5963 (h!18798 lt!401093)) (_1!5963 (h!18798 (t!24948 lt!401093)))))))

(declare-fun b!886491 () Bool)

(assert (=> b!886491 (= e!493459 (isStrictlySorted!489 (t!24948 lt!401093)))))

(assert (= (and d!109671 (not res!601800)) b!886490))

(assert (= (and b!886490 res!601801) b!886491))

(declare-fun m!826373 () Bool)

(assert (=> b!886491 m!826373))

(assert (=> d!109523 d!109671))

(assert (=> d!109523 d!109503))

(declare-fun d!109673 () Bool)

(assert (=> d!109673 (= ($colon$colon!547 e!493215 (ite c!93400 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (tuple2!11905 key1!49 v2!16))) (Cons!17667 (ite c!93400 (h!18798 (insertStrictlySorted!297 l!906 key1!49 v1!38)) (tuple2!11905 key1!49 v2!16)) e!493215))))

(assert (=> bm!39166 d!109673))

(declare-fun d!109675 () Bool)

(declare-fun res!601802 () Bool)

(declare-fun e!493460 () Bool)

(assert (=> d!109675 (=> res!601802 e!493460)))

(assert (=> d!109675 (= res!601802 (and (is-Cons!17667 lt!401092) (= (_1!5963 (h!18798 lt!401092)) key1!49)))))

(assert (=> d!109675 (= (containsKey!412 lt!401092 key1!49) e!493460)))

(declare-fun b!886492 () Bool)

(declare-fun e!493461 () Bool)

(assert (=> b!886492 (= e!493460 e!493461)))

(declare-fun res!601803 () Bool)

(assert (=> b!886492 (=> (not res!601803) (not e!493461))))

(assert (=> b!886492 (= res!601803 (and (or (not (is-Cons!17667 lt!401092)) (bvsle (_1!5963 (h!18798 lt!401092)) key1!49)) (is-Cons!17667 lt!401092) (bvslt (_1!5963 (h!18798 lt!401092)) key1!49)))))

(declare-fun b!886493 () Bool)

(assert (=> b!886493 (= e!493461 (containsKey!412 (t!24948 lt!401092) key1!49))))

(assert (= (and d!109675 (not res!601802)) b!886492))

(assert (= (and b!886492 res!601803) b!886493))

(declare-fun m!826375 () Bool)

(assert (=> b!886493 m!826375))

(assert (=> b!886139 d!109675))

(declare-fun d!109677 () Bool)

(assert (=> d!109677 (= ($colon$colon!547 e!493244 (ite c!93424 (h!18798 l!906) (tuple2!11905 key1!49 v2!16))) (Cons!17667 (ite c!93424 (h!18798 l!906) (tuple2!11905 key1!49 v2!16)) e!493244))))

(assert (=> bm!39181 d!109677))

(declare-fun b!886494 () Bool)

(declare-fun e!493462 () Bool)

(declare-fun tp!54382 () Bool)

(assert (=> b!886494 (= e!493462 (and tp_is_empty!17809 tp!54382))))

(assert (=> b!886230 (= tp!54374 e!493462)))

(assert (= (and b!886230 (is-Cons!17667 (t!24948 (t!24948 l!906)))) b!886494))

(push 1)

(assert (not b!886483))

(assert (not d!109639))

(assert (not d!109619))

(assert (not d!109571))

(assert (not d!109629))

(assert (not bm!39235))

(assert (not b!886380))

(assert (not b!886493))

(assert (not b!886448))

(assert (not d!109625))

(assert (not b!886420))

(assert (not b!886491))

(assert (not b!886362))

(assert (not d!109557))

(assert (not b!886487))

(assert (not b!886439))

(assert (not d!109667))

(assert (not b!886404))

(assert (not b!886366))

(assert (not b!886350))

(assert (not b!886458))

(assert (not b!886424))

(assert (not bm!39238))

(assert (not b!886440))

(assert (not b!886364))

(assert (not b!886472))

(assert (not d!109659))

(assert (not b!886378))

(assert (not b!886374))

(assert (not b!886423))

(assert (not d!109657))

(assert (not b!886462))

(assert (not b!886473))

(assert (not b!886470))

(assert (not b!886489))

(assert (not b!886395))

(assert (not b!886481))

(assert (not b!886320))

(assert (not b!886396))

(assert (not bm!39232))

(assert (not b!886466))

(assert tp_is_empty!17809)

(assert (not d!109599))

(assert (not b!886432))

(assert (not b!886436))

(assert (not b!886485))

(assert (not b!886494))

(assert (not d!109607))

(assert (not b!886422))

(assert (not bm!39241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

