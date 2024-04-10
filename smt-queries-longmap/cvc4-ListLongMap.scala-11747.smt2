; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137770 () Bool)

(assert start!137770)

(declare-fun b!1582827 () Bool)

(declare-fun e!883433 () Bool)

(declare-fun tp_is_empty!39359 () Bool)

(declare-fun tp!114863 () Bool)

(assert (=> b!1582827 (= e!883433 (and tp_is_empty!39359 tp!114863))))

(declare-fun b!1582829 () Bool)

(declare-fun e!883432 () Bool)

(declare-datatypes ((B!2826 0))(
  ( (B!2827 (val!19775 Int)) )
))
(declare-datatypes ((tuple2!25718 0))(
  ( (tuple2!25719 (_1!12870 (_ BitVec 64)) (_2!12870 B!2826)) )
))
(declare-datatypes ((List!36895 0))(
  ( (Nil!36892) (Cons!36891 (h!38434 tuple2!25718) (t!51809 List!36895)) )
))
(declare-fun l!1065 () List!36895)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!975 (List!36895 (_ BitVec 64)) Bool)

(assert (=> b!1582829 (= e!883432 (not (containsKey!975 (t!51809 l!1065) key!287)))))

(declare-fun b!1582830 () Bool)

(declare-fun res!1081302 () Bool)

(declare-fun e!883431 () Bool)

(assert (=> b!1582830 (=> (not res!1081302) (not e!883431))))

(assert (=> b!1582830 (= res!1081302 (containsKey!975 l!1065 key!287))))

(declare-fun b!1582831 () Bool)

(declare-fun res!1081300 () Bool)

(assert (=> b!1582831 (=> (not res!1081300) (not e!883431))))

(assert (=> b!1582831 (= res!1081300 (and (is-Cons!36891 l!1065) (not (= (_1!12870 (h!38434 l!1065)) key!287))))))

(declare-fun b!1582828 () Bool)

(assert (=> b!1582828 (= e!883431 e!883432)))

(declare-fun res!1081301 () Bool)

(assert (=> b!1582828 (=> res!1081301 e!883432)))

(declare-fun isStrictlySorted!1129 (List!36895) Bool)

(assert (=> b!1582828 (= res!1081301 (not (isStrictlySorted!1129 (t!51809 l!1065))))))

(declare-fun res!1081299 () Bool)

(assert (=> start!137770 (=> (not res!1081299) (not e!883431))))

(assert (=> start!137770 (= res!1081299 (isStrictlySorted!1129 l!1065))))

(assert (=> start!137770 e!883431))

(assert (=> start!137770 e!883433))

(assert (=> start!137770 true))

(assert (= (and start!137770 res!1081299) b!1582830))

(assert (= (and b!1582830 res!1081302) b!1582831))

(assert (= (and b!1582831 res!1081300) b!1582828))

(assert (= (and b!1582828 (not res!1081301)) b!1582829))

(assert (= (and start!137770 (is-Cons!36891 l!1065)) b!1582827))

(declare-fun m!1453059 () Bool)

(assert (=> b!1582829 m!1453059))

(declare-fun m!1453061 () Bool)

(assert (=> b!1582830 m!1453061))

(declare-fun m!1453063 () Bool)

(assert (=> b!1582828 m!1453063))

(declare-fun m!1453065 () Bool)

(assert (=> start!137770 m!1453065))

(push 1)

(assert (not b!1582830))

(assert tp_is_empty!39359)

(assert (not b!1582829))

(assert (not b!1582828))

(assert (not b!1582827))

