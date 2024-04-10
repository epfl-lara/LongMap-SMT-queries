; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2646 () Bool)

(assert start!2646)

(declare-fun b_free!541 () Bool)

(declare-fun b_next!541 () Bool)

(assert (=> start!2646 (= b_free!541 (not b_next!541))))

(declare-fun tp!2750 () Bool)

(declare-fun b_and!1035 () Bool)

(assert (=> start!2646 (= tp!2750 b_and!1035)))

(declare-fun res!11877 () Bool)

(declare-fun e!9670 () Bool)

(assert (=> start!2646 (=> (not res!11877) (not e!9670))))

(declare-datatypes ((B!662 0))(
  ( (B!663 (val!429 Int)) )
))
(declare-datatypes ((tuple2!658 0))(
  ( (tuple2!659 (_1!329 (_ BitVec 64)) (_2!329 B!662)) )
))
(declare-datatypes ((List!514 0))(
  ( (Nil!511) (Cons!510 (h!1076 tuple2!658) (t!3000 List!514)) )
))
(declare-datatypes ((ListLongMap!489 0))(
  ( (ListLongMap!490 (toList!260 List!514)) )
))
(declare-fun lm!221 () ListLongMap!489)

(declare-fun p!191 () Int)

(declare-fun forall!131 (List!514 Int) Bool)

(assert (=> start!2646 (= res!11877 (forall!131 (toList!260 lm!221) p!191))))

(assert (=> start!2646 e!9670))

(declare-fun e!9671 () Bool)

(declare-fun inv!856 (ListLongMap!489) Bool)

(assert (=> start!2646 (and (inv!856 lm!221) e!9671)))

(assert (=> start!2646 tp!2750))

(declare-fun b!15834 () Bool)

(declare-fun res!11878 () Bool)

(assert (=> b!15834 (=> (not res!11878) (not e!9670))))

(declare-fun isEmpty!141 (ListLongMap!489) Bool)

(assert (=> b!15834 (= res!11878 (not (isEmpty!141 lm!221)))))

(declare-fun b!15835 () Bool)

(assert (=> b!15835 (= e!9670 false)))

(declare-fun lt!3918 () Bool)

(declare-fun tail!65 (ListLongMap!489) ListLongMap!489)

(assert (=> b!15835 (= lt!3918 (forall!131 (toList!260 (tail!65 lm!221)) p!191))))

(declare-fun b!15836 () Bool)

(declare-fun tp!2749 () Bool)

(assert (=> b!15836 (= e!9671 tp!2749)))

(assert (= (and start!2646 res!11877) b!15834))

(assert (= (and b!15834 res!11878) b!15835))

(assert (= start!2646 b!15836))

(declare-fun m!10865 () Bool)

(assert (=> start!2646 m!10865))

(declare-fun m!10867 () Bool)

(assert (=> start!2646 m!10867))

(declare-fun m!10869 () Bool)

(assert (=> b!15834 m!10869))

(declare-fun m!10871 () Bool)

(assert (=> b!15835 m!10871))

(declare-fun m!10873 () Bool)

(assert (=> b!15835 m!10873))

(push 1)

(assert (not b!15836))

(assert (not start!2646))

(assert (not b_next!541))

(assert (not b!15834))

(assert (not b!15835))

(assert b_and!1035)

(check-sat)

(pop 1)

