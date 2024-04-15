; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88904 () Bool)

(assert start!88904)

(declare-fun res!683782 () Bool)

(declare-fun e!574165 () Bool)

(assert (=> start!88904 (=> (not res!683782) (not e!574165))))

(declare-datatypes ((B!1718 0))(
  ( (B!1719 (val!11943 Int)) )
))
(declare-datatypes ((tuple2!15512 0))(
  ( (tuple2!15513 (_1!7767 (_ BitVec 64)) (_2!7767 B!1718)) )
))
(declare-datatypes ((List!21666 0))(
  ( (Nil!21663) (Cons!21662 (h!22860 tuple2!15512) (t!30667 List!21666)) )
))
(declare-fun l!1367 () List!21666)

(declare-fun isStrictlySorted!692 (List!21666) Bool)

(assert (=> start!88904 (= res!683782 (isStrictlySorted!692 l!1367))))

(assert (=> start!88904 e!574165))

(declare-fun e!574166 () Bool)

(assert (=> start!88904 e!574166))

(assert (=> start!88904 true))

(declare-fun tp_is_empty!23785 () Bool)

(assert (=> start!88904 tp_is_empty!23785))

(declare-fun b!1020129 () Bool)

(assert (=> b!1020129 (= e!574165 false)))

(declare-fun value!188 () B!1718)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun lt!449626 () Bool)

(declare-fun contains!5898 (List!21666 tuple2!15512) Bool)

(assert (=> b!1020129 (= lt!449626 (contains!5898 l!1367 (tuple2!15513 key!393 value!188)))))

(declare-fun b!1020130 () Bool)

(declare-fun tp!71227 () Bool)

(assert (=> b!1020130 (= e!574166 (and tp_is_empty!23785 tp!71227))))

(assert (= (and start!88904 res!683782) b!1020129))

(get-info :version)

(assert (= (and start!88904 ((_ is Cons!21662) l!1367)) b!1020130))

(declare-fun m!939671 () Bool)

(assert (=> start!88904 m!939671))

(declare-fun m!939673 () Bool)

(assert (=> b!1020129 m!939673))

(check-sat (not b!1020129) (not start!88904) (not b!1020130) tp_is_empty!23785)
(check-sat)
