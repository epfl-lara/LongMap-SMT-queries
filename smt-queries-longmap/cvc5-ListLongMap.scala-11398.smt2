; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132692 () Bool)

(assert start!132692)

(declare-datatypes ((B!2264 0))(
  ( (B!2265 (val!19218 Int)) )
))
(declare-datatypes ((tuple2!24812 0))(
  ( (tuple2!24813 (_1!12417 (_ BitVec 64)) (_2!12417 B!2264)) )
))
(declare-datatypes ((List!36252 0))(
  ( (Nil!36249) (Cons!36248 (h!37694 tuple2!24812) (t!50973 List!36252)) )
))
(declare-fun lt!670172 () List!36252)

(declare-fun b!1554844 () Bool)

(declare-fun e!865829 () Bool)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36252)

(declare-datatypes ((Option!836 0))(
  ( (Some!835 (v!22020 B!2264)) (None!834) )
))
(declare-fun getValueByKey!760 (List!36252 (_ BitVec 64)) Option!836)

(assert (=> b!1554844 (= e!865829 (= (getValueByKey!760 lt!670172 otherKey!50) (getValueByKey!760 (t!50973 l!1177) otherKey!50)))))

(declare-fun b!1554845 () Bool)

(declare-fun res!1063999 () Bool)

(declare-fun e!865828 () Bool)

(assert (=> b!1554845 (=> (not res!1063999) (not e!865828))))

(declare-fun isStrictlySorted!911 (List!36252) Bool)

(assert (=> b!1554845 (= res!1063999 (isStrictlySorted!911 (t!50973 l!1177)))))

(declare-fun b!1554846 () Bool)

(declare-fun res!1063996 () Bool)

(assert (=> b!1554846 (=> (not res!1063996) (not e!865828))))

(declare-fun newKey!105 () (_ BitVec 64))

(assert (=> b!1554846 (= res!1063996 (and (not (= newKey!105 otherKey!50)) (is-Cons!36248 l!1177) (not (= (_1!12417 (h!37694 l!1177)) otherKey!50))))))

(declare-fun b!1554847 () Bool)

(declare-fun e!865827 () Bool)

(declare-fun tp_is_empty!38275 () Bool)

(declare-fun tp!112236 () Bool)

(assert (=> b!1554847 (= e!865827 (and tp_is_empty!38275 tp!112236))))

(declare-fun b!1554848 () Bool)

(declare-fun newValue!105 () B!2264)

(declare-fun insertStrictlySorted!522 (List!36252 (_ BitVec 64) B!2264) List!36252)

(assert (=> b!1554848 (= e!865828 (not (isStrictlySorted!911 (insertStrictlySorted!522 l!1177 newKey!105 newValue!105))))))

(assert (=> b!1554848 e!865829))

(declare-fun res!1063998 () Bool)

(assert (=> b!1554848 (=> (not res!1063998) (not e!865829))))

(declare-fun containsKey!782 (List!36252 (_ BitVec 64)) Bool)

(assert (=> b!1554848 (= res!1063998 (= (containsKey!782 lt!670172 otherKey!50) (containsKey!782 (t!50973 l!1177) otherKey!50)))))

