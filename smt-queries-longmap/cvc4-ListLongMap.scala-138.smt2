; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2488 () Bool)

(assert start!2488)

(declare-fun b_free!509 () Bool)

(declare-fun b_next!509 () Bool)

(assert (=> start!2488 (= b_free!509 (not b_next!509))))

(declare-fun tp!2627 () Bool)

(declare-fun b_and!955 () Bool)

(assert (=> start!2488 (= tp!2627 b_and!955)))

(assert (=> start!2488 false))

(declare-datatypes ((B!630 0))(
  ( (B!631 (val!413 Int)) )
))
(declare-datatypes ((tuple2!626 0))(
  ( (tuple2!627 (_1!313 (_ BitVec 64)) (_2!313 B!630)) )
))
(declare-datatypes ((List!486 0))(
  ( (Nil!483) (Cons!482 (h!1048 tuple2!626) (t!2924 List!486)) )
))
(declare-datatypes ((ListLongMap!457 0))(
  ( (ListLongMap!458 (toList!244 List!486)) )
))
(declare-fun lm!238 () ListLongMap!457)

(declare-fun e!9440 () Bool)

(declare-fun inv!810 (ListLongMap!457) Bool)

(assert (=> start!2488 (and (inv!810 lm!238) e!9440)))

(assert (=> start!2488 tp!2627))

(declare-fun b!15515 () Bool)

(declare-fun tp!2626 () Bool)

(assert (=> b!15515 (= e!9440 tp!2626)))

(assert (= start!2488 b!15515))

(declare-fun m!10437 () Bool)

(assert (=> start!2488 m!10437))

(push 1)

(assert (not start!2488))

(assert (not b!15515))

(assert b_and!955)

(assert (not b_next!509))

(check-sat)

(pop 1)

