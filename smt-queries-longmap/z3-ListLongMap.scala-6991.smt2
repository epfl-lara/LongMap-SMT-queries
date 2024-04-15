; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88610 () Bool)

(assert start!88610)

(declare-fun res!682818 () Bool)

(declare-fun e!572915 () Bool)

(assert (=> start!88610 (=> (not res!682818) (not e!572915))))

(declare-datatypes ((B!1652 0))(
  ( (B!1653 (val!11910 Int)) )
))
(declare-datatypes ((tuple2!15446 0))(
  ( (tuple2!15447 (_1!7734 (_ BitVec 64)) (_2!7734 B!1652)) )
))
(declare-datatypes ((List!21633 0))(
  ( (Nil!21630) (Cons!21629 (h!22827 tuple2!15446) (t!30625 List!21633)) )
))
(declare-fun l!996 () List!21633)

(declare-fun isStrictlySorted!659 (List!21633) Bool)

(assert (=> start!88610 (= res!682818 (isStrictlySorted!659 l!996))))

(assert (=> start!88610 e!572915))

(declare-fun e!572914 () Bool)

(assert (=> start!88610 e!572914))

(assert (=> start!88610 true))

(declare-fun tp_is_empty!23719 () Bool)

(assert (=> start!88610 tp_is_empty!23719))

(declare-fun b!1018235 () Bool)

(declare-fun res!682819 () Bool)

(assert (=> b!1018235 (=> (not res!682819) (not e!572915))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!523 (List!21633 (_ BitVec 64)) Bool)

(assert (=> b!1018235 (= res!682819 (containsKey!523 l!996 key!261))))

(declare-fun b!1018236 () Bool)

(assert (=> b!1018236 (= e!572915 false)))

(declare-fun value!172 () B!1652)

(declare-fun lt!449344 () List!21633)

(declare-fun insertStrictlySorted!345 (List!21633 (_ BitVec 64) B!1652) List!21633)

(assert (=> b!1018236 (= lt!449344 (insertStrictlySorted!345 l!996 key!261 value!172))))

(declare-fun b!1018237 () Bool)

(declare-fun tp!71047 () Bool)

(assert (=> b!1018237 (= e!572914 (and tp_is_empty!23719 tp!71047))))

(assert (= (and start!88610 res!682818) b!1018235))

(assert (= (and b!1018235 res!682819) b!1018236))

(get-info :version)

(assert (= (and start!88610 ((_ is Cons!21629) l!996)) b!1018237))

(declare-fun m!938665 () Bool)

(assert (=> start!88610 m!938665))

(declare-fun m!938667 () Bool)

(assert (=> b!1018235 m!938667))

(declare-fun m!938669 () Bool)

(assert (=> b!1018236 m!938669))

(check-sat (not start!88610) (not b!1018235) (not b!1018236) (not b!1018237) tp_is_empty!23719)
(check-sat)
