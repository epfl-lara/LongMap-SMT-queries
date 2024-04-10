; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132954 () Bool)

(assert start!132954)

(declare-fun b!1556789 () Bool)

(declare-fun res!1064963 () Bool)

(declare-fun e!867126 () Bool)

(assert (=> b!1556789 (=> (not res!1064963) (not e!867126))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2358 0))(
  ( (B!2359 (val!19265 Int)) )
))
(declare-datatypes ((tuple2!24906 0))(
  ( (tuple2!24907 (_1!12464 (_ BitVec 64)) (_2!12464 B!2358)) )
))
(declare-datatypes ((List!36299 0))(
  ( (Nil!36296) (Cons!36295 (h!37741 tuple2!24906) (t!51023 List!36299)) )
))
(declare-fun l!1177 () List!36299)

(assert (=> b!1556789 (= res!1064963 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36295 l!1177)) (= (_1!12464 (h!37741 l!1177)) otherKey!50))))))

(declare-fun b!1556792 () Bool)

(declare-fun e!867127 () Bool)

(declare-fun tp_is_empty!38369 () Bool)

(declare-fun tp!112452 () Bool)

(assert (=> b!1556792 (= e!867127 (and tp_is_empty!38369 tp!112452))))

(declare-fun b!1556791 () Bool)

(declare-fun lt!670463 () List!36299)

(declare-fun e!867128 () Bool)

(declare-datatypes ((Option!856 0))(
  ( (Some!855 (v!22043 B!2358)) (None!854) )
))
(declare-fun getValueByKey!780 (List!36299 (_ BitVec 64)) Option!856)

(assert (=> b!1556791 (= e!867128 (not (= (getValueByKey!780 lt!670463 otherKey!50) (getValueByKey!780 l!1177 otherKey!50))))))

(declare-fun res!1064965 () Bool)

(assert (=> start!132954 (=> (not res!1064965) (not e!867126))))

(declare-fun isStrictlySorted!952 (List!36299) Bool)

(assert (=> start!132954 (= res!1064965 (isStrictlySorted!952 l!1177))))

(assert (=> start!132954 e!867126))

(assert (=> start!132954 e!867127))

(assert (=> start!132954 true))

(assert (=> start!132954 tp_is_empty!38369))

(declare-fun b!1556790 () Bool)

(assert (=> b!1556790 (= e!867126 e!867128)))

(declare-fun res!1064964 () Bool)

(assert (=> b!1556790 (=> res!1064964 e!867128)))

(declare-fun containsKey!814 (List!36299 (_ BitVec 64)) Bool)

