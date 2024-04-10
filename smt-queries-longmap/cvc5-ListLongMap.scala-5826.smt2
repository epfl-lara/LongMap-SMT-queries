; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75148 () Bool)

(assert start!75148)

(assert (=> start!75148 false))

(declare-fun e!492975 () Bool)

(assert (=> start!75148 e!492975))

(declare-fun b!885757 () Bool)

(declare-fun tp_is_empty!17785 () Bool)

(declare-fun tp!54302 () Bool)

(assert (=> b!885757 (= e!492975 (and tp_is_empty!17785 tp!54302))))

(declare-datatypes ((B!1274 0))(
  ( (B!1275 (val!8943 Int)) )
))
(declare-datatypes ((tuple2!11880 0))(
  ( (tuple2!11881 (_1!5951 (_ BitVec 64)) (_2!5951 B!1274)) )
))
(declare-datatypes ((List!17659 0))(
  ( (Nil!17656) (Cons!17655 (h!18786 tuple2!11880) (t!24936 List!17659)) )
))
(declare-fun l!906 () List!17659)

(assert (= (and start!75148 (is-Cons!17655 l!906)) b!885757))

(push 1)

(assert (not b!885757))

(assert tp_is_empty!17785)

(check-sat)

