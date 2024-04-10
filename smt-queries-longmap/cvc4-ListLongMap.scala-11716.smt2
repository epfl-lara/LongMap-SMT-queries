; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137124 () Bool)

(assert start!137124)

(declare-fun res!1079520 () Bool)

(declare-fun e!881561 () Bool)

(assert (=> start!137124 (=> (not res!1079520) (not e!881561))))

(declare-datatypes ((B!2640 0))(
  ( (B!2641 (val!19682 Int)) )
))
(declare-datatypes ((tuple2!25482 0))(
  ( (tuple2!25483 (_1!12752 (_ BitVec 64)) (_2!12752 B!2640)) )
))
(declare-datatypes ((List!36802 0))(
  ( (Nil!36799) (Cons!36798 (h!38341 tuple2!25482) (t!51716 List!36802)) )
))
(declare-fun l!1390 () List!36802)

(declare-fun isStrictlySorted!1060 (List!36802) Bool)

(assert (=> start!137124 (= res!1079520 (isStrictlySorted!1060 l!1390))))

(assert (=> start!137124 e!881561))

(declare-fun e!881563 () Bool)

(assert (=> start!137124 e!881563))

(assert (=> start!137124 true))

(declare-fun tp_is_empty!39185 () Bool)

(assert (=> start!137124 tp_is_empty!39185))

(declare-fun b!1580224 () Bool)

(declare-fun e!881562 () Bool)

(declare-fun e!881560 () Bool)

(assert (=> b!1580224 (= e!881562 e!881560)))

(declare-fun res!1079514 () Bool)

(assert (=> b!1580224 (=> (not res!1079514) (not e!881560))))

(declare-fun e!881564 () Bool)

(assert (=> b!1580224 (= res!1079514 e!881564)))

(declare-fun res!1079515 () Bool)

(assert (=> b!1580224 (=> res!1079515 e!881564)))

(declare-datatypes ((tuple2!25484 0))(
  ( (tuple2!25485 (_1!12753 tuple2!25482) (_2!12753 List!36802)) )
))
(declare-datatypes ((Option!895 0))(
  ( (Some!894 (v!22392 tuple2!25484)) (None!893) )
))
(declare-fun lt!676720 () Option!895)

(declare-fun isEmpty!1162 (Option!895) Bool)

(assert (=> b!1580224 (= res!1079515 (isEmpty!1162 lt!676720))))

(declare-fun unapply!78 (List!36802) Option!895)

(assert (=> b!1580224 (= lt!676720 (unapply!78 l!1390))))

(declare-fun b!1580225 () Bool)

(declare-fun res!1079519 () Bool)

(assert (=> b!1580225 (=> (not res!1079519) (not e!881561))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!906 (List!36802 (_ BitVec 64)) Bool)

(assert (=> b!1580225 (= res!1079519 (containsKey!906 l!1390 key!405))))

(declare-fun b!1580226 () Bool)

(declare-fun tp!114438 () Bool)

(assert (=> b!1580226 (= e!881563 (and tp_is_empty!39185 tp!114438))))

(declare-fun b!1580227 () Bool)

(assert (=> b!1580227 (= e!881561 e!881562)))

(declare-fun res!1079516 () Bool)

(assert (=> b!1580227 (=> (not res!1079516) (not e!881562))))

(declare-fun lt!676718 () tuple2!25482)

(declare-fun contains!10474 (List!36802 tuple2!25482) Bool)

(assert (=> b!1580227 (= res!1079516 (contains!10474 l!1390 lt!676718))))

(declare-fun value!194 () B!2640)

(assert (=> b!1580227 (= lt!676718 (tuple2!25483 key!405 value!194))))

(declare-fun b!1580228 () Bool)

(declare-fun res!1079518 () Bool)

(assert (=> b!1580228 (=> (not res!1079518) (not e!881560))))

(assert (=> b!1580228 (= res!1079518 (containsKey!906 (t!51716 l!1390) key!405))))

(declare-fun b!1580229 () Bool)

(assert (=> b!1580229 (= e!881560 false)))

(declare-fun lt!676719 () Bool)

(assert (=> b!1580229 (= lt!676719 (contains!10474 (t!51716 l!1390) lt!676718))))

(declare-fun b!1580230 () Bool)

(declare-fun res!1079513 () Bool)

(assert (=> b!1580230 (=> (not res!1079513) (not e!881560))))

(assert (=> b!1580230 (= res!1079513 (isStrictlySorted!1060 (t!51716 l!1390)))))

(declare-fun b!1580231 () Bool)

(declare-fun res!1079517 () Bool)

(assert (=> b!1580231 (=> (not res!1079517) (not e!881560))))

(assert (=> b!1580231 (= res!1079517 (and (or (not (is-Cons!36798 l!1390)) (not (= (_1!12752 (h!38341 l!1390)) key!405))) (is-Cons!36798 l!1390)))))

(declare-fun b!1580232 () Bool)

(declare-fun get!26779 (Option!895) tuple2!25484)

(assert (=> b!1580232 (= e!881564 (not (is-Nil!36799 (_2!12753 (get!26779 lt!676720)))))))

(assert (= (and start!137124 res!1079520) b!1580225))

(assert (= (and b!1580225 res!1079519) b!1580227))

(assert (= (and b!1580227 res!1079516) b!1580224))

(assert (= (and b!1580224 (not res!1079515)) b!1580232))

(assert (= (and b!1580224 res!1079514) b!1580231))

(assert (= (and b!1580231 res!1079517) b!1580230))

(assert (= (and b!1580230 res!1079513) b!1580228))

(assert (= (and b!1580228 res!1079518) b!1580229))

(assert (= (and start!137124 (is-Cons!36798 l!1390)) b!1580226))

(declare-fun m!1451713 () Bool)

(assert (=> b!1580228 m!1451713))

(declare-fun m!1451715 () Bool)

(assert (=> b!1580224 m!1451715))

(declare-fun m!1451717 () Bool)

(assert (=> b!1580224 m!1451717))

(declare-fun m!1451719 () Bool)

(assert (=> b!1580230 m!1451719))

(declare-fun m!1451721 () Bool)

(assert (=> b!1580232 m!1451721))

(declare-fun m!1451723 () Bool)

(assert (=> start!137124 m!1451723))

(declare-fun m!1451725 () Bool)

(assert (=> b!1580229 m!1451725))

(declare-fun m!1451727 () Bool)

(assert (=> b!1580225 m!1451727))

(declare-fun m!1451729 () Bool)

(assert (=> b!1580227 m!1451729))

(push 1)

