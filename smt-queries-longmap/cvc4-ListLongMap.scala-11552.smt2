; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134490 () Bool)

(assert start!134490)

(declare-fun res!1072857 () Bool)

(declare-fun e!875206 () Bool)

(assert (=> start!134490 (=> (not res!1072857) (not e!875206))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134490 (= res!1072857 (not (= key1!37 key2!21)))))

(assert (=> start!134490 e!875206))

(declare-fun tp_is_empty!39101 () Bool)

(assert (=> start!134490 tp_is_empty!39101))

(declare-fun e!875207 () Bool)

(assert (=> start!134490 e!875207))

(assert (=> start!134490 true))

(declare-fun b!1569932 () Bool)

(declare-fun tp!114216 () Bool)

(assert (=> b!1569932 (= e!875207 (and tp_is_empty!39101 tp!114216))))

(declare-datatypes ((B!2550 0))(
  ( (B!2551 (val!19637 Int)) )
))
(declare-fun v1!32 () B!2550)

(declare-fun v2!10 () B!2550)

(declare-datatypes ((tuple2!25376 0))(
  ( (tuple2!25377 (_1!12699 (_ BitVec 64)) (_2!12699 B!2550)) )
))
(declare-datatypes ((List!36757 0))(
  ( (Nil!36754) (Cons!36753 (h!38200 tuple2!25376) (t!51665 List!36757)) )
))
(declare-fun l!750 () List!36757)

(declare-fun b!1569933 () Bool)

(declare-fun insertStrictlySorted!598 (List!36757 (_ BitVec 64) B!2550) List!36757)

