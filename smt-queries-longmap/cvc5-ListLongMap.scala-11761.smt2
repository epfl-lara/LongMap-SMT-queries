; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138010 () Bool)

(assert start!138010)

(declare-fun b!1584128 () Bool)

(declare-fun res!1082016 () Bool)

(declare-fun e!884280 () Bool)

(assert (=> b!1584128 (=> (not res!1082016) (not e!884280))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1584128 (= res!1082016 (not (= otherKey!56 newKey!123)))))

(declare-fun res!1082017 () Bool)

(assert (=> start!138010 (=> (not res!1082017) (not e!884280))))

(declare-datatypes ((B!2906 0))(
  ( (B!2907 (val!19815 Int)) )
))
(declare-datatypes ((tuple2!25798 0))(
  ( (tuple2!25799 (_1!12910 (_ BitVec 64)) (_2!12910 B!2906)) )
))
(declare-datatypes ((List!36935 0))(
  ( (Nil!36932) (Cons!36931 (h!38474 tuple2!25798) (t!51849 List!36935)) )
))
(declare-fun l!1251 () List!36935)

(declare-fun isStrictlySorted!1160 (List!36935) Bool)

(assert (=> start!138010 (= res!1082017 (isStrictlySorted!1160 l!1251))))

(assert (=> start!138010 e!884280))

(declare-fun e!884281 () Bool)

(assert (=> start!138010 e!884281))

(assert (=> start!138010 true))

(declare-fun b!1584127 () Bool)

(declare-fun res!1082018 () Bool)

(assert (=> b!1584127 (=> (not res!1082018) (not e!884280))))

(declare-fun containsKey!994 (List!36935 (_ BitVec 64)) Bool)

(assert (=> b!1584127 (= res!1082018 (not (containsKey!994 l!1251 otherKey!56)))))

(declare-fun b!1584129 () Bool)

(declare-fun ListPrimitiveSize!217 (List!36935) Int)

(assert (=> b!1584129 (= e!884280 (< (ListPrimitiveSize!217 l!1251) 0))))

(declare-fun b!1584130 () Bool)

(declare-fun tp_is_empty!39439 () Bool)

(declare-fun tp!115066 () Bool)

(assert (=> b!1584130 (= e!884281 (and tp_is_empty!39439 tp!115066))))

(assert (= (and start!138010 res!1082017) b!1584127))

(assert (= (and b!1584127 res!1082018) b!1584128))

(assert (= (and b!1584128 res!1082016) b!1584129))

(assert (= (and start!138010 (is-Cons!36931 l!1251)) b!1584130))

(declare-fun m!1453613 () Bool)

(assert (=> start!138010 m!1453613))

(declare-fun m!1453615 () Bool)

(assert (=> b!1584127 m!1453615))

(declare-fun m!1453617 () Bool)

(assert (=> b!1584129 m!1453617))

(push 1)

(assert tp_is_empty!39439)

(assert (not b!1584129))

(assert (not b!1584130))

(assert (not b!1584127))

(assert (not start!138010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167359 () Bool)

(declare-fun res!1082055 () Bool)

(declare-fun e!884314 () Bool)

(assert (=> d!167359 (=> res!1082055 e!884314)))

(assert (=> d!167359 (= res!1082055 (and (is-Cons!36931 l!1251) (= (_1!12910 (h!38474 l!1251)) otherKey!56)))))

(assert (=> d!167359 (= (containsKey!994 l!1251 otherKey!56) e!884314)))

(declare-fun b!1584177 () Bool)

(declare-fun e!884315 () Bool)

(assert (=> b!1584177 (= e!884314 e!884315)))

(declare-fun res!1082056 () Bool)

(assert (=> b!1584177 (=> (not res!1082056) (not e!884315))))

(assert (=> b!1584177 (= res!1082056 (and (or (not (is-Cons!36931 l!1251)) (bvsle (_1!12910 (h!38474 l!1251)) otherKey!56)) (is-Cons!36931 l!1251) (bvslt (_1!12910 (h!38474 l!1251)) otherKey!56)))))

(declare-fun b!1584178 () Bool)

(assert (=> b!1584178 (= e!884315 (containsKey!994 (t!51849 l!1251) otherKey!56))))

(assert (= (and d!167359 (not res!1082055)) b!1584177))

(assert (= (and b!1584177 res!1082056) b!1584178))

(declare-fun m!1453635 () Bool)

(assert (=> b!1584178 m!1453635))

(assert (=> b!1584127 d!167359))

(declare-fun d!167365 () Bool)

(declare-fun lt!677241 () Int)

(assert (=> d!167365 (>= lt!677241 0)))

(declare-fun e!884327 () Int)

(assert (=> d!167365 (= lt!677241 e!884327)))

(declare-fun c!146840 () Bool)

(assert (=> d!167365 (= c!146840 (is-Nil!36932 l!1251))))

(assert (=> d!167365 (= (ListPrimitiveSize!217 l!1251) lt!677241)))

(declare-fun b!1584191 () Bool)

(assert (=> b!1584191 (= e!884327 0)))

(declare-fun b!1584192 () Bool)

(assert (=> b!1584192 (= e!884327 (+ 1 (ListPrimitiveSize!217 (t!51849 l!1251))))))

(assert (= (and d!167365 c!146840) b!1584191))

(assert (= (and d!167365 (not c!146840)) b!1584192))

(declare-fun m!1453641 () Bool)

(assert (=> b!1584192 m!1453641))

(assert (=> b!1584129 d!167365))

(declare-fun d!167371 () Bool)

(declare-fun res!1082071 () Bool)

(declare-fun e!884343 () Bool)

(assert (=> d!167371 (=> res!1082071 e!884343)))

(assert (=> d!167371 (= res!1082071 (or (is-Nil!36932 l!1251) (is-Nil!36932 (t!51849 l!1251))))))

(assert (=> d!167371 (= (isStrictlySorted!1160 l!1251) e!884343)))

(declare-fun b!1584217 () Bool)

(declare-fun e!884344 () Bool)

(assert (=> b!1584217 (= e!884343 e!884344)))

(declare-fun res!1082072 () Bool)

(assert (=> b!1584217 (=> (not res!1082072) (not e!884344))))

(assert (=> b!1584217 (= res!1082072 (bvslt (_1!12910 (h!38474 l!1251)) (_1!12910 (h!38474 (t!51849 l!1251)))))))

(declare-fun b!1584218 () Bool)

(assert (=> b!1584218 (= e!884344 (isStrictlySorted!1160 (t!51849 l!1251)))))

(assert (= (and d!167371 (not res!1082071)) b!1584217))

(assert (= (and b!1584217 res!1082072) b!1584218))

(declare-fun m!1453647 () Bool)

(assert (=> b!1584218 m!1453647))

(assert (=> start!138010 d!167371))

(declare-fun b!1584223 () Bool)

(declare-fun e!884347 () Bool)

(declare-fun tp!115081 () Bool)

(assert (=> b!1584223 (= e!884347 (and tp_is_empty!39439 tp!115081))))

(assert (=> b!1584130 (= tp!115066 e!884347)))

(assert (= (and b!1584130 (is-Cons!36931 (t!51849 l!1251))) b!1584223))

(push 1)

