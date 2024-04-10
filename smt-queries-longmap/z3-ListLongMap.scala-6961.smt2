; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87902 () Bool)

(assert start!87902)

(declare-fun b!1015493 () Bool)

(assert (=> b!1015493 true))

(assert (=> b!1015493 true))

(declare-fun res!681164 () Bool)

(declare-fun e!571278 () Bool)

(assert (=> start!87902 (=> (not res!681164) (not e!571278))))

(declare-datatypes ((B!1474 0))(
  ( (B!1475 (val!11821 Int)) )
))
(declare-datatypes ((tuple2!15188 0))(
  ( (tuple2!15189 (_1!7605 (_ BitVec 64)) (_2!7605 B!1474)) )
))
(declare-datatypes ((List!21471 0))(
  ( (Nil!21468) (Cons!21467 (h!22665 tuple2!15188) (t!30472 List!21471)) )
))
(declare-fun l!412 () List!21471)

(declare-fun isStrictlySorted!595 (List!21471) Bool)

(assert (=> start!87902 (= res!681164 (isStrictlySorted!595 l!412))))

(assert (=> start!87902 e!571278))

(declare-fun e!571279 () Bool)

(assert (=> start!87902 e!571279))

(declare-fun tp_is_empty!23541 () Bool)

(assert (=> start!87902 tp_is_empty!23541))

(declare-fun b!1015492 () Bool)

(declare-fun res!681165 () Bool)

(assert (=> b!1015492 (=> (not res!681165) (not e!571278))))

(declare-fun value!115 () B!1474)

(get-info :version)

(assert (=> b!1015492 (= res!681165 (and (or (not ((_ is Cons!21467) l!412)) (not (= (_2!7605 (h!22665 l!412)) value!115))) (or (not ((_ is Cons!21467) l!412)) (= (_2!7605 (h!22665 l!412)) value!115)) (not ((_ is Nil!21468) l!412))))))

(declare-datatypes ((List!21472 0))(
  ( (Nil!21469) (Cons!21468 (h!22666 (_ BitVec 64)) (t!30473 List!21472)) )
))
(declare-fun err!115 () List!21472)

(declare-fun lambda!905 () Int)

(declare-fun forall!257 (List!21472 Int) Bool)

(assert (=> b!1015493 (= e!571278 (not (forall!257 err!115 lambda!905)))))

(assert (=> b!1015493 true))

(declare-fun b!1015494 () Bool)

(declare-fun tp!70640 () Bool)

(assert (=> b!1015494 (= e!571279 (and tp_is_empty!23541 tp!70640))))

(assert (= (and start!87902 res!681164) b!1015492))

(assert (= (and b!1015492 res!681165) b!1015493))

(assert (= (and start!87902 ((_ is Cons!21467) l!412)) b!1015494))

(declare-fun m!937551 () Bool)

(assert (=> start!87902 m!937551))

(declare-fun m!937553 () Bool)

(assert (=> b!1015493 m!937553))

(check-sat (not b!1015493) (not start!87902) (not b!1015494) tp_is_empty!23541)
(check-sat)
