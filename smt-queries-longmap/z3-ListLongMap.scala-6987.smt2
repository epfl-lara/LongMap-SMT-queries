; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88822 () Bool)

(assert start!88822)

(declare-fun res!683297 () Bool)

(declare-fun e!573767 () Bool)

(assert (=> start!88822 (=> (not res!683297) (not e!573767))))

(declare-datatypes ((B!1628 0))(
  ( (B!1629 (val!11898 Int)) )
))
(declare-datatypes ((tuple2!15346 0))(
  ( (tuple2!15347 (_1!7684 (_ BitVec 64)) (_2!7684 B!1628)) )
))
(declare-datatypes ((List!21575 0))(
  ( (Nil!21572) (Cons!21571 (h!22778 tuple2!15346) (t!30568 List!21575)) )
))
(declare-fun l!996 () List!21575)

(declare-fun isStrictlySorted!639 (List!21575) Bool)

(assert (=> start!88822 (= res!683297 (isStrictlySorted!639 l!996))))

(assert (=> start!88822 e!573767))

(declare-fun e!573768 () Bool)

(assert (=> start!88822 e!573768))

(assert (=> start!88822 true))

(declare-fun tp_is_empty!23695 () Bool)

(assert (=> start!88822 tp_is_empty!23695))

(declare-fun b!1019566 () Bool)

(declare-fun res!683296 () Bool)

(assert (=> b!1019566 (=> (not res!683296) (not e!573767))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!513 (List!21575 (_ BitVec 64)) Bool)

(assert (=> b!1019566 (= res!683296 (containsKey!513 l!996 key!261))))

(declare-fun b!1019567 () Bool)

(assert (=> b!1019567 (= e!573767 false)))

(declare-fun value!172 () B!1628)

(declare-fun lt!450014 () List!21575)

(declare-fun insertStrictlySorted!333 (List!21575 (_ BitVec 64) B!1628) List!21575)

(assert (=> b!1019567 (= lt!450014 (insertStrictlySorted!333 l!996 key!261 value!172))))

(declare-fun b!1019568 () Bool)

(declare-fun tp!71011 () Bool)

(assert (=> b!1019568 (= e!573768 (and tp_is_empty!23695 tp!71011))))

(assert (= (and start!88822 res!683297) b!1019566))

(assert (= (and b!1019566 res!683296) b!1019567))

(get-info :version)

(assert (= (and start!88822 ((_ is Cons!21571) l!996)) b!1019568))

(declare-fun m!940839 () Bool)

(assert (=> start!88822 m!940839))

(declare-fun m!940841 () Bool)

(assert (=> b!1019566 m!940841))

(declare-fun m!940843 () Bool)

(assert (=> b!1019567 m!940843))

(check-sat (not start!88822) (not b!1019568) tp_is_empty!23695 (not b!1019566) (not b!1019567))
(check-sat)
