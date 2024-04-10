; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106504 () Bool)

(assert start!106504)

(declare-fun res!842905 () Bool)

(declare-fun e!721000 () Bool)

(assert (=> start!106504 (=> (not res!842905) (not e!721000))))

(declare-datatypes ((B!1994 0))(
  ( (B!1995 (val!16332 Int)) )
))
(declare-datatypes ((tuple2!21182 0))(
  ( (tuple2!21183 (_1!10602 (_ BitVec 64)) (_2!10602 B!1994)) )
))
(declare-datatypes ((List!28324 0))(
  ( (Nil!28321) (Cons!28320 (h!29529 tuple2!21182) (t!41845 List!28324)) )
))
(declare-fun l!706 () List!28324)

(declare-fun isStrictlySorted!799 (List!28324) Bool)

(assert (=> start!106504 (= res!842905 (isStrictlySorted!799 l!706))))

(assert (=> start!106504 e!721000))

(declare-fun e!721001 () Bool)

(assert (=> start!106504 e!721001))

(assert (=> start!106504 true))

(declare-fun tp_is_empty!32527 () Bool)

(assert (=> start!106504 tp_is_empty!32527))

(declare-fun b!1265960 () Bool)

(declare-fun res!842903 () Bool)

(assert (=> b!1265960 (=> (not res!842903) (not e!721000))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!658 (List!28324 (_ BitVec 64)) Bool)

(assert (=> b!1265960 (= res!842903 (not (containsKey!658 l!706 key1!31)))))

(declare-fun b!1265961 () Bool)

(declare-fun tp!96410 () Bool)

(assert (=> b!1265961 (= e!721001 (and tp_is_empty!32527 tp!96410))))

(declare-fun b!1265962 () Bool)

(declare-fun res!842902 () Bool)

(assert (=> b!1265962 (=> (not res!842902) (not e!721000))))

(assert (=> b!1265962 (= res!842902 (not (containsKey!658 (t!41845 l!706) key1!31)))))

(declare-fun b!1265963 () Bool)

(declare-fun res!842904 () Bool)

(assert (=> b!1265963 (=> (not res!842904) (not e!721000))))

(assert (=> b!1265963 (= res!842904 (is-Cons!28320 l!706))))

(declare-fun b!1265964 () Bool)

(declare-fun res!842901 () Bool)

(assert (=> b!1265964 (=> (not res!842901) (not e!721000))))

(assert (=> b!1265964 (= res!842901 (isStrictlySorted!799 (t!41845 l!706)))))

(declare-fun v1!26 () B!1994)

(declare-fun b!1265965 () Bool)

(declare-fun removeStrictlySorted!155 (List!28324 (_ BitVec 64)) List!28324)

(declare-fun insertStrictlySorted!465 (List!28324 (_ BitVec 64) B!1994) List!28324)

(assert (=> b!1265965 (= e!721000 (not (= (removeStrictlySorted!155 (insertStrictlySorted!465 l!706 key1!31 v1!26) key1!31) l!706)))))

(assert (=> b!1265965 (= (removeStrictlySorted!155 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26) key1!31) (t!41845 l!706))))

(declare-datatypes ((Unit!42183 0))(
  ( (Unit!42184) )
))
(declare-fun lt!574074 () Unit!42183)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!10 (List!28324 (_ BitVec 64) B!1994) Unit!42183)

(assert (=> b!1265965 (= lt!574074 (lemmaInsertStrictlySortedThenRemoveIsSame!10 (t!41845 l!706) key1!31 v1!26))))

(assert (= (and start!106504 res!842905) b!1265960))

(assert (= (and b!1265960 res!842903) b!1265963))

(assert (= (and b!1265963 res!842904) b!1265964))

(assert (= (and b!1265964 res!842901) b!1265962))

(assert (= (and b!1265962 res!842902) b!1265965))

(assert (= (and start!106504 (is-Cons!28320 l!706)) b!1265961))

(declare-fun m!1165803 () Bool)

(assert (=> b!1265962 m!1165803))

(declare-fun m!1165805 () Bool)

(assert (=> b!1265965 m!1165805))

(declare-fun m!1165807 () Bool)

(assert (=> b!1265965 m!1165807))

(assert (=> b!1265965 m!1165805))

(declare-fun m!1165809 () Bool)

(assert (=> b!1265965 m!1165809))

(declare-fun m!1165811 () Bool)

(assert (=> b!1265965 m!1165811))

(assert (=> b!1265965 m!1165811))

(declare-fun m!1165813 () Bool)

(assert (=> b!1265965 m!1165813))

(declare-fun m!1165815 () Bool)

(assert (=> b!1265960 m!1165815))

(declare-fun m!1165817 () Bool)

(assert (=> start!106504 m!1165817))

(declare-fun m!1165819 () Bool)

(assert (=> b!1265964 m!1165819))

(push 1)

(assert (not b!1265964))

(assert (not b!1265960))

(assert (not start!106504))

(assert tp_is_empty!32527)

(assert (not b!1265961))

(assert (not b!1265962))

