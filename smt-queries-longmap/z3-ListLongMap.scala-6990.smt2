; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88604 () Bool)

(assert start!88604)

(declare-fun res!682800 () Bool)

(declare-fun e!572896 () Bool)

(assert (=> start!88604 (=> (not res!682800) (not e!572896))))

(declare-datatypes ((B!1646 0))(
  ( (B!1647 (val!11907 Int)) )
))
(declare-datatypes ((tuple2!15440 0))(
  ( (tuple2!15441 (_1!7731 (_ BitVec 64)) (_2!7731 B!1646)) )
))
(declare-datatypes ((List!21630 0))(
  ( (Nil!21627) (Cons!21626 (h!22824 tuple2!15440) (t!30622 List!21630)) )
))
(declare-fun l!996 () List!21630)

(declare-fun isStrictlySorted!656 (List!21630) Bool)

(assert (=> start!88604 (= res!682800 (isStrictlySorted!656 l!996))))

(assert (=> start!88604 e!572896))

(declare-fun e!572897 () Bool)

(assert (=> start!88604 e!572897))

(assert (=> start!88604 true))

(declare-fun tp_is_empty!23713 () Bool)

(assert (=> start!88604 tp_is_empty!23713))

(declare-fun b!1018208 () Bool)

(declare-fun res!682801 () Bool)

(assert (=> b!1018208 (=> (not res!682801) (not e!572896))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!520 (List!21630 (_ BitVec 64)) Bool)

(assert (=> b!1018208 (= res!682801 (containsKey!520 l!996 key!261))))

(declare-fun b!1018209 () Bool)

(assert (=> b!1018209 (= e!572896 false)))

(declare-fun value!172 () B!1646)

(declare-fun lt!449335 () List!21630)

(declare-fun insertStrictlySorted!342 (List!21630 (_ BitVec 64) B!1646) List!21630)

(assert (=> b!1018209 (= lt!449335 (insertStrictlySorted!342 l!996 key!261 value!172))))

(declare-fun b!1018210 () Bool)

(declare-fun tp!71038 () Bool)

(assert (=> b!1018210 (= e!572897 (and tp_is_empty!23713 tp!71038))))

(assert (= (and start!88604 res!682800) b!1018208))

(assert (= (and b!1018208 res!682801) b!1018209))

(get-info :version)

(assert (= (and start!88604 ((_ is Cons!21626) l!996)) b!1018210))

(declare-fun m!938647 () Bool)

(assert (=> start!88604 m!938647))

(declare-fun m!938649 () Bool)

(assert (=> b!1018208 m!938649))

(declare-fun m!938651 () Bool)

(assert (=> b!1018209 m!938651))

(check-sat (not start!88604) tp_is_empty!23713 (not b!1018209) (not b!1018210) (not b!1018208))
(check-sat)
