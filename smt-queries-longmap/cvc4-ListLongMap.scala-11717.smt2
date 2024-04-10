; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137130 () Bool)

(assert start!137130)

(declare-fun b!1580313 () Bool)

(declare-fun e!881606 () Bool)

(declare-fun e!881607 () Bool)

(assert (=> b!1580313 (= e!881606 e!881607)))

(declare-fun res!1079601 () Bool)

(assert (=> b!1580313 (=> (not res!1079601) (not e!881607))))

(declare-datatypes ((B!2646 0))(
  ( (B!2647 (val!19685 Int)) )
))
(declare-datatypes ((tuple2!25494 0))(
  ( (tuple2!25495 (_1!12758 (_ BitVec 64)) (_2!12758 B!2646)) )
))
(declare-datatypes ((List!36805 0))(
  ( (Nil!36802) (Cons!36801 (h!38344 tuple2!25494) (t!51719 List!36805)) )
))
(declare-fun l!1390 () List!36805)

(declare-fun lt!676746 () tuple2!25494)

(declare-fun contains!10477 (List!36805 tuple2!25494) Bool)

(assert (=> b!1580313 (= res!1079601 (contains!10477 l!1390 lt!676746))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2646)

(assert (=> b!1580313 (= lt!676746 (tuple2!25495 key!405 value!194))))

(declare-fun b!1580314 () Bool)

(declare-fun res!1079597 () Bool)

(declare-fun e!881609 () Bool)

(assert (=> b!1580314 (=> (not res!1079597) (not e!881609))))

(declare-fun isStrictlySorted!1063 (List!36805) Bool)

(assert (=> b!1580314 (= res!1079597 (isStrictlySorted!1063 (t!51719 l!1390)))))

(declare-fun res!1079599 () Bool)

(assert (=> start!137130 (=> (not res!1079599) (not e!881606))))

(assert (=> start!137130 (= res!1079599 (isStrictlySorted!1063 l!1390))))

(assert (=> start!137130 e!881606))

(declare-fun e!881605 () Bool)

(assert (=> start!137130 e!881605))

(assert (=> start!137130 true))

(declare-fun tp_is_empty!39191 () Bool)

(assert (=> start!137130 tp_is_empty!39191))

(declare-fun b!1580315 () Bool)

(declare-fun res!1079594 () Bool)

(assert (=> b!1580315 (=> (not res!1079594) (not e!881609))))

(assert (=> b!1580315 (= res!1079594 (contains!10477 (t!51719 l!1390) lt!676746))))

(declare-fun b!1580316 () Bool)

(declare-fun e!881608 () Bool)

(declare-datatypes ((tuple2!25496 0))(
  ( (tuple2!25497 (_1!12759 tuple2!25494) (_2!12759 List!36805)) )
))
(declare-datatypes ((Option!900 0))(
  ( (Some!899 (v!22397 tuple2!25496)) (None!898) )
))
(declare-fun lt!676747 () Option!900)

(declare-fun get!26784 (Option!900) tuple2!25496)

(assert (=> b!1580316 (= e!881608 (not (is-Nil!36802 (_2!12759 (get!26784 lt!676747)))))))

(declare-fun b!1580317 () Bool)

(assert (=> b!1580317 (= e!881609 (not true))))

(declare-datatypes ((Option!901 0))(
  ( (Some!900 (v!22398 B!2646)) (None!899) )
))
(declare-fun getValueByKey!813 (List!36805 (_ BitVec 64)) Option!901)

(assert (=> b!1580317 (= (getValueByKey!813 (t!51719 l!1390) key!405) (Some!900 value!194))))

(declare-datatypes ((Unit!52244 0))(
  ( (Unit!52245) )
))
(declare-fun lt!676745 () Unit!52244)

(declare-fun lemmaContainsTupThenGetReturnValue!399 (List!36805 (_ BitVec 64) B!2646) Unit!52244)

(assert (=> b!1580317 (= lt!676745 (lemmaContainsTupThenGetReturnValue!399 (t!51719 l!1390) key!405 value!194))))

(declare-fun b!1580318 () Bool)

(declare-fun res!1079596 () Bool)

(assert (=> b!1580318 (=> (not res!1079596) (not e!881606))))

(declare-fun containsKey!909 (List!36805 (_ BitVec 64)) Bool)

(assert (=> b!1580318 (= res!1079596 (containsKey!909 l!1390 key!405))))

(declare-fun b!1580319 () Bool)

(declare-fun res!1079593 () Bool)

(assert (=> b!1580319 (=> (not res!1079593) (not e!881609))))

(assert (=> b!1580319 (= res!1079593 (and (or (not (is-Cons!36801 l!1390)) (not (= (_1!12758 (h!38344 l!1390)) key!405))) (is-Cons!36801 l!1390)))))

(declare-fun b!1580320 () Bool)

(assert (=> b!1580320 (= e!881607 e!881609)))

(declare-fun res!1079595 () Bool)

(assert (=> b!1580320 (=> (not res!1079595) (not e!881609))))

(assert (=> b!1580320 (= res!1079595 e!881608)))

(declare-fun res!1079600 () Bool)

(assert (=> b!1580320 (=> res!1079600 e!881608)))

(declare-fun isEmpty!1165 (Option!900) Bool)

(assert (=> b!1580320 (= res!1079600 (isEmpty!1165 lt!676747))))

(declare-fun unapply!81 (List!36805) Option!900)

(assert (=> b!1580320 (= lt!676747 (unapply!81 l!1390))))

(declare-fun b!1580321 () Bool)

(declare-fun tp!114447 () Bool)

(assert (=> b!1580321 (= e!881605 (and tp_is_empty!39191 tp!114447))))

(declare-fun b!1580322 () Bool)

(declare-fun res!1079598 () Bool)

(assert (=> b!1580322 (=> (not res!1079598) (not e!881609))))

(assert (=> b!1580322 (= res!1079598 (containsKey!909 (t!51719 l!1390) key!405))))

(assert (= (and start!137130 res!1079599) b!1580318))

(assert (= (and b!1580318 res!1079596) b!1580313))

(assert (= (and b!1580313 res!1079601) b!1580320))

(assert (= (and b!1580320 (not res!1079600)) b!1580316))

(assert (= (and b!1580320 res!1079595) b!1580319))

(assert (= (and b!1580319 res!1079593) b!1580314))

(assert (= (and b!1580314 res!1079597) b!1580322))

(assert (= (and b!1580322 res!1079598) b!1580315))

(assert (= (and b!1580315 res!1079594) b!1580317))

(assert (= (and start!137130 (is-Cons!36801 l!1390)) b!1580321))

(declare-fun m!1451775 () Bool)

(assert (=> b!1580317 m!1451775))

(declare-fun m!1451777 () Bool)

(assert (=> b!1580317 m!1451777))

(declare-fun m!1451779 () Bool)

(assert (=> start!137130 m!1451779))

(declare-fun m!1451781 () Bool)

(assert (=> b!1580314 m!1451781))

(declare-fun m!1451783 () Bool)

(assert (=> b!1580320 m!1451783))

(declare-fun m!1451785 () Bool)

(assert (=> b!1580320 m!1451785))

(declare-fun m!1451787 () Bool)

(assert (=> b!1580318 m!1451787))

(declare-fun m!1451789 () Bool)

(assert (=> b!1580316 m!1451789))

(declare-fun m!1451791 () Bool)

(assert (=> b!1580315 m!1451791))

(declare-fun m!1451793 () Bool)

(assert (=> b!1580322 m!1451793))

(declare-fun m!1451795 () Bool)

(assert (=> b!1580313 m!1451795))

(push 1)