(assert (=> b!1569933 (= e!875206 (not (= (insertStrictlySorted!598 (insertStrictlySorted!598 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!598 (insertStrictlySorted!598 l!750 key2!21 v2!10) key1!37 v1!32))))))

(assert (=> b!1569933 (= (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52100 0))(
  ( (Unit!52101) )
))
(declare-fun lt!673345 () Unit!52100)

(declare-fun lemmaInsertStrictlySortedCommutative!18 (List!36757 (_ BitVec 64) B!2550 (_ BitVec 64) B!2550) Unit!52100)

(assert (=> b!1569933 (= lt!673345 (lemmaInsertStrictlySortedCommutative!18 (t!51665 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1569934 () Bool)

(declare-fun res!1072859 () Bool)

(assert (=> b!1569934 (=> (not res!1072859) (not e!875206))))

(declare-fun isStrictlySorted!1021 (List!36757) Bool)

(assert (=> b!1569934 (= res!1072859 (isStrictlySorted!1021 (t!51665 l!750)))))

(declare-fun b!1569935 () Bool)

(declare-fun res!1072860 () Bool)

(assert (=> b!1569935 (=> (not res!1072860) (not e!875206))))

(assert (=> b!1569935 (= res!1072860 (isStrictlySorted!1021 l!750))))

(declare-fun b!1569936 () Bool)

(declare-fun res!1072858 () Bool)

(assert (=> b!1569936 (=> (not res!1072858) (not e!875206))))

(assert (=> b!1569936 (= res!1072858 (and (is-Cons!36753 l!750) (bvslt (_1!12699 (h!38200 l!750)) key1!37) (bvslt (_1!12699 (h!38200 l!750)) key2!21)))))

(assert (= (and start!134490 res!1072857) b!1569935))

(assert (= (and b!1569935 res!1072860) b!1569936))

(assert (= (and b!1569936 res!1072858) b!1569934))

(assert (= (and b!1569934 res!1072859) b!1569933))

(assert (= (and start!134490 (is-Cons!36753 l!750)) b!1569932))

(declare-fun m!1443981 () Bool)

(assert (=> b!1569933 m!1443981))

(declare-fun m!1443983 () Bool)

(assert (=> b!1569933 m!1443983))

(declare-fun m!1443985 () Bool)

(assert (=> b!1569933 m!1443985))

(declare-fun m!1443987 () Bool)

(assert (=> b!1569933 m!1443987))

(declare-fun m!1443989 () Bool)

(assert (=> b!1569933 m!1443989))

(assert (=> b!1569933 m!1443983))

(declare-fun m!1443991 () Bool)

(assert (=> b!1569933 m!1443991))

(assert (=> b!1569933 m!1443987))

(declare-fun m!1443993 () Bool)

(assert (=> b!1569933 m!1443993))

(declare-fun m!1443995 () Bool)

(assert (=> b!1569933 m!1443995))

(assert (=> b!1569933 m!1443993))

(assert (=> b!1569933 m!1443981))

(declare-fun m!1443997 () Bool)

(assert (=> b!1569933 m!1443997))

(declare-fun m!1443999 () Bool)

(assert (=> b!1569934 m!1443999))

(declare-fun m!1444001 () Bool)

(assert (=> b!1569935 m!1444001))

(push 1)

(assert (not b!1569934))

(assert tp_is_empty!39101)

(assert (not b!1569932))

(assert (not b!1569933))

(assert (not b!1569935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163975 () Bool)

(declare-fun res!1072865 () Bool)

(declare-fun e!875212 () Bool)

(assert (=> d!163975 (=> res!1072865 e!875212)))

(assert (=> d!163975 (= res!1072865 (or (is-Nil!36754 l!750) (is-Nil!36754 (t!51665 l!750))))))

(assert (=> d!163975 (= (isStrictlySorted!1021 l!750) e!875212)))

(declare-fun b!1569941 () Bool)

(declare-fun e!875213 () Bool)

(assert (=> b!1569941 (= e!875212 e!875213)))

(declare-fun res!1072866 () Bool)

(assert (=> b!1569941 (=> (not res!1072866) (not e!875213))))

(assert (=> b!1569941 (= res!1072866 (bvslt (_1!12699 (h!38200 l!750)) (_1!12699 (h!38200 (t!51665 l!750)))))))

(declare-fun b!1569942 () Bool)

(assert (=> b!1569942 (= e!875213 (isStrictlySorted!1021 (t!51665 l!750)))))

(assert (= (and d!163975 (not res!1072865)) b!1569941))

(assert (= (and b!1569941 res!1072866) b!1569942))

(assert (=> b!1569942 m!1443999))

(assert (=> b!1569935 d!163975))

(declare-fun b!1570013 () Bool)

(declare-fun e!875253 () Bool)

(declare-fun lt!673353 () List!36757)

(declare-fun contains!10428 (List!36757 tuple2!25376) Bool)

(assert (=> b!1570013 (= e!875253 (contains!10428 lt!673353 (tuple2!25377 key1!37 v1!32)))))

(declare-fun c!144825 () Bool)

(declare-fun b!1570014 () Bool)

(declare-fun c!144827 () Bool)

(declare-fun e!875252 () List!36757)

(assert (=> b!1570014 (= e!875252 (ite c!144825 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (ite c!144827 (Cons!36753 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) Nil!36754)))))

(declare-fun b!1570015 () Bool)

(declare-fun e!875250 () List!36757)

(declare-fun call!72141 () List!36757)

(assert (=> b!1570015 (= e!875250 call!72141)))

(declare-fun b!1570016 () Bool)

(assert (=> b!1570016 (= e!875252 (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun bm!72138 () Bool)

(declare-fun c!144826 () Bool)

(declare-fun call!72143 () List!36757)

(declare-fun $colon$colon!1001 (List!36757 tuple2!25376) List!36757)

(assert (=> bm!72138 (= call!72143 ($colon$colon!1001 e!875252 (ite c!144826 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (tuple2!25377 key1!37 v1!32))))))

(declare-fun c!144824 () Bool)

(assert (=> bm!72138 (= c!144824 c!144826)))

(declare-fun d!163979 () Bool)

(assert (=> d!163979 e!875253))

(declare-fun res!1072882 () Bool)

(assert (=> d!163979 (=> (not res!1072882) (not e!875253))))

(assert (=> d!163979 (= res!1072882 (isStrictlySorted!1021 lt!673353))))

(declare-fun e!875249 () List!36757)

(assert (=> d!163979 (= lt!673353 e!875249)))

(assert (=> d!163979 (= c!144826 (and (is-Cons!36753 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!163979 (isStrictlySorted!1021 (insertStrictlySorted!598 l!750 key2!21 v2!10))))

(assert (=> d!163979 (= (insertStrictlySorted!598 (insertStrictlySorted!598 l!750 key2!21 v2!10) key1!37 v1!32) lt!673353)))

(declare-fun bm!72139 () Bool)

(assert (=> bm!72139 (= call!72141 call!72143)))

(declare-fun b!1570017 () Bool)

(declare-fun res!1072881 () Bool)

(assert (=> b!1570017 (=> (not res!1072881) (not e!875253))))

(declare-fun containsKey!870 (List!36757 (_ BitVec 64)) Bool)

(assert (=> b!1570017 (= res!1072881 (containsKey!870 lt!673353 key1!37))))

(declare-fun b!1570018 () Bool)

(assert (=> b!1570018 (= c!144827 (and (is-Cons!36753 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (bvsgt (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun e!875251 () List!36757)

(assert (=> b!1570018 (= e!875250 e!875251)))

(declare-fun b!1570019 () Bool)

(declare-fun call!72142 () List!36757)

(assert (=> b!1570019 (= e!875251 call!72142)))

(declare-fun bm!72140 () Bool)

(assert (=> bm!72140 (= call!72142 call!72141)))

(declare-fun b!1570020 () Bool)

(assert (=> b!1570020 (= e!875249 call!72143)))

(declare-fun b!1570021 () Bool)

(assert (=> b!1570021 (= e!875251 call!72142)))

(declare-fun b!1570022 () Bool)

(assert (=> b!1570022 (= e!875249 e!875250)))

(assert (=> b!1570022 (= c!144825 (and (is-Cons!36753 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (= (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10))) key1!37)))))

(assert (= (and d!163979 c!144826) b!1570020))

(assert (= (and d!163979 (not c!144826)) b!1570022))

(assert (= (and b!1570022 c!144825) b!1570015))

(assert (= (and b!1570022 (not c!144825)) b!1570018))

(assert (= (and b!1570018 c!144827) b!1570021))

(assert (= (and b!1570018 (not c!144827)) b!1570019))

(assert (= (or b!1570021 b!1570019) bm!72140))

(assert (= (or b!1570015 bm!72140) bm!72139))

(assert (= (or b!1570020 bm!72139) bm!72138))

(assert (= (and bm!72138 c!144824) b!1570016))

(assert (= (and bm!72138 (not c!144824)) b!1570014))

(assert (= (and d!163979 res!1072882) b!1570017))

(assert (= (and b!1570017 res!1072881) b!1570013))

(declare-fun m!1444015 () Bool)

(assert (=> b!1570016 m!1444015))

(declare-fun m!1444017 () Bool)

(assert (=> b!1570017 m!1444017))

(declare-fun m!1444019 () Bool)

(assert (=> b!1570013 m!1444019))

(declare-fun m!1444025 () Bool)

(assert (=> bm!72138 m!1444025))

(declare-fun m!1444027 () Bool)

(assert (=> d!163979 m!1444027))

(assert (=> d!163979 m!1443993))

(declare-fun m!1444029 () Bool)

(assert (=> d!163979 m!1444029))

(assert (=> b!1569933 d!163979))

(declare-fun d!163983 () Bool)

(assert (=> d!163983 (= (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673365 () Unit!52100)

(declare-fun choose!2086 (List!36757 (_ BitVec 64) B!2550 (_ BitVec 64) B!2550) Unit!52100)

(assert (=> d!163983 (= lt!673365 (choose!2086 (t!51665 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163983 (not (= key1!37 key2!21))))

(assert (=> d!163983 (= (lemmaInsertStrictlySortedCommutative!18 (t!51665 l!750) key1!37 v1!32 key2!21 v2!10) lt!673365)))

(declare-fun bs!45227 () Bool)

(assert (= bs!45227 d!163983))

(assert (=> bs!45227 m!1443983))

(assert (=> bs!45227 m!1443985))

(assert (=> bs!45227 m!1443983))

(declare-fun m!1444071 () Bool)

(assert (=> bs!45227 m!1444071))

(assert (=> bs!45227 m!1443981))

(assert (=> bs!45227 m!1443997))

(assert (=> bs!45227 m!1443981))

(assert (=> b!1569933 d!163983))

(declare-fun lt!673368 () List!36757)

(declare-fun e!875283 () Bool)

(declare-fun b!1570073 () Bool)

(assert (=> b!1570073 (= e!875283 (contains!10428 lt!673368 (tuple2!25377 key2!21 v2!10)))))

(declare-fun e!875282 () List!36757)

(declare-fun c!144849 () Bool)

(declare-fun b!1570074 () Bool)

(declare-fun c!144851 () Bool)

(assert (=> b!1570074 (= e!875282 (ite c!144849 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (ite c!144851 (Cons!36753 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) Nil!36754)))))

(declare-fun b!1570075 () Bool)

(declare-fun e!875280 () List!36757)

(declare-fun call!72159 () List!36757)

(assert (=> b!1570075 (= e!875280 call!72159)))

(declare-fun b!1570076 () Bool)

(assert (=> b!1570076 (= e!875282 (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun c!144850 () Bool)

(declare-fun call!72161 () List!36757)

(declare-fun bm!72156 () Bool)

(assert (=> bm!72156 (= call!72161 ($colon$colon!1001 e!875282 (ite c!144850 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (tuple2!25377 key2!21 v2!10))))))

(declare-fun c!144848 () Bool)

(assert (=> bm!72156 (= c!144848 c!144850)))

(declare-fun d!163995 () Bool)

(assert (=> d!163995 e!875283))

(declare-fun res!1072894 () Bool)

(assert (=> d!163995 (=> (not res!1072894) (not e!875283))))

(assert (=> d!163995 (= res!1072894 (isStrictlySorted!1021 lt!673368))))

(declare-fun e!875279 () List!36757)

(assert (=> d!163995 (= lt!673368 e!875279)))

(assert (=> d!163995 (= c!144850 (and (is-Cons!36753 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!163995 (isStrictlySorted!1021 (insertStrictlySorted!598 l!750 key1!37 v1!32))))

(assert (=> d!163995 (= (insertStrictlySorted!598 (insertStrictlySorted!598 l!750 key1!37 v1!32) key2!21 v2!10) lt!673368)))

(declare-fun bm!72157 () Bool)

(assert (=> bm!72157 (= call!72159 call!72161)))

(declare-fun b!1570077 () Bool)

(declare-fun res!1072893 () Bool)

(assert (=> b!1570077 (=> (not res!1072893) (not e!875283))))

(assert (=> b!1570077 (= res!1072893 (containsKey!870 lt!673368 key2!21))))

(declare-fun b!1570078 () Bool)

(assert (=> b!1570078 (= c!144851 (and (is-Cons!36753 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (bvsgt (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun e!875281 () List!36757)

(assert (=> b!1570078 (= e!875280 e!875281)))

(declare-fun b!1570079 () Bool)

(declare-fun call!72160 () List!36757)

(assert (=> b!1570079 (= e!875281 call!72160)))

(declare-fun bm!72158 () Bool)

(assert (=> bm!72158 (= call!72160 call!72159)))

(declare-fun b!1570080 () Bool)

(assert (=> b!1570080 (= e!875279 call!72161)))

(declare-fun b!1570081 () Bool)

(assert (=> b!1570081 (= e!875281 call!72160)))

(declare-fun b!1570082 () Bool)

(assert (=> b!1570082 (= e!875279 e!875280)))

(assert (=> b!1570082 (= c!144849 (and (is-Cons!36753 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (= (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32))) key2!21)))))

(assert (= (and d!163995 c!144850) b!1570080))

(assert (= (and d!163995 (not c!144850)) b!1570082))

(assert (= (and b!1570082 c!144849) b!1570075))

(assert (= (and b!1570082 (not c!144849)) b!1570078))

(assert (= (and b!1570078 c!144851) b!1570081))

(assert (= (and b!1570078 (not c!144851)) b!1570079))

(assert (= (or b!1570081 b!1570079) bm!72158))

(assert (= (or b!1570075 bm!72158) bm!72157))

(assert (= (or b!1570080 bm!72157) bm!72156))

(assert (= (and bm!72156 c!144848) b!1570076))

(assert (= (and bm!72156 (not c!144848)) b!1570074))

(assert (= (and d!163995 res!1072894) b!1570077))

(assert (= (and b!1570077 res!1072893) b!1570073))

(declare-fun m!1444085 () Bool)

(assert (=> b!1570076 m!1444085))

(declare-fun m!1444087 () Bool)

(assert (=> b!1570077 m!1444087))

(declare-fun m!1444089 () Bool)

(assert (=> b!1570073 m!1444089))

(declare-fun m!1444095 () Bool)

(assert (=> bm!72156 m!1444095))

(declare-fun m!1444097 () Bool)

(assert (=> d!163995 m!1444097))

(assert (=> d!163995 m!1443987))

(declare-fun m!1444101 () Bool)

(assert (=> d!163995 m!1444101))

(assert (=> b!1569933 d!163995))

(declare-fun b!1570103 () Bool)

(declare-fun lt!673371 () List!36757)

(declare-fun e!875298 () Bool)

(assert (=> b!1570103 (= e!875298 (contains!10428 lt!673371 (tuple2!25377 key2!21 v2!10)))))

(declare-fun c!144861 () Bool)

(declare-fun b!1570104 () Bool)

(declare-fun e!875297 () List!36757)

(declare-fun c!144863 () Bool)

(assert (=> b!1570104 (= e!875297 (ite c!144861 (t!51665 l!750) (ite c!144863 (Cons!36753 (h!38200 l!750) (t!51665 l!750)) Nil!36754)))))

(declare-fun b!1570105 () Bool)

(declare-fun e!875295 () List!36757)

(declare-fun call!72168 () List!36757)

(assert (=> b!1570105 (= e!875295 call!72168)))

(declare-fun b!1570106 () Bool)

(assert (=> b!1570106 (= e!875297 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))))

(declare-fun bm!72165 () Bool)

(declare-fun call!72170 () List!36757)

(declare-fun c!144862 () Bool)

(assert (=> bm!72165 (= call!72170 ($colon$colon!1001 e!875297 (ite c!144862 (h!38200 l!750) (tuple2!25377 key2!21 v2!10))))))

(declare-fun c!144860 () Bool)

(assert (=> bm!72165 (= c!144860 c!144862)))

(declare-fun d!164001 () Bool)

(assert (=> d!164001 e!875298))

(declare-fun res!1072900 () Bool)

(assert (=> d!164001 (=> (not res!1072900) (not e!875298))))

(assert (=> d!164001 (= res!1072900 (isStrictlySorted!1021 lt!673371))))

(declare-fun e!875294 () List!36757)

(assert (=> d!164001 (= lt!673371 e!875294)))

(assert (=> d!164001 (= c!144862 (and (is-Cons!36753 l!750) (bvslt (_1!12699 (h!38200 l!750)) key2!21)))))

(assert (=> d!164001 (isStrictlySorted!1021 l!750)))

(assert (=> d!164001 (= (insertStrictlySorted!598 l!750 key2!21 v2!10) lt!673371)))

(declare-fun bm!72166 () Bool)

(assert (=> bm!72166 (= call!72168 call!72170)))

(declare-fun b!1570107 () Bool)

(declare-fun res!1072899 () Bool)

(assert (=> b!1570107 (=> (not res!1072899) (not e!875298))))

(assert (=> b!1570107 (= res!1072899 (containsKey!870 lt!673371 key2!21))))

(declare-fun b!1570108 () Bool)

(assert (=> b!1570108 (= c!144863 (and (is-Cons!36753 l!750) (bvsgt (_1!12699 (h!38200 l!750)) key2!21)))))

(declare-fun e!875296 () List!36757)

(assert (=> b!1570108 (= e!875295 e!875296)))

(declare-fun b!1570109 () Bool)

(declare-fun call!72169 () List!36757)

(assert (=> b!1570109 (= e!875296 call!72169)))

(declare-fun bm!72167 () Bool)

(assert (=> bm!72167 (= call!72169 call!72168)))

(declare-fun b!1570110 () Bool)

(assert (=> b!1570110 (= e!875294 call!72170)))

(declare-fun b!1570111 () Bool)

(assert (=> b!1570111 (= e!875296 call!72169)))

(declare-fun b!1570112 () Bool)

(assert (=> b!1570112 (= e!875294 e!875295)))

(assert (=> b!1570112 (= c!144861 (and (is-Cons!36753 l!750) (= (_1!12699 (h!38200 l!750)) key2!21)))))

(assert (= (and d!164001 c!144862) b!1570110))

(assert (= (and d!164001 (not c!144862)) b!1570112))

(assert (= (and b!1570112 c!144861) b!1570105))

(assert (= (and b!1570112 (not c!144861)) b!1570108))

(assert (= (and b!1570108 c!144863) b!1570111))

(assert (= (and b!1570108 (not c!144863)) b!1570109))

(assert (= (or b!1570111 b!1570109) bm!72167))

(assert (= (or b!1570105 bm!72167) bm!72166))

(assert (= (or b!1570110 bm!72166) bm!72165))

(assert (= (and bm!72165 c!144860) b!1570106))

(assert (= (and bm!72165 (not c!144860)) b!1570104))

(assert (= (and d!164001 res!1072900) b!1570107))

(assert (= (and b!1570107 res!1072899) b!1570103))

(assert (=> b!1570106 m!1443981))

(declare-fun m!1444119 () Bool)

(assert (=> b!1570107 m!1444119))

(declare-fun m!1444121 () Bool)

(assert (=> b!1570103 m!1444121))

(declare-fun m!1444125 () Bool)

(assert (=> bm!72165 m!1444125))

(declare-fun m!1444127 () Bool)

(assert (=> d!164001 m!1444127))

(assert (=> d!164001 m!1444001))

(assert (=> b!1569933 d!164001))

(declare-fun lt!673374 () List!36757)

(declare-fun b!1570133 () Bool)

(declare-fun e!875313 () Bool)

(assert (=> b!1570133 (= e!875313 (contains!10428 lt!673374 (tuple2!25377 key1!37 v1!32)))))

(declare-fun e!875312 () List!36757)

(declare-fun c!144875 () Bool)

(declare-fun b!1570134 () Bool)

(declare-fun c!144873 () Bool)

(assert (=> b!1570134 (= e!875312 (ite c!144873 (t!51665 l!750) (ite c!144875 (Cons!36753 (h!38200 l!750) (t!51665 l!750)) Nil!36754)))))

(declare-fun b!1570135 () Bool)

(declare-fun e!875310 () List!36757)

(declare-fun call!72177 () List!36757)

(assert (=> b!1570135 (= e!875310 call!72177)))

(declare-fun b!1570136 () Bool)

(assert (=> b!1570136 (= e!875312 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))))

(declare-fun c!144874 () Bool)

(declare-fun call!72179 () List!36757)

(declare-fun bm!72174 () Bool)

(assert (=> bm!72174 (= call!72179 ($colon$colon!1001 e!875312 (ite c!144874 (h!38200 l!750) (tuple2!25377 key1!37 v1!32))))))

(declare-fun c!144872 () Bool)

(assert (=> bm!72174 (= c!144872 c!144874)))

(declare-fun d!164007 () Bool)

(assert (=> d!164007 e!875313))

(declare-fun res!1072906 () Bool)

(assert (=> d!164007 (=> (not res!1072906) (not e!875313))))

(assert (=> d!164007 (= res!1072906 (isStrictlySorted!1021 lt!673374))))

(declare-fun e!875309 () List!36757)

(assert (=> d!164007 (= lt!673374 e!875309)))

(assert (=> d!164007 (= c!144874 (and (is-Cons!36753 l!750) (bvslt (_1!12699 (h!38200 l!750)) key1!37)))))

(assert (=> d!164007 (isStrictlySorted!1021 l!750)))

(assert (=> d!164007 (= (insertStrictlySorted!598 l!750 key1!37 v1!32) lt!673374)))

(declare-fun bm!72175 () Bool)

(assert (=> bm!72175 (= call!72177 call!72179)))

(declare-fun b!1570137 () Bool)

(declare-fun res!1072905 () Bool)

(assert (=> b!1570137 (=> (not res!1072905) (not e!875313))))

(assert (=> b!1570137 (= res!1072905 (containsKey!870 lt!673374 key1!37))))

(declare-fun b!1570138 () Bool)

(assert (=> b!1570138 (= c!144875 (and (is-Cons!36753 l!750) (bvsgt (_1!12699 (h!38200 l!750)) key1!37)))))

(declare-fun e!875311 () List!36757)

(assert (=> b!1570138 (= e!875310 e!875311)))

(declare-fun b!1570139 () Bool)

(declare-fun call!72178 () List!36757)

(assert (=> b!1570139 (= e!875311 call!72178)))

(declare-fun bm!72176 () Bool)

(assert (=> bm!72176 (= call!72178 call!72177)))

(declare-fun b!1570140 () Bool)

(assert (=> b!1570140 (= e!875309 call!72179)))

(declare-fun b!1570141 () Bool)

(assert (=> b!1570141 (= e!875311 call!72178)))

(declare-fun b!1570142 () Bool)

(assert (=> b!1570142 (= e!875309 e!875310)))

(assert (=> b!1570142 (= c!144873 (and (is-Cons!36753 l!750) (= (_1!12699 (h!38200 l!750)) key1!37)))))

(assert (= (and d!164007 c!144874) b!1570140))

(assert (= (and d!164007 (not c!144874)) b!1570142))

(assert (= (and b!1570142 c!144873) b!1570135))

(assert (= (and b!1570142 (not c!144873)) b!1570138))

(assert (= (and b!1570138 c!144875) b!1570141))

(assert (= (and b!1570138 (not c!144875)) b!1570139))

(assert (= (or b!1570141 b!1570139) bm!72176))

(assert (= (or b!1570135 bm!72176) bm!72175))

(assert (= (or b!1570140 bm!72175) bm!72174))

(assert (= (and bm!72174 c!144872) b!1570136))

(assert (= (and bm!72174 (not c!144872)) b!1570134))

(assert (= (and d!164007 res!1072906) b!1570137))

(assert (= (and b!1570137 res!1072905) b!1570133))

(assert (=> b!1570136 m!1443983))

(declare-fun m!1444147 () Bool)

(assert (=> b!1570137 m!1444147))

(declare-fun m!1444149 () Bool)

(assert (=> b!1570133 m!1444149))

(declare-fun m!1444153 () Bool)

(assert (=> bm!72174 m!1444153))

(declare-fun m!1444157 () Bool)

(assert (=> d!164007 m!1444157))

(assert (=> d!164007 m!1444001))

(assert (=> b!1569933 d!164007))

(declare-fun b!1570163 () Bool)

(declare-fun e!875328 () Bool)

(declare-fun lt!673377 () List!36757)

(assert (=> b!1570163 (= e!875328 (contains!10428 lt!673377 (tuple2!25377 key2!21 v2!10)))))

(declare-fun b!1570164 () Bool)

(declare-fun c!144887 () Bool)

(declare-fun e!875327 () List!36757)

(declare-fun c!144885 () Bool)

(assert (=> b!1570164 (= e!875327 (ite c!144885 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (ite c!144887 (Cons!36753 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) Nil!36754)))))

(declare-fun b!1570165 () Bool)

(declare-fun e!875325 () List!36757)

(declare-fun call!72186 () List!36757)

(assert (=> b!1570165 (= e!875325 call!72186)))

(declare-fun b!1570166 () Bool)

(assert (=> b!1570166 (= e!875327 (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun bm!72183 () Bool)

(declare-fun c!144886 () Bool)

(declare-fun call!72188 () List!36757)

(assert (=> bm!72183 (= call!72188 ($colon$colon!1001 e!875327 (ite c!144886 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (tuple2!25377 key2!21 v2!10))))))

(declare-fun c!144884 () Bool)

(assert (=> bm!72183 (= c!144884 c!144886)))

(declare-fun d!164013 () Bool)

(assert (=> d!164013 e!875328))

(declare-fun res!1072912 () Bool)

(assert (=> d!164013 (=> (not res!1072912) (not e!875328))))

(assert (=> d!164013 (= res!1072912 (isStrictlySorted!1021 lt!673377))))

(declare-fun e!875324 () List!36757)

(assert (=> d!164013 (= lt!673377 e!875324)))

(assert (=> d!164013 (= c!144886 (and (is-Cons!36753 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!164013 (isStrictlySorted!1021 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))))

(assert (=> d!164013 (= (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32) key2!21 v2!10) lt!673377)))

(declare-fun bm!72184 () Bool)

(assert (=> bm!72184 (= call!72186 call!72188)))

(declare-fun b!1570167 () Bool)

(declare-fun res!1072911 () Bool)

(assert (=> b!1570167 (=> (not res!1072911) (not e!875328))))

(assert (=> b!1570167 (= res!1072911 (containsKey!870 lt!673377 key2!21))))

(declare-fun b!1570168 () Bool)

(assert (=> b!1570168 (= c!144887 (and (is-Cons!36753 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (bvsgt (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!875326 () List!36757)

(assert (=> b!1570168 (= e!875325 e!875326)))

(declare-fun b!1570169 () Bool)

(declare-fun call!72187 () List!36757)

(assert (=> b!1570169 (= e!875326 call!72187)))

(declare-fun bm!72185 () Bool)

(assert (=> bm!72185 (= call!72187 call!72186)))

(declare-fun b!1570170 () Bool)

(assert (=> b!1570170 (= e!875324 call!72188)))

(declare-fun b!1570171 () Bool)

(assert (=> b!1570171 (= e!875326 call!72187)))

(declare-fun b!1570172 () Bool)

(assert (=> b!1570172 (= e!875324 e!875325)))

(assert (=> b!1570172 (= c!144885 (and (is-Cons!36753 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (= (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) key2!21)))))

(assert (= (and d!164013 c!144886) b!1570170))

(assert (= (and d!164013 (not c!144886)) b!1570172))

(assert (= (and b!1570172 c!144885) b!1570165))

(assert (= (and b!1570172 (not c!144885)) b!1570168))

(assert (= (and b!1570168 c!144887) b!1570171))

(assert (= (and b!1570168 (not c!144887)) b!1570169))

(assert (= (or b!1570171 b!1570169) bm!72185))

(assert (= (or b!1570165 bm!72185) bm!72184))

(assert (= (or b!1570170 bm!72184) bm!72183))

(assert (= (and bm!72183 c!144884) b!1570166))

(assert (= (and bm!72183 (not c!144884)) b!1570164))

(assert (= (and d!164013 res!1072912) b!1570167))

(assert (= (and b!1570167 res!1072911) b!1570163))

(declare-fun m!1444173 () Bool)

(assert (=> b!1570166 m!1444173))

(declare-fun m!1444175 () Bool)

(assert (=> b!1570167 m!1444175))

(declare-fun m!1444179 () Bool)

(assert (=> b!1570163 m!1444179))

(declare-fun m!1444183 () Bool)

(assert (=> bm!72183 m!1444183))

(declare-fun m!1444187 () Bool)

(assert (=> d!164013 m!1444187))

(assert (=> d!164013 m!1443983))

(declare-fun m!1444189 () Bool)

(assert (=> d!164013 m!1444189))

(assert (=> b!1569933 d!164013))

(declare-fun lt!673379 () List!36757)

(declare-fun b!1570183 () Bool)

(declare-fun e!875338 () Bool)

(assert (=> b!1570183 (= e!875338 (contains!10428 lt!673379 (tuple2!25377 key2!21 v2!10)))))

(declare-fun b!1570184 () Bool)

(declare-fun c!144895 () Bool)

(declare-fun c!144893 () Bool)

(declare-fun e!875337 () List!36757)

(assert (=> b!1570184 (= e!875337 (ite c!144893 (t!51665 (t!51665 l!750)) (ite c!144895 (Cons!36753 (h!38200 (t!51665 l!750)) (t!51665 (t!51665 l!750))) Nil!36754)))))

(declare-fun b!1570185 () Bool)

(declare-fun e!875335 () List!36757)

(declare-fun call!72192 () List!36757)

(assert (=> b!1570185 (= e!875335 call!72192)))

(declare-fun b!1570186 () Bool)

(assert (=> b!1570186 (= e!875337 (insertStrictlySorted!598 (t!51665 (t!51665 l!750)) key2!21 v2!10))))

(declare-fun call!72194 () List!36757)

(declare-fun bm!72189 () Bool)

(declare-fun c!144894 () Bool)

(assert (=> bm!72189 (= call!72194 ($colon$colon!1001 e!875337 (ite c!144894 (h!38200 (t!51665 l!750)) (tuple2!25377 key2!21 v2!10))))))

(declare-fun c!144892 () Bool)

(assert (=> bm!72189 (= c!144892 c!144894)))

(declare-fun d!164019 () Bool)

(assert (=> d!164019 e!875338))

(declare-fun res!1072916 () Bool)

(assert (=> d!164019 (=> (not res!1072916) (not e!875338))))

(assert (=> d!164019 (= res!1072916 (isStrictlySorted!1021 lt!673379))))

(declare-fun e!875334 () List!36757)

(assert (=> d!164019 (= lt!673379 e!875334)))

(assert (=> d!164019 (= c!144894 (and (is-Cons!36753 (t!51665 l!750)) (bvslt (_1!12699 (h!38200 (t!51665 l!750))) key2!21)))))

(assert (=> d!164019 (isStrictlySorted!1021 (t!51665 l!750))))

(assert (=> d!164019 (= (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10) lt!673379)))

(declare-fun bm!72190 () Bool)

(assert (=> bm!72190 (= call!72192 call!72194)))

(declare-fun b!1570187 () Bool)

(declare-fun res!1072915 () Bool)

(assert (=> b!1570187 (=> (not res!1072915) (not e!875338))))

(assert (=> b!1570187 (= res!1072915 (containsKey!870 lt!673379 key2!21))))

(declare-fun b!1570188 () Bool)

(assert (=> b!1570188 (= c!144895 (and (is-Cons!36753 (t!51665 l!750)) (bvsgt (_1!12699 (h!38200 (t!51665 l!750))) key2!21)))))

(declare-fun e!875336 () List!36757)

(assert (=> b!1570188 (= e!875335 e!875336)))

(declare-fun b!1570189 () Bool)

(declare-fun call!72193 () List!36757)

(assert (=> b!1570189 (= e!875336 call!72193)))

(declare-fun bm!72191 () Bool)

(assert (=> bm!72191 (= call!72193 call!72192)))

(declare-fun b!1570190 () Bool)

(assert (=> b!1570190 (= e!875334 call!72194)))

(declare-fun b!1570191 () Bool)

(assert (=> b!1570191 (= e!875336 call!72193)))

(declare-fun b!1570192 () Bool)

(assert (=> b!1570192 (= e!875334 e!875335)))

(assert (=> b!1570192 (= c!144893 (and (is-Cons!36753 (t!51665 l!750)) (= (_1!12699 (h!38200 (t!51665 l!750))) key2!21)))))

(assert (= (and d!164019 c!144894) b!1570190))

(assert (= (and d!164019 (not c!144894)) b!1570192))

(assert (= (and b!1570192 c!144893) b!1570185))

(assert (= (and b!1570192 (not c!144893)) b!1570188))

(assert (= (and b!1570188 c!144895) b!1570191))

(assert (= (and b!1570188 (not c!144895)) b!1570189))

(assert (= (or b!1570191 b!1570189) bm!72191))

(assert (= (or b!1570185 bm!72191) bm!72190))

(assert (= (or b!1570190 bm!72190) bm!72189))

(assert (= (and bm!72189 c!144892) b!1570186))

(assert (= (and bm!72189 (not c!144892)) b!1570184))

(assert (= (and d!164019 res!1072916) b!1570187))

(assert (= (and b!1570187 res!1072915) b!1570183))

(declare-fun m!1444197 () Bool)

(assert (=> b!1570186 m!1444197))

(declare-fun m!1444199 () Bool)

(assert (=> b!1570187 m!1444199))

(declare-fun m!1444203 () Bool)

(assert (=> b!1570183 m!1444203))

(declare-fun m!1444207 () Bool)

(assert (=> bm!72189 m!1444207))

(declare-fun m!1444209 () Bool)

(assert (=> d!164019 m!1444209))

(assert (=> d!164019 m!1443999))

(assert (=> b!1569933 d!164019))

(declare-fun e!875352 () Bool)

(declare-fun b!1570205 () Bool)

(declare-fun lt!673381 () List!36757)

(assert (=> b!1570205 (= e!875352 (contains!10428 lt!673381 (tuple2!25377 key1!37 v1!32)))))

(declare-fun b!1570206 () Bool)

(declare-fun c!144903 () Bool)

(declare-fun e!875351 () List!36757)

(declare-fun c!144901 () Bool)

(assert (=> b!1570206 (= e!875351 (ite c!144901 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (ite c!144903 (Cons!36753 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) Nil!36754)))))

(declare-fun b!1570207 () Bool)

(declare-fun e!875349 () List!36757)

(declare-fun call!72198 () List!36757)

(assert (=> b!1570207 (= e!875349 call!72198)))

(declare-fun b!1570208 () Bool)

(assert (=> b!1570208 (= e!875351 (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun c!144902 () Bool)

(declare-fun bm!72195 () Bool)

(declare-fun call!72200 () List!36757)

(assert (=> bm!72195 (= call!72200 ($colon$colon!1001 e!875351 (ite c!144902 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (tuple2!25377 key1!37 v1!32))))))

(declare-fun c!144900 () Bool)

(assert (=> bm!72195 (= c!144900 c!144902)))

(declare-fun d!164023 () Bool)

(assert (=> d!164023 e!875352))

(declare-fun res!1072924 () Bool)

(assert (=> d!164023 (=> (not res!1072924) (not e!875352))))

(assert (=> d!164023 (= res!1072924 (isStrictlySorted!1021 lt!673381))))

(declare-fun e!875348 () List!36757)

(assert (=> d!164023 (= lt!673381 e!875348)))

(assert (=> d!164023 (= c!144902 (and (is-Cons!36753 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!164023 (isStrictlySorted!1021 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))))

(assert (=> d!164023 (= (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10) key1!37 v1!32) lt!673381)))

(declare-fun bm!72196 () Bool)

(assert (=> bm!72196 (= call!72198 call!72200)))

(declare-fun b!1570209 () Bool)

(declare-fun res!1072923 () Bool)

(assert (=> b!1570209 (=> (not res!1072923) (not e!875352))))

(assert (=> b!1570209 (= res!1072923 (containsKey!870 lt!673381 key1!37))))

(declare-fun b!1570210 () Bool)

(assert (=> b!1570210 (= c!144903 (and (is-Cons!36753 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (bvsgt (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!875350 () List!36757)

(assert (=> b!1570210 (= e!875349 e!875350)))

(declare-fun b!1570212 () Bool)

(declare-fun call!72199 () List!36757)

(assert (=> b!1570212 (= e!875350 call!72199)))

(declare-fun bm!72197 () Bool)

(assert (=> bm!72197 (= call!72199 call!72198)))

(declare-fun b!1570214 () Bool)

(assert (=> b!1570214 (= e!875348 call!72200)))

(declare-fun b!1570215 () Bool)

(assert (=> b!1570215 (= e!875350 call!72199)))

(declare-fun b!1570216 () Bool)

(assert (=> b!1570216 (= e!875348 e!875349)))

(assert (=> b!1570216 (= c!144901 (and (is-Cons!36753 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (= (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) key1!37)))))

(assert (= (and d!164023 c!144902) b!1570214))

(assert (= (and d!164023 (not c!144902)) b!1570216))

(assert (= (and b!1570216 c!144901) b!1570207))

(assert (= (and b!1570216 (not c!144901)) b!1570210))

(assert (= (and b!1570210 c!144903) b!1570215))

(assert (= (and b!1570210 (not c!144903)) b!1570212))

(assert (= (or b!1570215 b!1570212) bm!72197))

(assert (= (or b!1570207 bm!72197) bm!72196))

(assert (= (or b!1570214 bm!72196) bm!72195))

(assert (= (and bm!72195 c!144900) b!1570208))

(assert (= (and bm!72195 (not c!144900)) b!1570206))

(assert (= (and d!164023 res!1072924) b!1570209))

(assert (= (and b!1570209 res!1072923) b!1570205))

(declare-fun m!1444217 () Bool)

(assert (=> b!1570208 m!1444217))

(declare-fun m!1444219 () Bool)

(assert (=> b!1570209 m!1444219))

(declare-fun m!1444223 () Bool)

(assert (=> b!1570205 m!1444223))

(declare-fun m!1444227 () Bool)

(assert (=> bm!72195 m!1444227))

(declare-fun m!1444231 () Bool)

(assert (=> d!164023 m!1444231))

(assert (=> d!164023 m!1443981))

(declare-fun m!1444235 () Bool)

(assert (=> d!164023 m!1444235))

(assert (=> b!1569933 d!164023))

(declare-fun e!875364 () Bool)

(declare-fun lt!673383 () List!36757)

(declare-fun b!1570229 () Bool)

(assert (=> b!1570229 (= e!875364 (contains!10428 lt!673383 (tuple2!25377 key1!37 v1!32)))))

(declare-fun c!144911 () Bool)

(declare-fun c!144909 () Bool)

(declare-fun b!1570230 () Bool)

(declare-fun e!875363 () List!36757)

(assert (=> b!1570230 (= e!875363 (ite c!144909 (t!51665 (t!51665 l!750)) (ite c!144911 (Cons!36753 (h!38200 (t!51665 l!750)) (t!51665 (t!51665 l!750))) Nil!36754)))))

(declare-fun b!1570231 () Bool)

(declare-fun e!875361 () List!36757)

(declare-fun call!72204 () List!36757)

(assert (=> b!1570231 (= e!875361 call!72204)))

(declare-fun b!1570232 () Bool)

(assert (=> b!1570232 (= e!875363 (insertStrictlySorted!598 (t!51665 (t!51665 l!750)) key1!37 v1!32))))

(declare-fun c!144910 () Bool)

(declare-fun bm!72201 () Bool)

(declare-fun call!72206 () List!36757)

(assert (=> bm!72201 (= call!72206 ($colon$colon!1001 e!875363 (ite c!144910 (h!38200 (t!51665 l!750)) (tuple2!25377 key1!37 v1!32))))))

(declare-fun c!144908 () Bool)

(assert (=> bm!72201 (= c!144908 c!144910)))

(declare-fun d!164027 () Bool)

(assert (=> d!164027 e!875364))

(declare-fun res!1072930 () Bool)

(assert (=> d!164027 (=> (not res!1072930) (not e!875364))))

(assert (=> d!164027 (= res!1072930 (isStrictlySorted!1021 lt!673383))))

(declare-fun e!875360 () List!36757)

(assert (=> d!164027 (= lt!673383 e!875360)))

(assert (=> d!164027 (= c!144910 (and (is-Cons!36753 (t!51665 l!750)) (bvslt (_1!12699 (h!38200 (t!51665 l!750))) key1!37)))))

(assert (=> d!164027 (isStrictlySorted!1021 (t!51665 l!750))))

(assert (=> d!164027 (= (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32) lt!673383)))

(declare-fun bm!72202 () Bool)

(assert (=> bm!72202 (= call!72204 call!72206)))

(declare-fun b!1570233 () Bool)

(declare-fun res!1072929 () Bool)

(assert (=> b!1570233 (=> (not res!1072929) (not e!875364))))

(assert (=> b!1570233 (= res!1072929 (containsKey!870 lt!673383 key1!37))))

(declare-fun b!1570234 () Bool)

(assert (=> b!1570234 (= c!144911 (and (is-Cons!36753 (t!51665 l!750)) (bvsgt (_1!12699 (h!38200 (t!51665 l!750))) key1!37)))))

(declare-fun e!875362 () List!36757)

(assert (=> b!1570234 (= e!875361 e!875362)))

(declare-fun b!1570235 () Bool)

(declare-fun call!72205 () List!36757)

(assert (=> b!1570235 (= e!875362 call!72205)))

(declare-fun bm!72203 () Bool)

(assert (=> bm!72203 (= call!72205 call!72204)))

(declare-fun b!1570236 () Bool)

(assert (=> b!1570236 (= e!875360 call!72206)))

(declare-fun b!1570237 () Bool)

(assert (=> b!1570237 (= e!875362 call!72205)))

(declare-fun b!1570238 () Bool)

(assert (=> b!1570238 (= e!875360 e!875361)))

(assert (=> b!1570238 (= c!144909 (and (is-Cons!36753 (t!51665 l!750)) (= (_1!12699 (h!38200 (t!51665 l!750))) key1!37)))))

(assert (= (and d!164027 c!144910) b!1570236))

(assert (= (and d!164027 (not c!144910)) b!1570238))

(assert (= (and b!1570238 c!144909) b!1570231))

(assert (= (and b!1570238 (not c!144909)) b!1570234))

(assert (= (and b!1570234 c!144911) b!1570237))

(assert (= (and b!1570234 (not c!144911)) b!1570235))

(assert (= (or b!1570237 b!1570235) bm!72203))

(assert (= (or b!1570231 bm!72203) bm!72202))

(assert (= (or b!1570236 bm!72202) bm!72201))

(assert (= (and bm!72201 c!144908) b!1570232))

(assert (= (and bm!72201 (not c!144908)) b!1570230))

(assert (= (and d!164027 res!1072930) b!1570233))

(assert (= (and b!1570233 res!1072929) b!1570229))

(declare-fun m!1444243 () Bool)

(assert (=> b!1570232 m!1444243))

(declare-fun m!1444245 () Bool)

(assert (=> b!1570233 m!1444245))

(declare-fun m!1444249 () Bool)

(assert (=> b!1570229 m!1444249))

(declare-fun m!1444253 () Bool)

(assert (=> bm!72201 m!1444253))

(declare-fun m!1444255 () Bool)

(assert (=> d!164027 m!1444255))

(assert (=> d!164027 m!1443999))

(assert (=> b!1569933 d!164027))

(declare-fun d!164033 () Bool)

(declare-fun res!1072935 () Bool)

(declare-fun e!875375 () Bool)

(assert (=> d!164033 (=> res!1072935 e!875375)))

(assert (=> d!164033 (= res!1072935 (or (is-Nil!36754 (t!51665 l!750)) (is-Nil!36754 (t!51665 (t!51665 l!750)))))))

(assert (=> d!164033 (= (isStrictlySorted!1021 (t!51665 l!750)) e!875375)))

(declare-fun b!1570256 () Bool)

(declare-fun e!875376 () Bool)

(assert (=> b!1570256 (= e!875375 e!875376)))

(declare-fun res!1072936 () Bool)

(assert (=> b!1570256 (=> (not res!1072936) (not e!875376))))

(assert (=> b!1570256 (= res!1072936 (bvslt (_1!12699 (h!38200 (t!51665 l!750))) (_1!12699 (h!38200 (t!51665 (t!51665 l!750))))))))

(declare-fun b!1570257 () Bool)

(assert (=> b!1570257 (= e!875376 (isStrictlySorted!1021 (t!51665 (t!51665 l!750))))))

(assert (= (and d!164033 (not res!1072935)) b!1570256))

(assert (= (and b!1570256 res!1072936) b!1570257))

(declare-fun m!1444263 () Bool)

(assert (=> b!1570257 m!1444263))

(assert (=> b!1569934 d!164033))

(declare-fun b!1570262 () Bool)

(declare-fun e!875379 () Bool)

(declare-fun tp!114222 () Bool)

(assert (=> b!1570262 (= e!875379 (and tp_is_empty!39101 tp!114222))))

(assert (=> b!1569932 (= tp!114216 e!875379)))

(assert (= (and b!1569932 (is-Cons!36753 (t!51665 l!750))) b!1570262))

(push 1)

(assert (not b!1570016))

(assert (not b!1570077))

(assert (not d!163979))

(assert (not b!1570232))

(assert (not b!1570187))

(assert (not b!1570103))

(assert (not bm!72201))

(assert (not b!1570209))

(assert (not b!1570186))

(assert (not bm!72165))

(assert (not b!1570076))

(assert (not b!1570163))

(assert (not bm!72138))

(assert tp_is_empty!39101)

(assert (not b!1569942))

(assert (not b!1570167))

(assert (not bm!72156))

(assert (not b!1570262))

(assert (not bm!72189))

(assert (not b!1570137))

(assert (not b!1570233))

(assert (not d!163983))

(assert (not b!1570183))

(assert (not b!1570166))

(assert (not d!164013))

(assert (not b!1570106))

(assert (not b!1570257))

(assert (not d!164027))

(assert (not d!164001))

(assert (not b!1570229))

(assert (not b!1570133))

(assert (not d!163995))

(assert (not bm!72195))

(assert (not b!1570073))

(assert (not b!1570208))

(assert (not b!1570017))

(assert (not b!1570013))

(assert (not bm!72174))

(assert (not bm!72183))

(assert (not d!164007))

(assert (not d!164019))

(assert (not b!1570107))

(assert (not d!164023))

(assert (not b!1570136))

(assert (not b!1570205))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164137 () Bool)

(assert (=> d!164137 (= ($colon$colon!1001 e!875252 (ite c!144826 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (tuple2!25377 key1!37 v1!32))) (Cons!36753 (ite c!144826 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (tuple2!25377 key1!37 v1!32)) e!875252))))

(assert (=> bm!72138 d!164137))

(declare-fun d!164143 () Bool)

(declare-fun res!1073045 () Bool)

(declare-fun e!875516 () Bool)

(assert (=> d!164143 (=> res!1073045 e!875516)))

(assert (=> d!164143 (= res!1073045 (and (is-Cons!36753 lt!673383) (= (_1!12699 (h!38200 lt!673383)) key1!37)))))

(assert (=> d!164143 (= (containsKey!870 lt!673383 key1!37) e!875516)))

(declare-fun b!1570441 () Bool)

(declare-fun e!875517 () Bool)

(assert (=> b!1570441 (= e!875516 e!875517)))

(declare-fun res!1073046 () Bool)

(assert (=> b!1570441 (=> (not res!1073046) (not e!875517))))

(assert (=> b!1570441 (= res!1073046 (and (or (not (is-Cons!36753 lt!673383)) (bvsle (_1!12699 (h!38200 lt!673383)) key1!37)) (is-Cons!36753 lt!673383) (bvslt (_1!12699 (h!38200 lt!673383)) key1!37)))))

(declare-fun b!1570442 () Bool)

(assert (=> b!1570442 (= e!875517 (containsKey!870 (t!51665 lt!673383) key1!37))))

(assert (= (and d!164143 (not res!1073045)) b!1570441))

(assert (= (and b!1570441 res!1073046) b!1570442))

(declare-fun m!1444449 () Bool)

(assert (=> b!1570442 m!1444449))

(assert (=> b!1570233 d!164143))

(declare-fun d!164153 () Bool)

(assert (=> d!164153 (= (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!598 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10) key1!37 v1!32))))

(assert (=> d!164153 true))

(declare-fun _$5!164 () Unit!52100)

(assert (=> d!164153 (= (choose!2086 (t!51665 l!750) key1!37 v1!32 key2!21 v2!10) _$5!164)))

(declare-fun bs!45230 () Bool)

(assert (= bs!45230 d!164153))

(assert (=> bs!45230 m!1443983))

(assert (=> bs!45230 m!1443983))

(assert (=> bs!45230 m!1443985))

(assert (=> bs!45230 m!1443981))

(assert (=> bs!45230 m!1443981))

(assert (=> bs!45230 m!1443997))

(assert (=> d!163983 d!164153))

(assert (=> d!163983 d!164013))

(assert (=> d!163983 d!164019))

(assert (=> d!163983 d!164023))

(assert (=> d!163983 d!164027))

(declare-fun d!164157 () Bool)

(declare-fun res!1073055 () Bool)

(declare-fun e!875526 () Bool)

(assert (=> d!164157 (=> res!1073055 e!875526)))

(assert (=> d!164157 (= res!1073055 (or (is-Nil!36754 lt!673379) (is-Nil!36754 (t!51665 lt!673379))))))

(assert (=> d!164157 (= (isStrictlySorted!1021 lt!673379) e!875526)))

(declare-fun b!1570451 () Bool)

(declare-fun e!875527 () Bool)

(assert (=> b!1570451 (= e!875526 e!875527)))

(declare-fun res!1073056 () Bool)

(assert (=> b!1570451 (=> (not res!1073056) (not e!875527))))

(assert (=> b!1570451 (= res!1073056 (bvslt (_1!12699 (h!38200 lt!673379)) (_1!12699 (h!38200 (t!51665 lt!673379)))))))

(declare-fun b!1570452 () Bool)

(assert (=> b!1570452 (= e!875527 (isStrictlySorted!1021 (t!51665 lt!673379)))))

(assert (= (and d!164157 (not res!1073055)) b!1570451))

(assert (= (and b!1570451 res!1073056) b!1570452))

(declare-fun m!1444463 () Bool)

(assert (=> b!1570452 m!1444463))

(assert (=> d!164019 d!164157))

(assert (=> d!164019 d!164033))

(declare-fun d!164161 () Bool)

(assert (=> d!164161 (= ($colon$colon!1001 e!875363 (ite c!144910 (h!38200 (t!51665 l!750)) (tuple2!25377 key1!37 v1!32))) (Cons!36753 (ite c!144910 (h!38200 (t!51665 l!750)) (tuple2!25377 key1!37 v1!32)) e!875363))))

(assert (=> bm!72201 d!164161))

(declare-fun lt!673407 () List!36757)

(declare-fun e!875536 () Bool)

(declare-fun b!1570457 () Bool)

(assert (=> b!1570457 (= e!875536 (contains!10428 lt!673407 (tuple2!25377 key1!37 v1!32)))))

(declare-fun c!144949 () Bool)

(declare-fun b!1570458 () Bool)

(declare-fun c!144951 () Bool)

(declare-fun e!875535 () List!36757)

(assert (=> b!1570458 (= e!875535 (ite c!144949 (t!51665 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) (ite c!144951 (Cons!36753 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) (t!51665 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)))) Nil!36754)))))

(declare-fun b!1570459 () Bool)

(declare-fun e!875533 () List!36757)

(declare-fun call!72234 () List!36757)

(assert (=> b!1570459 (= e!875533 call!72234)))

(declare-fun b!1570460 () Bool)

(assert (=> b!1570460 (= e!875535 (insertStrictlySorted!598 (t!51665 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun c!144950 () Bool)

(declare-fun call!72236 () List!36757)

(declare-fun bm!72231 () Bool)

(assert (=> bm!72231 (= call!72236 ($colon$colon!1001 e!875535 (ite c!144950 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) (tuple2!25377 key1!37 v1!32))))))

(declare-fun c!144948 () Bool)

(assert (=> bm!72231 (= c!144948 c!144950)))

(declare-fun d!164165 () Bool)

(assert (=> d!164165 e!875536))

(declare-fun res!1073062 () Bool)

(assert (=> d!164165 (=> (not res!1073062) (not e!875536))))

(assert (=> d!164165 (= res!1073062 (isStrictlySorted!1021 lt!673407))))

(declare-fun e!875532 () List!36757)

(assert (=> d!164165 (= lt!673407 e!875532)))

(assert (=> d!164165 (= c!144950 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) (bvslt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164165 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)))))

(assert (=> d!164165 (= (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673407)))

(declare-fun bm!72232 () Bool)

(assert (=> bm!72232 (= call!72234 call!72236)))

(declare-fun b!1570461 () Bool)

(declare-fun res!1073061 () Bool)

(assert (=> b!1570461 (=> (not res!1073061) (not e!875536))))

(assert (=> b!1570461 (= res!1073061 (containsKey!870 lt!673407 key1!37))))

(declare-fun b!1570462 () Bool)

(assert (=> b!1570462 (= c!144951 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) (bvsgt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun e!875534 () List!36757)

(assert (=> b!1570462 (= e!875533 e!875534)))

(declare-fun b!1570463 () Bool)

(declare-fun call!72235 () List!36757)

(assert (=> b!1570463 (= e!875534 call!72235)))

(declare-fun bm!72233 () Bool)

(assert (=> bm!72233 (= call!72235 call!72234)))

(declare-fun b!1570464 () Bool)

(assert (=> b!1570464 (= e!875532 call!72236)))

(declare-fun b!1570465 () Bool)

(assert (=> b!1570465 (= e!875534 call!72235)))

(declare-fun b!1570466 () Bool)

(assert (=> b!1570466 (= e!875532 e!875533)))

(assert (=> b!1570466 (= c!144949 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))) (= (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)))) key1!37)))))

(assert (= (and d!164165 c!144950) b!1570464))

(assert (= (and d!164165 (not c!144950)) b!1570466))

(assert (= (and b!1570466 c!144949) b!1570459))

(assert (= (and b!1570466 (not c!144949)) b!1570462))

(assert (= (and b!1570462 c!144951) b!1570465))

(assert (= (and b!1570462 (not c!144951)) b!1570463))

(assert (= (or b!1570465 b!1570463) bm!72233))

(assert (= (or b!1570459 bm!72233) bm!72232))

(assert (= (or b!1570464 bm!72232) bm!72231))

(assert (= (and bm!72231 c!144948) b!1570460))

(assert (= (and bm!72231 (not c!144948)) b!1570458))

(assert (= (and d!164165 res!1073062) b!1570461))

(assert (= (and b!1570461 res!1073061) b!1570457))

(declare-fun m!1444471 () Bool)

(assert (=> b!1570460 m!1444471))

(declare-fun m!1444473 () Bool)

(assert (=> b!1570461 m!1444473))

(declare-fun m!1444477 () Bool)

(assert (=> b!1570457 m!1444477))

(declare-fun m!1444479 () Bool)

(assert (=> bm!72231 m!1444479))

(declare-fun m!1444481 () Bool)

(assert (=> d!164165 m!1444481))

(declare-fun m!1444483 () Bool)

(assert (=> d!164165 m!1444483))

(assert (=> b!1570016 d!164165))

(declare-fun lt!673411 () Bool)

(declare-fun d!164175 () Bool)

(declare-fun content!819 (List!36757) (Set tuple2!25376))

(assert (=> d!164175 (= lt!673411 (member (tuple2!25377 key1!37 v1!32) (content!819 lt!673374)))))

(declare-fun e!875554 () Bool)

(assert (=> d!164175 (= lt!673411 e!875554)))

(declare-fun res!1073080 () Bool)

(assert (=> d!164175 (=> (not res!1073080) (not e!875554))))

(assert (=> d!164175 (= res!1073080 (is-Cons!36753 lt!673374))))

(assert (=> d!164175 (= (contains!10428 lt!673374 (tuple2!25377 key1!37 v1!32)) lt!673411)))

(declare-fun b!1570483 () Bool)

(declare-fun e!875553 () Bool)

(assert (=> b!1570483 (= e!875554 e!875553)))

(declare-fun res!1073079 () Bool)

(assert (=> b!1570483 (=> res!1073079 e!875553)))

(assert (=> b!1570483 (= res!1073079 (= (h!38200 lt!673374) (tuple2!25377 key1!37 v1!32)))))

(declare-fun b!1570484 () Bool)

(assert (=> b!1570484 (= e!875553 (contains!10428 (t!51665 lt!673374) (tuple2!25377 key1!37 v1!32)))))

(assert (= (and d!164175 res!1073080) b!1570483))

(assert (= (and b!1570483 (not res!1073079)) b!1570484))

(declare-fun m!1444495 () Bool)

(assert (=> d!164175 m!1444495))

(declare-fun m!1444497 () Bool)

(assert (=> d!164175 m!1444497))

(declare-fun m!1444499 () Bool)

(assert (=> b!1570484 m!1444499))

(assert (=> b!1570133 d!164175))

(declare-fun d!164187 () Bool)

(declare-fun res!1073081 () Bool)

(declare-fun e!875555 () Bool)

(assert (=> d!164187 (=> res!1073081 e!875555)))

(assert (=> d!164187 (= res!1073081 (and (is-Cons!36753 lt!673368) (= (_1!12699 (h!38200 lt!673368)) key2!21)))))

(assert (=> d!164187 (= (containsKey!870 lt!673368 key2!21) e!875555)))

(declare-fun b!1570485 () Bool)

(declare-fun e!875556 () Bool)

(assert (=> b!1570485 (= e!875555 e!875556)))

(declare-fun res!1073083 () Bool)

(assert (=> b!1570485 (=> (not res!1073083) (not e!875556))))

(assert (=> b!1570485 (= res!1073083 (and (or (not (is-Cons!36753 lt!673368)) (bvsle (_1!12699 (h!38200 lt!673368)) key2!21)) (is-Cons!36753 lt!673368) (bvslt (_1!12699 (h!38200 lt!673368)) key2!21)))))

(declare-fun b!1570486 () Bool)

(assert (=> b!1570486 (= e!875556 (containsKey!870 (t!51665 lt!673368) key2!21))))

(assert (= (and d!164187 (not res!1073081)) b!1570485))

(assert (= (and b!1570485 res!1073083) b!1570486))

(declare-fun m!1444501 () Bool)

(assert (=> b!1570486 m!1444501))

(assert (=> b!1570077 d!164187))

(declare-fun lt!673413 () List!36757)

(declare-fun b!1570497 () Bool)

(declare-fun e!875566 () Bool)

(assert (=> b!1570497 (= e!875566 (contains!10428 lt!673413 (tuple2!25377 key1!37 v1!32)))))

(declare-fun c!144959 () Bool)

(declare-fun c!144957 () Bool)

(declare-fun b!1570498 () Bool)

(declare-fun e!875565 () List!36757)

(assert (=> b!1570498 (= e!875565 (ite c!144957 (t!51665 (t!51665 (t!51665 l!750))) (ite c!144959 (Cons!36753 (h!38200 (t!51665 (t!51665 l!750))) (t!51665 (t!51665 (t!51665 l!750)))) Nil!36754)))))

(declare-fun b!1570499 () Bool)

(declare-fun e!875563 () List!36757)

(declare-fun call!72240 () List!36757)

(assert (=> b!1570499 (= e!875563 call!72240)))

(declare-fun b!1570500 () Bool)

(assert (=> b!1570500 (= e!875565 (insertStrictlySorted!598 (t!51665 (t!51665 (t!51665 l!750))) key1!37 v1!32))))

(declare-fun c!144958 () Bool)

(declare-fun call!72242 () List!36757)

(declare-fun bm!72237 () Bool)

(assert (=> bm!72237 (= call!72242 ($colon$colon!1001 e!875565 (ite c!144958 (h!38200 (t!51665 (t!51665 l!750))) (tuple2!25377 key1!37 v1!32))))))

(declare-fun c!144956 () Bool)

(assert (=> bm!72237 (= c!144956 c!144958)))

(declare-fun d!164189 () Bool)

(assert (=> d!164189 e!875566))

(declare-fun res!1073086 () Bool)

(assert (=> d!164189 (=> (not res!1073086) (not e!875566))))

(assert (=> d!164189 (= res!1073086 (isStrictlySorted!1021 lt!673413))))

(declare-fun e!875562 () List!36757)

(assert (=> d!164189 (= lt!673413 e!875562)))

(assert (=> d!164189 (= c!144958 (and (is-Cons!36753 (t!51665 (t!51665 l!750))) (bvslt (_1!12699 (h!38200 (t!51665 (t!51665 l!750)))) key1!37)))))

(assert (=> d!164189 (isStrictlySorted!1021 (t!51665 (t!51665 l!750)))))

(assert (=> d!164189 (= (insertStrictlySorted!598 (t!51665 (t!51665 l!750)) key1!37 v1!32) lt!673413)))

(declare-fun bm!72238 () Bool)

(assert (=> bm!72238 (= call!72240 call!72242)))

(declare-fun b!1570501 () Bool)

(declare-fun res!1073085 () Bool)

(assert (=> b!1570501 (=> (not res!1073085) (not e!875566))))

(assert (=> b!1570501 (= res!1073085 (containsKey!870 lt!673413 key1!37))))

(declare-fun b!1570502 () Bool)

(assert (=> b!1570502 (= c!144959 (and (is-Cons!36753 (t!51665 (t!51665 l!750))) (bvsgt (_1!12699 (h!38200 (t!51665 (t!51665 l!750)))) key1!37)))))

(declare-fun e!875564 () List!36757)

(assert (=> b!1570502 (= e!875563 e!875564)))

(declare-fun b!1570503 () Bool)

(declare-fun call!72241 () List!36757)

(assert (=> b!1570503 (= e!875564 call!72241)))

(declare-fun bm!72239 () Bool)

(assert (=> bm!72239 (= call!72241 call!72240)))

(declare-fun b!1570504 () Bool)

(assert (=> b!1570504 (= e!875562 call!72242)))

(declare-fun b!1570505 () Bool)

(assert (=> b!1570505 (= e!875564 call!72241)))

(declare-fun b!1570506 () Bool)

(assert (=> b!1570506 (= e!875562 e!875563)))

(assert (=> b!1570506 (= c!144957 (and (is-Cons!36753 (t!51665 (t!51665 l!750))) (= (_1!12699 (h!38200 (t!51665 (t!51665 l!750)))) key1!37)))))

(assert (= (and d!164189 c!144958) b!1570504))

(assert (= (and d!164189 (not c!144958)) b!1570506))

(assert (= (and b!1570506 c!144957) b!1570499))

(assert (= (and b!1570506 (not c!144957)) b!1570502))

(assert (= (and b!1570502 c!144959) b!1570505))

(assert (= (and b!1570502 (not c!144959)) b!1570503))

(assert (= (or b!1570505 b!1570503) bm!72239))

(assert (= (or b!1570499 bm!72239) bm!72238))

(assert (= (or b!1570504 bm!72238) bm!72237))

(assert (= (and bm!72237 c!144956) b!1570500))

(assert (= (and bm!72237 (not c!144956)) b!1570498))

(assert (= (and d!164189 res!1073086) b!1570501))

(assert (= (and b!1570501 res!1073085) b!1570497))

(declare-fun m!1444513 () Bool)

(assert (=> b!1570500 m!1444513))

(declare-fun m!1444515 () Bool)

(assert (=> b!1570501 m!1444515))

(declare-fun m!1444517 () Bool)

(assert (=> b!1570497 m!1444517))

(declare-fun m!1444521 () Bool)

(assert (=> bm!72237 m!1444521))

(declare-fun m!1444523 () Bool)

(assert (=> d!164189 m!1444523))

(assert (=> d!164189 m!1444263))

(assert (=> b!1570232 d!164189))

(declare-fun d!164195 () Bool)

(declare-fun lt!673414 () Bool)

(assert (=> d!164195 (= lt!673414 (member (tuple2!25377 key1!37 v1!32) (content!819 lt!673353)))))

(declare-fun e!875572 () Bool)

(assert (=> d!164195 (= lt!673414 e!875572)))

(declare-fun res!1073092 () Bool)

(assert (=> d!164195 (=> (not res!1073092) (not e!875572))))

(assert (=> d!164195 (= res!1073092 (is-Cons!36753 lt!673353))))

(assert (=> d!164195 (= (contains!10428 lt!673353 (tuple2!25377 key1!37 v1!32)) lt!673414)))

(declare-fun b!1570511 () Bool)

(declare-fun e!875571 () Bool)

(assert (=> b!1570511 (= e!875572 e!875571)))

(declare-fun res!1073091 () Bool)

(assert (=> b!1570511 (=> res!1073091 e!875571)))

(assert (=> b!1570511 (= res!1073091 (= (h!38200 lt!673353) (tuple2!25377 key1!37 v1!32)))))

(declare-fun b!1570512 () Bool)

(assert (=> b!1570512 (= e!875571 (contains!10428 (t!51665 lt!673353) (tuple2!25377 key1!37 v1!32)))))

(assert (= (and d!164195 res!1073092) b!1570511))

(assert (= (and b!1570511 (not res!1073091)) b!1570512))

(declare-fun m!1444527 () Bool)

(assert (=> d!164195 m!1444527))

(declare-fun m!1444529 () Bool)

(assert (=> d!164195 m!1444529))

(declare-fun m!1444531 () Bool)

(assert (=> b!1570512 m!1444531))

(assert (=> b!1570013 d!164195))

(declare-fun d!164199 () Bool)

(declare-fun res!1073095 () Bool)

(declare-fun e!875575 () Bool)

(assert (=> d!164199 (=> res!1073095 e!875575)))

(assert (=> d!164199 (= res!1073095 (or (is-Nil!36754 lt!673383) (is-Nil!36754 (t!51665 lt!673383))))))

(assert (=> d!164199 (= (isStrictlySorted!1021 lt!673383) e!875575)))

(declare-fun b!1570515 () Bool)

(declare-fun e!875576 () Bool)

(assert (=> b!1570515 (= e!875575 e!875576)))

(declare-fun res!1073096 () Bool)

(assert (=> b!1570515 (=> (not res!1073096) (not e!875576))))

(assert (=> b!1570515 (= res!1073096 (bvslt (_1!12699 (h!38200 lt!673383)) (_1!12699 (h!38200 (t!51665 lt!673383)))))))

(declare-fun b!1570516 () Bool)

(assert (=> b!1570516 (= e!875576 (isStrictlySorted!1021 (t!51665 lt!673383)))))

(assert (= (and d!164199 (not res!1073095)) b!1570515))

(assert (= (and b!1570515 res!1073096) b!1570516))

(declare-fun m!1444539 () Bool)

(assert (=> b!1570516 m!1444539))

(assert (=> d!164027 d!164199))

(assert (=> d!164027 d!164033))

(declare-fun d!164203 () Bool)

(declare-fun res!1073097 () Bool)

(declare-fun e!875577 () Bool)

(assert (=> d!164203 (=> res!1073097 e!875577)))

(assert (=> d!164203 (= res!1073097 (or (is-Nil!36754 lt!673368) (is-Nil!36754 (t!51665 lt!673368))))))

(assert (=> d!164203 (= (isStrictlySorted!1021 lt!673368) e!875577)))

(declare-fun b!1570517 () Bool)

(declare-fun e!875578 () Bool)

(assert (=> b!1570517 (= e!875577 e!875578)))

(declare-fun res!1073098 () Bool)

(assert (=> b!1570517 (=> (not res!1073098) (not e!875578))))

(assert (=> b!1570517 (= res!1073098 (bvslt (_1!12699 (h!38200 lt!673368)) (_1!12699 (h!38200 (t!51665 lt!673368)))))))

(declare-fun b!1570518 () Bool)

(assert (=> b!1570518 (= e!875578 (isStrictlySorted!1021 (t!51665 lt!673368)))))

(assert (= (and d!164203 (not res!1073097)) b!1570517))

(assert (= (and b!1570517 res!1073098) b!1570518))

(declare-fun m!1444541 () Bool)

(assert (=> b!1570518 m!1444541))

(assert (=> d!163995 d!164203))

(declare-fun d!164207 () Bool)

(declare-fun res!1073101 () Bool)

(declare-fun e!875581 () Bool)

(assert (=> d!164207 (=> res!1073101 e!875581)))

(assert (=> d!164207 (= res!1073101 (or (is-Nil!36754 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (is-Nil!36754 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)))))))

(assert (=> d!164207 (= (isStrictlySorted!1021 (insertStrictlySorted!598 l!750 key1!37 v1!32)) e!875581)))

(declare-fun b!1570521 () Bool)

(declare-fun e!875582 () Bool)

(assert (=> b!1570521 (= e!875581 e!875582)))

(declare-fun res!1073102 () Bool)

(assert (=> b!1570521 (=> (not res!1073102) (not e!875582))))

(assert (=> b!1570521 (= res!1073102 (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32))) (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))))))))

(declare-fun b!1570522 () Bool)

(assert (=> b!1570522 (= e!875582 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))))))

(assert (= (and d!164207 (not res!1073101)) b!1570521))

(assert (= (and b!1570521 res!1073102) b!1570522))

(declare-fun m!1444545 () Bool)

(assert (=> b!1570522 m!1444545))

(assert (=> d!163995 d!164207))

(declare-fun d!164211 () Bool)

(declare-fun res!1073105 () Bool)

(declare-fun e!875588 () Bool)

(assert (=> d!164211 (=> res!1073105 e!875588)))

(assert (=> d!164211 (= res!1073105 (and (is-Cons!36753 lt!673377) (= (_1!12699 (h!38200 lt!673377)) key2!21)))))

(assert (=> d!164211 (= (containsKey!870 lt!673377 key2!21) e!875588)))

(declare-fun b!1570533 () Bool)

(declare-fun e!875589 () Bool)

(assert (=> b!1570533 (= e!875588 e!875589)))

(declare-fun res!1073106 () Bool)

(assert (=> b!1570533 (=> (not res!1073106) (not e!875589))))

(assert (=> b!1570533 (= res!1073106 (and (or (not (is-Cons!36753 lt!673377)) (bvsle (_1!12699 (h!38200 lt!673377)) key2!21)) (is-Cons!36753 lt!673377) (bvslt (_1!12699 (h!38200 lt!673377)) key2!21)))))

(declare-fun b!1570534 () Bool)

(assert (=> b!1570534 (= e!875589 (containsKey!870 (t!51665 lt!673377) key2!21))))

(assert (= (and d!164211 (not res!1073105)) b!1570533))

(assert (= (and b!1570533 res!1073106) b!1570534))

(declare-fun m!1444547 () Bool)

(assert (=> b!1570534 m!1444547))

(assert (=> b!1570167 d!164211))

(declare-fun lt!673417 () List!36757)

(declare-fun e!875594 () Bool)

(declare-fun b!1570535 () Bool)

(assert (=> b!1570535 (= e!875594 (contains!10428 lt!673417 (tuple2!25377 key2!21 v2!10)))))

(declare-fun c!144967 () Bool)

(declare-fun c!144965 () Bool)

(declare-fun e!875593 () List!36757)

(declare-fun b!1570536 () Bool)

(assert (=> b!1570536 (= e!875593 (ite c!144965 (t!51665 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) (ite c!144967 (Cons!36753 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) (t!51665 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)))) Nil!36754)))))

(declare-fun b!1570537 () Bool)

(declare-fun e!875591 () List!36757)

(declare-fun call!72246 () List!36757)

(assert (=> b!1570537 (= e!875591 call!72246)))

(declare-fun b!1570538 () Bool)

(assert (=> b!1570538 (= e!875593 (insertStrictlySorted!598 (t!51665 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun c!144966 () Bool)

(declare-fun call!72248 () List!36757)

(declare-fun bm!72243 () Bool)

(assert (=> bm!72243 (= call!72248 ($colon$colon!1001 e!875593 (ite c!144966 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) (tuple2!25377 key2!21 v2!10))))))

(declare-fun c!144964 () Bool)

(assert (=> bm!72243 (= c!144964 c!144966)))

(declare-fun d!164213 () Bool)

(assert (=> d!164213 e!875594))

(declare-fun res!1073108 () Bool)

(assert (=> d!164213 (=> (not res!1073108) (not e!875594))))

(assert (=> d!164213 (= res!1073108 (isStrictlySorted!1021 lt!673417))))

(declare-fun e!875590 () List!36757)

(assert (=> d!164213 (= lt!673417 e!875590)))

(assert (=> d!164213 (= c!144966 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) (bvslt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164213 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)))))

(assert (=> d!164213 (= (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673417)))

(declare-fun bm!72244 () Bool)

(assert (=> bm!72244 (= call!72246 call!72248)))

(declare-fun b!1570539 () Bool)

(declare-fun res!1073107 () Bool)

(assert (=> b!1570539 (=> (not res!1073107) (not e!875594))))

(assert (=> b!1570539 (= res!1073107 (containsKey!870 lt!673417 key2!21))))

(declare-fun b!1570540 () Bool)

(assert (=> b!1570540 (= c!144967 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) (bvsgt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun e!875592 () List!36757)

(assert (=> b!1570540 (= e!875591 e!875592)))

(declare-fun b!1570541 () Bool)

(declare-fun call!72247 () List!36757)

(assert (=> b!1570541 (= e!875592 call!72247)))

(declare-fun bm!72245 () Bool)

(assert (=> bm!72245 (= call!72247 call!72246)))

(declare-fun b!1570542 () Bool)

(assert (=> b!1570542 (= e!875590 call!72248)))

(declare-fun b!1570543 () Bool)

(assert (=> b!1570543 (= e!875592 call!72247)))

(declare-fun b!1570544 () Bool)

(assert (=> b!1570544 (= e!875590 e!875591)))

(assert (=> b!1570544 (= c!144965 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32))) (= (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key1!37 v1!32)))) key2!21)))))

(assert (= (and d!164213 c!144966) b!1570542))

(assert (= (and d!164213 (not c!144966)) b!1570544))

(assert (= (and b!1570544 c!144965) b!1570537))

(assert (= (and b!1570544 (not c!144965)) b!1570540))

(assert (= (and b!1570540 c!144967) b!1570543))

(assert (= (and b!1570540 (not c!144967)) b!1570541))

(assert (= (or b!1570543 b!1570541) bm!72245))

(assert (= (or b!1570537 bm!72245) bm!72244))

(assert (= (or b!1570542 bm!72244) bm!72243))

(assert (= (and bm!72243 c!144964) b!1570538))

(assert (= (and bm!72243 (not c!144964)) b!1570536))

(assert (= (and d!164213 res!1073108) b!1570539))

(assert (= (and b!1570539 res!1073107) b!1570535))

(declare-fun m!1444559 () Bool)

(assert (=> b!1570538 m!1444559))

(declare-fun m!1444561 () Bool)

(assert (=> b!1570539 m!1444561))

(declare-fun m!1444563 () Bool)

(assert (=> b!1570535 m!1444563))

(declare-fun m!1444567 () Bool)

(assert (=> bm!72243 m!1444567))

(declare-fun m!1444569 () Bool)

(assert (=> d!164213 m!1444569))

(assert (=> d!164213 m!1444545))

(assert (=> b!1570076 d!164213))

(declare-fun d!164221 () Bool)

(declare-fun lt!673418 () Bool)

(assert (=> d!164221 (= lt!673418 (member (tuple2!25377 key1!37 v1!32) (content!819 lt!673383)))))

(declare-fun e!875600 () Bool)

(assert (=> d!164221 (= lt!673418 e!875600)))

(declare-fun res!1073114 () Bool)

(assert (=> d!164221 (=> (not res!1073114) (not e!875600))))

(assert (=> d!164221 (= res!1073114 (is-Cons!36753 lt!673383))))

(assert (=> d!164221 (= (contains!10428 lt!673383 (tuple2!25377 key1!37 v1!32)) lt!673418)))

(declare-fun b!1570549 () Bool)

(declare-fun e!875599 () Bool)

(assert (=> b!1570549 (= e!875600 e!875599)))

(declare-fun res!1073113 () Bool)

(assert (=> b!1570549 (=> res!1073113 e!875599)))

(assert (=> b!1570549 (= res!1073113 (= (h!38200 lt!673383) (tuple2!25377 key1!37 v1!32)))))

(declare-fun b!1570550 () Bool)

(assert (=> b!1570550 (= e!875599 (contains!10428 (t!51665 lt!673383) (tuple2!25377 key1!37 v1!32)))))

(assert (= (and d!164221 res!1073114) b!1570549))

(assert (= (and b!1570549 (not res!1073113)) b!1570550))

(declare-fun m!1444573 () Bool)

(assert (=> d!164221 m!1444573))

(declare-fun m!1444575 () Bool)

(assert (=> d!164221 m!1444575))

(declare-fun m!1444577 () Bool)

(assert (=> b!1570550 m!1444577))

(assert (=> b!1570229 d!164221))

(declare-fun d!164225 () Bool)

(assert (=> d!164225 (= ($colon$colon!1001 e!875327 (ite c!144886 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (tuple2!25377 key2!21 v2!10))) (Cons!36753 (ite c!144886 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (tuple2!25377 key2!21 v2!10)) e!875327))))

(assert (=> bm!72183 d!164225))

(declare-fun d!164227 () Bool)

(assert (=> d!164227 (= ($colon$colon!1001 e!875282 (ite c!144850 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (tuple2!25377 key2!21 v2!10))) (Cons!36753 (ite c!144850 (h!38200 (insertStrictlySorted!598 l!750 key1!37 v1!32)) (tuple2!25377 key2!21 v2!10)) e!875282))))

(assert (=> bm!72156 d!164227))

(declare-fun d!164231 () Bool)

(declare-fun res!1073119 () Bool)

(declare-fun e!875605 () Bool)

(assert (=> d!164231 (=> res!1073119 e!875605)))

(assert (=> d!164231 (= res!1073119 (and (is-Cons!36753 lt!673371) (= (_1!12699 (h!38200 lt!673371)) key2!21)))))

(assert (=> d!164231 (= (containsKey!870 lt!673371 key2!21) e!875605)))

(declare-fun b!1570555 () Bool)

(declare-fun e!875606 () Bool)

(assert (=> b!1570555 (= e!875605 e!875606)))

(declare-fun res!1073120 () Bool)

(assert (=> b!1570555 (=> (not res!1073120) (not e!875606))))

(assert (=> b!1570555 (= res!1073120 (and (or (not (is-Cons!36753 lt!673371)) (bvsle (_1!12699 (h!38200 lt!673371)) key2!21)) (is-Cons!36753 lt!673371) (bvslt (_1!12699 (h!38200 lt!673371)) key2!21)))))

(declare-fun b!1570556 () Bool)

(assert (=> b!1570556 (= e!875606 (containsKey!870 (t!51665 lt!673371) key2!21))))

(assert (= (and d!164231 (not res!1073119)) b!1570555))

(assert (= (and b!1570555 res!1073120) b!1570556))

(declare-fun m!1444587 () Bool)

(assert (=> b!1570556 m!1444587))

(assert (=> b!1570107 d!164231))

(declare-fun d!164235 () Bool)

(assert (=> d!164235 (= ($colon$colon!1001 e!875297 (ite c!144862 (h!38200 l!750) (tuple2!25377 key2!21 v2!10))) (Cons!36753 (ite c!144862 (h!38200 l!750) (tuple2!25377 key2!21 v2!10)) e!875297))))

(assert (=> bm!72165 d!164235))

(declare-fun b!1570559 () Bool)

(declare-fun lt!673421 () List!36757)

(declare-fun e!875613 () Bool)

(assert (=> b!1570559 (= e!875613 (contains!10428 lt!673421 (tuple2!25377 key2!21 v2!10)))))

(declare-fun c!144969 () Bool)

(declare-fun c!144971 () Bool)

(declare-fun e!875612 () List!36757)

(declare-fun b!1570560 () Bool)

(assert (=> b!1570560 (= e!875612 (ite c!144969 (t!51665 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) (ite c!144971 (Cons!36753 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) (t!51665 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)))) Nil!36754)))))

(declare-fun b!1570561 () Bool)

(declare-fun e!875610 () List!36757)

(declare-fun call!72249 () List!36757)

(assert (=> b!1570561 (= e!875610 call!72249)))

(declare-fun b!1570562 () Bool)

(assert (=> b!1570562 (= e!875612 (insertStrictlySorted!598 (t!51665 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) key2!21 v2!10))))

(declare-fun bm!72246 () Bool)

(declare-fun call!72251 () List!36757)

(declare-fun c!144970 () Bool)

(assert (=> bm!72246 (= call!72251 ($colon$colon!1001 e!875612 (ite c!144970 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) (tuple2!25377 key2!21 v2!10))))))

(declare-fun c!144968 () Bool)

(assert (=> bm!72246 (= c!144968 c!144970)))

(declare-fun d!164237 () Bool)

(assert (=> d!164237 e!875613))

(declare-fun res!1073124 () Bool)

(assert (=> d!164237 (=> (not res!1073124) (not e!875613))))

(assert (=> d!164237 (= res!1073124 (isStrictlySorted!1021 lt!673421))))

(declare-fun e!875609 () List!36757)

(assert (=> d!164237 (= lt!673421 e!875609)))

(assert (=> d!164237 (= c!144970 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) (bvslt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)))) key2!21)))))

(assert (=> d!164237 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)))))

(assert (=> d!164237 (= (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) key2!21 v2!10) lt!673421)))

(declare-fun bm!72247 () Bool)

(assert (=> bm!72247 (= call!72249 call!72251)))

(declare-fun b!1570563 () Bool)

(declare-fun res!1073123 () Bool)

(assert (=> b!1570563 (=> (not res!1073123) (not e!875613))))

(assert (=> b!1570563 (= res!1073123 (containsKey!870 lt!673421 key2!21))))

(declare-fun b!1570564 () Bool)

(assert (=> b!1570564 (= c!144971 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) (bvsgt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)))) key2!21)))))

(declare-fun e!875611 () List!36757)

(assert (=> b!1570564 (= e!875610 e!875611)))

(declare-fun b!1570565 () Bool)

(declare-fun call!72250 () List!36757)

(assert (=> b!1570565 (= e!875611 call!72250)))

(declare-fun bm!72248 () Bool)

(assert (=> bm!72248 (= call!72250 call!72249)))

(declare-fun b!1570566 () Bool)

(assert (=> b!1570566 (= e!875609 call!72251)))

(declare-fun b!1570567 () Bool)

(assert (=> b!1570567 (= e!875611 call!72250)))

(declare-fun b!1570568 () Bool)

(assert (=> b!1570568 (= e!875609 e!875610)))

(assert (=> b!1570568 (= c!144969 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) (= (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)))) key2!21)))))

(assert (= (and d!164237 c!144970) b!1570566))

(assert (= (and d!164237 (not c!144970)) b!1570568))

(assert (= (and b!1570568 c!144969) b!1570561))

(assert (= (and b!1570568 (not c!144969)) b!1570564))

(assert (= (and b!1570564 c!144971) b!1570567))

(assert (= (and b!1570564 (not c!144971)) b!1570565))

(assert (= (or b!1570567 b!1570565) bm!72248))

(assert (= (or b!1570561 bm!72248) bm!72247))

(assert (= (or b!1570566 bm!72247) bm!72246))

(assert (= (and bm!72246 c!144968) b!1570562))

(assert (= (and bm!72246 (not c!144968)) b!1570560))

(assert (= (and d!164237 res!1073124) b!1570563))

(assert (= (and b!1570563 res!1073123) b!1570559))

(declare-fun m!1444595 () Bool)

(assert (=> b!1570562 m!1444595))

(declare-fun m!1444597 () Bool)

(assert (=> b!1570563 m!1444597))

(declare-fun m!1444599 () Bool)

(assert (=> b!1570559 m!1444599))

(declare-fun m!1444601 () Bool)

(assert (=> bm!72246 m!1444601))

(declare-fun m!1444603 () Bool)

(assert (=> d!164237 m!1444603))

(declare-fun m!1444605 () Bool)

(assert (=> d!164237 m!1444605))

(assert (=> b!1570166 d!164237))

(declare-fun d!164241 () Bool)

(declare-fun res!1073127 () Bool)

(declare-fun e!875619 () Bool)

(assert (=> d!164241 (=> res!1073127 e!875619)))

(assert (=> d!164241 (= res!1073127 (and (is-Cons!36753 lt!673381) (= (_1!12699 (h!38200 lt!673381)) key1!37)))))

(assert (=> d!164241 (= (containsKey!870 lt!673381 key1!37) e!875619)))

(declare-fun b!1570579 () Bool)

(declare-fun e!875620 () Bool)

(assert (=> b!1570579 (= e!875619 e!875620)))

(declare-fun res!1073128 () Bool)

(assert (=> b!1570579 (=> (not res!1073128) (not e!875620))))

(assert (=> b!1570579 (= res!1073128 (and (or (not (is-Cons!36753 lt!673381)) (bvsle (_1!12699 (h!38200 lt!673381)) key1!37)) (is-Cons!36753 lt!673381) (bvslt (_1!12699 (h!38200 lt!673381)) key1!37)))))

(declare-fun b!1570580 () Bool)

(assert (=> b!1570580 (= e!875620 (containsKey!870 (t!51665 lt!673381) key1!37))))

(assert (= (and d!164241 (not res!1073127)) b!1570579))

(assert (= (and b!1570579 res!1073128) b!1570580))

(declare-fun m!1444617 () Bool)

(assert (=> b!1570580 m!1444617))

(assert (=> b!1570209 d!164241))

(declare-fun d!164245 () Bool)

(assert (=> d!164245 (= ($colon$colon!1001 e!875351 (ite c!144902 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (tuple2!25377 key1!37 v1!32))) (Cons!36753 (ite c!144902 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (tuple2!25377 key1!37 v1!32)) e!875351))))

(assert (=> bm!72195 d!164245))

(declare-fun d!164247 () Bool)

(declare-fun res!1073131 () Bool)

(declare-fun e!875623 () Bool)

(assert (=> d!164247 (=> res!1073131 e!875623)))

(assert (=> d!164247 (= res!1073131 (or (is-Nil!36754 lt!673377) (is-Nil!36754 (t!51665 lt!673377))))))

(assert (=> d!164247 (= (isStrictlySorted!1021 lt!673377) e!875623)))

(declare-fun b!1570583 () Bool)

(declare-fun e!875624 () Bool)

(assert (=> b!1570583 (= e!875623 e!875624)))

(declare-fun res!1073132 () Bool)

(assert (=> b!1570583 (=> (not res!1073132) (not e!875624))))

(assert (=> b!1570583 (= res!1073132 (bvslt (_1!12699 (h!38200 lt!673377)) (_1!12699 (h!38200 (t!51665 lt!673377)))))))

(declare-fun b!1570584 () Bool)

(assert (=> b!1570584 (= e!875624 (isStrictlySorted!1021 (t!51665 lt!673377)))))

(assert (= (and d!164247 (not res!1073131)) b!1570583))

(assert (= (and b!1570583 res!1073132) b!1570584))

(declare-fun m!1444625 () Bool)

(assert (=> b!1570584 m!1444625))

(assert (=> d!164013 d!164247))

(declare-fun d!164253 () Bool)

(declare-fun res!1073135 () Bool)

(declare-fun e!875627 () Bool)

(assert (=> d!164253 (=> res!1073135 e!875627)))

(assert (=> d!164253 (= res!1073135 (or (is-Nil!36754 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) (is-Nil!36754 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)))))))

(assert (=> d!164253 (= (isStrictlySorted!1021 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32)) e!875627)))

(declare-fun b!1570587 () Bool)

(declare-fun e!875628 () Bool)

(assert (=> b!1570587 (= e!875627 e!875628)))

(declare-fun res!1073136 () Bool)

(assert (=> b!1570587 (=> (not res!1073136) (not e!875628))))

(assert (=> b!1570587 (= res!1073136 (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))) (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))))))))

