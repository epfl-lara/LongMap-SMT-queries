; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103668 () Bool)

(assert start!103668)

(assert (=> start!103668 false))

(assert (=> start!103668 true))

(declare-fun e!703761 () Bool)

(assert (=> start!103668 e!703761))

(declare-fun b!1241594 () Bool)

(declare-fun tp_is_empty!31249 () Bool)

(declare-fun tp!92654 () Bool)

(assert (=> b!1241594 (= e!703761 (and tp_is_empty!31249 tp!92654))))

(declare-datatypes ((B!1850 0))(
  ( (B!1851 (val!15687 Int)) )
))
(declare-datatypes ((tuple2!20246 0))(
  ( (tuple2!20247 (_1!10134 (_ BitVec 64)) (_2!10134 B!1850)) )
))
(declare-datatypes ((List!27352 0))(
  ( (Nil!27349) (Cons!27348 (h!28557 tuple2!20246) (t!40815 List!27352)) )
))
(declare-fun l!644 () List!27352)

(assert (= (and start!103668 (is-Cons!27348 l!644)) b!1241594))

(push 1)

(assert (not b!1241594))

(assert tp_is_empty!31249)

(check-sat)

(pop 1)

