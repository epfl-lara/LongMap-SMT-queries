; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85208 () Bool)

(assert start!85208)

(declare-fun res!663442 () Bool)

(declare-fun e!559993 () Bool)

(assert (=> start!85208 (=> (not res!663442) (not e!559993))))

(declare-datatypes ((List!20934 0))(
  ( (Nil!20931) (Cons!20930 (h!22092 (_ BitVec 64)) (t!29926 List!20934)) )
))
(declare-fun l!3519 () List!20934)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5733 (List!20934 (_ BitVec 64)) Bool)

(assert (=> start!85208 (= res!663442 (not (contains!5733 l!3519 e!29)))))

(assert (=> start!85208 e!559993))

(assert (=> start!85208 true))

(declare-fun b!992587 () Bool)

(declare-fun e!559994 () Bool)

(assert (=> b!992587 (= e!559993 e!559994)))

(declare-fun res!663441 () Bool)

(assert (=> b!992587 (=> (not res!663441) (not e!559994))))

(declare-datatypes ((tuple2!15062 0))(
  ( (tuple2!15063 (_1!7542 (_ BitVec 64)) (_2!7542 List!20934)) )
))
(declare-datatypes ((Option!549 0))(
  ( (Some!548 (v!14363 tuple2!15062)) (None!547) )
))
(declare-fun lt!440065 () Option!549)

(declare-fun isEmpty!758 (Option!549) Bool)

(assert (=> b!992587 (= res!663441 (not (isEmpty!758 lt!440065)))))

(declare-fun unapply!25 (List!20934) Option!549)

(assert (=> b!992587 (= lt!440065 (unapply!25 l!3519))))

(declare-fun b!992588 () Bool)

(assert (=> b!992588 (= e!559994 false)))

(declare-fun lt!440066 () Bool)

(declare-fun get!15701 (Option!549) tuple2!15062)

(assert (=> b!992588 (= lt!440066 (contains!5733 (_2!7542 (get!15701 lt!440065)) e!29))))

(assert (= (and start!85208 res!663442) b!992587))

(assert (= (and b!992587 res!663441) b!992588))

(declare-fun m!919763 () Bool)

(assert (=> start!85208 m!919763))

(declare-fun m!919765 () Bool)

(assert (=> b!992587 m!919765))

(declare-fun m!919767 () Bool)

(assert (=> b!992587 m!919767))

(declare-fun m!919769 () Bool)

(assert (=> b!992588 m!919769))

(declare-fun m!919771 () Bool)

(assert (=> b!992588 m!919771))

(check-sat (not b!992588) (not start!85208) (not b!992587))
(check-sat)
