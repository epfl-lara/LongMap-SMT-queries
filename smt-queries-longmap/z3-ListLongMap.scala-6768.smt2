; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84938 () Bool)

(assert start!84938)

(declare-fun res!663060 () Bool)

(declare-fun e!559555 () Bool)

(assert (=> start!84938 (=> (not res!663060) (not e!559555))))

(declare-datatypes ((List!20910 0))(
  ( (Nil!20907) (Cons!20906 (h!22068 (_ BitVec 64)) (t!29887 List!20910)) )
))
(declare-fun tail!21 () List!20910)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5709 (List!20910 (_ BitVec 64)) Bool)

(assert (=> start!84938 (= res!663060 (not (contains!5709 tail!21 head!726)))))

(assert (=> start!84938 e!559555))

(assert (=> start!84938 true))

(declare-fun b!991977 () Bool)

(declare-fun res!663059 () Bool)

(assert (=> b!991977 (=> (not res!663059) (not e!559555))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!428 (List!20910) (InoxSet (_ BitVec 64)))

(assert (=> b!991977 (= res!663059 (not (select (content!428 tail!21) head!726)))))

(declare-fun b!991978 () Bool)

(declare-fun e!559556 () Bool)

(assert (=> b!991978 (= e!559555 e!559556)))

(declare-fun res!663061 () Bool)

(assert (=> b!991978 (=> (not res!663061) (not e!559556))))

(declare-datatypes ((tuple2!15020 0))(
  ( (tuple2!15021 (_1!7521 (_ BitVec 64)) (_2!7521 List!20910)) )
))
(declare-datatypes ((Option!528 0))(
  ( (Some!527 (v!14321 tuple2!15020)) (None!526) )
))
(declare-fun lt!439859 () Option!528)

(declare-fun isEmpty!737 (Option!528) Bool)

(assert (=> b!991978 (= res!663061 (not (isEmpty!737 lt!439859)))))

(declare-fun unapply!4 (List!20910) Option!528)

(declare-fun $colon$colon!562 (List!20910 (_ BitVec 64)) List!20910)

(assert (=> b!991978 (= lt!439859 (unapply!4 ($colon$colon!562 tail!21 head!726)))))

(declare-fun b!991979 () Bool)

(assert (=> b!991979 (= e!559556 false)))

(declare-fun lt!439858 () Bool)

(declare-fun get!15676 (Option!528) tuple2!15020)

(assert (=> b!991979 (= lt!439858 (contains!5709 (_2!7521 (get!15676 lt!439859)) head!726))))

(assert (= (and start!84938 res!663060) b!991977))

(assert (= (and b!991977 res!663059) b!991978))

(assert (= (and b!991978 res!663061) b!991979))

(declare-fun m!919139 () Bool)

(assert (=> start!84938 m!919139))

(declare-fun m!919141 () Bool)

(assert (=> b!991977 m!919141))

(declare-fun m!919143 () Bool)

(assert (=> b!991977 m!919143))

(declare-fun m!919145 () Bool)

(assert (=> b!991978 m!919145))

(declare-fun m!919147 () Bool)

(assert (=> b!991978 m!919147))

(assert (=> b!991978 m!919147))

(declare-fun m!919149 () Bool)

(assert (=> b!991978 m!919149))

(declare-fun m!919151 () Bool)

(assert (=> b!991979 m!919151))

(declare-fun m!919153 () Bool)

(assert (=> b!991979 m!919153))

(check-sat (not b!991977) (not start!84938) (not b!991979) (not b!991978))
(check-sat)
