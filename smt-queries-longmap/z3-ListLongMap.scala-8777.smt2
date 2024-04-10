; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106734 () Bool)

(assert start!106734)

(declare-fun b!1267169 () Bool)

(declare-fun res!843514 () Bool)

(declare-fun e!721847 () Bool)

(assert (=> b!1267169 (=> (not res!843514) (not e!721847))))

(declare-datatypes ((B!2056 0))(
  ( (B!2057 (val!16363 Int)) )
))
(declare-datatypes ((tuple2!21244 0))(
  ( (tuple2!21245 (_1!10633 (_ BitVec 64)) (_2!10633 B!2056)) )
))
(declare-datatypes ((List!28355 0))(
  ( (Nil!28352) (Cons!28351 (h!29560 tuple2!21244) (t!41882 List!28355)) )
))
(declare-fun l!874 () List!28355)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!674 (List!28355 (_ BitVec 64)) Bool)

(assert (=> b!1267169 (= res!843514 (not (containsKey!674 l!874 key!235)))))

(declare-fun b!1267170 () Bool)

(assert (=> b!1267170 (= e!721847 (not true))))

(declare-fun removeStrictlySorted!165 (List!28355 (_ BitVec 64)) List!28355)

(assert (=> b!1267170 (= (removeStrictlySorted!165 (t!41882 l!874) key!235) (t!41882 l!874))))

(declare-datatypes ((Unit!42218 0))(
  ( (Unit!42219) )
))
(declare-fun lt!574317 () Unit!42218)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!5 (List!28355 (_ BitVec 64)) Unit!42218)

(assert (=> b!1267170 (= lt!574317 (lemmaRemoveStrictlySortedNotPresentPreserves!5 (t!41882 l!874) key!235))))

(declare-fun b!1267171 () Bool)

(declare-fun res!843510 () Bool)

(assert (=> b!1267171 (=> (not res!843510) (not e!721847))))

(declare-fun isStrictlySorted!815 (List!28355) Bool)

(assert (=> b!1267171 (= res!843510 (isStrictlySorted!815 (t!41882 l!874)))))

(declare-fun res!843513 () Bool)

(assert (=> start!106734 (=> (not res!843513) (not e!721847))))

(assert (=> start!106734 (= res!843513 (isStrictlySorted!815 l!874))))

(assert (=> start!106734 e!721847))

(declare-fun e!721846 () Bool)

(assert (=> start!106734 e!721846))

(assert (=> start!106734 true))

(declare-fun b!1267172 () Bool)

(declare-fun res!843511 () Bool)

(assert (=> b!1267172 (=> (not res!843511) (not e!721847))))

(assert (=> b!1267172 (= res!843511 (not (containsKey!674 (t!41882 l!874) key!235)))))

(declare-fun b!1267173 () Bool)

(declare-fun tp_is_empty!32577 () Bool)

(declare-fun tp!96554 () Bool)

(assert (=> b!1267173 (= e!721846 (and tp_is_empty!32577 tp!96554))))

(declare-fun b!1267174 () Bool)

(declare-fun res!843512 () Bool)

(assert (=> b!1267174 (=> (not res!843512) (not e!721847))))

(get-info :version)

(assert (=> b!1267174 (= res!843512 ((_ is Cons!28351) l!874))))

(assert (= (and start!106734 res!843513) b!1267169))

(assert (= (and b!1267169 res!843514) b!1267174))

(assert (= (and b!1267174 res!843512) b!1267171))

(assert (= (and b!1267171 res!843510) b!1267172))

(assert (= (and b!1267172 res!843511) b!1267170))

(assert (= (and start!106734 ((_ is Cons!28351) l!874)) b!1267173))

(declare-fun m!1166631 () Bool)

(assert (=> b!1267169 m!1166631))

(declare-fun m!1166633 () Bool)

(assert (=> b!1267171 m!1166633))

(declare-fun m!1166635 () Bool)

(assert (=> b!1267170 m!1166635))

(declare-fun m!1166637 () Bool)

(assert (=> b!1267170 m!1166637))

(declare-fun m!1166639 () Bool)

(assert (=> start!106734 m!1166639))

(declare-fun m!1166641 () Bool)

(assert (=> b!1267172 m!1166641))

(check-sat (not b!1267169) (not b!1267170) (not start!106734) tp_is_empty!32577 (not b!1267173) (not b!1267172) (not b!1267171))
(check-sat)
