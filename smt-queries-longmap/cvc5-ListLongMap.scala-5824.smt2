; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75124 () Bool)

(assert start!75124)

(assert (=> start!75124 false))

(declare-fun e!492870 () Bool)

(assert (=> start!75124 e!492870))

(declare-fun b!885592 () Bool)

(declare-fun tp_is_empty!17773 () Bool)

(declare-fun tp!54275 () Bool)

(assert (=> b!885592 (= e!492870 (and tp_is_empty!17773 tp!54275))))

(declare-datatypes ((B!1262 0))(
  ( (B!1263 (val!8937 Int)) )
))
(declare-datatypes ((tuple2!11868 0))(
  ( (tuple2!11869 (_1!5945 (_ BitVec 64)) (_2!5945 B!1262)) )
))
(declare-datatypes ((List!17653 0))(
  ( (Nil!17650) (Cons!17649 (h!18780 tuple2!11868) (t!24930 List!17653)) )
))
(declare-fun l!906 () List!17653)

(assert (= (and start!75124 (is-Cons!17649 l!906)) b!885592))

(push 1)

(assert (not b!885592))

(assert tp_is_empty!17773)

(check-sat)