(declare-fun b!1570588 () Bool)

(assert (=> b!1570588 (= e!875628 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key1!37 v1!32))))))

(assert (= (and d!164253 (not res!1073135)) b!1570587))

(assert (= (and b!1570587 res!1073136) b!1570588))

(assert (=> b!1570588 m!1444605))

(assert (=> d!164013 d!164253))

(assert (=> b!1570106 d!164019))

(declare-fun d!164257 () Bool)

(declare-fun res!1073139 () Bool)

(declare-fun e!875631 () Bool)

(assert (=> d!164257 (=> res!1073139 e!875631)))

(assert (=> d!164257 (= res!1073139 (or (is-Nil!36754 lt!673371) (is-Nil!36754 (t!51665 lt!673371))))))

(assert (=> d!164257 (= (isStrictlySorted!1021 lt!673371) e!875631)))

(declare-fun b!1570591 () Bool)

(declare-fun e!875632 () Bool)

(assert (=> b!1570591 (= e!875631 e!875632)))

(declare-fun res!1073140 () Bool)

(assert (=> b!1570591 (=> (not res!1073140) (not e!875632))))

(assert (=> b!1570591 (= res!1073140 (bvslt (_1!12699 (h!38200 lt!673371)) (_1!12699 (h!38200 (t!51665 lt!673371)))))))

