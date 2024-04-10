; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137126 () Bool)

(assert start!137126)

(declare-fun b!1580253 () Bool)

(declare-fun res!1079545 () Bool)

(declare-fun e!881576 () Bool)

(assert (=> b!1580253 (=> (not res!1079545) (not e!881576))))

(declare-datatypes ((B!2642 0))(
  ( (B!2643 (val!19683 Int)) )
))
(declare-datatypes ((tuple2!25486 0))(
  ( (tuple2!25487 (_1!12754 (_ BitVec 64)) (_2!12754 B!2642)) )
))
(declare-datatypes ((List!36803 0))(
  ( (Nil!36800) (Cons!36799 (h!38342 tuple2!25486) (t!51717 List!36803)) )
))
(declare-fun l!1390 () List!36803)

(declare-fun lt!676728 () tuple2!25486)

(declare-fun contains!10475 (List!36803 tuple2!25486) Bool)

(assert (=> b!1580253 (= res!1079545 (contains!10475 (t!51717 l!1390) lt!676728))))

(declare-fun b!1580254 () Bool)

(declare-fun e!881579 () Bool)

(assert (=> b!1580254 (= e!881579 e!881576)))

(declare-fun res!1079544 () Bool)

(assert (=> b!1580254 (=> (not res!1079544) (not e!881576))))

(declare-fun e!881578 () Bool)

(assert (=> b!1580254 (= res!1079544 e!881578)))

(declare-fun res!1079542 () Bool)

(assert (=> b!1580254 (=> res!1079542 e!881578)))

(declare-datatypes ((tuple2!25488 0))(
  ( (tuple2!25489 (_1!12755 tuple2!25486) (_2!12755 List!36803)) )
))
(declare-datatypes ((Option!896 0))(
  ( (Some!895 (v!22393 tuple2!25488)) (None!894) )
))
(declare-fun lt!676727 () Option!896)

(declare-fun isEmpty!1163 (Option!896) Bool)

(assert (=> b!1580254 (= res!1079542 (isEmpty!1163 lt!676727))))

(declare-fun unapply!79 (List!36803) Option!896)

(assert (=> b!1580254 (= lt!676727 (unapply!79 l!1390))))

(declare-fun b!1580255 () Bool)

(declare-fun res!1079546 () Bool)

(declare-fun e!881577 () Bool)

(assert (=> b!1580255 (=> (not res!1079546) (not e!881577))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!907 (List!36803 (_ BitVec 64)) Bool)

(assert (=> b!1580255 (= res!1079546 (containsKey!907 l!1390 key!405))))

(declare-fun b!1580256 () Bool)

(declare-fun res!1079547 () Bool)

(assert (=> b!1580256 (=> (not res!1079547) (not e!881576))))

(declare-fun isStrictlySorted!1061 (List!36803) Bool)

(assert (=> b!1580256 (= res!1079547 (isStrictlySorted!1061 (t!51717 l!1390)))))

(declare-fun b!1580257 () Bool)

(declare-fun e!881575 () Bool)

(declare-fun tp_is_empty!39187 () Bool)

(declare-fun tp!114441 () Bool)

(assert (=> b!1580257 (= e!881575 (and tp_is_empty!39187 tp!114441))))

(declare-fun b!1580258 () Bool)

(assert (=> b!1580258 (= e!881576 (not true))))

(declare-fun value!194 () B!2642)

(declare-datatypes ((Option!897 0))(
  ( (Some!896 (v!22394 B!2642)) (None!895) )
))
(declare-fun getValueByKey!811 (List!36803 (_ BitVec 64)) Option!897)

(assert (=> b!1580258 (= (getValueByKey!811 (t!51717 l!1390) key!405) (Some!896 value!194))))

(declare-datatypes ((Unit!52240 0))(
  ( (Unit!52241) )
))
(declare-fun lt!676729 () Unit!52240)

(declare-fun lemmaContainsTupThenGetReturnValue!397 (List!36803 (_ BitVec 64) B!2642) Unit!52240)

(assert (=> b!1580258 (= lt!676729 (lemmaContainsTupThenGetReturnValue!397 (t!51717 l!1390) key!405 value!194))))

(declare-fun b!1580259 () Bool)

(declare-fun res!1079541 () Bool)

(assert (=> b!1580259 (=> (not res!1079541) (not e!881576))))

(assert (=> b!1580259 (= res!1079541 (containsKey!907 (t!51717 l!1390) key!405))))

(declare-fun b!1580260 () Bool)

(assert (=> b!1580260 (= e!881577 e!881579)))

(declare-fun res!1079543 () Bool)

(assert (=> b!1580260 (=> (not res!1079543) (not e!881579))))

(assert (=> b!1580260 (= res!1079543 (contains!10475 l!1390 lt!676728))))

(assert (=> b!1580260 (= lt!676728 (tuple2!25487 key!405 value!194))))

(declare-fun res!1079540 () Bool)

(assert (=> start!137126 (=> (not res!1079540) (not e!881577))))

(assert (=> start!137126 (= res!1079540 (isStrictlySorted!1061 l!1390))))

(assert (=> start!137126 e!881577))

(assert (=> start!137126 e!881575))

(assert (=> start!137126 true))

(assert (=> start!137126 tp_is_empty!39187))

(declare-fun b!1580261 () Bool)

(declare-fun get!26782 (Option!896) tuple2!25488)

(assert (=> b!1580261 (= e!881578 (not (is-Nil!36800 (_2!12755 (get!26782 lt!676727)))))))

(declare-fun b!1580262 () Bool)

(declare-fun res!1079539 () Bool)

(assert (=> b!1580262 (=> (not res!1079539) (not e!881576))))

(assert (=> b!1580262 (= res!1079539 (and (or (not (is-Cons!36799 l!1390)) (not (= (_1!12754 (h!38342 l!1390)) key!405))) (is-Cons!36799 l!1390)))))

(assert (= (and start!137126 res!1079540) b!1580255))

(assert (= (and b!1580255 res!1079546) b!1580260))

(assert (= (and b!1580260 res!1079543) b!1580254))

(assert (= (and b!1580254 (not res!1079542)) b!1580261))

(assert (= (and b!1580254 res!1079544) b!1580262))

(assert (= (and b!1580262 res!1079539) b!1580256))

(assert (= (and b!1580256 res!1079547) b!1580259))

(assert (= (and b!1580259 res!1079541) b!1580253))

(assert (= (and b!1580253 res!1079545) b!1580258))

(assert (= (and start!137126 (is-Cons!36799 l!1390)) b!1580257))

(declare-fun m!1451731 () Bool)

(assert (=> b!1580256 m!1451731))

(declare-fun m!1451733 () Bool)

(assert (=> start!137126 m!1451733))

(declare-fun m!1451735 () Bool)

(assert (=> b!1580253 m!1451735))

(declare-fun m!1451737 () Bool)

(assert (=> b!1580261 m!1451737))

(declare-fun m!1451739 () Bool)

(assert (=> b!1580259 m!1451739))

(declare-fun m!1451741 () Bool)

(assert (=> b!1580258 m!1451741))

(declare-fun m!1451743 () Bool)

(assert (=> b!1580258 m!1451743))

(declare-fun m!1451745 () Bool)

(assert (=> b!1580260 m!1451745))

(declare-fun m!1451747 () Bool)

(assert (=> b!1580254 m!1451747))

(declare-fun m!1451749 () Bool)

(assert (=> b!1580254 m!1451749))

(declare-fun m!1451751 () Bool)

(assert (=> b!1580255 m!1451751))

(push 1)

