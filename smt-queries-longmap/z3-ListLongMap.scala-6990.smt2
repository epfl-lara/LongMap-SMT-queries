; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88608 () Bool)

(assert start!88608)

(declare-fun res!682873 () Bool)

(declare-fun e!572991 () Bool)

(assert (=> start!88608 (=> (not res!682873) (not e!572991))))

(declare-datatypes ((B!1648 0))(
  ( (B!1649 (val!11908 Int)) )
))
(declare-datatypes ((tuple2!15362 0))(
  ( (tuple2!15363 (_1!7692 (_ BitVec 64)) (_2!7692 B!1648)) )
))
(declare-datatypes ((List!21596 0))(
  ( (Nil!21593) (Cons!21592 (h!22790 tuple2!15362) (t!30597 List!21596)) )
))
(declare-fun l!996 () List!21596)

(declare-fun isStrictlySorted!661 (List!21596) Bool)

(assert (=> start!88608 (= res!682873 (isStrictlySorted!661 l!996))))

(assert (=> start!88608 e!572991))

(declare-fun e!572990 () Bool)

(assert (=> start!88608 e!572990))

(assert (=> start!88608 true))

(declare-fun tp_is_empty!23715 () Bool)

(assert (=> start!88608 tp_is_empty!23715))

(declare-fun b!1018362 () Bool)

(declare-fun res!682874 () Bool)

(assert (=> b!1018362 (=> (not res!682874) (not e!572991))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!521 (List!21596 (_ BitVec 64)) Bool)

(assert (=> b!1018362 (= res!682874 (containsKey!521 l!996 key!261))))

(declare-fun b!1018363 () Bool)

(assert (=> b!1018363 (= e!572991 false)))

(declare-fun value!172 () B!1648)

(declare-fun lt!449538 () List!21596)

(declare-fun insertStrictlySorted!342 (List!21596 (_ BitVec 64) B!1648) List!21596)

(assert (=> b!1018363 (= lt!449538 (insertStrictlySorted!342 l!996 key!261 value!172))))

(declare-fun b!1018364 () Bool)

(declare-fun tp!71041 () Bool)

(assert (=> b!1018364 (= e!572990 (and tp_is_empty!23715 tp!71041))))

(assert (= (and start!88608 res!682873) b!1018362))

(assert (= (and b!1018362 res!682874) b!1018363))

(get-info :version)

(assert (= (and start!88608 ((_ is Cons!21592) l!996)) b!1018364))

(declare-fun m!939271 () Bool)

(assert (=> start!88608 m!939271))

(declare-fun m!939273 () Bool)

(assert (=> b!1018362 m!939273))

(declare-fun m!939275 () Bool)

(assert (=> b!1018363 m!939275))

(check-sat (not b!1018362) (not start!88608) (not b!1018364) tp_is_empty!23715 (not b!1018363))
(check-sat)
