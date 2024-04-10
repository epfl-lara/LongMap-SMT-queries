; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1180 () Bool)

(assert start!1180)

(declare-fun res!8839 () Bool)

(declare-fun e!5855 () Bool)

(assert (=> start!1180 (=> (not res!8839) (not e!5855))))

(declare-datatypes ((B!306 0))(
  ( (B!307 (val!248 Int)) )
))
(declare-datatypes ((tuple2!296 0))(
  ( (tuple2!297 (_1!148 (_ BitVec 64)) (_2!148 B!306)) )
))
(declare-datatypes ((List!300 0))(
  ( (Nil!297) (Cons!296 (h!862 tuple2!296) (t!2447 List!300)) )
))
(declare-datatypes ((ListLongMap!301 0))(
  ( (ListLongMap!302 (toList!166 List!300)) )
))
(declare-fun lm!213 () ListLongMap!301)

(declare-fun isStrictlySorted!24 (List!300) Bool)

(assert (=> start!1180 (= res!8839 (isStrictlySorted!24 (toList!166 lm!213)))))

(assert (=> start!1180 e!5855))

(declare-fun e!5854 () Bool)

(declare-fun inv!460 (ListLongMap!301) Bool)

(assert (=> start!1180 (and (inv!460 lm!213) e!5854)))

(assert (=> start!1180 true))

(declare-fun b!10162 () Bool)

(declare-fun a1!68 () (_ BitVec 64))

(declare-fun a2!56 () (_ BitVec 64))

(declare-fun -!8 (ListLongMap!301 (_ BitVec 64)) ListLongMap!301)

(assert (=> b!10162 (= e!5855 (not (= (-!8 (-!8 lm!213 a1!68) a2!56) (-!8 (-!8 lm!213 a2!56) a1!68))))))

(declare-fun removeStrictlySorted!3 (List!300 (_ BitVec 64)) List!300)

(assert (=> b!10162 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!166 lm!213) a1!68) a2!56) (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!166 lm!213) a2!56) a1!68))))

(declare-datatypes ((Unit!211 0))(
  ( (Unit!212) )
))
(declare-fun lt!2484 () Unit!211)

(declare-fun lemmaRemoveStrictlySortedCommutative!3 (List!300 (_ BitVec 64) (_ BitVec 64)) Unit!211)

(assert (=> b!10162 (= lt!2484 (lemmaRemoveStrictlySortedCommutative!3 (toList!166 lm!213) a1!68 a2!56))))

(declare-fun b!10163 () Bool)

(declare-fun tp!1451 () Bool)

(assert (=> b!10163 (= e!5854 tp!1451)))

(assert (= (and start!1180 res!8839) b!10162))

(assert (= start!1180 b!10163))

(declare-fun m!6517 () Bool)

(assert (=> start!1180 m!6517))

(declare-fun m!6519 () Bool)

(assert (=> start!1180 m!6519))

(declare-fun m!6521 () Bool)

(assert (=> b!10162 m!6521))

(declare-fun m!6523 () Bool)

(assert (=> b!10162 m!6523))

(declare-fun m!6525 () Bool)

(assert (=> b!10162 m!6525))

(declare-fun m!6527 () Bool)

(assert (=> b!10162 m!6527))

(declare-fun m!6529 () Bool)

(assert (=> b!10162 m!6529))

(declare-fun m!6531 () Bool)

(assert (=> b!10162 m!6531))

(declare-fun m!6533 () Bool)

(assert (=> b!10162 m!6533))

(assert (=> b!10162 m!6533))

(declare-fun m!6535 () Bool)

(assert (=> b!10162 m!6535))

(assert (=> b!10162 m!6521))

(declare-fun m!6537 () Bool)

(assert (=> b!10162 m!6537))

(assert (=> b!10162 m!6523))

(assert (=> b!10162 m!6527))

(push 1)

(assert (not b!10162))

(assert (not start!1180))

(assert (not b!10163))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1013 () Bool)

(declare-fun lt!2491 () ListLongMap!301)

(declare-fun contains!140 (ListLongMap!301 (_ BitVec 64)) Bool)

(assert (=> d!1013 (not (contains!140 lt!2491 a1!68))))

(assert (=> d!1013 (= lt!2491 (ListLongMap!302 (removeStrictlySorted!3 (toList!166 (-!8 lm!213 a2!56)) a1!68)))))

(assert (=> d!1013 (= (-!8 (-!8 lm!213 a2!56) a1!68) lt!2491)))

(declare-fun bs!352 () Bool)

(assert (= bs!352 d!1013))

(declare-fun m!6540 () Bool)

(assert (=> bs!352 m!6540))

