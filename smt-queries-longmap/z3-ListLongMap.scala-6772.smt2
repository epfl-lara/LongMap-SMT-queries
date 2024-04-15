; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85058 () Bool)

(assert start!85058)

(declare-datatypes ((List!20922 0))(
  ( (Nil!20919) (Cons!20918 (h!22080 (_ BitVec 64)) (t!29905 List!20922)) )
))
(declare-fun tail!21 () List!20922)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun lt!439973 () List!20922)

(declare-fun e!559763 () Bool)

(declare-fun b!992261 () Bool)

(declare-fun -!444 (List!20922 (_ BitVec 64)) List!20922)

(assert (=> b!992261 (= e!559763 (not (= (-!444 lt!439973 head!726) tail!21)))))

(declare-fun b!992258 () Bool)

(declare-fun res!663241 () Bool)

(declare-fun e!559762 () Bool)

(assert (=> b!992258 (=> (not res!663241) (not e!559762))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!440 (List!20922) (InoxSet (_ BitVec 64)))

(assert (=> b!992258 (= res!663241 (not (select (content!440 tail!21) head!726)))))

(declare-fun b!992260 () Bool)

(declare-fun res!663240 () Bool)

(assert (=> b!992260 (=> (not res!663240) (not e!559763))))

(get-info :version)

(assert (=> b!992260 (= res!663240 ((_ is Nil!20919) lt!439973))))

(declare-fun res!663238 () Bool)

(assert (=> start!85058 (=> (not res!663238) (not e!559762))))

(declare-fun contains!5721 (List!20922 (_ BitVec 64)) Bool)

(assert (=> start!85058 (= res!663238 (not (contains!5721 tail!21 head!726)))))

(assert (=> start!85058 e!559762))

(assert (=> start!85058 true))

(declare-fun b!992259 () Bool)

(assert (=> b!992259 (= e!559762 e!559763)))

(declare-fun res!663239 () Bool)

(assert (=> b!992259 (=> (not res!663239) (not e!559763))))

(declare-datatypes ((tuple2!15038 0))(
  ( (tuple2!15039 (_1!7530 (_ BitVec 64)) (_2!7530 List!20922)) )
))
(declare-datatypes ((Option!537 0))(
  ( (Some!536 (v!14339 tuple2!15038)) (None!535) )
))
(declare-fun isEmpty!746 (Option!537) Bool)

(declare-fun unapply!13 (List!20922) Option!537)

(assert (=> b!992259 (= res!663239 (isEmpty!746 (unapply!13 lt!439973)))))

(declare-fun $colon$colon!571 (List!20922 (_ BitVec 64)) List!20922)

(assert (=> b!992259 (= lt!439973 ($colon$colon!571 tail!21 head!726))))

(assert (= (and start!85058 res!663238) b!992258))

(assert (= (and b!992258 res!663241) b!992259))

(assert (= (and b!992259 res!663239) b!992260))

(assert (= (and b!992260 res!663240) b!992261))

(declare-fun m!919475 () Bool)

(assert (=> b!992261 m!919475))

(declare-fun m!919477 () Bool)

(assert (=> b!992258 m!919477))

(declare-fun m!919479 () Bool)

(assert (=> b!992258 m!919479))

(declare-fun m!919481 () Bool)

(assert (=> start!85058 m!919481))

(declare-fun m!919483 () Bool)

(assert (=> b!992259 m!919483))

(assert (=> b!992259 m!919483))

(declare-fun m!919485 () Bool)

(assert (=> b!992259 m!919485))

(declare-fun m!919487 () Bool)

(assert (=> b!992259 m!919487))

(check-sat (not b!992259) (not b!992258) (not b!992261) (not start!85058))
(check-sat)
(get-model)

(declare-fun d!117981 () Bool)

(assert (=> d!117981 (= (isEmpty!746 (unapply!13 lt!439973)) (not ((_ is Some!536) (unapply!13 lt!439973))))))

(assert (=> b!992259 d!117981))

(declare-fun d!117983 () Bool)

(assert (=> d!117983 (= (unapply!13 lt!439973) (ite ((_ is Nil!20919) lt!439973) None!535 (Some!536 (tuple2!15039 (h!22080 lt!439973) (t!29905 lt!439973)))))))

(assert (=> b!992259 d!117983))

(declare-fun d!117989 () Bool)

(assert (=> d!117989 (= ($colon$colon!571 tail!21 head!726) (Cons!20918 head!726 tail!21))))

(assert (=> b!992259 d!117989))

(declare-fun d!117991 () Bool)

(declare-fun c!100651 () Bool)

(assert (=> d!117991 (= c!100651 ((_ is Nil!20919) tail!21))))

(declare-fun e!559787 () (InoxSet (_ BitVec 64)))

(assert (=> d!117991 (= (content!440 tail!21) e!559787)))

(declare-fun b!992300 () Bool)

(assert (=> b!992300 (= e!559787 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992301 () Bool)

(assert (=> b!992301 (= e!559787 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22080 tail!21) true) (content!440 (t!29905 tail!21))))))

