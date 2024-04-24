; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85244 () Bool)

(assert start!85244)

(declare-datatypes ((List!20876 0))(
  ( (Nil!20873) (Cons!20872 (h!22040 (_ BitVec 64)) (t!29860 List!20876)) )
))
(declare-fun tail!21 () List!20876)

(declare-fun b!993403 () Bool)

(declare-fun e!560492 () Bool)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun lt!440570 () List!20876)

(declare-fun -!443 (List!20876 (_ BitVec 64)) List!20876)

(assert (=> b!993403 (= e!560492 (not (= (-!443 lt!440570 head!726) tail!21)))))

(declare-fun res!663695 () Bool)

(declare-fun e!560493 () Bool)

(assert (=> start!85244 (=> (not res!663695) (not e!560493))))

(declare-fun contains!5770 (List!20876 (_ BitVec 64)) Bool)

(assert (=> start!85244 (= res!663695 (not (contains!5770 tail!21 head!726)))))

(assert (=> start!85244 e!560493))

(assert (=> start!85244 true))

(declare-fun b!993400 () Bool)

(declare-fun res!663693 () Bool)

(assert (=> b!993400 (=> (not res!663693) (not e!560493))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!442 (List!20876) (InoxSet (_ BitVec 64)))

(assert (=> b!993400 (= res!663693 (not (select (content!442 tail!21) head!726)))))

(declare-fun b!993402 () Bool)

(declare-fun res!663694 () Bool)

(assert (=> b!993402 (=> (not res!663694) (not e!560492))))

(get-info :version)

(assert (=> b!993402 (= res!663694 ((_ is Nil!20873) lt!440570))))

(declare-fun b!993401 () Bool)

(assert (=> b!993401 (= e!560493 e!560492)))

(declare-fun res!663692 () Bool)

(assert (=> b!993401 (=> (not res!663692) (not e!560492))))

(declare-datatypes ((tuple2!14962 0))(
  ( (tuple2!14963 (_1!7492 (_ BitVec 64)) (_2!7492 List!20876)) )
))
(declare-datatypes ((Option!532 0))(
  ( (Some!531 (v!14337 tuple2!14962)) (None!530) )
))
(declare-fun isEmpty!747 (Option!532) Bool)

(declare-fun unapply!13 (List!20876) Option!532)

(assert (=> b!993401 (= res!663692 (isEmpty!747 (unapply!13 lt!440570)))))

(declare-fun $colon$colon!569 (List!20876 (_ BitVec 64)) List!20876)

(assert (=> b!993401 (= lt!440570 ($colon$colon!569 tail!21 head!726))))

(assert (= (and start!85244 res!663695) b!993400))

(assert (= (and b!993400 res!663693) b!993401))

(assert (= (and b!993401 res!663692) b!993402))

(assert (= (and b!993402 res!663694) b!993403))

(declare-fun m!921527 () Bool)

(assert (=> b!993403 m!921527))

(declare-fun m!921529 () Bool)

(assert (=> start!85244 m!921529))

(declare-fun m!921531 () Bool)

(assert (=> b!993400 m!921531))

(declare-fun m!921533 () Bool)

(assert (=> b!993400 m!921533))

(declare-fun m!921535 () Bool)

(assert (=> b!993401 m!921535))

(assert (=> b!993401 m!921535))

(declare-fun m!921537 () Bool)

(assert (=> b!993401 m!921537))

(declare-fun m!921539 () Bool)

(assert (=> b!993401 m!921539))

(check-sat (not b!993401) (not b!993400) (not b!993403) (not start!85244))
(check-sat)
(get-model)

(declare-fun d!118501 () Bool)

(assert (=> d!118501 (= (isEmpty!747 (unapply!13 lt!440570)) (not ((_ is Some!531) (unapply!13 lt!440570))))))

(assert (=> b!993401 d!118501))

(declare-fun d!118505 () Bool)

(assert (=> d!118505 (= (unapply!13 lt!440570) (ite ((_ is Nil!20873) lt!440570) None!530 (Some!531 (tuple2!14963 (h!22040 lt!440570) (t!29860 lt!440570)))))))

(assert (=> b!993401 d!118505))

(declare-fun d!118509 () Bool)

(assert (=> d!118509 (= ($colon$colon!569 tail!21 head!726) (Cons!20872 head!726 tail!21))))

(assert (=> b!993401 d!118509))

(declare-fun d!118511 () Bool)

(declare-fun c!101000 () Bool)

(assert (=> d!118511 (= c!101000 ((_ is Nil!20873) tail!21))))

(declare-fun e!560519 () (InoxSet (_ BitVec 64)))

(assert (=> d!118511 (= (content!442 tail!21) e!560519)))

(declare-fun b!993446 () Bool)

(assert (=> b!993446 (= e!560519 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993447 () Bool)

(assert (=> b!993447 (= e!560519 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22040 tail!21) true) (content!442 (t!29860 tail!21))))))