(declare-fun b!1570592 () Bool)

(assert (=> b!1570592 (= e!875632 (isStrictlySorted!1021 (t!51665 lt!673371)))))

(assert (= (and d!164257 (not res!1073139)) b!1570591))

(assert (= (and b!1570591 res!1073140) b!1570592))

(declare-fun m!1444631 () Bool)

(assert (=> b!1570592 m!1444631))

(assert (=> d!164001 d!164257))

(assert (=> d!164001 d!163975))

(declare-fun d!164259 () Bool)

(declare-fun lt!673425 () Bool)

(assert (=> d!164259 (= lt!673425 (member (tuple2!25377 key2!21 v2!10) (content!819 lt!673377)))))

(declare-fun e!875634 () Bool)

(assert (=> d!164259 (= lt!673425 e!875634)))

(declare-fun res!1073142 () Bool)

(assert (=> d!164259 (=> (not res!1073142) (not e!875634))))

(assert (=> d!164259 (= res!1073142 (is-Cons!36753 lt!673377))))

(assert (=> d!164259 (= (contains!10428 lt!673377 (tuple2!25377 key2!21 v2!10)) lt!673425)))

(declare-fun b!1570593 () Bool)

(declare-fun e!875633 () Bool)

(assert (=> b!1570593 (= e!875634 e!875633)))

