; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137986 () Bool)

(assert start!137986)

(declare-fun res!1081929 () Bool)

(declare-fun e!884167 () Bool)

(assert (=> start!137986 (=> (not res!1081929) (not e!884167))))

(declare-datatypes ((B!2900 0))(
  ( (B!2901 (val!19812 Int)) )
))
(declare-datatypes ((tuple2!25792 0))(
  ( (tuple2!25793 (_1!12907 (_ BitVec 64)) (_2!12907 B!2900)) )
))
(declare-datatypes ((List!36932 0))(
  ( (Nil!36929) (Cons!36928 (h!38471 tuple2!25792) (t!51846 List!36932)) )
))
(declare-fun l!1251 () List!36932)

(declare-fun isStrictlySorted!1157 (List!36932) Bool)

(assert (=> start!137986 (= res!1081929 (isStrictlySorted!1157 l!1251))))

(assert (=> start!137986 e!884167))

(declare-fun e!884166 () Bool)

(assert (=> start!137986 e!884166))

(assert (=> start!137986 true))

(declare-fun tp_is_empty!39433 () Bool)

(assert (=> start!137986 tp_is_empty!39433))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun newValue!123 () B!2900)

(declare-fun b!1583946 () Bool)

(declare-fun insertStrictlySorted!623 (List!36932 (_ BitVec 64) B!2900) List!36932)

(assert (=> b!1583946 (= e!884167 (not (isStrictlySorted!1157 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))))))

(declare-fun b!1583944 () Bool)

(declare-fun res!1081930 () Bool)

