; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132950 () Bool)

(assert start!132950)

(declare-fun b!1556765 () Bool)

(declare-fun res!1064945 () Bool)

(declare-fun e!867110 () Bool)

(assert (=> b!1556765 (=> (not res!1064945) (not e!867110))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2354 0))(
  ( (B!2355 (val!19263 Int)) )
))
(declare-datatypes ((tuple2!24902 0))(
  ( (tuple2!24903 (_1!12462 (_ BitVec 64)) (_2!12462 B!2354)) )
))
(declare-datatypes ((List!36297 0))(
  ( (Nil!36294) (Cons!36293 (h!37739 tuple2!24902) (t!51021 List!36297)) )
))
(declare-fun l!1177 () List!36297)

(assert (=> b!1556765 (= res!1064945 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36293 l!1177)) (= (_1!12462 (h!37739 l!1177)) otherKey!50))))))

(declare-fun res!1064947 () Bool)

(assert (=> start!132950 (=> (not res!1064947) (not e!867110))))

(declare-fun isStrictlySorted!950 (List!36297) Bool)

(assert (=> start!132950 (= res!1064947 (isStrictlySorted!950 l!1177))))

(assert (=> start!132950 e!867110))

(declare-fun e!867109 () Bool)

(assert (=> start!132950 e!867109))

(assert (=> start!132950 true))

(declare-fun tp_is_empty!38365 () Bool)

(assert (=> start!132950 tp_is_empty!38365))

(declare-fun b!1556768 () Bool)

(declare-fun tp!112446 () Bool)

(assert (=> b!1556768 (= e!867109 (and tp_is_empty!38365 tp!112446))))

(declare-fun lt!670457 () List!36297)

(declare-fun e!867108 () Bool)

(declare-fun b!1556767 () Bool)

(declare-datatypes ((Option!854 0))(
  ( (Some!853 (v!22041 B!2354)) (None!852) )
))
(declare-fun getValueByKey!778 (List!36297 (_ BitVec 64)) Option!854)

(assert (=> b!1556767 (= e!867108 (not (= (getValueByKey!778 lt!670457 otherKey!50) (getValueByKey!778 l!1177 otherKey!50))))))

(declare-fun b!1556766 () Bool)

(assert (=> b!1556766 (= e!867110 e!867108)))

(declare-fun res!1064946 () Bool)

(assert (=> b!1556766 (=> res!1064946 e!867108)))

(declare-fun containsKey!812 (List!36297 (_ BitVec 64)) Bool)

