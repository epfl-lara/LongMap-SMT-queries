; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85120 () Bool)

(assert start!85120)

(declare-fun res!663419 () Bool)

(declare-fun e!559991 () Bool)

(assert (=> start!85120 (=> (not res!663419) (not e!559991))))

(declare-datatypes ((List!20891 0))(
  ( (Nil!20888) (Cons!20887 (h!22049 (_ BitVec 64)) (t!29886 List!20891)) )
))
(declare-fun tail!21 () List!20891)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5752 (List!20891 (_ BitVec 64)) Bool)

(assert (=> start!85120 (= res!663419 (not (contains!5752 tail!21 head!726)))))

(assert (=> start!85120 e!559991))

(assert (=> start!85120 true))

(declare-fun b!992621 () Bool)

(declare-fun res!663418 () Bool)

(assert (=> b!992621 (=> (not res!663418) (not e!559991))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!446 (List!20891) (InoxSet (_ BitVec 64)))

(assert (=> b!992621 (= res!663418 (not (select (content!446 tail!21) head!726)))))

(declare-fun b!992622 () Bool)

(declare-fun e!559992 () Bool)

(assert (=> b!992622 (= e!559991 e!559992)))

(declare-fun res!663420 () Bool)

(assert (=> b!992622 (=> (not res!663420) (not e!559992))))

(declare-fun lt!440239 () List!20891)

(declare-datatypes ((tuple2!14966 0))(
  ( (tuple2!14967 (_1!7494 (_ BitVec 64)) (_2!7494 List!20891)) )
))
(declare-datatypes ((Option!538 0))(
  ( (Some!537 (v!14347 tuple2!14966)) (None!536) )
))
(declare-fun isEmpty!745 (Option!538) Bool)

(declare-fun unapply!17 (List!20891) Option!538)

(assert (=> b!992622 (= res!663420 (isEmpty!745 (unapply!17 lt!440239)))))

(declare-fun $colon$colon!574 (List!20891 (_ BitVec 64)) List!20891)

(assert (=> b!992622 (= lt!440239 ($colon$colon!574 tail!21 head!726))))

(declare-fun b!992623 () Bool)

(get-info :version)

(assert (=> b!992623 (= e!559992 (not ((_ is Nil!20888) lt!440239)))))

(assert (= (and start!85120 res!663419) b!992621))

(assert (= (and b!992621 res!663418) b!992622))

(assert (= (and b!992622 res!663420) b!992623))

(declare-fun m!920341 () Bool)

(assert (=> start!85120 m!920341))

(declare-fun m!920343 () Bool)

(assert (=> b!992621 m!920343))

(declare-fun m!920345 () Bool)

(assert (=> b!992621 m!920345))

(declare-fun m!920347 () Bool)

(assert (=> b!992622 m!920347))

(assert (=> b!992622 m!920347))

(declare-fun m!920349 () Bool)

(assert (=> b!992622 m!920349))

(declare-fun m!920351 () Bool)

(assert (=> b!992622 m!920351))

(check-sat (not start!85120) (not b!992621) (not b!992622))
(check-sat)
(get-model)

(declare-fun d!118221 () Bool)

(declare-fun lt!440247 () Bool)

(assert (=> d!118221 (= lt!440247 (select (content!446 tail!21) head!726))))

(declare-fun e!560011 () Bool)

(assert (=> d!118221 (= lt!440247 e!560011)))

(declare-fun res!663438 () Bool)

(assert (=> d!118221 (=> (not res!663438) (not e!560011))))

(assert (=> d!118221 (= res!663438 ((_ is Cons!20887) tail!21))))

(assert (=> d!118221 (= (contains!5752 tail!21 head!726) lt!440247)))

(declare-fun b!992647 () Bool)

(declare-fun e!560010 () Bool)

(assert (=> b!992647 (= e!560011 e!560010)))

(declare-fun res!663439 () Bool)

(assert (=> b!992647 (=> res!663439 e!560010)))

(assert (=> b!992647 (= res!663439 (= (h!22049 tail!21) head!726))))

(declare-fun b!992648 () Bool)

(assert (=> b!992648 (= e!560010 (contains!5752 (t!29886 tail!21) head!726))))

(assert (= (and d!118221 res!663438) b!992647))

(assert (= (and b!992647 (not res!663439)) b!992648))

(assert (=> d!118221 m!920343))

(assert (=> d!118221 m!920345))

(declare-fun m!920369 () Bool)

(assert (=> b!992648 m!920369))

(assert (=> start!85120 d!118221))

(declare-fun d!118225 () Bool)

(declare-fun c!100744 () Bool)

(assert (=> d!118225 (= c!100744 ((_ is Nil!20888) tail!21))))

(declare-fun e!560022 () (InoxSet (_ BitVec 64)))

(assert (=> d!118225 (= (content!446 tail!21) e!560022)))

(declare-fun b!992661 () Bool)

(assert (=> b!992661 (= e!560022 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992662 () Bool)

(assert (=> b!992662 (= e!560022 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22049 tail!21) true) (content!446 (t!29886 tail!21))))))

(assert (= (and d!118225 c!100744) b!992661))

(assert (= (and d!118225 (not c!100744)) b!992662))

(declare-fun m!920373 () Bool)

(assert (=> b!992662 m!920373))

(declare-fun m!920377 () Bool)

(assert (=> b!992662 m!920377))

(assert (=> b!992621 d!118225))

(declare-fun d!118235 () Bool)

(assert (=> d!118235 (= (isEmpty!745 (unapply!17 lt!440239)) (not ((_ is Some!537) (unapply!17 lt!440239))))))

(assert (=> b!992622 d!118235))

(declare-fun d!118241 () Bool)

(assert (=> d!118241 (= (unapply!17 lt!440239) (ite ((_ is Nil!20888) lt!440239) None!536 (Some!537 (tuple2!14967 (h!22049 lt!440239) (t!29886 lt!440239)))))))

(assert (=> b!992622 d!118241))

(declare-fun d!118245 () Bool)

(assert (=> d!118245 (= ($colon$colon!574 tail!21 head!726) (Cons!20887 head!726 tail!21))))

(assert (=> b!992622 d!118245))

(check-sat (not b!992662) (not b!992648) (not d!118221))
(check-sat)