(assert (not start!137770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167055 () Bool)

(declare-fun res!1081315 () Bool)

(declare-fun e!883446 () Bool)

(assert (=> d!167055 (=> res!1081315 e!883446)))

(assert (=> d!167055 (= res!1081315 (or (is-Nil!36892 l!1065) (is-Nil!36892 (t!51809 l!1065))))))

(assert (=> d!167055 (= (isStrictlySorted!1129 l!1065) e!883446)))

(declare-fun b!1582844 () Bool)

(declare-fun e!883447 () Bool)

(assert (=> b!1582844 (= e!883446 e!883447)))

(declare-fun res!1081316 () Bool)

(assert (=> b!1582844 (=> (not res!1081316) (not e!883447))))

(assert (=> b!1582844 (= res!1081316 (bvslt (_1!12870 (h!38434 l!1065)) (_1!12870 (h!38434 (t!51809 l!1065)))))))

(declare-fun b!1582845 () Bool)

(assert (=> b!1582845 (= e!883447 (isStrictlySorted!1129 (t!51809 l!1065)))))

(assert (= (and d!167055 (not res!1081315)) b!1582844))

(assert (= (and b!1582844 res!1081316) b!1582845))

(assert (=> b!1582845 m!1453063))

(assert (=> start!137770 d!167055))

(declare-fun d!167063 () Bool)

(declare-fun res!1081319 () Bool)

(declare-fun e!883450 () Bool)

(assert (=> d!167063 (=> res!1081319 e!883450)))

(assert (=> d!167063 (= res!1081319 (or (is-Nil!36892 (t!51809 l!1065)) (is-Nil!36892 (t!51809 (t!51809 l!1065)))))))

(assert (=> d!167063 (= (isStrictlySorted!1129 (t!51809 l!1065)) e!883450)))

(declare-fun b!1582846 () Bool)

(declare-fun e!883451 () Bool)

(assert (=> b!1582846 (= e!883450 e!883451)))

(declare-fun res!1081320 () Bool)

(assert (=> b!1582846 (=> (not res!1081320) (not e!883451))))

(assert (=> b!1582846 (= res!1081320 (bvslt (_1!12870 (h!38434 (t!51809 l!1065))) (_1!12870 (h!38434 (t!51809 (t!51809 l!1065))))))))

(declare-fun b!1582847 () Bool)

(assert (=> b!1582847 (= e!883451 (isStrictlySorted!1129 (t!51809 (t!51809 l!1065))))))

(assert (= (and d!167063 (not res!1081319)) b!1582846))

(assert (= (and b!1582846 res!1081320) b!1582847))

(declare-fun m!1453069 () Bool)

(assert (=> b!1582847 m!1453069))

(assert (=> b!1582828 d!167063))

(declare-fun d!167065 () Bool)

(declare-fun res!1081339 () Bool)

(declare-fun e!883473 () Bool)

(assert (=> d!167065 (=> res!1081339 e!883473)))

(assert (=> d!167065 (= res!1081339 (and (is-Cons!36891 (t!51809 l!1065)) (= (_1!12870 (h!38434 (t!51809 l!1065))) key!287)))))

(assert (=> d!167065 (= (containsKey!975 (t!51809 l!1065) key!287) e!883473)))

(declare-fun b!1582873 () Bool)

(declare-fun e!883474 () Bool)

(assert (=> b!1582873 (= e!883473 e!883474)))

(declare-fun res!1081340 () Bool)

(assert (=> b!1582873 (=> (not res!1081340) (not e!883474))))

(assert (=> b!1582873 (= res!1081340 (and (or (not (is-Cons!36891 (t!51809 l!1065))) (bvsle (_1!12870 (h!38434 (t!51809 l!1065))) key!287)) (is-Cons!36891 (t!51809 l!1065)) (bvslt (_1!12870 (h!38434 (t!51809 l!1065))) key!287)))))

(declare-fun b!1582874 () Bool)

(assert (=> b!1582874 (= e!883474 (containsKey!975 (t!51809 (t!51809 l!1065)) key!287))))

(assert (= (and d!167065 (not res!1081339)) b!1582873))

(assert (= (and b!1582873 res!1081340) b!1582874))

(declare-fun m!1453075 () Bool)

(assert (=> b!1582874 m!1453075))

(assert (=> b!1582829 d!167065))

(declare-fun d!167073 () Bool)

(declare-fun res!1081343 () Bool)

(declare-fun e!883477 () Bool)

(assert (=> d!167073 (=> res!1081343 e!883477)))

(assert (=> d!167073 (= res!1081343 (and (is-Cons!36891 l!1065) (= (_1!12870 (h!38434 l!1065)) key!287)))))

(assert (=> d!167073 (= (containsKey!975 l!1065 key!287) e!883477)))

(declare-fun b!1582877 () Bool)

(declare-fun e!883478 () Bool)

(assert (=> b!1582877 (= e!883477 e!883478)))

(declare-fun res!1081344 () Bool)

(assert (=> b!1582877 (=> (not res!1081344) (not e!883478))))

(assert (=> b!1582877 (= res!1081344 (and (or (not (is-Cons!36891 l!1065)) (bvsle (_1!12870 (h!38434 l!1065)) key!287)) (is-Cons!36891 l!1065) (bvslt (_1!12870 (h!38434 l!1065)) key!287)))))

(declare-fun b!1582878 () Bool)

(assert (=> b!1582878 (= e!883478 (containsKey!975 (t!51809 l!1065) key!287))))

(assert (= (and d!167073 (not res!1081343)) b!1582877))

(assert (= (and b!1582877 res!1081344) b!1582878))

(assert (=> b!1582878 m!1453059))

(assert (=> b!1582830 d!167073))

(declare-fun b!1582885 () Bool)

(declare-fun e!883483 () Bool)

(declare-fun tp!114869 () Bool)

(assert (=> b!1582885 (= e!883483 (and tp_is_empty!39359 tp!114869))))

(assert (=> b!1582827 (= tp!114863 e!883483)))

(assert (= (and b!1582827 (is-Cons!36891 (t!51809 l!1065))) b!1582885))

(push 1)