(assert (=> b!1556766 (= res!1064946 (not (= (containsKey!812 lt!670457 otherKey!50) (containsKey!812 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2354)

(declare-fun insertStrictlySorted!552 (List!36297 (_ BitVec 64) B!2354) List!36297)

(assert (=> b!1556766 (= lt!670457 (insertStrictlySorted!552 l!1177 newKey!105 newValue!105))))

(assert (= (and start!132950 res!1064947) b!1556765))

(assert (= (and b!1556765 res!1064945) b!1556766))

(assert (= (and b!1556766 (not res!1064946)) b!1556767))

(assert (= (and start!132950 (is-Cons!36293 l!1177)) b!1556768))

(declare-fun m!1434165 () Bool)

(assert (=> start!132950 m!1434165))

(declare-fun m!1434167 () Bool)

(assert (=> b!1556767 m!1434167))

(declare-fun m!1434169 () Bool)

(assert (=> b!1556767 m!1434169))

(declare-fun m!1434171 () Bool)

(assert (=> b!1556766 m!1434171))

(declare-fun m!1434173 () Bool)

(assert (=> b!1556766 m!1434173))

(declare-fun m!1434175 () Bool)

(assert (=> b!1556766 m!1434175))

(push 1)

(assert tp_is_empty!38365)

(assert (not b!1556767))

(assert (not start!132950))

(assert (not b!1556768))

(assert (not b!1556766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162305 () Bool)

(declare-fun res!1064986 () Bool)

(declare-fun e!867149 () Bool)

(assert (=> d!162305 (=> res!1064986 e!867149)))

(assert (=> d!162305 (= res!1064986 (and (is-Cons!36293 lt!670457) (= (_1!12462 (h!37739 lt!670457)) otherKey!50)))))

(assert (=> d!162305 (= (containsKey!812 lt!670457 otherKey!50) e!867149)))

(declare-fun b!1556813 () Bool)

(declare-fun e!867150 () Bool)

(assert (=> b!1556813 (= e!867149 e!867150)))

(declare-fun res!1064987 () Bool)

(assert (=> b!1556813 (=> (not res!1064987) (not e!867150))))

(assert (=> b!1556813 (= res!1064987 (and (or (not (is-Cons!36293 lt!670457)) (bvsle (_1!12462 (h!37739 lt!670457)) otherKey!50)) (is-Cons!36293 lt!670457) (bvslt (_1!12462 (h!37739 lt!670457)) otherKey!50)))))

(declare-fun b!1556814 () Bool)

(assert (=> b!1556814 (= e!867150 (containsKey!812 (t!51021 lt!670457) otherKey!50))))

(assert (= (and d!162305 (not res!1064986)) b!1556813))

(assert (= (and b!1556813 res!1064987) b!1556814))

(declare-fun m!1434209 () Bool)

(assert (=> b!1556814 m!1434209))

(assert (=> b!1556766 d!162305))

(declare-fun d!162311 () Bool)

(declare-fun res!1064988 () Bool)

(declare-fun e!867151 () Bool)

(assert (=> d!162311 (=> res!1064988 e!867151)))

(assert (=> d!162311 (= res!1064988 (and (is-Cons!36293 l!1177) (= (_1!12462 (h!37739 l!1177)) otherKey!50)))))

(assert (=> d!162311 (= (containsKey!812 l!1177 otherKey!50) e!867151)))

(declare-fun b!1556815 () Bool)

(declare-fun e!867152 () Bool)

(assert (=> b!1556815 (= e!867151 e!867152)))

(declare-fun res!1064989 () Bool)

(assert (=> b!1556815 (=> (not res!1064989) (not e!867152))))

(assert (=> b!1556815 (= res!1064989 (and (or (not (is-Cons!36293 l!1177)) (bvsle (_1!12462 (h!37739 l!1177)) otherKey!50)) (is-Cons!36293 l!1177) (bvslt (_1!12462 (h!37739 l!1177)) otherKey!50)))))

(declare-fun b!1556816 () Bool)

(assert (=> b!1556816 (= e!867152 (containsKey!812 (t!51021 l!1177) otherKey!50))))

(assert (= (and d!162311 (not res!1064988)) b!1556815))

(assert (= (and b!1556815 res!1064989) b!1556816))

(declare-fun m!1434211 () Bool)

(assert (=> b!1556816 m!1434211))

(assert (=> b!1556766 d!162311))

(declare-fun b!1556924 () Bool)

(declare-fun res!1065013 () Bool)

(declare-fun e!867212 () Bool)

(assert (=> b!1556924 (=> (not res!1065013) (not e!867212))))

(declare-fun lt!670472 () List!36297)

(assert (=> b!1556924 (= res!1065013 (containsKey!812 lt!670472 newKey!105))))

(declare-fun b!1556925 () Bool)

(declare-fun e!867211 () List!36297)

(declare-fun e!867213 () List!36297)

(assert (=> b!1556925 (= e!867211 e!867213)))

(declare-fun c!143890 () Bool)

(assert (=> b!1556925 (= c!143890 (and (is-Cons!36293 l!1177) (= (_1!12462 (h!37739 l!1177)) newKey!105)))))

(declare-fun d!162313 () Bool)

(assert (=> d!162313 e!867212))

(declare-fun res!1065012 () Bool)

(assert (=> d!162313 (=> (not res!1065012) (not e!867212))))

(assert (=> d!162313 (= res!1065012 (isStrictlySorted!950 lt!670472))))

(assert (=> d!162313 (= lt!670472 e!867211)))

(declare-fun c!143887 () Bool)

(assert (=> d!162313 (= c!143887 (and (is-Cons!36293 l!1177) (bvslt (_1!12462 (h!37739 l!1177)) newKey!105)))))

(assert (=> d!162313 (isStrictlySorted!950 l!1177)))

(assert (=> d!162313 (= (insertStrictlySorted!552 l!1177 newKey!105 newValue!105) lt!670472)))

(declare-fun b!1556926 () Bool)

(declare-fun e!867214 () List!36297)

(declare-fun call!71652 () List!36297)

(assert (=> b!1556926 (= e!867214 call!71652)))

(declare-fun b!1556927 () Bool)

(declare-fun contains!10186 (List!36297 tuple2!24902) Bool)

(assert (=> b!1556927 (= e!867212 (contains!10186 lt!670472 (tuple2!24903 newKey!105 newValue!105)))))

(declare-fun bm!71647 () Bool)

(declare-fun call!71651 () List!36297)

(assert (=> bm!71647 (= call!71652 call!71651)))

(declare-fun bm!71648 () Bool)

(declare-fun e!867210 () List!36297)

(declare-fun call!71650 () List!36297)

(declare-fun $colon$colon!971 (List!36297 tuple2!24902) List!36297)

(assert (=> bm!71648 (= call!71650 ($colon$colon!971 e!867210 (ite c!143887 (h!37739 l!1177) (tuple2!24903 newKey!105 newValue!105))))))

(declare-fun c!143888 () Bool)

(assert (=> bm!71648 (= c!143888 c!143887)))

(declare-fun b!1556928 () Bool)

(assert (=> b!1556928 (= e!867210 (insertStrictlySorted!552 (t!51021 l!1177) newKey!105 newValue!105))))

(declare-fun b!1556929 () Bool)

(assert (=> b!1556929 (= e!867214 call!71652)))

(declare-fun b!1556930 () Bool)

(declare-fun c!143889 () Bool)

(assert (=> b!1556930 (= e!867210 (ite c!143890 (t!51021 l!1177) (ite c!143889 (Cons!36293 (h!37739 l!1177) (t!51021 l!1177)) Nil!36294)))))

(declare-fun b!1556931 () Bool)

(assert (=> b!1556931 (= e!867213 call!71651)))

(declare-fun b!1556932 () Bool)

(assert (=> b!1556932 (= e!867211 call!71650)))

(declare-fun b!1556933 () Bool)

(assert (=> b!1556933 (= c!143889 (and (is-Cons!36293 l!1177) (bvsgt (_1!12462 (h!37739 l!1177)) newKey!105)))))

(assert (=> b!1556933 (= e!867213 e!867214)))

(declare-fun bm!71649 () Bool)

(assert (=> bm!71649 (= call!71651 call!71650)))

(assert (= (and d!162313 c!143887) b!1556932))

(assert (= (and d!162313 (not c!143887)) b!1556925))

(assert (= (and b!1556925 c!143890) b!1556931))

(assert (= (and b!1556925 (not c!143890)) b!1556933))

(assert (= (and b!1556933 c!143889) b!1556929))

(assert (= (and b!1556933 (not c!143889)) b!1556926))

(assert (= (or b!1556929 b!1556926) bm!71647))

(assert (= (or b!1556931 bm!71647) bm!71649))

(assert (= (or b!1556932 bm!71649) bm!71648))

(assert (= (and bm!71648 c!143888) b!1556928))

(assert (= (and bm!71648 (not c!143888)) b!1556930))

(assert (= (and d!162313 res!1065012) b!1556924))

(assert (= (and b!1556924 res!1065013) b!1556927))

(declare-fun m!1434239 () Bool)

(assert (=> bm!71648 m!1434239))

(declare-fun m!1434241 () Bool)

(assert (=> b!1556928 m!1434241))

(declare-fun m!1434243 () Bool)

(assert (=> b!1556927 m!1434243))

(declare-fun m!1434245 () Bool)

(assert (=> d!162313 m!1434245))

(assert (=> d!162313 m!1434165))

(declare-fun m!1434247 () Bool)

(assert (=> b!1556924 m!1434247))

(assert (=> b!1556766 d!162313))

(declare-fun d!162323 () Bool)

(declare-fun c!143903 () Bool)

(assert (=> d!162323 (= c!143903 (and (is-Cons!36293 lt!670457) (= (_1!12462 (h!37739 lt!670457)) otherKey!50)))))

(declare-fun e!867227 () Option!854)

(assert (=> d!162323 (= (getValueByKey!778 lt!670457 otherKey!50) e!867227)))

(declare-fun b!1556959 () Bool)

(declare-fun e!867228 () Option!854)

(assert (=> b!1556959 (= e!867227 e!867228)))

(declare-fun c!143904 () Bool)

(assert (=> b!1556959 (= c!143904 (and (is-Cons!36293 lt!670457) (not (= (_1!12462 (h!37739 lt!670457)) otherKey!50))))))

(declare-fun b!1556961 () Bool)

(assert (=> b!1556961 (= e!867228 None!852)))

(declare-fun b!1556960 () Bool)

(assert (=> b!1556960 (= e!867228 (getValueByKey!778 (t!51021 lt!670457) otherKey!50))))

(declare-fun b!1556958 () Bool)

(assert (=> b!1556958 (= e!867227 (Some!853 (_2!12462 (h!37739 lt!670457))))))

(assert (= (and d!162323 c!143903) b!1556958))

(assert (= (and d!162323 (not c!143903)) b!1556959))

(assert (= (and b!1556959 c!143904) b!1556960))

(assert (= (and b!1556959 (not c!143904)) b!1556961))

(declare-fun m!1434253 () Bool)

(assert (=> b!1556960 m!1434253))

(assert (=> b!1556767 d!162323))

(declare-fun d!162329 () Bool)

(declare-fun c!143905 () Bool)

(assert (=> d!162329 (= c!143905 (and (is-Cons!36293 l!1177) (= (_1!12462 (h!37739 l!1177)) otherKey!50)))))

(declare-fun e!867229 () Option!854)

(assert (=> d!162329 (= (getValueByKey!778 l!1177 otherKey!50) e!867229)))

(declare-fun b!1556963 () Bool)

(declare-fun e!867230 () Option!854)

(assert (=> b!1556963 (= e!867229 e!867230)))

(declare-fun c!143906 () Bool)

(assert (=> b!1556963 (= c!143906 (and (is-Cons!36293 l!1177) (not (= (_1!12462 (h!37739 l!1177)) otherKey!50))))))

(declare-fun b!1556965 () Bool)

(assert (=> b!1556965 (= e!867230 None!852)))

(declare-fun b!1556964 () Bool)

(assert (=> b!1556964 (= e!867230 (getValueByKey!778 (t!51021 l!1177) otherKey!50))))

(declare-fun b!1556962 () Bool)

(assert (=> b!1556962 (= e!867229 (Some!853 (_2!12462 (h!37739 l!1177))))))

(assert (= (and d!162329 c!143905) b!1556962))

(assert (= (and d!162329 (not c!143905)) b!1556963))

(assert (= (and b!1556963 c!143906) b!1556964))

(assert (= (and b!1556963 (not c!143906)) b!1556965))

(declare-fun m!1434255 () Bool)

(assert (=> b!1556964 m!1434255))

(assert (=> b!1556767 d!162329))

(declare-fun d!162331 () Bool)

(declare-fun res!1065024 () Bool)

(declare-fun e!867244 () Bool)

(assert (=> d!162331 (=> res!1065024 e!867244)))

(assert (=> d!162331 (= res!1065024 (or (is-Nil!36294 l!1177) (is-Nil!36294 (t!51021 l!1177))))))

(assert (=> d!162331 (= (isStrictlySorted!950 l!1177) e!867244)))

(declare-fun b!1556981 () Bool)

(declare-fun e!867245 () Bool)

(assert (=> b!1556981 (= e!867244 e!867245)))

(declare-fun res!1065025 () Bool)

(assert (=> b!1556981 (=> (not res!1065025) (not e!867245))))

(assert (=> b!1556981 (= res!1065025 (bvslt (_1!12462 (h!37739 l!1177)) (_1!12462 (h!37739 (t!51021 l!1177)))))))

(declare-fun b!1556982 () Bool)

(assert (=> b!1556982 (= e!867245 (isStrictlySorted!950 (t!51021 l!1177)))))

(assert (= (and d!162331 (not res!1065024)) b!1556981))

(assert (= (and b!1556981 res!1065025) b!1556982))

(declare-fun m!1434259 () Bool)

(assert (=> b!1556982 m!1434259))

(assert (=> start!132950 d!162331))

(declare-fun b!1556987 () Bool)

(declare-fun e!867248 () Bool)

(declare-fun tp!112461 () Bool)

(assert (=> b!1556987 (= e!867248 (and tp_is_empty!38365 tp!112461))))

(assert (=> b!1556768 (= tp!112446 e!867248)))

(assert (= (and b!1556768 (is-Cons!36293 (t!51021 l!1177))) b!1556987))

(push 1)

(assert tp_is_empty!38365)

(assert (not b!1556924))

(assert (not b!1556814))

(assert (not bm!71648))

(assert (not b!1556960))

(assert (not b!1556982))

(assert (not b!1556816))

(assert (not b!1556964))

(assert (not b!1556927))

(assert (not b!1556928))

(assert (not b!1556987))

(assert (not d!162313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162333 () Bool)

(declare-fun c!143907 () Bool)

(assert (=> d!162333 (= c!143907 (and (is-Cons!36293 (t!51021 lt!670457)) (= (_1!12462 (h!37739 (t!51021 lt!670457))) otherKey!50)))))

(declare-fun e!867249 () Option!854)

(assert (=> d!162333 (= (getValueByKey!778 (t!51021 lt!670457) otherKey!50) e!867249)))

(declare-fun b!1556989 () Bool)

(declare-fun e!867250 () Option!854)

(assert (=> b!1556989 (= e!867249 e!867250)))

(declare-fun c!143908 () Bool)

(assert (=> b!1556989 (= c!143908 (and (is-Cons!36293 (t!51021 lt!670457)) (not (= (_1!12462 (h!37739 (t!51021 lt!670457))) otherKey!50))))))

(declare-fun b!1556991 () Bool)

(assert (=> b!1556991 (= e!867250 None!852)))

(declare-fun b!1556990 () Bool)

(assert (=> b!1556990 (= e!867250 (getValueByKey!778 (t!51021 (t!51021 lt!670457)) otherKey!50))))

(declare-fun b!1556988 () Bool)

(assert (=> b!1556988 (= e!867249 (Some!853 (_2!12462 (h!37739 (t!51021 lt!670457)))))))

(assert (= (and d!162333 c!143907) b!1556988))

(assert (= (and d!162333 (not c!143907)) b!1556989))

(assert (= (and b!1556989 c!143908) b!1556990))

(assert (= (and b!1556989 (not c!143908)) b!1556991))

(declare-fun m!1434261 () Bool)

(assert (=> b!1556990 m!1434261))

(assert (=> b!1556960 d!162333))

(declare-fun d!162335 () Bool)

(declare-fun res!1065026 () Bool)

(declare-fun e!867251 () Bool)

(assert (=> d!162335 (=> res!1065026 e!867251)))

(assert (=> d!162335 (= res!1065026 (and (is-Cons!36293 (t!51021 l!1177)) (= (_1!12462 (h!37739 (t!51021 l!1177))) otherKey!50)))))

(assert (=> d!162335 (= (containsKey!812 (t!51021 l!1177) otherKey!50) e!867251)))

(declare-fun b!1556992 () Bool)

(declare-fun e!867252 () Bool)

(assert (=> b!1556992 (= e!867251 e!867252)))

(declare-fun res!1065027 () Bool)

(assert (=> b!1556992 (=> (not res!1065027) (not e!867252))))

(assert (=> b!1556992 (= res!1065027 (and (or (not (is-Cons!36293 (t!51021 l!1177))) (bvsle (_1!12462 (h!37739 (t!51021 l!1177))) otherKey!50)) (is-Cons!36293 (t!51021 l!1177)) (bvslt (_1!12462 (h!37739 (t!51021 l!1177))) otherKey!50)))))

(declare-fun b!1556993 () Bool)

(assert (=> b!1556993 (= e!867252 (containsKey!812 (t!51021 (t!51021 l!1177)) otherKey!50))))

(assert (= (and d!162335 (not res!1065026)) b!1556992))

(assert (= (and b!1556992 res!1065027) b!1556993))

(declare-fun m!1434263 () Bool)

(assert (=> b!1556993 m!1434263))

(assert (=> b!1556816 d!162335))

(declare-fun d!162337 () Bool)

(declare-fun res!1065028 () Bool)

(declare-fun e!867253 () Bool)

(assert (=> d!162337 (=> res!1065028 e!867253)))

(assert (=> d!162337 (= res!1065028 (and (is-Cons!36293 (t!51021 lt!670457)) (= (_1!12462 (h!37739 (t!51021 lt!670457))) otherKey!50)))))

(assert (=> d!162337 (= (containsKey!812 (t!51021 lt!670457) otherKey!50) e!867253)))

(declare-fun b!1556994 () Bool)

(declare-fun e!867254 () Bool)

(assert (=> b!1556994 (= e!867253 e!867254)))

(declare-fun res!1065029 () Bool)

(assert (=> b!1556994 (=> (not res!1065029) (not e!867254))))

(assert (=> b!1556994 (= res!1065029 (and (or (not (is-Cons!36293 (t!51021 lt!670457))) (bvsle (_1!12462 (h!37739 (t!51021 lt!670457))) otherKey!50)) (is-Cons!36293 (t!51021 lt!670457)) (bvslt (_1!12462 (h!37739 (t!51021 lt!670457))) otherKey!50)))))

(declare-fun b!1556995 () Bool)

(assert (=> b!1556995 (= e!867254 (containsKey!812 (t!51021 (t!51021 lt!670457)) otherKey!50))))

(assert (= (and d!162337 (not res!1065028)) b!1556994))

(assert (= (and b!1556994 res!1065029) b!1556995))

(declare-fun m!1434265 () Bool)

(assert (=> b!1556995 m!1434265))

(assert (=> b!1556814 d!162337))

(declare-fun b!1556996 () Bool)

(declare-fun res!1065031 () Bool)

(declare-fun e!867257 () Bool)

(assert (=> b!1556996 (=> (not res!1065031) (not e!867257))))

(declare-fun lt!670473 () List!36297)

(assert (=> b!1556996 (= res!1065031 (containsKey!812 lt!670473 newKey!105))))

(declare-fun b!1556997 () Bool)

(declare-fun e!867256 () List!36297)

(declare-fun e!867258 () List!36297)

(assert (=> b!1556997 (= e!867256 e!867258)))

(declare-fun c!143912 () Bool)

(assert (=> b!1556997 (= c!143912 (and (is-Cons!36293 (t!51021 l!1177)) (= (_1!12462 (h!37739 (t!51021 l!1177))) newKey!105)))))

(declare-fun d!162339 () Bool)

(assert (=> d!162339 e!867257))

(declare-fun res!1065030 () Bool)

(assert (=> d!162339 (=> (not res!1065030) (not e!867257))))

(assert (=> d!162339 (= res!1065030 (isStrictlySorted!950 lt!670473))))

(assert (=> d!162339 (= lt!670473 e!867256)))

(declare-fun c!143909 () Bool)

(assert (=> d!162339 (= c!143909 (and (is-Cons!36293 (t!51021 l!1177)) (bvslt (_1!12462 (h!37739 (t!51021 l!1177))) newKey!105)))))

(assert (=> d!162339 (isStrictlySorted!950 (t!51021 l!1177))))

(assert (=> d!162339 (= (insertStrictlySorted!552 (t!51021 l!1177) newKey!105 newValue!105) lt!670473)))

(declare-fun b!1556998 () Bool)

(declare-fun e!867259 () List!36297)

(declare-fun call!71655 () List!36297)

(assert (=> b!1556998 (= e!867259 call!71655)))

(declare-fun b!1556999 () Bool)

(assert (=> b!1556999 (= e!867257 (contains!10186 lt!670473 (tuple2!24903 newKey!105 newValue!105)))))

(declare-fun bm!71650 () Bool)

(declare-fun call!71654 () List!36297)

(assert (=> bm!71650 (= call!71655 call!71654)))

(declare-fun call!71653 () List!36297)

(declare-fun bm!71651 () Bool)

(declare-fun e!867255 () List!36297)

(assert (=> bm!71651 (= call!71653 ($colon$colon!971 e!867255 (ite c!143909 (h!37739 (t!51021 l!1177)) (tuple2!24903 newKey!105 newValue!105))))))

(declare-fun c!143910 () Bool)

(assert (=> bm!71651 (= c!143910 c!143909)))

(declare-fun b!1557000 () Bool)

(assert (=> b!1557000 (= e!867255 (insertStrictlySorted!552 (t!51021 (t!51021 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1557001 () Bool)

(assert (=> b!1557001 (= e!867259 call!71655)))

(declare-fun b!1557002 () Bool)

(declare-fun c!143911 () Bool)

(assert (=> b!1557002 (= e!867255 (ite c!143912 (t!51021 (t!51021 l!1177)) (ite c!143911 (Cons!36293 (h!37739 (t!51021 l!1177)) (t!51021 (t!51021 l!1177))) Nil!36294)))))

(declare-fun b!1557003 () Bool)

(assert (=> b!1557003 (= e!867258 call!71654)))

(declare-fun b!1557004 () Bool)

(assert (=> b!1557004 (= e!867256 call!71653)))

(declare-fun b!1557005 () Bool)

(assert (=> b!1557005 (= c!143911 (and (is-Cons!36293 (t!51021 l!1177)) (bvsgt (_1!12462 (h!37739 (t!51021 l!1177))) newKey!105)))))

(assert (=> b!1557005 (= e!867258 e!867259)))

(declare-fun bm!71652 () Bool)

(assert (=> bm!71652 (= call!71654 call!71653)))

(assert (= (and d!162339 c!143909) b!1557004))

(assert (= (and d!162339 (not c!143909)) b!1556997))

(assert (= (and b!1556997 c!143912) b!1557003))

(assert (= (and b!1556997 (not c!143912)) b!1557005))

(assert (= (and b!1557005 c!143911) b!1557001))

(assert (= (and b!1557005 (not c!143911)) b!1556998))

(assert (= (or b!1557001 b!1556998) bm!71650))

(assert (= (or b!1557003 bm!71650) bm!71652))

(assert (= (or b!1557004 bm!71652) bm!71651))

(assert (= (and bm!71651 c!143910) b!1557000))

(assert (= (and bm!71651 (not c!143910)) b!1557002))

(assert (= (and d!162339 res!1065030) b!1556996))

(assert (= (and b!1556996 res!1065031) b!1556999))

(declare-fun m!1434267 () Bool)

(assert (=> bm!71651 m!1434267))

(declare-fun m!1434269 () Bool)

(assert (=> b!1557000 m!1434269))

(declare-fun m!1434271 () Bool)

(assert (=> b!1556999 m!1434271))

(declare-fun m!1434273 () Bool)

(assert (=> d!162339 m!1434273))

(assert (=> d!162339 m!1434259))

(declare-fun m!1434275 () Bool)

(assert (=> b!1556996 m!1434275))

(assert (=> b!1556928 d!162339))

(declare-fun d!162341 () Bool)

(declare-fun res!1065032 () Bool)

(declare-fun e!867260 () Bool)

(assert (=> d!162341 (=> res!1065032 e!867260)))

(assert (=> d!162341 (= res!1065032 (and (is-Cons!36293 lt!670472) (= (_1!12462 (h!37739 lt!670472)) newKey!105)))))

(assert (=> d!162341 (= (containsKey!812 lt!670472 newKey!105) e!867260)))

(declare-fun b!1557006 () Bool)

(declare-fun e!867261 () Bool)

(assert (=> b!1557006 (= e!867260 e!867261)))

(declare-fun res!1065033 () Bool)

(assert (=> b!1557006 (=> (not res!1065033) (not e!867261))))

(assert (=> b!1557006 (= res!1065033 (and (or (not (is-Cons!36293 lt!670472)) (bvsle (_1!12462 (h!37739 lt!670472)) newKey!105)) (is-Cons!36293 lt!670472) (bvslt (_1!12462 (h!37739 lt!670472)) newKey!105)))))

(declare-fun b!1557007 () Bool)

(assert (=> b!1557007 (= e!867261 (containsKey!812 (t!51021 lt!670472) newKey!105))))

(assert (= (and d!162341 (not res!1065032)) b!1557006))

(assert (= (and b!1557006 res!1065033) b!1557007))

(declare-fun m!1434277 () Bool)

(assert (=> b!1557007 m!1434277))

(assert (=> b!1556924 d!162341))

(declare-fun d!162343 () Bool)

(assert (=> d!162343 (= ($colon$colon!971 e!867210 (ite c!143887 (h!37739 l!1177) (tuple2!24903 newKey!105 newValue!105))) (Cons!36293 (ite c!143887 (h!37739 l!1177) (tuple2!24903 newKey!105 newValue!105)) e!867210))))

(assert (=> bm!71648 d!162343))

(declare-fun lt!670476 () Bool)

(declare-fun d!162345 () Bool)

(declare-fun content!799 (List!36297) (Set tuple2!24902))

(assert (=> d!162345 (= lt!670476 (set.member (tuple2!24903 newKey!105 newValue!105) (content!799 lt!670472)))))

(declare-fun e!867267 () Bool)

(assert (=> d!162345 (= lt!670476 e!867267)))

(declare-fun res!1065038 () Bool)

(assert (=> d!162345 (=> (not res!1065038) (not e!867267))))

(assert (=> d!162345 (= res!1065038 (is-Cons!36293 lt!670472))))

(assert (=> d!162345 (= (contains!10186 lt!670472 (tuple2!24903 newKey!105 newValue!105)) lt!670476)))

(declare-fun b!1557012 () Bool)

(declare-fun e!867266 () Bool)

(assert (=> b!1557012 (= e!867267 e!867266)))

(declare-fun res!1065039 () Bool)

(assert (=> b!1557012 (=> res!1065039 e!867266)))

(assert (=> b!1557012 (= res!1065039 (= (h!37739 lt!670472) (tuple2!24903 newKey!105 newValue!105)))))

(declare-fun b!1557013 () Bool)

(assert (=> b!1557013 (= e!867266 (contains!10186 (t!51021 lt!670472) (tuple2!24903 newKey!105 newValue!105)))))

(assert (= (and d!162345 res!1065038) b!1557012))

(assert (= (and b!1557012 (not res!1065039)) b!1557013))

(declare-fun m!1434279 () Bool)

(assert (=> d!162345 m!1434279))

(declare-fun m!1434281 () Bool)

(assert (=> d!162345 m!1434281))

(declare-fun m!1434283 () Bool)

(assert (=> b!1557013 m!1434283))

(assert (=> b!1556927 d!162345))

(declare-fun d!162347 () Bool)

(declare-fun c!143913 () Bool)

(assert (=> d!162347 (= c!143913 (and (is-Cons!36293 (t!51021 l!1177)) (= (_1!12462 (h!37739 (t!51021 l!1177))) otherKey!50)))))

(declare-fun e!867268 () Option!854)

(assert (=> d!162347 (= (getValueByKey!778 (t!51021 l!1177) otherKey!50) e!867268)))

(declare-fun b!1557015 () Bool)

(declare-fun e!867269 () Option!854)

(assert (=> b!1557015 (= e!867268 e!867269)))

(declare-fun c!143914 () Bool)

(assert (=> b!1557015 (= c!143914 (and (is-Cons!36293 (t!51021 l!1177)) (not (= (_1!12462 (h!37739 (t!51021 l!1177))) otherKey!50))))))

(declare-fun b!1557017 () Bool)

(assert (=> b!1557017 (= e!867269 None!852)))

(declare-fun b!1557016 () Bool)

(assert (=> b!1557016 (= e!867269 (getValueByKey!778 (t!51021 (t!51021 l!1177)) otherKey!50))))

(declare-fun b!1557014 () Bool)

(assert (=> b!1557014 (= e!867268 (Some!853 (_2!12462 (h!37739 (t!51021 l!1177)))))))

(assert (= (and d!162347 c!143913) b!1557014))

(assert (= (and d!162347 (not c!143913)) b!1557015))

(assert (= (and b!1557015 c!143914) b!1557016))

(assert (= (and b!1557015 (not c!143914)) b!1557017))

(declare-fun m!1434285 () Bool)

(assert (=> b!1557016 m!1434285))

(assert (=> b!1556964 d!162347))

(declare-fun d!162349 () Bool)

(declare-fun res!1065040 () Bool)

(declare-fun e!867270 () Bool)

(assert (=> d!162349 (=> res!1065040 e!867270)))

(assert (=> d!162349 (= res!1065040 (or (is-Nil!36294 (t!51021 l!1177)) (is-Nil!36294 (t!51021 (t!51021 l!1177)))))))

(assert (=> d!162349 (= (isStrictlySorted!950 (t!51021 l!1177)) e!867270)))

(declare-fun b!1557018 () Bool)

(declare-fun e!867271 () Bool)

(assert (=> b!1557018 (= e!867270 e!867271)))

(declare-fun res!1065041 () Bool)

(assert (=> b!1557018 (=> (not res!1065041) (not e!867271))))

(assert (=> b!1557018 (= res!1065041 (bvslt (_1!12462 (h!37739 (t!51021 l!1177))) (_1!12462 (h!37739 (t!51021 (t!51021 l!1177))))))))

(declare-fun b!1557019 () Bool)

(assert (=> b!1557019 (= e!867271 (isStrictlySorted!950 (t!51021 (t!51021 l!1177))))))

(assert (= (and d!162349 (not res!1065040)) b!1557018))

(assert (= (and b!1557018 res!1065041) b!1557019))

(declare-fun m!1434287 () Bool)

(assert (=> b!1557019 m!1434287))

(assert (=> b!1556982 d!162349))

(declare-fun d!162351 () Bool)

(declare-fun res!1065042 () Bool)

(declare-fun e!867272 () Bool)

(assert (=> d!162351 (=> res!1065042 e!867272)))

(assert (=> d!162351 (= res!1065042 (or (is-Nil!36294 lt!670472) (is-Nil!36294 (t!51021 lt!670472))))))

(assert (=> d!162351 (= (isStrictlySorted!950 lt!670472) e!867272)))

(declare-fun b!1557020 () Bool)

(declare-fun e!867273 () Bool)

(assert (=> b!1557020 (= e!867272 e!867273)))

(declare-fun res!1065043 () Bool)

(assert (=> b!1557020 (=> (not res!1065043) (not e!867273))))

(assert (=> b!1557020 (= res!1065043 (bvslt (_1!12462 (h!37739 lt!670472)) (_1!12462 (h!37739 (t!51021 lt!670472)))))))

(declare-fun b!1557021 () Bool)

(assert (=> b!1557021 (= e!867273 (isStrictlySorted!950 (t!51021 lt!670472)))))

(assert (= (and d!162351 (not res!1065042)) b!1557020))

(assert (= (and b!1557020 res!1065043) b!1557021))

(declare-fun m!1434289 () Bool)

(assert (=> b!1557021 m!1434289))

(assert (=> d!162313 d!162351))

(assert (=> d!162313 d!162331))

(declare-fun b!1557022 () Bool)

(declare-fun e!867274 () Bool)

(declare-fun tp!112462 () Bool)

(assert (=> b!1557022 (= e!867274 (and tp_is_empty!38365 tp!112462))))

(assert (=> b!1556987 (= tp!112461 e!867274)))

(assert (= (and b!1556987 (is-Cons!36293 (t!51021 (t!51021 l!1177)))) b!1557022))

(push 1)

(assert (not b!1557007))

(assert (not b!1557021))

(assert (not b!1556999))

(assert (not d!162345))

(assert (not b!1557019))

(assert (not b!1557000))

(assert (not b!1556995))

(assert (not b!1556993))

(assert tp_is_empty!38365)

(assert (not b!1557016))

(assert (not b!1556996))

(assert (not b!1557013))

(assert (not bm!71651))

(assert (not b!1557022))

(assert (not d!162339))

(assert (not b!1556990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

