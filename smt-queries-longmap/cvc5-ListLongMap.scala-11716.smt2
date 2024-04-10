; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137120 () Bool)

(assert start!137120)

(declare-fun b!1580170 () Bool)

(declare-fun e!881532 () Bool)

(declare-datatypes ((B!2636 0))(
  ( (B!2637 (val!19680 Int)) )
))
(declare-datatypes ((tuple2!25474 0))(
  ( (tuple2!25475 (_1!12748 (_ BitVec 64)) (_2!12748 B!2636)) )
))
(declare-datatypes ((List!36800 0))(
  ( (Nil!36797) (Cons!36796 (h!38339 tuple2!25474) (t!51714 List!36800)) )
))
(declare-datatypes ((tuple2!25476 0))(
  ( (tuple2!25477 (_1!12749 tuple2!25474) (_2!12749 List!36800)) )
))
(declare-datatypes ((Option!893 0))(
  ( (Some!892 (v!22390 tuple2!25476)) (None!891) )
))
(declare-fun lt!676702 () Option!893)

(declare-fun get!26777 (Option!893) tuple2!25476)

(assert (=> b!1580170 (= e!881532 (not (is-Nil!36797 (_2!12749 (get!26777 lt!676702)))))))

(declare-fun b!1580171 () Bool)

(declare-fun e!881530 () Bool)

(declare-fun tp_is_empty!39181 () Bool)

(declare-fun tp!114432 () Bool)

(assert (=> b!1580171 (= e!881530 (and tp_is_empty!39181 tp!114432))))

(declare-fun b!1580173 () Bool)

(declare-fun e!881531 () Bool)

(assert (=> b!1580173 (= e!881531 false)))

(declare-fun lt!676700 () Bool)

(declare-fun l!1390 () List!36800)

(declare-fun lt!676701 () tuple2!25474)

(declare-fun contains!10472 (List!36800 tuple2!25474) Bool)

(assert (=> b!1580173 (= lt!676700 (contains!10472 (t!51714 l!1390) lt!676701))))

(declare-fun b!1580174 () Bool)

(declare-fun res!1079470 () Bool)

(assert (=> b!1580174 (=> (not res!1079470) (not e!881531))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!904 (List!36800 (_ BitVec 64)) Bool)

(assert (=> b!1580174 (= res!1079470 (containsKey!904 (t!51714 l!1390) key!405))))

(declare-fun b!1580175 () Bool)

(declare-fun e!881534 () Bool)

(declare-fun e!881533 () Bool)

(assert (=> b!1580175 (= e!881534 e!881533)))

(declare-fun res!1079472 () Bool)

(assert (=> b!1580175 (=> (not res!1079472) (not e!881533))))

(assert (=> b!1580175 (= res!1079472 (contains!10472 l!1390 lt!676701))))

(declare-fun value!194 () B!2636)

(assert (=> b!1580175 (= lt!676701 (tuple2!25475 key!405 value!194))))

(declare-fun b!1580176 () Bool)

(declare-fun res!1079471 () Bool)

(assert (=> b!1580176 (=> (not res!1079471) (not e!881531))))

(declare-fun isStrictlySorted!1058 (List!36800) Bool)

(assert (=> b!1580176 (= res!1079471 (isStrictlySorted!1058 (t!51714 l!1390)))))

(declare-fun b!1580177 () Bool)

(declare-fun res!1079469 () Bool)

(assert (=> b!1580177 (=> (not res!1079469) (not e!881534))))

(assert (=> b!1580177 (= res!1079469 (containsKey!904 l!1390 key!405))))

(declare-fun b!1580178 () Bool)

(assert (=> b!1580178 (= e!881533 e!881531)))

(declare-fun res!1079467 () Bool)

(assert (=> b!1580178 (=> (not res!1079467) (not e!881531))))

(assert (=> b!1580178 (= res!1079467 e!881532)))

(declare-fun res!1079468 () Bool)

(assert (=> b!1580178 (=> res!1079468 e!881532)))

(declare-fun isEmpty!1160 (Option!893) Bool)

(assert (=> b!1580178 (= res!1079468 (isEmpty!1160 lt!676702))))

(declare-fun unapply!76 (List!36800) Option!893)

(assert (=> b!1580178 (= lt!676702 (unapply!76 l!1390))))

(declare-fun res!1079465 () Bool)

(assert (=> start!137120 (=> (not res!1079465) (not e!881534))))

(assert (=> start!137120 (= res!1079465 (isStrictlySorted!1058 l!1390))))

(assert (=> start!137120 e!881534))

(assert (=> start!137120 e!881530))

(assert (=> start!137120 true))

(assert (=> start!137120 tp_is_empty!39181))

(declare-fun b!1580172 () Bool)

(declare-fun res!1079466 () Bool)

(assert (=> b!1580172 (=> (not res!1079466) (not e!881531))))

(assert (=> b!1580172 (= res!1079466 (and (or (not (is-Cons!36796 l!1390)) (not (= (_1!12748 (h!38339 l!1390)) key!405))) (is-Cons!36796 l!1390)))))

(assert (= (and start!137120 res!1079465) b!1580177))

(assert (= (and b!1580177 res!1079469) b!1580175))

(assert (= (and b!1580175 res!1079472) b!1580178))

(assert (= (and b!1580178 (not res!1079468)) b!1580170))

(assert (= (and b!1580178 res!1079467) b!1580172))

(assert (= (and b!1580172 res!1079466) b!1580176))

(assert (= (and b!1580176 res!1079471) b!1580174))

(assert (= (and b!1580174 res!1079470) b!1580173))

(assert (= (and start!137120 (is-Cons!36796 l!1390)) b!1580171))

(declare-fun m!1451677 () Bool)

(assert (=> b!1580178 m!1451677))

(declare-fun m!1451679 () Bool)

(assert (=> b!1580178 m!1451679))

(declare-fun m!1451681 () Bool)

(assert (=> b!1580170 m!1451681))

(declare-fun m!1451683 () Bool)

(assert (=> b!1580174 m!1451683))

(declare-fun m!1451685 () Bool)

(assert (=> b!1580175 m!1451685))

(declare-fun m!1451687 () Bool)

(assert (=> b!1580177 m!1451687))

(declare-fun m!1451689 () Bool)

(assert (=> b!1580176 m!1451689))

(declare-fun m!1451691 () Bool)

(assert (=> b!1580173 m!1451691))

(declare-fun m!1451693 () Bool)

(assert (=> start!137120 m!1451693))

(push 1)