(assert (not b!1265965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139031 () Bool)

(declare-fun res!842940 () Bool)

(declare-fun e!721018 () Bool)

(assert (=> d!139031 (=> res!842940 e!721018)))

(assert (=> d!139031 (= res!842940 (and (is-Cons!28320 (t!41845 l!706)) (= (_1!10602 (h!29529 (t!41845 l!706))) key1!31)))))

(assert (=> d!139031 (= (containsKey!658 (t!41845 l!706) key1!31) e!721018)))

(declare-fun b!1266006 () Bool)

(declare-fun e!721019 () Bool)

(assert (=> b!1266006 (= e!721018 e!721019)))

(declare-fun res!842941 () Bool)

(assert (=> b!1266006 (=> (not res!842941) (not e!721019))))

(assert (=> b!1266006 (= res!842941 (and (or (not (is-Cons!28320 (t!41845 l!706))) (bvsle (_1!10602 (h!29529 (t!41845 l!706))) key1!31)) (is-Cons!28320 (t!41845 l!706)) (bvslt (_1!10602 (h!29529 (t!41845 l!706))) key1!31)))))

(declare-fun b!1266007 () Bool)

(assert (=> b!1266007 (= e!721019 (containsKey!658 (t!41845 (t!41845 l!706)) key1!31))))

(assert (= (and d!139031 (not res!842940)) b!1266006))

(assert (= (and b!1266006 res!842941) b!1266007))

(declare-fun m!1165857 () Bool)

(assert (=> b!1266007 m!1165857))

(assert (=> b!1265962 d!139031))

(declare-fun d!139037 () Bool)

(declare-fun res!842952 () Bool)

(declare-fun e!721030 () Bool)

(assert (=> d!139037 (=> res!842952 e!721030)))

(assert (=> d!139037 (= res!842952 (or (is-Nil!28321 (t!41845 l!706)) (is-Nil!28321 (t!41845 (t!41845 l!706)))))))

(assert (=> d!139037 (= (isStrictlySorted!799 (t!41845 l!706)) e!721030)))

(declare-fun b!1266018 () Bool)

(declare-fun e!721031 () Bool)

(assert (=> b!1266018 (= e!721030 e!721031)))

(declare-fun res!842953 () Bool)

(assert (=> b!1266018 (=> (not res!842953) (not e!721031))))

(assert (=> b!1266018 (= res!842953 (bvslt (_1!10602 (h!29529 (t!41845 l!706))) (_1!10602 (h!29529 (t!41845 (t!41845 l!706))))))))

(declare-fun b!1266019 () Bool)

(assert (=> b!1266019 (= e!721031 (isStrictlySorted!799 (t!41845 (t!41845 l!706))))))

(assert (= (and d!139037 (not res!842952)) b!1266018))

(assert (= (and b!1266018 res!842953) b!1266019))

(declare-fun m!1165859 () Bool)

(assert (=> b!1266019 m!1165859))

(assert (=> b!1265964 d!139037))

(declare-fun d!139041 () Bool)

(declare-fun e!721051 () Bool)

(assert (=> d!139041 e!721051))

(declare-fun res!842959 () Bool)

(assert (=> d!139041 (=> (not res!842959) (not e!721051))))

(declare-fun lt!574088 () List!28324)

(assert (=> d!139041 (= res!842959 (isStrictlySorted!799 lt!574088))))

(declare-fun e!721053 () List!28324)

(assert (=> d!139041 (= lt!574088 e!721053)))

(declare-fun c!123355 () Bool)

(assert (=> d!139041 (= c!123355 (and (is-Cons!28320 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) (= (_1!10602 (h!29529 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!139041 (isStrictlySorted!799 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))))

(assert (=> d!139041 (= (removeStrictlySorted!155 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26) key1!31) lt!574088)))

(declare-fun b!1266053 () Bool)

(declare-fun e!721052 () List!28324)

(assert (=> b!1266053 (= e!721052 Nil!28321)))

(declare-fun b!1266054 () Bool)

(assert (=> b!1266054 (= e!721051 (not (containsKey!658 lt!574088 key1!31)))))

(declare-fun b!1266055 () Bool)

(assert (=> b!1266055 (= e!721053 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)))))

(declare-fun b!1266056 () Bool)

(assert (=> b!1266056 (= e!721053 e!721052)))

(declare-fun c!123356 () Bool)

(assert (=> b!1266056 (= c!123356 (and (is-Cons!28320 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) (not (= (_1!10602 (h!29529 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun b!1266057 () Bool)

(declare-fun $colon$colon!641 (List!28324 tuple2!21182) List!28324)

(assert (=> b!1266057 (= e!721052 ($colon$colon!641 (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) key1!31) (h!29529 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))))))

(assert (= (and d!139041 c!123355) b!1266055))

(assert (= (and d!139041 (not c!123355)) b!1266056))

(assert (= (and b!1266056 c!123356) b!1266057))

(assert (= (and b!1266056 (not c!123356)) b!1266053))

(assert (= (and d!139041 res!842959) b!1266054))

(declare-fun m!1165871 () Bool)

(assert (=> d!139041 m!1165871))

(assert (=> d!139041 m!1165805))

(declare-fun m!1165873 () Bool)

(assert (=> d!139041 m!1165873))

(declare-fun m!1165875 () Bool)

(assert (=> b!1266054 m!1165875))

(declare-fun m!1165877 () Bool)

(assert (=> b!1266057 m!1165877))

(assert (=> b!1266057 m!1165877))

(declare-fun m!1165879 () Bool)

(assert (=> b!1266057 m!1165879))

(assert (=> b!1265965 d!139041))

(declare-fun e!721077 () List!28324)

(declare-fun b!1266098 () Bool)

(assert (=> b!1266098 (= e!721077 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))))

(declare-fun c!123374 () Bool)

(declare-fun c!123376 () Bool)

(declare-fun b!1266099 () Bool)

(assert (=> b!1266099 (= e!721077 (ite c!123374 (t!41845 l!706) (ite c!123376 (Cons!28320 (h!29529 l!706) (t!41845 l!706)) Nil!28321)))))

(declare-fun b!1266100 () Bool)

(declare-fun lt!574094 () List!28324)

(declare-fun e!721075 () Bool)

(declare-fun contains!7640 (List!28324 tuple2!21182) Bool)

(assert (=> b!1266100 (= e!721075 (contains!7640 lt!574094 (tuple2!21183 key1!31 v1!26)))))

(declare-fun b!1266101 () Bool)

(declare-fun e!721079 () List!28324)

(declare-fun call!62434 () List!28324)

(assert (=> b!1266101 (= e!721079 call!62434)))

(declare-fun b!1266102 () Bool)

(declare-fun e!721076 () List!28324)

(declare-fun call!62435 () List!28324)

(assert (=> b!1266102 (= e!721076 call!62435)))

(declare-fun b!1266103 () Bool)

(declare-fun e!721078 () List!28324)

(assert (=> b!1266103 (= e!721078 e!721076)))

(assert (=> b!1266103 (= c!123374 (and (is-Cons!28320 l!706) (= (_1!10602 (h!29529 l!706)) key1!31)))))

(declare-fun b!1266104 () Bool)

(declare-fun res!842967 () Bool)

(assert (=> b!1266104 (=> (not res!842967) (not e!721075))))

(assert (=> b!1266104 (= res!842967 (containsKey!658 lt!574094 key1!31))))

(declare-fun b!1266105 () Bool)

(assert (=> b!1266105 (= c!123376 (and (is-Cons!28320 l!706) (bvsgt (_1!10602 (h!29529 l!706)) key1!31)))))

(assert (=> b!1266105 (= e!721076 e!721079)))

(declare-fun d!139045 () Bool)

(assert (=> d!139045 e!721075))

(declare-fun res!842968 () Bool)

(assert (=> d!139045 (=> (not res!842968) (not e!721075))))

(assert (=> d!139045 (= res!842968 (isStrictlySorted!799 lt!574094))))

(assert (=> d!139045 (= lt!574094 e!721078)))

(declare-fun c!123373 () Bool)

(assert (=> d!139045 (= c!123373 (and (is-Cons!28320 l!706) (bvslt (_1!10602 (h!29529 l!706)) key1!31)))))

(assert (=> d!139045 (isStrictlySorted!799 l!706)))

(assert (=> d!139045 (= (insertStrictlySorted!465 l!706 key1!31 v1!26) lt!574094)))

(declare-fun b!1266097 () Bool)

(declare-fun call!62433 () List!28324)

(assert (=> b!1266097 (= e!721078 call!62433)))

(declare-fun bm!62430 () Bool)

(assert (=> bm!62430 (= call!62434 call!62435)))

(declare-fun bm!62431 () Bool)

(assert (=> bm!62431 (= call!62433 ($colon$colon!641 e!721077 (ite c!123373 (h!29529 l!706) (tuple2!21183 key1!31 v1!26))))))

(declare-fun c!123375 () Bool)

(assert (=> bm!62431 (= c!123375 c!123373)))

(declare-fun bm!62432 () Bool)

(assert (=> bm!62432 (= call!62435 call!62433)))

(declare-fun b!1266106 () Bool)

(assert (=> b!1266106 (= e!721079 call!62434)))

(assert (= (and d!139045 c!123373) b!1266097))

(assert (= (and d!139045 (not c!123373)) b!1266103))

(assert (= (and b!1266103 c!123374) b!1266102))

(assert (= (and b!1266103 (not c!123374)) b!1266105))

(assert (= (and b!1266105 c!123376) b!1266106))

(assert (= (and b!1266105 (not c!123376)) b!1266101))

(assert (= (or b!1266106 b!1266101) bm!62430))

(assert (= (or b!1266102 bm!62430) bm!62432))

(assert (= (or b!1266097 bm!62432) bm!62431))

(assert (= (and bm!62431 c!123375) b!1266098))

(assert (= (and bm!62431 (not c!123375)) b!1266099))

(assert (= (and d!139045 res!842968) b!1266104))

(assert (= (and b!1266104 res!842967) b!1266100))

(assert (=> b!1266098 m!1165805))

(declare-fun m!1165891 () Bool)

(assert (=> b!1266104 m!1165891))

(declare-fun m!1165893 () Bool)

(assert (=> b!1266100 m!1165893))

(declare-fun m!1165895 () Bool)

(assert (=> d!139045 m!1165895))

(assert (=> d!139045 m!1165817))

(declare-fun m!1165897 () Bool)

(assert (=> bm!62431 m!1165897))

(assert (=> b!1265965 d!139045))

(declare-fun d!139049 () Bool)

(declare-fun e!721082 () Bool)

(assert (=> d!139049 e!721082))

(declare-fun res!842969 () Bool)

(assert (=> d!139049 (=> (not res!842969) (not e!721082))))

(declare-fun lt!574095 () List!28324)

(assert (=> d!139049 (= res!842969 (isStrictlySorted!799 lt!574095))))

(declare-fun e!721084 () List!28324)

(assert (=> d!139049 (= lt!574095 e!721084)))

(declare-fun c!123379 () Bool)

(assert (=> d!139049 (= c!123379 (and (is-Cons!28320 (insertStrictlySorted!465 l!706 key1!31 v1!26)) (= (_1!10602 (h!29529 (insertStrictlySorted!465 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139049 (isStrictlySorted!799 (insertStrictlySorted!465 l!706 key1!31 v1!26))))

(assert (=> d!139049 (= (removeStrictlySorted!155 (insertStrictlySorted!465 l!706 key1!31 v1!26) key1!31) lt!574095)))

(declare-fun b!1266111 () Bool)

(declare-fun e!721083 () List!28324)

(assert (=> b!1266111 (= e!721083 Nil!28321)))

(declare-fun b!1266112 () Bool)

(assert (=> b!1266112 (= e!721082 (not (containsKey!658 lt!574095 key1!31)))))

(declare-fun b!1266113 () Bool)

(assert (=> b!1266113 (= e!721084 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)))))

(declare-fun b!1266114 () Bool)

(assert (=> b!1266114 (= e!721084 e!721083)))

(declare-fun c!123380 () Bool)

(assert (=> b!1266114 (= c!123380 (and (is-Cons!28320 (insertStrictlySorted!465 l!706 key1!31 v1!26)) (not (= (_1!10602 (h!29529 (insertStrictlySorted!465 l!706 key1!31 v1!26))) key1!31))))))

(declare-fun b!1266115 () Bool)

(assert (=> b!1266115 (= e!721083 ($colon$colon!641 (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)) key1!31) (h!29529 (insertStrictlySorted!465 l!706 key1!31 v1!26))))))

(assert (= (and d!139049 c!123379) b!1266113))

(assert (= (and d!139049 (not c!123379)) b!1266114))

(assert (= (and b!1266114 c!123380) b!1266115))

(assert (= (and b!1266114 (not c!123380)) b!1266111))

(assert (= (and d!139049 res!842969) b!1266112))

(declare-fun m!1165899 () Bool)

(assert (=> d!139049 m!1165899))

(assert (=> d!139049 m!1165811))

(declare-fun m!1165901 () Bool)

(assert (=> d!139049 m!1165901))

(declare-fun m!1165903 () Bool)

(assert (=> b!1266112 m!1165903))

(declare-fun m!1165905 () Bool)

(assert (=> b!1266115 m!1165905))

(assert (=> b!1266115 m!1165905))

(declare-fun m!1165907 () Bool)

(assert (=> b!1266115 m!1165907))

(assert (=> b!1265965 d!139049))

(declare-fun d!139051 () Bool)

(assert (=> d!139051 (= (removeStrictlySorted!155 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26) key1!31) (t!41845 l!706))))

(declare-fun lt!574100 () Unit!42183)

(declare-fun choose!1886 (List!28324 (_ BitVec 64) B!1994) Unit!42183)

(assert (=> d!139051 (= lt!574100 (choose!1886 (t!41845 l!706) key1!31 v1!26))))

(assert (=> d!139051 (isStrictlySorted!799 (t!41845 l!706))))

(assert (=> d!139051 (= (lemmaInsertStrictlySortedThenRemoveIsSame!10 (t!41845 l!706) key1!31 v1!26) lt!574100)))

(declare-fun bs!35834 () Bool)

(assert (= bs!35834 d!139051))

(assert (=> bs!35834 m!1165805))

(assert (=> bs!35834 m!1165805))

(assert (=> bs!35834 m!1165809))

(declare-fun m!1165909 () Bool)

(assert (=> bs!35834 m!1165909))

(assert (=> bs!35834 m!1165819))

(assert (=> b!1265965 d!139051))

(declare-fun b!1266137 () Bool)

(declare-fun e!721097 () List!28324)

(assert (=> b!1266137 (= e!721097 (insertStrictlySorted!465 (t!41845 (t!41845 l!706)) key1!31 v1!26))))

(declare-fun b!1266138 () Bool)

(declare-fun c!123392 () Bool)

(declare-fun c!123390 () Bool)

(assert (=> b!1266138 (= e!721097 (ite c!123390 (t!41845 (t!41845 l!706)) (ite c!123392 (Cons!28320 (h!29529 (t!41845 l!706)) (t!41845 (t!41845 l!706))) Nil!28321)))))

(declare-fun lt!574101 () List!28324)

(declare-fun b!1266139 () Bool)

(declare-fun e!721095 () Bool)

(assert (=> b!1266139 (= e!721095 (contains!7640 lt!574101 (tuple2!21183 key1!31 v1!26)))))

(declare-fun b!1266140 () Bool)

(declare-fun e!721099 () List!28324)

(declare-fun call!62445 () List!28324)

(assert (=> b!1266140 (= e!721099 call!62445)))

(declare-fun b!1266141 () Bool)

(declare-fun e!721096 () List!28324)

(declare-fun call!62446 () List!28324)

(assert (=> b!1266141 (= e!721096 call!62446)))

(declare-fun b!1266142 () Bool)

(declare-fun e!721098 () List!28324)

(assert (=> b!1266142 (= e!721098 e!721096)))

(assert (=> b!1266142 (= c!123390 (and (is-Cons!28320 (t!41845 l!706)) (= (_1!10602 (h!29529 (t!41845 l!706))) key1!31)))))

(declare-fun b!1266143 () Bool)

(declare-fun res!842974 () Bool)

(assert (=> b!1266143 (=> (not res!842974) (not e!721095))))

(assert (=> b!1266143 (= res!842974 (containsKey!658 lt!574101 key1!31))))

(declare-fun b!1266144 () Bool)

(assert (=> b!1266144 (= c!123392 (and (is-Cons!28320 (t!41845 l!706)) (bvsgt (_1!10602 (h!29529 (t!41845 l!706))) key1!31)))))

(assert (=> b!1266144 (= e!721096 e!721099)))

(declare-fun d!139053 () Bool)

(assert (=> d!139053 e!721095))

(declare-fun res!842975 () Bool)

(assert (=> d!139053 (=> (not res!842975) (not e!721095))))

(assert (=> d!139053 (= res!842975 (isStrictlySorted!799 lt!574101))))

(assert (=> d!139053 (= lt!574101 e!721098)))

(declare-fun c!123389 () Bool)

(assert (=> d!139053 (= c!123389 (and (is-Cons!28320 (t!41845 l!706)) (bvslt (_1!10602 (h!29529 (t!41845 l!706))) key1!31)))))

(assert (=> d!139053 (isStrictlySorted!799 (t!41845 l!706))))

(assert (=> d!139053 (= (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26) lt!574101)))

(declare-fun b!1266136 () Bool)

(declare-fun call!62444 () List!28324)

(assert (=> b!1266136 (= e!721098 call!62444)))

(declare-fun bm!62441 () Bool)

(assert (=> bm!62441 (= call!62445 call!62446)))

(declare-fun bm!62442 () Bool)

(assert (=> bm!62442 (= call!62444 ($colon$colon!641 e!721097 (ite c!123389 (h!29529 (t!41845 l!706)) (tuple2!21183 key1!31 v1!26))))))

(declare-fun c!123391 () Bool)

(assert (=> bm!62442 (= c!123391 c!123389)))

(declare-fun bm!62443 () Bool)

(assert (=> bm!62443 (= call!62446 call!62444)))

(declare-fun b!1266145 () Bool)

(assert (=> b!1266145 (= e!721099 call!62445)))

(assert (= (and d!139053 c!123389) b!1266136))

(assert (= (and d!139053 (not c!123389)) b!1266142))

(assert (= (and b!1266142 c!123390) b!1266141))

(assert (= (and b!1266142 (not c!123390)) b!1266144))

(assert (= (and b!1266144 c!123392) b!1266145))

(assert (= (and b!1266144 (not c!123392)) b!1266140))

(assert (= (or b!1266145 b!1266140) bm!62441))

(assert (= (or b!1266141 bm!62441) bm!62443))

(assert (= (or b!1266136 bm!62443) bm!62442))

(assert (= (and bm!62442 c!123391) b!1266137))

(assert (= (and bm!62442 (not c!123391)) b!1266138))

(assert (= (and d!139053 res!842975) b!1266143))

(assert (= (and b!1266143 res!842974) b!1266139))

(declare-fun m!1165911 () Bool)

(assert (=> b!1266137 m!1165911))

(declare-fun m!1165913 () Bool)

(assert (=> b!1266143 m!1165913))

(declare-fun m!1165915 () Bool)

(assert (=> b!1266139 m!1165915))

(declare-fun m!1165917 () Bool)

(assert (=> d!139053 m!1165917))

(assert (=> d!139053 m!1165819))

(declare-fun m!1165919 () Bool)

(assert (=> bm!62442 m!1165919))

(assert (=> b!1265965 d!139053))

(declare-fun d!139055 () Bool)

(declare-fun res!842980 () Bool)

(declare-fun e!721102 () Bool)

(assert (=> d!139055 (=> res!842980 e!721102)))

(assert (=> d!139055 (= res!842980 (and (is-Cons!28320 l!706) (= (_1!10602 (h!29529 l!706)) key1!31)))))

(assert (=> d!139055 (= (containsKey!658 l!706 key1!31) e!721102)))

(declare-fun b!1266150 () Bool)

(declare-fun e!721103 () Bool)

(assert (=> b!1266150 (= e!721102 e!721103)))

(declare-fun res!842981 () Bool)

(assert (=> b!1266150 (=> (not res!842981) (not e!721103))))

(assert (=> b!1266150 (= res!842981 (and (or (not (is-Cons!28320 l!706)) (bvsle (_1!10602 (h!29529 l!706)) key1!31)) (is-Cons!28320 l!706) (bvslt (_1!10602 (h!29529 l!706)) key1!31)))))

(declare-fun b!1266151 () Bool)

(assert (=> b!1266151 (= e!721103 (containsKey!658 (t!41845 l!706) key1!31))))

(assert (= (and d!139055 (not res!842980)) b!1266150))

(assert (= (and b!1266150 res!842981) b!1266151))

(assert (=> b!1266151 m!1165803))

(assert (=> b!1265960 d!139055))

(declare-fun d!139057 () Bool)

(declare-fun res!842982 () Bool)

(declare-fun e!721104 () Bool)

(assert (=> d!139057 (=> res!842982 e!721104)))

(assert (=> d!139057 (= res!842982 (or (is-Nil!28321 l!706) (is-Nil!28321 (t!41845 l!706))))))

(assert (=> d!139057 (= (isStrictlySorted!799 l!706) e!721104)))

(declare-fun b!1266152 () Bool)

(declare-fun e!721105 () Bool)

(assert (=> b!1266152 (= e!721104 e!721105)))

(declare-fun res!842983 () Bool)

(assert (=> b!1266152 (=> (not res!842983) (not e!721105))))

(assert (=> b!1266152 (= res!842983 (bvslt (_1!10602 (h!29529 l!706)) (_1!10602 (h!29529 (t!41845 l!706)))))))

(declare-fun b!1266153 () Bool)

(assert (=> b!1266153 (= e!721105 (isStrictlySorted!799 (t!41845 l!706)))))

(assert (= (and d!139057 (not res!842982)) b!1266152))

(assert (= (and b!1266152 res!842983) b!1266153))

(assert (=> b!1266153 m!1165819))

(assert (=> start!106504 d!139057))

(declare-fun b!1266168 () Bool)

(declare-fun e!721113 () Bool)

(declare-fun tp!96419 () Bool)

(assert (=> b!1266168 (= e!721113 (and tp_is_empty!32527 tp!96419))))

(assert (=> b!1265961 (= tp!96410 e!721113)))

(assert (= (and b!1265961 (is-Cons!28320 (t!41845 l!706))) b!1266168))

(push 1)

(assert (not b!1266007))

(assert (not b!1266115))

(assert (not d!139051))

(assert (not b!1266019))

(assert (not b!1266143))

(assert (not b!1266100))

(assert tp_is_empty!32527)

(assert (not b!1266054))

(assert (not bm!62442))

(assert (not d!139049))

(assert (not b!1266098))

(assert (not d!139045))

(assert (not d!139053))

(assert (not b!1266151))

(assert (not d!139041))

(assert (not b!1266104))

(assert (not b!1266057))

(assert (not bm!62431))

(assert (not b!1266168))

(assert (not b!1266139))

(assert (not b!1266153))

(assert (not b!1266137))

(assert (not b!1266112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139085 () Bool)

(declare-fun res!843020 () Bool)

(declare-fun e!721167 () Bool)

(assert (=> d!139085 (=> res!843020 e!721167)))

(assert (=> d!139085 (= res!843020 (and (is-Cons!28320 (t!41845 (t!41845 l!706))) (= (_1!10602 (h!29529 (t!41845 (t!41845 l!706)))) key1!31)))))

(assert (=> d!139085 (= (containsKey!658 (t!41845 (t!41845 l!706)) key1!31) e!721167)))

(declare-fun b!1266245 () Bool)

(declare-fun e!721168 () Bool)

(assert (=> b!1266245 (= e!721167 e!721168)))

(declare-fun res!843021 () Bool)

(assert (=> b!1266245 (=> (not res!843021) (not e!721168))))

(assert (=> b!1266245 (= res!843021 (and (or (not (is-Cons!28320 (t!41845 (t!41845 l!706)))) (bvsle (_1!10602 (h!29529 (t!41845 (t!41845 l!706)))) key1!31)) (is-Cons!28320 (t!41845 (t!41845 l!706))) (bvslt (_1!10602 (h!29529 (t!41845 (t!41845 l!706)))) key1!31)))))

(declare-fun b!1266246 () Bool)

(assert (=> b!1266246 (= e!721168 (containsKey!658 (t!41845 (t!41845 (t!41845 l!706))) key1!31))))

(assert (= (and d!139085 (not res!843020)) b!1266245))

(assert (= (and b!1266245 res!843021) b!1266246))

(declare-fun m!1165989 () Bool)

(assert (=> b!1266246 m!1165989))

(assert (=> b!1266007 d!139085))

(declare-fun d!139087 () Bool)

(declare-fun res!843022 () Bool)

(declare-fun e!721169 () Bool)

(assert (=> d!139087 (=> res!843022 e!721169)))

(assert (=> d!139087 (= res!843022 (and (is-Cons!28320 lt!574094) (= (_1!10602 (h!29529 lt!574094)) key1!31)))))

(assert (=> d!139087 (= (containsKey!658 lt!574094 key1!31) e!721169)))

(declare-fun b!1266247 () Bool)

(declare-fun e!721170 () Bool)

(assert (=> b!1266247 (= e!721169 e!721170)))

(declare-fun res!843023 () Bool)

(assert (=> b!1266247 (=> (not res!843023) (not e!721170))))

(assert (=> b!1266247 (= res!843023 (and (or (not (is-Cons!28320 lt!574094)) (bvsle (_1!10602 (h!29529 lt!574094)) key1!31)) (is-Cons!28320 lt!574094) (bvslt (_1!10602 (h!29529 lt!574094)) key1!31)))))

(declare-fun b!1266248 () Bool)

(assert (=> b!1266248 (= e!721170 (containsKey!658 (t!41845 lt!574094) key1!31))))

(assert (= (and d!139087 (not res!843022)) b!1266247))

(assert (= (and b!1266247 res!843023) b!1266248))

(declare-fun m!1165991 () Bool)

(assert (=> b!1266248 m!1165991))

(assert (=> b!1266104 d!139087))

(declare-fun d!139091 () Bool)

(declare-fun res!843024 () Bool)

(declare-fun e!721171 () Bool)

(assert (=> d!139091 (=> res!843024 e!721171)))

(assert (=> d!139091 (= res!843024 (and (is-Cons!28320 lt!574101) (= (_1!10602 (h!29529 lt!574101)) key1!31)))))

(assert (=> d!139091 (= (containsKey!658 lt!574101 key1!31) e!721171)))

(declare-fun b!1266249 () Bool)

(declare-fun e!721172 () Bool)

(assert (=> b!1266249 (= e!721171 e!721172)))

(declare-fun res!843025 () Bool)

(assert (=> b!1266249 (=> (not res!843025) (not e!721172))))

(assert (=> b!1266249 (= res!843025 (and (or (not (is-Cons!28320 lt!574101)) (bvsle (_1!10602 (h!29529 lt!574101)) key1!31)) (is-Cons!28320 lt!574101) (bvslt (_1!10602 (h!29529 lt!574101)) key1!31)))))

(declare-fun b!1266250 () Bool)

(assert (=> b!1266250 (= e!721172 (containsKey!658 (t!41845 lt!574101) key1!31))))

(assert (= (and d!139091 (not res!843024)) b!1266249))

(assert (= (and b!1266249 res!843025) b!1266250))

(declare-fun m!1165993 () Bool)

(assert (=> b!1266250 m!1165993))

(assert (=> b!1266143 d!139091))

(assert (=> d!139051 d!139041))

(assert (=> d!139051 d!139053))

(declare-fun d!139093 () Bool)

(assert (=> d!139093 (= (removeStrictlySorted!155 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26) key1!31) (t!41845 l!706))))

(assert (=> d!139093 true))

(declare-fun _$4!64 () Unit!42183)

(assert (=> d!139093 (= (choose!1886 (t!41845 l!706) key1!31 v1!26) _$4!64)))

(declare-fun bs!35838 () Bool)

(assert (= bs!35838 d!139093))

(assert (=> bs!35838 m!1165805))

(assert (=> bs!35838 m!1165805))

(assert (=> bs!35838 m!1165809))

(assert (=> d!139051 d!139093))

(assert (=> d!139051 d!139037))

(declare-fun d!139097 () Bool)

(declare-fun res!843028 () Bool)

(declare-fun e!721175 () Bool)

(assert (=> d!139097 (=> res!843028 e!721175)))

(assert (=> d!139097 (= res!843028 (or (is-Nil!28321 lt!574101) (is-Nil!28321 (t!41845 lt!574101))))))

(assert (=> d!139097 (= (isStrictlySorted!799 lt!574101) e!721175)))

(declare-fun b!1266253 () Bool)

(declare-fun e!721176 () Bool)

(assert (=> b!1266253 (= e!721175 e!721176)))

(declare-fun res!843029 () Bool)

(assert (=> b!1266253 (=> (not res!843029) (not e!721176))))

(assert (=> b!1266253 (= res!843029 (bvslt (_1!10602 (h!29529 lt!574101)) (_1!10602 (h!29529 (t!41845 lt!574101)))))))

(declare-fun b!1266254 () Bool)

(assert (=> b!1266254 (= e!721176 (isStrictlySorted!799 (t!41845 lt!574101)))))

(assert (= (and d!139097 (not res!843028)) b!1266253))

(assert (= (and b!1266253 res!843029) b!1266254))

(declare-fun m!1165997 () Bool)

(assert (=> b!1266254 m!1165997))

(assert (=> d!139053 d!139097))

(assert (=> d!139053 d!139037))

(assert (=> b!1266153 d!139037))

(declare-fun d!139101 () Bool)

(assert (=> d!139101 (= ($colon$colon!641 e!721097 (ite c!123389 (h!29529 (t!41845 l!706)) (tuple2!21183 key1!31 v1!26))) (Cons!28320 (ite c!123389 (h!29529 (t!41845 l!706)) (tuple2!21183 key1!31 v1!26)) e!721097))))

(assert (=> bm!62442 d!139101))

(declare-fun d!139105 () Bool)

(declare-fun res!843031 () Bool)

(declare-fun e!721180 () Bool)

(assert (=> d!139105 (=> res!843031 e!721180)))

(assert (=> d!139105 (= res!843031 (or (is-Nil!28321 lt!574088) (is-Nil!28321 (t!41845 lt!574088))))))

(assert (=> d!139105 (= (isStrictlySorted!799 lt!574088) e!721180)))

(declare-fun b!1266260 () Bool)

(declare-fun e!721181 () Bool)

(assert (=> b!1266260 (= e!721180 e!721181)))

(declare-fun res!843032 () Bool)

(assert (=> b!1266260 (=> (not res!843032) (not e!721181))))

(assert (=> b!1266260 (= res!843032 (bvslt (_1!10602 (h!29529 lt!574088)) (_1!10602 (h!29529 (t!41845 lt!574088)))))))

(declare-fun b!1266261 () Bool)

(assert (=> b!1266261 (= e!721181 (isStrictlySorted!799 (t!41845 lt!574088)))))

(assert (= (and d!139105 (not res!843031)) b!1266260))

(assert (= (and b!1266260 res!843032) b!1266261))

(declare-fun m!1165999 () Bool)

(assert (=> b!1266261 m!1165999))

(assert (=> d!139041 d!139105))

(declare-fun d!139107 () Bool)

(declare-fun res!843033 () Bool)

(declare-fun e!721182 () Bool)

(assert (=> d!139107 (=> res!843033 e!721182)))

(assert (=> d!139107 (= res!843033 (or (is-Nil!28321 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) (is-Nil!28321 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)))))))

(assert (=> d!139107 (= (isStrictlySorted!799 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) e!721182)))

(declare-fun b!1266262 () Bool)

(declare-fun e!721183 () Bool)

(assert (=> b!1266262 (= e!721182 e!721183)))

(declare-fun res!843034 () Bool)

(assert (=> b!1266262 (=> (not res!843034) (not e!721183))))

(assert (=> b!1266262 (= res!843034 (bvslt (_1!10602 (h!29529 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))) (_1!10602 (h!29529 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))))))))

(declare-fun b!1266263 () Bool)

(assert (=> b!1266263 (= e!721183 (isStrictlySorted!799 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))))))

