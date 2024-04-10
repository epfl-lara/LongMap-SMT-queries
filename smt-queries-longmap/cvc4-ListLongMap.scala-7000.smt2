; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88898 () Bool)

(assert start!88898)

(declare-fun b!1020211 () Bool)

(declare-fun res!683800 () Bool)

(declare-fun e!574219 () Bool)

(assert (=> b!1020211 (=> (not res!683800) (not e!574219))))

(declare-datatypes ((B!1710 0))(
  ( (B!1711 (val!11939 Int)) )
))
(declare-datatypes ((tuple2!15424 0))(
  ( (tuple2!15425 (_1!7723 (_ BitVec 64)) (_2!7723 B!1710)) )
))
(declare-datatypes ((List!21627 0))(
  ( (Nil!21624) (Cons!21623 (h!22821 tuple2!15424) (t!30637 List!21627)) )
))
(declare-fun l!1367 () List!21627)

(declare-fun isStrictlySorted!692 (List!21627) Bool)

(assert (=> b!1020211 (= res!683800 (isStrictlySorted!692 (t!30637 l!1367)))))

(declare-fun b!1020212 () Bool)

(declare-fun e!574220 () Bool)

(declare-fun tp_is_empty!23777 () Bool)

(declare-fun tp!71215 () Bool)

(assert (=> b!1020212 (= e!574220 (and tp_is_empty!23777 tp!71215))))

(declare-fun res!683798 () Bool)

(declare-fun e!574221 () Bool)

(assert (=> start!88898 (=> (not res!683798) (not e!574221))))

(assert (=> start!88898 (= res!683798 (isStrictlySorted!692 l!1367))))

(assert (=> start!88898 e!574221))

(assert (=> start!88898 e!574220))

(assert (=> start!88898 true))

(assert (=> start!88898 tp_is_empty!23777))

(declare-fun b!1020213 () Bool)

(assert (=> b!1020213 (= e!574219 false)))

(declare-fun lt!449805 () Bool)

(declare-fun lt!449804 () tuple2!15424)

(declare-fun contains!5918 (List!21627 tuple2!15424) Bool)

(assert (=> b!1020213 (= lt!449805 (contains!5918 (t!30637 l!1367) lt!449804))))

(declare-fun b!1020214 () Bool)

(declare-fun res!683799 () Bool)

(assert (=> b!1020214 (=> (not res!683799) (not e!574219))))

(assert (=> b!1020214 (= res!683799 (and (is-Cons!21623 l!1367) (not (= (h!22821 l!1367) lt!449804))))))

(declare-fun b!1020215 () Bool)

(assert (=> b!1020215 (= e!574221 e!574219)))

(declare-fun res!683801 () Bool)

(assert (=> b!1020215 (=> (not res!683801) (not e!574219))))

(assert (=> b!1020215 (= res!683801 (contains!5918 l!1367 lt!449804))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1710)

(assert (=> b!1020215 (= lt!449804 (tuple2!15425 key!393 value!188))))

(assert (= (and start!88898 res!683798) b!1020215))

(assert (= (and b!1020215 res!683801) b!1020214))

(assert (= (and b!1020214 res!683799) b!1020211))

(assert (= (and b!1020211 res!683800) b!1020213))

(assert (= (and start!88898 (is-Cons!21623 l!1367)) b!1020212))

(declare-fun m!940247 () Bool)

(assert (=> b!1020211 m!940247))

(declare-fun m!940249 () Bool)

(assert (=> start!88898 m!940249))

(declare-fun m!940251 () Bool)

(assert (=> b!1020213 m!940251))

(declare-fun m!940253 () Bool)

(assert (=> b!1020215 m!940253))

(push 1)

