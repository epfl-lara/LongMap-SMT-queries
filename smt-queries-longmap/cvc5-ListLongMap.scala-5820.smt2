; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75082 () Bool)

(assert start!75082)

(assert (=> start!75082 false))

(declare-fun e!492678 () Bool)

(assert (=> start!75082 e!492678))

(assert (=> start!75082 true))

(declare-fun b!885250 () Bool)

(declare-fun tp_is_empty!17749 () Bool)

(declare-fun tp!54230 () Bool)

(assert (=> b!885250 (= e!492678 (and tp_is_empty!17749 tp!54230))))

(declare-datatypes ((B!1238 0))(
  ( (B!1239 (val!8925 Int)) )
))
(declare-datatypes ((tuple2!11844 0))(
  ( (tuple2!11845 (_1!5933 (_ BitVec 64)) (_2!5933 B!1238)) )
))
(declare-datatypes ((List!17641 0))(
  ( (Nil!17638) (Cons!17637 (h!18768 tuple2!11844) (t!24918 List!17641)) )
))
(declare-fun l!906 () List!17641)

(assert (= (and start!75082 (is-Cons!17637 l!906)) b!885250))

(push 1)

(assert (not b!885250))

(assert tp_is_empty!17749)

(check-sat)

