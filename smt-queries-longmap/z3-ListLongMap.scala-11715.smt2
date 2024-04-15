; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137080 () Bool)

(assert start!137080)

(declare-fun b!1579776 () Bool)

(declare-fun res!1079266 () Bool)

(declare-fun e!881290 () Bool)

(assert (=> b!1579776 (=> (not res!1079266) (not e!881290))))

(declare-datatypes ((B!2630 0))(
  ( (B!2631 (val!19677 Int)) )
))
(declare-datatypes ((tuple2!25530 0))(
  ( (tuple2!25531 (_1!12776 (_ BitVec 64)) (_2!12776 B!2630)) )
))
(declare-datatypes ((List!36838 0))(
  ( (Nil!36835) (Cons!36834 (h!38378 tuple2!25530) (t!51744 List!36838)) )
))
(declare-fun l!1390 () List!36838)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!899 (List!36838 (_ BitVec 64)) Bool)

(assert (=> b!1579776 (= res!1079266 (containsKey!899 l!1390 key!405))))

(declare-fun b!1579777 () Bool)

(declare-fun res!1079268 () Bool)

(declare-fun e!881291 () Bool)

(assert (=> b!1579777 (=> (not res!1079268) (not e!881291))))

(declare-fun isStrictlySorted!1053 (List!36838) Bool)

(assert (=> b!1579777 (= res!1079268 (isStrictlySorted!1053 (t!51744 l!1390)))))

(declare-fun b!1579778 () Bool)

(assert (=> b!1579778 (= e!881291 (not true))))

(declare-fun lt!676390 () tuple2!25530)

(declare-fun contains!10424 (List!36838 tuple2!25530) Bool)

(assert (=> b!1579778 (not (contains!10424 (t!51744 l!1390) lt!676390))))

(declare-datatypes ((Unit!52042 0))(
  ( (Unit!52043) )
))
(declare-fun lt!676391 () Unit!52042)

(declare-fun value!194 () B!2630)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!1 (List!36838 (_ BitVec 64) B!2630) Unit!52042)

(assert (=> b!1579778 (= lt!676391 (lemmaNotContainsKeyThenNotContainsTuple!1 (t!51744 l!1390) key!405 value!194))))

(declare-fun res!1079264 () Bool)

(assert (=> start!137080 (=> (not res!1079264) (not e!881290))))

(assert (=> start!137080 (= res!1079264 (isStrictlySorted!1053 l!1390))))

(assert (=> start!137080 e!881290))

(declare-fun e!881289 () Bool)

(assert (=> start!137080 e!881289))

(assert (=> start!137080 true))

(declare-fun tp_is_empty!39175 () Bool)

(assert (=> start!137080 tp_is_empty!39175))

(declare-fun b!1579779 () Bool)

(declare-fun e!881287 () Bool)

(assert (=> b!1579779 (= e!881290 e!881287)))

(declare-fun res!1079269 () Bool)

(assert (=> b!1579779 (=> (not res!1079269) (not e!881287))))

(assert (=> b!1579779 (= res!1079269 (contains!10424 l!1390 lt!676390))))

(assert (=> b!1579779 (= lt!676390 (tuple2!25531 key!405 value!194))))

(declare-fun b!1579780 () Bool)

(declare-fun tp!114424 () Bool)

(assert (=> b!1579780 (= e!881289 (and tp_is_empty!39175 tp!114424))))

(declare-fun b!1579781 () Bool)

(declare-fun e!881288 () Bool)

(declare-datatypes ((tuple2!25532 0))(
  ( (tuple2!25533 (_1!12777 tuple2!25530) (_2!12777 List!36838)) )
))
(declare-datatypes ((Option!892 0))(
  ( (Some!891 (v!22383 tuple2!25532)) (None!890) )
))
(declare-fun lt!676392 () Option!892)

(get-info :version)

(declare-fun get!26769 (Option!892) tuple2!25532)

(assert (=> b!1579781 (= e!881288 (not ((_ is Nil!36835) (_2!12777 (get!26769 lt!676392)))))))

(declare-fun b!1579782 () Bool)

(declare-fun res!1079270 () Bool)

(assert (=> b!1579782 (=> (not res!1079270) (not e!881291))))

(assert (=> b!1579782 (= res!1079270 (and ((_ is Cons!36834) l!1390) (= (_1!12776 (h!38378 l!1390)) key!405)))))

(declare-fun b!1579783 () Bool)

(declare-fun res!1079265 () Bool)

(assert (=> b!1579783 (=> (not res!1079265) (not e!881291))))

(assert (=> b!1579783 (= res!1079265 (not (containsKey!899 (t!51744 l!1390) key!405)))))

(declare-fun b!1579784 () Bool)

(assert (=> b!1579784 (= e!881287 e!881291)))

(declare-fun res!1079271 () Bool)

(assert (=> b!1579784 (=> (not res!1079271) (not e!881291))))

(assert (=> b!1579784 (= res!1079271 e!881288)))

(declare-fun res!1079267 () Bool)

(assert (=> b!1579784 (=> res!1079267 e!881288)))

(declare-fun isEmpty!1161 (Option!892) Bool)

(assert (=> b!1579784 (= res!1079267 (isEmpty!1161 lt!676392))))

(declare-fun unapply!73 (List!36838) Option!892)

(assert (=> b!1579784 (= lt!676392 (unapply!73 l!1390))))

(assert (= (and start!137080 res!1079264) b!1579776))

(assert (= (and b!1579776 res!1079266) b!1579779))

(assert (= (and b!1579779 res!1079269) b!1579784))

(assert (= (and b!1579784 (not res!1079267)) b!1579781))

(assert (= (and b!1579784 res!1079271) b!1579782))

(assert (= (and b!1579782 res!1079270) b!1579777))

(assert (= (and b!1579777 res!1079268) b!1579783))

(assert (= (and b!1579783 res!1079265) b!1579778))

(assert (= (and start!137080 ((_ is Cons!36834) l!1390)) b!1579780))

(declare-fun m!1450737 () Bool)

(assert (=> b!1579777 m!1450737))

(declare-fun m!1450739 () Bool)

(assert (=> b!1579783 m!1450739))

(declare-fun m!1450741 () Bool)

(assert (=> b!1579779 m!1450741))

(declare-fun m!1450743 () Bool)

(assert (=> b!1579776 m!1450743))

(declare-fun m!1450745 () Bool)

(assert (=> start!137080 m!1450745))

(declare-fun m!1450747 () Bool)

(assert (=> b!1579778 m!1450747))

(declare-fun m!1450749 () Bool)

(assert (=> b!1579778 m!1450749))

(declare-fun m!1450751 () Bool)

(assert (=> b!1579781 m!1450751))

(declare-fun m!1450753 () Bool)

(assert (=> b!1579784 m!1450753))

(declare-fun m!1450755 () Bool)

(assert (=> b!1579784 m!1450755))

(check-sat tp_is_empty!39175 (not b!1579777) (not b!1579783) (not b!1579779) (not b!1579778) (not start!137080) (not b!1579784) (not b!1579776) (not b!1579780) (not b!1579781))
(check-sat)
