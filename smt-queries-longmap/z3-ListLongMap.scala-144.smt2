; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2648 () Bool)

(assert start!2648)

(declare-fun b_free!543 () Bool)

(declare-fun b_next!543 () Bool)

(assert (=> start!2648 (= b_free!543 (not b_next!543))))

(declare-fun tp!2755 () Bool)

(declare-fun b_and!1037 () Bool)

(assert (=> start!2648 (= tp!2755 b_and!1037)))

(declare-fun res!11884 () Bool)

(declare-fun e!9676 () Bool)

(assert (=> start!2648 (=> (not res!11884) (not e!9676))))

(declare-datatypes ((B!664 0))(
  ( (B!665 (val!430 Int)) )
))
(declare-datatypes ((tuple2!660 0))(
  ( (tuple2!661 (_1!330 (_ BitVec 64)) (_2!330 B!664)) )
))
(declare-datatypes ((List!515 0))(
  ( (Nil!512) (Cons!511 (h!1077 tuple2!660) (t!3001 List!515)) )
))
(declare-datatypes ((ListLongMap!491 0))(
  ( (ListLongMap!492 (toList!261 List!515)) )
))
(declare-fun lm!221 () ListLongMap!491)

(declare-fun p!191 () Int)

(declare-fun forall!132 (List!515 Int) Bool)

(assert (=> start!2648 (= res!11884 (forall!132 (toList!261 lm!221) p!191))))

(assert (=> start!2648 e!9676))

(declare-fun e!9677 () Bool)

(declare-fun inv!857 (ListLongMap!491) Bool)

(assert (=> start!2648 (and (inv!857 lm!221) e!9677)))

(assert (=> start!2648 tp!2755))

(declare-fun b!15843 () Bool)

(declare-fun res!11883 () Bool)

(assert (=> b!15843 (=> (not res!11883) (not e!9676))))

(declare-fun isEmpty!142 (ListLongMap!491) Bool)

(assert (=> b!15843 (= res!11883 (not (isEmpty!142 lm!221)))))

(declare-fun b!15844 () Bool)

(assert (=> b!15844 (= e!9676 false)))

(declare-fun lt!3921 () Bool)

(declare-fun tail!66 (ListLongMap!491) ListLongMap!491)

(assert (=> b!15844 (= lt!3921 (forall!132 (toList!261 (tail!66 lm!221)) p!191))))

(declare-fun b!15845 () Bool)

(declare-fun tp!2756 () Bool)

(assert (=> b!15845 (= e!9677 tp!2756)))

(assert (= (and start!2648 res!11884) b!15843))

(assert (= (and b!15843 res!11883) b!15844))

(assert (= start!2648 b!15845))

(declare-fun m!10875 () Bool)

(assert (=> start!2648 m!10875))

(declare-fun m!10877 () Bool)

(assert (=> start!2648 m!10877))

(declare-fun m!10879 () Bool)

(assert (=> b!15843 m!10879))

(declare-fun m!10881 () Bool)

(assert (=> b!15844 m!10881))

(declare-fun m!10883 () Bool)

(assert (=> b!15844 m!10883))

(check-sat (not b!15845) (not b!15844) (not b_next!543) (not b!15843) (not start!2648) b_and!1037)
(check-sat b_and!1037 (not b_next!543))
