; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88894 () Bool)

(assert start!88894)

(declare-fun b!1020181 () Bool)

(declare-fun res!683775 () Bool)

(declare-fun e!574202 () Bool)

(assert (=> b!1020181 (=> (not res!683775) (not e!574202))))

(declare-datatypes ((B!1706 0))(
  ( (B!1707 (val!11937 Int)) )
))
(declare-datatypes ((tuple2!15420 0))(
  ( (tuple2!15421 (_1!7721 (_ BitVec 64)) (_2!7721 B!1706)) )
))
(declare-datatypes ((List!21625 0))(
  ( (Nil!21622) (Cons!21621 (h!22819 tuple2!15420) (t!30635 List!21625)) )
))
(declare-fun l!1367 () List!21625)

(declare-fun lt!449793 () tuple2!15420)

(assert (=> b!1020181 (= res!683775 (and (is-Cons!21621 l!1367) (not (= (h!22819 l!1367) lt!449793))))))

(declare-fun b!1020182 () Bool)

(declare-fun res!683777 () Bool)

(assert (=> b!1020182 (=> (not res!683777) (not e!574202))))

(declare-fun isStrictlySorted!690 (List!21625) Bool)

(assert (=> b!1020182 (= res!683777 (isStrictlySorted!690 (t!30635 l!1367)))))

(declare-fun b!1020183 () Bool)

(declare-fun e!574203 () Bool)

(assert (=> b!1020183 (= e!574203 e!574202)))

(declare-fun res!683776 () Bool)

(assert (=> b!1020183 (=> (not res!683776) (not e!574202))))

(declare-fun contains!5916 (List!21625 tuple2!15420) Bool)

(assert (=> b!1020183 (= res!683776 (contains!5916 l!1367 lt!449793))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1706)

(assert (=> b!1020183 (= lt!449793 (tuple2!15421 key!393 value!188))))

(declare-fun b!1020185 () Bool)

(assert (=> b!1020185 (= e!574202 false)))

(declare-fun lt!449792 () Bool)

(assert (=> b!1020185 (= lt!449792 (contains!5916 (t!30635 l!1367) lt!449793))))

(declare-fun res!683774 () Bool)

(assert (=> start!88894 (=> (not res!683774) (not e!574203))))

(assert (=> start!88894 (= res!683774 (isStrictlySorted!690 l!1367))))

(assert (=> start!88894 e!574203))

(declare-fun e!574201 () Bool)

(assert (=> start!88894 e!574201))

(assert (=> start!88894 true))

(declare-fun tp_is_empty!23773 () Bool)

(assert (=> start!88894 tp_is_empty!23773))

(declare-fun b!1020184 () Bool)

(declare-fun tp!71209 () Bool)

(assert (=> b!1020184 (= e!574201 (and tp_is_empty!23773 tp!71209))))

(assert (= (and start!88894 res!683774) b!1020183))

(assert (= (and b!1020183 res!683776) b!1020181))

(assert (= (and b!1020181 res!683775) b!1020182))

(assert (= (and b!1020182 res!683777) b!1020185))

(assert (= (and start!88894 (is-Cons!21621 l!1367)) b!1020184))

(declare-fun m!940231 () Bool)

(assert (=> b!1020182 m!940231))

(declare-fun m!940233 () Bool)

(assert (=> b!1020183 m!940233))

(declare-fun m!940235 () Bool)

(assert (=> b!1020185 m!940235))

(declare-fun m!940237 () Bool)

(assert (=> start!88894 m!940237))

(push 1)

