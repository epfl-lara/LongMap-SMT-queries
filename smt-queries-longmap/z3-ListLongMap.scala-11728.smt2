; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137480 () Bool)

(assert start!137480)

(declare-fun res!1080564 () Bool)

(declare-fun e!882496 () Bool)

(assert (=> start!137480 (=> (not res!1080564) (not e!882496))))

(declare-datatypes ((B!2708 0))(
  ( (B!2709 (val!19716 Int)) )
))
(declare-datatypes ((tuple2!25668 0))(
  ( (tuple2!25669 (_1!12845 (_ BitVec 64)) (_2!12845 B!2708)) )
))
(declare-datatypes ((List!36877 0))(
  ( (Nil!36874) (Cons!36873 (h!38417 tuple2!25668) (t!51783 List!36877)) )
))
(declare-fun l!1390 () List!36877)

(declare-fun isStrictlySorted!1092 (List!36877) Bool)

(assert (=> start!137480 (= res!1080564 (isStrictlySorted!1092 l!1390))))

(assert (=> start!137480 e!882496))

(declare-fun e!882497 () Bool)

(assert (=> start!137480 e!882497))

(assert (=> start!137480 true))

(declare-fun tp_is_empty!39253 () Bool)

(assert (=> start!137480 tp_is_empty!39253))

(declare-fun b!1581532 () Bool)

(declare-fun res!1080563 () Bool)

(assert (=> b!1581532 (=> (not res!1080563) (not e!882496))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!938 (List!36877 (_ BitVec 64)) Bool)

(assert (=> b!1581532 (= res!1080563 (containsKey!938 l!1390 key!405))))

(declare-fun b!1581533 () Bool)

(assert (=> b!1581533 (= e!882496 false)))

(declare-fun value!194 () B!2708)

(declare-fun lt!676736 () Bool)

(declare-fun contains!10463 (List!36877 tuple2!25668) Bool)

(assert (=> b!1581533 (= lt!676736 (contains!10463 l!1390 (tuple2!25669 key!405 value!194)))))

(declare-fun b!1581534 () Bool)

(declare-fun tp!114615 () Bool)

(assert (=> b!1581534 (= e!882497 (and tp_is_empty!39253 tp!114615))))

(assert (= (and start!137480 res!1080564) b!1581532))

(assert (= (and b!1581532 res!1080563) b!1581533))

(get-info :version)

(assert (= (and start!137480 ((_ is Cons!36873) l!1390)) b!1581534))

(declare-fun m!1451743 () Bool)

(assert (=> start!137480 m!1451743))

(declare-fun m!1451745 () Bool)

(assert (=> b!1581532 m!1451745))

(declare-fun m!1451747 () Bool)

(assert (=> b!1581533 m!1451747))

(check-sat (not start!137480) tp_is_empty!39253 (not b!1581533) (not b!1581532) (not b!1581534))
(check-sat)