(declare-fun res!1073141 () Bool)

(assert (=> b!1570593 (=> res!1073141 e!875633)))

(assert (=> b!1570593 (= res!1073141 (= (h!38200 lt!673377) (tuple2!25377 key2!21 v2!10)))))

(declare-fun b!1570594 () Bool)

(assert (=> b!1570594 (= e!875633 (contains!10428 (t!51665 lt!673377) (tuple2!25377 key2!21 v2!10)))))

(assert (= (and d!164259 res!1073142) b!1570593))

(assert (= (and b!1570593 (not res!1073141)) b!1570594))

(declare-fun m!1444637 () Bool)

(assert (=> d!164259 m!1444637))

(declare-fun m!1444639 () Bool)

(assert (=> d!164259 m!1444639))

(declare-fun m!1444641 () Bool)

(assert (=> b!1570594 m!1444641))

(assert (=> b!1570163 d!164259))

(declare-fun e!875641 () Bool)

(declare-fun lt!673426 () List!36757)

(declare-fun b!1570597 () Bool)

(assert (=> b!1570597 (= e!875641 (contains!10428 lt!673426 (tuple2!25377 key1!37 v1!32)))))

(declare-fun b!1570598 () Bool)

(declare-fun e!875640 () List!36757)

(declare-fun c!144979 () Bool)

