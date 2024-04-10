; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88604 () Bool)

(assert start!88604)

(declare-fun b!1018341 () Bool)

(declare-fun res!682860 () Bool)

(declare-fun e!572979 () Bool)

(assert (=> b!1018341 (=> (not res!682860) (not e!572979))))

(declare-datatypes ((B!1644 0))(
  ( (B!1645 (val!11906 Int)) )
))
(declare-datatypes ((tuple2!15358 0))(
  ( (tuple2!15359 (_1!7690 (_ BitVec 64)) (_2!7690 B!1644)) )
))
(declare-datatypes ((List!21594 0))(
  ( (Nil!21591) (Cons!21590 (h!22788 tuple2!15358) (t!30595 List!21594)) )
))
(declare-fun l!996 () List!21594)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!519 (List!21594 (_ BitVec 64)) Bool)

(assert (=> b!1018341 (= res!682860 (containsKey!519 (t!30595 l!996) key!261))))

(declare-fun res!682858 () Bool)

(declare-fun e!572978 () Bool)

(assert (=> start!88604 (=> (not res!682858) (not e!572978))))

(declare-fun isStrictlySorted!659 (List!21594) Bool)

(assert (=> start!88604 (= res!682858 (isStrictlySorted!659 l!996))))

(assert (=> start!88604 e!572978))

(declare-fun e!572977 () Bool)

(assert (=> start!88604 e!572977))

(assert (=> start!88604 true))

(declare-fun tp_is_empty!23711 () Bool)

(assert (=> start!88604 tp_is_empty!23711))

(declare-fun b!1018342 () Bool)

(declare-fun res!682861 () Bool)

(assert (=> b!1018342 (=> (not res!682861) (not e!572978))))

(assert (=> b!1018342 (= res!682861 (containsKey!519 l!996 key!261))))

(declare-fun b!1018343 () Bool)

(declare-fun tp!71035 () Bool)

(assert (=> b!1018343 (= e!572977 (and tp_is_empty!23711 tp!71035))))

(declare-fun b!1018344 () Bool)

(assert (=> b!1018344 (= e!572979 (not true))))

(declare-fun value!172 () B!1644)

(declare-fun length!43 (List!21594) Int)

(declare-fun insertStrictlySorted!340 (List!21594 (_ BitVec 64) B!1644) List!21594)

(assert (=> b!1018344 (= (length!43 (insertStrictlySorted!340 (t!30595 l!996) key!261 value!172)) (length!43 (t!30595 l!996)))))

(declare-datatypes ((Unit!33285 0))(
  ( (Unit!33286) )
))
(declare-fun lt!449532 () Unit!33285)

(declare-fun lemmaAddExistingKeyPreservesSize!3 (List!21594 (_ BitVec 64) B!1644) Unit!33285)

(assert (=> b!1018344 (= lt!449532 (lemmaAddExistingKeyPreservesSize!3 (t!30595 l!996) key!261 value!172))))

(declare-fun b!1018345 () Bool)

(assert (=> b!1018345 (= e!572978 e!572979)))

(declare-fun res!682862 () Bool)

(assert (=> b!1018345 (=> (not res!682862) (not e!572979))))

(assert (=> b!1018345 (= res!682862 (and (is-Cons!21590 l!996) (bvslt (_1!7690 (h!22788 l!996)) key!261)))))

(declare-fun lt!449531 () List!21594)

(assert (=> b!1018345 (= lt!449531 (insertStrictlySorted!340 l!996 key!261 value!172))))

(declare-fun b!1018346 () Bool)

(declare-fun res!682859 () Bool)

(assert (=> b!1018346 (=> (not res!682859) (not e!572979))))

(assert (=> b!1018346 (= res!682859 (isStrictlySorted!659 (t!30595 l!996)))))

(assert (= (and start!88604 res!682858) b!1018342))

(assert (= (and b!1018342 res!682861) b!1018345))

(assert (= (and b!1018345 res!682862) b!1018346))

(assert (= (and b!1018346 res!682859) b!1018341))

(assert (= (and b!1018341 res!682860) b!1018344))

(assert (= (and start!88604 (is-Cons!21590 l!996)) b!1018343))

(declare-fun m!939247 () Bool)

(assert (=> b!1018345 m!939247))

(declare-fun m!939249 () Bool)

(assert (=> b!1018341 m!939249))

(declare-fun m!939251 () Bool)

(assert (=> b!1018346 m!939251))

(declare-fun m!939253 () Bool)

(assert (=> b!1018342 m!939253))

(declare-fun m!939255 () Bool)

(assert (=> b!1018344 m!939255))

(assert (=> b!1018344 m!939255))

(declare-fun m!939257 () Bool)

(assert (=> b!1018344 m!939257))

(declare-fun m!939259 () Bool)

(assert (=> b!1018344 m!939259))

(declare-fun m!939261 () Bool)

(assert (=> b!1018344 m!939261))

(declare-fun m!939263 () Bool)

(assert (=> start!88604 m!939263))

(push 1)

(assert tp_is_empty!23711)

