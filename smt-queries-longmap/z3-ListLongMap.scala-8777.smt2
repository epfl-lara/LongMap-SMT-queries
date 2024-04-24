; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106956 () Bool)

(assert start!106956)

(declare-fun b!1268456 () Bool)

(declare-fun res!844019 () Bool)

(declare-fun e!722687 () Bool)

(assert (=> b!1268456 (=> (not res!844019) (not e!722687))))

(declare-datatypes ((B!2054 0))(
  ( (B!2055 (val!16362 Int)) )
))
(declare-datatypes ((tuple2!21252 0))(
  ( (tuple2!21253 (_1!10637 (_ BitVec 64)) (_2!10637 B!2054)) )
))
(declare-datatypes ((List!28390 0))(
  ( (Nil!28387) (Cons!28386 (h!29604 tuple2!21252) (t!41909 List!28390)) )
))
(declare-fun l!874 () List!28390)

(get-info :version)

(assert (=> b!1268456 (= res!844019 ((_ is Cons!28386) l!874))))

(declare-fun res!844018 () Bool)

(assert (=> start!106956 (=> (not res!844018) (not e!722687))))

(declare-fun isStrictlySorted!802 (List!28390) Bool)

(assert (=> start!106956 (= res!844018 (isStrictlySorted!802 l!874))))

(assert (=> start!106956 e!722687))

(declare-fun e!722688 () Bool)

(assert (=> start!106956 e!722688))

(assert (=> start!106956 true))

(declare-fun b!1268457 () Bool)

(declare-fun res!844017 () Bool)

(assert (=> b!1268457 (=> (not res!844017) (not e!722687))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!673 (List!28390 (_ BitVec 64)) Bool)

(assert (=> b!1268457 (= res!844017 (not (containsKey!673 l!874 key!235)))))

(declare-fun b!1268458 () Bool)

(declare-fun res!844015 () Bool)

(assert (=> b!1268458 (=> (not res!844015) (not e!722687))))

(assert (=> b!1268458 (= res!844015 (not (containsKey!673 (t!41909 l!874) key!235)))))

(declare-fun b!1268459 () Bool)

(declare-fun tp_is_empty!32575 () Bool)

(declare-fun tp!96551 () Bool)

(assert (=> b!1268459 (= e!722688 (and tp_is_empty!32575 tp!96551))))

(declare-fun b!1268460 () Bool)

(assert (=> b!1268460 (= e!722687 (not true))))

(declare-fun removeStrictlySorted!163 (List!28390 (_ BitVec 64)) List!28390)

(assert (=> b!1268460 (= (removeStrictlySorted!163 (t!41909 l!874) key!235) (t!41909 l!874))))

(declare-datatypes ((Unit!42189 0))(
  ( (Unit!42190) )
))
(declare-fun lt!574798 () Unit!42189)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!4 (List!28390 (_ BitVec 64)) Unit!42189)

(assert (=> b!1268460 (= lt!574798 (lemmaRemoveStrictlySortedNotPresentPreserves!4 (t!41909 l!874) key!235))))

(declare-fun b!1268461 () Bool)

(declare-fun res!844016 () Bool)

(assert (=> b!1268461 (=> (not res!844016) (not e!722687))))

(assert (=> b!1268461 (= res!844016 (isStrictlySorted!802 (t!41909 l!874)))))

(assert (= (and start!106956 res!844018) b!1268457))

(assert (= (and b!1268457 res!844017) b!1268456))

(assert (= (and b!1268456 res!844019) b!1268461))

(assert (= (and b!1268461 res!844016) b!1268458))

(assert (= (and b!1268458 res!844015) b!1268460))

(assert (= (and start!106956 ((_ is Cons!28386) l!874)) b!1268459))

(declare-fun m!1168231 () Bool)

(assert (=> b!1268458 m!1168231))

(declare-fun m!1168233 () Bool)

(assert (=> b!1268460 m!1168233))

(declare-fun m!1168235 () Bool)

(assert (=> b!1268460 m!1168235))

(declare-fun m!1168237 () Bool)

(assert (=> b!1268457 m!1168237))

(declare-fun m!1168239 () Bool)

(assert (=> start!106956 m!1168239))

(declare-fun m!1168241 () Bool)

(assert (=> b!1268461 m!1168241))

(check-sat (not b!1268461) (not start!106956) (not b!1268459) (not b!1268457) (not b!1268458) (not b!1268460) tp_is_empty!32575)
(check-sat)
