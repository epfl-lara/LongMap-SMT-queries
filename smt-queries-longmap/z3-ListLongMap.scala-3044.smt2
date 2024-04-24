; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42712 () Bool)

(assert start!42712)

(declare-fun b_free!12073 () Bool)

(declare-fun b_next!12073 () Bool)

(assert (=> start!42712 (= b_free!12073 (not b_next!12073))))

(declare-fun tp!42274 () Bool)

(declare-fun b_and!20619 () Bool)

(assert (=> start!42712 (= tp!42274 b_and!20619)))

(assert (=> start!42712 false))

(declare-datatypes ((B!1022 0))(
  ( (B!1023 (val!6795 Int)) )
))
(declare-datatypes ((tuple2!8886 0))(
  ( (tuple2!8887 (_1!4454 (_ BitVec 64)) (_2!4454 B!1022)) )
))
(declare-datatypes ((List!8947 0))(
  ( (Nil!8944) (Cons!8943 (h!9799 tuple2!8886) (t!14923 List!8947)) )
))
(declare-datatypes ((ListLongMap!7801 0))(
  ( (ListLongMap!7802 (toList!3916 List!8947)) )
))
(declare-fun lm!215 () ListLongMap!7801)

(declare-fun e!279829 () Bool)

(declare-fun inv!15455 (ListLongMap!7801) Bool)

(assert (=> start!42712 (and (inv!15455 lm!215) e!279829)))

(assert (=> start!42712 tp!42274))

(declare-fun b!476426 () Bool)

(declare-fun tp!42273 () Bool)

(assert (=> b!476426 (= e!279829 tp!42273)))

(assert (= start!42712 b!476426))

(declare-fun m!458979 () Bool)

(assert (=> start!42712 m!458979))

(check-sat (not start!42712) (not b!476426) b_and!20619 (not b_next!12073))
(check-sat b_and!20619 (not b_next!12073))
