; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88846 () Bool)

(assert start!88846)

(declare-fun res!683395 () Bool)

(declare-fun e!573848 () Bool)

(assert (=> start!88846 (=> (not res!683395) (not e!573848))))

(declare-datatypes ((B!1652 0))(
  ( (B!1653 (val!11910 Int)) )
))
(declare-datatypes ((tuple2!15370 0))(
  ( (tuple2!15371 (_1!7696 (_ BitVec 64)) (_2!7696 B!1652)) )
))
(declare-datatypes ((List!21587 0))(
  ( (Nil!21584) (Cons!21583 (h!22790 tuple2!15370) (t!30580 List!21587)) )
))
(declare-fun l!996 () List!21587)

(declare-fun isStrictlySorted!651 (List!21587) Bool)

(assert (=> start!88846 (= res!683395 (isStrictlySorted!651 l!996))))

(assert (=> start!88846 e!573848))

(declare-fun e!573849 () Bool)

(assert (=> start!88846 e!573849))

(assert (=> start!88846 true))

(declare-fun tp_is_empty!23719 () Bool)

(assert (=> start!88846 tp_is_empty!23719))

(declare-fun b!1019701 () Bool)

(declare-fun res!683396 () Bool)

(assert (=> b!1019701 (=> (not res!683396) (not e!573848))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!525 (List!21587 (_ BitVec 64)) Bool)

(assert (=> b!1019701 (= res!683396 (containsKey!525 l!996 key!261))))

(declare-fun b!1019702 () Bool)

(assert (=> b!1019702 (= e!573848 false)))

(declare-fun value!172 () B!1652)

(declare-fun lt!450059 () List!21587)

(declare-fun insertStrictlySorted!345 (List!21587 (_ BitVec 64) B!1652) List!21587)

(assert (=> b!1019702 (= lt!450059 (insertStrictlySorted!345 l!996 key!261 value!172))))

(declare-fun b!1019703 () Bool)

(declare-fun tp!71047 () Bool)

(assert (=> b!1019703 (= e!573849 (and tp_is_empty!23719 tp!71047))))

(assert (= (and start!88846 res!683395) b!1019701))

(assert (= (and b!1019701 res!683396) b!1019702))

(get-info :version)

(assert (= (and start!88846 ((_ is Cons!21583) l!996)) b!1019703))

(declare-fun m!940947 () Bool)

(assert (=> start!88846 m!940947))

(declare-fun m!940949 () Bool)

(assert (=> b!1019701 m!940949))

(declare-fun m!940951 () Bool)

(assert (=> b!1019702 m!940951))

(check-sat tp_is_empty!23719 (not b!1019703) (not start!88846) (not b!1019702) (not b!1019701))
(check-sat)
