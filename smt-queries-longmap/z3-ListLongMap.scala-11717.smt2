; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137128 () Bool)

(assert start!137128)

(declare-fun b!1580284 () Bool)

(declare-fun e!881591 () Bool)

(assert (=> b!1580284 (= e!881591 (not true))))

(declare-datatypes ((B!2644 0))(
  ( (B!2645 (val!19684 Int)) )
))
(declare-datatypes ((tuple2!25490 0))(
  ( (tuple2!25491 (_1!12756 (_ BitVec 64)) (_2!12756 B!2644)) )
))
(declare-datatypes ((List!36804 0))(
  ( (Nil!36801) (Cons!36800 (h!38343 tuple2!25490) (t!51718 List!36804)) )
))
(declare-fun l!1390 () List!36804)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2644)

(declare-datatypes ((Option!898 0))(
  ( (Some!897 (v!22395 B!2644)) (None!896) )
))
(declare-fun getValueByKey!812 (List!36804 (_ BitVec 64)) Option!898)

(assert (=> b!1580284 (= (getValueByKey!812 (t!51718 l!1390) key!405) (Some!897 value!194))))

(declare-datatypes ((Unit!52242 0))(
  ( (Unit!52243) )
))
(declare-fun lt!676738 () Unit!52242)

(declare-fun lemmaContainsTupThenGetReturnValue!398 (List!36804 (_ BitVec 64) B!2644) Unit!52242)

(assert (=> b!1580284 (= lt!676738 (lemmaContainsTupThenGetReturnValue!398 (t!51718 l!1390) key!405 value!194))))

(declare-fun b!1580285 () Bool)

(declare-fun res!1079573 () Bool)

(declare-fun e!881594 () Bool)

(assert (=> b!1580285 (=> (not res!1079573) (not e!881594))))

(declare-fun containsKey!908 (List!36804 (_ BitVec 64)) Bool)

(assert (=> b!1580285 (= res!1079573 (containsKey!908 l!1390 key!405))))

(declare-fun b!1580286 () Bool)

(declare-fun res!1079572 () Bool)

(assert (=> b!1580286 (=> (not res!1079572) (not e!881591))))

(assert (=> b!1580286 (= res!1079572 (containsKey!908 (t!51718 l!1390) key!405))))

(declare-fun b!1580287 () Bool)

(declare-fun res!1079574 () Bool)

(assert (=> b!1580287 (=> (not res!1079574) (not e!881591))))

(declare-fun isStrictlySorted!1062 (List!36804) Bool)

(assert (=> b!1580287 (= res!1079574 (isStrictlySorted!1062 (t!51718 l!1390)))))

(declare-fun b!1580288 () Bool)

(declare-fun e!881593 () Bool)

(declare-fun tp_is_empty!39189 () Bool)

(declare-fun tp!114444 () Bool)

(assert (=> b!1580288 (= e!881593 (and tp_is_empty!39189 tp!114444))))

(declare-fun res!1079566 () Bool)

(assert (=> start!137128 (=> (not res!1079566) (not e!881594))))

(assert (=> start!137128 (= res!1079566 (isStrictlySorted!1062 l!1390))))

(assert (=> start!137128 e!881594))

(assert (=> start!137128 e!881593))

(assert (=> start!137128 true))

(assert (=> start!137128 tp_is_empty!39189))

(declare-fun b!1580283 () Bool)

(declare-fun e!881592 () Bool)

(assert (=> b!1580283 (= e!881594 e!881592)))

(declare-fun res!1079569 () Bool)

(assert (=> b!1580283 (=> (not res!1079569) (not e!881592))))

(declare-fun lt!676737 () tuple2!25490)

(declare-fun contains!10476 (List!36804 tuple2!25490) Bool)

(assert (=> b!1580283 (= res!1079569 (contains!10476 l!1390 lt!676737))))

(assert (=> b!1580283 (= lt!676737 (tuple2!25491 key!405 value!194))))

(declare-fun b!1580289 () Bool)

