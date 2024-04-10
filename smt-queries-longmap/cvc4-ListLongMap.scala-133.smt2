; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2368 () Bool)

(assert start!2368)

(declare-fun b_free!479 () Bool)

(declare-fun b_next!479 () Bool)

(assert (=> start!2368 (= b_free!479 (not b_next!479))))

(declare-fun tp!2510 () Bool)

(declare-fun b_and!895 () Bool)

(assert (=> start!2368 (= tp!2510 b_and!895)))

(assert (=> start!2368 false))

(declare-datatypes ((B!600 0))(
  ( (B!601 (val!398 Int)) )
))
(declare-datatypes ((tuple2!596 0))(
  ( (tuple2!597 (_1!298 (_ BitVec 64)) (_2!298 B!600)) )
))
(declare-datatypes ((List!459 0))(
  ( (Nil!456) (Cons!455 (h!1021 tuple2!596) (t!2867 List!459)) )
))
(declare-datatypes ((ListLongMap!427 0))(
  ( (ListLongMap!428 (toList!229 List!459)) )
))
(declare-fun lm!238 () ListLongMap!427)

(declare-fun e!9257 () Bool)

(declare-fun inv!770 (ListLongMap!427) Bool)

(assert (=> start!2368 (and (inv!770 lm!238) e!9257)))

(assert (=> start!2368 tp!2510))

(declare-fun b!15278 () Bool)

(declare-fun tp!2509 () Bool)

(assert (=> b!15278 (= e!9257 tp!2509)))

(assert (= start!2368 b!15278))

(declare-fun m!10167 () Bool)

(assert (=> start!2368 m!10167))

(push 1)

(assert (not start!2368))

(assert (not b!15278))

(assert b_and!895)

(assert (not b_next!479))

(check-sat)