(assert (= (and d!139107 (not res!843033)) b!1266262))

(assert (= (and b!1266262 res!843034) b!1266263))

(declare-fun m!1166011 () Bool)

(assert (=> b!1266263 m!1166011))

(assert (=> d!139041 d!139107))

(assert (=> b!1266151 d!139031))

(declare-fun d!139111 () Bool)

(declare-fun res!843035 () Bool)

(declare-fun e!721184 () Bool)

(assert (=> d!139111 (=> res!843035 e!721184)))

(assert (=> d!139111 (= res!843035 (or (is-Nil!28321 (t!41845 (t!41845 l!706))) (is-Nil!28321 (t!41845 (t!41845 (t!41845 l!706))))))))

(assert (=> d!139111 (= (isStrictlySorted!799 (t!41845 (t!41845 l!706))) e!721184)))

(declare-fun b!1266264 () Bool)

(declare-fun e!721185 () Bool)

(assert (=> b!1266264 (= e!721184 e!721185)))

(declare-fun res!843036 () Bool)

(assert (=> b!1266264 (=> (not res!843036) (not e!721185))))

(assert (=> b!1266264 (= res!843036 (bvslt (_1!10602 (h!29529 (t!41845 (t!41845 l!706)))) (_1!10602 (h!29529 (t!41845 (t!41845 (t!41845 l!706)))))))))

