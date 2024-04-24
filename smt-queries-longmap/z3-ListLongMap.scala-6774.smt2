; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85322 () Bool)

(assert start!85322)

(declare-fun b!993580 () Bool)

(declare-fun res!663801 () Bool)

(declare-fun e!560612 () Bool)

(assert (=> b!993580 (=> (not res!663801) (not e!560612))))

(declare-fun head!726 () (_ BitVec 64))

(declare-datatypes ((List!20882 0))(
  ( (Nil!20879) (Cons!20878 (h!22046 (_ BitVec 64)) (t!29872 List!20882)) )
))
(declare-fun tail!21 () List!20882)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!448 (List!20882) (InoxSet (_ BitVec 64)))

(assert (=> b!993580 (= res!663801 (not (select (content!448 tail!21) head!726)))))

(declare-fun lt!440615 () List!20882)

(declare-fun e!560613 () Bool)

(declare-fun b!993583 () Bool)

(declare-fun -!446 (List!20882 (_ BitVec 64)) List!20882)

(assert (=> b!993583 (= e!560613 (not (= (-!446 lt!440615 head!726) tail!21)))))

(declare-fun b!993581 () Bool)

(assert (=> b!993581 (= e!560612 e!560613)))

(declare-fun res!663803 () Bool)

(assert (=> b!993581 (=> (not res!663803) (not e!560613))))

(declare-datatypes ((tuple2!14974 0))(
  ( (tuple2!14975 (_1!7498 (_ BitVec 64)) (_2!7498 List!20882)) )
))
(declare-datatypes ((Option!538 0))(
  ( (Some!537 (v!14349 tuple2!14974)) (None!536) )
))
(declare-fun isEmpty!753 (Option!538) Bool)

(declare-fun unapply!19 (List!20882) Option!538)

(assert (=> b!993581 (= res!663803 (isEmpty!753 (unapply!19 lt!440615)))))

(declare-fun $colon$colon!575 (List!20882 (_ BitVec 64)) List!20882)

(assert (=> b!993581 (= lt!440615 ($colon$colon!575 tail!21 head!726))))

(declare-fun b!993582 () Bool)

(declare-fun res!663802 () Bool)

(assert (=> b!993582 (=> (not res!663802) (not e!560613))))

(get-info :version)

(assert (=> b!993582 (= res!663802 (not ((_ is Nil!20879) lt!440615)))))

(declare-fun res!663800 () Bool)

(assert (=> start!85322 (=> (not res!663800) (not e!560612))))

(declare-fun contains!5776 (List!20882 (_ BitVec 64)) Bool)

(assert (=> start!85322 (= res!663800 (not (contains!5776 tail!21 head!726)))))

(assert (=> start!85322 e!560612))

(assert (=> start!85322 true))

(assert (= (and start!85322 res!663800) b!993580))

(assert (= (and b!993580 res!663801) b!993581))

(assert (= (and b!993581 res!663803) b!993582))

(assert (= (and b!993582 res!663802) b!993583))

(declare-fun m!921677 () Bool)

(assert (=> b!993580 m!921677))

(declare-fun m!921679 () Bool)

(assert (=> b!993580 m!921679))

(declare-fun m!921681 () Bool)

(assert (=> b!993583 m!921681))

(declare-fun m!921683 () Bool)

(assert (=> b!993581 m!921683))

(assert (=> b!993581 m!921683))

(declare-fun m!921685 () Bool)

(assert (=> b!993581 m!921685))

(declare-fun m!921687 () Bool)

(assert (=> b!993581 m!921687))

(declare-fun m!921689 () Bool)

(assert (=> start!85322 m!921689))

(check-sat (not b!993581) (not b!993580) (not b!993583) (not start!85322))
(check-sat)
(get-model)

(declare-fun d!118573 () Bool)

(assert (=> d!118573 (= (isEmpty!753 (unapply!19 lt!440615)) (not ((_ is Some!537) (unapply!19 lt!440615))))))

(assert (=> b!993581 d!118573))

(declare-fun d!118575 () Bool)

(assert (=> d!118575 (= (unapply!19 lt!440615) (ite ((_ is Nil!20879) lt!440615) None!536 (Some!537 (tuple2!14975 (h!22046 lt!440615) (t!29872 lt!440615)))))))

(assert (=> b!993581 d!118575))

(declare-fun d!118579 () Bool)

(assert (=> d!118579 (= ($colon$colon!575 tail!21 head!726) (Cons!20878 head!726 tail!21))))

(assert (=> b!993581 d!118579))

(declare-fun d!118581 () Bool)

(declare-fun c!101040 () Bool)

(assert (=> d!118581 (= c!101040 ((_ is Nil!20879) tail!21))))

(declare-fun e!560638 () (InoxSet (_ BitVec 64)))

(assert (=> d!118581 (= (content!448 tail!21) e!560638)))

