; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133158 () Bool)

(assert start!133158)

(declare-datatypes ((B!2418 0))(
  ( (B!2419 (val!19295 Int)) )
))
(declare-fun newValue!135 () B!2418)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun b!1557985 () Bool)

(declare-fun e!867868 () Bool)

(declare-datatypes ((tuple2!24966 0))(
  ( (tuple2!24967 (_1!12494 (_ BitVec 64)) (_2!12494 B!2418)) )
))
(declare-datatypes ((List!36329 0))(
  ( (Nil!36326) (Cons!36325 (h!37771 tuple2!24966) (t!51056 List!36329)) )
))
(declare-fun l!1292 () List!36329)

(declare-fun isStrictlySorted!969 (List!36329) Bool)

(declare-fun insertStrictlySorted!569 (List!36329 (_ BitVec 64) B!2418) List!36329)

(assert (=> b!1557985 (= e!867868 (not (isStrictlySorted!969 (insertStrictlySorted!569 l!1292 newKey!135 newValue!135))))))

(declare-fun b!1557986 () Bool)

(declare-fun e!867869 () Bool)

(declare-fun tp_is_empty!38423 () Bool)

(declare-fun tp!112590 () Bool)

(assert (=> b!1557986 (= e!867869 (and tp_is_empty!38423 tp!112590))))

(declare-fun b!1557984 () Bool)

(declare-fun res!1065588 () Bool)

(assert (=> b!1557984 (=> (not res!1065588) (not e!867868))))

(declare-fun otherKey!62 () (_ BitVec 64))

(assert (=> b!1557984 (= res!1065588 (and (not (= otherKey!62 newKey!135)) (or (not (is-Cons!36325 l!1292)) (= (_1!12494 (h!37771 l!1292)) otherKey!62))))))

(declare-fun res!1065589 () Bool)

(assert (=> start!133158 (=> (not res!1065589) (not e!867868))))

(assert (=> start!133158 (= res!1065589 (isStrictlySorted!969 l!1292))))

(assert (=> start!133158 e!867868))

(assert (=> start!133158 e!867869))

(assert (=> start!133158 true))

(assert (=> start!133158 tp_is_empty!38423))

(declare-fun b!1557983 () Bool)

(declare-fun res!1065587 () Bool)

(assert (=> b!1557983 (=> (not res!1065587) (not e!867868))))

(declare-fun containsKey!832 (List!36329 (_ BitVec 64)) Bool)

(assert (=> b!1557983 (= res!1065587 (containsKey!832 l!1292 otherKey!62))))

(assert (= (and start!133158 res!1065589) b!1557983))

(assert (= (and b!1557983 res!1065587) b!1557984))

(assert (= (and b!1557984 res!1065588) b!1557985))

(assert (= (and start!133158 (is-Cons!36325 l!1292)) b!1557986))

(declare-fun m!1434913 () Bool)

(assert (=> b!1557985 m!1434913))

(assert (=> b!1557985 m!1434913))

(declare-fun m!1434915 () Bool)

(assert (=> b!1557985 m!1434915))

(declare-fun m!1434917 () Bool)

(assert (=> start!133158 m!1434917))

(declare-fun m!1434919 () Bool)

(assert (=> b!1557983 m!1434919))

(push 1)

(assert tp_is_empty!38423)

(assert (not b!1557983))

(assert (not start!133158))

(assert (not b!1557986))