(declare-fun c!144977 () Bool)

(assert (=> b!1570598 (= e!875640 (ite c!144977 (t!51665 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) (ite c!144979 (Cons!36753 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) (t!51665 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)))) Nil!36754)))))

(declare-fun b!1570599 () Bool)

(declare-fun e!875638 () List!36757)

(declare-fun call!72255 () List!36757)

(assert (=> b!1570599 (= e!875638 call!72255)))

(declare-fun b!1570600 () Bool)

(assert (=> b!1570600 (= e!875640 (insertStrictlySorted!598 (t!51665 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) key1!37 v1!32))))

(declare-fun call!72257 () List!36757)

(declare-fun c!144978 () Bool)

(declare-fun bm!72252 () Bool)

(assert (=> bm!72252 (= call!72257 ($colon$colon!1001 e!875640 (ite c!144978 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) (tuple2!25377 key1!37 v1!32))))))

(declare-fun c!144976 () Bool)

(assert (=> bm!72252 (= c!144976 c!144978)))

(declare-fun d!164265 () Bool)

(assert (=> d!164265 e!875641))

(declare-fun res!1073146 () Bool)

(assert (=> d!164265 (=> (not res!1073146) (not e!875641))))

(assert (=> d!164265 (= res!1073146 (isStrictlySorted!1021 lt!673426))))

