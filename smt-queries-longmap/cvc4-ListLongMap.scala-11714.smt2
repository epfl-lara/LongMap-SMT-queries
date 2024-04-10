; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137112 () Bool)

(assert start!137112)

(declare-fun b!1580068 () Bool)

(declare-fun res!1079376 () Bool)

(declare-fun e!881473 () Bool)

(assert (=> b!1580068 (=> (not res!1079376) (not e!881473))))

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2628 0))(
  ( (B!2629 (val!19676 Int)) )
))
(declare-fun value!194 () B!2628)

(declare-datatypes ((tuple2!25460 0))(
  ( (tuple2!25461 (_1!12741 (_ BitVec 64)) (_2!12741 B!2628)) )
))
(declare-datatypes ((List!36796 0))(
  ( (Nil!36793) (Cons!36792 (h!38335 tuple2!25460) (t!51710 List!36796)) )
))
(declare-fun l!1390 () List!36796)

(declare-fun contains!10468 (List!36796 tuple2!25460) Bool)

(assert (=> b!1580068 (= res!1079376 (contains!10468 l!1390 (tuple2!25461 key!405 value!194)))))

(declare-fun res!1079374 () Bool)

(assert (=> start!137112 (=> (not res!1079374) (not e!881473))))

(declare-fun isStrictlySorted!1054 (List!36796) Bool)

(assert (=> start!137112 (= res!1079374 (isStrictlySorted!1054 l!1390))))

(assert (=> start!137112 e!881473))

(declare-fun e!881474 () Bool)

(assert (=> start!137112 e!881474))

(assert (=> start!137112 true))

(declare-fun tp_is_empty!39173 () Bool)

(assert (=> start!137112 tp_is_empty!39173))

(declare-fun b!1580069 () Bool)

(assert (=> b!1580069 (= e!881473 false)))

(declare-fun b!1580067 () Bool)

(declare-fun res!1079375 () Bool)

(assert (=> b!1580067 (=> (not res!1079375) (not e!881473))))

(declare-fun containsKey!900 (List!36796 (_ BitVec 64)) Bool)

(assert (=> b!1580067 (= res!1079375 (containsKey!900 l!1390 key!405))))

(declare-fun b!1580070 () Bool)

(declare-fun tp!114420 () Bool)

(assert (=> b!1580070 (= e!881474 (and tp_is_empty!39173 tp!114420))))

(assert (= (and start!137112 res!1079374) b!1580067))

(assert (= (and b!1580067 res!1079375) b!1580068))

(assert (= (and b!1580068 res!1079376) b!1580069))

(assert (= (and start!137112 (is-Cons!36792 l!1390)) b!1580070))

(declare-fun m!1451611 () Bool)

(assert (=> b!1580068 m!1451611))

(declare-fun m!1451613 () Bool)

(assert (=> start!137112 m!1451613))

(declare-fun m!1451615 () Bool)

(assert (=> b!1580067 m!1451615))

(push 1)

(assert (not start!137112))

(assert tp_is_empty!39173)

(assert (not b!1580070))

(assert (not b!1580068))

(assert (not b!1580067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

