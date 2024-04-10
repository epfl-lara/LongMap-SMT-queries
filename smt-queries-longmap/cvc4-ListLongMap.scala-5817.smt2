; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75026 () Bool)

(assert start!75026)

(assert (=> start!75026 false))

(declare-datatypes ((B!1224 0))(
  ( (B!1225 (val!8918 Int)) )
))
(declare-datatypes ((tuple2!11830 0))(
  ( (tuple2!11831 (_1!5926 (_ BitVec 64)) (_2!5926 B!1224)) )
))
(declare-datatypes ((List!17634 0))(
  ( (Nil!17631) (Cons!17630 (h!18761 tuple2!11830) (t!24911 List!17634)) )
))
(declare-datatypes ((ListLongMap!10599 0))(
  ( (ListLongMap!10600 (toList!5315 List!17634)) )
))
(declare-fun lm!210 () ListLongMap!10599)

(declare-fun e!492504 () Bool)

(declare-fun inv!29355 (ListLongMap!10599) Bool)

(assert (=> start!75026 (and (inv!29355 lm!210) e!492504)))

(declare-fun b!884974 () Bool)

(declare-fun tp!54191 () Bool)

(assert (=> b!884974 (= e!492504 tp!54191)))

(assert (= start!75026 b!884974))

(declare-fun m!825233 () Bool)

(assert (=> start!75026 m!825233))

(push 1)

(assert (not start!75026))

(assert (not b!884974))

(check-sat)

(pop 1)