(declare-fun e!875637 () List!36757)

(assert (=> d!164265 (= lt!673426 e!875637)))

(assert (=> d!164265 (= c!144978 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) (bvslt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)))) key1!37)))))

(assert (=> d!164265 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)))))

(assert (=> d!164265 (= (insertStrictlySorted!598 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) key1!37 v1!32) lt!673426)))

(declare-fun bm!72253 () Bool)

(assert (=> bm!72253 (= call!72255 call!72257)))

(declare-fun b!1570601 () Bool)

(declare-fun res!1073145 () Bool)

(assert (=> b!1570601 (=> (not res!1073145) (not e!875641))))

(assert (=> b!1570601 (= res!1073145 (containsKey!870 lt!673426 key1!37))))

(declare-fun b!1570602 () Bool)

(assert (=> b!1570602 (= c!144979 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) (bvsgt (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)))) key1!37)))))

(declare-fun e!875639 () List!36757)

(assert (=> b!1570602 (= e!875638 e!875639)))

(declare-fun b!1570603 () Bool)

(declare-fun call!72256 () List!36757)

(assert (=> b!1570603 (= e!875639 call!72256)))

(declare-fun bm!72254 () Bool)

(assert (=> bm!72254 (= call!72256 call!72255)))

(declare-fun b!1570604 () Bool)

(assert (=> b!1570604 (= e!875637 call!72257)))

(declare-fun b!1570605 () Bool)

(assert (=> b!1570605 (= e!875639 call!72256)))

(declare-fun b!1570606 () Bool)

(assert (=> b!1570606 (= e!875637 e!875638)))

(assert (=> b!1570606 (= c!144977 (and (is-Cons!36753 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) (= (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)))) key1!37)))))

(assert (= (and d!164265 c!144978) b!1570604))

(assert (= (and d!164265 (not c!144978)) b!1570606))

(assert (= (and b!1570606 c!144977) b!1570599))

(assert (= (and b!1570606 (not c!144977)) b!1570602))

(assert (= (and b!1570602 c!144979) b!1570605))

(assert (= (and b!1570602 (not c!144979)) b!1570603))

(assert (= (or b!1570605 b!1570603) bm!72254))

(assert (= (or b!1570599 bm!72254) bm!72253))

(assert (= (or b!1570604 bm!72253) bm!72252))

(assert (= (and bm!72252 c!144976) b!1570600))

(assert (= (and bm!72252 (not c!144976)) b!1570598))

(assert (= (and d!164265 res!1073146) b!1570601))

(assert (= (and b!1570601 res!1073145) b!1570597))

(declare-fun m!1444645 () Bool)

(assert (=> b!1570600 m!1444645))

(declare-fun m!1444647 () Bool)

(assert (=> b!1570601 m!1444647))

(declare-fun m!1444649 () Bool)

(assert (=> b!1570597 m!1444649))

(declare-fun m!1444653 () Bool)

(assert (=> bm!72252 m!1444653))

(declare-fun m!1444655 () Bool)

(assert (=> d!164265 m!1444655))

(declare-fun m!1444657 () Bool)

(assert (=> d!164265 m!1444657))

(assert (=> b!1570208 d!164265))

(declare-fun d!164269 () Bool)

(declare-fun lt!673428 () Bool)

(assert (=> d!164269 (= lt!673428 (member (tuple2!25377 key2!21 v2!10) (content!819 lt!673368)))))

(declare-fun e!875648 () Bool)

(assert (=> d!164269 (= lt!673428 e!875648)))

(declare-fun res!1073150 () Bool)

(assert (=> d!164269 (=> (not res!1073150) (not e!875648))))

(assert (=> d!164269 (= res!1073150 (is-Cons!36753 lt!673368))))

(assert (=> d!164269 (= (contains!10428 lt!673368 (tuple2!25377 key2!21 v2!10)) lt!673428)))

(declare-fun b!1570617 () Bool)

(declare-fun e!875647 () Bool)

(assert (=> b!1570617 (= e!875648 e!875647)))

(declare-fun res!1073149 () Bool)

(assert (=> b!1570617 (=> res!1073149 e!875647)))

(assert (=> b!1570617 (= res!1073149 (= (h!38200 lt!673368) (tuple2!25377 key2!21 v2!10)))))

(declare-fun b!1570618 () Bool)

(assert (=> b!1570618 (= e!875647 (contains!10428 (t!51665 lt!673368) (tuple2!25377 key2!21 v2!10)))))

(assert (= (and d!164269 res!1073150) b!1570617))

(assert (= (and b!1570617 (not res!1073149)) b!1570618))

(declare-fun m!1444667 () Bool)

(assert (=> d!164269 m!1444667))

(declare-fun m!1444669 () Bool)

(assert (=> d!164269 m!1444669))

(declare-fun m!1444673 () Bool)

(assert (=> b!1570618 m!1444673))

(assert (=> b!1570073 d!164269))

(declare-fun d!164273 () Bool)

(declare-fun res!1073153 () Bool)

(declare-fun e!875651 () Bool)

(assert (=> d!164273 (=> res!1073153 e!875651)))

(assert (=> d!164273 (= res!1073153 (or (is-Nil!36754 lt!673353) (is-Nil!36754 (t!51665 lt!673353))))))

(assert (=> d!164273 (= (isStrictlySorted!1021 lt!673353) e!875651)))

(declare-fun b!1570621 () Bool)

(declare-fun e!875652 () Bool)

(assert (=> b!1570621 (= e!875651 e!875652)))

(declare-fun res!1073154 () Bool)

(assert (=> b!1570621 (=> (not res!1073154) (not e!875652))))

(assert (=> b!1570621 (= res!1073154 (bvslt (_1!12699 (h!38200 lt!673353)) (_1!12699 (h!38200 (t!51665 lt!673353)))))))

(declare-fun b!1570622 () Bool)

(assert (=> b!1570622 (= e!875652 (isStrictlySorted!1021 (t!51665 lt!673353)))))

(assert (= (and d!164273 (not res!1073153)) b!1570621))

(assert (= (and b!1570621 res!1073154) b!1570622))

(declare-fun m!1444675 () Bool)

(assert (=> b!1570622 m!1444675))

(assert (=> d!163979 d!164273))

(declare-fun d!164275 () Bool)

(declare-fun res!1073155 () Bool)

(declare-fun e!875654 () Bool)

(assert (=> d!164275 (=> res!1073155 e!875654)))

(assert (=> d!164275 (= res!1073155 (or (is-Nil!36754 (insertStrictlySorted!598 l!750 key2!21 v2!10)) (is-Nil!36754 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10)))))))

(assert (=> d!164275 (= (isStrictlySorted!1021 (insertStrictlySorted!598 l!750 key2!21 v2!10)) e!875654)))

(declare-fun b!1570624 () Bool)

(declare-fun e!875655 () Bool)

(assert (=> b!1570624 (= e!875654 e!875655)))

(declare-fun res!1073156 () Bool)

(assert (=> b!1570624 (=> (not res!1073156) (not e!875655))))

(assert (=> b!1570624 (= res!1073156 (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 l!750 key2!21 v2!10))) (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))))))))

(declare-fun b!1570625 () Bool)

(assert (=> b!1570625 (= e!875655 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 l!750 key2!21 v2!10))))))

(assert (= (and d!164275 (not res!1073155)) b!1570624))

(assert (= (and b!1570624 res!1073156) b!1570625))

(assert (=> b!1570625 m!1444483))

(assert (=> d!163979 d!164275))

(declare-fun lt!673429 () Bool)

(declare-fun d!164277 () Bool)

(assert (=> d!164277 (= lt!673429 (member (tuple2!25377 key2!21 v2!10) (content!819 lt!673371)))))

(declare-fun e!875657 () Bool)

(assert (=> d!164277 (= lt!673429 e!875657)))

(declare-fun res!1073158 () Bool)

(assert (=> d!164277 (=> (not res!1073158) (not e!875657))))

(assert (=> d!164277 (= res!1073158 (is-Cons!36753 lt!673371))))

(assert (=> d!164277 (= (contains!10428 lt!673371 (tuple2!25377 key2!21 v2!10)) lt!673429)))

(declare-fun b!1570626 () Bool)

(declare-fun e!875656 () Bool)

(assert (=> b!1570626 (= e!875657 e!875656)))

(declare-fun res!1073157 () Bool)

(assert (=> b!1570626 (=> res!1073157 e!875656)))

(assert (=> b!1570626 (= res!1073157 (= (h!38200 lt!673371) (tuple2!25377 key2!21 v2!10)))))

(declare-fun b!1570627 () Bool)

(assert (=> b!1570627 (= e!875656 (contains!10428 (t!51665 lt!673371) (tuple2!25377 key2!21 v2!10)))))

(assert (= (and d!164277 res!1073158) b!1570626))

(assert (= (and b!1570626 (not res!1073157)) b!1570627))

(declare-fun m!1444677 () Bool)

(assert (=> d!164277 m!1444677))

(declare-fun m!1444679 () Bool)

(assert (=> d!164277 m!1444679))

(declare-fun m!1444681 () Bool)

(assert (=> b!1570627 m!1444681))

(assert (=> b!1570103 d!164277))

(declare-fun d!164279 () Bool)

(declare-fun lt!673430 () Bool)

(assert (=> d!164279 (= lt!673430 (member (tuple2!25377 key1!37 v1!32) (content!819 lt!673381)))))

(declare-fun e!875659 () Bool)

(assert (=> d!164279 (= lt!673430 e!875659)))

(declare-fun res!1073160 () Bool)

(assert (=> d!164279 (=> (not res!1073160) (not e!875659))))

(assert (=> d!164279 (= res!1073160 (is-Cons!36753 lt!673381))))

(assert (=> d!164279 (= (contains!10428 lt!673381 (tuple2!25377 key1!37 v1!32)) lt!673430)))

(declare-fun b!1570628 () Bool)

(declare-fun e!875658 () Bool)

(assert (=> b!1570628 (= e!875659 e!875658)))

(declare-fun res!1073159 () Bool)

(assert (=> b!1570628 (=> res!1073159 e!875658)))

(assert (=> b!1570628 (= res!1073159 (= (h!38200 lt!673381) (tuple2!25377 key1!37 v1!32)))))

(declare-fun b!1570629 () Bool)

(assert (=> b!1570629 (= e!875658 (contains!10428 (t!51665 lt!673381) (tuple2!25377 key1!37 v1!32)))))

(assert (= (and d!164279 res!1073160) b!1570628))

(assert (= (and b!1570628 (not res!1073159)) b!1570629))

(declare-fun m!1444683 () Bool)

(assert (=> d!164279 m!1444683))

(declare-fun m!1444685 () Bool)

(assert (=> d!164279 m!1444685))

(declare-fun m!1444687 () Bool)

(assert (=> b!1570629 m!1444687))

(assert (=> b!1570205 d!164279))

(assert (=> b!1569942 d!164033))

(declare-fun d!164281 () Bool)

(declare-fun res!1073161 () Bool)

(declare-fun e!875660 () Bool)

(assert (=> d!164281 (=> res!1073161 e!875660)))

(assert (=> d!164281 (= res!1073161 (and (is-Cons!36753 lt!673379) (= (_1!12699 (h!38200 lt!673379)) key2!21)))))

(assert (=> d!164281 (= (containsKey!870 lt!673379 key2!21) e!875660)))

(declare-fun b!1570630 () Bool)

(declare-fun e!875661 () Bool)

(assert (=> b!1570630 (= e!875660 e!875661)))

(declare-fun res!1073162 () Bool)

(assert (=> b!1570630 (=> (not res!1073162) (not e!875661))))

(assert (=> b!1570630 (= res!1073162 (and (or (not (is-Cons!36753 lt!673379)) (bvsle (_1!12699 (h!38200 lt!673379)) key2!21)) (is-Cons!36753 lt!673379) (bvslt (_1!12699 (h!38200 lt!673379)) key2!21)))))

(declare-fun b!1570631 () Bool)

(assert (=> b!1570631 (= e!875661 (containsKey!870 (t!51665 lt!673379) key2!21))))

(assert (= (and d!164281 (not res!1073161)) b!1570630))

(assert (= (and b!1570630 res!1073162) b!1570631))

(declare-fun m!1444689 () Bool)

(assert (=> b!1570631 m!1444689))

(assert (=> b!1570187 d!164281))

(declare-fun d!164283 () Bool)

(assert (=> d!164283 (= ($colon$colon!1001 e!875337 (ite c!144894 (h!38200 (t!51665 l!750)) (tuple2!25377 key2!21 v2!10))) (Cons!36753 (ite c!144894 (h!38200 (t!51665 l!750)) (tuple2!25377 key2!21 v2!10)) e!875337))))

(assert (=> bm!72189 d!164283))

(declare-fun d!164285 () Bool)

(declare-fun res!1073163 () Bool)

(declare-fun e!875662 () Bool)

(assert (=> d!164285 (=> res!1073163 e!875662)))

(assert (=> d!164285 (= res!1073163 (or (is-Nil!36754 (t!51665 (t!51665 l!750))) (is-Nil!36754 (t!51665 (t!51665 (t!51665 l!750))))))))

(assert (=> d!164285 (= (isStrictlySorted!1021 (t!51665 (t!51665 l!750))) e!875662)))

(declare-fun b!1570632 () Bool)

(declare-fun e!875663 () Bool)

(assert (=> b!1570632 (= e!875662 e!875663)))

(declare-fun res!1073164 () Bool)

(assert (=> b!1570632 (=> (not res!1073164) (not e!875663))))

(assert (=> b!1570632 (= res!1073164 (bvslt (_1!12699 (h!38200 (t!51665 (t!51665 l!750)))) (_1!12699 (h!38200 (t!51665 (t!51665 (t!51665 l!750)))))))))

(declare-fun b!1570633 () Bool)

(assert (=> b!1570633 (= e!875663 (isStrictlySorted!1021 (t!51665 (t!51665 (t!51665 l!750)))))))

(assert (= (and d!164285 (not res!1073163)) b!1570632))

(assert (= (and b!1570632 res!1073164) b!1570633))

(declare-fun m!1444691 () Bool)

(assert (=> b!1570633 m!1444691))

(assert (=> b!1570257 d!164285))

(declare-fun b!1570634 () Bool)

(declare-fun e!875668 () Bool)

(declare-fun lt!673431 () List!36757)

(assert (=> b!1570634 (= e!875668 (contains!10428 lt!673431 (tuple2!25377 key2!21 v2!10)))))

(declare-fun b!1570635 () Bool)

(declare-fun c!144985 () Bool)

(declare-fun c!144987 () Bool)

(declare-fun e!875667 () List!36757)

(assert (=> b!1570635 (= e!875667 (ite c!144985 (t!51665 (t!51665 (t!51665 l!750))) (ite c!144987 (Cons!36753 (h!38200 (t!51665 (t!51665 l!750))) (t!51665 (t!51665 (t!51665 l!750)))) Nil!36754)))))

(declare-fun b!1570636 () Bool)

(declare-fun e!875665 () List!36757)

(declare-fun call!72261 () List!36757)

