; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87898 () Bool)

(assert start!87898)

(declare-fun res!681153 () Bool)

(declare-fun e!571266 () Bool)

(assert (=> start!87898 (=> (not res!681153) (not e!571266))))

(declare-datatypes ((B!1470 0))(
  ( (B!1471 (val!11819 Int)) )
))
(declare-datatypes ((tuple2!15184 0))(
  ( (tuple2!15185 (_1!7603 (_ BitVec 64)) (_2!7603 B!1470)) )
))
(declare-datatypes ((List!21468 0))(
  ( (Nil!21465) (Cons!21464 (h!22662 tuple2!15184) (t!30469 List!21468)) )
))
(declare-fun l!412 () List!21468)

(declare-fun isStrictlySorted!593 (List!21468) Bool)

(assert (=> start!87898 (= res!681153 (isStrictlySorted!593 l!412))))

(assert (=> start!87898 e!571266))

(declare-fun e!571267 () Bool)

(assert (=> start!87898 e!571267))

(declare-fun tp_is_empty!23537 () Bool)

(assert (=> start!87898 tp_is_empty!23537))

(declare-fun b!1015471 () Bool)

(declare-fun value!115 () B!1470)

(assert (=> b!1015471 (= e!571266 (and (or (not (is-Cons!21464 l!412)) (not (= (_2!7603 (h!22662 l!412)) value!115))) (or (not (is-Cons!21464 l!412)) (= (_2!7603 (h!22662 l!412)) value!115)) (not (is-Nil!21465 l!412))))))

(declare-fun b!1015472 () Bool)

(declare-fun tp!70634 () Bool)

(assert (=> b!1015472 (= e!571267 (and tp_is_empty!23537 tp!70634))))

(assert (= (and start!87898 res!681153) b!1015471))

(assert (= (and start!87898 (is-Cons!21464 l!412)) b!1015472))

(declare-fun m!937545 () Bool)

(assert (=> start!87898 m!937545))

(push 1)

(assert (not start!87898))

(assert (not b!1015472))

(assert tp_is_empty!23537)

