; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2364 () Bool)

(assert start!2364)

(declare-fun b_free!475 () Bool)

(declare-fun b_next!475 () Bool)

(assert (=> start!2364 (= b_free!475 (not b_next!475))))

(declare-fun tp!2498 () Bool)

(declare-fun b_and!891 () Bool)

(assert (=> start!2364 (= tp!2498 b_and!891)))

(assert (=> start!2364 false))

(declare-datatypes ((B!596 0))(
  ( (B!597 (val!396 Int)) )
))
(declare-datatypes ((tuple2!592 0))(
  ( (tuple2!593 (_1!296 (_ BitVec 64)) (_2!296 B!596)) )
))
(declare-datatypes ((List!457 0))(
  ( (Nil!454) (Cons!453 (h!1019 tuple2!592) (t!2865 List!457)) )
))
(declare-datatypes ((ListLongMap!423 0))(
  ( (ListLongMap!424 (toList!227 List!457)) )
))
(declare-fun lm!238 () ListLongMap!423)

(declare-fun e!9251 () Bool)

(declare-fun inv!768 (ListLongMap!423) Bool)

(assert (=> start!2364 (and (inv!768 lm!238) e!9251)))

(assert (=> start!2364 tp!2498))

(declare-fun b!15272 () Bool)

(declare-fun tp!2497 () Bool)

(assert (=> b!15272 (= e!9251 tp!2497)))

(assert (= start!2364 b!15272))

(declare-fun m!10163 () Bool)

(assert (=> start!2364 m!10163))

(push 1)

(assert (not start!2364))

(assert (not b!15272))

(assert b_and!891)

(assert (not b_next!475))

(check-sat)

(pop 1)

