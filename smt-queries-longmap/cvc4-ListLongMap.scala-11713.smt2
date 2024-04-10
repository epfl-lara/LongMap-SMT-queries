; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137106 () Bool)

(assert start!137106)

(declare-fun res!1079349 () Bool)

(declare-fun e!881456 () Bool)

(assert (=> start!137106 (=> (not res!1079349) (not e!881456))))

(declare-datatypes ((B!2622 0))(
  ( (B!2623 (val!19673 Int)) )
))
(declare-datatypes ((tuple2!25454 0))(
  ( (tuple2!25455 (_1!12738 (_ BitVec 64)) (_2!12738 B!2622)) )
))
(declare-datatypes ((List!36793 0))(
  ( (Nil!36790) (Cons!36789 (h!38332 tuple2!25454) (t!51707 List!36793)) )
))
(declare-fun l!1390 () List!36793)

(declare-fun isStrictlySorted!1051 (List!36793) Bool)

(assert (=> start!137106 (= res!1079349 (isStrictlySorted!1051 l!1390))))

(assert (=> start!137106 e!881456))

(declare-fun e!881455 () Bool)

(assert (=> start!137106 e!881455))

(assert (=> start!137106 true))

(declare-fun tp_is_empty!39167 () Bool)

(assert (=> start!137106 tp_is_empty!39167))

(declare-fun b!1580032 () Bool)

(declare-fun res!1079348 () Bool)

(assert (=> b!1580032 (=> (not res!1079348) (not e!881456))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!897 (List!36793 (_ BitVec 64)) Bool)

(assert (=> b!1580032 (= res!1079348 (containsKey!897 l!1390 key!405))))

(declare-fun b!1580033 () Bool)

(assert (=> b!1580033 (= e!881456 false)))

(declare-fun lt!676666 () Bool)

(declare-fun value!194 () B!2622)

(declare-fun contains!10465 (List!36793 tuple2!25454) Bool)

(assert (=> b!1580033 (= lt!676666 (contains!10465 l!1390 (tuple2!25455 key!405 value!194)))))

(declare-fun b!1580034 () Bool)

(declare-fun tp!114411 () Bool)

(assert (=> b!1580034 (= e!881455 (and tp_is_empty!39167 tp!114411))))

(assert (= (and start!137106 res!1079349) b!1580032))

(assert (= (and b!1580032 res!1079348) b!1580033))

(assert (= (and start!137106 (is-Cons!36789 l!1390)) b!1580034))

(declare-fun m!1451593 () Bool)

(assert (=> start!137106 m!1451593))

(declare-fun m!1451595 () Bool)

(assert (=> b!1580032 m!1451595))

(declare-fun m!1451597 () Bool)

(assert (=> b!1580033 m!1451597))

(push 1)

(assert (not start!137106))

(assert (not b!1580034))

(assert tp_is_empty!39167)

(assert (not b!1580033))

(assert (not b!1580032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