(assert (not b!1557985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162571 () Bool)

(declare-fun res!1065604 () Bool)

(declare-fun e!867884 () Bool)

(assert (=> d!162571 (=> res!1065604 e!867884)))

(assert (=> d!162571 (= res!1065604 (or (is-Nil!36326 l!1292) (is-Nil!36326 (t!51056 l!1292))))))

(assert (=> d!162571 (= (isStrictlySorted!969 l!1292) e!867884)))

(declare-fun b!1558001 () Bool)

(declare-fun e!867885 () Bool)

(assert (=> b!1558001 (= e!867884 e!867885)))

(declare-fun res!1065605 () Bool)

(assert (=> b!1558001 (=> (not res!1065605) (not e!867885))))

(assert (=> b!1558001 (= res!1065605 (bvslt (_1!12494 (h!37771 l!1292)) (_1!12494 (h!37771 (t!51056 l!1292)))))))

(declare-fun b!1558002 () Bool)

(assert (=> b!1558002 (= e!867885 (isStrictlySorted!969 (t!51056 l!1292)))))

(assert (= (and d!162571 (not res!1065604)) b!1558001))

(assert (= (and b!1558001 res!1065605) b!1558002))

(declare-fun m!1434923 () Bool)

(assert (=> b!1558002 m!1434923))

(assert (=> start!133158 d!162571))

(declare-fun d!162577 () Bool)

(declare-fun res!1065616 () Bool)

(declare-fun e!867896 () Bool)

(assert (=> d!162577 (=> res!1065616 e!867896)))

(assert (=> d!162577 (= res!1065616 (and (is-Cons!36325 l!1292) (= (_1!12494 (h!37771 l!1292)) otherKey!62)))))

(assert (=> d!162577 (= (containsKey!832 l!1292 otherKey!62) e!867896)))

(declare-fun b!1558013 () Bool)

(declare-fun e!867897 () Bool)

(assert (=> b!1558013 (= e!867896 e!867897)))

(declare-fun res!1065617 () Bool)

(assert (=> b!1558013 (=> (not res!1065617) (not e!867897))))

(assert (=> b!1558013 (= res!1065617 (and (or (not (is-Cons!36325 l!1292)) (bvsle (_1!12494 (h!37771 l!1292)) otherKey!62)) (is-Cons!36325 l!1292) (bvslt (_1!12494 (h!37771 l!1292)) otherKey!62)))))

(declare-fun b!1558014 () Bool)

(assert (=> b!1558014 (= e!867897 (containsKey!832 (t!51056 l!1292) otherKey!62))))

(assert (= (and d!162577 (not res!1065616)) b!1558013))

(assert (= (and b!1558013 res!1065617) b!1558014))

(declare-fun m!1434927 () Bool)

(assert (=> b!1558014 m!1434927))

(assert (=> b!1557983 d!162577))

(declare-fun d!162581 () Bool)

(declare-fun res!1065618 () Bool)

(declare-fun e!867898 () Bool)

(assert (=> d!162581 (=> res!1065618 e!867898)))

(assert (=> d!162581 (= res!1065618 (or (is-Nil!36326 (insertStrictlySorted!569 l!1292 newKey!135 newValue!135)) (is-Nil!36326 (t!51056 (insertStrictlySorted!569 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162581 (= (isStrictlySorted!969 (insertStrictlySorted!569 l!1292 newKey!135 newValue!135)) e!867898)))

(declare-fun b!1558015 () Bool)

(declare-fun e!867899 () Bool)

(assert (=> b!1558015 (= e!867898 e!867899)))

(declare-fun res!1065619 () Bool)

(assert (=> b!1558015 (=> (not res!1065619) (not e!867899))))

(assert (=> b!1558015 (= res!1065619 (bvslt (_1!12494 (h!37771 (insertStrictlySorted!569 l!1292 newKey!135 newValue!135))) (_1!12494 (h!37771 (t!51056 (insertStrictlySorted!569 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1558016 () Bool)

(assert (=> b!1558016 (= e!867899 (isStrictlySorted!969 (t!51056 (insertStrictlySorted!569 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!162581 (not res!1065618)) b!1558015))

(assert (= (and b!1558015 res!1065619) b!1558016))

(declare-fun m!1434929 () Bool)

(assert (=> b!1558016 m!1434929))

(assert (=> b!1557985 d!162581))

(declare-fun bm!71743 () Bool)

(declare-fun call!71746 () List!36329)

(declare-fun call!71748 () List!36329)

(assert (=> bm!71743 (= call!71746 call!71748)))

(declare-fun e!867953 () Bool)

(declare-fun lt!670762 () List!36329)

(declare-fun b!1558102 () Bool)

(declare-fun contains!10211 (List!36329 tuple2!24966) Bool)

(assert (=> b!1558102 (= e!867953 (contains!10211 lt!670762 (tuple2!24967 newKey!135 newValue!135)))))

(declare-fun b!1558103 () Bool)

(declare-fun e!867949 () List!36329)

(declare-fun call!71747 () List!36329)

(assert (=> b!1558103 (= e!867949 call!71747)))

(declare-fun e!867951 () List!36329)

(declare-fun b!1558104 () Bool)

(assert (=> b!1558104 (= e!867951 (insertStrictlySorted!569 (t!51056 l!1292) newKey!135 newValue!135))))

(declare-fun d!162583 () Bool)

(assert (=> d!162583 e!867953))

(declare-fun res!1065646 () Bool)

(assert (=> d!162583 (=> (not res!1065646) (not e!867953))))

(assert (=> d!162583 (= res!1065646 (isStrictlySorted!969 lt!670762))))

(declare-fun e!867950 () List!36329)

(assert (=> d!162583 (= lt!670762 e!867950)))

(declare-fun c!144077 () Bool)

(assert (=> d!162583 (= c!144077 (and (is-Cons!36325 l!1292) (bvslt (_1!12494 (h!37771 l!1292)) newKey!135)))))

(assert (=> d!162583 (isStrictlySorted!969 l!1292)))

(assert (=> d!162583 (= (insertStrictlySorted!569 l!1292 newKey!135 newValue!135) lt!670762)))

(declare-fun bm!71744 () Bool)

(declare-fun $colon$colon!980 (List!36329 tuple2!24966) List!36329)

(assert (=> bm!71744 (= call!71748 ($colon$colon!980 e!867951 (ite c!144077 (h!37771 l!1292) (tuple2!24967 newKey!135 newValue!135))))))

(declare-fun c!144078 () Bool)

(assert (=> bm!71744 (= c!144078 c!144077)))

(declare-fun b!1558105 () Bool)

(assert (=> b!1558105 (= e!867949 call!71747)))

(declare-fun b!1558106 () Bool)

(declare-fun res!1065644 () Bool)

(assert (=> b!1558106 (=> (not res!1065644) (not e!867953))))

(assert (=> b!1558106 (= res!1065644 (containsKey!832 lt!670762 newKey!135))))

(declare-fun bm!71745 () Bool)

(assert (=> bm!71745 (= call!71747 call!71746)))

(declare-fun b!1558107 () Bool)

(declare-fun c!144076 () Bool)

(declare-fun c!144080 () Bool)

(assert (=> b!1558107 (= e!867951 (ite c!144080 (t!51056 l!1292) (ite c!144076 (Cons!36325 (h!37771 l!1292) (t!51056 l!1292)) Nil!36326)))))

(declare-fun b!1558108 () Bool)

(assert (=> b!1558108 (= e!867950 call!71748)))

(declare-fun b!1558109 () Bool)

(declare-fun e!867948 () List!36329)

(assert (=> b!1558109 (= e!867950 e!867948)))

(assert (=> b!1558109 (= c!144080 (and (is-Cons!36325 l!1292) (= (_1!12494 (h!37771 l!1292)) newKey!135)))))

(declare-fun b!1558111 () Bool)

(assert (=> b!1558111 (= c!144076 (and (is-Cons!36325 l!1292) (bvsgt (_1!12494 (h!37771 l!1292)) newKey!135)))))

(assert (=> b!1558111 (= e!867948 e!867949)))

