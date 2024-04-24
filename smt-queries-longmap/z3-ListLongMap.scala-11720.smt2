; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137570 () Bool)

(assert start!137570)

(declare-fun res!1080521 () Bool)

(declare-fun e!883160 () Bool)

(assert (=> start!137570 (=> (not res!1080521) (not e!883160))))

(declare-datatypes ((B!2648 0))(
  ( (B!2649 (val!19686 Int)) )
))
(declare-datatypes ((tuple2!25558 0))(
  ( (tuple2!25559 (_1!12790 (_ BitVec 64)) (_2!12790 B!2648)) )
))
(declare-datatypes ((List!36838 0))(
  ( (Nil!36835) (Cons!36834 (h!38395 tuple2!25558) (t!51744 List!36838)) )
))
(declare-fun l!1390 () List!36838)

(declare-fun isStrictlySorted!1052 (List!36838) Bool)

(assert (=> start!137570 (= res!1080521 (isStrictlySorted!1052 l!1390))))

(assert (=> start!137570 e!883160))

(declare-fun e!883159 () Bool)

(assert (=> start!137570 e!883159))

(assert (=> start!137570 true))

(declare-fun tp_is_empty!39193 () Bool)

(assert (=> start!137570 tp_is_empty!39193))

(declare-fun b!1582819 () Bool)

(declare-fun res!1080520 () Bool)

(assert (=> b!1582819 (=> (not res!1080520) (not e!883160))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!911 (List!36838 (_ BitVec 64)) Bool)

(assert (=> b!1582819 (= res!1080520 (containsKey!911 l!1390 key!405))))

(declare-fun b!1582820 () Bool)

(assert (=> b!1582820 (= e!883160 false)))

(declare-fun value!194 () B!2648)

(declare-fun lt!677658 () Bool)

(declare-fun contains!10523 (List!36838 tuple2!25558) Bool)

(assert (=> b!1582820 (= lt!677658 (contains!10523 l!1390 (tuple2!25559 key!405 value!194)))))

(declare-fun b!1582821 () Bool)

(declare-fun tp!114450 () Bool)

(assert (=> b!1582821 (= e!883159 (and tp_is_empty!39193 tp!114450))))

(assert (= (and start!137570 res!1080521) b!1582819))

(assert (= (and b!1582819 res!1080520) b!1582820))

(get-info :version)

(assert (= (and start!137570 ((_ is Cons!36834) l!1390)) b!1582821))

(declare-fun m!1454109 () Bool)

(assert (=> start!137570 m!1454109))

(declare-fun m!1454111 () Bool)

(assert (=> b!1582819 m!1454111))

(declare-fun m!1454113 () Bool)

(assert (=> b!1582820 m!1454113))

(check-sat tp_is_empty!39193 (not start!137570) (not b!1582820) (not b!1582821) (not b!1582819))
(check-sat)
