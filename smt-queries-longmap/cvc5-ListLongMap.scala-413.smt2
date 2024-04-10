; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7768 () Bool)

(assert start!7768)

(assert (=> start!7768 false))

(declare-fun e!31729 () Bool)

(assert (=> start!7768 e!31729))

(assert (=> start!7768 true))

(declare-fun b!49397 () Bool)

(declare-fun tp_is_empty!2143 () Bool)

(declare-fun tp!6515 () Bool)

(assert (=> b!49397 (= e!31729 (and tp_is_empty!2143 tp!6515))))

(declare-datatypes ((B!992 0))(
  ( (B!993 (val!1116 Int)) )
))
(declare-datatypes ((tuple2!1814 0))(
  ( (tuple2!1815 (_1!918 (_ BitVec 64)) (_2!918 B!992)) )
))
(declare-datatypes ((List!1313 0))(
  ( (Nil!1310) (Cons!1309 (h!1889 tuple2!1814) (t!4347 List!1313)) )
))
(declare-fun l!1333 () List!1313)

(assert (= (and start!7768 (is-Cons!1309 l!1333)) b!49397))

(push 1)

(assert (not b!49397))

(assert tp_is_empty!2143)

(check-sat)

(pop 1)