(declare-fun b!1266265 () Bool)

(assert (=> b!1266265 (= e!721185 (isStrictlySorted!799 (t!41845 (t!41845 (t!41845 l!706)))))))

(assert (= (and d!139111 (not res!843035)) b!1266264))

(assert (= (and b!1266264 res!843036) b!1266265))

(declare-fun m!1166013 () Bool)

(assert (=> b!1266265 m!1166013))

(assert (=> b!1266019 d!139111))

(declare-fun d!139115 () Bool)

(assert (=> d!139115 (= ($colon$colon!641 (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) key1!31) (h!29529 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))) (Cons!28320 (h!29529 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) key1!31)))))

(assert (=> b!1266057 d!139115))

(declare-fun d!139117 () Bool)

(declare-fun e!721189 () Bool)

(assert (=> d!139117 e!721189))

(declare-fun res!843038 () Bool)

(assert (=> d!139117 (=> (not res!843038) (not e!721189))))

(declare-fun lt!574116 () List!28324)

(assert (=> d!139117 (= res!843038 (isStrictlySorted!799 lt!574116))))

(declare-fun e!721191 () List!28324)

(assert (=> d!139117 (= lt!574116 e!721191)))

(declare-fun c!123417 () Bool)

(assert (=> d!139117 (= c!123417 (and (is-Cons!28320 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))) (= (_1!10602 (h!29529 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)))) key1!31)))))

