; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103560 () Bool)

(assert start!103560)

(assert (=> start!103560 false))

(assert (=> start!103560 true))

(declare-fun e!703290 () Bool)

(assert (=> start!103560 e!703290))

(declare-fun b!1240772 () Bool)

(declare-fun tp_is_empty!31201 () Bool)

(declare-fun tp!92555 () Bool)

(assert (=> b!1240772 (= e!703290 (and tp_is_empty!31201 tp!92555))))

(declare-datatypes ((B!1802 0))(
  ( (B!1803 (val!15663 Int)) )
))
(declare-datatypes ((tuple2!20198 0))(
  ( (tuple2!20199 (_1!10110 (_ BitVec 64)) (_2!10110 B!1802)) )
))
(declare-datatypes ((List!27328 0))(
  ( (Nil!27325) (Cons!27324 (h!28533 tuple2!20198) (t!40791 List!27328)) )
))
(declare-fun l!644 () List!27328)

(assert (= (and start!103560 (is-Cons!27324 l!644)) b!1240772))

(push 1)

(assert (not b!1240772))

(assert tp_is_empty!31201)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

