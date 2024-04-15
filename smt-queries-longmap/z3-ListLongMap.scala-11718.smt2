; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137098 () Bool)

(assert start!137098)

(declare-fun res!1079478 () Bool)

(declare-fun e!881417 () Bool)

(assert (=> start!137098 (=> (not res!1079478) (not e!881417))))

(declare-datatypes ((B!2648 0))(
  ( (B!2649 (val!19686 Int)) )
))
(declare-datatypes ((tuple2!25566 0))(
  ( (tuple2!25567 (_1!12794 (_ BitVec 64)) (_2!12794 B!2648)) )
))
(declare-datatypes ((List!36847 0))(
  ( (Nil!36844) (Cons!36843 (h!38387 tuple2!25566) (t!51753 List!36847)) )
))
(declare-fun l!1390 () List!36847)

(declare-fun isStrictlySorted!1062 (List!36847) Bool)

(assert (=> start!137098 (= res!1079478 (isStrictlySorted!1062 l!1390))))

(assert (=> start!137098 e!881417))

(declare-fun e!881416 () Bool)

(assert (=> start!137098 e!881416))

(assert (=> start!137098 true))

(declare-fun tp_is_empty!39193 () Bool)

(assert (=> start!137098 tp_is_empty!39193))

(declare-fun b!1580016 () Bool)

(declare-fun res!1079477 () Bool)

(assert (=> b!1580016 (=> (not res!1079477) (not e!881417))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!908 (List!36847 (_ BitVec 64)) Bool)

(assert (=> b!1580016 (= res!1079477 (containsKey!908 l!1390 key!405))))

(declare-fun b!1580017 () Bool)

(assert (=> b!1580017 (= e!881417 false)))

(declare-fun value!194 () B!2648)

(declare-fun lt!676467 () Bool)

(declare-fun contains!10433 (List!36847 tuple2!25566) Bool)

(assert (=> b!1580017 (= lt!676467 (contains!10433 l!1390 (tuple2!25567 key!405 value!194)))))

(declare-fun b!1580018 () Bool)

(declare-fun tp!114451 () Bool)

(assert (=> b!1580018 (= e!881416 (and tp_is_empty!39193 tp!114451))))

(assert (= (and start!137098 res!1079478) b!1580016))

(assert (= (and b!1580016 res!1079477) b!1580017))

(get-info :version)

(assert (= (and start!137098 ((_ is Cons!36843) l!1390)) b!1580018))

(declare-fun m!1450917 () Bool)

(assert (=> start!137098 m!1450917))

(declare-fun m!1450919 () Bool)

(assert (=> b!1580016 m!1450919))

(declare-fun m!1450921 () Bool)

(assert (=> b!1580017 m!1450921))

(check-sat (not start!137098) (not b!1580017) (not b!1580016) tp_is_empty!39193 (not b!1580018))
(check-sat)
