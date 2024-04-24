; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2646 () Bool)

(assert start!2646)

(declare-fun b_free!541 () Bool)

(declare-fun b_next!541 () Bool)

(assert (=> start!2646 (= b_free!541 (not b_next!541))))

(declare-fun tp!2749 () Bool)

(declare-fun b_and!1035 () Bool)

(assert (=> start!2646 (= tp!2749 b_and!1035)))

(declare-fun res!11876 () Bool)

(declare-fun e!9667 () Bool)

(assert (=> start!2646 (=> (not res!11876) (not e!9667))))

(declare-datatypes ((B!662 0))(
  ( (B!663 (val!429 Int)) )
))
(declare-datatypes ((tuple2!654 0))(
  ( (tuple2!655 (_1!327 (_ BitVec 64)) (_2!327 B!662)) )
))
(declare-datatypes ((List!510 0))(
  ( (Nil!507) (Cons!506 (h!1072 tuple2!654) (t!2996 List!510)) )
))
(declare-datatypes ((ListLongMap!485 0))(
  ( (ListLongMap!486 (toList!258 List!510)) )
))
(declare-fun lm!221 () ListLongMap!485)

(declare-fun p!191 () Int)

(declare-fun forall!131 (List!510 Int) Bool)

(assert (=> start!2646 (= res!11876 (forall!131 (toList!258 lm!221) p!191))))

(assert (=> start!2646 e!9667))

(declare-fun e!9666 () Bool)

(declare-fun inv!856 (ListLongMap!485) Bool)

(assert (=> start!2646 (and (inv!856 lm!221) e!9666)))

(assert (=> start!2646 tp!2749))

(declare-fun b!15828 () Bool)

(declare-fun res!11875 () Bool)

(assert (=> b!15828 (=> (not res!11875) (not e!9667))))

(declare-fun isEmpty!141 (ListLongMap!485) Bool)

(assert (=> b!15828 (= res!11875 (not (isEmpty!141 lm!221)))))

(declare-fun b!15829 () Bool)

(assert (=> b!15829 (= e!9667 false)))

(declare-fun lt!3918 () Bool)

(declare-fun tail!65 (ListLongMap!485) ListLongMap!485)

(assert (=> b!15829 (= lt!3918 (forall!131 (toList!258 (tail!65 lm!221)) p!191))))

(declare-fun b!15830 () Bool)

(declare-fun tp!2750 () Bool)

(assert (=> b!15830 (= e!9666 tp!2750)))

(assert (= (and start!2646 res!11876) b!15828))

(assert (= (and b!15828 res!11875) b!15829))

(assert (= start!2646 b!15830))

(declare-fun m!10857 () Bool)

(assert (=> start!2646 m!10857))

(declare-fun m!10859 () Bool)

(assert (=> start!2646 m!10859))

(declare-fun m!10861 () Bool)

(assert (=> b!15828 m!10861))

(declare-fun m!10863 () Bool)

(assert (=> b!15829 m!10863))

(declare-fun m!10865 () Bool)

(assert (=> b!15829 m!10865))

(check-sat (not start!2646) (not b!15829) (not b_next!541) (not b!15830) b_and!1035 (not b!15828))
(check-sat b_and!1035 (not b_next!541))
