; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137486 () Bool)

(assert start!137486)

(declare-fun res!1080582 () Bool)

(declare-fun e!882515 () Bool)

(assert (=> start!137486 (=> (not res!1080582) (not e!882515))))

(declare-datatypes ((B!2714 0))(
  ( (B!2715 (val!19719 Int)) )
))
(declare-datatypes ((tuple2!25674 0))(
  ( (tuple2!25675 (_1!12848 (_ BitVec 64)) (_2!12848 B!2714)) )
))
(declare-datatypes ((List!36880 0))(
  ( (Nil!36877) (Cons!36876 (h!38420 tuple2!25674) (t!51786 List!36880)) )
))
(declare-fun l!1390 () List!36880)

(declare-fun isStrictlySorted!1095 (List!36880) Bool)

(assert (=> start!137486 (= res!1080582 (isStrictlySorted!1095 l!1390))))

(assert (=> start!137486 e!882515))

(declare-fun e!882514 () Bool)

(assert (=> start!137486 e!882514))

(assert (=> start!137486 true))

(declare-fun tp_is_empty!39259 () Bool)

(assert (=> start!137486 tp_is_empty!39259))

(declare-fun b!1581559 () Bool)

(declare-fun res!1080581 () Bool)

(assert (=> b!1581559 (=> (not res!1080581) (not e!882515))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!941 (List!36880 (_ BitVec 64)) Bool)

(assert (=> b!1581559 (= res!1080581 (containsKey!941 l!1390 key!405))))

(declare-fun b!1581560 () Bool)

(assert (=> b!1581560 (= e!882515 false)))

(declare-fun value!194 () B!2714)

(declare-fun lt!676745 () Bool)

(declare-fun contains!10466 (List!36880 tuple2!25674) Bool)

(assert (=> b!1581560 (= lt!676745 (contains!10466 l!1390 (tuple2!25675 key!405 value!194)))))

(declare-fun b!1581561 () Bool)

(declare-fun tp!114624 () Bool)

(assert (=> b!1581561 (= e!882514 (and tp_is_empty!39259 tp!114624))))

(assert (= (and start!137486 res!1080582) b!1581559))

(assert (= (and b!1581559 res!1080581) b!1581560))

(get-info :version)

(assert (= (and start!137486 ((_ is Cons!36876) l!1390)) b!1581561))

(declare-fun m!1451761 () Bool)

(assert (=> start!137486 m!1451761))

(declare-fun m!1451763 () Bool)

(assert (=> b!1581559 m!1451763))

(declare-fun m!1451765 () Bool)

(assert (=> b!1581560 m!1451765))

(check-sat (not b!1581559) (not start!137486) (not b!1581561) (not b!1581560) tp_is_empty!39259)
(check-sat)
