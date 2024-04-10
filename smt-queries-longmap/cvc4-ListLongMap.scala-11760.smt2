; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137990 () Bool)

(assert start!137990)

(declare-fun e!884179 () Bool)

(declare-fun newKey!123 () (_ BitVec 64))

(declare-datatypes ((B!2904 0))(
  ( (B!2905 (val!19814 Int)) )
))
(declare-datatypes ((tuple2!25796 0))(
  ( (tuple2!25797 (_1!12909 (_ BitVec 64)) (_2!12909 B!2904)) )
))
(declare-datatypes ((List!36934 0))(
  ( (Nil!36931) (Cons!36930 (h!38473 tuple2!25796) (t!51848 List!36934)) )
))
(declare-fun l!1251 () List!36934)

(declare-fun newValue!123 () B!2904)

(declare-fun b!1583970 () Bool)

(declare-fun isStrictlySorted!1159 (List!36934) Bool)

(declare-fun insertStrictlySorted!625 (List!36934 (_ BitVec 64) B!2904) List!36934)

(assert (=> b!1583970 (= e!884179 (not (isStrictlySorted!1159 (insertStrictlySorted!625 l!1251 newKey!123 newValue!123))))))

(declare-fun b!1583971 () Bool)

(declare-fun e!884178 () Bool)

(declare-fun tp_is_empty!39437 () Bool)

(declare-fun tp!115054 () Bool)

(assert (=> b!1583971 (= e!884178 (and tp_is_empty!39437 tp!115054))))

(declare-fun b!1583968 () Bool)

(declare-fun res!1081947 () Bool)

