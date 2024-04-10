; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132696 () Bool)

(assert start!132696)

(declare-fun e!865847 () Bool)

(declare-fun newKey!105 () (_ BitVec 64))

(declare-datatypes ((B!2268 0))(
  ( (B!2269 (val!19220 Int)) )
))
(declare-datatypes ((tuple2!24816 0))(
  ( (tuple2!24817 (_1!12419 (_ BitVec 64)) (_2!12419 B!2268)) )
))
(declare-datatypes ((List!36254 0))(
  ( (Nil!36251) (Cons!36250 (h!37696 tuple2!24816) (t!50975 List!36254)) )
))
(declare-fun l!1177 () List!36254)

(declare-fun newValue!105 () B!2268)

(declare-fun b!1554874 () Bool)

(declare-fun isStrictlySorted!913 (List!36254) Bool)

(declare-fun insertStrictlySorted!524 (List!36254 (_ BitVec 64) B!2268) List!36254)

(assert (=> b!1554874 (= e!865847 (not (isStrictlySorted!913 (insertStrictlySorted!524 l!1177 newKey!105 newValue!105))))))

(declare-fun e!865846 () Bool)

(assert (=> b!1554874 e!865846))

(declare-fun res!1064021 () Bool)

(assert (=> b!1554874 (=> (not res!1064021) (not e!865846))))

(declare-fun lt!670183 () List!36254)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun containsKey!784 (List!36254 (_ BitVec 64)) Bool)

(assert (=> b!1554874 (= res!1064021 (= (containsKey!784 lt!670183 otherKey!50) (containsKey!784 (t!50975 l!1177) otherKey!50)))))

