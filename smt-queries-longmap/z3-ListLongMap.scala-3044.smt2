; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42728 () Bool)

(assert start!42728)

(declare-fun b_free!12075 () Bool)

(declare-fun b_next!12075 () Bool)

(assert (=> start!42728 (= b_free!12075 (not b_next!12075))))

(declare-fun tp!42280 () Bool)

(declare-fun b_and!20611 () Bool)

(assert (=> start!42728 (= tp!42280 b_and!20611)))

(assert (=> start!42728 false))

(declare-datatypes ((B!1024 0))(
  ( (B!1025 (val!6796 Int)) )
))
(declare-datatypes ((tuple2!8964 0))(
  ( (tuple2!8965 (_1!4493 (_ BitVec 64)) (_2!4493 B!1024)) )
))
(declare-datatypes ((List!9039 0))(
  ( (Nil!9036) (Cons!9035 (h!9891 tuple2!8964) (t!15023 List!9039)) )
))
(declare-datatypes ((ListLongMap!7877 0))(
  ( (ListLongMap!7878 (toList!3954 List!9039)) )
))
(declare-fun lm!215 () ListLongMap!7877)

(declare-fun e!279871 () Bool)

(declare-fun inv!15456 (ListLongMap!7877) Bool)

(assert (=> start!42728 (and (inv!15456 lm!215) e!279871)))

(assert (=> start!42728 tp!42280))

(declare-fun b!476490 () Bool)

(declare-fun tp!42279 () Bool)

(assert (=> b!476490 (= e!279871 tp!42279)))

(assert (= start!42728 b!476490))

(declare-fun m!458799 () Bool)

(assert (=> start!42728 m!458799))

(check-sat (not start!42728) (not b!476490) b_and!20611 (not b_next!12075))
(check-sat b_and!20611 (not b_next!12075))