(assert (=> b!1583944 (=> (not res!1081930) (not e!884167))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!991 (List!36932 (_ BitVec 64)) Bool)

(assert (=> b!1583944 (= res!1081930 (not (containsKey!991 l!1251 otherKey!56)))))

(declare-fun b!1583947 () Bool)

(declare-fun tp!115048 () Bool)

(assert (=> b!1583947 (= e!884166 (and tp_is_empty!39433 tp!115048))))

(declare-fun b!1583945 () Bool)

(declare-fun res!1081931 () Bool)

(assert (=> b!1583945 (=> (not res!1081931) (not e!884167))))

(assert (=> b!1583945 (= res!1081931 (and (not (= otherKey!56 newKey!123)) (not (is-Cons!36928 l!1251))))))

(assert (= (and start!137986 res!1081929) b!1583944))

(assert (= (and b!1583944 res!1081930) b!1583945))

(assert (= (and b!1583945 res!1081931) b!1583946))

(assert (= (and start!137986 (is-Cons!36928 l!1251)) b!1583947))

(declare-fun m!1453541 () Bool)

(assert (=> start!137986 m!1453541))

(declare-fun m!1453543 () Bool)

(assert (=> b!1583946 m!1453543))

(assert (=> b!1583946 m!1453543))

(declare-fun m!1453545 () Bool)

(assert (=> b!1583946 m!1453545))

(declare-fun m!1453547 () Bool)

(assert (=> b!1583944 m!1453547))

(push 1)

(assert tp_is_empty!39433)

(assert (not start!137986))

(assert (not b!1583947))

(assert (not b!1583944))

(assert (not b!1583946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167333 () Bool)

(declare-fun res!1081966 () Bool)

(declare-fun e!884196 () Bool)

(assert (=> d!167333 (=> res!1081966 e!884196)))

(assert (=> d!167333 (= res!1081966 (or (is-Nil!36929 l!1251) (is-Nil!36929 (t!51846 l!1251))))))

(assert (=> d!167333 (= (isStrictlySorted!1157 l!1251) e!884196)))

(declare-fun b!1583988 () Bool)

(declare-fun e!884197 () Bool)

(assert (=> b!1583988 (= e!884196 e!884197)))

(declare-fun res!1081967 () Bool)

(assert (=> b!1583988 (=> (not res!1081967) (not e!884197))))

(assert (=> b!1583988 (= res!1081967 (bvslt (_1!12907 (h!38471 l!1251)) (_1!12907 (h!38471 (t!51846 l!1251)))))))

(declare-fun b!1583989 () Bool)

(assert (=> b!1583989 (= e!884197 (isStrictlySorted!1157 (t!51846 l!1251)))))

(assert (= (and d!167333 (not res!1081966)) b!1583988))

(assert (= (and b!1583988 res!1081967) b!1583989))

(declare-fun m!1453569 () Bool)

(assert (=> b!1583989 m!1453569))

(assert (=> start!137986 d!167333))

(declare-fun d!167339 () Bool)

(declare-fun res!1081968 () Bool)

(declare-fun e!884198 () Bool)

(assert (=> d!167339 (=> res!1081968 e!884198)))

(assert (=> d!167339 (= res!1081968 (or (is-Nil!36929 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123)) (is-Nil!36929 (t!51846 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167339 (= (isStrictlySorted!1157 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123)) e!884198)))

(declare-fun b!1583990 () Bool)

(declare-fun e!884199 () Bool)

(assert (=> b!1583990 (= e!884198 e!884199)))

(declare-fun res!1081969 () Bool)

(assert (=> b!1583990 (=> (not res!1081969) (not e!884199))))

(assert (=> b!1583990 (= res!1081969 (bvslt (_1!12907 (h!38471 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))) (_1!12907 (h!38471 (t!51846 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1583991 () Bool)

(assert (=> b!1583991 (= e!884199 (isStrictlySorted!1157 (t!51846 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167339 (not res!1081968)) b!1583990))

(assert (= (and b!1583990 res!1081969) b!1583991))

(declare-fun m!1453571 () Bool)

(assert (=> b!1583991 m!1453571))

(assert (=> b!1583946 d!167339))

(declare-fun b!1584064 () Bool)

(declare-fun e!884242 () List!36932)

(declare-fun e!884244 () List!36932)

(assert (=> b!1584064 (= e!884242 e!884244)))

(declare-fun c!146823 () Bool)

(assert (=> b!1584064 (= c!146823 (and (is-Cons!36928 l!1251) (= (_1!12907 (h!38471 l!1251)) newKey!123)))))

(declare-fun b!1584065 () Bool)

(declare-fun c!146824 () Bool)

(assert (=> b!1584065 (= c!146824 (and (is-Cons!36928 l!1251) (bvsgt (_1!12907 (h!38471 l!1251)) newKey!123)))))

(declare-fun e!884246 () List!36932)

(assert (=> b!1584065 (= e!884244 e!884246)))

(declare-fun e!884245 () List!36932)

(declare-fun b!1584066 () Bool)

(assert (=> b!1584066 (= e!884245 (ite c!146823 (t!51846 l!1251) (ite c!146824 (Cons!36928 (h!38471 l!1251) (t!51846 l!1251)) Nil!36929)))))

(declare-fun bm!72531 () Bool)

(declare-fun call!72536 () List!36932)

(declare-fun call!72535 () List!36932)

(assert (=> bm!72531 (= call!72536 call!72535)))

(declare-fun e!884243 () Bool)

(declare-fun b!1584067 () Bool)

(declare-fun lt!677233 () List!36932)

(declare-fun contains!10524 (List!36932 tuple2!25792) Bool)

(assert (=> b!1584067 (= e!884243 (contains!10524 lt!677233 (tuple2!25793 newKey!123 newValue!123)))))

(declare-fun bm!72532 () Bool)

(declare-fun c!146826 () Bool)

(declare-fun $colon$colon!1019 (List!36932 tuple2!25792) List!36932)

(assert (=> bm!72532 (= call!72535 ($colon$colon!1019 e!884245 (ite c!146826 (h!38471 l!1251) (tuple2!25793 newKey!123 newValue!123))))))

(declare-fun c!146825 () Bool)

(assert (=> bm!72532 (= c!146825 c!146826)))

(declare-fun b!1584068 () Bool)

(declare-fun res!1081994 () Bool)

(assert (=> b!1584068 (=> (not res!1081994) (not e!884243))))

(assert (=> b!1584068 (= res!1081994 (containsKey!991 lt!677233 newKey!123))))

(declare-fun b!1584069 () Bool)

(assert (=> b!1584069 (= e!884242 call!72535)))

(declare-fun bm!72533 () Bool)

(declare-fun call!72534 () List!36932)

(assert (=> bm!72533 (= call!72534 call!72536)))

(declare-fun b!1584070 () Bool)

(assert (=> b!1584070 (= e!884244 call!72536)))

(declare-fun b!1584071 () Bool)

(assert (=> b!1584071 (= e!884245 (insertStrictlySorted!623 (t!51846 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584073 () Bool)

(assert (=> b!1584073 (= e!884246 call!72534)))

(declare-fun b!1584072 () Bool)

(assert (=> b!1584072 (= e!884246 call!72534)))

(declare-fun d!167341 () Bool)

(assert (=> d!167341 e!884243))

(declare-fun res!1081995 () Bool)

(assert (=> d!167341 (=> (not res!1081995) (not e!884243))))

(assert (=> d!167341 (= res!1081995 (isStrictlySorted!1157 lt!677233))))

(assert (=> d!167341 (= lt!677233 e!884242)))

(assert (=> d!167341 (= c!146826 (and (is-Cons!36928 l!1251) (bvslt (_1!12907 (h!38471 l!1251)) newKey!123)))))

(assert (=> d!167341 (isStrictlySorted!1157 l!1251)))

(assert (=> d!167341 (= (insertStrictlySorted!623 l!1251 newKey!123 newValue!123) lt!677233)))

(assert (= (and d!167341 c!146826) b!1584069))

(assert (= (and d!167341 (not c!146826)) b!1584064))

(assert (= (and b!1584064 c!146823) b!1584070))

(assert (= (and b!1584064 (not c!146823)) b!1584065))

(assert (= (and b!1584065 c!146824) b!1584073))

(assert (= (and b!1584065 (not c!146824)) b!1584072))

(assert (= (or b!1584073 b!1584072) bm!72533))

(assert (= (or b!1584070 bm!72533) bm!72531))

(assert (= (or b!1584069 bm!72531) bm!72532))

(assert (= (and bm!72532 c!146825) b!1584071))

(assert (= (and bm!72532 (not c!146825)) b!1584066))

(assert (= (and d!167341 res!1081995) b!1584068))

(assert (= (and b!1584068 res!1081994) b!1584067))

(declare-fun m!1453577 () Bool)

(assert (=> d!167341 m!1453577))

(assert (=> d!167341 m!1453541))

(declare-fun m!1453579 () Bool)

(assert (=> bm!72532 m!1453579))

(declare-fun m!1453581 () Bool)

(assert (=> b!1584068 m!1453581))

(declare-fun m!1453583 () Bool)

(assert (=> b!1584067 m!1453583))

(declare-fun m!1453585 () Bool)

(assert (=> b!1584071 m!1453585))

(assert (=> b!1583946 d!167341))

(declare-fun d!167347 () Bool)

(declare-fun res!1082008 () Bool)

(declare-fun e!884271 () Bool)

(assert (=> d!167347 (=> res!1082008 e!884271)))

(assert (=> d!167347 (= res!1082008 (and (is-Cons!36928 l!1251) (= (_1!12907 (h!38471 l!1251)) otherKey!56)))))

(assert (=> d!167347 (= (containsKey!991 l!1251 otherKey!56) e!884271)))

(declare-fun b!1584112 () Bool)

(declare-fun e!884272 () Bool)

(assert (=> b!1584112 (= e!884271 e!884272)))

(declare-fun res!1082009 () Bool)

(assert (=> b!1584112 (=> (not res!1082009) (not e!884272))))

(assert (=> b!1584112 (= res!1082009 (and (or (not (is-Cons!36928 l!1251)) (bvsle (_1!12907 (h!38471 l!1251)) otherKey!56)) (is-Cons!36928 l!1251) (bvslt (_1!12907 (h!38471 l!1251)) otherKey!56)))))

(declare-fun b!1584113 () Bool)

(assert (=> b!1584113 (= e!884272 (containsKey!991 (t!51846 l!1251) otherKey!56))))

(assert (= (and d!167347 (not res!1082008)) b!1584112))

(assert (= (and b!1584112 res!1082009) b!1584113))

(declare-fun m!1453611 () Bool)

(assert (=> b!1584113 m!1453611))

(assert (=> b!1583944 d!167347))

(declare-fun b!1584118 () Bool)

(declare-fun e!884275 () Bool)

(declare-fun tp!115063 () Bool)

(assert (=> b!1584118 (= e!884275 (and tp_is_empty!39433 tp!115063))))

(assert (=> b!1583947 (= tp!115048 e!884275)))

(assert (= (and b!1583947 (is-Cons!36928 (t!51846 l!1251))) b!1584118))

(push 1)