(declare-fun m!6548 () Bool)

(assert (=> bs!352 m!6548))

(assert (=> b!10162 d!1013))

(declare-fun d!1022 () Bool)

(declare-fun lt!2495 () ListLongMap!301)

(assert (=> d!1022 (not (contains!140 lt!2495 a1!68))))

(assert (=> d!1022 (= lt!2495 (ListLongMap!302 (removeStrictlySorted!3 (toList!166 lm!213) a1!68)))))

(assert (=> d!1022 (= (-!8 lm!213 a1!68) lt!2495)))

(declare-fun bs!355 () Bool)

(assert (= bs!355 d!1022))

(declare-fun m!6553 () Bool)

(assert (=> bs!355 m!6553))

(assert (=> bs!355 m!6521))

(assert (=> b!10162 d!1022))

(declare-fun b!10204 () Bool)

(declare-fun e!5881 () List!300)

(assert (=> b!10204 (= e!5881 (t!2447 (removeStrictlySorted!3 (toList!166 lm!213) a1!68)))))

(declare-fun b!10205 () Bool)

(declare-fun e!5880 () List!300)

(assert (=> b!10205 (= e!5881 e!5880)))

(declare-fun c!896 () Bool)

(assert (=> b!10205 (= c!896 (and (is-Cons!296 (removeStrictlySorted!3 (toList!166 lm!213) a1!68)) (not (= (_1!148 (h!862 (removeStrictlySorted!3 (toList!166 lm!213) a1!68))) a2!56))))))

(declare-fun b!10206 () Bool)

(declare-fun e!5882 () Bool)

(declare-fun lt!2505 () List!300)

(declare-fun containsKey!13 (List!300 (_ BitVec 64)) Bool)

(assert (=> b!10206 (= e!5882 (not (containsKey!13 lt!2505 a2!56)))))

(declare-fun b!10207 () Bool)

(declare-fun $colon$colon!8 (List!300 tuple2!296) List!300)

(assert (=> b!10207 (= e!5880 ($colon$colon!8 (removeStrictlySorted!3 (t!2447 (removeStrictlySorted!3 (toList!166 lm!213) a1!68)) a2!56) (h!862 (removeStrictlySorted!3 (toList!166 lm!213) a1!68))))))

(declare-fun d!1027 () Bool)

(assert (=> d!1027 e!5882))

(declare-fun res!8848 () Bool)

(assert (=> d!1027 (=> (not res!8848) (not e!5882))))

(assert (=> d!1027 (= res!8848 (isStrictlySorted!24 lt!2505))))

(assert (=> d!1027 (= lt!2505 e!5881)))

(declare-fun c!895 () Bool)

(assert (=> d!1027 (= c!895 (and (is-Cons!296 (removeStrictlySorted!3 (toList!166 lm!213) a1!68)) (= (_1!148 (h!862 (removeStrictlySorted!3 (toList!166 lm!213) a1!68))) a2!56)))))

(assert (=> d!1027 (isStrictlySorted!24 (removeStrictlySorted!3 (toList!166 lm!213) a1!68))))

(assert (=> d!1027 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!166 lm!213) a1!68) a2!56) lt!2505)))

(declare-fun b!10208 () Bool)

(assert (=> b!10208 (= e!5880 Nil!297)))

(assert (= (and d!1027 c!895) b!10204))

(assert (= (and d!1027 (not c!895)) b!10205))

(assert (= (and b!10205 c!896) b!10207))

(assert (= (and b!10205 (not c!896)) b!10208))

(assert (= (and d!1027 res!8848) b!10206))

(declare-fun m!6561 () Bool)

(assert (=> b!10206 m!6561))

(declare-fun m!6565 () Bool)

(assert (=> b!10207 m!6565))

(assert (=> b!10207 m!6565))

(declare-fun m!6575 () Bool)

(assert (=> b!10207 m!6575))

(declare-fun m!6581 () Bool)

(assert (=> d!1027 m!6581))

(assert (=> d!1027 m!6521))

(declare-fun m!6585 () Bool)

(assert (=> d!1027 m!6585))

(assert (=> b!10162 d!1027))

(declare-fun d!1035 () Bool)

(assert (=> d!1035 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!166 lm!213) a1!68) a2!56) (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!166 lm!213) a2!56) a1!68))))

(declare-fun lt!2514 () Unit!211)

(declare-fun choose!146 (List!300 (_ BitVec 64) (_ BitVec 64)) Unit!211)

(assert (=> d!1035 (= lt!2514 (choose!146 (toList!166 lm!213) a1!68 a2!56))))

(assert (=> d!1035 (isStrictlySorted!24 (toList!166 lm!213))))

