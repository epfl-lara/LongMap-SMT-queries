; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2484 () Bool)

(assert start!2484)

(declare-fun b_free!505 () Bool)

(declare-fun b_next!505 () Bool)

(assert (=> start!2484 (= b_free!505 (not b_next!505))))

(declare-fun tp!2615 () Bool)

(declare-fun b_and!951 () Bool)

(assert (=> start!2484 (= tp!2615 b_and!951)))

(assert (=> start!2484 false))

(declare-datatypes ((B!626 0))(
  ( (B!627 (val!411 Int)) )
))
(declare-datatypes ((tuple2!622 0))(
  ( (tuple2!623 (_1!311 (_ BitVec 64)) (_2!311 B!626)) )
))
(declare-datatypes ((List!484 0))(
  ( (Nil!481) (Cons!480 (h!1046 tuple2!622) (t!2922 List!484)) )
))
(declare-datatypes ((ListLongMap!453 0))(
  ( (ListLongMap!454 (toList!242 List!484)) )
))
(declare-fun lm!238 () ListLongMap!453)

(declare-fun e!9434 () Bool)

(declare-fun inv!808 (ListLongMap!453) Bool)

(assert (=> start!2484 (and (inv!808 lm!238) e!9434)))

(assert (=> start!2484 tp!2615))

(declare-fun b!15509 () Bool)

(declare-fun tp!2614 () Bool)

(assert (=> b!15509 (= e!9434 tp!2614)))

(assert (= start!2484 b!15509))

(declare-fun m!10433 () Bool)

(assert (=> start!2484 m!10433))

(push 1)

(assert (not start!2484))

(assert (not b!15509))

(assert b_and!951)

(assert (not b_next!505))

(check-sat)

(pop 1)

