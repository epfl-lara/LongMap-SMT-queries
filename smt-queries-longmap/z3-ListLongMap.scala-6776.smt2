; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85394 () Bool)

(assert start!85394)

(declare-fun res!663895 () Bool)

(declare-fun e!560724 () Bool)

(assert (=> start!85394 (=> (not res!663895) (not e!560724))))

(declare-datatypes ((List!20888 0))(
  ( (Nil!20885) (Cons!20884 (h!22052 (_ BitVec 64)) (t!29881 List!20888)) )
))
(declare-fun l!3519 () List!20888)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5782 (List!20888 (_ BitVec 64)) Bool)

(assert (=> start!85394 (= res!663895 (not (contains!5782 l!3519 e!29)))))

(assert (=> start!85394 e!560724))

(assert (=> start!85394 true))

(declare-fun b!993729 () Bool)

(declare-fun e!560723 () Bool)

(assert (=> b!993729 (= e!560724 e!560723)))

(declare-fun res!663896 () Bool)

(assert (=> b!993729 (=> (not res!663896) (not e!560723))))

(declare-datatypes ((tuple2!14986 0))(
  ( (tuple2!14987 (_1!7504 (_ BitVec 64)) (_2!7504 List!20888)) )
))
(declare-datatypes ((Option!544 0))(
  ( (Some!543 (v!14361 tuple2!14986)) (None!542) )
))
(declare-fun lt!440662 () Option!544)

(declare-fun isEmpty!759 (Option!544) Bool)

(assert (=> b!993729 (= res!663896 (not (isEmpty!759 lt!440662)))))

(declare-fun unapply!25 (List!20888) Option!544)

(assert (=> b!993729 (= lt!440662 (unapply!25 l!3519))))

(declare-fun b!993730 () Bool)

(assert (=> b!993730 (= e!560723 false)))

(declare-fun lt!440663 () Bool)

(declare-fun get!15735 (Option!544) tuple2!14986)

(assert (=> b!993730 (= lt!440663 (contains!5782 (_2!7504 (get!15735 lt!440662)) e!29))))

(assert (= (and start!85394 res!663895) b!993729))

(assert (= (and b!993729 res!663896) b!993730))

(declare-fun m!921815 () Bool)

(assert (=> start!85394 m!921815))

(declare-fun m!921817 () Bool)

(assert (=> b!993729 m!921817))

(declare-fun m!921819 () Bool)

(assert (=> b!993729 m!921819))

(declare-fun m!921821 () Bool)

(assert (=> b!993730 m!921821))

(declare-fun m!921823 () Bool)

(assert (=> b!993730 m!921823))

(check-sat (not b!993730) (not b!993729) (not start!85394))
(check-sat)
