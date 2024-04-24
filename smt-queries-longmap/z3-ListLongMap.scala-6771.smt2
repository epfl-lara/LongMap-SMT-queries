; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85190 () Bool)

(assert start!85190)

(declare-fun res!663621 () Bool)

(declare-fun e!560394 () Bool)

(assert (=> start!85190 (=> (not res!663621) (not e!560394))))

(declare-datatypes ((List!20873 0))(
  ( (Nil!20870) (Cons!20869 (h!22037 (_ BitVec 64)) (t!29854 List!20873)) )
))
(declare-fun tail!21 () List!20873)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5767 (List!20873 (_ BitVec 64)) Bool)

(assert (=> start!85190 (= res!663621 (not (contains!5767 tail!21 head!726)))))

(assert (=> start!85190 e!560394))

(assert (=> start!85190 true))

(declare-fun b!993265 () Bool)

(declare-fun lt!440509 () List!20873)

(declare-fun e!560393 () Bool)

(declare-fun -!440 (List!20873 (_ BitVec 64)) List!20873)

(assert (=> b!993265 (= e!560393 (not (= (-!440 lt!440509 head!726) tail!21)))))

(declare-datatypes ((tuple2!14956 0))(
  ( (tuple2!14957 (_1!7489 (_ BitVec 64)) (_2!7489 List!20873)) )
))
(declare-fun lt!440510 () tuple2!14956)

(assert (=> b!993265 (= (-!440 (_2!7489 lt!440510) head!726) (_2!7489 lt!440510))))

(declare-datatypes ((Unit!32893 0))(
  ( (Unit!32894) )
))
(declare-fun lt!440507 () Unit!32893)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20873) Unit!32893)

(assert (=> b!993265 (= lt!440507 (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7489 lt!440510)))))

(declare-fun b!993263 () Bool)

(declare-fun e!560392 () Bool)

(assert (=> b!993263 (= e!560394 e!560392)))

(declare-fun res!663623 () Bool)

(assert (=> b!993263 (=> (not res!663623) (not e!560392))))

(declare-datatypes ((Option!529 0))(
  ( (Some!528 (v!14331 tuple2!14956)) (None!527) )
))
(declare-fun lt!440508 () Option!529)

(declare-fun isEmpty!744 (Option!529) Bool)

(assert (=> b!993263 (= res!663623 (not (isEmpty!744 lt!440508)))))

(declare-fun unapply!10 (List!20873) Option!529)

(assert (=> b!993263 (= lt!440508 (unapply!10 lt!440509))))

(declare-fun $colon$colon!566 (List!20873 (_ BitVec 64)) List!20873)

(assert (=> b!993263 (= lt!440509 ($colon$colon!566 tail!21 head!726))))

(declare-fun b!993262 () Bool)

(declare-fun res!663620 () Bool)