(assert (=> d!139117 (isStrictlySorted!799 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)))))

(assert (=> d!139117 (= (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)) key1!31) lt!574116)))

(declare-fun b!1266271 () Bool)

(declare-fun e!721190 () List!28324)

(assert (=> b!1266271 (= e!721190 Nil!28321)))

(declare-fun b!1266272 () Bool)

(assert (=> b!1266272 (= e!721189 (not (containsKey!658 lt!574116 key1!31)))))

(declare-fun b!1266273 () Bool)

(assert (=> b!1266273 (= e!721191 (t!41845 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))))))

(declare-fun b!1266274 () Bool)

(assert (=> b!1266274 (= e!721191 e!721190)))

(declare-fun c!123418 () Bool)

(assert (=> b!1266274 (= c!123418 (and (is-Cons!28320 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))) (not (= (_1!10602 (h!29529 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)))) key1!31))))))

(declare-fun b!1266275 () Bool)

(assert (=> b!1266275 (= e!721190 ($colon$colon!641 (removeStrictlySorted!155 (t!41845 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26))) key1!31) (h!29529 (t!41845 (insertStrictlySorted!465 (t!41845 l!706) key1!31 v1!26)))))))

(assert (= (and d!139117 c!123417) b!1266273))

(assert (= (and d!139117 (not c!123417)) b!1266274))

