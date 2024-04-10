; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88908 () Bool)

(assert start!88908)

(declare-fun res!683852 () Bool)

(declare-fun e!574259 () Bool)

(assert (=> start!88908 (=> (not res!683852) (not e!574259))))

(declare-datatypes ((B!1720 0))(
  ( (B!1721 (val!11944 Int)) )
))
(declare-datatypes ((tuple2!15434 0))(
  ( (tuple2!15435 (_1!7728 (_ BitVec 64)) (_2!7728 B!1720)) )
))
(declare-datatypes ((List!21632 0))(
  ( (Nil!21629) (Cons!21628 (h!22826 tuple2!15434) (t!30642 List!21632)) )
))
(declare-fun l!1367 () List!21632)

(declare-fun isStrictlySorted!697 (List!21632) Bool)

(assert (=> start!88908 (= res!683852 (isStrictlySorted!697 l!1367))))

(assert (=> start!88908 e!574259))

(declare-fun e!574260 () Bool)

(assert (=> start!88908 e!574260))

(assert (=> start!88908 true))

(declare-fun tp_is_empty!23787 () Bool)

(assert (=> start!88908 tp_is_empty!23787))

(declare-fun b!1020280 () Bool)

(assert (=> b!1020280 (= e!574259 false)))

(declare-fun lt!449829 () Bool)

(declare-fun value!188 () B!1720)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun contains!5923 (List!21632 tuple2!15434) Bool)

(assert (=> b!1020280 (= lt!449829 (contains!5923 l!1367 (tuple2!15435 key!393 value!188)))))

(declare-fun b!1020281 () Bool)

(declare-fun tp!71230 () Bool)

(assert (=> b!1020281 (= e!574260 (and tp_is_empty!23787 tp!71230))))

(assert (= (and start!88908 res!683852) b!1020280))

(get-info :version)

(assert (= (and start!88908 ((_ is Cons!21628) l!1367)) b!1020281))

(declare-fun m!940295 () Bool)

(assert (=> start!88908 m!940295))

(declare-fun m!940297 () Bool)

(assert (=> b!1020280 m!940297))

(check-sat (not start!88908) (not b!1020280) (not b!1020281) tp_is_empty!23787)
(check-sat)
