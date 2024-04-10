; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133154 () Bool)

(assert start!133154)

(declare-fun res!1065571 () Bool)

(declare-fun e!867857 () Bool)

(assert (=> start!133154 (=> (not res!1065571) (not e!867857))))

(declare-datatypes ((B!2414 0))(
  ( (B!2415 (val!19293 Int)) )
))
(declare-datatypes ((tuple2!24962 0))(
  ( (tuple2!24963 (_1!12492 (_ BitVec 64)) (_2!12492 B!2414)) )
))
(declare-datatypes ((List!36327 0))(
  ( (Nil!36324) (Cons!36323 (h!37769 tuple2!24962) (t!51054 List!36327)) )
))
(declare-fun l!1292 () List!36327)

(declare-fun isStrictlySorted!967 (List!36327) Bool)

(assert (=> start!133154 (= res!1065571 (isStrictlySorted!967 l!1292))))

(assert (=> start!133154 e!867857))

(declare-fun e!867856 () Bool)

(assert (=> start!133154 e!867856))

(assert (=> start!133154 true))

(declare-fun tp_is_empty!38419 () Bool)

(assert (=> start!133154 tp_is_empty!38419))

(declare-fun b!1557959 () Bool)

(declare-fun res!1065570 () Bool)

(assert (=> b!1557959 (=> (not res!1065570) (not e!867857))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!830 (List!36327 (_ BitVec 64)) Bool)

(assert (=> b!1557959 (= res!1065570 (containsKey!830 l!1292 otherKey!62))))

(declare-fun newValue!135 () B!2414)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun b!1557961 () Bool)

(declare-fun insertStrictlySorted!567 (List!36327 (_ BitVec 64) B!2414) List!36327)

(assert (=> b!1557961 (= e!867857 (not (isStrictlySorted!967 (insertStrictlySorted!567 l!1292 newKey!135 newValue!135))))))

(declare-fun b!1557962 () Bool)

(declare-fun tp!112584 () Bool)

(assert (=> b!1557962 (= e!867856 (and tp_is_empty!38419 tp!112584))))

(declare-fun b!1557960 () Bool)

(declare-fun res!1065569 () Bool)

(assert (=> b!1557960 (=> (not res!1065569) (not e!867857))))

(assert (=> b!1557960 (= res!1065569 (and (not (= otherKey!62 newKey!135)) (or (not (is-Cons!36323 l!1292)) (= (_1!12492 (h!37769 l!1292)) otherKey!62))))))

(assert (= (and start!133154 res!1065571) b!1557959))

(assert (= (and b!1557959 res!1065570) b!1557960))

(assert (= (and b!1557960 res!1065569) b!1557961))

(assert (= (and start!133154 (is-Cons!36323 l!1292)) b!1557962))

(declare-fun m!1434897 () Bool)

(assert (=> start!133154 m!1434897))

(declare-fun m!1434899 () Bool)

(assert (=> b!1557959 m!1434899))

(declare-fun m!1434901 () Bool)

(assert (=> b!1557961 m!1434901))

(assert (=> b!1557961 m!1434901))

(declare-fun m!1434903 () Bool)

(assert (=> b!1557961 m!1434903))

(push 1)

(assert tp_is_empty!38419)

(assert (not b!1557959))

(assert (not start!133154))

(assert (not b!1557962))

