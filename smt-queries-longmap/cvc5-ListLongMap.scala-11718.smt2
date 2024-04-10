; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137132 () Bool)

(assert start!137132)

(declare-fun res!1079607 () Bool)

(declare-fun e!881615 () Bool)

(assert (=> start!137132 (=> (not res!1079607) (not e!881615))))

(declare-datatypes ((B!2648 0))(
  ( (B!2649 (val!19686 Int)) )
))
(declare-datatypes ((tuple2!25498 0))(
  ( (tuple2!25499 (_1!12760 (_ BitVec 64)) (_2!12760 B!2648)) )
))
(declare-datatypes ((List!36806 0))(
  ( (Nil!36803) (Cons!36802 (h!38345 tuple2!25498) (t!51720 List!36806)) )
))
(declare-fun l!1390 () List!36806)

(declare-fun isStrictlySorted!1064 (List!36806) Bool)

(assert (=> start!137132 (= res!1079607 (isStrictlySorted!1064 l!1390))))

(assert (=> start!137132 e!881615))

(declare-fun e!881614 () Bool)

(assert (=> start!137132 e!881614))

(assert (=> start!137132 true))

(declare-fun tp_is_empty!39193 () Bool)

(assert (=> start!137132 tp_is_empty!39193))

(declare-fun b!1580329 () Bool)

(declare-fun res!1079606 () Bool)

(assert (=> b!1580329 (=> (not res!1079606) (not e!881615))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!910 (List!36806 (_ BitVec 64)) Bool)

(assert (=> b!1580329 (= res!1079606 (containsKey!910 l!1390 key!405))))

(declare-fun b!1580330 () Bool)

(assert (=> b!1580330 (= e!881615 false)))

(declare-fun lt!676750 () Bool)

(declare-fun value!194 () B!2648)

(declare-fun contains!10478 (List!36806 tuple2!25498) Bool)

(assert (=> b!1580330 (= lt!676750 (contains!10478 l!1390 (tuple2!25499 key!405 value!194)))))

(declare-fun b!1580331 () Bool)

(declare-fun tp!114450 () Bool)

(assert (=> b!1580331 (= e!881614 (and tp_is_empty!39193 tp!114450))))

(assert (= (and start!137132 res!1079607) b!1580329))

(assert (= (and b!1580329 res!1079606) b!1580330))

(assert (= (and start!137132 (is-Cons!36802 l!1390)) b!1580331))

(declare-fun m!1451797 () Bool)

(assert (=> start!137132 m!1451797))

(declare-fun m!1451799 () Bool)

(assert (=> b!1580329 m!1451799))

(declare-fun m!1451801 () Bool)

(assert (=> b!1580330 m!1451801))

(push 1)

(assert (not b!1580331))

(assert (not b!1580330))

(assert (not start!137132))

(assert tp_is_empty!39193)

(assert (not b!1580329))

(check-sat)

(pop 1)