(declare-fun e!881590 () Bool)

(declare-datatypes ((tuple2!25492 0))(
  ( (tuple2!25493 (_1!12757 tuple2!25490) (_2!12757 List!36804)) )
))
(declare-datatypes ((Option!899 0))(
  ( (Some!898 (v!22396 tuple2!25492)) (None!897) )
))
(declare-fun lt!676736 () Option!899)

(get-info :version)

(declare-fun get!26783 (Option!899) tuple2!25492)

(assert (=> b!1580289 (= e!881590 (not ((_ is Nil!36801) (_2!12757 (get!26783 lt!676736)))))))

(declare-fun b!1580290 () Bool)

(declare-fun res!1079568 () Bool)

(assert (=> b!1580290 (=> (not res!1079568) (not e!881591))))

(assert (=> b!1580290 (= res!1079568 (and (or (not ((_ is Cons!36800) l!1390)) (not (= (_1!12756 (h!38343 l!1390)) key!405))) ((_ is Cons!36800) l!1390)))))

(declare-fun b!1580291 () Bool)

(assert (=> b!1580291 (= e!881592 e!881591)))

(declare-fun res!1079571 () Bool)

(assert (=> b!1580291 (=> (not res!1079571) (not e!881591))))

(assert (=> b!1580291 (= res!1079571 e!881590)))

(declare-fun res!1079567 () Bool)

(assert (=> b!1580291 (=> res!1079567 e!881590)))

(declare-fun isEmpty!1164 (Option!899) Bool)

(assert (=> b!1580291 (= res!1079567 (isEmpty!1164 lt!676736))))

(declare-fun unapply!80 (List!36804) Option!899)

(assert (=> b!1580291 (= lt!676736 (unapply!80 l!1390))))

(declare-fun b!1580292 () Bool)

(declare-fun res!1079570 () Bool)

(assert (=> b!1580292 (=> (not res!1079570) (not e!881591))))

(assert (=> b!1580292 (= res!1079570 (contains!10476 (t!51718 l!1390) lt!676737))))

(assert (= (and start!137128 res!1079566) b!1580285))

(assert (= (and b!1580285 res!1079573) b!1580283))

(assert (= (and b!1580283 res!1079569) b!1580291))

(assert (= (and b!1580291 (not res!1079567)) b!1580289))

(assert (= (and b!1580291 res!1079571) b!1580290))

(assert (= (and b!1580290 res!1079568) b!1580287))

(assert (= (and b!1580287 res!1079574) b!1580286))

(assert (= (and b!1580286 res!1079572) b!1580292))

(assert (= (and b!1580292 res!1079570) b!1580284))

(assert (= (and start!137128 ((_ is Cons!36800) l!1390)) b!1580288))

(declare-fun m!1451753 () Bool)

(assert (=> start!137128 m!1451753))

(declare-fun m!1451755 () Bool)

(assert (=> b!1580285 m!1451755))

(declare-fun m!1451757 () Bool)

(assert (=> b!1580289 m!1451757))

(declare-fun m!1451759 () Bool)

(assert (=> b!1580287 m!1451759))

(declare-fun m!1451761 () Bool)

(assert (=> b!1580292 m!1451761))

(declare-fun m!1451763 () Bool)

(assert (=> b!1580283 m!1451763))

(declare-fun m!1451765 () Bool)

(assert (=> b!1580284 m!1451765))

(declare-fun m!1451767 () Bool)

(assert (=> b!1580284 m!1451767))

(declare-fun m!1451769 () Bool)

(assert (=> b!1580291 m!1451769))

(declare-fun m!1451771 () Bool)

(assert (=> b!1580291 m!1451771))

(declare-fun m!1451773 () Bool)

(assert (=> b!1580286 m!1451773))

(check-sat (not b!1580289) tp_is_empty!39189 (not b!1580286) (not b!1580292) (not start!137128) (not b!1580285) (not b!1580287) (not b!1580288) (not b!1580291) (not b!1580284) (not b!1580283))
(check-sat)
