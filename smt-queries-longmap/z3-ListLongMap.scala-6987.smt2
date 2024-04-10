; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88590 () Bool)

(assert start!88590)

(declare-fun res!682793 () Bool)

(declare-fun e!572927 () Bool)

(assert (=> start!88590 (=> (not res!682793) (not e!572927))))

(declare-datatypes ((B!1630 0))(
  ( (B!1631 (val!11899 Int)) )
))
(declare-datatypes ((tuple2!15344 0))(
  ( (tuple2!15345 (_1!7683 (_ BitVec 64)) (_2!7683 B!1630)) )
))
(declare-datatypes ((List!21587 0))(
  ( (Nil!21584) (Cons!21583 (h!22781 tuple2!15344) (t!30588 List!21587)) )
))
(declare-fun l!996 () List!21587)

(declare-fun isStrictlySorted!652 (List!21587) Bool)

(assert (=> start!88590 (= res!682793 (isStrictlySorted!652 l!996))))

(assert (=> start!88590 e!572927))

(declare-fun e!572928 () Bool)

(assert (=> start!88590 e!572928))

(assert (=> start!88590 true))

(declare-fun tp_is_empty!23697 () Bool)

(assert (=> start!88590 tp_is_empty!23697))

(declare-fun b!1018254 () Bool)

(declare-fun res!682792 () Bool)

(assert (=> b!1018254 (=> (not res!682792) (not e!572927))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!512 (List!21587 (_ BitVec 64)) Bool)

(assert (=> b!1018254 (= res!682792 (containsKey!512 l!996 key!261))))

(declare-fun b!1018255 () Bool)

(assert (=> b!1018255 (= e!572927 false)))

(declare-fun value!172 () B!1630)

(declare-fun lt!449502 () List!21587)

(declare-fun insertStrictlySorted!333 (List!21587 (_ BitVec 64) B!1630) List!21587)

(assert (=> b!1018255 (= lt!449502 (insertStrictlySorted!333 l!996 key!261 value!172))))

(declare-fun b!1018256 () Bool)

(declare-fun tp!71014 () Bool)

(assert (=> b!1018256 (= e!572928 (and tp_is_empty!23697 tp!71014))))

(assert (= (and start!88590 res!682793) b!1018254))

(assert (= (and b!1018254 res!682792) b!1018255))

(get-info :version)

(assert (= (and start!88590 ((_ is Cons!21583) l!996)) b!1018256))

(declare-fun m!939181 () Bool)

(assert (=> start!88590 m!939181))

(declare-fun m!939183 () Bool)

(assert (=> b!1018254 m!939183))

(declare-fun m!939185 () Bool)

(assert (=> b!1018255 m!939185))

(check-sat (not b!1018255) (not b!1018256) (not b!1018254) tp_is_empty!23697 (not start!88590))
(check-sat)
