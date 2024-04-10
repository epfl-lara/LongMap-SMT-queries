; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137734 () Bool)

(assert start!137734)

(declare-fun b!1582676 () Bool)

(declare-fun e!883325 () Bool)

(declare-fun tp_is_empty!39341 () Bool)

(declare-fun tp!114827 () Bool)

(assert (=> b!1582676 (= e!883325 (and tp_is_empty!39341 tp!114827))))

(declare-fun b!1582677 () Bool)

(declare-fun e!883324 () Bool)

(assert (=> b!1582677 (= e!883324 (not true))))

(declare-datatypes ((B!2808 0))(
  ( (B!2809 (val!19766 Int)) )
))
(declare-datatypes ((tuple2!25700 0))(
  ( (tuple2!25701 (_1!12861 (_ BitVec 64)) (_2!12861 B!2808)) )
))
(declare-datatypes ((List!36886 0))(
  ( (Nil!36883) (Cons!36882 (h!38425 tuple2!25700) (t!51800 List!36886)) )
))
(declare-fun l!1065 () List!36886)

(declare-fun key!287 () (_ BitVec 64))

(declare-datatypes ((Option!940 0))(
  ( (Some!939 (v!22467 B!2808)) (None!938) )
))
(declare-fun isDefined!605 (Option!940) Bool)

(declare-fun getValueByKey!831 (List!36886 (_ BitVec 64)) Option!940)

(assert (=> b!1582677 (isDefined!605 (getValueByKey!831 (t!51800 l!1065) key!287))))

(declare-datatypes ((Unit!52277 0))(
  ( (Unit!52278) )
))
(declare-fun lt!677127 () Unit!52277)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!554 (List!36886 (_ BitVec 64)) Unit!52277)

(assert (=> b!1582677 (= lt!677127 (lemmaContainsKeyImpliesGetValueByKeyDefined!554 (t!51800 l!1065) key!287))))

(declare-fun b!1582678 () Bool)

(declare-fun res!1081208 () Bool)

(assert (=> b!1582678 (=> (not res!1081208) (not e!883324))))

(assert (=> b!1582678 (= res!1081208 (and (is-Cons!36882 l!1065) (not (= (_1!12861 (h!38425 l!1065)) key!287))))))

(declare-fun b!1582679 () Bool)

(declare-fun res!1081209 () Bool)

(assert (=> b!1582679 (=> (not res!1081209) (not e!883324))))

(declare-fun containsKey!969 (List!36886 (_ BitVec 64)) Bool)

(assert (=> b!1582679 (= res!1081209 (containsKey!969 (t!51800 l!1065) key!287))))

(declare-fun b!1582680 () Bool)

(declare-fun res!1081210 () Bool)

(assert (=> b!1582680 (=> (not res!1081210) (not e!883324))))

(declare-fun isStrictlySorted!1123 (List!36886) Bool)

(assert (=> b!1582680 (= res!1081210 (isStrictlySorted!1123 (t!51800 l!1065)))))

(declare-fun res!1081211 () Bool)

(assert (=> start!137734 (=> (not res!1081211) (not e!883324))))

(assert (=> start!137734 (= res!1081211 (isStrictlySorted!1123 l!1065))))

(assert (=> start!137734 e!883324))

(assert (=> start!137734 e!883325))

(assert (=> start!137734 true))

(declare-fun b!1582681 () Bool)

(declare-fun res!1081212 () Bool)

(assert (=> b!1582681 (=> (not res!1081212) (not e!883324))))

(assert (=> b!1582681 (= res!1081212 (containsKey!969 l!1065 key!287))))

(assert (= (and start!137734 res!1081211) b!1582681))

(assert (= (and b!1582681 res!1081212) b!1582678))

(assert (= (and b!1582678 res!1081208) b!1582680))

(assert (= (and b!1582680 res!1081210) b!1582679))

(assert (= (and b!1582679 res!1081209) b!1582677))

(assert (= (and start!137734 (is-Cons!36882 l!1065)) b!1582676))

(declare-fun m!1452993 () Bool)

(assert (=> b!1582679 m!1452993))

(declare-fun m!1452995 () Bool)

(assert (=> b!1582677 m!1452995))

(assert (=> b!1582677 m!1452995))

(declare-fun m!1452997 () Bool)

(assert (=> b!1582677 m!1452997))

(declare-fun m!1452999 () Bool)

(assert (=> b!1582677 m!1452999))

(declare-fun m!1453001 () Bool)

(assert (=> start!137734 m!1453001))

(declare-fun m!1453003 () Bool)

(assert (=> b!1582680 m!1453003))

(declare-fun m!1453005 () Bool)

(assert (=> b!1582681 m!1453005))

(push 1)

(assert (not b!1582680))

(assert (not b!1582677))

(assert (not b!1582681))

(assert (not b!1582679))

(assert (not b!1582676))

(assert (not start!137734))

(assert tp_is_empty!39341)

(check-sat)

(pop 1)

