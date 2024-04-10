; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87900 () Bool)

(assert start!87900)

(declare-fun b!1015480 () Bool)

(assert (=> b!1015480 true))

(assert (=> b!1015480 true))

(declare-fun res!681159 () Bool)

(declare-fun e!571273 () Bool)

(assert (=> start!87900 (=> (not res!681159) (not e!571273))))

(declare-datatypes ((B!1472 0))(
  ( (B!1473 (val!11820 Int)) )
))
(declare-datatypes ((tuple2!15186 0))(
  ( (tuple2!15187 (_1!7604 (_ BitVec 64)) (_2!7604 B!1472)) )
))
(declare-datatypes ((List!21469 0))(
  ( (Nil!21466) (Cons!21465 (h!22663 tuple2!15186) (t!30470 List!21469)) )
))
(declare-fun l!412 () List!21469)

(declare-fun isStrictlySorted!594 (List!21469) Bool)

(assert (=> start!87900 (= res!681159 (isStrictlySorted!594 l!412))))

(assert (=> start!87900 e!571273))

(declare-fun e!571272 () Bool)

(assert (=> start!87900 e!571272))

(declare-fun tp_is_empty!23539 () Bool)

(assert (=> start!87900 tp_is_empty!23539))

(declare-fun b!1015479 () Bool)

(declare-fun res!681158 () Bool)

(assert (=> b!1015479 (=> (not res!681158) (not e!571273))))

(declare-fun value!115 () B!1472)

(assert (=> b!1015479 (= res!681158 (and (or (not (is-Cons!21465 l!412)) (not (= (_2!7604 (h!22663 l!412)) value!115))) (or (not (is-Cons!21465 l!412)) (= (_2!7604 (h!22663 l!412)) value!115)) (not (is-Nil!21466 l!412))))))

(declare-datatypes ((List!21470 0))(
  ( (Nil!21467) (Cons!21466 (h!22664 (_ BitVec 64)) (t!30471 List!21470)) )
))
(declare-fun err!111 () List!21470)

(declare-fun lambda!902 () Int)

(declare-fun forall!256 (List!21470 Int) Bool)

(assert (=> b!1015480 (= e!571273 (not (forall!256 err!111 lambda!902)))))

(assert (=> b!1015480 true))

(declare-fun b!1015481 () Bool)

(declare-fun tp!70637 () Bool)

(assert (=> b!1015481 (= e!571272 (and tp_is_empty!23539 tp!70637))))

(assert (= (and start!87900 res!681159) b!1015479))

(assert (= (and b!1015479 res!681158) b!1015480))

(assert (= (and start!87900 (is-Cons!21465 l!412)) b!1015481))

(declare-fun m!937547 () Bool)

(assert (=> start!87900 m!937547))

(declare-fun m!937549 () Bool)

(assert (=> b!1015480 m!937549))

(push 1)

(assert (not start!87900))

(assert (not b!1015480))

