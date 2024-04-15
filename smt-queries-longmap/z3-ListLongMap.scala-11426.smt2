; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133170 () Bool)

(assert start!133170)

(declare-fun b!1558046 () Bool)

(declare-fun res!1065682 () Bool)

(declare-fun e!867929 () Bool)

(assert (=> b!1558046 (=> (not res!1065682) (not e!867929))))

(declare-datatypes ((B!2432 0))(
  ( (B!2433 (val!19302 Int)) )
))
(declare-datatypes ((tuple2!25052 0))(
  ( (tuple2!25053 (_1!12537 (_ BitVec 64)) (_2!12537 B!2432)) )
))
(declare-datatypes ((List!36381 0))(
  ( (Nil!36378) (Cons!36377 (h!37824 tuple2!25052) (t!51100 List!36381)) )
))
(declare-fun l!1292 () List!36381)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!837 (List!36381 (_ BitVec 64)) Bool)

(assert (=> b!1558046 (= res!1065682 (containsKey!837 (t!51100 l!1292) otherKey!62))))

(declare-fun b!1558047 () Bool)

(declare-fun res!1065680 () Bool)

(assert (=> b!1558047 (=> (not res!1065680) (not e!867929))))

(declare-fun isStrictlySorted!975 (List!36381) Bool)

(assert (=> b!1558047 (= res!1065680 (isStrictlySorted!975 (t!51100 l!1292)))))

(declare-fun b!1558048 () Bool)

(declare-fun e!867928 () Bool)

(declare-fun tp_is_empty!38437 () Bool)

(declare-fun tp!112639 () Bool)

(assert (=> b!1558048 (= e!867928 (and tp_is_empty!38437 tp!112639))))

(declare-fun b!1558049 () Bool)

(declare-fun res!1065679 () Bool)

(assert (=> b!1558049 (=> (not res!1065679) (not e!867929))))

(assert (=> b!1558049 (= res!1065679 (containsKey!837 l!1292 otherKey!62))))

(declare-fun b!1558050 () Bool)

(declare-fun ListPrimitiveSize!184 (List!36381) Int)

(assert (=> b!1558050 (= e!867929 (>= (ListPrimitiveSize!184 (t!51100 l!1292)) (ListPrimitiveSize!184 l!1292)))))

(declare-fun res!1065681 () Bool)

(assert (=> start!133170 (=> (not res!1065681) (not e!867929))))

(assert (=> start!133170 (= res!1065681 (isStrictlySorted!975 l!1292))))

(assert (=> start!133170 e!867929))

(assert (=> start!133170 e!867928))

(assert (=> start!133170 true))

(declare-fun b!1558051 () Bool)

(declare-fun res!1065678 () Bool)

(assert (=> b!1558051 (=> (not res!1065678) (not e!867929))))

(declare-fun newKey!135 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558051 (= res!1065678 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36377) l!1292) (not (= (_1!12537 (h!37824 l!1292)) otherKey!62))))))

(assert (= (and start!133170 res!1065681) b!1558049))

(assert (= (and b!1558049 res!1065679) b!1558051))

(assert (= (and b!1558051 res!1065678) b!1558047))

(assert (= (and b!1558047 res!1065680) b!1558046))

(assert (= (and b!1558046 res!1065682) b!1558050))

(assert (= (and start!133170 ((_ is Cons!36377) l!1292)) b!1558048))

(declare-fun m!1434149 () Bool)

(assert (=> b!1558047 m!1434149))

(declare-fun m!1434151 () Bool)

(assert (=> b!1558050 m!1434151))

(declare-fun m!1434153 () Bool)

(assert (=> b!1558050 m!1434153))

(declare-fun m!1434155 () Bool)

(assert (=> b!1558046 m!1434155))

(declare-fun m!1434157 () Bool)

(assert (=> start!133170 m!1434157))

(declare-fun m!1434159 () Bool)

(assert (=> b!1558049 m!1434159))

(check-sat tp_is_empty!38437 (not b!1558047) (not b!1558049) (not b!1558048) (not start!133170) (not b!1558050) (not b!1558046))
(check-sat)
(get-model)

(declare-fun d!162387 () Bool)

(declare-fun res!1065717 () Bool)

