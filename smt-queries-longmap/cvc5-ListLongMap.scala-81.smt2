; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1152 () Bool)

(assert start!1152)

(assert (=> start!1152 false))

(declare-datatypes ((B!290 0))(
  ( (B!291 (val!240 Int)) )
))
(declare-datatypes ((tuple2!280 0))(
  ( (tuple2!281 (_1!140 (_ BitVec 64)) (_2!140 B!290)) )
))
(declare-datatypes ((List!292 0))(
  ( (Nil!289) (Cons!288 (h!854 tuple2!280) (t!2439 List!292)) )
))
(declare-datatypes ((ListLongMap!285 0))(
  ( (ListLongMap!286 (toList!158 List!292)) )
))
(declare-fun lm!213 () ListLongMap!285)

(declare-fun e!5795 () Bool)

(declare-fun inv!442 (ListLongMap!285) Bool)

(assert (=> start!1152 (and (inv!442 lm!213) e!5795)))

(declare-fun b!10097 () Bool)

(declare-fun tp!1418 () Bool)

(assert (=> b!10097 (= e!5795 tp!1418)))

(assert (= start!1152 b!10097))

(declare-fun m!6449 () Bool)

(assert (=> start!1152 m!6449))

(push 1)

(assert (not start!1152))

(assert (not b!10097))

(check-sat)

(pop 1)

