; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42726 () Bool)

(assert start!42726)

(declare-fun b_free!12073 () Bool)

(declare-fun b_next!12073 () Bool)

(assert (=> start!42726 (= b_free!12073 (not b_next!12073))))

(declare-fun tp!42274 () Bool)

(declare-fun b_and!20609 () Bool)

(assert (=> start!42726 (= tp!42274 b_and!20609)))

(assert (=> start!42726 false))

(declare-datatypes ((B!1022 0))(
  ( (B!1023 (val!6795 Int)) )
))
(declare-datatypes ((tuple2!8962 0))(
  ( (tuple2!8963 (_1!4492 (_ BitVec 64)) (_2!4492 B!1022)) )
))
(declare-datatypes ((List!9038 0))(
  ( (Nil!9035) (Cons!9034 (h!9890 tuple2!8962) (t!15022 List!9038)) )
))
(declare-datatypes ((ListLongMap!7875 0))(
  ( (ListLongMap!7876 (toList!3953 List!9038)) )
))
(declare-fun lm!215 () ListLongMap!7875)

(declare-fun e!279868 () Bool)

(declare-fun inv!15455 (ListLongMap!7875) Bool)

(assert (=> start!42726 (and (inv!15455 lm!215) e!279868)))

(assert (=> start!42726 tp!42274))

(declare-fun b!476487 () Bool)

(declare-fun tp!42273 () Bool)

(assert (=> b!476487 (= e!279868 tp!42273)))

(assert (= start!42726 b!476487))

(declare-fun m!458797 () Bool)

(assert (=> start!42726 m!458797))

(push 1)

(assert (not start!42726))

(assert (not b!476487))

(assert b_and!20609)

(assert (not b_next!12073))

(check-sat)