(assert (=> d!1035 (= (lemmaRemoveStrictlySortedCommutative!3 (toList!166 lm!213) a1!68 a2!56) lt!2514)))

(declare-fun bs!359 () Bool)

(assert (= bs!359 d!1035))

(assert (=> bs!359 m!6527))

(assert (=> bs!359 m!6529))

(assert (=> bs!359 m!6527))

(declare-fun m!6589 () Bool)

(assert (=> bs!359 m!6589))

(assert (=> bs!359 m!6521))

(assert (=> bs!359 m!6521))

(assert (=> bs!359 m!6537))

(assert (=> bs!359 m!6517))

(assert (=> b!10162 d!1035))

(declare-fun b!10219 () Bool)

(declare-fun e!5890 () List!300)

(assert (=> b!10219 (= e!5890 (t!2447 (toList!166 lm!213)))))

(declare-fun b!10220 () Bool)

(declare-fun e!5889 () List!300)

(assert (=> b!10220 (= e!5890 e!5889)))

(declare-fun c!902 () Bool)

(assert (=> b!10220 (= c!902 (and (is-Cons!296 (toList!166 lm!213)) (not (= (_1!148 (h!862 (toList!166 lm!213))) a1!68))))))

(declare-fun b!10221 () Bool)

(declare-fun e!5891 () Bool)

(declare-fun lt!2517 () List!300)

(assert (=> b!10221 (= e!5891 (not (containsKey!13 lt!2517 a1!68)))))

(declare-fun b!10222 () Bool)

(assert (=> b!10222 (= e!5889 ($colon$colon!8 (removeStrictlySorted!3 (t!2447 (toList!166 lm!213)) a1!68) (h!862 (toList!166 lm!213))))))

(declare-fun d!1041 () Bool)

(assert (=> d!1041 e!5891))

(declare-fun res!8851 () Bool)

(assert (=> d!1041 (=> (not res!8851) (not e!5891))))

(assert (=> d!1041 (= res!8851 (isStrictlySorted!24 lt!2517))))

(assert (=> d!1041 (= lt!2517 e!5890)))

(declare-fun c!901 () Bool)

(assert (=> d!1041 (= c!901 (and (is-Cons!296 (toList!166 lm!213)) (= (_1!148 (h!862 (toList!166 lm!213))) a1!68)))))

(assert (=> d!1041 (isStrictlySorted!24 (toList!166 lm!213))))

(assert (=> d!1041 (= (removeStrictlySorted!3 (toList!166 lm!213) a1!68) lt!2517)))

(declare-fun b!10223 () Bool)

(assert (=> b!10223 (= e!5889 Nil!297)))

(assert (= (and d!1041 c!901) b!10219))

(assert (= (and d!1041 (not c!901)) b!10220))

(assert (= (and b!10220 c!902) b!10222))

(assert (= (and b!10220 (not c!902)) b!10223))

(assert (= (and d!1041 res!8851) b!10221))

(declare-fun m!6605 () Bool)

(assert (=> b!10221 m!6605))

(declare-fun m!6609 () Bool)

(assert (=> b!10222 m!6609))

(assert (=> b!10222 m!6609))

(declare-fun m!6613 () Bool)

(assert (=> b!10222 m!6613))

(declare-fun m!6615 () Bool)

(assert (=> d!1041 m!6615))

(assert (=> d!1041 m!6517))

(assert (=> b!10162 d!1041))

(declare-fun b!10234 () Bool)

(declare-fun e!5899 () List!300)

(assert (=> b!10234 (= e!5899 (t!2447 (removeStrictlySorted!3 (toList!166 lm!213) a2!56)))))

(declare-fun b!10235 () Bool)

(declare-fun e!5898 () List!300)

(assert (=> b!10235 (= e!5899 e!5898)))

(declare-fun c!908 () Bool)

(assert (=> b!10235 (= c!908 (and (is-Cons!296 (removeStrictlySorted!3 (toList!166 lm!213) a2!56)) (not (= (_1!148 (h!862 (removeStrictlySorted!3 (toList!166 lm!213) a2!56))) a1!68))))))

(declare-fun b!10236 () Bool)

(declare-fun e!5900 () Bool)

(declare-fun lt!2520 () List!300)

(assert (=> b!10236 (= e!5900 (not (containsKey!13 lt!2520 a1!68)))))

(declare-fun b!10237 () Bool)

(assert (=> b!10237 (= e!5898 ($colon$colon!8 (removeStrictlySorted!3 (t!2447 (removeStrictlySorted!3 (toList!166 lm!213) a2!56)) a1!68) (h!862 (removeStrictlySorted!3 (toList!166 lm!213) a2!56))))))

