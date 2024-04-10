; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106732 () Bool)

(assert start!106732)

(declare-fun b!1267152 () Bool)

(declare-fun res!843497 () Bool)

(declare-fun e!721841 () Bool)

(assert (=> b!1267152 (=> (not res!843497) (not e!721841))))

(declare-datatypes ((B!2054 0))(
  ( (B!2055 (val!16362 Int)) )
))
(declare-datatypes ((tuple2!21242 0))(
  ( (tuple2!21243 (_1!10632 (_ BitVec 64)) (_2!10632 B!2054)) )
))
(declare-datatypes ((List!28354 0))(
  ( (Nil!28351) (Cons!28350 (h!29559 tuple2!21242) (t!41881 List!28354)) )
))
(declare-fun l!874 () List!28354)

(assert (=> b!1267152 (= res!843497 (is-Cons!28350 l!874))))

(declare-fun b!1267153 () Bool)

(declare-fun res!843495 () Bool)

(assert (=> b!1267153 (=> (not res!843495) (not e!721841))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!673 (List!28354 (_ BitVec 64)) Bool)

(assert (=> b!1267153 (= res!843495 (not (containsKey!673 l!874 key!235)))))

(declare-fun b!1267154 () Bool)

(assert (=> b!1267154 (= e!721841 (not true))))

(declare-fun removeStrictlySorted!164 (List!28354 (_ BitVec 64)) List!28354)

(assert (=> b!1267154 (= (removeStrictlySorted!164 (t!41881 l!874) key!235) (t!41881 l!874))))

(declare-datatypes ((Unit!42216 0))(
  ( (Unit!42217) )
))
(declare-fun lt!574314 () Unit!42216)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!4 (List!28354 (_ BitVec 64)) Unit!42216)

(assert (=> b!1267154 (= lt!574314 (lemmaRemoveStrictlySortedNotPresentPreserves!4 (t!41881 l!874) key!235))))

(declare-fun b!1267151 () Bool)

(declare-fun res!843498 () Bool)

(assert (=> b!1267151 (=> (not res!843498) (not e!721841))))

(declare-fun isStrictlySorted!814 (List!28354) Bool)

(assert (=> b!1267151 (= res!843498 (isStrictlySorted!814 (t!41881 l!874)))))

(declare-fun res!843499 () Bool)

(assert (=> start!106732 (=> (not res!843499) (not e!721841))))

(assert (=> start!106732 (= res!843499 (isStrictlySorted!814 l!874))))

(assert (=> start!106732 e!721841))

(declare-fun e!721840 () Bool)

(assert (=> start!106732 e!721840))

(assert (=> start!106732 true))

(declare-fun b!1267155 () Bool)

(declare-fun res!843496 () Bool)

(assert (=> b!1267155 (=> (not res!843496) (not e!721841))))

(assert (=> b!1267155 (= res!843496 (not (containsKey!673 (t!41881 l!874) key!235)))))

(declare-fun b!1267156 () Bool)

(declare-fun tp_is_empty!32575 () Bool)

(declare-fun tp!96551 () Bool)

(assert (=> b!1267156 (= e!721840 (and tp_is_empty!32575 tp!96551))))

(assert (= (and start!106732 res!843499) b!1267153))

(assert (= (and b!1267153 res!843495) b!1267152))

(assert (= (and b!1267152 res!843497) b!1267151))

(assert (= (and b!1267151 res!843498) b!1267155))

(assert (= (and b!1267155 res!843496) b!1267154))

(assert (= (and start!106732 (is-Cons!28350 l!874)) b!1267156))

(declare-fun m!1166619 () Bool)

(assert (=> b!1267153 m!1166619))

(declare-fun m!1166621 () Bool)

(assert (=> b!1267154 m!1166621))

(declare-fun m!1166623 () Bool)

(assert (=> b!1267154 m!1166623))

(declare-fun m!1166625 () Bool)

(assert (=> start!106732 m!1166625))

(declare-fun m!1166627 () Bool)

(assert (=> b!1267155 m!1166627))

(declare-fun m!1166629 () Bool)

(assert (=> b!1267151 m!1166629))

(push 1)

(assert (not b!1267156))

(assert (not b!1267153))

(assert (not b!1267151))

(assert (not b!1267154))

(assert (not start!106732))

(assert tp_is_empty!32575)

(assert (not b!1267155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

