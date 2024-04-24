; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137546 () Bool)

(assert start!137546)

(declare-fun b!1582535 () Bool)

(declare-fun e!883006 () Bool)

(assert (=> b!1582535 (= e!883006 false)))

(declare-fun res!1080272 () Bool)

(assert (=> start!137546 (=> (not res!1080272) (not e!883006))))

(declare-datatypes ((B!2624 0))(
  ( (B!2625 (val!19674 Int)) )
))
(declare-datatypes ((tuple2!25516 0))(
  ( (tuple2!25517 (_1!12769 (_ BitVec 64)) (_2!12769 B!2624)) )
))
(declare-datatypes ((List!36826 0))(
  ( (Nil!36823) (Cons!36822 (h!38383 tuple2!25516) (t!51732 List!36826)) )
))
(declare-fun l!1390 () List!36826)

(declare-fun isStrictlySorted!1040 (List!36826) Bool)

(assert (=> start!137546 (= res!1080272 (isStrictlySorted!1040 l!1390))))

(assert (=> start!137546 e!883006))

(declare-fun e!883007 () Bool)

(assert (=> start!137546 e!883007))

(assert (=> start!137546 true))

(declare-fun tp_is_empty!39169 () Bool)

(assert (=> start!137546 tp_is_empty!39169))

(declare-fun b!1582533 () Bool)

(declare-fun res!1080271 () Bool)

(assert (=> b!1582533 (=> (not res!1080271) (not e!883006))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!899 (List!36826 (_ BitVec 64)) Bool)

(assert (=> b!1582533 (= res!1080271 (containsKey!899 l!1390 key!405))))

(declare-fun b!1582536 () Bool)

(declare-fun tp!114414 () Bool)

(assert (=> b!1582536 (= e!883007 (and tp_is_empty!39169 tp!114414))))

(declare-fun b!1582534 () Bool)

(declare-fun res!1080270 () Bool)

(assert (=> b!1582534 (=> (not res!1080270) (not e!883006))))

(declare-fun value!194 () B!2624)

(declare-fun contains!10511 (List!36826 tuple2!25516) Bool)

(assert (=> b!1582534 (= res!1080270 (contains!10511 l!1390 (tuple2!25517 key!405 value!194)))))

(assert (= (and start!137546 res!1080272) b!1582533))

(assert (= (and b!1582533 res!1080271) b!1582534))

(assert (= (and b!1582534 res!1080270) b!1582535))

(get-info :version)

(assert (= (and start!137546 ((_ is Cons!36822) l!1390)) b!1582536))

(declare-fun m!1453911 () Bool)

(assert (=> start!137546 m!1453911))

(declare-fun m!1453913 () Bool)

(assert (=> b!1582533 m!1453913))

(declare-fun m!1453915 () Bool)

(assert (=> b!1582534 m!1453915))

(check-sat (not b!1582536) (not b!1582534) tp_is_empty!39169 (not b!1582533) (not start!137546))
(check-sat)