(assert (= (and b!1266274 c!123418) b!1266275))

(assert (= (and b!1266274 (not c!123418)) b!1266271))

(assert (= (and d!139117 res!843038) b!1266272))

(declare-fun m!1166025 () Bool)

(assert (=> d!139117 m!1166025))

(assert (=> d!139117 m!1166011))

(declare-fun m!1166027 () Bool)

(assert (=> b!1266272 m!1166027))

(declare-fun m!1166031 () Bool)

(assert (=> b!1266275 m!1166031))

(assert (=> b!1266275 m!1166031))

(declare-fun m!1166033 () Bool)

(assert (=> b!1266275 m!1166033))

(assert (=> b!1266057 d!139117))

(declare-fun d!139123 () Bool)

(declare-fun res!843043 () Bool)

(declare-fun e!721196 () Bool)

(assert (=> d!139123 (=> res!843043 e!721196)))

(assert (=> d!139123 (= res!843043 (or (is-Nil!28321 lt!574095) (is-Nil!28321 (t!41845 lt!574095))))))

(assert (=> d!139123 (= (isStrictlySorted!799 lt!574095) e!721196)))

(declare-fun b!1266280 () Bool)

(declare-fun e!721197 () Bool)

(assert (=> b!1266280 (= e!721196 e!721197)))

(declare-fun res!843044 () Bool)

(assert (=> b!1266280 (=> (not res!843044) (not e!721197))))

(assert (=> b!1266280 (= res!843044 (bvslt (_1!10602 (h!29529 lt!574095)) (_1!10602 (h!29529 (t!41845 lt!574095)))))))

(declare-fun b!1266281 () Bool)

(assert (=> b!1266281 (= e!721197 (isStrictlySorted!799 (t!41845 lt!574095)))))

(assert (= (and d!139123 (not res!843043)) b!1266280))

(assert (= (and b!1266280 res!843044) b!1266281))

(declare-fun m!1166035 () Bool)

(assert (=> b!1266281 m!1166035))

(assert (=> d!139049 d!139123))

(declare-fun d!139127 () Bool)

(declare-fun res!843045 () Bool)

(declare-fun e!721198 () Bool)

(assert (=> d!139127 (=> res!843045 e!721198)))

(assert (=> d!139127 (= res!843045 (or (is-Nil!28321 (insertStrictlySorted!465 l!706 key1!31 v1!26)) (is-Nil!28321 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)))))))

(assert (=> d!139127 (= (isStrictlySorted!799 (insertStrictlySorted!465 l!706 key1!31 v1!26)) e!721198)))

(declare-fun b!1266282 () Bool)

(declare-fun e!721199 () Bool)

(assert (=> b!1266282 (= e!721198 e!721199)))

(declare-fun res!843046 () Bool)

(assert (=> b!1266282 (=> (not res!843046) (not e!721199))))

(assert (=> b!1266282 (= res!843046 (bvslt (_1!10602 (h!29529 (insertStrictlySorted!465 l!706 key1!31 v1!26))) (_1!10602 (h!29529 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26))))))))

(declare-fun b!1266283 () Bool)

(assert (=> b!1266283 (= e!721199 (isStrictlySorted!799 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26))))))

(assert (= (and d!139127 (not res!843045)) b!1266282))

(assert (= (and b!1266282 res!843046) b!1266283))

(declare-fun m!1166037 () Bool)

(assert (=> b!1266283 m!1166037))

(assert (=> d!139049 d!139127))

(declare-fun e!721202 () List!28324)

(declare-fun b!1266285 () Bool)

(assert (=> b!1266285 (= e!721202 (insertStrictlySorted!465 (t!41845 (t!41845 (t!41845 l!706))) key1!31 v1!26))))

(declare-fun b!1266286 () Bool)

(declare-fun c!123420 () Bool)

(declare-fun c!123422 () Bool)

(assert (=> b!1266286 (= e!721202 (ite c!123420 (t!41845 (t!41845 (t!41845 l!706))) (ite c!123422 (Cons!28320 (h!29529 (t!41845 (t!41845 l!706))) (t!41845 (t!41845 (t!41845 l!706)))) Nil!28321)))))

(declare-fun e!721200 () Bool)

(declare-fun b!1266287 () Bool)

(declare-fun lt!574117 () List!28324)

(assert (=> b!1266287 (= e!721200 (contains!7640 lt!574117 (tuple2!21183 key1!31 v1!26)))))

(declare-fun b!1266288 () Bool)

(declare-fun e!721204 () List!28324)

(declare-fun call!62460 () List!28324)

(assert (=> b!1266288 (= e!721204 call!62460)))

(declare-fun b!1266289 () Bool)

(declare-fun e!721201 () List!28324)

(declare-fun call!62461 () List!28324)

(assert (=> b!1266289 (= e!721201 call!62461)))

(declare-fun b!1266290 () Bool)

(declare-fun e!721203 () List!28324)

(assert (=> b!1266290 (= e!721203 e!721201)))

(assert (=> b!1266290 (= c!123420 (and (is-Cons!28320 (t!41845 (t!41845 l!706))) (= (_1!10602 (h!29529 (t!41845 (t!41845 l!706)))) key1!31)))))

(declare-fun b!1266291 () Bool)

(declare-fun res!843047 () Bool)

(assert (=> b!1266291 (=> (not res!843047) (not e!721200))))

(assert (=> b!1266291 (= res!843047 (containsKey!658 lt!574117 key1!31))))

(declare-fun b!1266292 () Bool)

