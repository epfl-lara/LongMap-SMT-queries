; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137142 () Bool)

(assert start!137142)

(declare-fun res!1079636 () Bool)

(declare-fun e!881645 () Bool)

(assert (=> start!137142 (=> (not res!1079636) (not e!881645))))

(declare-datatypes ((B!2658 0))(
  ( (B!2659 (val!19691 Int)) )
))
(declare-datatypes ((tuple2!25508 0))(
  ( (tuple2!25509 (_1!12765 (_ BitVec 64)) (_2!12765 B!2658)) )
))
(declare-datatypes ((List!36811 0))(
  ( (Nil!36808) (Cons!36807 (h!38350 tuple2!25508) (t!51725 List!36811)) )
))
(declare-fun l!1390 () List!36811)

(declare-fun isStrictlySorted!1069 (List!36811) Bool)

(assert (=> start!137142 (= res!1079636 (isStrictlySorted!1069 l!1390))))

(assert (=> start!137142 e!881645))

(declare-fun e!881644 () Bool)

(assert (=> start!137142 e!881644))

(assert (=> start!137142 true))

(declare-fun tp_is_empty!39203 () Bool)

(assert (=> start!137142 tp_is_empty!39203))

(declare-fun b!1580374 () Bool)

(declare-fun res!1079637 () Bool)

(assert (=> b!1580374 (=> (not res!1079637) (not e!881645))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!915 (List!36811 (_ BitVec 64)) Bool)

(assert (=> b!1580374 (= res!1079637 (containsKey!915 l!1390 key!405))))

(declare-fun b!1580375 () Bool)

(assert (=> b!1580375 (= e!881645 false)))

(declare-fun lt!676765 () Bool)

(declare-fun value!194 () B!2658)

(declare-fun contains!10483 (List!36811 tuple2!25508) Bool)

(assert (=> b!1580375 (= lt!676765 (contains!10483 l!1390 (tuple2!25509 key!405 value!194)))))

(declare-fun b!1580376 () Bool)

(declare-fun tp!114465 () Bool)

(assert (=> b!1580376 (= e!881644 (and tp_is_empty!39203 tp!114465))))

(assert (= (and start!137142 res!1079636) b!1580374))

(assert (= (and b!1580374 res!1079637) b!1580375))

(assert (= (and start!137142 (is-Cons!36807 l!1390)) b!1580376))

(declare-fun m!1451827 () Bool)

(assert (=> start!137142 m!1451827))

(declare-fun m!1451829 () Bool)

(assert (=> b!1580374 m!1451829))

(declare-fun m!1451831 () Bool)

(assert (=> b!1580375 m!1451831))

(push 1)

(assert (not b!1580374))

(assert (not b!1580376))

(assert (not b!1580375))

(assert tp_is_empty!39203)

(assert (not start!137142))

(check-sat)

(pop 1)

(push 1)

