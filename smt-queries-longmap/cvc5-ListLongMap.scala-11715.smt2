; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137114 () Bool)

(assert start!137114)

(declare-fun b!1580089 () Bool)

(declare-fun res!1079395 () Bool)

(declare-fun e!881487 () Bool)

(assert (=> b!1580089 (=> (not res!1079395) (not e!881487))))

(declare-datatypes ((B!2630 0))(
  ( (B!2631 (val!19677 Int)) )
))
(declare-datatypes ((tuple2!25462 0))(
  ( (tuple2!25463 (_1!12742 (_ BitVec 64)) (_2!12742 B!2630)) )
))
(declare-datatypes ((List!36797 0))(
  ( (Nil!36794) (Cons!36793 (h!38336 tuple2!25462) (t!51711 List!36797)) )
))
(declare-fun l!1390 () List!36797)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!901 (List!36797 (_ BitVec 64)) Bool)

(assert (=> b!1580089 (= res!1079395 (containsKey!901 l!1390 key!405))))

(declare-fun b!1580090 () Bool)

(declare-fun e!881485 () Bool)

(declare-datatypes ((tuple2!25464 0))(
  ( (tuple2!25465 (_1!12743 tuple2!25462) (_2!12743 List!36797)) )
))
(declare-datatypes ((Option!890 0))(
  ( (Some!889 (v!22387 tuple2!25464)) (None!888) )
))
(declare-fun lt!676673 () Option!890)

(declare-fun get!26772 (Option!890) tuple2!25464)

(assert (=> b!1580090 (= e!881485 (not (is-Nil!36794 (_2!12743 (get!26772 lt!676673)))))))

(declare-fun res!1079394 () Bool)

(assert (=> start!137114 (=> (not res!1079394) (not e!881487))))

(declare-fun isStrictlySorted!1055 (List!36797) Bool)

(assert (=> start!137114 (= res!1079394 (isStrictlySorted!1055 l!1390))))

(assert (=> start!137114 e!881487))

(declare-fun e!881489 () Bool)

(assert (=> start!137114 e!881489))

(assert (=> start!137114 true))

(declare-fun tp_is_empty!39175 () Bool)

(assert (=> start!137114 tp_is_empty!39175))

(declare-fun b!1580091 () Bool)

(declare-fun e!881488 () Bool)

(assert (=> b!1580091 (= e!881488 (not true))))

(declare-fun lt!676674 () tuple2!25462)

(declare-fun contains!10469 (List!36797 tuple2!25462) Bool)

(assert (=> b!1580091 (not (contains!10469 (t!51711 l!1390) lt!676674))))

(declare-datatypes ((Unit!52234 0))(
  ( (Unit!52235) )
))
(declare-fun lt!676675 () Unit!52234)

(declare-fun value!194 () B!2630)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!1 (List!36797 (_ BitVec 64) B!2630) Unit!52234)

(assert (=> b!1580091 (= lt!676675 (lemmaNotContainsKeyThenNotContainsTuple!1 (t!51711 l!1390) key!405 value!194))))

(declare-fun b!1580092 () Bool)

(declare-fun res!1079399 () Bool)

(assert (=> b!1580092 (=> (not res!1079399) (not e!881488))))

(assert (=> b!1580092 (= res!1079399 (not (containsKey!901 (t!51711 l!1390) key!405)))))

(declare-fun b!1580093 () Bool)

(declare-fun e!881486 () Bool)

(assert (=> b!1580093 (= e!881487 e!881486)))

(declare-fun res!1079396 () Bool)

(assert (=> b!1580093 (=> (not res!1079396) (not e!881486))))

(assert (=> b!1580093 (= res!1079396 (contains!10469 l!1390 lt!676674))))

(assert (=> b!1580093 (= lt!676674 (tuple2!25463 key!405 value!194))))

(declare-fun b!1580094 () Bool)

(assert (=> b!1580094 (= e!881486 e!881488)))

(declare-fun res!1079397 () Bool)

(assert (=> b!1580094 (=> (not res!1079397) (not e!881488))))

(assert (=> b!1580094 (= res!1079397 e!881485)))

(declare-fun res!1079400 () Bool)

(assert (=> b!1580094 (=> res!1079400 e!881485)))

(declare-fun isEmpty!1157 (Option!890) Bool)

(assert (=> b!1580094 (= res!1079400 (isEmpty!1157 lt!676673))))

(declare-fun unapply!73 (List!36797) Option!890)

(assert (=> b!1580094 (= lt!676673 (unapply!73 l!1390))))

(declare-fun b!1580095 () Bool)

(declare-fun tp!114423 () Bool)

(assert (=> b!1580095 (= e!881489 (and tp_is_empty!39175 tp!114423))))

(declare-fun b!1580096 () Bool)

(declare-fun res!1079398 () Bool)

(assert (=> b!1580096 (=> (not res!1079398) (not e!881488))))

(assert (=> b!1580096 (= res!1079398 (and (is-Cons!36793 l!1390) (= (_1!12742 (h!38336 l!1390)) key!405)))))

(declare-fun b!1580097 () Bool)

(declare-fun res!1079393 () Bool)

(assert (=> b!1580097 (=> (not res!1079393) (not e!881488))))

(assert (=> b!1580097 (= res!1079393 (isStrictlySorted!1055 (t!51711 l!1390)))))

(assert (= (and start!137114 res!1079394) b!1580089))

(assert (= (and b!1580089 res!1079395) b!1580093))

(assert (= (and b!1580093 res!1079396) b!1580094))

(assert (= (and b!1580094 (not res!1079400)) b!1580090))

(assert (= (and b!1580094 res!1079397) b!1580096))

(assert (= (and b!1580096 res!1079398) b!1580097))

(assert (= (and b!1580097 res!1079393) b!1580092))

(assert (= (and b!1580092 res!1079399) b!1580091))

(assert (= (and start!137114 (is-Cons!36793 l!1390)) b!1580095))

(declare-fun m!1451617 () Bool)

(assert (=> b!1580091 m!1451617))

(declare-fun m!1451619 () Bool)

(assert (=> b!1580091 m!1451619))

(declare-fun m!1451621 () Bool)

(assert (=> b!1580097 m!1451621))

(declare-fun m!1451623 () Bool)

(assert (=> b!1580089 m!1451623))

(declare-fun m!1451625 () Bool)

(assert (=> start!137114 m!1451625))

(declare-fun m!1451627 () Bool)

(assert (=> b!1580090 m!1451627))

(declare-fun m!1451629 () Bool)

(assert (=> b!1580094 m!1451629))

(declare-fun m!1451631 () Bool)

(assert (=> b!1580094 m!1451631))

(declare-fun m!1451633 () Bool)

(assert (=> b!1580092 m!1451633))

(declare-fun m!1451635 () Bool)

(assert (=> b!1580093 m!1451635))

(push 1)