(assert (=> b!1266292 (= c!123422 (and (is-Cons!28320 (t!41845 (t!41845 l!706))) (bvsgt (_1!10602 (h!29529 (t!41845 (t!41845 l!706)))) key1!31)))))

(assert (=> b!1266292 (= e!721201 e!721204)))

(declare-fun d!139129 () Bool)

(assert (=> d!139129 e!721200))

(declare-fun res!843048 () Bool)

(assert (=> d!139129 (=> (not res!843048) (not e!721200))))

(assert (=> d!139129 (= res!843048 (isStrictlySorted!799 lt!574117))))

(assert (=> d!139129 (= lt!574117 e!721203)))

(declare-fun c!123419 () Bool)

(assert (=> d!139129 (= c!123419 (and (is-Cons!28320 (t!41845 (t!41845 l!706))) (bvslt (_1!10602 (h!29529 (t!41845 (t!41845 l!706)))) key1!31)))))

(assert (=> d!139129 (isStrictlySorted!799 (t!41845 (t!41845 l!706)))))

(assert (=> d!139129 (= (insertStrictlySorted!465 (t!41845 (t!41845 l!706)) key1!31 v1!26) lt!574117)))

(declare-fun b!1266284 () Bool)

(declare-fun call!62459 () List!28324)

(assert (=> b!1266284 (= e!721203 call!62459)))

(declare-fun bm!62456 () Bool)

(assert (=> bm!62456 (= call!62460 call!62461)))

(declare-fun bm!62457 () Bool)

(assert (=> bm!62457 (= call!62459 ($colon$colon!641 e!721202 (ite c!123419 (h!29529 (t!41845 (t!41845 l!706))) (tuple2!21183 key1!31 v1!26))))))

(declare-fun c!123421 () Bool)

(assert (=> bm!62457 (= c!123421 c!123419)))

(declare-fun bm!62458 () Bool)

(assert (=> bm!62458 (= call!62461 call!62459)))

(declare-fun b!1266293 () Bool)

(assert (=> b!1266293 (= e!721204 call!62460)))

(assert (= (and d!139129 c!123419) b!1266284))

(assert (= (and d!139129 (not c!123419)) b!1266290))

(assert (= (and b!1266290 c!123420) b!1266289))

(assert (= (and b!1266290 (not c!123420)) b!1266292))

(assert (= (and b!1266292 c!123422) b!1266293))

(assert (= (and b!1266292 (not c!123422)) b!1266288))

(assert (= (or b!1266293 b!1266288) bm!62456))

(assert (= (or b!1266289 bm!62456) bm!62458))

(assert (= (or b!1266284 bm!62458) bm!62457))

(assert (= (and bm!62457 c!123421) b!1266285))

(assert (= (and bm!62457 (not c!123421)) b!1266286))

(assert (= (and d!139129 res!843048) b!1266291))

(assert (= (and b!1266291 res!843047) b!1266287))

(declare-fun m!1166039 () Bool)

(assert (=> b!1266285 m!1166039))

(declare-fun m!1166041 () Bool)

(assert (=> b!1266291 m!1166041))

(declare-fun m!1166043 () Bool)

(assert (=> b!1266287 m!1166043))

(declare-fun m!1166045 () Bool)

(assert (=> d!139129 m!1166045))

(assert (=> d!139129 m!1165859))

(declare-fun m!1166047 () Bool)

(assert (=> bm!62457 m!1166047))

(assert (=> b!1266137 d!139129))

(declare-fun d!139131 () Bool)

(declare-fun lt!574124 () Bool)

(declare-fun content!635 (List!28324) (Set tuple2!21182))

(assert (=> d!139131 (= lt!574124 (set.member (tuple2!21183 key1!31 v1!26) (content!635 lt!574094)))))

(declare-fun e!721222 () Bool)

(assert (=> d!139131 (= lt!574124 e!721222)))

(declare-fun res!843064 () Bool)

(assert (=> d!139131 (=> (not res!843064) (not e!721222))))

(assert (=> d!139131 (= res!843064 (is-Cons!28320 lt!574094))))

(assert (=> d!139131 (= (contains!7640 lt!574094 (tuple2!21183 key1!31 v1!26)) lt!574124)))

(declare-fun b!1266316 () Bool)

(declare-fun e!721223 () Bool)

(assert (=> b!1266316 (= e!721222 e!721223)))

(declare-fun res!843063 () Bool)

(assert (=> b!1266316 (=> res!843063 e!721223)))

(assert (=> b!1266316 (= res!843063 (= (h!29529 lt!574094) (tuple2!21183 key1!31 v1!26)))))

(declare-fun b!1266317 () Bool)

(assert (=> b!1266317 (= e!721223 (contains!7640 (t!41845 lt!574094) (tuple2!21183 key1!31 v1!26)))))

(assert (= (and d!139131 res!843064) b!1266316))

(assert (= (and b!1266316 (not res!843063)) b!1266317))

(declare-fun m!1166057 () Bool)

(assert (=> d!139131 m!1166057))

(declare-fun m!1166059 () Bool)

(assert (=> d!139131 m!1166059))

(declare-fun m!1166061 () Bool)

(assert (=> b!1266317 m!1166061))

(assert (=> b!1266100 d!139131))

(declare-fun d!139137 () Bool)

(assert (=> d!139137 (= ($colon$colon!641 (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)) key1!31) (h!29529 (insertStrictlySorted!465 l!706 key1!31 v1!26))) (Cons!28320 (h!29529 (insertStrictlySorted!465 l!706 key1!31 v1!26)) (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1266115 d!139137))

(declare-fun d!139139 () Bool)

(declare-fun e!721224 () Bool)

(assert (=> d!139139 e!721224))

(declare-fun res!843065 () Bool)

(assert (=> d!139139 (=> (not res!843065) (not e!721224))))

(declare-fun lt!574125 () List!28324)

(assert (=> d!139139 (= res!843065 (isStrictlySorted!799 lt!574125))))

(declare-fun e!721226 () List!28324)

(assert (=> d!139139 (= lt!574125 e!721226)))

(declare-fun c!123427 () Bool)

(assert (=> d!139139 (= c!123427 (and (is-Cons!28320 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26))) (= (_1!10602 (h!29529 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139139 (isStrictlySorted!799 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)))))

(assert (=> d!139139 (= (removeStrictlySorted!155 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)) key1!31) lt!574125)))

(declare-fun b!1266318 () Bool)

(declare-fun e!721225 () List!28324)

(assert (=> b!1266318 (= e!721225 Nil!28321)))

(declare-fun b!1266319 () Bool)

(assert (=> b!1266319 (= e!721224 (not (containsKey!658 lt!574125 key1!31)))))

(declare-fun b!1266320 () Bool)

(assert (=> b!1266320 (= e!721226 (t!41845 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26))))))

(declare-fun b!1266321 () Bool)

(assert (=> b!1266321 (= e!721226 e!721225)))

(declare-fun c!123428 () Bool)

(assert (=> b!1266321 (= c!123428 (and (is-Cons!28320 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26))) (not (= (_1!10602 (h!29529 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)))) key1!31))))))

(declare-fun b!1266322 () Bool)

(assert (=> b!1266322 (= e!721225 ($colon$colon!641 (removeStrictlySorted!155 (t!41845 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26))) key1!31) (h!29529 (t!41845 (insertStrictlySorted!465 l!706 key1!31 v1!26)))))))

(assert (= (and d!139139 c!123427) b!1266320))

(assert (= (and d!139139 (not c!123427)) b!1266321))

(assert (= (and b!1266321 c!123428) b!1266322))

(assert (= (and b!1266321 (not c!123428)) b!1266318))

(assert (= (and d!139139 res!843065) b!1266319))

(declare-fun m!1166073 () Bool)

(assert (=> d!139139 m!1166073))

(assert (=> d!139139 m!1166037))

(declare-fun m!1166075 () Bool)

(assert (=> b!1266319 m!1166075))

(declare-fun m!1166077 () Bool)

(assert (=> b!1266322 m!1166077))