(declare-fun e!867946 () Bool)

(assert (=> d!162387 (=> res!1065717 e!867946)))

(assert (=> d!162387 (= res!1065717 (or ((_ is Nil!36378) l!1292) ((_ is Nil!36378) (t!51100 l!1292))))))

(assert (=> d!162387 (= (isStrictlySorted!975 l!1292) e!867946)))

(declare-fun b!1558092 () Bool)

(declare-fun e!867947 () Bool)

(assert (=> b!1558092 (= e!867946 e!867947)))

(declare-fun res!1065718 () Bool)

(assert (=> b!1558092 (=> (not res!1065718) (not e!867947))))

(assert (=> b!1558092 (= res!1065718 (bvslt (_1!12537 (h!37824 l!1292)) (_1!12537 (h!37824 (t!51100 l!1292)))))))

(declare-fun b!1558093 () Bool)

(assert (=> b!1558093 (= e!867947 (isStrictlySorted!975 (t!51100 l!1292)))))

(assert (= (and d!162387 (not res!1065717)) b!1558092))

(assert (= (and b!1558092 res!1065718) b!1558093))

(assert (=> b!1558093 m!1434149))

(assert (=> start!133170 d!162387))

(declare-fun d!162389 () Bool)

(declare-fun lt!670489 () Int)

(assert (=> d!162389 (>= lt!670489 0)))

(declare-fun e!867950 () Int)

(assert (=> d!162389 (= lt!670489 e!867950)))

(declare-fun c!144006 () Bool)

(assert (=> d!162389 (= c!144006 ((_ is Nil!36378) (t!51100 l!1292)))))

(assert (=> d!162389 (= (ListPrimitiveSize!184 (t!51100 l!1292)) lt!670489)))

(declare-fun b!1558098 () Bool)

(assert (=> b!1558098 (= e!867950 0)))

(declare-fun b!1558099 () Bool)

(assert (=> b!1558099 (= e!867950 (+ 1 (ListPrimitiveSize!184 (t!51100 (t!51100 l!1292)))))))

(assert (= (and d!162389 c!144006) b!1558098))

(assert (= (and d!162389 (not c!144006)) b!1558099))

(declare-fun m!1434185 () Bool)

(assert (=> b!1558099 m!1434185))

(assert (=> b!1558050 d!162389))

(declare-fun d!162393 () Bool)

(declare-fun lt!670490 () Int)

(assert (=> d!162393 (>= lt!670490 0)))

(declare-fun e!867951 () Int)

(assert (=> d!162393 (= lt!670490 e!867951)))

(declare-fun c!144007 () Bool)

(assert (=> d!162393 (= c!144007 ((_ is Nil!36378) l!1292))))

(assert (=> d!162393 (= (ListPrimitiveSize!184 l!1292) lt!670490)))

(declare-fun b!1558100 () Bool)

(assert (=> b!1558100 (= e!867951 0)))

(declare-fun b!1558101 () Bool)

(assert (=> b!1558101 (= e!867951 (+ 1 (ListPrimitiveSize!184 (t!51100 l!1292))))))

(assert (= (and d!162393 c!144007) b!1558100))

(assert (= (and d!162393 (not c!144007)) b!1558101))

(assert (=> b!1558101 m!1434151))

(assert (=> b!1558050 d!162393))

(declare-fun d!162395 () Bool)

(declare-fun res!1065729 () Bool)

(declare-fun e!867962 () Bool)

(assert (=> d!162395 (=> res!1065729 e!867962)))

(assert (=> d!162395 (= res!1065729 (and ((_ is Cons!36377) l!1292) (= (_1!12537 (h!37824 l!1292)) otherKey!62)))))

(assert (=> d!162395 (= (containsKey!837 l!1292 otherKey!62) e!867962)))

(declare-fun b!1558112 () Bool)

(declare-fun e!867963 () Bool)

(assert (=> b!1558112 (= e!867962 e!867963)))

(declare-fun res!1065730 () Bool)

(assert (=> b!1558112 (=> (not res!1065730) (not e!867963))))

(assert (=> b!1558112 (= res!1065730 (and (or (not ((_ is Cons!36377) l!1292)) (bvsle (_1!12537 (h!37824 l!1292)) otherKey!62)) ((_ is Cons!36377) l!1292) (bvslt (_1!12537 (h!37824 l!1292)) otherKey!62)))))

