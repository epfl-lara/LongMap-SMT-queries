; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88586 () Bool)

(assert start!88586)

(declare-fun res!682720 () Bool)

(declare-fun e!572833 () Bool)

(assert (=> start!88586 (=> (not res!682720) (not e!572833))))

(declare-datatypes ((B!1628 0))(
  ( (B!1629 (val!11898 Int)) )
))
(declare-datatypes ((tuple2!15422 0))(
  ( (tuple2!15423 (_1!7722 (_ BitVec 64)) (_2!7722 B!1628)) )
))
(declare-datatypes ((List!21621 0))(
  ( (Nil!21618) (Cons!21617 (h!22815 tuple2!15422) (t!30613 List!21621)) )
))
(declare-fun l!996 () List!21621)

(declare-fun isStrictlySorted!647 (List!21621) Bool)

(assert (=> start!88586 (= res!682720 (isStrictlySorted!647 l!996))))

(assert (=> start!88586 e!572833))

(declare-fun e!572834 () Bool)

(assert (=> start!88586 e!572834))

(assert (=> start!88586 true))

(declare-fun tp_is_empty!23695 () Bool)

(assert (=> start!88586 tp_is_empty!23695))

(declare-fun b!1018100 () Bool)

(declare-fun res!682719 () Bool)

(assert (=> b!1018100 (=> (not res!682719) (not e!572833))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!511 (List!21621 (_ BitVec 64)) Bool)

(assert (=> b!1018100 (= res!682719 (containsKey!511 l!996 key!261))))

(declare-fun b!1018101 () Bool)

(assert (=> b!1018101 (= e!572833 false)))

(declare-fun value!172 () B!1628)

(declare-fun lt!449299 () List!21621)

(declare-fun insertStrictlySorted!333 (List!21621 (_ BitVec 64) B!1628) List!21621)

(assert (=> b!1018101 (= lt!449299 (insertStrictlySorted!333 l!996 key!261 value!172))))

(declare-fun b!1018102 () Bool)

(declare-fun tp!71011 () Bool)

(assert (=> b!1018102 (= e!572834 (and tp_is_empty!23695 tp!71011))))

(assert (= (and start!88586 res!682720) b!1018100))

(assert (= (and b!1018100 res!682719) b!1018101))

(get-info :version)

(assert (= (and start!88586 ((_ is Cons!21617) l!996)) b!1018102))

(declare-fun m!938557 () Bool)

(assert (=> start!88586 m!938557))

(declare-fun m!938559 () Bool)

(assert (=> b!1018100 m!938559))

(declare-fun m!938561 () Bool)

(assert (=> b!1018101 m!938561))

(check-sat (not start!88586) (not b!1018102) tp_is_empty!23695 (not b!1018101) (not b!1018100))
(check-sat)
