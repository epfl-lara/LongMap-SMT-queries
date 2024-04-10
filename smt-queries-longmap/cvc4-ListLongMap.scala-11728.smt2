; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137518 () Bool)

(assert start!137518)

(declare-fun res!1080704 () Bool)

(declare-fun e!882706 () Bool)

(assert (=> start!137518 (=> (not res!1080704) (not e!882706))))

(declare-datatypes ((B!2712 0))(
  ( (B!2713 (val!19718 Int)) )
))
(declare-datatypes ((tuple2!25604 0))(
  ( (tuple2!25605 (_1!12813 (_ BitVec 64)) (_2!12813 B!2712)) )
))
(declare-datatypes ((List!36838 0))(
  ( (Nil!36835) (Cons!36834 (h!38377 tuple2!25604) (t!51752 List!36838)) )
))
(declare-fun l!1390 () List!36838)

(declare-fun isStrictlySorted!1096 (List!36838) Bool)

(assert (=> start!137518 (= res!1080704 (isStrictlySorted!1096 l!1390))))

(assert (=> start!137518 e!882706))

(declare-fun e!882707 () Bool)

(assert (=> start!137518 e!882707))

(assert (=> start!137518 true))

(declare-fun tp_is_empty!39257 () Bool)

(assert (=> start!137518 tp_is_empty!39257))

(declare-fun b!1581863 () Bool)

(declare-fun res!1080705 () Bool)

(assert (=> b!1581863 (=> (not res!1080705) (not e!882706))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!942 (List!36838 (_ BitVec 64)) Bool)

(assert (=> b!1581863 (= res!1080705 (containsKey!942 l!1390 key!405))))

(declare-fun b!1581864 () Bool)

(assert (=> b!1581864 (= e!882706 false)))

(declare-fun lt!677025 () Bool)

(declare-fun value!194 () B!2712)

(declare-fun contains!10510 (List!36838 tuple2!25604) Bool)

(assert (=> b!1581864 (= lt!677025 (contains!10510 l!1390 (tuple2!25605 key!405 value!194)))))

(declare-fun b!1581865 () Bool)

(declare-fun tp!114620 () Bool)

(assert (=> b!1581865 (= e!882707 (and tp_is_empty!39257 tp!114620))))

(assert (= (and start!137518 res!1080704) b!1581863))

(assert (= (and b!1581863 res!1080705) b!1581864))

(assert (= (and start!137518 (is-Cons!36834 l!1390)) b!1581865))

(declare-fun m!1452635 () Bool)

(assert (=> start!137518 m!1452635))

(declare-fun m!1452637 () Bool)

(assert (=> b!1581863 m!1452637))

(declare-fun m!1452639 () Bool)

(assert (=> b!1581864 m!1452639))

(push 1)

(assert (not b!1581863))

(assert (not start!137518))

(assert (not b!1581865))

(assert tp_is_empty!39257)

(assert (not b!1581864))

(check-sat)

(pop 1)

