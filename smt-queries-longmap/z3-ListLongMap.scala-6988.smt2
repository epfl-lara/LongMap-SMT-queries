; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88828 () Bool)

(assert start!88828)

(declare-fun res!683315 () Bool)

(declare-fun e!573786 () Bool)

(assert (=> start!88828 (=> (not res!683315) (not e!573786))))

(declare-datatypes ((B!1634 0))(
  ( (B!1635 (val!11901 Int)) )
))
(declare-datatypes ((tuple2!15352 0))(
  ( (tuple2!15353 (_1!7687 (_ BitVec 64)) (_2!7687 B!1634)) )
))
(declare-datatypes ((List!21578 0))(
  ( (Nil!21575) (Cons!21574 (h!22781 tuple2!15352) (t!30571 List!21578)) )
))
(declare-fun l!996 () List!21578)

(declare-fun isStrictlySorted!642 (List!21578) Bool)

(assert (=> start!88828 (= res!683315 (isStrictlySorted!642 l!996))))

(assert (=> start!88828 e!573786))

(declare-fun e!573785 () Bool)

(assert (=> start!88828 e!573785))

(assert (=> start!88828 true))

(declare-fun tp_is_empty!23701 () Bool)

(assert (=> start!88828 tp_is_empty!23701))

(declare-fun b!1019593 () Bool)

(declare-fun res!683314 () Bool)

(assert (=> b!1019593 (=> (not res!683314) (not e!573786))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!516 (List!21578 (_ BitVec 64)) Bool)

(assert (=> b!1019593 (= res!683314 (containsKey!516 l!996 key!261))))

(declare-fun b!1019594 () Bool)

(assert (=> b!1019594 (= e!573786 false)))

(declare-fun value!172 () B!1634)

(declare-fun lt!450023 () List!21578)

(declare-fun insertStrictlySorted!336 (List!21578 (_ BitVec 64) B!1634) List!21578)

(assert (=> b!1019594 (= lt!450023 (insertStrictlySorted!336 l!996 key!261 value!172))))

(declare-fun b!1019595 () Bool)

(declare-fun tp!71020 () Bool)

(assert (=> b!1019595 (= e!573785 (and tp_is_empty!23701 tp!71020))))

(assert (= (and start!88828 res!683315) b!1019593))

(assert (= (and b!1019593 res!683314) b!1019594))

(get-info :version)

(assert (= (and start!88828 ((_ is Cons!21574) l!996)) b!1019595))

(declare-fun m!940857 () Bool)

(assert (=> start!88828 m!940857))

(declare-fun m!940859 () Bool)

(assert (=> b!1019593 m!940859))

(declare-fun m!940861 () Bool)

(assert (=> b!1019594 m!940861))

(check-sat (not b!1019593) (not b!1019594) (not b!1019595) (not start!88828) tp_is_empty!23701)
(check-sat)