(assert (=> b!1266322 m!1166077))

(declare-fun m!1166079 () Bool)

(assert (=> b!1266322 m!1166079))

(assert (=> b!1266115 d!139139))

(declare-fun d!139143 () Bool)

(declare-fun res!843068 () Bool)

(declare-fun e!721229 () Bool)

(assert (=> d!139143 (=> res!843068 e!721229)))

(assert (=> d!139143 (= res!843068 (or (is-Nil!28321 lt!574094) (is-Nil!28321 (t!41845 lt!574094))))))

(assert (=> d!139143 (= (isStrictlySorted!799 lt!574094) e!721229)))

(declare-fun b!1266325 () Bool)

(declare-fun e!721230 () Bool)

(assert (=> b!1266325 (= e!721229 e!721230)))

(declare-fun res!843069 () Bool)

(assert (=> b!1266325 (=> (not res!843069) (not e!721230))))

(assert (=> b!1266325 (= res!843069 (bvslt (_1!10602 (h!29529 lt!574094)) (_1!10602 (h!29529 (t!41845 lt!574094)))))))

(declare-fun b!1266326 () Bool)

(assert (=> b!1266326 (= e!721230 (isStrictlySorted!799 (t!41845 lt!574094)))))

(assert (= (and d!139143 (not res!843068)) b!1266325))

(assert (= (and b!1266325 res!843069) b!1266326))

(declare-fun m!1166083 () Bool)

(assert (=> b!1266326 m!1166083))

(assert (=> d!139045 d!139143))

(assert (=> d!139045 d!139057))

(declare-fun d!139149 () Bool)

(declare-fun res!843072 () Bool)

(declare-fun e!721233 () Bool)

(assert (=> d!139149 (=> res!843072 e!721233)))

(assert (=> d!139149 (= res!843072 (and (is-Cons!28320 lt!574088) (= (_1!10602 (h!29529 lt!574088)) key1!31)))))

(assert (=> d!139149 (= (containsKey!658 lt!574088 key1!31) e!721233)))

(declare-fun b!1266329 () Bool)

(declare-fun e!721234 () Bool)

(assert (=> b!1266329 (= e!721233 e!721234)))

(declare-fun res!843073 () Bool)

(assert (=> b!1266329 (=> (not res!843073) (not e!721234))))

(assert (=> b!1266329 (= res!843073 (and (or (not (is-Cons!28320 lt!574088)) (bvsle (_1!10602 (h!29529 lt!574088)) key1!31)) (is-Cons!28320 lt!574088) (bvslt (_1!10602 (h!29529 lt!574088)) key1!31)))))

(declare-fun b!1266330 () Bool)

(assert (=> b!1266330 (= e!721234 (containsKey!658 (t!41845 lt!574088) key1!31))))

(assert (= (and d!139149 (not res!843072)) b!1266329))

(assert (= (and b!1266329 res!843073) b!1266330))

(declare-fun m!1166087 () Bool)

(assert (=> b!1266330 m!1166087))

(assert (=> b!1266054 d!139149))

(declare-fun d!139153 () Bool)

(assert (=> d!139153 (= ($colon$colon!641 e!721077 (ite c!123373 (h!29529 l!706) (tuple2!21183 key1!31 v1!26))) (Cons!28320 (ite c!123373 (h!29529 l!706) (tuple2!21183 key1!31 v1!26)) e!721077))))

(assert (=> bm!62431 d!139153))

(declare-fun d!139155 () Bool)

(declare-fun res!843076 () Bool)

(declare-fun e!721237 () Bool)

(assert (=> d!139155 (=> res!843076 e!721237)))

(assert (=> d!139155 (= res!843076 (and (is-Cons!28320 lt!574095) (= (_1!10602 (h!29529 lt!574095)) key1!31)))))

(assert (=> d!139155 (= (containsKey!658 lt!574095 key1!31) e!721237)))

(declare-fun b!1266333 () Bool)

(declare-fun e!721238 () Bool)

(assert (=> b!1266333 (= e!721237 e!721238)))

(declare-fun res!843077 () Bool)

(assert (=> b!1266333 (=> (not res!843077) (not e!721238))))

(assert (=> b!1266333 (= res!843077 (and (or (not (is-Cons!28320 lt!574095)) (bvsle (_1!10602 (h!29529 lt!574095)) key1!31)) (is-Cons!28320 lt!574095) (bvslt (_1!10602 (h!29529 lt!574095)) key1!31)))))

(declare-fun b!1266334 () Bool)

(assert (=> b!1266334 (= e!721238 (containsKey!658 (t!41845 lt!574095) key1!31))))

(assert (= (and d!139155 (not res!843076)) b!1266333))

(assert (= (and b!1266333 res!843077) b!1266334))

(declare-fun m!1166095 () Bool)

(assert (=> b!1266334 m!1166095))

(assert (=> b!1266112 d!139155))

(declare-fun d!139159 () Bool)

(declare-fun lt!574127 () Bool)

(assert (=> d!139159 (= lt!574127 (set.member (tuple2!21183 key1!31 v1!26) (content!635 lt!574101)))))

(declare-fun e!721241 () Bool)

(assert (=> d!139159 (= lt!574127 e!721241)))

(declare-fun res!843081 () Bool)

(assert (=> d!139159 (=> (not res!843081) (not e!721241))))

(assert (=> d!139159 (= res!843081 (is-Cons!28320 lt!574101))))

(assert (=> d!139159 (= (contains!7640 lt!574101 (tuple2!21183 key1!31 v1!26)) lt!574127)))

(declare-fun b!1266337 () Bool)

(declare-fun e!721242 () Bool)

(assert (=> b!1266337 (= e!721241 e!721242)))

(declare-fun res!843080 () Bool)

(assert (=> b!1266337 (=> res!843080 e!721242)))

(assert (=> b!1266337 (= res!843080 (= (h!29529 lt!574101) (tuple2!21183 key1!31 v1!26)))))

(declare-fun b!1266338 () Bool)

(assert (=> b!1266338 (= e!721242 (contains!7640 (t!41845 lt!574101) (tuple2!21183 key1!31 v1!26)))))

(assert (= (and d!139159 res!843081) b!1266337))

(assert (= (and b!1266337 (not res!843080)) b!1266338))

(declare-fun m!1166099 () Bool)

(assert (=> d!139159 m!1166099))

(declare-fun m!1166101 () Bool)

(assert (=> d!139159 m!1166101))

(declare-fun m!1166103 () Bool)

(assert (=> b!1266338 m!1166103))

(assert (=> b!1266139 d!139159))

(assert (=> b!1266098 d!139053))

(declare-fun b!1266341 () Bool)

(declare-fun e!721245 () Bool)

(declare-fun tp!96426 () Bool)

(assert (=> b!1266341 (= e!721245 (and tp_is_empty!32527 tp!96426))))

(assert (=> b!1266168 (= tp!96419 e!721245)))

(assert (= (and b!1266168 (is-Cons!28320 (t!41845 (t!41845 l!706)))) b!1266341))

(push 1)

(assert (not b!1266338))

(assert (not b!1266261))

(assert (not b!1266263))

(assert (not b!1266272))

(assert (not b!1266322))

(assert (not b!1266330))

(assert (not b!1266291))

(assert (not b!1266317))

(assert (not b!1266246))

(assert (not d!139117))

(assert (not b!1266334))

(assert (not b!1266254))

(assert (not b!1266341))

(assert (not b!1266248))

(assert (not b!1266326))

(assert (not d!139129))

(assert (not b!1266281))

(assert (not b!1266287))

(assert (not b!1266250))

(assert (not b!1266265))

(assert (not b!1266319))

(assert (not b!1266275))

(assert (not bm!62457))

(assert (not b!1266283))

(assert (not d!139093))

(assert tp_is_empty!32527)

(assert (not d!139159))

(assert (not b!1266285))

(assert (not d!139131))

(assert (not d!139139))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