(assert (=> b!1554848 (= lt!670172 (insertStrictlySorted!522 (t!50973 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51808 0))(
  ( (Unit!51809) )
))
(declare-fun lt!670171 () Unit!51808)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (List!36252 (_ BitVec 64) B!2264 (_ BitVec 64)) Unit!51808)

(assert (=> b!1554848 (= lt!670171 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (t!50973 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun res!1063997 () Bool)

(assert (=> start!132692 (=> (not res!1063997) (not e!865828))))

(assert (=> start!132692 (= res!1063997 (isStrictlySorted!911 l!1177))))

(assert (=> start!132692 e!865828))

(assert (=> start!132692 e!865827))

(assert (=> start!132692 true))

(assert (=> start!132692 tp_is_empty!38275))

(assert (= (and start!132692 res!1063997) b!1554846))

(assert (= (and b!1554846 res!1063996) b!1554845))

(assert (= (and b!1554845 res!1063999) b!1554848))

(assert (= (and b!1554848 res!1063998) b!1554844))

(assert (= (and start!132692 (is-Cons!36248 l!1177)) b!1554847))

(declare-fun m!1433049 () Bool)

(assert (=> b!1554844 m!1433049))

(declare-fun m!1433051 () Bool)

(assert (=> b!1554844 m!1433051))

(declare-fun m!1433053 () Bool)

(assert (=> b!1554845 m!1433053))

(declare-fun m!1433055 () Bool)

(assert (=> b!1554848 m!1433055))

(declare-fun m!1433057 () Bool)

(assert (=> b!1554848 m!1433057))

(declare-fun m!1433059 () Bool)

(assert (=> b!1554848 m!1433059))

(declare-fun m!1433061 () Bool)

(assert (=> b!1554848 m!1433061))

(assert (=> b!1554848 m!1433057))

(declare-fun m!1433063 () Bool)

(assert (=> b!1554848 m!1433063))

(declare-fun m!1433065 () Bool)

(assert (=> b!1554848 m!1433065))

(declare-fun m!1433067 () Bool)

(assert (=> start!132692 m!1433067))

(push 1)

(assert (not start!132692))

(assert (not b!1554845))

(assert tp_is_empty!38275)

(assert (not b!1554844))

(assert (not b!1554847))

(assert (not b!1554848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1554930 () Bool)

(declare-fun e!865878 () Option!836)

(declare-fun e!865879 () Option!836)

(assert (=> b!1554930 (= e!865878 e!865879)))

(declare-fun c!143511 () Bool)

(assert (=> b!1554930 (= c!143511 (and (is-Cons!36248 lt!670172) (not (= (_1!12417 (h!37694 lt!670172)) otherKey!50))))))

(declare-fun b!1554931 () Bool)

(assert (=> b!1554931 (= e!865879 (getValueByKey!760 (t!50973 lt!670172) otherKey!50))))

(declare-fun b!1554932 () Bool)

(assert (=> b!1554932 (= e!865879 None!834)))

(declare-fun b!1554929 () Bool)

(assert (=> b!1554929 (= e!865878 (Some!835 (_2!12417 (h!37694 lt!670172))))))

(declare-fun d!161853 () Bool)

(declare-fun c!143510 () Bool)

(assert (=> d!161853 (= c!143510 (and (is-Cons!36248 lt!670172) (= (_1!12417 (h!37694 lt!670172)) otherKey!50)))))

(assert (=> d!161853 (= (getValueByKey!760 lt!670172 otherKey!50) e!865878)))

(assert (= (and d!161853 c!143510) b!1554929))

(assert (= (and d!161853 (not c!143510)) b!1554930))

(assert (= (and b!1554930 c!143511) b!1554931))

(assert (= (and b!1554930 (not c!143511)) b!1554932))

(declare-fun m!1433117 () Bool)

(assert (=> b!1554931 m!1433117))

(assert (=> b!1554844 d!161853))

(declare-fun b!1554936 () Bool)

(declare-fun e!865882 () Option!836)

(declare-fun e!865883 () Option!836)

(assert (=> b!1554936 (= e!865882 e!865883)))

(declare-fun c!143513 () Bool)

(assert (=> b!1554936 (= c!143513 (and (is-Cons!36248 (t!50973 l!1177)) (not (= (_1!12417 (h!37694 (t!50973 l!1177))) otherKey!50))))))

(declare-fun b!1554937 () Bool)

(assert (=> b!1554937 (= e!865883 (getValueByKey!760 (t!50973 (t!50973 l!1177)) otherKey!50))))

(declare-fun b!1554938 () Bool)

(assert (=> b!1554938 (= e!865883 None!834)))

(declare-fun b!1554935 () Bool)

(assert (=> b!1554935 (= e!865882 (Some!835 (_2!12417 (h!37694 (t!50973 l!1177)))))))

(declare-fun d!161863 () Bool)

(declare-fun c!143512 () Bool)

(assert (=> d!161863 (= c!143512 (and (is-Cons!36248 (t!50973 l!1177)) (= (_1!12417 (h!37694 (t!50973 l!1177))) otherKey!50)))))

(assert (=> d!161863 (= (getValueByKey!760 (t!50973 l!1177) otherKey!50) e!865882)))

(assert (= (and d!161863 c!143512) b!1554935))

(assert (= (and d!161863 (not c!143512)) b!1554936))

(assert (= (and b!1554936 c!143513) b!1554937))

(assert (= (and b!1554936 (not c!143513)) b!1554938))

(declare-fun m!1433121 () Bool)

(assert (=> b!1554937 m!1433121))

(assert (=> b!1554844 d!161863))

(declare-fun d!161867 () Bool)

(declare-fun res!1064042 () Bool)

(declare-fun e!865890 () Bool)

(assert (=> d!161867 (=> res!1064042 e!865890)))

(assert (=> d!161867 (= res!1064042 (or (is-Nil!36249 l!1177) (is-Nil!36249 (t!50973 l!1177))))))

(assert (=> d!161867 (= (isStrictlySorted!911 l!1177) e!865890)))

(declare-fun b!1554945 () Bool)

(declare-fun e!865891 () Bool)

(assert (=> b!1554945 (= e!865890 e!865891)))

(declare-fun res!1064043 () Bool)

(assert (=> b!1554945 (=> (not res!1064043) (not e!865891))))

(assert (=> b!1554945 (= res!1064043 (bvslt (_1!12417 (h!37694 l!1177)) (_1!12417 (h!37694 (t!50973 l!1177)))))))

(declare-fun b!1554946 () Bool)

(assert (=> b!1554946 (= e!865891 (isStrictlySorted!911 (t!50973 l!1177)))))

(assert (= (and d!161867 (not res!1064042)) b!1554945))

(assert (= (and b!1554945 res!1064043) b!1554946))

(assert (=> b!1554946 m!1433053))

(assert (=> start!132692 d!161867))

(declare-fun d!161871 () Bool)

(declare-fun res!1064044 () Bool)

(declare-fun e!865892 () Bool)

(assert (=> d!161871 (=> res!1064044 e!865892)))

(assert (=> d!161871 (= res!1064044 (or (is-Nil!36249 (t!50973 l!1177)) (is-Nil!36249 (t!50973 (t!50973 l!1177)))))))

(assert (=> d!161871 (= (isStrictlySorted!911 (t!50973 l!1177)) e!865892)))

(declare-fun b!1554947 () Bool)

(declare-fun e!865893 () Bool)

(assert (=> b!1554947 (= e!865892 e!865893)))

(declare-fun res!1064045 () Bool)

(assert (=> b!1554947 (=> (not res!1064045) (not e!865893))))

(assert (=> b!1554947 (= res!1064045 (bvslt (_1!12417 (h!37694 (t!50973 l!1177))) (_1!12417 (h!37694 (t!50973 (t!50973 l!1177))))))))

(declare-fun b!1554948 () Bool)

(assert (=> b!1554948 (= e!865893 (isStrictlySorted!911 (t!50973 (t!50973 l!1177))))))

(assert (= (and d!161871 (not res!1064044)) b!1554947))

(assert (= (and b!1554947 res!1064045) b!1554948))

(declare-fun m!1433123 () Bool)

(assert (=> b!1554948 m!1433123))

(assert (=> b!1554845 d!161871))

(declare-fun b!1555033 () Bool)

(declare-fun c!143548 () Bool)

(assert (=> b!1555033 (= c!143548 (and (is-Cons!36248 l!1177) (bvsgt (_1!12417 (h!37694 l!1177)) newKey!105)))))

(declare-fun e!865942 () List!36252)

(declare-fun e!865940 () List!36252)

(assert (=> b!1555033 (= e!865942 e!865940)))

(declare-fun bm!71476 () Bool)

(declare-fun call!71479 () List!36252)

(declare-fun call!71481 () List!36252)

(assert (=> bm!71476 (= call!71479 call!71481)))

(declare-fun b!1555034 () Bool)

(declare-fun e!865941 () List!36252)

(assert (=> b!1555034 (= e!865941 call!71481)))

(declare-fun lt!670195 () List!36252)

(declare-fun e!865938 () Bool)

(declare-fun b!1555035 () Bool)

(declare-fun contains!10172 (List!36252 tuple2!24812) Bool)

(assert (=> b!1555035 (= e!865938 (contains!10172 lt!670195 (tuple2!24813 newKey!105 newValue!105)))))

(declare-fun b!1555036 () Bool)

(declare-fun e!865939 () List!36252)

(assert (=> b!1555036 (= e!865939 (insertStrictlySorted!522 (t!50973 l!1177) newKey!105 newValue!105))))

(declare-fun bm!71477 () Bool)

(declare-fun call!71480 () List!36252)

(assert (=> bm!71477 (= call!71480 call!71479)))

(declare-fun d!161873 () Bool)

(assert (=> d!161873 e!865938))

(declare-fun res!1064067 () Bool)

(assert (=> d!161873 (=> (not res!1064067) (not e!865938))))

(assert (=> d!161873 (= res!1064067 (isStrictlySorted!911 lt!670195))))

(assert (=> d!161873 (= lt!670195 e!865941)))

(declare-fun c!143546 () Bool)

(assert (=> d!161873 (= c!143546 (and (is-Cons!36248 l!1177) (bvslt (_1!12417 (h!37694 l!1177)) newKey!105)))))

(assert (=> d!161873 (isStrictlySorted!911 l!1177)))

(assert (=> d!161873 (= (insertStrictlySorted!522 l!1177 newKey!105 newValue!105) lt!670195)))

(declare-fun b!1555037 () Bool)

(assert (=> b!1555037 (= e!865942 call!71479)))

(declare-fun b!1555038 () Bool)

(assert (=> b!1555038 (= e!865940 call!71480)))

(declare-fun b!1555039 () Bool)

(declare-fun res!1064066 () Bool)

(assert (=> b!1555039 (=> (not res!1064066) (not e!865938))))

(assert (=> b!1555039 (= res!1064066 (containsKey!782 lt!670195 newKey!105))))

(declare-fun b!1555040 () Bool)

(assert (=> b!1555040 (= e!865940 call!71480)))

(declare-fun c!143547 () Bool)

(declare-fun b!1555041 () Bool)

(assert (=> b!1555041 (= e!865939 (ite c!143547 (t!50973 l!1177) (ite c!143548 (Cons!36248 (h!37694 l!1177) (t!50973 l!1177)) Nil!36249)))))

(declare-fun bm!71478 () Bool)

(declare-fun $colon$colon!956 (List!36252 tuple2!24812) List!36252)

(assert (=> bm!71478 (= call!71481 ($colon$colon!956 e!865939 (ite c!143546 (h!37694 l!1177) (tuple2!24813 newKey!105 newValue!105))))))

(declare-fun c!143549 () Bool)

(assert (=> bm!71478 (= c!143549 c!143546)))

(declare-fun b!1555042 () Bool)

(assert (=> b!1555042 (= e!865941 e!865942)))

(assert (=> b!1555042 (= c!143547 (and (is-Cons!36248 l!1177) (= (_1!12417 (h!37694 l!1177)) newKey!105)))))

(assert (= (and d!161873 c!143546) b!1555034))

(assert (= (and d!161873 (not c!143546)) b!1555042))

(assert (= (and b!1555042 c!143547) b!1555037))

(assert (= (and b!1555042 (not c!143547)) b!1555033))

(assert (= (and b!1555033 c!143548) b!1555040))

(assert (= (and b!1555033 (not c!143548)) b!1555038))

(assert (= (or b!1555040 b!1555038) bm!71477))

(assert (= (or b!1555037 bm!71477) bm!71476))

(assert (= (or b!1555034 bm!71476) bm!71478))

(assert (= (and bm!71478 c!143549) b!1555036))

(assert (= (and bm!71478 (not c!143549)) b!1555041))

(assert (= (and d!161873 res!1064067) b!1555039))

(assert (= (and b!1555039 res!1064066) b!1555035))

(declare-fun m!1433141 () Bool)

(assert (=> bm!71478 m!1433141))

(declare-fun m!1433143 () Bool)

(assert (=> b!1555035 m!1433143))

(assert (=> b!1555036 m!1433059))

(declare-fun m!1433145 () Bool)

(assert (=> b!1555039 m!1433145))

(declare-fun m!1433147 () Bool)

(assert (=> d!161873 m!1433147))

(assert (=> d!161873 m!1433067))

(assert (=> b!1554848 d!161873))

(declare-fun d!161879 () Bool)

(declare-fun e!865970 () Bool)

(assert (=> d!161879 e!865970))

(declare-fun res!1064093 () Bool)

(assert (=> d!161879 (=> (not res!1064093) (not e!865970))))

(assert (=> d!161879 (= res!1064093 (= (containsKey!782 (insertStrictlySorted!522 (t!50973 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!782 (t!50973 l!1177) otherKey!50)))))

(declare-fun lt!670202 () Unit!51808)

(declare-fun choose!2056 (List!36252 (_ BitVec 64) B!2264 (_ BitVec 64)) Unit!51808)

(assert (=> d!161879 (= lt!670202 (choose!2056 (t!50973 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!865971 () Bool)

(assert (=> d!161879 e!865971))

(declare-fun res!1064092 () Bool)

(assert (=> d!161879 (=> (not res!1064092) (not e!865971))))

(assert (=> d!161879 (= res!1064092 (isStrictlySorted!911 (t!50973 l!1177)))))

(assert (=> d!161879 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (t!50973 l!1177) newKey!105 newValue!105 otherKey!50) lt!670202)))

(declare-fun b!1555075 () Bool)

(assert (=> b!1555075 (= e!865971 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555076 () Bool)

(assert (=> b!1555076 (= e!865970 (= (getValueByKey!760 (insertStrictlySorted!522 (t!50973 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!760 (t!50973 l!1177) otherKey!50)))))

(assert (= (and d!161879 res!1064092) b!1555075))

(assert (= (and d!161879 res!1064093) b!1555076))

(declare-fun m!1433169 () Bool)

(assert (=> d!161879 m!1433169))

(assert (=> d!161879 m!1433061))

(assert (=> d!161879 m!1433059))

(declare-fun m!1433173 () Bool)

(assert (=> d!161879 m!1433173))

(assert (=> d!161879 m!1433059))

(assert (=> d!161879 m!1433053))

(assert (=> b!1555076 m!1433059))

(assert (=> b!1555076 m!1433059))

(declare-fun m!1433175 () Bool)

(assert (=> b!1555076 m!1433175))

(assert (=> b!1555076 m!1433051))

(assert (=> b!1554848 d!161879))

(declare-fun b!1555083 () Bool)

(declare-fun c!143556 () Bool)

(assert (=> b!1555083 (= c!143556 (and (is-Cons!36248 (t!50973 l!1177)) (bvsgt (_1!12417 (h!37694 (t!50973 l!1177))) newKey!105)))))

(declare-fun e!865982 () List!36252)

(declare-fun e!865980 () List!36252)

(assert (=> b!1555083 (= e!865982 e!865980)))

(declare-fun bm!71482 () Bool)

(declare-fun call!71485 () List!36252)

(declare-fun call!71487 () List!36252)

(assert (=> bm!71482 (= call!71485 call!71487)))

(declare-fun b!1555084 () Bool)

(declare-fun e!865981 () List!36252)

(assert (=> b!1555084 (= e!865981 call!71487)))

(declare-fun b!1555085 () Bool)

(declare-fun e!865978 () Bool)

(declare-fun lt!670204 () List!36252)

(assert (=> b!1555085 (= e!865978 (contains!10172 lt!670204 (tuple2!24813 newKey!105 newValue!105)))))

(declare-fun b!1555086 () Bool)

(declare-fun e!865979 () List!36252)

(assert (=> b!1555086 (= e!865979 (insertStrictlySorted!522 (t!50973 (t!50973 l!1177)) newKey!105 newValue!105))))

(declare-fun bm!71483 () Bool)

(declare-fun call!71486 () List!36252)

(assert (=> bm!71483 (= call!71486 call!71485)))

(declare-fun d!161891 () Bool)

(assert (=> d!161891 e!865978))

(declare-fun res!1064101 () Bool)

(assert (=> d!161891 (=> (not res!1064101) (not e!865978))))

(assert (=> d!161891 (= res!1064101 (isStrictlySorted!911 lt!670204))))

(assert (=> d!161891 (= lt!670204 e!865981)))

(declare-fun c!143554 () Bool)

(assert (=> d!161891 (= c!143554 (and (is-Cons!36248 (t!50973 l!1177)) (bvslt (_1!12417 (h!37694 (t!50973 l!1177))) newKey!105)))))

(assert (=> d!161891 (isStrictlySorted!911 (t!50973 l!1177))))

(assert (=> d!161891 (= (insertStrictlySorted!522 (t!50973 l!1177) newKey!105 newValue!105) lt!670204)))

(declare-fun b!1555087 () Bool)

(assert (=> b!1555087 (= e!865982 call!71485)))

(declare-fun b!1555088 () Bool)

(assert (=> b!1555088 (= e!865980 call!71486)))

(declare-fun b!1555089 () Bool)

(declare-fun res!1064100 () Bool)

(assert (=> b!1555089 (=> (not res!1064100) (not e!865978))))

(assert (=> b!1555089 (= res!1064100 (containsKey!782 lt!670204 newKey!105))))

(declare-fun b!1555090 () Bool)

(assert (=> b!1555090 (= e!865980 call!71486)))

(declare-fun c!143555 () Bool)

(declare-fun b!1555091 () Bool)

(assert (=> b!1555091 (= e!865979 (ite c!143555 (t!50973 (t!50973 l!1177)) (ite c!143556 (Cons!36248 (h!37694 (t!50973 l!1177)) (t!50973 (t!50973 l!1177))) Nil!36249)))))

(declare-fun bm!71484 () Bool)

(assert (=> bm!71484 (= call!71487 ($colon$colon!956 e!865979 (ite c!143554 (h!37694 (t!50973 l!1177)) (tuple2!24813 newKey!105 newValue!105))))))

(declare-fun c!143557 () Bool)

(assert (=> bm!71484 (= c!143557 c!143554)))

(declare-fun b!1555092 () Bool)

(assert (=> b!1555092 (= e!865981 e!865982)))

(assert (=> b!1555092 (= c!143555 (and (is-Cons!36248 (t!50973 l!1177)) (= (_1!12417 (h!37694 (t!50973 l!1177))) newKey!105)))))

(assert (= (and d!161891 c!143554) b!1555084))

(assert (= (and d!161891 (not c!143554)) b!1555092))

(assert (= (and b!1555092 c!143555) b!1555087))

(assert (= (and b!1555092 (not c!143555)) b!1555083))

(assert (= (and b!1555083 c!143556) b!1555090))

(assert (= (and b!1555083 (not c!143556)) b!1555088))

(assert (= (or b!1555090 b!1555088) bm!71483))

(assert (= (or b!1555087 bm!71483) bm!71482))

(assert (= (or b!1555084 bm!71482) bm!71484))

(assert (= (and bm!71484 c!143557) b!1555086))

(assert (= (and bm!71484 (not c!143557)) b!1555091))

(assert (= (and d!161891 res!1064101) b!1555089))

(assert (= (and b!1555089 res!1064100) b!1555085))

(declare-fun m!1433187 () Bool)

(assert (=> bm!71484 m!1433187))

(declare-fun m!1433189 () Bool)

(assert (=> b!1555085 m!1433189))

(declare-fun m!1433191 () Bool)

(assert (=> b!1555086 m!1433191))

(declare-fun m!1433193 () Bool)

(assert (=> b!1555089 m!1433193))

(declare-fun m!1433195 () Bool)

(assert (=> d!161891 m!1433195))

(assert (=> d!161891 m!1433053))

(assert (=> b!1554848 d!161891))

(declare-fun d!161897 () Bool)

(declare-fun res!1064114 () Bool)

(declare-fun e!866004 () Bool)

(assert (=> d!161897 (=> res!1064114 e!866004)))

(assert (=> d!161897 (= res!1064114 (and (is-Cons!36248 (t!50973 l!1177)) (= (_1!12417 (h!37694 (t!50973 l!1177))) otherKey!50)))))

(assert (=> d!161897 (= (containsKey!782 (t!50973 l!1177) otherKey!50) e!866004)))

(declare-fun b!1555123 () Bool)

(declare-fun e!866005 () Bool)

(assert (=> b!1555123 (= e!866004 e!866005)))

(declare-fun res!1064115 () Bool)

(assert (=> b!1555123 (=> (not res!1064115) (not e!866005))))

(assert (=> b!1555123 (= res!1064115 (and (or (not (is-Cons!36248 (t!50973 l!1177))) (bvsle (_1!12417 (h!37694 (t!50973 l!1177))) otherKey!50)) (is-Cons!36248 (t!50973 l!1177)) (bvslt (_1!12417 (h!37694 (t!50973 l!1177))) otherKey!50)))))

(declare-fun b!1555124 () Bool)

(assert (=> b!1555124 (= e!866005 (containsKey!782 (t!50973 (t!50973 l!1177)) otherKey!50))))

(assert (= (and d!161897 (not res!1064114)) b!1555123))

(assert (= (and b!1555123 res!1064115) b!1555124))

(declare-fun m!1433211 () Bool)

(assert (=> b!1555124 m!1433211))

(assert (=> b!1554848 d!161897))

(declare-fun d!161903 () Bool)

(declare-fun res!1064116 () Bool)

(declare-fun e!866006 () Bool)

(assert (=> d!161903 (=> res!1064116 e!866006)))

(assert (=> d!161903 (= res!1064116 (or (is-Nil!36249 (insertStrictlySorted!522 l!1177 newKey!105 newValue!105)) (is-Nil!36249 (t!50973 (insertStrictlySorted!522 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!161903 (= (isStrictlySorted!911 (insertStrictlySorted!522 l!1177 newKey!105 newValue!105)) e!866006)))

(declare-fun b!1555125 () Bool)

(declare-fun e!866007 () Bool)

(assert (=> b!1555125 (= e!866006 e!866007)))

(declare-fun res!1064117 () Bool)

(assert (=> b!1555125 (=> (not res!1064117) (not e!866007))))

(assert (=> b!1555125 (= res!1064117 (bvslt (_1!12417 (h!37694 (insertStrictlySorted!522 l!1177 newKey!105 newValue!105))) (_1!12417 (h!37694 (t!50973 (insertStrictlySorted!522 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1555126 () Bool)

(assert (=> b!1555126 (= e!866007 (isStrictlySorted!911 (t!50973 (insertStrictlySorted!522 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!161903 (not res!1064116)) b!1555125))

(assert (= (and b!1555125 res!1064117) b!1555126))

(declare-fun m!1433213 () Bool)

(assert (=> b!1555126 m!1433213))

(assert (=> b!1554848 d!161903))

(declare-fun d!161905 () Bool)

(declare-fun res!1064118 () Bool)

(declare-fun e!866008 () Bool)

(assert (=> d!161905 (=> res!1064118 e!866008)))

(assert (=> d!161905 (= res!1064118 (and (is-Cons!36248 lt!670172) (= (_1!12417 (h!37694 lt!670172)) otherKey!50)))))

(assert (=> d!161905 (= (containsKey!782 lt!670172 otherKey!50) e!866008)))

(declare-fun b!1555127 () Bool)

(declare-fun e!866009 () Bool)

(assert (=> b!1555127 (= e!866008 e!866009)))

(declare-fun res!1064119 () Bool)

(assert (=> b!1555127 (=> (not res!1064119) (not e!866009))))

(assert (=> b!1555127 (= res!1064119 (and (or (not (is-Cons!36248 lt!670172)) (bvsle (_1!12417 (h!37694 lt!670172)) otherKey!50)) (is-Cons!36248 lt!670172) (bvslt (_1!12417 (h!37694 lt!670172)) otherKey!50)))))

(declare-fun b!1555128 () Bool)

(assert (=> b!1555128 (= e!866009 (containsKey!782 (t!50973 lt!670172) otherKey!50))))

(assert (= (and d!161905 (not res!1064118)) b!1555127))

(assert (= (and b!1555127 res!1064119) b!1555128))

(declare-fun m!1433215 () Bool)

(assert (=> b!1555128 m!1433215))

(assert (=> b!1554848 d!161905))

(declare-fun b!1555133 () Bool)

(declare-fun e!866012 () Bool)

(declare-fun tp!112251 () Bool)

(assert (=> b!1555133 (= e!866012 (and tp_is_empty!38275 tp!112251))))

(assert (=> b!1554847 (= tp!112236 e!866012)))

(assert (= (and b!1554847 (is-Cons!36248 (t!50973 l!1177))) b!1555133))

(push 1)