(assert (not b!1557961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162573 () Bool)

(declare-fun res!1065606 () Bool)

(declare-fun e!867886 () Bool)

(assert (=> d!162573 (=> res!1065606 e!867886)))

(assert (=> d!162573 (= res!1065606 (and (is-Cons!36323 l!1292) (= (_1!12492 (h!37769 l!1292)) otherKey!62)))))

(assert (=> d!162573 (= (containsKey!830 l!1292 otherKey!62) e!867886)))

(declare-fun b!1558003 () Bool)

(declare-fun e!867887 () Bool)

(assert (=> b!1558003 (= e!867886 e!867887)))

(declare-fun res!1065607 () Bool)

(assert (=> b!1558003 (=> (not res!1065607) (not e!867887))))

(assert (=> b!1558003 (= res!1065607 (and (or (not (is-Cons!36323 l!1292)) (bvsle (_1!12492 (h!37769 l!1292)) otherKey!62)) (is-Cons!36323 l!1292) (bvslt (_1!12492 (h!37769 l!1292)) otherKey!62)))))

(declare-fun b!1558004 () Bool)

(assert (=> b!1558004 (= e!867887 (containsKey!830 (t!51054 l!1292) otherKey!62))))

(assert (= (and d!162573 (not res!1065606)) b!1558003))

(assert (= (and b!1558003 res!1065607) b!1558004))

(declare-fun m!1434925 () Bool)

(assert (=> b!1558004 m!1434925))

(assert (=> b!1557959 d!162573))

(declare-fun d!162579 () Bool)

(declare-fun res!1065620 () Bool)

(declare-fun e!867900 () Bool)

(assert (=> d!162579 (=> res!1065620 e!867900)))

(assert (=> d!162579 (= res!1065620 (or (is-Nil!36324 (insertStrictlySorted!567 l!1292 newKey!135 newValue!135)) (is-Nil!36324 (t!51054 (insertStrictlySorted!567 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162579 (= (isStrictlySorted!967 (insertStrictlySorted!567 l!1292 newKey!135 newValue!135)) e!867900)))

(declare-fun b!1558017 () Bool)

(declare-fun e!867901 () Bool)

(assert (=> b!1558017 (= e!867900 e!867901)))

(declare-fun res!1065621 () Bool)

(assert (=> b!1558017 (=> (not res!1065621) (not e!867901))))

(assert (=> b!1558017 (= res!1065621 (bvslt (_1!12492 (h!37769 (insertStrictlySorted!567 l!1292 newKey!135 newValue!135))) (_1!12492 (h!37769 (t!51054 (insertStrictlySorted!567 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1558018 () Bool)

(assert (=> b!1558018 (= e!867901 (isStrictlySorted!967 (t!51054 (insertStrictlySorted!567 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!162579 (not res!1065620)) b!1558017))

(assert (= (and b!1558017 res!1065621) b!1558018))

(declare-fun m!1434931 () Bool)

(assert (=> b!1558018 m!1434931))

(assert (=> b!1557961 d!162579))

(declare-fun b!1558110 () Bool)

(declare-fun e!867952 () List!36327)

(declare-fun call!71751 () List!36327)

(assert (=> b!1558110 (= e!867952 call!71751)))

(declare-fun b!1558112 () Bool)

(declare-fun e!867956 () List!36327)

(declare-fun call!71749 () List!36327)

(assert (=> b!1558112 (= e!867956 call!71749)))

(declare-fun b!1558114 () Bool)

(assert (=> b!1558114 (= e!867956 call!71749)))

(declare-fun b!1558115 () Bool)

(declare-fun e!867955 () List!36327)

(declare-fun call!71750 () List!36327)

(assert (=> b!1558115 (= e!867955 call!71750)))

(declare-fun bm!71746 () Bool)

(assert (=> bm!71746 (= call!71749 call!71751)))

(declare-fun b!1558116 () Bool)

(declare-fun e!867957 () List!36327)

(assert (=> b!1558116 (= e!867957 (insertStrictlySorted!567 (t!51054 l!1292) newKey!135 newValue!135))))

(declare-fun d!162585 () Bool)

(declare-fun e!867954 () Bool)

(assert (=> d!162585 e!867954))

(declare-fun res!1065647 () Bool)

(assert (=> d!162585 (=> (not res!1065647) (not e!867954))))

(declare-fun lt!670763 () List!36327)

(assert (=> d!162585 (= res!1065647 (isStrictlySorted!967 lt!670763))))

(assert (=> d!162585 (= lt!670763 e!867955)))

(declare-fun c!144083 () Bool)

(assert (=> d!162585 (= c!144083 (and (is-Cons!36323 l!1292) (bvslt (_1!12492 (h!37769 l!1292)) newKey!135)))))

(assert (=> d!162585 (isStrictlySorted!967 l!1292)))

(assert (=> d!162585 (= (insertStrictlySorted!567 l!1292 newKey!135 newValue!135) lt!670763)))

(declare-fun bm!71747 () Bool)

(declare-fun $colon$colon!979 (List!36327 tuple2!24962) List!36327)

(assert (=> bm!71747 (= call!71750 ($colon$colon!979 e!867957 (ite c!144083 (h!37769 l!1292) (tuple2!24963 newKey!135 newValue!135))))))

(declare-fun c!144079 () Bool)

(assert (=> bm!71747 (= c!144079 c!144083)))

(declare-fun b!1558117 () Bool)

(declare-fun res!1065645 () Bool)

(assert (=> b!1558117 (=> (not res!1065645) (not e!867954))))

(assert (=> b!1558117 (= res!1065645 (containsKey!830 lt!670763 newKey!135))))

(declare-fun c!144081 () Bool)

(declare-fun c!144082 () Bool)

(declare-fun b!1558118 () Bool)

(assert (=> b!1558118 (= e!867957 (ite c!144082 (t!51054 l!1292) (ite c!144081 (Cons!36323 (h!37769 l!1292) (t!51054 l!1292)) Nil!36324)))))

(declare-fun bm!71748 () Bool)

(assert (=> bm!71748 (= call!71751 call!71750)))

(declare-fun b!1558119 () Bool)

(assert (=> b!1558119 (= e!867955 e!867952)))

(assert (=> b!1558119 (= c!144082 (and (is-Cons!36323 l!1292) (= (_1!12492 (h!37769 l!1292)) newKey!135)))))

(declare-fun b!1558120 () Bool)

(declare-fun contains!10210 (List!36327 tuple2!24962) Bool)

(assert (=> b!1558120 (= e!867954 (contains!10210 lt!670763 (tuple2!24963 newKey!135 newValue!135)))))

(declare-fun b!1558121 () Bool)

(assert (=> b!1558121 (= c!144081 (and (is-Cons!36323 l!1292) (bvsgt (_1!12492 (h!37769 l!1292)) newKey!135)))))

(assert (=> b!1558121 (= e!867952 e!867956)))

(assert (= (and d!162585 c!144083) b!1558115))

(assert (= (and d!162585 (not c!144083)) b!1558119))

(assert (= (and b!1558119 c!144082) b!1558110))

(assert (= (and b!1558119 (not c!144082)) b!1558121))

(assert (= (and b!1558121 c!144081) b!1558114))

(assert (= (and b!1558121 (not c!144081)) b!1558112))

(assert (= (or b!1558114 b!1558112) bm!71746))

(assert (= (or b!1558110 bm!71746) bm!71748))

(assert (= (or b!1558115 bm!71748) bm!71747))

(assert (= (and bm!71747 c!144079) b!1558116))

(assert (= (and bm!71747 (not c!144079)) b!1558118))

(assert (= (and d!162585 res!1065647) b!1558117))

(assert (= (and b!1558117 res!1065645) b!1558120))

(declare-fun m!1434949 () Bool)

(assert (=> d!162585 m!1434949))

(assert (=> d!162585 m!1434897))

(declare-fun m!1434953 () Bool)

(assert (=> b!1558120 m!1434953))

(declare-fun m!1434957 () Bool)

(assert (=> bm!71747 m!1434957))

(declare-fun m!1434961 () Bool)

(assert (=> b!1558116 m!1434961))

(declare-fun m!1434965 () Bool)

(assert (=> b!1558117 m!1434965))

(assert (=> b!1557961 d!162585))

(declare-fun d!162591 () Bool)

(declare-fun res!1065648 () Bool)

(declare-fun e!867958 () Bool)

(assert (=> d!162591 (=> res!1065648 e!867958)))

(assert (=> d!162591 (= res!1065648 (or (is-Nil!36324 l!1292) (is-Nil!36324 (t!51054 l!1292))))))

(assert (=> d!162591 (= (isStrictlySorted!967 l!1292) e!867958)))

(declare-fun b!1558122 () Bool)

(declare-fun e!867959 () Bool)

(assert (=> b!1558122 (= e!867958 e!867959)))

(declare-fun res!1065649 () Bool)

(assert (=> b!1558122 (=> (not res!1065649) (not e!867959))))

(assert (=> b!1558122 (= res!1065649 (bvslt (_1!12492 (h!37769 l!1292)) (_1!12492 (h!37769 (t!51054 l!1292)))))))

(declare-fun b!1558124 () Bool)

(assert (=> b!1558124 (= e!867959 (isStrictlySorted!967 (t!51054 l!1292)))))

(assert (= (and d!162591 (not res!1065648)) b!1558122))

(assert (= (and b!1558122 res!1065649) b!1558124))

(declare-fun m!1434967 () Bool)

(assert (=> b!1558124 m!1434967))

(assert (=> start!133154 d!162591))

(declare-fun b!1558133 () Bool)

(declare-fun e!867965 () Bool)

(declare-fun tp!112599 () Bool)

(assert (=> b!1558133 (= e!867965 (and tp_is_empty!38419 tp!112599))))

(assert (=> b!1557962 (= tp!112584 e!867965)))

(assert (= (and b!1557962 (is-Cons!36323 (t!51054 l!1292))) b!1558133))

(push 1)

