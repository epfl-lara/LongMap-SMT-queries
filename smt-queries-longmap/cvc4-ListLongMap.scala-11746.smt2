; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137746 () Bool)

(assert start!137746)

(declare-fun res!1081229 () Bool)

(declare-fun e!883351 () Bool)

(assert (=> start!137746 (=> (not res!1081229) (not e!883351))))

(declare-datatypes ((B!2820 0))(
  ( (B!2821 (val!19772 Int)) )
))
(declare-datatypes ((tuple2!25712 0))(
  ( (tuple2!25713 (_1!12867 (_ BitVec 64)) (_2!12867 B!2820)) )
))
(declare-datatypes ((List!36892 0))(
  ( (Nil!36889) (Cons!36888 (h!38431 tuple2!25712) (t!51806 List!36892)) )
))
(declare-fun l!1065 () List!36892)

(declare-fun isStrictlySorted!1126 (List!36892) Bool)

(assert (=> start!137746 (= res!1081229 (isStrictlySorted!1126 l!1065))))

(assert (=> start!137746 e!883351))

(declare-fun e!883352 () Bool)

(assert (=> start!137746 e!883352))

(assert (=> start!137746 true))

(declare-fun b!1582715 () Bool)

(declare-fun res!1081230 () Bool)

(assert (=> b!1582715 (=> (not res!1081230) (not e!883351))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!972 (List!36892 (_ BitVec 64)) Bool)

(assert (=> b!1582715 (= res!1081230 (containsKey!972 l!1065 key!287))))

(declare-fun b!1582716 () Bool)

(declare-fun ListPrimitiveSize!207 (List!36892) Int)

(assert (=> b!1582716 (= e!883351 (< (ListPrimitiveSize!207 l!1065) 0))))

(declare-fun b!1582717 () Bool)

(declare-fun tp_is_empty!39353 () Bool)

(declare-fun tp!114845 () Bool)

(assert (=> b!1582717 (= e!883352 (and tp_is_empty!39353 tp!114845))))

(assert (= (and start!137746 res!1081229) b!1582715))

(assert (= (and b!1582715 res!1081230) b!1582716))

(assert (= (and start!137746 (is-Cons!36888 l!1065)) b!1582717))

(declare-fun m!1453019 () Bool)

(assert (=> start!137746 m!1453019))

(declare-fun m!1453021 () Bool)

(assert (=> b!1582715 m!1453021))

(declare-fun m!1453023 () Bool)

(assert (=> b!1582716 m!1453023))

(push 1)

(assert (not start!137746))

(assert (not b!1582717))

(assert (not b!1582716))

(assert (not b!1582715))

(assert tp_is_empty!39353)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167035 () Bool)

(declare-fun lt!677130 () Int)

(assert (=> d!167035 (>= lt!677130 0)))

(declare-fun e!883365 () Int)

(assert (=> d!167035 (= lt!677130 e!883365)))

(declare-fun c!146665 () Bool)

(assert (=> d!167035 (= c!146665 (is-Nil!36889 l!1065))))

(assert (=> d!167035 (= (ListPrimitiveSize!207 l!1065) lt!677130)))

(declare-fun b!1582732 () Bool)

(assert (=> b!1582732 (= e!883365 0)))

(declare-fun b!1582733 () Bool)

(assert (=> b!1582733 (= e!883365 (+ 1 (ListPrimitiveSize!207 (t!51806 l!1065))))))

(assert (= (and d!167035 c!146665) b!1582732))

(assert (= (and d!167035 (not c!146665)) b!1582733))

(declare-fun m!1453027 () Bool)

(assert (=> b!1582733 m!1453027))

(assert (=> b!1582716 d!167035))

(declare-fun d!167041 () Bool)

(declare-fun res!1081251 () Bool)

(declare-fun e!883379 () Bool)

(assert (=> d!167041 (=> res!1081251 e!883379)))

(assert (=> d!167041 (= res!1081251 (or (is-Nil!36889 l!1065) (is-Nil!36889 (t!51806 l!1065))))))

(assert (=> d!167041 (= (isStrictlySorted!1126 l!1065) e!883379)))

(declare-fun b!1582750 () Bool)

(declare-fun e!883380 () Bool)

(assert (=> b!1582750 (= e!883379 e!883380)))

(declare-fun res!1081252 () Bool)

(assert (=> b!1582750 (=> (not res!1081252) (not e!883380))))

(assert (=> b!1582750 (= res!1081252 (bvslt (_1!12867 (h!38431 l!1065)) (_1!12867 (h!38431 (t!51806 l!1065)))))))

(declare-fun b!1582751 () Bool)

(assert (=> b!1582751 (= e!883380 (isStrictlySorted!1126 (t!51806 l!1065)))))

(assert (= (and d!167041 (not res!1081251)) b!1582750))

(assert (= (and b!1582750 res!1081252) b!1582751))

(declare-fun m!1453033 () Bool)

(assert (=> b!1582751 m!1453033))

(assert (=> start!137746 d!167041))

(declare-fun d!167047 () Bool)

(declare-fun res!1081265 () Bool)

(declare-fun e!883396 () Bool)

(assert (=> d!167047 (=> res!1081265 e!883396)))

(assert (=> d!167047 (= res!1081265 (and (is-Cons!36888 l!1065) (= (_1!12867 (h!38431 l!1065)) key!287)))))

(assert (=> d!167047 (= (containsKey!972 l!1065 key!287) e!883396)))

(declare-fun b!1582772 () Bool)

(declare-fun e!883398 () Bool)

(assert (=> b!1582772 (= e!883396 e!883398)))

(declare-fun res!1081266 () Bool)

(assert (=> b!1582772 (=> (not res!1081266) (not e!883398))))

(assert (=> b!1582772 (= res!1081266 (and (or (not (is-Cons!36888 l!1065)) (bvsle (_1!12867 (h!38431 l!1065)) key!287)) (is-Cons!36888 l!1065) (bvslt (_1!12867 (h!38431 l!1065)) key!287)))))

(declare-fun b!1582773 () Bool)

(assert (=> b!1582773 (= e!883398 (containsKey!972 (t!51806 l!1065) key!287))))

(assert (= (and d!167047 (not res!1081265)) b!1582772))

(assert (= (and b!1582772 res!1081266) b!1582773))

(declare-fun m!1453041 () Bool)

(assert (=> b!1582773 m!1453041))

(assert (=> b!1582715 d!167047))

(declare-fun b!1582786 () Bool)

(declare-fun e!883406 () Bool)

(declare-fun tp!114854 () Bool)

(assert (=> b!1582786 (= e!883406 (and tp_is_empty!39353 tp!114854))))

(assert (=> b!1582717 (= tp!114845 e!883406)))

(assert (= (and b!1582717 (is-Cons!36888 (t!51806 l!1065))) b!1582786))

(push 1)