(declare-fun b!993628 () Bool)

(assert (=> b!993628 (= e!560638 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993629 () Bool)

(assert (=> b!993629 (= e!560638 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22046 tail!21) true) (content!448 (t!29872 tail!21))))))

(assert (= (and d!118581 c!101040) b!993628))

(assert (= (and d!118581 (not c!101040)) b!993629))

(declare-fun m!921719 () Bool)

(assert (=> b!993629 m!921719))

(declare-fun m!921721 () Bool)

(assert (=> b!993629 m!921721))

(assert (=> b!993580 d!118581))

(declare-fun b!993666 () Bool)

(declare-fun e!560670 () List!20882)

(declare-fun call!42166 () List!20882)

(assert (=> b!993666 (= e!560670 call!42166)))

(declare-fun e!560668 () Bool)

(declare-fun lt!440636 () List!20882)

(declare-fun b!993667 () Bool)

(assert (=> b!993667 (= e!560668 (= (content!448 lt!440636) ((_ map and) (content!448 lt!440615) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(declare-fun b!993669 () Bool)

(declare-fun e!560669 () List!20882)

(assert (=> b!993669 (= e!560669 Nil!20879)))

(declare-fun b!993670 () Bool)

(assert (=> b!993670 (= e!560670 (Cons!20878 (h!22046 lt!440615) call!42166))))

(declare-fun bm!42163 () Bool)

(assert (=> bm!42163 (= call!42166 (-!446 (t!29872 lt!440615) head!726))))

(declare-fun b!993668 () Bool)

(assert (=> b!993668 (= e!560669 e!560670)))

(declare-fun c!101049 () Bool)

(assert (=> b!993668 (= c!101049 (= head!726 (h!22046 lt!440615)))))

(declare-fun d!118583 () Bool)

(assert (=> d!118583 e!560668))

(declare-fun res!663848 () Bool)

(assert (=> d!118583 (=> (not res!663848) (not e!560668))))

(declare-fun size!30710 (List!20882) Int)

(assert (=> d!118583 (= res!663848 (<= (size!30710 lt!440636) (size!30710 lt!440615)))))

(assert (=> d!118583 (= lt!440636 e!560669)))

(declare-fun c!101050 () Bool)

(assert (=> d!118583 (= c!101050 ((_ is Cons!20878) lt!440615))))

(assert (=> d!118583 (= (-!446 lt!440615 head!726) lt!440636)))

(assert (= (and d!118583 c!101050) b!993668))

(assert (= (and d!118583 (not c!101050)) b!993669))

(assert (= (and b!993668 c!101049) b!993666))

(assert (= (and b!993668 (not c!101049)) b!993670))

(assert (= (or b!993666 b!993670) bm!42163))

(assert (= (and d!118583 res!663848) b!993667))

(declare-fun m!921751 () Bool)

(assert (=> b!993667 m!921751))

(declare-fun m!921753 () Bool)

(assert (=> b!993667 m!921753))

(declare-fun m!921755 () Bool)

(assert (=> b!993667 m!921755))

(declare-fun m!921757 () Bool)

(assert (=> bm!42163 m!921757))

(declare-fun m!921759 () Bool)

(assert (=> d!118583 m!921759))

(declare-fun m!921761 () Bool)

(assert (=> d!118583 m!921761))

(assert (=> b!993583 d!118583))

(declare-fun d!118595 () Bool)

(declare-fun lt!440639 () Bool)

(assert (=> d!118595 (= lt!440639 (select (content!448 tail!21) head!726))))

(declare-fun e!560679 () Bool)

(assert (=> d!118595 (= lt!440639 e!560679)))

(declare-fun res!663854 () Bool)

(assert (=> d!118595 (=> (not res!663854) (not e!560679))))

(assert (=> d!118595 (= res!663854 ((_ is Cons!20878) tail!21))))

(assert (=> d!118595 (= (contains!5776 tail!21 head!726) lt!440639)))

(declare-fun b!993683 () Bool)

(declare-fun e!560680 () Bool)

(assert (=> b!993683 (= e!560679 e!560680)))

(declare-fun res!663853 () Bool)

(assert (=> b!993683 (=> res!663853 e!560680)))

(assert (=> b!993683 (= res!663853 (= (h!22046 tail!21) head!726))))

(declare-fun b!993684 () Bool)

(assert (=> b!993684 (= e!560680 (contains!5776 (t!29872 tail!21) head!726))))

(assert (= (and d!118595 res!663854) b!993683))

(assert (= (and b!993683 (not res!663853)) b!993684))

(assert (=> d!118595 m!921677))

(assert (=> d!118595 m!921679))

(declare-fun m!921763 () Bool)

(assert (=> b!993684 m!921763))

(assert (=> start!85322 d!118595))

(check-sat (not b!993629) (not b!993684) (not bm!42163) (not d!118595) (not d!118583) (not b!993667))
(check-sat)
