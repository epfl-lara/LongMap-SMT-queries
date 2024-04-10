; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138012 () Bool)

(assert start!138012)

(declare-fun b!1584139 () Bool)

(declare-fun res!1082027 () Bool)

(declare-fun e!884287 () Bool)

(assert (=> b!1584139 (=> (not res!1082027) (not e!884287))))

(declare-datatypes ((B!2908 0))(
  ( (B!2909 (val!19816 Int)) )
))
(declare-datatypes ((tuple2!25800 0))(
  ( (tuple2!25801 (_1!12911 (_ BitVec 64)) (_2!12911 B!2908)) )
))
(declare-datatypes ((List!36936 0))(
  ( (Nil!36933) (Cons!36932 (h!38475 tuple2!25800) (t!51850 List!36936)) )
))
(declare-fun l!1251 () List!36936)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!995 (List!36936 (_ BitVec 64)) Bool)

(assert (=> b!1584139 (= res!1082027 (not (containsKey!995 l!1251 otherKey!56)))))

(declare-fun b!1584141 () Bool)

(declare-fun ListPrimitiveSize!218 (List!36936) Int)

(assert (=> b!1584141 (= e!884287 (< (ListPrimitiveSize!218 l!1251) 0))))

(declare-fun b!1584140 () Bool)

(declare-fun res!1082026 () Bool)

(assert (=> b!1584140 (=> (not res!1082026) (not e!884287))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1584140 (= res!1082026 (not (= otherKey!56 newKey!123)))))

(declare-fun b!1584142 () Bool)

(declare-fun e!884286 () Bool)

(declare-fun tp_is_empty!39441 () Bool)

(declare-fun tp!115069 () Bool)

(assert (=> b!1584142 (= e!884286 (and tp_is_empty!39441 tp!115069))))

(declare-fun res!1082025 () Bool)

(assert (=> start!138012 (=> (not res!1082025) (not e!884287))))

(declare-fun isStrictlySorted!1161 (List!36936) Bool)

(assert (=> start!138012 (= res!1082025 (isStrictlySorted!1161 l!1251))))

(assert (=> start!138012 e!884287))

(assert (=> start!138012 e!884286))

(assert (=> start!138012 true))

(assert (= (and start!138012 res!1082025) b!1584139))

(assert (= (and b!1584139 res!1082027) b!1584140))

(assert (= (and b!1584140 res!1082026) b!1584141))

(get-info :version)

(assert (= (and start!138012 ((_ is Cons!36932) l!1251)) b!1584142))

(declare-fun m!1453619 () Bool)

(assert (=> b!1584139 m!1453619))

(declare-fun m!1453621 () Bool)

(assert (=> b!1584141 m!1453621))

(declare-fun m!1453623 () Bool)

(assert (=> start!138012 m!1453623))

(check-sat tp_is_empty!39441 (not b!1584141) (not b!1584139) (not start!138012) (not b!1584142))
(check-sat)
(get-model)

(declare-fun d!167357 () Bool)

(declare-fun res!1082047 () Bool)

(declare-fun e!884304 () Bool)

(assert (=> d!167357 (=> res!1082047 e!884304)))

(assert (=> d!167357 (= res!1082047 (or ((_ is Nil!36933) l!1251) ((_ is Nil!36933) (t!51850 l!1251))))))

(assert (=> d!167357 (= (isStrictlySorted!1161 l!1251) e!884304)))

(declare-fun b!1584165 () Bool)

(declare-fun e!884305 () Bool)

(assert (=> b!1584165 (= e!884304 e!884305)))

(declare-fun res!1082048 () Bool)

(assert (=> b!1584165 (=> (not res!1082048) (not e!884305))))

(assert (=> b!1584165 (= res!1082048 (bvslt (_1!12911 (h!38475 l!1251)) (_1!12911 (h!38475 (t!51850 l!1251)))))))

(declare-fun b!1584166 () Bool)

(assert (=> b!1584166 (= e!884305 (isStrictlySorted!1161 (t!51850 l!1251)))))

(assert (= (and d!167357 (not res!1082047)) b!1584165))

(assert (= (and b!1584165 res!1082048) b!1584166))

(declare-fun m!1453633 () Bool)

(assert (=> b!1584166 m!1453633))

(assert (=> start!138012 d!167357))

(declare-fun d!167363 () Bool)

(declare-fun res!1082059 () Bool)

(declare-fun e!884319 () Bool)

(assert (=> d!167363 (=> res!1082059 e!884319)))

(assert (=> d!167363 (= res!1082059 (and ((_ is Cons!36932) l!1251) (= (_1!12911 (h!38475 l!1251)) otherKey!56)))))

(assert (=> d!167363 (= (containsKey!995 l!1251 otherKey!56) e!884319)))

(declare-fun b!1584183 () Bool)

(declare-fun e!884320 () Bool)

(assert (=> b!1584183 (= e!884319 e!884320)))

(declare-fun res!1082060 () Bool)

(assert (=> b!1584183 (=> (not res!1082060) (not e!884320))))

(assert (=> b!1584183 (= res!1082060 (and (or (not ((_ is Cons!36932) l!1251)) (bvsle (_1!12911 (h!38475 l!1251)) otherKey!56)) ((_ is Cons!36932) l!1251) (bvslt (_1!12911 (h!38475 l!1251)) otherKey!56)))))

(declare-fun b!1584184 () Bool)

(assert (=> b!1584184 (= e!884320 (containsKey!995 (t!51850 l!1251) otherKey!56))))

(assert (= (and d!167363 (not res!1082059)) b!1584183))

(assert (= (and b!1584183 res!1082060) b!1584184))

(declare-fun m!1453639 () Bool)

(assert (=> b!1584184 m!1453639))

(assert (=> b!1584139 d!167363))

(declare-fun d!167369 () Bool)

(declare-fun lt!677244 () Int)

(assert (=> d!167369 (>= lt!677244 0)))

(declare-fun e!884332 () Int)

(assert (=> d!167369 (= lt!677244 e!884332)))

(declare-fun c!146843 () Bool)

(assert (=> d!167369 (= c!146843 ((_ is Nil!36933) l!1251))))

(assert (=> d!167369 (= (ListPrimitiveSize!218 l!1251) lt!677244)))

(declare-fun b!1584201 () Bool)

(assert (=> b!1584201 (= e!884332 0)))

(declare-fun b!1584202 () Bool)

(assert (=> b!1584202 (= e!884332 (+ 1 (ListPrimitiveSize!218 (t!51850 l!1251))))))

(assert (= (and d!167369 c!146843) b!1584201))

(assert (= (and d!167369 (not c!146843)) b!1584202))

(declare-fun m!1453645 () Bool)

(assert (=> b!1584202 m!1453645))

(assert (=> b!1584141 d!167369))

(declare-fun b!1584216 () Bool)

(declare-fun e!884342 () Bool)

(declare-fun tp!115078 () Bool)

(assert (=> b!1584216 (= e!884342 (and tp_is_empty!39441 tp!115078))))

(assert (=> b!1584142 (= tp!115069 e!884342)))

(assert (= (and b!1584142 ((_ is Cons!36932) (t!51850 l!1251))) b!1584216))

(check-sat tp_is_empty!39441 (not b!1584216) (not b!1584184) (not b!1584202) (not b!1584166))
(check-sat)
