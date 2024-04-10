; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88906 () Bool)

(assert start!88906)

(declare-fun res!683849 () Bool)

(declare-fun e!574253 () Bool)

(assert (=> start!88906 (=> (not res!683849) (not e!574253))))

(declare-datatypes ((B!1718 0))(
  ( (B!1719 (val!11943 Int)) )
))
(declare-datatypes ((tuple2!15432 0))(
  ( (tuple2!15433 (_1!7727 (_ BitVec 64)) (_2!7727 B!1718)) )
))
(declare-datatypes ((List!21631 0))(
  ( (Nil!21628) (Cons!21627 (h!22825 tuple2!15432) (t!30641 List!21631)) )
))
(declare-fun l!1367 () List!21631)

(declare-fun isStrictlySorted!696 (List!21631) Bool)

(assert (=> start!88906 (= res!683849 (isStrictlySorted!696 l!1367))))

(assert (=> start!88906 e!574253))

(declare-fun e!574254 () Bool)

(assert (=> start!88906 e!574254))

(assert (=> start!88906 true))

(declare-fun tp_is_empty!23785 () Bool)

(assert (=> start!88906 tp_is_empty!23785))

(declare-fun b!1020274 () Bool)

(assert (=> b!1020274 (= e!574253 false)))

(declare-fun value!188 () B!1718)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun lt!449826 () Bool)

(declare-fun contains!5922 (List!21631 tuple2!15432) Bool)

(assert (=> b!1020274 (= lt!449826 (contains!5922 l!1367 (tuple2!15433 key!393 value!188)))))

(declare-fun b!1020275 () Bool)

(declare-fun tp!71227 () Bool)

(assert (=> b!1020275 (= e!574254 (and tp_is_empty!23785 tp!71227))))

(assert (= (and start!88906 res!683849) b!1020274))

(assert (= (and start!88906 (is-Cons!21627 l!1367)) b!1020275))

(declare-fun m!940291 () Bool)

(assert (=> start!88906 m!940291))

(declare-fun m!940293 () Bool)

(assert (=> b!1020274 m!940293))

(push 1)

(assert (not start!88906))

(assert (not b!1020274))

(assert (not b!1020275))

(assert tp_is_empty!23785)

(check-sat)

(pop 1)