(assert (=> b!1556790 (= res!1064964 (not (= (containsKey!814 lt!670463 otherKey!50) (containsKey!814 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2358)

(declare-fun insertStrictlySorted!554 (List!36299 (_ BitVec 64) B!2358) List!36299)

(assert (=> b!1556790 (= lt!670463 (insertStrictlySorted!554 l!1177 newKey!105 newValue!105))))

(assert (= (and start!132954 res!1064965) b!1556789))

(assert (= (and b!1556789 res!1064963) b!1556790))

(assert (= (and b!1556790 (not res!1064964)) b!1556791))

(assert (= (and start!132954 (is-Cons!36295 l!1177)) b!1556792))

(declare-fun m!1434189 () Bool)

(assert (=> b!1556791 m!1434189))

(declare-fun m!1434191 () Bool)

(assert (=> b!1556791 m!1434191))

(declare-fun m!1434193 () Bool)

(assert (=> start!132954 m!1434193))

(declare-fun m!1434195 () Bool)

(assert (=> b!1556790 m!1434195))

(declare-fun m!1434197 () Bool)

(assert (=> b!1556790 m!1434197))

(declare-fun m!1434199 () Bool)

(assert (=> b!1556790 m!1434199))

(push 1)

(assert (not b!1556790))

(assert (not start!132954))

(assert (not b!1556792))

(assert tp_is_empty!38369)

(assert (not b!1556791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162299 () Bool)

(declare-fun res!1064980 () Bool)

(declare-fun e!867143 () Bool)

(assert (=> d!162299 (=> res!1064980 e!867143)))

(assert (=> d!162299 (= res!1064980 (and (is-Cons!36295 lt!670463) (= (_1!12464 (h!37741 lt!670463)) otherKey!50)))))

(assert (=> d!162299 (= (containsKey!814 lt!670463 otherKey!50) e!867143)))

(declare-fun b!1556805 () Bool)

(declare-fun e!867144 () Bool)

(assert (=> b!1556805 (= e!867143 e!867144)))

(declare-fun res!1064981 () Bool)

(assert (=> b!1556805 (=> (not res!1064981) (not e!867144))))

(assert (=> b!1556805 (= res!1064981 (and (or (not (is-Cons!36295 lt!670463)) (bvsle (_1!12464 (h!37741 lt!670463)) otherKey!50)) (is-Cons!36295 lt!670463) (bvslt (_1!12464 (h!37741 lt!670463)) otherKey!50)))))

(declare-fun b!1556806 () Bool)

(assert (=> b!1556806 (= e!867144 (containsKey!814 (t!51023 lt!670463) otherKey!50))))

(assert (= (and d!162299 (not res!1064980)) b!1556805))

(assert (= (and b!1556805 res!1064981) b!1556806))

(declare-fun m!1434205 () Bool)

(assert (=> b!1556806 m!1434205))

(assert (=> b!1556790 d!162299))

(declare-fun d!162307 () Bool)

(declare-fun res!1064984 () Bool)

(declare-fun e!867147 () Bool)

(assert (=> d!162307 (=> res!1064984 e!867147)))

(assert (=> d!162307 (= res!1064984 (and (is-Cons!36295 l!1177) (= (_1!12464 (h!37741 l!1177)) otherKey!50)))))

(assert (=> d!162307 (= (containsKey!814 l!1177 otherKey!50) e!867147)))

(declare-fun b!1556811 () Bool)

(declare-fun e!867148 () Bool)

(assert (=> b!1556811 (= e!867147 e!867148)))

(declare-fun res!1064985 () Bool)

(assert (=> b!1556811 (=> (not res!1064985) (not e!867148))))

(assert (=> b!1556811 (= res!1064985 (and (or (not (is-Cons!36295 l!1177)) (bvsle (_1!12464 (h!37741 l!1177)) otherKey!50)) (is-Cons!36295 l!1177) (bvslt (_1!12464 (h!37741 l!1177)) otherKey!50)))))

(declare-fun b!1556812 () Bool)

(assert (=> b!1556812 (= e!867148 (containsKey!814 (t!51023 l!1177) otherKey!50))))

(assert (= (and d!162307 (not res!1064984)) b!1556811))

(assert (= (and b!1556811 res!1064985) b!1556812))

(declare-fun m!1434207 () Bool)

(assert (=> b!1556812 m!1434207))

(assert (=> b!1556790 d!162307))

(declare-fun b!1556914 () Bool)

(declare-fun e!867208 () List!36299)

(declare-fun call!71648 () List!36299)

(assert (=> b!1556914 (= e!867208 call!71648)))

(declare-fun bm!71644 () Bool)

(declare-fun e!867209 () List!36299)

(declare-fun call!71649 () List!36299)

(declare-fun c!143883 () Bool)

(declare-fun $colon$colon!970 (List!36299 tuple2!24906) List!36299)

(assert (=> bm!71644 (= call!71649 ($colon$colon!970 e!867209 (ite c!143883 (h!37741 l!1177) (tuple2!24907 newKey!105 newValue!105))))))

(declare-fun c!143886 () Bool)

(assert (=> bm!71644 (= c!143886 c!143883)))

(declare-fun bm!71645 () Bool)

(declare-fun call!71647 () List!36299)

(assert (=> bm!71645 (= call!71648 call!71647)))

(declare-fun b!1556915 () Bool)

(declare-fun c!143884 () Bool)

(assert (=> b!1556915 (= c!143884 (and (is-Cons!36295 l!1177) (bvsgt (_1!12464 (h!37741 l!1177)) newKey!105)))))

(declare-fun e!867206 () List!36299)

(assert (=> b!1556915 (= e!867206 e!867208)))

(declare-fun b!1556916 () Bool)

(declare-fun c!143885 () Bool)

(assert (=> b!1556916 (= e!867209 (ite c!143885 (t!51023 l!1177) (ite c!143884 (Cons!36295 (h!37741 l!1177) (t!51023 l!1177)) Nil!36296)))))

(declare-fun b!1556917 () Bool)

(declare-fun e!867207 () List!36299)

(assert (=> b!1556917 (= e!867207 e!867206)))

(assert (=> b!1556917 (= c!143885 (and (is-Cons!36295 l!1177) (= (_1!12464 (h!37741 l!1177)) newKey!105)))))

(declare-fun bm!71646 () Bool)

(assert (=> bm!71646 (= call!71647 call!71649)))

(declare-fun b!1556918 () Bool)

(assert (=> b!1556918 (= e!867207 call!71649)))

(declare-fun d!162309 () Bool)

(declare-fun e!867205 () Bool)

(assert (=> d!162309 e!867205))

(declare-fun res!1065010 () Bool)

(assert (=> d!162309 (=> (not res!1065010) (not e!867205))))

(declare-fun lt!670471 () List!36299)

(assert (=> d!162309 (= res!1065010 (isStrictlySorted!952 lt!670471))))

(assert (=> d!162309 (= lt!670471 e!867207)))

(assert (=> d!162309 (= c!143883 (and (is-Cons!36295 l!1177) (bvslt (_1!12464 (h!37741 l!1177)) newKey!105)))))

(assert (=> d!162309 (isStrictlySorted!952 l!1177)))

(assert (=> d!162309 (= (insertStrictlySorted!554 l!1177 newKey!105 newValue!105) lt!670471)))

(declare-fun b!1556919 () Bool)

(declare-fun res!1065011 () Bool)

(assert (=> b!1556919 (=> (not res!1065011) (not e!867205))))

(assert (=> b!1556919 (= res!1065011 (containsKey!814 lt!670471 newKey!105))))

(declare-fun b!1556920 () Bool)

(declare-fun contains!10187 (List!36299 tuple2!24906) Bool)

(assert (=> b!1556920 (= e!867205 (contains!10187 lt!670471 (tuple2!24907 newKey!105 newValue!105)))))

(declare-fun b!1556921 () Bool)

(assert (=> b!1556921 (= e!867206 call!71647)))

(declare-fun b!1556922 () Bool)

(assert (=> b!1556922 (= e!867208 call!71648)))

(declare-fun b!1556923 () Bool)

(assert (=> b!1556923 (= e!867209 (insertStrictlySorted!554 (t!51023 l!1177) newKey!105 newValue!105))))

(assert (= (and d!162309 c!143883) b!1556918))

(assert (= (and d!162309 (not c!143883)) b!1556917))

(assert (= (and b!1556917 c!143885) b!1556921))

(assert (= (and b!1556917 (not c!143885)) b!1556915))

(assert (= (and b!1556915 c!143884) b!1556922))

(assert (= (and b!1556915 (not c!143884)) b!1556914))

(assert (= (or b!1556922 b!1556914) bm!71645))

(assert (= (or b!1556921 bm!71645) bm!71646))

(assert (= (or b!1556918 bm!71646) bm!71644))

(assert (= (and bm!71644 c!143886) b!1556923))

(assert (= (and bm!71644 (not c!143886)) b!1556916))

(assert (= (and d!162309 res!1065010) b!1556919))

(assert (= (and b!1556919 res!1065011) b!1556920))

(declare-fun m!1434229 () Bool)

(assert (=> d!162309 m!1434229))

(assert (=> d!162309 m!1434193))

(declare-fun m!1434231 () Bool)

(assert (=> b!1556919 m!1434231))

(declare-fun m!1434233 () Bool)

(assert (=> b!1556923 m!1434233))

(declare-fun m!1434235 () Bool)

(assert (=> bm!71644 m!1434235))

(declare-fun m!1434237 () Bool)

(assert (=> b!1556920 m!1434237))

(assert (=> b!1556790 d!162309))

(declare-fun b!1556953 () Bool)

(declare-fun e!867224 () Option!856)

(assert (=> b!1556953 (= e!867224 None!854)))

(declare-fun d!162321 () Bool)

(declare-fun c!143899 () Bool)

(assert (=> d!162321 (= c!143899 (and (is-Cons!36295 lt!670463) (= (_1!12464 (h!37741 lt!670463)) otherKey!50)))))

(declare-fun e!867223 () Option!856)

(assert (=> d!162321 (= (getValueByKey!780 lt!670463 otherKey!50) e!867223)))

(declare-fun b!1556951 () Bool)

(assert (=> b!1556951 (= e!867223 e!867224)))

(declare-fun c!143900 () Bool)

(assert (=> b!1556951 (= c!143900 (and (is-Cons!36295 lt!670463) (not (= (_1!12464 (h!37741 lt!670463)) otherKey!50))))))

(declare-fun b!1556950 () Bool)

(assert (=> b!1556950 (= e!867223 (Some!855 (_2!12464 (h!37741 lt!670463))))))

(declare-fun b!1556952 () Bool)

(assert (=> b!1556952 (= e!867224 (getValueByKey!780 (t!51023 lt!670463) otherKey!50))))

(assert (= (and d!162321 c!143899) b!1556950))

(assert (= (and d!162321 (not c!143899)) b!1556951))

(assert (= (and b!1556951 c!143900) b!1556952))

(assert (= (and b!1556951 (not c!143900)) b!1556953))

(declare-fun m!1434249 () Bool)

(assert (=> b!1556952 m!1434249))

(assert (=> b!1556791 d!162321))

(declare-fun b!1556957 () Bool)

(declare-fun e!867226 () Option!856)

(assert (=> b!1556957 (= e!867226 None!854)))

(declare-fun d!162325 () Bool)

(declare-fun c!143901 () Bool)

(assert (=> d!162325 (= c!143901 (and (is-Cons!36295 l!1177) (= (_1!12464 (h!37741 l!1177)) otherKey!50)))))

(declare-fun e!867225 () Option!856)

(assert (=> d!162325 (= (getValueByKey!780 l!1177 otherKey!50) e!867225)))

(declare-fun b!1556955 () Bool)

(assert (=> b!1556955 (= e!867225 e!867226)))

(declare-fun c!143902 () Bool)

(assert (=> b!1556955 (= c!143902 (and (is-Cons!36295 l!1177) (not (= (_1!12464 (h!37741 l!1177)) otherKey!50))))))

(declare-fun b!1556954 () Bool)

(assert (=> b!1556954 (= e!867225 (Some!855 (_2!12464 (h!37741 l!1177))))))

(declare-fun b!1556956 () Bool)

(assert (=> b!1556956 (= e!867226 (getValueByKey!780 (t!51023 l!1177) otherKey!50))))

(assert (= (and d!162325 c!143901) b!1556954))

(assert (= (and d!162325 (not c!143901)) b!1556955))

(assert (= (and b!1556955 c!143902) b!1556956))

(assert (= (and b!1556955 (not c!143902)) b!1556957))

(declare-fun m!1434251 () Bool)

(assert (=> b!1556956 m!1434251))

(assert (=> b!1556791 d!162325))

(declare-fun d!162327 () Bool)

(declare-fun res!1065022 () Bool)

(declare-fun e!867239 () Bool)

(assert (=> d!162327 (=> res!1065022 e!867239)))

(assert (=> d!162327 (= res!1065022 (or (is-Nil!36296 l!1177) (is-Nil!36296 (t!51023 l!1177))))))

(assert (=> d!162327 (= (isStrictlySorted!952 l!1177) e!867239)))

(declare-fun b!1556974 () Bool)

(declare-fun e!867240 () Bool)

(assert (=> b!1556974 (= e!867239 e!867240)))

(declare-fun res!1065023 () Bool)

(assert (=> b!1556974 (=> (not res!1065023) (not e!867240))))

(assert (=> b!1556974 (= res!1065023 (bvslt (_1!12464 (h!37741 l!1177)) (_1!12464 (h!37741 (t!51023 l!1177)))))))

(declare-fun b!1556975 () Bool)

(assert (=> b!1556975 (= e!867240 (isStrictlySorted!952 (t!51023 l!1177)))))

(assert (= (and d!162327 (not res!1065022)) b!1556974))

(assert (= (and b!1556974 res!1065023) b!1556975))

(declare-fun m!1434257 () Bool)

(assert (=> b!1556975 m!1434257))

(assert (=> start!132954 d!162327))

(declare-fun b!1556980 () Bool)

(declare-fun e!867243 () Bool)

(declare-fun tp!112458 () Bool)

(assert (=> b!1556980 (= e!867243 (and tp_is_empty!38369 tp!112458))))

(assert (=> b!1556792 (= tp!112452 e!867243)))

(assert (= (and b!1556792 (is-Cons!36295 (t!51023 l!1177))) b!1556980))

(push 1)

(assert (not b!1556975))

(assert (not b!1556806))

(assert (not b!1556919))

(assert (not b!1556923))

(assert (not b!1556812))

(assert (not bm!71644))

(assert (not b!1556952))

(assert (not d!162309))

(assert (not b!1556980))

(assert (not b!1556920))

(assert (not b!1556956))

(assert tp_is_empty!38369)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1557061 () Bool)

(declare-fun e!867302 () Option!856)

(assert (=> b!1557061 (= e!867302 None!854)))

(declare-fun d!162373 () Bool)

(declare-fun c!143923 () Bool)

(assert (=> d!162373 (= c!143923 (and (is-Cons!36295 (t!51023 lt!670463)) (= (_1!12464 (h!37741 (t!51023 lt!670463))) otherKey!50)))))

(declare-fun e!867301 () Option!856)

(assert (=> d!162373 (= (getValueByKey!780 (t!51023 lt!670463) otherKey!50) e!867301)))

(declare-fun b!1557059 () Bool)

(assert (=> b!1557059 (= e!867301 e!867302)))

(declare-fun c!143924 () Bool)

(assert (=> b!1557059 (= c!143924 (and (is-Cons!36295 (t!51023 lt!670463)) (not (= (_1!12464 (h!37741 (t!51023 lt!670463))) otherKey!50))))))

(declare-fun b!1557058 () Bool)

(assert (=> b!1557058 (= e!867301 (Some!855 (_2!12464 (h!37741 (t!51023 lt!670463)))))))

(declare-fun b!1557060 () Bool)

(assert (=> b!1557060 (= e!867302 (getValueByKey!780 (t!51023 (t!51023 lt!670463)) otherKey!50))))

(assert (= (and d!162373 c!143923) b!1557058))

(assert (= (and d!162373 (not c!143923)) b!1557059))

(assert (= (and b!1557059 c!143924) b!1557060))

(assert (= (and b!1557059 (not c!143924)) b!1557061))

(declare-fun m!1434321 () Bool)

(assert (=> b!1557060 m!1434321))

(assert (=> b!1556952 d!162373))

(declare-fun d!162375 () Bool)

(declare-fun res!1065062 () Bool)

(declare-fun e!867303 () Bool)

(assert (=> d!162375 (=> res!1065062 e!867303)))

(assert (=> d!162375 (= res!1065062 (and (is-Cons!36295 (t!51023 lt!670463)) (= (_1!12464 (h!37741 (t!51023 lt!670463))) otherKey!50)))))

(assert (=> d!162375 (= (containsKey!814 (t!51023 lt!670463) otherKey!50) e!867303)))

(declare-fun b!1557062 () Bool)

(declare-fun e!867304 () Bool)

(assert (=> b!1557062 (= e!867303 e!867304)))

(declare-fun res!1065063 () Bool)

(assert (=> b!1557062 (=> (not res!1065063) (not e!867304))))

(assert (=> b!1557062 (= res!1065063 (and (or (not (is-Cons!36295 (t!51023 lt!670463))) (bvsle (_1!12464 (h!37741 (t!51023 lt!670463))) otherKey!50)) (is-Cons!36295 (t!51023 lt!670463)) (bvslt (_1!12464 (h!37741 (t!51023 lt!670463))) otherKey!50)))))

(declare-fun b!1557063 () Bool)

(assert (=> b!1557063 (= e!867304 (containsKey!814 (t!51023 (t!51023 lt!670463)) otherKey!50))))

(assert (= (and d!162375 (not res!1065062)) b!1557062))

(assert (= (and b!1557062 res!1065063) b!1557063))

(declare-fun m!1434323 () Bool)

(assert (=> b!1557063 m!1434323))

(assert (=> b!1556806 d!162375))

(declare-fun d!162377 () Bool)

(declare-fun lt!670483 () Bool)

(declare-fun content!801 (List!36299) (Set tuple2!24906))

(assert (=> d!162377 (= lt!670483 (member (tuple2!24907 newKey!105 newValue!105) (content!801 lt!670471)))))

(declare-fun e!867309 () Bool)

(assert (=> d!162377 (= lt!670483 e!867309)))

(declare-fun res!1065068 () Bool)

(assert (=> d!162377 (=> (not res!1065068) (not e!867309))))

(assert (=> d!162377 (= res!1065068 (is-Cons!36295 lt!670471))))

(assert (=> d!162377 (= (contains!10187 lt!670471 (tuple2!24907 newKey!105 newValue!105)) lt!670483)))

(declare-fun b!1557068 () Bool)

(declare-fun e!867310 () Bool)

(assert (=> b!1557068 (= e!867309 e!867310)))

(declare-fun res!1065069 () Bool)

(assert (=> b!1557068 (=> res!1065069 e!867310)))

(assert (=> b!1557068 (= res!1065069 (= (h!37741 lt!670471) (tuple2!24907 newKey!105 newValue!105)))))

(declare-fun b!1557069 () Bool)

(assert (=> b!1557069 (= e!867310 (contains!10187 (t!51023 lt!670471) (tuple2!24907 newKey!105 newValue!105)))))

(assert (= (and d!162377 res!1065068) b!1557068))

(assert (= (and b!1557068 (not res!1065069)) b!1557069))

(declare-fun m!1434325 () Bool)

(assert (=> d!162377 m!1434325))

(declare-fun m!1434327 () Bool)

(assert (=> d!162377 m!1434327))

(declare-fun m!1434329 () Bool)

(assert (=> b!1557069 m!1434329))

(assert (=> b!1556920 d!162377))

(declare-fun d!162379 () Bool)

(declare-fun res!1065070 () Bool)

(declare-fun e!867311 () Bool)

(assert (=> d!162379 (=> res!1065070 e!867311)))

(assert (=> d!162379 (= res!1065070 (or (is-Nil!36296 lt!670471) (is-Nil!36296 (t!51023 lt!670471))))))

(assert (=> d!162379 (= (isStrictlySorted!952 lt!670471) e!867311)))

(declare-fun b!1557070 () Bool)

(declare-fun e!867312 () Bool)

(assert (=> b!1557070 (= e!867311 e!867312)))

(declare-fun res!1065071 () Bool)

(assert (=> b!1557070 (=> (not res!1065071) (not e!867312))))

(assert (=> b!1557070 (= res!1065071 (bvslt (_1!12464 (h!37741 lt!670471)) (_1!12464 (h!37741 (t!51023 lt!670471)))))))

(declare-fun b!1557071 () Bool)

(assert (=> b!1557071 (= e!867312 (isStrictlySorted!952 (t!51023 lt!670471)))))

(assert (= (and d!162379 (not res!1065070)) b!1557070))

(assert (= (and b!1557070 res!1065071) b!1557071))

(declare-fun m!1434331 () Bool)

(assert (=> b!1557071 m!1434331))

(assert (=> d!162309 d!162379))

(assert (=> d!162309 d!162327))

(declare-fun d!162381 () Bool)

(declare-fun res!1065072 () Bool)

(declare-fun e!867313 () Bool)

(assert (=> d!162381 (=> res!1065072 e!867313)))

(assert (=> d!162381 (= res!1065072 (or (is-Nil!36296 (t!51023 l!1177)) (is-Nil!36296 (t!51023 (t!51023 l!1177)))))))

(assert (=> d!162381 (= (isStrictlySorted!952 (t!51023 l!1177)) e!867313)))

(declare-fun b!1557072 () Bool)

(declare-fun e!867314 () Bool)

(assert (=> b!1557072 (= e!867313 e!867314)))

(declare-fun res!1065073 () Bool)

(assert (=> b!1557072 (=> (not res!1065073) (not e!867314))))

(assert (=> b!1557072 (= res!1065073 (bvslt (_1!12464 (h!37741 (t!51023 l!1177))) (_1!12464 (h!37741 (t!51023 (t!51023 l!1177))))))))

(declare-fun b!1557073 () Bool)

(assert (=> b!1557073 (= e!867314 (isStrictlySorted!952 (t!51023 (t!51023 l!1177))))))

(assert (= (and d!162381 (not res!1065072)) b!1557072))

(assert (= (and b!1557072 res!1065073) b!1557073))

(declare-fun m!1434333 () Bool)

(assert (=> b!1557073 m!1434333))

(assert (=> b!1556975 d!162381))

(declare-fun d!162383 () Bool)

(declare-fun res!1065074 () Bool)

(declare-fun e!867315 () Bool)

(assert (=> d!162383 (=> res!1065074 e!867315)))

(assert (=> d!162383 (= res!1065074 (and (is-Cons!36295 lt!670471) (= (_1!12464 (h!37741 lt!670471)) newKey!105)))))

(assert (=> d!162383 (= (containsKey!814 lt!670471 newKey!105) e!867315)))

(declare-fun b!1557074 () Bool)

(declare-fun e!867316 () Bool)

(assert (=> b!1557074 (= e!867315 e!867316)))

(declare-fun res!1065075 () Bool)

(assert (=> b!1557074 (=> (not res!1065075) (not e!867316))))

(assert (=> b!1557074 (= res!1065075 (and (or (not (is-Cons!36295 lt!670471)) (bvsle (_1!12464 (h!37741 lt!670471)) newKey!105)) (is-Cons!36295 lt!670471) (bvslt (_1!12464 (h!37741 lt!670471)) newKey!105)))))

(declare-fun b!1557075 () Bool)

(assert (=> b!1557075 (= e!867316 (containsKey!814 (t!51023 lt!670471) newKey!105))))

(assert (= (and d!162383 (not res!1065074)) b!1557074))

(assert (= (and b!1557074 res!1065075) b!1557075))

(declare-fun m!1434335 () Bool)

(assert (=> b!1557075 m!1434335))

(assert (=> b!1556919 d!162383))

(declare-fun d!162385 () Bool)

(declare-fun res!1065076 () Bool)

(declare-fun e!867317 () Bool)

(assert (=> d!162385 (=> res!1065076 e!867317)))

(assert (=> d!162385 (= res!1065076 (and (is-Cons!36295 (t!51023 l!1177)) (= (_1!12464 (h!37741 (t!51023 l!1177))) otherKey!50)))))

(assert (=> d!162385 (= (containsKey!814 (t!51023 l!1177) otherKey!50) e!867317)))

(declare-fun b!1557076 () Bool)

(declare-fun e!867318 () Bool)

(assert (=> b!1557076 (= e!867317 e!867318)))

(declare-fun res!1065077 () Bool)

(assert (=> b!1557076 (=> (not res!1065077) (not e!867318))))

(assert (=> b!1557076 (= res!1065077 (and (or (not (is-Cons!36295 (t!51023 l!1177))) (bvsle (_1!12464 (h!37741 (t!51023 l!1177))) otherKey!50)) (is-Cons!36295 (t!51023 l!1177)) (bvslt (_1!12464 (h!37741 (t!51023 l!1177))) otherKey!50)))))

(declare-fun b!1557077 () Bool)

(assert (=> b!1557077 (= e!867318 (containsKey!814 (t!51023 (t!51023 l!1177)) otherKey!50))))

(assert (= (and d!162385 (not res!1065076)) b!1557076))

(assert (= (and b!1557076 res!1065077) b!1557077))

(declare-fun m!1434337 () Bool)

(assert (=> b!1557077 m!1434337))

(assert (=> b!1556812 d!162385))

(declare-fun b!1557078 () Bool)

(declare-fun e!867322 () List!36299)

(declare-fun call!71660 () List!36299)

(assert (=> b!1557078 (= e!867322 call!71660)))

(declare-fun call!71661 () List!36299)

(declare-fun e!867323 () List!36299)

(declare-fun c!143925 () Bool)

(declare-fun bm!71656 () Bool)

(assert (=> bm!71656 (= call!71661 ($colon$colon!970 e!867323 (ite c!143925 (h!37741 (t!51023 l!1177)) (tuple2!24907 newKey!105 newValue!105))))))

(declare-fun c!143928 () Bool)

(assert (=> bm!71656 (= c!143928 c!143925)))

(declare-fun bm!71657 () Bool)

(declare-fun call!71659 () List!36299)

(assert (=> bm!71657 (= call!71660 call!71659)))

(declare-fun b!1557079 () Bool)

(declare-fun c!143926 () Bool)

(assert (=> b!1557079 (= c!143926 (and (is-Cons!36295 (t!51023 l!1177)) (bvsgt (_1!12464 (h!37741 (t!51023 l!1177))) newKey!105)))))

(declare-fun e!867320 () List!36299)

(assert (=> b!1557079 (= e!867320 e!867322)))

(declare-fun c!143927 () Bool)

(declare-fun b!1557080 () Bool)

(assert (=> b!1557080 (= e!867323 (ite c!143927 (t!51023 (t!51023 l!1177)) (ite c!143926 (Cons!36295 (h!37741 (t!51023 l!1177)) (t!51023 (t!51023 l!1177))) Nil!36296)))))

(declare-fun b!1557081 () Bool)

(declare-fun e!867321 () List!36299)

(assert (=> b!1557081 (= e!867321 e!867320)))

(assert (=> b!1557081 (= c!143927 (and (is-Cons!36295 (t!51023 l!1177)) (= (_1!12464 (h!37741 (t!51023 l!1177))) newKey!105)))))

(declare-fun bm!71658 () Bool)

(assert (=> bm!71658 (= call!71659 call!71661)))

(declare-fun b!1557082 () Bool)

(assert (=> b!1557082 (= e!867321 call!71661)))

(declare-fun d!162387 () Bool)

(declare-fun e!867319 () Bool)

(assert (=> d!162387 e!867319))

(declare-fun res!1065078 () Bool)

(assert (=> d!162387 (=> (not res!1065078) (not e!867319))))

(declare-fun lt!670484 () List!36299)

(assert (=> d!162387 (= res!1065078 (isStrictlySorted!952 lt!670484))))

(assert (=> d!162387 (= lt!670484 e!867321)))

(assert (=> d!162387 (= c!143925 (and (is-Cons!36295 (t!51023 l!1177)) (bvslt (_1!12464 (h!37741 (t!51023 l!1177))) newKey!105)))))

(assert (=> d!162387 (isStrictlySorted!952 (t!51023 l!1177))))

(assert (=> d!162387 (= (insertStrictlySorted!554 (t!51023 l!1177) newKey!105 newValue!105) lt!670484)))

(declare-fun b!1557083 () Bool)

(declare-fun res!1065079 () Bool)

(assert (=> b!1557083 (=> (not res!1065079) (not e!867319))))

(assert (=> b!1557083 (= res!1065079 (containsKey!814 lt!670484 newKey!105))))

(declare-fun b!1557084 () Bool)

(assert (=> b!1557084 (= e!867319 (contains!10187 lt!670484 (tuple2!24907 newKey!105 newValue!105)))))

(declare-fun b!1557085 () Bool)

(assert (=> b!1557085 (= e!867320 call!71659)))

(declare-fun b!1557086 () Bool)

(assert (=> b!1557086 (= e!867322 call!71660)))

(declare-fun b!1557087 () Bool)

(assert (=> b!1557087 (= e!867323 (insertStrictlySorted!554 (t!51023 (t!51023 l!1177)) newKey!105 newValue!105))))

(assert (= (and d!162387 c!143925) b!1557082))

(assert (= (and d!162387 (not c!143925)) b!1557081))

(assert (= (and b!1557081 c!143927) b!1557085))

(assert (= (and b!1557081 (not c!143927)) b!1557079))

(assert (= (and b!1557079 c!143926) b!1557086))

(assert (= (and b!1557079 (not c!143926)) b!1557078))

(assert (= (or b!1557086 b!1557078) bm!71657))

(assert (= (or b!1557085 bm!71657) bm!71658))

(assert (= (or b!1557082 bm!71658) bm!71656))

(assert (= (and bm!71656 c!143928) b!1557087))

(assert (= (and bm!71656 (not c!143928)) b!1557080))

(assert (= (and d!162387 res!1065078) b!1557083))

(assert (= (and b!1557083 res!1065079) b!1557084))

(declare-fun m!1434339 () Bool)

(assert (=> d!162387 m!1434339))

(assert (=> d!162387 m!1434257))

(declare-fun m!1434341 () Bool)

(assert (=> b!1557083 m!1434341))

(declare-fun m!1434343 () Bool)

(assert (=> b!1557087 m!1434343))

(declare-fun m!1434345 () Bool)

(assert (=> bm!71656 m!1434345))

(declare-fun m!1434347 () Bool)

(assert (=> b!1557084 m!1434347))

(assert (=> b!1556923 d!162387))

(declare-fun b!1557091 () Bool)

(declare-fun e!867325 () Option!856)

(assert (=> b!1557091 (= e!867325 None!854)))

(declare-fun d!162389 () Bool)

(declare-fun c!143929 () Bool)

(assert (=> d!162389 (= c!143929 (and (is-Cons!36295 (t!51023 l!1177)) (= (_1!12464 (h!37741 (t!51023 l!1177))) otherKey!50)))))

(declare-fun e!867324 () Option!856)

(assert (=> d!162389 (= (getValueByKey!780 (t!51023 l!1177) otherKey!50) e!867324)))

(declare-fun b!1557089 () Bool)

(assert (=> b!1557089 (= e!867324 e!867325)))

(declare-fun c!143930 () Bool)

(assert (=> b!1557089 (= c!143930 (and (is-Cons!36295 (t!51023 l!1177)) (not (= (_1!12464 (h!37741 (t!51023 l!1177))) otherKey!50))))))

(declare-fun b!1557088 () Bool)

(assert (=> b!1557088 (= e!867324 (Some!855 (_2!12464 (h!37741 (t!51023 l!1177)))))))

(declare-fun b!1557090 () Bool)

(assert (=> b!1557090 (= e!867325 (getValueByKey!780 (t!51023 (t!51023 l!1177)) otherKey!50))))

(assert (= (and d!162389 c!143929) b!1557088))

(assert (= (and d!162389 (not c!143929)) b!1557089))

(assert (= (and b!1557089 c!143930) b!1557090))

(assert (= (and b!1557089 (not c!143930)) b!1557091))

(declare-fun m!1434349 () Bool)

(assert (=> b!1557090 m!1434349))

(assert (=> b!1556956 d!162389))

(declare-fun d!162391 () Bool)

(assert (=> d!162391 (= ($colon$colon!970 e!867209 (ite c!143883 (h!37741 l!1177) (tuple2!24907 newKey!105 newValue!105))) (Cons!36295 (ite c!143883 (h!37741 l!1177) (tuple2!24907 newKey!105 newValue!105)) e!867209))))

(assert (=> bm!71644 d!162391))

(declare-fun b!1557092 () Bool)

(declare-fun e!867326 () Bool)

(declare-fun tp!112464 () Bool)

(assert (=> b!1557092 (= e!867326 (and tp_is_empty!38369 tp!112464))))

(assert (=> b!1556980 (= tp!112458 e!867326)))

(assert (= (and b!1556980 (is-Cons!36295 (t!51023 (t!51023 l!1177)))) b!1557092))

(push 1)

(assert (not b!1557069))

(assert (not b!1557092))

(assert (not b!1557090))

(assert (not b!1557077))

(assert (not b!1557087))

(assert (not b!1557073))

(assert (not bm!71656))

(assert (not d!162387))

(assert (not b!1557084))

(assert (not d!162377))

(assert (not b!1557063))

(assert (not b!1557083))

(assert (not b!1557071))

(assert tp_is_empty!38369)

(assert (not b!1557075))

(assert (not b!1557060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