(assert (=> b!993262 (=> (not res!663620) (not e!560394))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!439 (List!20873) (InoxSet (_ BitVec 64)))

(assert (=> b!993262 (= res!663620 (not (select (content!439 tail!21) head!726)))))

(declare-fun b!993264 () Bool)

(assert (=> b!993264 (= e!560392 e!560393)))

(declare-fun res!663622 () Bool)

(assert (=> b!993264 (=> (not res!663622) (not e!560393))))

(assert (=> b!993264 (= res!663622 (not (contains!5767 (_2!7489 lt!440510) head!726)))))

(declare-fun get!15722 (Option!529) tuple2!14956)

(assert (=> b!993264 (= lt!440510 (get!15722 lt!440508))))

(assert (= (and start!85190 res!663621) b!993262))

(assert (= (and b!993262 res!663620) b!993263))

(assert (= (and b!993263 res!663623) b!993264))

(assert (= (and b!993264 res!663622) b!993265))

(declare-fun m!921359 () Bool)

(assert (=> b!993262 m!921359))

(declare-fun m!921361 () Bool)

(assert (=> b!993262 m!921361))

(declare-fun m!921363 () Bool)

(assert (=> b!993265 m!921363))

(declare-fun m!921365 () Bool)

(assert (=> b!993265 m!921365))

(declare-fun m!921367 () Bool)

(assert (=> b!993265 m!921367))

(declare-fun m!921369 () Bool)

(assert (=> start!85190 m!921369))

(declare-fun m!921371 () Bool)

(assert (=> b!993264 m!921371))

(declare-fun m!921373 () Bool)

(assert (=> b!993264 m!921373))

(declare-fun m!921375 () Bool)

(assert (=> b!993263 m!921375))

(declare-fun m!921377 () Bool)

(assert (=> b!993263 m!921377))

(declare-fun m!921379 () Bool)

(assert (=> b!993263 m!921379))

(check-sat (not b!993263) (not b!993265) (not start!85190) (not b!993264) (not b!993262))
(check-sat)
(get-model)

(declare-fun d!118439 () Bool)

(declare-fun lt!440539 () Bool)

(assert (=> d!118439 (= lt!440539 (select (content!439 (_2!7489 lt!440510)) head!726))))

(declare-fun e!560421 () Bool)

(assert (=> d!118439 (= lt!440539 e!560421)))

(declare-fun res!663657 () Bool)

(assert (=> d!118439 (=> (not res!663657) (not e!560421))))

(get-info :version)

(assert (=> d!118439 (= res!663657 ((_ is Cons!20869) (_2!7489 lt!440510)))))

(assert (=> d!118439 (= (contains!5767 (_2!7489 lt!440510) head!726) lt!440539)))

(declare-fun b!993298 () Bool)

(declare-fun e!560422 () Bool)

(assert (=> b!993298 (= e!560421 e!560422)))

(declare-fun res!663656 () Bool)

(assert (=> b!993298 (=> res!663656 e!560422)))

(assert (=> b!993298 (= res!663656 (= (h!22037 (_2!7489 lt!440510)) head!726))))

(declare-fun b!993299 () Bool)

(assert (=> b!993299 (= e!560422 (contains!5767 (t!29854 (_2!7489 lt!440510)) head!726))))

(assert (= (and d!118439 res!663657) b!993298))

(assert (= (and b!993298 (not res!663656)) b!993299))

(declare-fun m!921425 () Bool)

(assert (=> d!118439 m!921425))

(declare-fun m!921427 () Bool)

(assert (=> d!118439 m!921427))

(declare-fun m!921429 () Bool)

(assert (=> b!993299 m!921429))

(assert (=> b!993264 d!118439))

(declare-fun d!118451 () Bool)

(assert (=> d!118451 (= (get!15722 lt!440508) (v!14331 lt!440508))))

(assert (=> b!993264 d!118451))

(declare-fun bm!42136 () Bool)

(declare-fun call!42139 () List!20873)

(assert (=> bm!42136 (= call!42139 (-!440 (t!29854 lt!440509) head!726))))

(declare-fun e!560446 () Bool)

(declare-fun b!993330 () Bool)

(declare-fun lt!440551 () List!20873)

(assert (=> b!993330 (= e!560446 (= (content!439 lt!440551) ((_ map and) (content!439 lt!440509) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(declare-fun b!993331 () Bool)

(declare-fun e!560448 () List!20873)

(declare-fun e!560447 () List!20873)

(assert (=> b!993331 (= e!560448 e!560447)))

(declare-fun c!100969 () Bool)

(assert (=> b!993331 (= c!100969 (= head!726 (h!22037 lt!440509)))))

(declare-fun d!118453 () Bool)

(assert (=> d!118453 e!560446))

(declare-fun res!663670 () Bool)

(assert (=> d!118453 (=> (not res!663670) (not e!560446))))

(declare-fun size!30703 (List!20873) Int)

(assert (=> d!118453 (= res!663670 (<= (size!30703 lt!440551) (size!30703 lt!440509)))))

(assert (=> d!118453 (= lt!440551 e!560448)))

(declare-fun c!100970 () Bool)

(assert (=> d!118453 (= c!100970 ((_ is Cons!20869) lt!440509))))

(assert (=> d!118453 (= (-!440 lt!440509 head!726) lt!440551)))

(declare-fun b!993332 () Bool)

(assert (=> b!993332 (= e!560448 Nil!20870)))

(declare-fun b!993333 () Bool)

(assert (=> b!993333 (= e!560447 (Cons!20869 (h!22037 lt!440509) call!42139))))

(declare-fun b!993334 () Bool)

(assert (=> b!993334 (= e!560447 call!42139)))

(assert (= (and d!118453 c!100970) b!993331))

(assert (= (and d!118453 (not c!100970)) b!993332))

(assert (= (and b!993331 c!100969) b!993334))

(assert (= (and b!993331 (not c!100969)) b!993333))

(assert (= (or b!993334 b!993333) bm!42136))

(assert (= (and d!118453 res!663670) b!993330))

(declare-fun m!921445 () Bool)

(assert (=> bm!42136 m!921445))

(declare-fun m!921447 () Bool)

(assert (=> b!993330 m!921447))

(declare-fun m!921449 () Bool)

(assert (=> b!993330 m!921449))

(declare-fun m!921451 () Bool)

(assert (=> b!993330 m!921451))

(declare-fun m!921453 () Bool)

(assert (=> d!118453 m!921453))

(declare-fun m!921455 () Bool)

(assert (=> d!118453 m!921455))

(assert (=> b!993265 d!118453))

(declare-fun bm!42141 () Bool)

(declare-fun call!42144 () List!20873)

(assert (=> bm!42141 (= call!42144 (-!440 (t!29854 (_2!7489 lt!440510)) head!726))))

(declare-fun b!993341 () Bool)

(declare-fun lt!440552 () List!20873)

(declare-fun e!560453 () Bool)

(assert (=> b!993341 (= e!560453 (= (content!439 lt!440552) ((_ map and) (content!439 (_2!7489 lt!440510)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(declare-fun b!993342 () Bool)

(declare-fun e!560455 () List!20873)

(declare-fun e!560454 () List!20873)

(assert (=> b!993342 (= e!560455 e!560454)))

(declare-fun c!100975 () Bool)

(assert (=> b!993342 (= c!100975 (= head!726 (h!22037 (_2!7489 lt!440510))))))

(declare-fun d!118471 () Bool)

(assert (=> d!118471 e!560453))

(declare-fun res!663671 () Bool)

(assert (=> d!118471 (=> (not res!663671) (not e!560453))))

(assert (=> d!118471 (= res!663671 (<= (size!30703 lt!440552) (size!30703 (_2!7489 lt!440510))))))

(assert (=> d!118471 (= lt!440552 e!560455)))

(declare-fun c!100976 () Bool)

(assert (=> d!118471 (= c!100976 ((_ is Cons!20869) (_2!7489 lt!440510)))))

(assert (=> d!118471 (= (-!440 (_2!7489 lt!440510) head!726) lt!440552)))

(declare-fun b!993343 () Bool)

(assert (=> b!993343 (= e!560455 Nil!20870)))

(declare-fun b!993344 () Bool)

(assert (=> b!993344 (= e!560454 (Cons!20869 (h!22037 (_2!7489 lt!440510)) call!42144))))

(declare-fun b!993345 () Bool)

(assert (=> b!993345 (= e!560454 call!42144)))

(assert (= (and d!118471 c!100976) b!993342))

(assert (= (and d!118471 (not c!100976)) b!993343))

(assert (= (and b!993342 c!100975) b!993345))

(assert (= (and b!993342 (not c!100975)) b!993344))

(assert (= (or b!993345 b!993344) bm!42141))

(assert (= (and d!118471 res!663671) b!993341))

(declare-fun m!921457 () Bool)

(assert (=> bm!42141 m!921457))

(declare-fun m!921459 () Bool)

(assert (=> b!993341 m!921459))

(assert (=> b!993341 m!921425))

(assert (=> b!993341 m!921451))

(declare-fun m!921461 () Bool)

(assert (=> d!118471 m!921461))

(declare-fun m!921463 () Bool)

(assert (=> d!118471 m!921463))

(assert (=> b!993265 d!118471))

(declare-fun d!118473 () Bool)

(assert (=> d!118473 (= (-!440 (_2!7489 lt!440510) head!726) (_2!7489 lt!440510))))

(declare-fun lt!440558 () Unit!32893)

(declare-fun choose!48 ((_ BitVec 64) List!20873) Unit!32893)

(assert (=> d!118473 (= lt!440558 (choose!48 head!726 (_2!7489 lt!440510)))))

(assert (=> d!118473 (not (contains!5767 (_2!7489 lt!440510) head!726))))

(assert (=> d!118473 (= (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7489 lt!440510)) lt!440558)))

(declare-fun bs!28235 () Bool)

(assert (= bs!28235 d!118473))

(assert (=> bs!28235 m!921365))

(declare-fun m!921489 () Bool)

(assert (=> bs!28235 m!921489))

(assert (=> bs!28235 m!921371))

(assert (=> b!993265 d!118473))

(declare-fun d!118479 () Bool)

(declare-fun c!100987 () Bool)

(assert (=> d!118479 (= c!100987 ((_ is Nil!20870) tail!21))))

(declare-fun e!560476 () (InoxSet (_ BitVec 64)))

(assert (=> d!118479 (= (content!439 tail!21) e!560476)))

(declare-fun b!993374 () Bool)

(assert (=> b!993374 (= e!560476 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993375 () Bool)

(assert (=> b!993375 (= e!560476 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22037 tail!21) true) (content!439 (t!29854 tail!21))))))

(assert (= (and d!118479 c!100987) b!993374))

(assert (= (and d!118479 (not c!100987)) b!993375))

(declare-fun m!921507 () Bool)

(assert (=> b!993375 m!921507))

(declare-fun m!921509 () Bool)

(assert (=> b!993375 m!921509))

(assert (=> b!993262 d!118479))

(declare-fun d!118485 () Bool)

(declare-fun lt!440564 () Bool)

(assert (=> d!118485 (= lt!440564 (select (content!439 tail!21) head!726))))

(declare-fun e!560478 () Bool)

(assert (=> d!118485 (= lt!440564 e!560478)))

(declare-fun res!663681 () Bool)

(assert (=> d!118485 (=> (not res!663681) (not e!560478))))

(assert (=> d!118485 (= res!663681 ((_ is Cons!20869) tail!21))))

(assert (=> d!118485 (= (contains!5767 tail!21 head!726) lt!440564)))

(declare-fun b!993376 () Bool)

(declare-fun e!560479 () Bool)

(assert (=> b!993376 (= e!560478 e!560479)))

(declare-fun res!663680 () Bool)

(assert (=> b!993376 (=> res!663680 e!560479)))

(assert (=> b!993376 (= res!663680 (= (h!22037 tail!21) head!726))))

(declare-fun b!993377 () Bool)

(assert (=> b!993377 (= e!560479 (contains!5767 (t!29854 tail!21) head!726))))

(assert (= (and d!118485 res!663681) b!993376))

(assert (= (and b!993376 (not res!663680)) b!993377))

(assert (=> d!118485 m!921359))

(assert (=> d!118485 m!921361))

(declare-fun m!921513 () Bool)

(assert (=> b!993377 m!921513))

(assert (=> start!85190 d!118485))

(declare-fun d!118487 () Bool)

(assert (=> d!118487 (= (isEmpty!744 lt!440508) (not ((_ is Some!528) lt!440508)))))

(assert (=> b!993263 d!118487))

(declare-fun d!118493 () Bool)

(assert (=> d!118493 (= (unapply!10 lt!440509) (ite ((_ is Nil!20870) lt!440509) None!527 (Some!528 (tuple2!14957 (h!22037 lt!440509) (t!29854 lt!440509)))))))

(assert (=> b!993263 d!118493))

(declare-fun d!118495 () Bool)

(assert (=> d!118495 (= ($colon$colon!566 tail!21 head!726) (Cons!20869 head!726 tail!21))))

(assert (=> b!993263 d!118495))

(check-sat (not b!993377) (not b!993375) (not b!993330) (not d!118485) (not d!118471) (not d!118439) (not d!118453) (not bm!42141) (not b!993299) (not bm!42136) (not b!993341) (not d!118473))
(check-sat)
