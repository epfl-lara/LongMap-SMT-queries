; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88840 () Bool)

(assert start!88840)

(declare-fun res!683378 () Bool)

(declare-fun e!573831 () Bool)

(assert (=> start!88840 (=> (not res!683378) (not e!573831))))

(declare-datatypes ((B!1646 0))(
  ( (B!1647 (val!11907 Int)) )
))
(declare-datatypes ((tuple2!15364 0))(
  ( (tuple2!15365 (_1!7693 (_ BitVec 64)) (_2!7693 B!1646)) )
))
(declare-datatypes ((List!21584 0))(
  ( (Nil!21581) (Cons!21580 (h!22787 tuple2!15364) (t!30577 List!21584)) )
))
(declare-fun l!996 () List!21584)

(declare-fun isStrictlySorted!648 (List!21584) Bool)

(assert (=> start!88840 (= res!683378 (isStrictlySorted!648 l!996))))

(assert (=> start!88840 e!573831))

(declare-fun e!573830 () Bool)

(assert (=> start!88840 e!573830))

(assert (=> start!88840 true))

(declare-fun tp_is_empty!23713 () Bool)

(assert (=> start!88840 tp_is_empty!23713))

(declare-fun b!1019674 () Bool)

(declare-fun res!683377 () Bool)

(assert (=> b!1019674 (=> (not res!683377) (not e!573831))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!522 (List!21584 (_ BitVec 64)) Bool)

(assert (=> b!1019674 (= res!683377 (containsKey!522 l!996 key!261))))

(declare-fun b!1019675 () Bool)

(assert (=> b!1019675 (= e!573831 false)))

(declare-fun value!172 () B!1646)

(declare-fun lt!450050 () List!21584)

(declare-fun insertStrictlySorted!342 (List!21584 (_ BitVec 64) B!1646) List!21584)

(assert (=> b!1019675 (= lt!450050 (insertStrictlySorted!342 l!996 key!261 value!172))))

(declare-fun b!1019676 () Bool)

(declare-fun tp!71038 () Bool)

(assert (=> b!1019676 (= e!573830 (and tp_is_empty!23713 tp!71038))))

(assert (= (and start!88840 res!683378) b!1019674))

(assert (= (and b!1019674 res!683377) b!1019675))

(get-info :version)

(assert (= (and start!88840 ((_ is Cons!21580) l!996)) b!1019676))

(declare-fun m!940929 () Bool)

(assert (=> start!88840 m!940929))

(declare-fun m!940931 () Bool)

(assert (=> b!1019674 m!940931))

(declare-fun m!940933 () Bool)

(assert (=> b!1019675 m!940933))

(check-sat (not b!1019676) (not b!1019674) (not start!88840) tp_is_empty!23713 (not b!1019675))
(check-sat)