(assert (=> b!1554874 (= lt!670183 (insertStrictlySorted!524 (t!50975 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51812 0))(
  ( (Unit!51813) )
))
(declare-fun lt!670184 () Unit!51812)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!21 (List!36254 (_ BitVec 64) B!2268 (_ BitVec 64)) Unit!51812)

(assert (=> b!1554874 (= lt!670184 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!21 (t!50975 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554875 () Bool)

(declare-fun e!865845 () Bool)

(declare-fun tp_is_empty!38279 () Bool)

(declare-fun tp!112242 () Bool)

(assert (=> b!1554875 (= e!865845 (and tp_is_empty!38279 tp!112242))))

(declare-fun b!1554876 () Bool)

(declare-datatypes ((Option!838 0))(
  ( (Some!837 (v!22022 B!2268)) (None!836) )
))
(declare-fun getValueByKey!762 (List!36254 (_ BitVec 64)) Option!838)

(assert (=> b!1554876 (= e!865846 (= (getValueByKey!762 lt!670183 otherKey!50) (getValueByKey!762 (t!50975 l!1177) otherKey!50)))))

(declare-fun b!1554877 () Bool)

(declare-fun res!1064023 () Bool)

(assert (=> b!1554877 (=> (not res!1064023) (not e!865847))))

(assert (=> b!1554877 (= res!1064023 (isStrictlySorted!913 (t!50975 l!1177)))))

(declare-fun b!1554878 () Bool)

(declare-fun res!1064020 () Bool)

(assert (=> b!1554878 (=> (not res!1064020) (not e!865847))))

(assert (=> b!1554878 (= res!1064020 (and (not (= newKey!105 otherKey!50)) (is-Cons!36250 l!1177) (not (= (_1!12419 (h!37696 l!1177)) otherKey!50))))))

(declare-fun res!1064022 () Bool)

(assert (=> start!132696 (=> (not res!1064022) (not e!865847))))

(assert (=> start!132696 (= res!1064022 (isStrictlySorted!913 l!1177))))

(assert (=> start!132696 e!865847))

(assert (=> start!132696 e!865845))

(assert (=> start!132696 true))

(assert (=> start!132696 tp_is_empty!38279))

(assert (= (and start!132696 res!1064022) b!1554878))

(assert (= (and b!1554878 res!1064020) b!1554877))

(assert (= (and b!1554877 res!1064023) b!1554874))

(assert (= (and b!1554874 res!1064021) b!1554876))

(assert (= (and start!132696 (is-Cons!36250 l!1177)) b!1554875))

(declare-fun m!1433089 () Bool)

(assert (=> b!1554874 m!1433089))

(declare-fun m!1433091 () Bool)

(assert (=> b!1554874 m!1433091))

(declare-fun m!1433093 () Bool)

(assert (=> b!1554874 m!1433093))

(assert (=> b!1554874 m!1433089))

(declare-fun m!1433095 () Bool)

(assert (=> b!1554874 m!1433095))

(declare-fun m!1433097 () Bool)

(assert (=> b!1554874 m!1433097))

(declare-fun m!1433099 () Bool)

(assert (=> b!1554874 m!1433099))

(declare-fun m!1433101 () Bool)

(assert (=> b!1554876 m!1433101))

(declare-fun m!1433103 () Bool)

(assert (=> b!1554876 m!1433103))

(declare-fun m!1433105 () Bool)

(assert (=> b!1554877 m!1433105))

(declare-fun m!1433107 () Bool)

(assert (=> start!132696 m!1433107))

(push 1)

(assert (not b!1554877))

(assert (not start!132696))

(assert (not b!1554875))

(assert (not b!1554874))

(assert (not b!1554876))

(assert tp_is_empty!38279)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1554901 () Bool)

(declare-fun e!865862 () Option!838)

(assert (=> b!1554901 (= e!865862 (Some!837 (_2!12419 (h!37696 lt!670183))))))

(declare-fun b!1554903 () Bool)

(declare-fun e!865863 () Option!838)

(assert (=> b!1554903 (= e!865863 (getValueByKey!762 (t!50975 lt!670183) otherKey!50))))

(declare-fun d!161849 () Bool)

(declare-fun c!143498 () Bool)

(assert (=> d!161849 (= c!143498 (and (is-Cons!36250 lt!670183) (= (_1!12419 (h!37696 lt!670183)) otherKey!50)))))

(assert (=> d!161849 (= (getValueByKey!762 lt!670183 otherKey!50) e!865862)))

(declare-fun b!1554904 () Bool)

(assert (=> b!1554904 (= e!865863 None!836)))

(declare-fun b!1554902 () Bool)

(assert (=> b!1554902 (= e!865862 e!865863)))

(declare-fun c!143499 () Bool)

(assert (=> b!1554902 (= c!143499 (and (is-Cons!36250 lt!670183) (not (= (_1!12419 (h!37696 lt!670183)) otherKey!50))))))

(assert (= (and d!161849 c!143498) b!1554901))

(assert (= (and d!161849 (not c!143498)) b!1554902))

(assert (= (and b!1554902 c!143499) b!1554903))

(assert (= (and b!1554902 (not c!143499)) b!1554904))

(declare-fun m!1433109 () Bool)

(assert (=> b!1554903 m!1433109))

(assert (=> b!1554876 d!161849))

(declare-fun b!1554905 () Bool)

(declare-fun e!865864 () Option!838)

(assert (=> b!1554905 (= e!865864 (Some!837 (_2!12419 (h!37696 (t!50975 l!1177)))))))

(declare-fun b!1554907 () Bool)

(declare-fun e!865865 () Option!838)

(assert (=> b!1554907 (= e!865865 (getValueByKey!762 (t!50975 (t!50975 l!1177)) otherKey!50))))

(declare-fun d!161855 () Bool)

(declare-fun c!143500 () Bool)

(assert (=> d!161855 (= c!143500 (and (is-Cons!36250 (t!50975 l!1177)) (= (_1!12419 (h!37696 (t!50975 l!1177))) otherKey!50)))))

(assert (=> d!161855 (= (getValueByKey!762 (t!50975 l!1177) otherKey!50) e!865864)))

(declare-fun b!1554908 () Bool)

(assert (=> b!1554908 (= e!865865 None!836)))

(declare-fun b!1554906 () Bool)

(assert (=> b!1554906 (= e!865864 e!865865)))

(declare-fun c!143501 () Bool)

(assert (=> b!1554906 (= c!143501 (and (is-Cons!36250 (t!50975 l!1177)) (not (= (_1!12419 (h!37696 (t!50975 l!1177))) otherKey!50))))))

(assert (= (and d!161855 c!143500) b!1554905))

(assert (= (and d!161855 (not c!143500)) b!1554906))

(assert (= (and b!1554906 c!143501) b!1554907))

(assert (= (and b!1554906 (not c!143501)) b!1554908))

(declare-fun m!1433111 () Bool)

(assert (=> b!1554907 m!1433111))

(assert (=> b!1554876 d!161855))

(declare-fun d!161857 () Bool)

(declare-fun res!1064034 () Bool)

(declare-fun e!865880 () Bool)

(assert (=> d!161857 (=> res!1064034 e!865880)))

(assert (=> d!161857 (= res!1064034 (or (is-Nil!36251 (t!50975 l!1177)) (is-Nil!36251 (t!50975 (t!50975 l!1177)))))))

(assert (=> d!161857 (= (isStrictlySorted!913 (t!50975 l!1177)) e!865880)))

(declare-fun b!1554933 () Bool)

(declare-fun e!865881 () Bool)

(assert (=> b!1554933 (= e!865880 e!865881)))

(declare-fun res!1064035 () Bool)

(assert (=> b!1554933 (=> (not res!1064035) (not e!865881))))

(assert (=> b!1554933 (= res!1064035 (bvslt (_1!12419 (h!37696 (t!50975 l!1177))) (_1!12419 (h!37696 (t!50975 (t!50975 l!1177))))))))

(declare-fun b!1554934 () Bool)

(assert (=> b!1554934 (= e!865881 (isStrictlySorted!913 (t!50975 (t!50975 l!1177))))))

(assert (= (and d!161857 (not res!1064034)) b!1554933))

(assert (= (and b!1554933 res!1064035) b!1554934))

(declare-fun m!1433119 () Bool)

(assert (=> b!1554934 m!1433119))

(assert (=> b!1554877 d!161857))

(declare-fun d!161865 () Bool)

(declare-fun res!1064036 () Bool)

(declare-fun e!865884 () Bool)

(assert (=> d!161865 (=> res!1064036 e!865884)))

(assert (=> d!161865 (= res!1064036 (or (is-Nil!36251 l!1177) (is-Nil!36251 (t!50975 l!1177))))))

(assert (=> d!161865 (= (isStrictlySorted!913 l!1177) e!865884)))

(declare-fun b!1554939 () Bool)

(declare-fun e!865885 () Bool)

(assert (=> b!1554939 (= e!865884 e!865885)))

(declare-fun res!1064037 () Bool)

(assert (=> b!1554939 (=> (not res!1064037) (not e!865885))))

(assert (=> b!1554939 (= res!1064037 (bvslt (_1!12419 (h!37696 l!1177)) (_1!12419 (h!37696 (t!50975 l!1177)))))))

(declare-fun b!1554940 () Bool)

(assert (=> b!1554940 (= e!865885 (isStrictlySorted!913 (t!50975 l!1177)))))

(assert (= (and d!161865 (not res!1064036)) b!1554939))

(assert (= (and b!1554939 res!1064037) b!1554940))

(assert (=> b!1554940 m!1433105))

(assert (=> start!132696 d!161865))

(declare-fun call!71476 () List!36254)

(declare-fun c!143544 () Bool)

(declare-fun bm!71473 () Bool)

(declare-fun e!865931 () List!36254)

(declare-fun $colon$colon!955 (List!36254 tuple2!24816) List!36254)

(assert (=> bm!71473 (= call!71476 ($colon$colon!955 e!865931 (ite c!143544 (h!37696 l!1177) (tuple2!24817 newKey!105 newValue!105))))))

(declare-fun c!143542 () Bool)

(assert (=> bm!71473 (= c!143542 c!143544)))

(declare-fun d!161869 () Bool)

(declare-fun e!865929 () Bool)

(assert (=> d!161869 e!865929))

(declare-fun res!1064061 () Bool)

(assert (=> d!161869 (=> (not res!1064061) (not e!865929))))

(declare-fun lt!670192 () List!36254)

(assert (=> d!161869 (= res!1064061 (isStrictlySorted!913 lt!670192))))

(declare-fun e!865933 () List!36254)

(assert (=> d!161869 (= lt!670192 e!865933)))

(assert (=> d!161869 (= c!143544 (and (is-Cons!36250 l!1177) (bvslt (_1!12419 (h!37696 l!1177)) newKey!105)))))

(assert (=> d!161869 (isStrictlySorted!913 l!1177)))

(assert (=> d!161869 (= (insertStrictlySorted!524 l!1177 newKey!105 newValue!105) lt!670192)))

(declare-fun c!143543 () Bool)

(declare-fun b!1555019 () Bool)

(declare-fun c!143545 () Bool)

(assert (=> b!1555019 (= e!865931 (ite c!143543 (t!50975 l!1177) (ite c!143545 (Cons!36250 (h!37696 l!1177) (t!50975 l!1177)) Nil!36251)))))

(declare-fun b!1555020 () Bool)

(declare-fun e!865930 () List!36254)

(declare-fun call!71478 () List!36254)

(assert (=> b!1555020 (= e!865930 call!71478)))

(declare-fun b!1555021 () Bool)

(declare-fun e!865932 () List!36254)

(assert (=> b!1555021 (= e!865933 e!865932)))

(assert (=> b!1555021 (= c!143543 (and (is-Cons!36250 l!1177) (= (_1!12419 (h!37696 l!1177)) newKey!105)))))

(declare-fun b!1555022 () Bool)

(assert (=> b!1555022 (= e!865930 call!71478)))

(declare-fun b!1555023 () Bool)

(assert (=> b!1555023 (= e!865931 (insertStrictlySorted!524 (t!50975 l!1177) newKey!105 newValue!105))))

(declare-fun bm!71474 () Bool)

(declare-fun call!71477 () List!36254)

(assert (=> bm!71474 (= call!71478 call!71477)))

(declare-fun b!1555024 () Bool)

(declare-fun contains!10173 (List!36254 tuple2!24816) Bool)

(assert (=> b!1555024 (= e!865929 (contains!10173 lt!670192 (tuple2!24817 newKey!105 newValue!105)))))

(declare-fun bm!71475 () Bool)

(assert (=> bm!71475 (= call!71477 call!71476)))

(declare-fun b!1555025 () Bool)

(declare-fun res!1064060 () Bool)

(assert (=> b!1555025 (=> (not res!1064060) (not e!865929))))

(assert (=> b!1555025 (= res!1064060 (containsKey!784 lt!670192 newKey!105))))

(declare-fun b!1555026 () Bool)

(assert (=> b!1555026 (= e!865932 call!71477)))

(declare-fun b!1555027 () Bool)

(assert (=> b!1555027 (= c!143545 (and (is-Cons!36250 l!1177) (bvsgt (_1!12419 (h!37696 l!1177)) newKey!105)))))

(assert (=> b!1555027 (= e!865932 e!865930)))

(declare-fun b!1555028 () Bool)

(assert (=> b!1555028 (= e!865933 call!71476)))

(assert (= (and d!161869 c!143544) b!1555028))

(assert (= (and d!161869 (not c!143544)) b!1555021))

(assert (= (and b!1555021 c!143543) b!1555026))

(assert (= (and b!1555021 (not c!143543)) b!1555027))

(assert (= (and b!1555027 c!143545) b!1555022))

(assert (= (and b!1555027 (not c!143545)) b!1555020))

(assert (= (or b!1555022 b!1555020) bm!71474))

(assert (= (or b!1555026 bm!71474) bm!71475))

(assert (= (or b!1555028 bm!71475) bm!71473))

(assert (= (and bm!71473 c!143542) b!1555023))

(assert (= (and bm!71473 (not c!143542)) b!1555019))

(assert (= (and d!161869 res!1064061) b!1555025))

(assert (= (and b!1555025 res!1064060) b!1555024))

(declare-fun m!1433133 () Bool)

(assert (=> d!161869 m!1433133))

(assert (=> d!161869 m!1433107))

(declare-fun m!1433135 () Bool)

(assert (=> b!1555025 m!1433135))

(declare-fun m!1433137 () Bool)

(assert (=> b!1555024 m!1433137))

(declare-fun m!1433139 () Bool)

(assert (=> bm!71473 m!1433139))

(assert (=> b!1555023 m!1433095))

(assert (=> b!1554874 d!161869))

(declare-fun d!161877 () Bool)

(declare-fun res!1064072 () Bool)

(declare-fun e!865947 () Bool)

(assert (=> d!161877 (=> res!1064072 e!865947)))

(assert (=> d!161877 (= res!1064072 (and (is-Cons!36250 lt!670183) (= (_1!12419 (h!37696 lt!670183)) otherKey!50)))))

(assert (=> d!161877 (= (containsKey!784 lt!670183 otherKey!50) e!865947)))

(declare-fun b!1555047 () Bool)

(declare-fun e!865948 () Bool)

(assert (=> b!1555047 (= e!865947 e!865948)))

(declare-fun res!1064073 () Bool)

(assert (=> b!1555047 (=> (not res!1064073) (not e!865948))))

(assert (=> b!1555047 (= res!1064073 (and (or (not (is-Cons!36250 lt!670183)) (bvsle (_1!12419 (h!37696 lt!670183)) otherKey!50)) (is-Cons!36250 lt!670183) (bvslt (_1!12419 (h!37696 lt!670183)) otherKey!50)))))

(declare-fun b!1555048 () Bool)

(assert (=> b!1555048 (= e!865948 (containsKey!784 (t!50975 lt!670183) otherKey!50))))

(assert (= (and d!161877 (not res!1064072)) b!1555047))

(assert (= (and b!1555047 res!1064073) b!1555048))

(declare-fun m!1433149 () Bool)

(assert (=> b!1555048 m!1433149))

(assert (=> b!1554874 d!161877))

(declare-fun d!161881 () Bool)

(declare-fun e!865975 () Bool)

(assert (=> d!161881 e!865975))

(declare-fun res!1064096 () Bool)

(assert (=> d!161881 (=> (not res!1064096) (not e!865975))))

(assert (=> d!161881 (= res!1064096 (= (containsKey!784 (insertStrictlySorted!524 (t!50975 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!784 (t!50975 l!1177) otherKey!50)))))

(declare-fun lt!670203 () Unit!51812)

(declare-fun choose!2057 (List!36254 (_ BitVec 64) B!2268 (_ BitVec 64)) Unit!51812)

(assert (=> d!161881 (= lt!670203 (choose!2057 (t!50975 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!865974 () Bool)

(assert (=> d!161881 e!865974))

(declare-fun res!1064097 () Bool)

(assert (=> d!161881 (=> (not res!1064097) (not e!865974))))

(assert (=> d!161881 (= res!1064097 (isStrictlySorted!913 (t!50975 l!1177)))))

(assert (=> d!161881 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!21 (t!50975 l!1177) newKey!105 newValue!105 otherKey!50) lt!670203)))

(declare-fun b!1555079 () Bool)

(assert (=> b!1555079 (= e!865974 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555080 () Bool)

(assert (=> b!1555080 (= e!865975 (= (getValueByKey!762 (insertStrictlySorted!524 (t!50975 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!762 (t!50975 l!1177) otherKey!50)))))

(assert (= (and d!161881 res!1064097) b!1555079))

(assert (= (and d!161881 res!1064096) b!1555080))

(declare-fun m!1433179 () Bool)

(assert (=> d!161881 m!1433179))

(assert (=> d!161881 m!1433097))

(assert (=> d!161881 m!1433095))

(assert (=> d!161881 m!1433095))

(declare-fun m!1433181 () Bool)

(assert (=> d!161881 m!1433181))

(assert (=> d!161881 m!1433105))

(assert (=> b!1555080 m!1433095))

(assert (=> b!1555080 m!1433095))

(declare-fun m!1433183 () Bool)

(assert (=> b!1555080 m!1433183))

(assert (=> b!1555080 m!1433103))

(assert (=> b!1554874 d!161881))

(declare-fun bm!71485 () Bool)

(declare-fun call!71488 () List!36254)

(declare-fun c!143560 () Bool)

(declare-fun e!865987 () List!36254)

(assert (=> bm!71485 (= call!71488 ($colon$colon!955 e!865987 (ite c!143560 (h!37696 (t!50975 l!1177)) (tuple2!24817 newKey!105 newValue!105))))))

(declare-fun c!143558 () Bool)

(assert (=> bm!71485 (= c!143558 c!143560)))

(declare-fun d!161895 () Bool)

(declare-fun e!865985 () Bool)

(assert (=> d!161895 e!865985))

(declare-fun res!1064105 () Bool)

(assert (=> d!161895 (=> (not res!1064105) (not e!865985))))

(declare-fun lt!670205 () List!36254)

(assert (=> d!161895 (= res!1064105 (isStrictlySorted!913 lt!670205))))

(declare-fun e!865989 () List!36254)

(assert (=> d!161895 (= lt!670205 e!865989)))

(assert (=> d!161895 (= c!143560 (and (is-Cons!36250 (t!50975 l!1177)) (bvslt (_1!12419 (h!37696 (t!50975 l!1177))) newKey!105)))))

(assert (=> d!161895 (isStrictlySorted!913 (t!50975 l!1177))))

(assert (=> d!161895 (= (insertStrictlySorted!524 (t!50975 l!1177) newKey!105 newValue!105) lt!670205)))

(declare-fun c!143561 () Bool)

(declare-fun c!143559 () Bool)

(declare-fun b!1555096 () Bool)

(assert (=> b!1555096 (= e!865987 (ite c!143559 (t!50975 (t!50975 l!1177)) (ite c!143561 (Cons!36250 (h!37696 (t!50975 l!1177)) (t!50975 (t!50975 l!1177))) Nil!36251)))))

(declare-fun b!1555097 () Bool)

(declare-fun e!865986 () List!36254)

(declare-fun call!71490 () List!36254)

(assert (=> b!1555097 (= e!865986 call!71490)))

(declare-fun b!1555098 () Bool)

(declare-fun e!865988 () List!36254)

(assert (=> b!1555098 (= e!865989 e!865988)))

(assert (=> b!1555098 (= c!143559 (and (is-Cons!36250 (t!50975 l!1177)) (= (_1!12419 (h!37696 (t!50975 l!1177))) newKey!105)))))

(declare-fun b!1555100 () Bool)

(assert (=> b!1555100 (= e!865986 call!71490)))

(declare-fun b!1555101 () Bool)

(assert (=> b!1555101 (= e!865987 (insertStrictlySorted!524 (t!50975 (t!50975 l!1177)) newKey!105 newValue!105))))

(declare-fun bm!71486 () Bool)

(declare-fun call!71489 () List!36254)

(assert (=> bm!71486 (= call!71490 call!71489)))

(declare-fun b!1555102 () Bool)

(assert (=> b!1555102 (= e!865985 (contains!10173 lt!670205 (tuple2!24817 newKey!105 newValue!105)))))

(declare-fun bm!71487 () Bool)

(assert (=> bm!71487 (= call!71489 call!71488)))

(declare-fun b!1555103 () Bool)

(declare-fun res!1064104 () Bool)

(assert (=> b!1555103 (=> (not res!1064104) (not e!865985))))

(assert (=> b!1555103 (= res!1064104 (containsKey!784 lt!670205 newKey!105))))

(declare-fun b!1555104 () Bool)

(assert (=> b!1555104 (= e!865988 call!71489)))

(declare-fun b!1555105 () Bool)

(assert (=> b!1555105 (= c!143561 (and (is-Cons!36250 (t!50975 l!1177)) (bvsgt (_1!12419 (h!37696 (t!50975 l!1177))) newKey!105)))))

(assert (=> b!1555105 (= e!865988 e!865986)))

(declare-fun b!1555106 () Bool)

(assert (=> b!1555106 (= e!865989 call!71488)))

(assert (= (and d!161895 c!143560) b!1555106))

(assert (= (and d!161895 (not c!143560)) b!1555098))

(assert (= (and b!1555098 c!143559) b!1555104))

(assert (= (and b!1555098 (not c!143559)) b!1555105))

(assert (= (and b!1555105 c!143561) b!1555100))

(assert (= (and b!1555105 (not c!143561)) b!1555097))

(assert (= (or b!1555100 b!1555097) bm!71486))

(assert (= (or b!1555104 bm!71486) bm!71487))

(assert (= (or b!1555106 bm!71487) bm!71485))

(assert (= (and bm!71485 c!143558) b!1555101))

(assert (= (and bm!71485 (not c!143558)) b!1555096))

(assert (= (and d!161895 res!1064105) b!1555103))

(assert (= (and b!1555103 res!1064104) b!1555102))

(declare-fun m!1433197 () Bool)

(assert (=> d!161895 m!1433197))

(assert (=> d!161895 m!1433105))

(declare-fun m!1433199 () Bool)

(assert (=> b!1555103 m!1433199))

(declare-fun m!1433201 () Bool)

(assert (=> b!1555102 m!1433201))

(declare-fun m!1433203 () Bool)

(assert (=> bm!71485 m!1433203))

(declare-fun m!1433205 () Bool)

(assert (=> b!1555101 m!1433205))

(assert (=> b!1554874 d!161895))

(declare-fun d!161899 () Bool)

(declare-fun res!1064106 () Bool)

(declare-fun e!865993 () Bool)

(assert (=> d!161899 (=> res!1064106 e!865993)))

(assert (=> d!161899 (= res!1064106 (and (is-Cons!36250 (t!50975 l!1177)) (= (_1!12419 (h!37696 (t!50975 l!1177))) otherKey!50)))))

(assert (=> d!161899 (= (containsKey!784 (t!50975 l!1177) otherKey!50) e!865993)))

(declare-fun b!1555110 () Bool)

(declare-fun e!865994 () Bool)

(assert (=> b!1555110 (= e!865993 e!865994)))

(declare-fun res!1064107 () Bool)

(assert (=> b!1555110 (=> (not res!1064107) (not e!865994))))

(assert (=> b!1555110 (= res!1064107 (and (or (not (is-Cons!36250 (t!50975 l!1177))) (bvsle (_1!12419 (h!37696 (t!50975 l!1177))) otherKey!50)) (is-Cons!36250 (t!50975 l!1177)) (bvslt (_1!12419 (h!37696 (t!50975 l!1177))) otherKey!50)))))

(declare-fun b!1555111 () Bool)

(assert (=> b!1555111 (= e!865994 (containsKey!784 (t!50975 (t!50975 l!1177)) otherKey!50))))

(assert (= (and d!161899 (not res!1064106)) b!1555110))

(assert (= (and b!1555110 res!1064107) b!1555111))

(declare-fun m!1433207 () Bool)

(assert (=> b!1555111 m!1433207))

(assert (=> b!1554874 d!161899))

(declare-fun d!161901 () Bool)

(declare-fun res!1064108 () Bool)

(declare-fun e!865995 () Bool)

(assert (=> d!161901 (=> res!1064108 e!865995)))

(assert (=> d!161901 (= res!1064108 (or (is-Nil!36251 (insertStrictlySorted!524 l!1177 newKey!105 newValue!105)) (is-Nil!36251 (t!50975 (insertStrictlySorted!524 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!161901 (= (isStrictlySorted!913 (insertStrictlySorted!524 l!1177 newKey!105 newValue!105)) e!865995)))

(declare-fun b!1555112 () Bool)

