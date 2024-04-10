; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138014 () Bool)

(assert start!138014)

(declare-fun b!1584154 () Bool)

(declare-fun e!884292 () Bool)

(declare-fun tp_is_empty!39443 () Bool)

(declare-fun tp!115072 () Bool)

(assert (=> b!1584154 (= e!884292 (and tp_is_empty!39443 tp!115072))))

(declare-fun b!1584153 () Bool)

(declare-fun e!884293 () Bool)

(declare-datatypes ((B!2910 0))(
  ( (B!2911 (val!19817 Int)) )
))
(declare-datatypes ((tuple2!25802 0))(
  ( (tuple2!25803 (_1!12912 (_ BitVec 64)) (_2!12912 B!2910)) )
))
(declare-datatypes ((List!36937 0))(
  ( (Nil!36934) (Cons!36933 (h!38476 tuple2!25802) (t!51851 List!36937)) )
))
(declare-fun l!1251 () List!36937)

(declare-fun ListPrimitiveSize!219 (List!36937) Int)

(assert (=> b!1584153 (= e!884293 (< (ListPrimitiveSize!219 l!1251) 0))))

(declare-fun b!1584152 () Bool)

(declare-fun res!1082035 () Bool)

(assert (=> b!1584152 (=> (not res!1082035) (not e!884293))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1584152 (= res!1082035 (not (= otherKey!56 newKey!123)))))

(declare-fun b!1584151 () Bool)

(declare-fun res!1082036 () Bool)

(assert (=> b!1584151 (=> (not res!1082036) (not e!884293))))

(declare-fun containsKey!996 (List!36937 (_ BitVec 64)) Bool)

(assert (=> b!1584151 (= res!1082036 (not (containsKey!996 l!1251 otherKey!56)))))

(declare-fun res!1082034 () Bool)

(assert (=> start!138014 (=> (not res!1082034) (not e!884293))))

(declare-fun isStrictlySorted!1162 (List!36937) Bool)

(assert (=> start!138014 (= res!1082034 (isStrictlySorted!1162 l!1251))))

(assert (=> start!138014 e!884293))

(assert (=> start!138014 e!884292))

(assert (=> start!138014 true))

(assert (= (and start!138014 res!1082034) b!1584151))

(assert (= (and b!1584151 res!1082036) b!1584152))

(assert (= (and b!1584152 res!1082035) b!1584153))

(assert (= (and start!138014 (is-Cons!36933 l!1251)) b!1584154))

(declare-fun m!1453625 () Bool)

(assert (=> b!1584153 m!1453625))

(declare-fun m!1453627 () Bool)

(assert (=> b!1584151 m!1453627))

(declare-fun m!1453629 () Bool)

(assert (=> start!138014 m!1453629))

(push 1)

(assert tp_is_empty!39443)

(assert (not start!138014))

(assert (not b!1584154))

(assert (not b!1584153))

(assert (not b!1584151))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167355 () Bool)

(declare-fun res!1082045 () Bool)

(declare-fun e!884302 () Bool)

(assert (=> d!167355 (=> res!1082045 e!884302)))

(assert (=> d!167355 (= res!1082045 (or (is-Nil!36934 l!1251) (is-Nil!36934 (t!51851 l!1251))))))

(assert (=> d!167355 (= (isStrictlySorted!1162 l!1251) e!884302)))

(declare-fun b!1584163 () Bool)

(declare-fun e!884303 () Bool)

(assert (=> b!1584163 (= e!884302 e!884303)))

(declare-fun res!1082046 () Bool)

(assert (=> b!1584163 (=> (not res!1082046) (not e!884303))))

(assert (=> b!1584163 (= res!1082046 (bvslt (_1!12912 (h!38476 l!1251)) (_1!12912 (h!38476 (t!51851 l!1251)))))))

(declare-fun b!1584164 () Bool)

(assert (=> b!1584164 (= e!884303 (isStrictlySorted!1162 (t!51851 l!1251)))))

(assert (= (and d!167355 (not res!1082045)) b!1584163))

(assert (= (and b!1584163 res!1082046) b!1584164))

(declare-fun m!1453631 () Bool)

(assert (=> b!1584164 m!1453631))

(assert (=> start!138014 d!167355))

(declare-fun d!167361 () Bool)

(declare-fun lt!677238 () Int)

(assert (=> d!167361 (>= lt!677238 0)))

(declare-fun e!884318 () Int)

(assert (=> d!167361 (= lt!677238 e!884318)))

(declare-fun c!146837 () Bool)

(assert (=> d!167361 (= c!146837 (is-Nil!36934 l!1251))))

(assert (=> d!167361 (= (ListPrimitiveSize!219 l!1251) lt!677238)))

(declare-fun b!1584181 () Bool)

(assert (=> b!1584181 (= e!884318 0)))

(declare-fun b!1584182 () Bool)

(assert (=> b!1584182 (= e!884318 (+ 1 (ListPrimitiveSize!219 (t!51851 l!1251))))))

(assert (= (and d!167361 c!146837) b!1584181))

(assert (= (and d!167361 (not c!146837)) b!1584182))

(declare-fun m!1453637 () Bool)

(assert (=> b!1584182 m!1453637))

(assert (=> b!1584153 d!167361))

(declare-fun d!167367 () Bool)

(declare-fun res!1082065 () Bool)

(declare-fun e!884330 () Bool)

(assert (=> d!167367 (=> res!1082065 e!884330)))

(assert (=> d!167367 (= res!1082065 (and (is-Cons!36933 l!1251) (= (_1!12912 (h!38476 l!1251)) otherKey!56)))))

(assert (=> d!167367 (= (containsKey!996 l!1251 otherKey!56) e!884330)))

(declare-fun b!1584199 () Bool)

(declare-fun e!884331 () Bool)

(assert (=> b!1584199 (= e!884330 e!884331)))

(declare-fun res!1082066 () Bool)

(assert (=> b!1584199 (=> (not res!1082066) (not e!884331))))

(assert (=> b!1584199 (= res!1082066 (and (or (not (is-Cons!36933 l!1251)) (bvsle (_1!12912 (h!38476 l!1251)) otherKey!56)) (is-Cons!36933 l!1251) (bvslt (_1!12912 (h!38476 l!1251)) otherKey!56)))))

(declare-fun b!1584200 () Bool)

(assert (=> b!1584200 (= e!884331 (containsKey!996 (t!51851 l!1251) otherKey!56))))

(assert (= (and d!167367 (not res!1082065)) b!1584199))

(assert (= (and b!1584199 res!1082066) b!1584200))

(declare-fun m!1453643 () Bool)

(assert (=> b!1584200 m!1453643))

(assert (=> b!1584151 d!167367))

(declare-fun b!1584215 () Bool)

(declare-fun e!884341 () Bool)

(declare-fun tp!115077 () Bool)

(assert (=> b!1584215 (= e!884341 (and tp_is_empty!39443 tp!115077))))

(assert (=> b!1584154 (= tp!115072 e!884341)))

(assert (= (and b!1584154 (is-Cons!36933 (t!51851 l!1251))) b!1584215))

(push 1)