(assert (= (and d!117991 c!100651) b!992300))

(assert (= (and d!117991 (not c!100651)) b!992301))

(declare-fun m!919519 () Bool)

(assert (=> b!992301 m!919519))

(declare-fun m!919521 () Bool)

(assert (=> b!992301 m!919521))

(assert (=> b!992258 d!117991))

(declare-fun bm!42080 () Bool)

(declare-fun call!42083 () List!20922)

(assert (=> bm!42080 (= call!42083 (-!444 (t!29905 lt!439973) head!726))))

(declare-fun d!117995 () Bool)

(declare-fun e!559811 () Bool)

(assert (=> d!117995 e!559811))

(declare-fun res!663283 () Bool)

(assert (=> d!117995 (=> (not res!663283) (not e!559811))))

(declare-fun lt!439991 () List!20922)

(declare-fun size!30659 (List!20922) Int)

(assert (=> d!117995 (= res!663283 (<= (size!30659 lt!439991) (size!30659 lt!439973)))))

(declare-fun e!559813 () List!20922)

(assert (=> d!117995 (= lt!439991 e!559813)))

(declare-fun c!100663 () Bool)

(assert (=> d!117995 (= c!100663 ((_ is Cons!20918) lt!439973))))

(assert (=> d!117995 (= (-!444 lt!439973 head!726) lt!439991)))

(declare-fun b!992335 () Bool)

(declare-fun e!559812 () List!20922)

(assert (=> b!992335 (= e!559812 (Cons!20918 (h!22080 lt!439973) call!42083))))

(declare-fun b!992336 () Bool)

(assert (=> b!992336 (= e!559812 call!42083)))

(declare-fun b!992337 () Bool)

(assert (=> b!992337 (= e!559813 Nil!20919)))

(declare-fun b!992338 () Bool)

(assert (=> b!992338 (= e!559813 e!559812)))

(declare-fun c!100664 () Bool)

(assert (=> b!992338 (= c!100664 (= head!726 (h!22080 lt!439973)))))

(declare-fun b!992339 () Bool)

(assert (=> b!992339 (= e!559811 (= (content!440 lt!439991) ((_ map and) (content!440 lt!439973) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(assert (= (and d!117995 c!100663) b!992338))

(assert (= (and d!117995 (not c!100663)) b!992337))

(assert (= (and b!992338 c!100664) b!992336))

(assert (= (and b!992338 (not c!100664)) b!992335))

(assert (= (or b!992336 b!992335) bm!42080))

(assert (= (and d!117995 res!663283) b!992339))

(declare-fun m!919541 () Bool)

(assert (=> bm!42080 m!919541))

(declare-fun m!919543 () Bool)

(assert (=> d!117995 m!919543))

(declare-fun m!919545 () Bool)

(assert (=> d!117995 m!919545))

(declare-fun m!919547 () Bool)

(assert (=> b!992339 m!919547))

(declare-fun m!919549 () Bool)

(assert (=> b!992339 m!919549))

(declare-fun m!919551 () Bool)

(assert (=> b!992339 m!919551))

(assert (=> b!992261 d!117995))

(declare-fun d!118009 () Bool)

(declare-fun lt!439996 () Bool)

(assert (=> d!118009 (= lt!439996 (select (content!440 tail!21) head!726))))

(declare-fun e!559827 () Bool)

(assert (=> d!118009 (= lt!439996 e!559827)))

(declare-fun res!663291 () Bool)

(assert (=> d!118009 (=> (not res!663291) (not e!559827))))

(assert (=> d!118009 (= res!663291 ((_ is Cons!20918) tail!21))))

(assert (=> d!118009 (= (contains!5721 tail!21 head!726) lt!439996)))

(declare-fun b!992358 () Bool)

(declare-fun e!559828 () Bool)

(assert (=> b!992358 (= e!559827 e!559828)))

(declare-fun res!663290 () Bool)

(assert (=> b!992358 (=> res!663290 e!559828)))

(assert (=> b!992358 (= res!663290 (= (h!22080 tail!21) head!726))))

(declare-fun b!992359 () Bool)

(assert (=> b!992359 (= e!559828 (contains!5721 (t!29905 tail!21) head!726))))

(assert (= (and d!118009 res!663291) b!992358))

(assert (= (and b!992358 (not res!663290)) b!992359))

(assert (=> d!118009 m!919477))

(assert (=> d!118009 m!919479))

(declare-fun m!919553 () Bool)

(assert (=> b!992359 m!919553))

(assert (=> start!85058 d!118009))

(check-sat (not bm!42080) (not b!992339) (not b!992359) (not d!117995) (not b!992301) (not d!118009))
(check-sat)
