; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137102 () Bool)

(assert start!137102)

(declare-fun res!1079337 () Bool)

(declare-fun e!881444 () Bool)

(assert (=> start!137102 (=> (not res!1079337) (not e!881444))))

(declare-datatypes ((B!2618 0))(
  ( (B!2619 (val!19671 Int)) )
))
(declare-datatypes ((tuple2!25450 0))(
  ( (tuple2!25451 (_1!12736 (_ BitVec 64)) (_2!12736 B!2618)) )
))
(declare-datatypes ((List!36791 0))(
  ( (Nil!36788) (Cons!36787 (h!38330 tuple2!25450) (t!51705 List!36791)) )
))
(declare-fun l!1390 () List!36791)

(declare-fun isStrictlySorted!1049 (List!36791) Bool)

(assert (=> start!137102 (= res!1079337 (isStrictlySorted!1049 l!1390))))

(assert (=> start!137102 e!881444))

(declare-fun e!881443 () Bool)

(assert (=> start!137102 e!881443))

(assert (=> start!137102 true))

(declare-fun tp_is_empty!39163 () Bool)

(assert (=> start!137102 tp_is_empty!39163))

(declare-fun b!1580014 () Bool)

(declare-fun res!1079336 () Bool)

(assert (=> b!1580014 (=> (not res!1079336) (not e!881444))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!895 (List!36791 (_ BitVec 64)) Bool)

(assert (=> b!1580014 (= res!1079336 (containsKey!895 l!1390 key!405))))

(declare-fun b!1580015 () Bool)

(assert (=> b!1580015 (= e!881444 false)))

(declare-fun lt!676660 () Bool)

(declare-fun value!194 () B!2618)

(declare-fun contains!10463 (List!36791 tuple2!25450) Bool)

(assert (=> b!1580015 (= lt!676660 (contains!10463 l!1390 (tuple2!25451 key!405 value!194)))))

(declare-fun b!1580016 () Bool)

(declare-fun tp!114405 () Bool)

(assert (=> b!1580016 (= e!881443 (and tp_is_empty!39163 tp!114405))))

(assert (= (and start!137102 res!1079337) b!1580014))

(assert (= (and b!1580014 res!1079336) b!1580015))

(assert (= (and start!137102 (is-Cons!36787 l!1390)) b!1580016))

(declare-fun m!1451581 () Bool)

(assert (=> start!137102 m!1451581))

(declare-fun m!1451583 () Bool)

(assert (=> b!1580014 m!1451583))

(declare-fun m!1451585 () Bool)

(assert (=> b!1580015 m!1451585))

(push 1)

(assert (not b!1580016))

(assert tp_is_empty!39163)

(assert (not start!137102))

(assert (not b!1580014))

(assert (not b!1580015))

(check-sat)

(pop 1)

