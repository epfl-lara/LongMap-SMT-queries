; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87904 () Bool)

(assert start!87904)

(declare-fun b!1015506 () Bool)

(assert (=> b!1015506 true))

(assert (=> b!1015506 true))

(declare-fun res!681171 () Bool)

(declare-fun e!571284 () Bool)

(assert (=> start!87904 (=> (not res!681171) (not e!571284))))

(declare-datatypes ((B!1476 0))(
  ( (B!1477 (val!11822 Int)) )
))
(declare-datatypes ((tuple2!15190 0))(
  ( (tuple2!15191 (_1!7606 (_ BitVec 64)) (_2!7606 B!1476)) )
))
(declare-datatypes ((List!21473 0))(
  ( (Nil!21470) (Cons!21469 (h!22667 tuple2!15190) (t!30474 List!21473)) )
))
(declare-fun l!412 () List!21473)

(declare-fun isStrictlySorted!596 (List!21473) Bool)

(assert (=> start!87904 (= res!681171 (isStrictlySorted!596 l!412))))

(assert (=> start!87904 e!571284))

(declare-fun e!571285 () Bool)

(assert (=> start!87904 e!571285))

(declare-fun tp_is_empty!23543 () Bool)

(assert (=> start!87904 tp_is_empty!23543))

(declare-fun b!1015505 () Bool)

(declare-fun res!681170 () Bool)

(assert (=> b!1015505 (=> (not res!681170) (not e!571284))))

(declare-fun value!115 () B!1476)

(assert (=> b!1015505 (= res!681170 (and (or (not (is-Cons!21469 l!412)) (not (= (_2!7606 (h!22667 l!412)) value!115))) (or (not (is-Cons!21469 l!412)) (= (_2!7606 (h!22667 l!412)) value!115)) (not (is-Nil!21470 l!412))))))

(declare-datatypes ((List!21474 0))(
  ( (Nil!21471) (Cons!21470 (h!22668 (_ BitVec 64)) (t!30475 List!21474)) )
))
(declare-fun err!119 () List!21474)

(declare-fun lambda!908 () Int)

(declare-fun forall!258 (List!21474 Int) Bool)

(assert (=> b!1015506 (= e!571284 (not (forall!258 err!119 lambda!908)))))

(assert (=> b!1015506 true))

(declare-fun b!1015507 () Bool)

(declare-fun tp!70643 () Bool)

(assert (=> b!1015507 (= e!571285 (and tp_is_empty!23543 tp!70643))))

(assert (= (and start!87904 res!681171) b!1015505))

(assert (= (and b!1015505 res!681170) b!1015506))

(assert (= (and start!87904 (is-Cons!21469 l!412)) b!1015507))

(declare-fun m!937555 () Bool)

(assert (=> start!87904 m!937555))

(declare-fun m!937557 () Bool)

(assert (=> b!1015506 m!937557))

(push 1)

(assert (not start!87904))

(assert (not b!1015506))

(assert (not b!1015507))

