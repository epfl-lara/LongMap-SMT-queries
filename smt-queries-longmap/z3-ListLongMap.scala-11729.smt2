; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137522 () Bool)

(assert start!137522)

(declare-fun res!1080717 () Bool)

(declare-fun e!882718 () Bool)

(assert (=> start!137522 (=> (not res!1080717) (not e!882718))))

(declare-datatypes ((B!2716 0))(
  ( (B!2717 (val!19720 Int)) )
))
(declare-datatypes ((tuple2!25608 0))(
  ( (tuple2!25609 (_1!12815 (_ BitVec 64)) (_2!12815 B!2716)) )
))
(declare-datatypes ((List!36840 0))(
  ( (Nil!36837) (Cons!36836 (h!38379 tuple2!25608) (t!51754 List!36840)) )
))
(declare-fun l!1390 () List!36840)

(declare-fun isStrictlySorted!1098 (List!36840) Bool)

(assert (=> start!137522 (= res!1080717 (isStrictlySorted!1098 l!1390))))

(assert (=> start!137522 e!882718))

(declare-fun e!882719 () Bool)

(assert (=> start!137522 e!882719))

(assert (=> start!137522 true))

(declare-fun tp_is_empty!39261 () Bool)

(assert (=> start!137522 tp_is_empty!39261))

(declare-fun b!1581881 () Bool)

(declare-fun res!1080716 () Bool)

(assert (=> b!1581881 (=> (not res!1080716) (not e!882718))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!944 (List!36840 (_ BitVec 64)) Bool)

(assert (=> b!1581881 (= res!1080716 (containsKey!944 l!1390 key!405))))

(declare-fun b!1581882 () Bool)

(assert (=> b!1581882 (= e!882718 false)))

(declare-fun lt!677031 () Bool)

(declare-fun value!194 () B!2716)

(declare-fun contains!10512 (List!36840 tuple2!25608) Bool)

(assert (=> b!1581882 (= lt!677031 (contains!10512 l!1390 (tuple2!25609 key!405 value!194)))))

(declare-fun b!1581883 () Bool)

(declare-fun tp!114626 () Bool)

(assert (=> b!1581883 (= e!882719 (and tp_is_empty!39261 tp!114626))))

(assert (= (and start!137522 res!1080717) b!1581881))

(assert (= (and b!1581881 res!1080716) b!1581882))

(get-info :version)

(assert (= (and start!137522 ((_ is Cons!36836) l!1390)) b!1581883))

(declare-fun m!1452647 () Bool)

(assert (=> start!137522 m!1452647))

(declare-fun m!1452649 () Bool)

(assert (=> b!1581881 m!1452649))

(declare-fun m!1452651 () Bool)

(assert (=> b!1581882 m!1452651))

(check-sat tp_is_empty!39261 (not b!1581883) (not start!137522) (not b!1581881) (not b!1581882))
(check-sat)
