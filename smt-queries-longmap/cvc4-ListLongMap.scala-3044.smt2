; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42730 () Bool)

(assert start!42730)

(declare-fun b_free!12077 () Bool)

(declare-fun b_next!12077 () Bool)

(assert (=> start!42730 (= b_free!12077 (not b_next!12077))))

(declare-fun tp!42286 () Bool)

(declare-fun b_and!20613 () Bool)

(assert (=> start!42730 (= tp!42286 b_and!20613)))

(assert (=> start!42730 false))

(declare-datatypes ((B!1026 0))(
  ( (B!1027 (val!6797 Int)) )
))
(declare-datatypes ((tuple2!8966 0))(
  ( (tuple2!8967 (_1!4494 (_ BitVec 64)) (_2!4494 B!1026)) )
))
(declare-datatypes ((List!9040 0))(
  ( (Nil!9037) (Cons!9036 (h!9892 tuple2!8966) (t!15024 List!9040)) )
))
(declare-datatypes ((ListLongMap!7879 0))(
  ( (ListLongMap!7880 (toList!3955 List!9040)) )
))
(declare-fun lm!215 () ListLongMap!7879)

(declare-fun e!279874 () Bool)

(declare-fun inv!15457 (ListLongMap!7879) Bool)

(assert (=> start!42730 (and (inv!15457 lm!215) e!279874)))

(assert (=> start!42730 tp!42286))

(declare-fun b!476493 () Bool)

(declare-fun tp!42285 () Bool)

(assert (=> b!476493 (= e!279874 tp!42285)))

(assert (= start!42730 b!476493))

(declare-fun m!458801 () Bool)

(assert (=> start!42730 m!458801))

(push 1)

(assert (not start!42730))

(assert (not b!476493))

(assert b_and!20613)

(assert (not b_next!12077))

(check-sat)

