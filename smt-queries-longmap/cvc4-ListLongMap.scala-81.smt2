; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1156 () Bool)

(assert start!1156)

(assert (=> start!1156 false))

(declare-datatypes ((B!294 0))(
  ( (B!295 (val!242 Int)) )
))
(declare-datatypes ((tuple2!284 0))(
  ( (tuple2!285 (_1!142 (_ BitVec 64)) (_2!142 B!294)) )
))
(declare-datatypes ((List!294 0))(
  ( (Nil!291) (Cons!290 (h!856 tuple2!284) (t!2441 List!294)) )
))
(declare-datatypes ((ListLongMap!289 0))(
  ( (ListLongMap!290 (toList!160 List!294)) )
))
(declare-fun lm!213 () ListLongMap!289)

(declare-fun e!5801 () Bool)

(declare-fun inv!444 (ListLongMap!289) Bool)

(assert (=> start!1156 (and (inv!444 lm!213) e!5801)))

(declare-fun b!10103 () Bool)

(declare-fun tp!1424 () Bool)

(assert (=> b!10103 (= e!5801 tp!1424)))

(assert (= start!1156 b!10103))

(declare-fun m!6453 () Bool)

(assert (=> start!1156 m!6453))

(push 1)

(assert (not start!1156))

(assert (not b!10103))

(check-sat)

(pop 1)

(push 1)

