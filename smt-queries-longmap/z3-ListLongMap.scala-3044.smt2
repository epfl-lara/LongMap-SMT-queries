; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42712 () Bool)

(assert start!42712)

(declare-fun b_free!12073 () Bool)

(declare-fun b_next!12073 () Bool)

(assert (=> start!42712 (= b_free!12073 (not b_next!12073))))

(declare-fun tp!42274 () Bool)

(declare-fun b_and!20583 () Bool)

(assert (=> start!42712 (= tp!42274 b_and!20583)))

(assert (=> start!42712 false))

(declare-datatypes ((B!1022 0))(
  ( (B!1023 (val!6795 Int)) )
))
(declare-datatypes ((tuple2!9022 0))(
  ( (tuple2!9023 (_1!4522 (_ BitVec 64)) (_2!4522 B!1022)) )
))
(declare-datatypes ((List!9083 0))(
  ( (Nil!9080) (Cons!9079 (h!9935 tuple2!9022) (t!15058 List!9083)) )
))
(declare-datatypes ((ListLongMap!7925 0))(
  ( (ListLongMap!7926 (toList!3978 List!9083)) )
))
(declare-fun lm!215 () ListLongMap!7925)

(declare-fun e!279694 () Bool)

(declare-fun inv!15455 (ListLongMap!7925) Bool)

(assert (=> start!42712 (and (inv!15455 lm!215) e!279694)))

(assert (=> start!42712 tp!42274))

(declare-fun b!476216 () Bool)

(declare-fun tp!42273 () Bool)

(assert (=> b!476216 (= e!279694 tp!42273)))

(assert (= start!42712 b!476216))

(declare-fun m!458063 () Bool)

(assert (=> start!42712 m!458063))

(check-sat (not start!42712) (not b!476216) b_and!20583 (not b_next!12073))
(check-sat b_and!20583 (not b_next!12073))
