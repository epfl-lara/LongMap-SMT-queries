; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75086 () Bool)

(assert start!75086)

(assert (=> start!75086 false))

(declare-fun e!492684 () Bool)

(assert (=> start!75086 e!492684))

(assert (=> start!75086 true))

(declare-fun b!885256 () Bool)

(declare-fun tp_is_empty!17753 () Bool)

(declare-fun tp!54236 () Bool)

(assert (=> b!885256 (= e!492684 (and tp_is_empty!17753 tp!54236))))

(declare-datatypes ((B!1242 0))(
  ( (B!1243 (val!8927 Int)) )
))
(declare-datatypes ((tuple2!11848 0))(
  ( (tuple2!11849 (_1!5935 (_ BitVec 64)) (_2!5935 B!1242)) )
))
(declare-datatypes ((List!17643 0))(
  ( (Nil!17640) (Cons!17639 (h!18770 tuple2!11848) (t!24920 List!17643)) )
))
(declare-fun l!906 () List!17643)

(assert (= (and start!75086 (is-Cons!17639 l!906)) b!885256))

(push 1)

(assert (not b!885256))

(assert tp_is_empty!17753)

(check-sat)

(pop 1)

(push 1)

(check-sat)

