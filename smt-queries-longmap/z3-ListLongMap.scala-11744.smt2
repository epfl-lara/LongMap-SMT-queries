; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137696 () Bool)

(assert start!137696)

(declare-fun res!1081051 () Bool)

(declare-fun e!883114 () Bool)

(assert (=> start!137696 (=> (not res!1081051) (not e!883114))))

(declare-datatypes ((B!2804 0))(
  ( (B!2805 (val!19764 Int)) )
))
(declare-datatypes ((tuple2!25764 0))(
  ( (tuple2!25765 (_1!12893 (_ BitVec 64)) (_2!12893 B!2804)) )
))
(declare-datatypes ((List!36925 0))(
  ( (Nil!36922) (Cons!36921 (h!38465 tuple2!25764) (t!51831 List!36925)) )
))
(declare-fun l!1065 () List!36925)

(declare-fun isStrictlySorted!1119 (List!36925) Bool)

(assert (=> start!137696 (= res!1081051 (isStrictlySorted!1119 l!1065))))

(assert (=> start!137696 e!883114))

(declare-fun e!883115 () Bool)

(assert (=> start!137696 e!883115))

(assert (=> start!137696 true))

(declare-fun b!1582327 () Bool)

(declare-fun res!1081053 () Bool)

(assert (=> b!1582327 (=> (not res!1081053) (not e!883114))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!965 (List!36925 (_ BitVec 64)) Bool)

(assert (=> b!1582327 (= res!1081053 (containsKey!965 (t!51831 l!1065) key!287))))

(declare-fun b!1582328 () Bool)

(declare-fun tp_is_empty!39337 () Bool)

(declare-fun tp!114822 () Bool)

(assert (=> b!1582328 (= e!883115 (and tp_is_empty!39337 tp!114822))))

(declare-fun b!1582329 () Bool)

(declare-fun res!1081050 () Bool)

(assert (=> b!1582329 (=> (not res!1081050) (not e!883114))))

(assert (=> b!1582329 (= res!1081050 (containsKey!965 l!1065 key!287))))

(declare-fun b!1582330 () Bool)

(declare-fun res!1081052 () Bool)

(assert (=> b!1582330 (=> (not res!1081052) (not e!883114))))

(get-info :version)

(assert (=> b!1582330 (= res!1081052 (and ((_ is Cons!36921) l!1065) (not (= (_1!12893 (h!38465 l!1065)) key!287))))))

(declare-fun b!1582331 () Bool)

(declare-fun res!1081049 () Bool)

(assert (=> b!1582331 (=> (not res!1081049) (not e!883114))))

(assert (=> b!1582331 (= res!1081049 (isStrictlySorted!1119 (t!51831 l!1065)))))

(declare-fun b!1582332 () Bool)

(assert (=> b!1582332 (= e!883114 (not true))))

(declare-datatypes ((Option!940 0))(
  ( (Some!939 (v!22461 B!2804)) (None!938) )
))
(declare-fun isDefined!605 (Option!940) Bool)

(declare-fun getValueByKey!832 (List!36925 (_ BitVec 64)) Option!940)

(assert (=> b!1582332 (isDefined!605 (getValueByKey!832 (t!51831 l!1065) key!287))))

(declare-datatypes ((Unit!52081 0))(
  ( (Unit!52082) )
))
(declare-fun lt!676838 () Unit!52081)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!550 (List!36925 (_ BitVec 64)) Unit!52081)

(assert (=> b!1582332 (= lt!676838 (lemmaContainsKeyImpliesGetValueByKeyDefined!550 (t!51831 l!1065) key!287))))

(assert (= (and start!137696 res!1081051) b!1582329))

(assert (= (and b!1582329 res!1081050) b!1582330))

(assert (= (and b!1582330 res!1081052) b!1582331))

(assert (= (and b!1582331 res!1081049) b!1582327))

(assert (= (and b!1582327 res!1081053) b!1582332))

(assert (= (and start!137696 ((_ is Cons!36921) l!1065)) b!1582328))

(declare-fun m!1452085 () Bool)

(assert (=> b!1582329 m!1452085))

(declare-fun m!1452087 () Bool)

(assert (=> b!1582327 m!1452087))

(declare-fun m!1452089 () Bool)

(assert (=> b!1582332 m!1452089))

(assert (=> b!1582332 m!1452089))

(declare-fun m!1452091 () Bool)

(assert (=> b!1582332 m!1452091))

(declare-fun m!1452093 () Bool)

(assert (=> b!1582332 m!1452093))

(declare-fun m!1452095 () Bool)

(assert (=> start!137696 m!1452095))

(declare-fun m!1452097 () Bool)

(assert (=> b!1582331 m!1452097))

(check-sat (not b!1582331) (not b!1582332) tp_is_empty!39337 (not b!1582327) (not b!1582328) (not b!1582329) (not start!137696))
(check-sat)