(declare-fun d!1047 () Bool)

(assert (=> d!1047 e!5900))

(declare-fun res!8854 () Bool)

(assert (=> d!1047 (=> (not res!8854) (not e!5900))))

(assert (=> d!1047 (= res!8854 (isStrictlySorted!24 lt!2520))))

(assert (=> d!1047 (= lt!2520 e!5899)))

(declare-fun c!907 () Bool)

(assert (=> d!1047 (= c!907 (and (is-Cons!296 (removeStrictlySorted!3 (toList!166 lm!213) a2!56)) (= (_1!148 (h!862 (removeStrictlySorted!3 (toList!166 lm!213) a2!56))) a1!68)))))

(assert (=> d!1047 (isStrictlySorted!24 (removeStrictlySorted!3 (toList!166 lm!213) a2!56))))

(assert (=> d!1047 (= (removeStrictlySorted!3 (removeStrictlySorted!3 (toList!166 lm!213) a2!56) a1!68) lt!2520)))

(declare-fun b!10238 () Bool)

(assert (=> b!10238 (= e!5898 Nil!297)))

(assert (= (and d!1047 c!907) b!10234))

(assert (= (and d!1047 (not c!907)) b!10235))

(assert (= (and b!10235 c!908) b!10237))

(assert (= (and b!10235 (not c!908)) b!10238))

(assert (= (and d!1047 res!8854) b!10236))

(declare-fun m!6631 () Bool)

(assert (=> b!10236 m!6631))

(declare-fun m!6637 () Bool)

(assert (=> b!10237 m!6637))

(assert (=> b!10237 m!6637))

(declare-fun m!6641 () Bool)

(assert (=> b!10237 m!6641))

(declare-fun m!6643 () Bool)

(assert (=> d!1047 m!6643))

(assert (=> d!1047 m!6527))

(declare-fun m!6645 () Bool)

(assert (=> d!1047 m!6645))

(assert (=> b!10162 d!1047))

(declare-fun d!1053 () Bool)

(declare-fun lt!2523 () ListLongMap!301)

(assert (=> d!1053 (not (contains!140 lt!2523 a2!56))))

(assert (=> d!1053 (= lt!2523 (ListLongMap!302 (removeStrictlySorted!3 (toList!166 (-!8 lm!213 a1!68)) a2!56)))))

(assert (=> d!1053 (= (-!8 (-!8 lm!213 a1!68) a2!56) lt!2523)))

(declare-fun bs!362 () Bool)

(assert (= bs!362 d!1053))

(declare-fun m!6655 () Bool)

(assert (=> bs!362 m!6655))

(declare-fun m!6657 () Bool)

(assert (=> bs!362 m!6657))

(assert (=> b!10162 d!1053))

(declare-fun b!10249 () Bool)

(declare-fun e!5908 () List!300)

(assert (=> b!10249 (= e!5908 (t!2447 (toList!166 lm!213)))))

(declare-fun b!10250 () Bool)

(declare-fun e!5907 () List!300)

(assert (=> b!10250 (= e!5908 e!5907)))

(declare-fun c!914 () Bool)

(assert (=> b!10250 (= c!914 (and (is-Cons!296 (toList!166 lm!213)) (not (= (_1!148 (h!862 (toList!166 lm!213))) a2!56))))))

(declare-fun b!10251 () Bool)

(declare-fun e!5909 () Bool)

(declare-fun lt!2526 () List!300)

(assert (=> b!10251 (= e!5909 (not (containsKey!13 lt!2526 a2!56)))))

(declare-fun b!10252 () Bool)

(assert (=> b!10252 (= e!5907 ($colon$colon!8 (removeStrictlySorted!3 (t!2447 (toList!166 lm!213)) a2!56) (h!862 (toList!166 lm!213))))))

(declare-fun d!1059 () Bool)

(assert (=> d!1059 e!5909))

(declare-fun res!8857 () Bool)

(assert (=> d!1059 (=> (not res!8857) (not e!5909))))

(assert (=> d!1059 (= res!8857 (isStrictlySorted!24 lt!2526))))

(assert (=> d!1059 (= lt!2526 e!5908)))

(declare-fun c!913 () Bool)

(assert (=> d!1059 (= c!913 (and (is-Cons!296 (toList!166 lm!213)) (= (_1!148 (h!862 (toList!166 lm!213))) a2!56)))))

(assert (=> d!1059 (isStrictlySorted!24 (toList!166 lm!213))))

(assert (=> d!1059 (= (removeStrictlySorted!3 (toList!166 lm!213) a2!56) lt!2526)))

(declare-fun b!10253 () Bool)