(assert (=> b!1570636 (= e!875665 call!72261)))

(declare-fun b!1570637 () Bool)

(assert (=> b!1570637 (= e!875667 (insertStrictlySorted!598 (t!51665 (t!51665 (t!51665 l!750))) key2!21 v2!10))))

(declare-fun c!144986 () Bool)

(declare-fun call!72263 () List!36757)

(declare-fun bm!72258 () Bool)

(assert (=> bm!72258 (= call!72263 ($colon$colon!1001 e!875667 (ite c!144986 (h!38200 (t!51665 (t!51665 l!750))) (tuple2!25377 key2!21 v2!10))))))

(declare-fun c!144984 () Bool)

(assert (=> bm!72258 (= c!144984 c!144986)))

(declare-fun d!164287 () Bool)

(assert (=> d!164287 e!875668))

(declare-fun res!1073166 () Bool)

(assert (=> d!164287 (=> (not res!1073166) (not e!875668))))

(assert (=> d!164287 (= res!1073166 (isStrictlySorted!1021 lt!673431))))

(declare-fun e!875664 () List!36757)

(assert (=> d!164287 (= lt!673431 e!875664)))

(assert (=> d!164287 (= c!144986 (and (is-Cons!36753 (t!51665 (t!51665 l!750))) (bvslt (_1!12699 (h!38200 (t!51665 (t!51665 l!750)))) key2!21)))))

(assert (=> d!164287 (isStrictlySorted!1021 (t!51665 (t!51665 l!750)))))

(assert (=> d!164287 (= (insertStrictlySorted!598 (t!51665 (t!51665 l!750)) key2!21 v2!10) lt!673431)))

(declare-fun bm!72259 () Bool)

(assert (=> bm!72259 (= call!72261 call!72263)))

(declare-fun b!1570638 () Bool)

(declare-fun res!1073165 () Bool)

(assert (=> b!1570638 (=> (not res!1073165) (not e!875668))))

(assert (=> b!1570638 (= res!1073165 (containsKey!870 lt!673431 key2!21))))

(declare-fun b!1570639 () Bool)

(assert (=> b!1570639 (= c!144987 (and (is-Cons!36753 (t!51665 (t!51665 l!750))) (bvsgt (_1!12699 (h!38200 (t!51665 (t!51665 l!750)))) key2!21)))))

(declare-fun e!875666 () List!36757)

(assert (=> b!1570639 (= e!875665 e!875666)))

(declare-fun b!1570640 () Bool)

(declare-fun call!72262 () List!36757)

(assert (=> b!1570640 (= e!875666 call!72262)))

(declare-fun bm!72260 () Bool)

(assert (=> bm!72260 (= call!72262 call!72261)))

(declare-fun b!1570641 () Bool)

(assert (=> b!1570641 (= e!875664 call!72263)))

(declare-fun b!1570642 () Bool)

(assert (=> b!1570642 (= e!875666 call!72262)))

(declare-fun b!1570643 () Bool)

(assert (=> b!1570643 (= e!875664 e!875665)))

(assert (=> b!1570643 (= c!144985 (and (is-Cons!36753 (t!51665 (t!51665 l!750))) (= (_1!12699 (h!38200 (t!51665 (t!51665 l!750)))) key2!21)))))

(assert (= (and d!164287 c!144986) b!1570641))

(assert (= (and d!164287 (not c!144986)) b!1570643))

(assert (= (and b!1570643 c!144985) b!1570636))

(assert (= (and b!1570643 (not c!144985)) b!1570639))

(assert (= (and b!1570639 c!144987) b!1570642))

(assert (= (and b!1570639 (not c!144987)) b!1570640))

(assert (= (or b!1570642 b!1570640) bm!72260))

(assert (= (or b!1570636 bm!72260) bm!72259))

(assert (= (or b!1570641 bm!72259) bm!72258))

(assert (= (and bm!72258 c!144984) b!1570637))

(assert (= (and bm!72258 (not c!144984)) b!1570635))

(assert (= (and d!164287 res!1073166) b!1570638))

(assert (= (and b!1570638 res!1073165) b!1570634))

(declare-fun m!1444693 () Bool)

(assert (=> b!1570637 m!1444693))

(declare-fun m!1444695 () Bool)

(assert (=> b!1570638 m!1444695))

(declare-fun m!1444697 () Bool)

(assert (=> b!1570634 m!1444697))

(declare-fun m!1444699 () Bool)

(assert (=> bm!72258 m!1444699))

(declare-fun m!1444701 () Bool)

(assert (=> d!164287 m!1444701))

(assert (=> d!164287 m!1444263))

(assert (=> b!1570186 d!164287))

(declare-fun d!164289 () Bool)

(declare-fun res!1073167 () Bool)

(declare-fun e!875669 () Bool)

(assert (=> d!164289 (=> res!1073167 e!875669)))

(assert (=> d!164289 (= res!1073167 (or (is-Nil!36754 lt!673381) (is-Nil!36754 (t!51665 lt!673381))))))

(assert (=> d!164289 (= (isStrictlySorted!1021 lt!673381) e!875669)))

(declare-fun b!1570644 () Bool)

(declare-fun e!875670 () Bool)

(assert (=> b!1570644 (= e!875669 e!875670)))

(declare-fun res!1073168 () Bool)

(assert (=> b!1570644 (=> (not res!1073168) (not e!875670))))

(assert (=> b!1570644 (= res!1073168 (bvslt (_1!12699 (h!38200 lt!673381)) (_1!12699 (h!38200 (t!51665 lt!673381)))))))

(declare-fun b!1570645 () Bool)

(assert (=> b!1570645 (= e!875670 (isStrictlySorted!1021 (t!51665 lt!673381)))))

(assert (= (and d!164289 (not res!1073167)) b!1570644))

(assert (= (and b!1570644 res!1073168) b!1570645))

(declare-fun m!1444703 () Bool)

(assert (=> b!1570645 m!1444703))

(assert (=> d!164023 d!164289))

(declare-fun d!164291 () Bool)

(declare-fun res!1073169 () Bool)

(declare-fun e!875671 () Bool)

(assert (=> d!164291 (=> res!1073169 e!875671)))

(assert (=> d!164291 (= res!1073169 (or (is-Nil!36754 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) (is-Nil!36754 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)))))))

(assert (=> d!164291 (= (isStrictlySorted!1021 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10)) e!875671)))

(declare-fun b!1570646 () Bool)

(declare-fun e!875672 () Bool)

(assert (=> b!1570646 (= e!875671 e!875672)))

(declare-fun res!1073170 () Bool)

(assert (=> b!1570646 (=> (not res!1073170) (not e!875672))))

(assert (=> b!1570646 (= res!1073170 (bvslt (_1!12699 (h!38200 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))) (_1!12699 (h!38200 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))))))))

(declare-fun b!1570647 () Bool)

(assert (=> b!1570647 (= e!875672 (isStrictlySorted!1021 (t!51665 (insertStrictlySorted!598 (t!51665 l!750) key2!21 v2!10))))))

(assert (= (and d!164291 (not res!1073169)) b!1570646))

(assert (= (and b!1570646 res!1073170) b!1570647))

(assert (=> b!1570647 m!1444657))

(assert (=> d!164023 d!164291))

(declare-fun d!164293 () Bool)

(declare-fun res!1073171 () Bool)

(declare-fun e!875673 () Bool)

(assert (=> d!164293 (=> res!1073171 e!875673)))

(assert (=> d!164293 (= res!1073171 (and (is-Cons!36753 lt!673374) (= (_1!12699 (h!38200 lt!673374)) key1!37)))))

(assert (=> d!164293 (= (containsKey!870 lt!673374 key1!37) e!875673)))

(declare-fun b!1570648 () Bool)

(declare-fun e!875674 () Bool)

(assert (=> b!1570648 (= e!875673 e!875674)))

(declare-fun res!1073172 () Bool)

(assert (=> b!1570648 (=> (not res!1073172) (not e!875674))))

(assert (=> b!1570648 (= res!1073172 (and (or (not (is-Cons!36753 lt!673374)) (bvsle (_1!12699 (h!38200 lt!673374)) key1!37)) (is-Cons!36753 lt!673374) (bvslt (_1!12699 (h!38200 lt!673374)) key1!37)))))

(declare-fun b!1570649 () Bool)

(assert (=> b!1570649 (= e!875674 (containsKey!870 (t!51665 lt!673374) key1!37))))

(assert (= (and d!164293 (not res!1073171)) b!1570648))

(assert (= (and b!1570648 res!1073172) b!1570649))

(declare-fun m!1444705 () Bool)

(assert (=> b!1570649 m!1444705))

(assert (=> b!1570137 d!164293))

(declare-fun d!164295 () Bool)

(assert (=> d!164295 (= ($colon$colon!1001 e!875312 (ite c!144874 (h!38200 l!750) (tuple2!25377 key1!37 v1!32))) (Cons!36753 (ite c!144874 (h!38200 l!750) (tuple2!25377 key1!37 v1!32)) e!875312))))

(assert (=> bm!72174 d!164295))

(declare-fun lt!673432 () Bool)

(declare-fun d!164297 () Bool)

(assert (=> d!164297 (= lt!673432 (member (tuple2!25377 key2!21 v2!10) (content!819 lt!673379)))))

(declare-fun e!875676 () Bool)

(assert (=> d!164297 (= lt!673432 e!875676)))

(declare-fun res!1073174 () Bool)

(assert (=> d!164297 (=> (not res!1073174) (not e!875676))))

(assert (=> d!164297 (= res!1073174 (is-Cons!36753 lt!673379))))

(assert (=> d!164297 (= (contains!10428 lt!673379 (tuple2!25377 key2!21 v2!10)) lt!673432)))

(declare-fun b!1570650 () Bool)

(declare-fun e!875675 () Bool)

(assert (=> b!1570650 (= e!875676 e!875675)))

(declare-fun res!1073173 () Bool)

(assert (=> b!1570650 (=> res!1073173 e!875675)))

(assert (=> b!1570650 (= res!1073173 (= (h!38200 lt!673379) (tuple2!25377 key2!21 v2!10)))))

(declare-fun b!1570651 () Bool)

(assert (=> b!1570651 (= e!875675 (contains!10428 (t!51665 lt!673379) (tuple2!25377 key2!21 v2!10)))))

(assert (= (and d!164297 res!1073174) b!1570650))

(assert (= (and b!1570650 (not res!1073173)) b!1570651))

(declare-fun m!1444707 () Bool)

(assert (=> d!164297 m!1444707))

(declare-fun m!1444709 () Bool)

(assert (=> d!164297 m!1444709))

(declare-fun m!1444711 () Bool)

(assert (=> b!1570651 m!1444711))

(assert (=> b!1570183 d!164297))

(declare-fun d!164299 () Bool)

(declare-fun res!1073175 () Bool)

(declare-fun e!875677 () Bool)

(assert (=> d!164299 (=> res!1073175 e!875677)))

(assert (=> d!164299 (= res!1073175 (and (is-Cons!36753 lt!673353) (= (_1!12699 (h!38200 lt!673353)) key1!37)))))

(assert (=> d!164299 (= (containsKey!870 lt!673353 key1!37) e!875677)))

(declare-fun b!1570652 () Bool)

(declare-fun e!875678 () Bool)

(assert (=> b!1570652 (= e!875677 e!875678)))

(declare-fun res!1073176 () Bool)

(assert (=> b!1570652 (=> (not res!1073176) (not e!875678))))

(assert (=> b!1570652 (= res!1073176 (and (or (not (is-Cons!36753 lt!673353)) (bvsle (_1!12699 (h!38200 lt!673353)) key1!37)) (is-Cons!36753 lt!673353) (bvslt (_1!12699 (h!38200 lt!673353)) key1!37)))))

(declare-fun b!1570653 () Bool)

(assert (=> b!1570653 (= e!875678 (containsKey!870 (t!51665 lt!673353) key1!37))))

(assert (= (and d!164299 (not res!1073175)) b!1570652))

(assert (= (and b!1570652 res!1073176) b!1570653))

(declare-fun m!1444713 () Bool)

(assert (=> b!1570653 m!1444713))

(assert (=> b!1570017 d!164299))

(assert (=> b!1570136 d!164027))

(declare-fun d!164301 () Bool)

(declare-fun res!1073177 () Bool)

(declare-fun e!875679 () Bool)

(assert (=> d!164301 (=> res!1073177 e!875679)))

(assert (=> d!164301 (= res!1073177 (or (is-Nil!36754 lt!673374) (is-Nil!36754 (t!51665 lt!673374))))))

(assert (=> d!164301 (= (isStrictlySorted!1021 lt!673374) e!875679)))

(declare-fun b!1570654 () Bool)

(declare-fun e!875680 () Bool)

(assert (=> b!1570654 (= e!875679 e!875680)))

(declare-fun res!1073178 () Bool)

(assert (=> b!1570654 (=> (not res!1073178) (not e!875680))))

(assert (=> b!1570654 (= res!1073178 (bvslt (_1!12699 (h!38200 lt!673374)) (_1!12699 (h!38200 (t!51665 lt!673374)))))))

(declare-fun b!1570655 () Bool)

(assert (=> b!1570655 (= e!875680 (isStrictlySorted!1021 (t!51665 lt!673374)))))

(assert (= (and d!164301 (not res!1073177)) b!1570654))

(assert (= (and b!1570654 res!1073178) b!1570655))

(declare-fun m!1444715 () Bool)

(assert (=> b!1570655 m!1444715))

(assert (=> d!164007 d!164301))

(assert (=> d!164007 d!163975))

(declare-fun b!1570656 () Bool)

(declare-fun e!875681 () Bool)

(declare-fun tp!114228 () Bool)

(assert (=> b!1570656 (= e!875681 (and tp_is_empty!39101 tp!114228))))

(assert (=> b!1570262 (= tp!114222 e!875681)))

(assert (= (and b!1570262 (is-Cons!36753 (t!51665 (t!51665 l!750)))) b!1570656))

(push 1)

(assert (not b!1570638))

(assert (not b!1570584))

(assert (not b!1570629))

(assert (not b!1570634))

(assert (not d!164221))

(assert (not d!164277))

(assert (not b!1570512))

(assert (not b!1570442))

(assert (not bm!72243))

(assert (not b!1570538))

(assert (not b!1570637))

(assert (not b!1570501))

(assert (not d!164269))

(assert (not d!164195))

(assert (not b!1570500))

(assert tp_is_empty!39101)

(assert (not b!1570645))

(assert (not b!1570452))

(assert (not d!164165))

(assert (not b!1570535))

(assert (not bm!72258))

(assert (not b!1570563))

(assert (not b!1570655))

(assert (not b!1570559))

(assert (not d!164237))

(assert (not b!1570618))

(assert (not b!1570550))

(assert (not b!1570594))

(assert (not d!164297))

(assert (not b!1570486))

(assert (not bm!72231))

(assert (not b!1570461))

(assert (not b!1570556))

(assert (not b!1570633))

(assert (not d!164279))

(assert (not d!164175))

(assert (not d!164213))

(assert (not b!1570562))

(assert (not b!1570647))

(assert (not b!1570649))

(assert (not b!1570656))

(assert (not b!1570534))

(assert (not b!1570651))

(assert (not b!1570653))

(assert (not d!164287))

(assert (not d!164153))

(assert (not b!1570592))

(assert (not b!1570539))

(assert (not bm!72237))

(assert (not bm!72246))

(assert (not b!1570600))

(assert (not b!1570601))

(assert (not b!1570484))

(assert (not bm!72252))

(assert (not d!164265))

(assert (not b!1570625))

(assert (not b!1570460))

(assert (not b!1570580))

(assert (not b!1570588))

(assert (not b!1570622))

(assert (not d!164189))

(assert (not b!1570516))

(assert (not b!1570518))

(assert (not b!1570631))

(assert (not b!1570522))

(assert (not b!1570597))

(assert (not b!1570627))

(assert (not b!1570457))

(assert (not b!1570497))

(assert (not d!164259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