(declare-fun b!1558113 () Bool)

(assert (=> b!1558113 (= e!867963 (containsKey!837 (t!51100 l!1292) otherKey!62))))

(assert (= (and d!162395 (not res!1065729)) b!1558112))

(assert (= (and b!1558112 res!1065730) b!1558113))

(assert (=> b!1558113 m!1434155))

(assert (=> b!1558049 d!162395))

(declare-fun d!162401 () Bool)

(declare-fun res!1065731 () Bool)

(declare-fun e!867964 () Bool)

(assert (=> d!162401 (=> res!1065731 e!867964)))

(assert (=> d!162401 (= res!1065731 (and ((_ is Cons!36377) (t!51100 l!1292)) (= (_1!12537 (h!37824 (t!51100 l!1292))) otherKey!62)))))

(assert (=> d!162401 (= (containsKey!837 (t!51100 l!1292) otherKey!62) e!867964)))

(declare-fun b!1558114 () Bool)

(declare-fun e!867965 () Bool)

(assert (=> b!1558114 (= e!867964 e!867965)))

(declare-fun res!1065732 () Bool)

(assert (=> b!1558114 (=> (not res!1065732) (not e!867965))))

(assert (=> b!1558114 (= res!1065732 (and (or (not ((_ is Cons!36377) (t!51100 l!1292))) (bvsle (_1!12537 (h!37824 (t!51100 l!1292))) otherKey!62)) ((_ is Cons!36377) (t!51100 l!1292)) (bvslt (_1!12537 (h!37824 (t!51100 l!1292))) otherKey!62)))))

(declare-fun b!1558115 () Bool)

(assert (=> b!1558115 (= e!867965 (containsKey!837 (t!51100 (t!51100 l!1292)) otherKey!62))))

(assert (= (and d!162401 (not res!1065731)) b!1558114))

(assert (= (and b!1558114 res!1065732) b!1558115))

(declare-fun m!1434187 () Bool)

(assert (=> b!1558115 m!1434187))

(assert (=> b!1558046 d!162401))

(declare-fun d!162403 () Bool)

(declare-fun res!1065733 () Bool)

(declare-fun e!867966 () Bool)

(assert (=> d!162403 (=> res!1065733 e!867966)))

(assert (=> d!162403 (= res!1065733 (or ((_ is Nil!36378) (t!51100 l!1292)) ((_ is Nil!36378) (t!51100 (t!51100 l!1292)))))))

(assert (=> d!162403 (= (isStrictlySorted!975 (t!51100 l!1292)) e!867966)))

(declare-fun b!1558116 () Bool)

(declare-fun e!867967 () Bool)

(assert (=> b!1558116 (= e!867966 e!867967)))

(declare-fun res!1065734 () Bool)

(assert (=> b!1558116 (=> (not res!1065734) (not e!867967))))

(assert (=> b!1558116 (= res!1065734 (bvslt (_1!12537 (h!37824 (t!51100 l!1292))) (_1!12537 (h!37824 (t!51100 (t!51100 l!1292))))))))

(declare-fun b!1558117 () Bool)

(assert (=> b!1558117 (= e!867967 (isStrictlySorted!975 (t!51100 (t!51100 l!1292))))))

(assert (= (and d!162403 (not res!1065733)) b!1558116))

(assert (= (and b!1558116 res!1065734) b!1558117))

(declare-fun m!1434189 () Bool)

(assert (=> b!1558117 m!1434189))

(assert (=> b!1558047 d!162403))

(declare-fun b!1558130 () Bool)

(declare-fun e!867978 () Bool)

(declare-fun tp!112648 () Bool)

(assert (=> b!1558130 (= e!867978 (and tp_is_empty!38437 tp!112648))))

(assert (=> b!1558048 (= tp!112639 e!867978)))

(assert (= (and b!1558048 ((_ is Cons!36377) (t!51100 l!1292))) b!1558130))

(check-sat (not b!1558115) (not b!1558093) (not b!1558113) (not b!1558130) tp_is_empty!38437 (not b!1558117) (not b!1558101) (not b!1558099))
(check-sat)
