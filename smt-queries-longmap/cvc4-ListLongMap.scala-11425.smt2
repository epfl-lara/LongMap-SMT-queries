; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133206 () Bool)

(assert start!133206)

(declare-fun b!1558279 () Bool)

(declare-fun e!868063 () Bool)

(declare-datatypes ((B!2430 0))(
  ( (B!2431 (val!19301 Int)) )
))
(declare-datatypes ((tuple2!24978 0))(
  ( (tuple2!24979 (_1!12500 (_ BitVec 64)) (_2!12500 B!2430)) )
))
(declare-datatypes ((List!36335 0))(
  ( (Nil!36332) (Cons!36331 (h!37777 tuple2!24978) (t!51062 List!36335)) )
))
(declare-fun l!1292 () List!36335)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!838 (List!36335 (_ BitVec 64)) Bool)

(assert (=> b!1558279 (= e!868063 (not (containsKey!838 (t!51062 l!1292) otherKey!62)))))

(declare-fun b!1558280 () Bool)

(declare-fun res!1065745 () Bool)

(declare-fun e!868064 () Bool)

(assert (=> b!1558280 (=> (not res!1065745) (not e!868064))))

(assert (=> b!1558280 (= res!1065745 (containsKey!838 l!1292 otherKey!62))))

(declare-fun b!1558281 () Bool)

(assert (=> b!1558281 (= e!868064 e!868063)))

(declare-fun res!1065748 () Bool)

(assert (=> b!1558281 (=> res!1065748 e!868063)))

(declare-fun isStrictlySorted!975 (List!36335) Bool)

(assert (=> b!1558281 (= res!1065748 (not (isStrictlySorted!975 (t!51062 l!1292))))))

(declare-fun res!1065746 () Bool)

(assert (=> start!133206 (=> (not res!1065746) (not e!868064))))

(assert (=> start!133206 (= res!1065746 (isStrictlySorted!975 l!1292))))

(assert (=> start!133206 e!868064))

(declare-fun e!868062 () Bool)

(assert (=> start!133206 e!868062))

(assert (=> start!133206 true))

(declare-fun b!1558282 () Bool)

(declare-fun res!1065747 () Bool)

(assert (=> b!1558282 (=> (not res!1065747) (not e!868064))))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558282 (= res!1065747 (and (not (= otherKey!62 newKey!135)) (is-Cons!36331 l!1292) (not (= (_1!12500 (h!37777 l!1292)) otherKey!62))))))

(declare-fun b!1558283 () Bool)

(declare-fun tp_is_empty!38435 () Bool)

(declare-fun tp!112626 () Bool)

(assert (=> b!1558283 (= e!868062 (and tp_is_empty!38435 tp!112626))))

(assert (= (and start!133206 res!1065746) b!1558280))

(assert (= (and b!1558280 res!1065745) b!1558282))

(assert (= (and b!1558282 res!1065747) b!1558281))

(assert (= (and b!1558281 (not res!1065748)) b!1558279))

(assert (= (and start!133206 (is-Cons!36331 l!1292)) b!1558283))

(declare-fun m!1435021 () Bool)

(assert (=> b!1558279 m!1435021))

(declare-fun m!1435023 () Bool)

(assert (=> b!1558280 m!1435023))

(declare-fun m!1435025 () Bool)

(assert (=> b!1558281 m!1435025))

(declare-fun m!1435027 () Bool)

(assert (=> start!133206 m!1435027))

(push 1)

(assert (not b!1558281))

(assert tp_is_empty!38435)

(assert (not b!1558283))

(assert (not b!1558279))

(assert (not b!1558280))

(assert (not start!133206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162619 () Bool)

(declare-fun res!1065773 () Bool)

(declare-fun e!868089 () Bool)

(assert (=> d!162619 (=> res!1065773 e!868089)))

(assert (=> d!162619 (= res!1065773 (and (is-Cons!36331 l!1292) (= (_1!12500 (h!37777 l!1292)) otherKey!62)))))

(assert (=> d!162619 (= (containsKey!838 l!1292 otherKey!62) e!868089)))

(declare-fun b!1558308 () Bool)

(declare-fun e!868090 () Bool)

(assert (=> b!1558308 (= e!868089 e!868090)))

(declare-fun res!1065774 () Bool)

(assert (=> b!1558308 (=> (not res!1065774) (not e!868090))))

(assert (=> b!1558308 (= res!1065774 (and (or (not (is-Cons!36331 l!1292)) (bvsle (_1!12500 (h!37777 l!1292)) otherKey!62)) (is-Cons!36331 l!1292) (bvslt (_1!12500 (h!37777 l!1292)) otherKey!62)))))

(declare-fun b!1558309 () Bool)

(assert (=> b!1558309 (= e!868090 (containsKey!838 (t!51062 l!1292) otherKey!62))))

(assert (= (and d!162619 (not res!1065773)) b!1558308))

(assert (= (and b!1558308 res!1065774) b!1558309))

(assert (=> b!1558309 m!1435021))

(assert (=> b!1558280 d!162619))

(declare-fun d!162627 () Bool)

(declare-fun res!1065783 () Bool)

(declare-fun e!868102 () Bool)

(assert (=> d!162627 (=> res!1065783 e!868102)))

(assert (=> d!162627 (= res!1065783 (or (is-Nil!36332 (t!51062 l!1292)) (is-Nil!36332 (t!51062 (t!51062 l!1292)))))))

(assert (=> d!162627 (= (isStrictlySorted!975 (t!51062 l!1292)) e!868102)))

(declare-fun b!1558323 () Bool)

(declare-fun e!868103 () Bool)

(assert (=> b!1558323 (= e!868102 e!868103)))

(declare-fun res!1065784 () Bool)

(assert (=> b!1558323 (=> (not res!1065784) (not e!868103))))

(assert (=> b!1558323 (= res!1065784 (bvslt (_1!12500 (h!37777 (t!51062 l!1292))) (_1!12500 (h!37777 (t!51062 (t!51062 l!1292))))))))

(declare-fun b!1558324 () Bool)

(assert (=> b!1558324 (= e!868103 (isStrictlySorted!975 (t!51062 (t!51062 l!1292))))))

(assert (= (and d!162627 (not res!1065783)) b!1558323))

(assert (= (and b!1558323 res!1065784) b!1558324))

(declare-fun m!1435035 () Bool)

(assert (=> b!1558324 m!1435035))

(assert (=> b!1558281 d!162627))

(declare-fun d!162633 () Bool)

(declare-fun res!1065787 () Bool)

(declare-fun e!868106 () Bool)

(assert (=> d!162633 (=> res!1065787 e!868106)))

(assert (=> d!162633 (= res!1065787 (and (is-Cons!36331 (t!51062 l!1292)) (= (_1!12500 (h!37777 (t!51062 l!1292))) otherKey!62)))))

(assert (=> d!162633 (= (containsKey!838 (t!51062 l!1292) otherKey!62) e!868106)))

(declare-fun b!1558327 () Bool)

(declare-fun e!868107 () Bool)

(assert (=> b!1558327 (= e!868106 e!868107)))

(declare-fun res!1065788 () Bool)

(assert (=> b!1558327 (=> (not res!1065788) (not e!868107))))

(assert (=> b!1558327 (= res!1065788 (and (or (not (is-Cons!36331 (t!51062 l!1292))) (bvsle (_1!12500 (h!37777 (t!51062 l!1292))) otherKey!62)) (is-Cons!36331 (t!51062 l!1292)) (bvslt (_1!12500 (h!37777 (t!51062 l!1292))) otherKey!62)))))

