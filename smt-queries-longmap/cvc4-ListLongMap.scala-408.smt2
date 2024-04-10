; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7622 () Bool)

(assert start!7622)

(assert (=> start!7622 false))

(declare-fun e!31204 () Bool)

(assert (=> start!7622 e!31204))

(assert (=> start!7622 true))

(declare-fun b!48605 () Bool)

(declare-fun tp_is_empty!2117 () Bool)

(declare-fun tp!6434 () Bool)

(assert (=> b!48605 (= e!31204 (and tp_is_empty!2117 tp!6434))))

(declare-datatypes ((B!966 0))(
  ( (B!967 (val!1103 Int)) )
))
(declare-datatypes ((tuple2!1788 0))(
  ( (tuple2!1789 (_1!905 (_ BitVec 64)) (_2!905 B!966)) )
))
(declare-datatypes ((List!1300 0))(
  ( (Nil!1297) (Cons!1296 (h!1876 tuple2!1788) (t!4328 List!1300)) )
))
(declare-fun l!1333 () List!1300)

(assert (= (and start!7622 (is-Cons!1296 l!1333)) b!48605))

(push 1)

(assert (not b!48605))

(assert tp_is_empty!2117)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