(assert (= (and d!118511 c!101000) b!993446))

(assert (= (and d!118511 (not c!101000)) b!993447))

(declare-fun m!921571 () Bool)

(assert (=> b!993447 m!921571))

(declare-fun m!921573 () Bool)

(assert (=> b!993447 m!921573))

(assert (=> b!993400 d!118511))

(declare-fun b!993477 () Bool)

(declare-fun e!560541 () List!20876)

(assert (=> b!993477 (= e!560541 Nil!20873)))

(declare-fun b!993478 () Bool)

(declare-fun e!560543 () List!20876)

(declare-fun call!42154 () List!20876)

(assert (=> b!993478 (= e!560543 (Cons!20872 (h!22040 lt!440570) call!42154))))

(declare-fun b!993479 () Bool)

(assert (=> b!993479 (= e!560543 call!42154)))

(declare-fun d!118515 () Bool)

(declare-fun e!560542 () Bool)

(assert (=> d!118515 e!560542))

(declare-fun res!663737 () Bool)

(assert (=> d!118515 (=> (not res!663737) (not e!560542))))

(declare-fun lt!440588 () List!20876)

(declare-fun size!30707 (List!20876) Int)

(assert (=> d!118515 (= res!663737 (<= (size!30707 lt!440588) (size!30707 lt!440570)))))

(assert (=> d!118515 (= lt!440588 e!560541)))

(declare-fun c!101010 () Bool)

(assert (=> d!118515 (= c!101010 ((_ is Cons!20872) lt!440570))))

(assert (=> d!118515 (= (-!443 lt!440570 head!726) lt!440588)))

(declare-fun bm!42151 () Bool)

(assert (=> bm!42151 (= call!42154 (-!443 (t!29860 lt!440570) head!726))))

(declare-fun b!993480 () Bool)

(assert (=> b!993480 (= e!560542 (= (content!442 lt!440588) ((_ map and) (content!442 lt!440570) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(declare-fun b!993481 () Bool)

(assert (=> b!993481 (= e!560541 e!560543)))

(declare-fun c!101011 () Bool)

(assert (=> b!993481 (= c!101011 (= head!726 (h!22040 lt!440570)))))

(assert (= (and d!118515 c!101010) b!993481))

(assert (= (and d!118515 (not c!101010)) b!993477))

(assert (= (and b!993481 c!101011) b!993479))

(assert (= (and b!993481 (not c!101011)) b!993478))

(assert (= (or b!993479 b!993478) bm!42151))

(assert (= (and d!118515 res!663737) b!993480))

(declare-fun m!921593 () Bool)

(assert (=> d!118515 m!921593))

(declare-fun m!921595 () Bool)

(assert (=> d!118515 m!921595))

(declare-fun m!921597 () Bool)

(assert (=> bm!42151 m!921597))

(declare-fun m!921599 () Bool)

(assert (=> b!993480 m!921599))

(declare-fun m!921601 () Bool)

(assert (=> b!993480 m!921601))

(declare-fun m!921603 () Bool)

(assert (=> b!993480 m!921603))

(assert (=> b!993403 d!118515))

(declare-fun d!118529 () Bool)

(declare-fun lt!440593 () Bool)

(assert (=> d!118529 (= lt!440593 (select (content!442 tail!21) head!726))))

(declare-fun e!560558 () Bool)

(assert (=> d!118529 (= lt!440593 e!560558)))

(declare-fun res!663744 () Bool)

(assert (=> d!118529 (=> (not res!663744) (not e!560558))))

(assert (=> d!118529 (= res!663744 ((_ is Cons!20872) tail!21))))

(assert (=> d!118529 (= (contains!5770 tail!21 head!726) lt!440593)))

(declare-fun b!993500 () Bool)

(declare-fun e!560557 () Bool)

(assert (=> b!993500 (= e!560558 e!560557)))

(declare-fun res!663745 () Bool)

(assert (=> b!993500 (=> res!663745 e!560557)))

(assert (=> b!993500 (= res!663745 (= (h!22040 tail!21) head!726))))

(declare-fun b!993501 () Bool)

(assert (=> b!993501 (= e!560557 (contains!5770 (t!29860 tail!21) head!726))))

(assert (= (and d!118529 res!663744) b!993500))

(assert (= (and b!993500 (not res!663745)) b!993501))

(assert (=> d!118529 m!921531))

(assert (=> d!118529 m!921533))

(declare-fun m!921605 () Bool)

(assert (=> b!993501 m!921605))

(assert (=> start!85244 d!118529))

(check-sat (not d!118515) (not b!993501) (not b!993480) (not bm!42151) (not d!118529) (not b!993447))
(check-sat)
