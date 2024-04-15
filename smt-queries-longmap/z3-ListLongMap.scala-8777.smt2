; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106728 () Bool)

(assert start!106728)

(declare-fun b!1267069 () Bool)

(declare-fun e!721796 () Bool)

(declare-fun tp_is_empty!32575 () Bool)

(declare-fun tp!96551 () Bool)

(assert (=> b!1267069 (= e!721796 (and tp_is_empty!32575 tp!96551))))

(declare-fun b!1267070 () Bool)

(declare-fun res!843456 () Bool)

(declare-fun e!721795 () Bool)

(assert (=> b!1267070 (=> (not res!843456) (not e!721795))))

(declare-datatypes ((B!2054 0))(
  ( (B!2055 (val!16362 Int)) )
))
(declare-datatypes ((tuple2!21324 0))(
  ( (tuple2!21325 (_1!10673 (_ BitVec 64)) (_2!10673 B!2054)) )
))
(declare-datatypes ((List!28438 0))(
  ( (Nil!28435) (Cons!28434 (h!29643 tuple2!21324) (t!41956 List!28438)) )
))
(declare-fun l!874 () List!28438)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!671 (List!28438 (_ BitVec 64)) Bool)

(assert (=> b!1267070 (= res!843456 (not (containsKey!671 (t!41956 l!874) key!235)))))

(declare-fun res!843458 () Bool)

(assert (=> start!106728 (=> (not res!843458) (not e!721795))))

(declare-fun isStrictlySorted!810 (List!28438) Bool)

(assert (=> start!106728 (= res!843458 (isStrictlySorted!810 l!874))))

(assert (=> start!106728 e!721795))

(assert (=> start!106728 e!721796))

(assert (=> start!106728 true))

(declare-fun b!1267071 () Bool)

(declare-fun res!843457 () Bool)

(assert (=> b!1267071 (=> (not res!843457) (not e!721795))))

(get-info :version)

(assert (=> b!1267071 (= res!843457 ((_ is Cons!28434) l!874))))

(declare-fun b!1267072 () Bool)

(assert (=> b!1267072 (= e!721795 (not true))))

(declare-fun removeStrictlySorted!164 (List!28438 (_ BitVec 64)) List!28438)

(assert (=> b!1267072 (= (removeStrictlySorted!164 (t!41956 l!874) key!235) (t!41956 l!874))))

(declare-datatypes ((Unit!42066 0))(
  ( (Unit!42067) )
))
(declare-fun lt!574135 () Unit!42066)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!4 (List!28438 (_ BitVec 64)) Unit!42066)

(assert (=> b!1267072 (= lt!574135 (lemmaRemoveStrictlySortedNotPresentPreserves!4 (t!41956 l!874) key!235))))

(declare-fun b!1267073 () Bool)

(declare-fun res!843459 () Bool)

(assert (=> b!1267073 (=> (not res!843459) (not e!721795))))

(assert (=> b!1267073 (= res!843459 (isStrictlySorted!810 (t!41956 l!874)))))

(declare-fun b!1267074 () Bool)

(declare-fun res!843455 () Bool)

(assert (=> b!1267074 (=> (not res!843455) (not e!721795))))

(assert (=> b!1267074 (= res!843455 (not (containsKey!671 l!874 key!235)))))

(assert (= (and start!106728 res!843458) b!1267074))

(assert (= (and b!1267074 res!843455) b!1267071))

(assert (= (and b!1267071 res!843457) b!1267073))

(assert (= (and b!1267073 res!843459) b!1267070))

(assert (= (and b!1267070 res!843456) b!1267072))

(assert (= (and start!106728 ((_ is Cons!28434) l!874)) b!1267069))

(declare-fun m!1166099 () Bool)

(assert (=> b!1267070 m!1166099))

(declare-fun m!1166101 () Bool)

(assert (=> b!1267074 m!1166101))

(declare-fun m!1166103 () Bool)

(assert (=> start!106728 m!1166103))

(declare-fun m!1166105 () Bool)

(assert (=> b!1267073 m!1166105))

(declare-fun m!1166107 () Bool)

(assert (=> b!1267072 m!1166107))

(declare-fun m!1166109 () Bool)

(assert (=> b!1267072 m!1166109))

(check-sat (not b!1267073) (not b!1267069) (not b!1267074) (not start!106728) (not b!1267070) (not b!1267072) tp_is_empty!32575)
(check-sat)