(assert (=> b!1583968 (=> (not res!1081947) (not e!884179))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!993 (List!36934 (_ BitVec 64)) Bool)

(assert (=> b!1583968 (= res!1081947 (not (containsKey!993 l!1251 otherKey!56)))))

(declare-fun res!1081948 () Bool)

(assert (=> start!137990 (=> (not res!1081948) (not e!884179))))

(assert (=> start!137990 (= res!1081948 (isStrictlySorted!1159 l!1251))))

(assert (=> start!137990 e!884179))

(assert (=> start!137990 e!884178))

(assert (=> start!137990 true))

(assert (=> start!137990 tp_is_empty!39437))

(declare-fun b!1583969 () Bool)

(declare-fun res!1081949 () Bool)

(assert (=> b!1583969 (=> (not res!1081949) (not e!884179))))

(assert (=> b!1583969 (= res!1081949 (and (not (= otherKey!56 newKey!123)) (not (is-Cons!36930 l!1251))))))

(assert (= (and start!137990 res!1081948) b!1583968))

(assert (= (and b!1583968 res!1081947) b!1583969))

(assert (= (and b!1583969 res!1081949) b!1583970))

(assert (= (and start!137990 (is-Cons!36930 l!1251)) b!1583971))

(declare-fun m!1453557 () Bool)

(assert (=> b!1583970 m!1453557))

(assert (=> b!1583970 m!1453557))

(declare-fun m!1453559 () Bool)

(assert (=> b!1583970 m!1453559))

(declare-fun m!1453561 () Bool)

(assert (=> b!1583968 m!1453561))

(declare-fun m!1453563 () Bool)

(assert (=> start!137990 m!1453563))

(push 1)

(assert (not b!1583968))

(assert tp_is_empty!39437)

(assert (not b!1583971))

(assert (not b!1583970))

(assert (not start!137990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167330 () Bool)

(declare-fun res!1081964 () Bool)

(declare-fun e!884194 () Bool)

(assert (=> d!167330 (=> res!1081964 e!884194)))

(assert (=> d!167330 (= res!1081964 (and (is-Cons!36930 l!1251) (= (_1!12909 (h!38473 l!1251)) otherKey!56)))))

(assert (=> d!167330 (= (containsKey!993 l!1251 otherKey!56) e!884194)))

(declare-fun b!1583986 () Bool)

(declare-fun e!884195 () Bool)

(assert (=> b!1583986 (= e!884194 e!884195)))

(declare-fun res!1081965 () Bool)

(assert (=> b!1583986 (=> (not res!1081965) (not e!884195))))

(assert (=> b!1583986 (= res!1081965 (and (or (not (is-Cons!36930 l!1251)) (bvsle (_1!12909 (h!38473 l!1251)) otherKey!56)) (is-Cons!36930 l!1251) (bvslt (_1!12909 (h!38473 l!1251)) otherKey!56)))))

(declare-fun b!1583987 () Bool)

(assert (=> b!1583987 (= e!884195 (containsKey!993 (t!51848 l!1251) otherKey!56))))

(assert (= (and d!167330 (not res!1081964)) b!1583986))

(assert (= (and b!1583986 res!1081965) b!1583987))

(declare-fun m!1453565 () Bool)

(assert (=> b!1583987 m!1453565))

(assert (=> b!1583968 d!167330))

(declare-fun d!167335 () Bool)

(declare-fun res!1081978 () Bool)

(declare-fun e!884208 () Bool)

(assert (=> d!167335 (=> res!1081978 e!884208)))

(assert (=> d!167335 (= res!1081978 (or (is-Nil!36931 (insertStrictlySorted!625 l!1251 newKey!123 newValue!123)) (is-Nil!36931 (t!51848 (insertStrictlySorted!625 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167335 (= (isStrictlySorted!1159 (insertStrictlySorted!625 l!1251 newKey!123 newValue!123)) e!884208)))

(declare-fun b!1584000 () Bool)

(declare-fun e!884209 () Bool)

(assert (=> b!1584000 (= e!884208 e!884209)))

(declare-fun res!1081979 () Bool)

(assert (=> b!1584000 (=> (not res!1081979) (not e!884209))))

(assert (=> b!1584000 (= res!1081979 (bvslt (_1!12909 (h!38473 (insertStrictlySorted!625 l!1251 newKey!123 newValue!123))) (_1!12909 (h!38473 (t!51848 (insertStrictlySorted!625 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1584001 () Bool)

(assert (=> b!1584001 (= e!884209 (isStrictlySorted!1159 (t!51848 (insertStrictlySorted!625 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167335 (not res!1081978)) b!1584000))

(assert (= (and b!1584000 res!1081979) b!1584001))

(declare-fun m!1453573 () Bool)

(assert (=> b!1584001 m!1453573))

(assert (=> b!1583970 d!167335))

(declare-fun bm!72534 () Bool)

(declare-fun call!72537 () List!36934)

(declare-fun call!72539 () List!36934)

(assert (=> bm!72534 (= call!72537 call!72539)))

(declare-fun e!884250 () Bool)

(declare-fun b!1584074 () Bool)

(declare-fun lt!677234 () List!36934)

(declare-fun contains!10525 (List!36934 tuple2!25796) Bool)

(assert (=> b!1584074 (= e!884250 (contains!10525 lt!677234 (tuple2!25797 newKey!123 newValue!123)))))

(declare-fun b!1584075 () Bool)

(declare-fun e!884247 () List!36934)

(declare-fun c!146827 () Bool)

(declare-fun c!146828 () Bool)

(assert (=> b!1584075 (= e!884247 (ite c!146828 (t!51848 l!1251) (ite c!146827 (Cons!36930 (h!38473 l!1251) (t!51848 l!1251)) Nil!36931)))))

(declare-fun b!1584076 () Bool)

(declare-fun e!884251 () List!36934)

(declare-fun call!72538 () List!36934)

(assert (=> b!1584076 (= e!884251 call!72538)))

(declare-fun b!1584077 () Bool)

(declare-fun e!884249 () List!36934)

(assert (=> b!1584077 (= e!884249 call!72537)))

(declare-fun b!1584078 () Bool)

(declare-fun e!884248 () List!36934)

(assert (=> b!1584078 (= e!884248 call!72539)))

(declare-fun b!1584079 () Bool)

(assert (=> b!1584079 (= e!884251 call!72538)))

(declare-fun b!1584080 () Bool)

(assert (=> b!1584080 (= e!884248 e!884249)))

(assert (=> b!1584080 (= c!146828 (and (is-Cons!36930 l!1251) (= (_1!12909 (h!38473 l!1251)) newKey!123)))))

(declare-fun bm!72535 () Bool)

(assert (=> bm!72535 (= call!72538 call!72537)))

(declare-fun bm!72536 () Bool)

(declare-fun c!146829 () Bool)

(declare-fun $colon$colon!1021 (List!36934 tuple2!25796) List!36934)

(assert (=> bm!72536 (= call!72539 ($colon$colon!1021 e!884247 (ite c!146829 (h!38473 l!1251) (tuple2!25797 newKey!123 newValue!123))))))

(declare-fun c!146830 () Bool)

(assert (=> bm!72536 (= c!146830 c!146829)))

(declare-fun d!167343 () Bool)

(assert (=> d!167343 e!884250))

(declare-fun res!1081997 () Bool)

(assert (=> d!167343 (=> (not res!1081997) (not e!884250))))

(assert (=> d!167343 (= res!1081997 (isStrictlySorted!1159 lt!677234))))

(assert (=> d!167343 (= lt!677234 e!884248)))

(assert (=> d!167343 (= c!146829 (and (is-Cons!36930 l!1251) (bvslt (_1!12909 (h!38473 l!1251)) newKey!123)))))

(assert (=> d!167343 (isStrictlySorted!1159 l!1251)))

(assert (=> d!167343 (= (insertStrictlySorted!625 l!1251 newKey!123 newValue!123) lt!677234)))

(declare-fun b!1584081 () Bool)

(assert (=> b!1584081 (= e!884247 (insertStrictlySorted!625 (t!51848 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584082 () Bool)

(assert (=> b!1584082 (= c!146827 (and (is-Cons!36930 l!1251) (bvsgt (_1!12909 (h!38473 l!1251)) newKey!123)))))

(assert (=> b!1584082 (= e!884249 e!884251)))

(declare-fun b!1584083 () Bool)

(declare-fun res!1081996 () Bool)

(assert (=> b!1584083 (=> (not res!1081996) (not e!884250))))

(assert (=> b!1584083 (= res!1081996 (containsKey!993 lt!677234 newKey!123))))

(assert (= (and d!167343 c!146829) b!1584078))

(assert (= (and d!167343 (not c!146829)) b!1584080))

(assert (= (and b!1584080 c!146828) b!1584077))

(assert (= (and b!1584080 (not c!146828)) b!1584082))

(assert (= (and b!1584082 c!146827) b!1584076))

(assert (= (and b!1584082 (not c!146827)) b!1584079))

(assert (= (or b!1584076 b!1584079) bm!72535))

(assert (= (or b!1584077 bm!72535) bm!72534))

(assert (= (or b!1584078 bm!72534) bm!72536))

(assert (= (and bm!72536 c!146830) b!1584081))

(assert (= (and bm!72536 (not c!146830)) b!1584075))

(assert (= (and d!167343 res!1081997) b!1584083))

(assert (= (and b!1584083 res!1081996) b!1584074))

(declare-fun m!1453587 () Bool)

(assert (=> b!1584074 m!1453587))

(declare-fun m!1453589 () Bool)

(assert (=> d!167343 m!1453589))

(assert (=> d!167343 m!1453563))

(declare-fun m!1453591 () Bool)

(assert (=> b!1584083 m!1453591))

(declare-fun m!1453593 () Bool)

(assert (=> b!1584081 m!1453593))

(declare-fun m!1453595 () Bool)

(assert (=> bm!72536 m!1453595))

(assert (=> b!1583970 d!167343))

