; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75022 () Bool)

(assert start!75022)

(assert (=> start!75022 false))

(declare-datatypes ((B!1220 0))(
  ( (B!1221 (val!8916 Int)) )
))
(declare-datatypes ((tuple2!11826 0))(
  ( (tuple2!11827 (_1!5924 (_ BitVec 64)) (_2!5924 B!1220)) )
))
(declare-datatypes ((List!17632 0))(
  ( (Nil!17629) (Cons!17628 (h!18759 tuple2!11826) (t!24909 List!17632)) )
))
(declare-datatypes ((ListLongMap!10595 0))(
  ( (ListLongMap!10596 (toList!5313 List!17632)) )
))
(declare-fun lm!210 () ListLongMap!10595)

(declare-fun e!492498 () Bool)

(declare-fun inv!29353 (ListLongMap!10595) Bool)

(assert (=> start!75022 (and (inv!29353 lm!210) e!492498)))

(declare-fun b!884968 () Bool)

(declare-fun tp!54185 () Bool)

(assert (=> b!884968 (= e!492498 tp!54185)))

(assert (= start!75022 b!884968))

(declare-fun m!825229 () Bool)

(assert (=> start!75022 m!825229))

(push 1)

(assert (not start!75022))

(assert (not b!884968))

(check-sat)

(pop 1)

