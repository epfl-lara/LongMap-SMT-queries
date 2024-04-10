; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75152 () Bool)

(assert start!75152)

(assert (=> start!75152 false))

(declare-fun e!492981 () Bool)

(assert (=> start!75152 e!492981))

(declare-fun b!885763 () Bool)

(declare-fun tp_is_empty!17789 () Bool)

(declare-fun tp!54308 () Bool)

(assert (=> b!885763 (= e!492981 (and tp_is_empty!17789 tp!54308))))

(declare-datatypes ((B!1278 0))(
  ( (B!1279 (val!8945 Int)) )
))
(declare-datatypes ((tuple2!11884 0))(
  ( (tuple2!11885 (_1!5953 (_ BitVec 64)) (_2!5953 B!1278)) )
))
(declare-datatypes ((List!17661 0))(
  ( (Nil!17658) (Cons!17657 (h!18788 tuple2!11884) (t!24938 List!17661)) )
))
(declare-fun l!906 () List!17661)

(assert (= (and start!75152 (is-Cons!17657 l!906)) b!885763))

(push 1)

(assert (not b!885763))

(assert tp_is_empty!17789)

(check-sat)

(pop 1)

(push 1)

(check-sat)

