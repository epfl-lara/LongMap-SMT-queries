; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85136 () Bool)

(assert start!85136)

(declare-fun b!992438 () Bool)

(declare-fun res!663349 () Bool)

(declare-fun e!559883 () Bool)

(assert (=> b!992438 (=> (not res!663349) (not e!559883))))

(declare-fun head!726 () (_ BitVec 64))

(declare-datatypes ((List!20928 0))(
  ( (Nil!20925) (Cons!20924 (h!22086 (_ BitVec 64)) (t!29917 List!20928)) )
))
(declare-fun tail!21 () List!20928)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!446 (List!20928) (InoxSet (_ BitVec 64)))

(assert (=> b!992438 (= res!663349 (not (select (content!446 tail!21) head!726)))))

(declare-fun b!992440 () Bool)

(declare-fun res!663348 () Bool)

(declare-fun e!559882 () Bool)

(assert (=> b!992440 (=> (not res!663348) (not e!559882))))

(declare-fun lt!440018 () List!20928)

(get-info :version)

(assert (=> b!992440 (= res!663348 (not ((_ is Nil!20925) lt!440018)))))

(declare-fun res!663347 () Bool)

(assert (=> start!85136 (=> (not res!663347) (not e!559883))))

(declare-fun contains!5727 (List!20928 (_ BitVec 64)) Bool)

(assert (=> start!85136 (= res!663347 (not (contains!5727 tail!21 head!726)))))

(assert (=> start!85136 e!559883))

(assert (=> start!85136 true))

(declare-fun b!992439 () Bool)

(assert (=> b!992439 (= e!559883 e!559882)))

(declare-fun res!663346 () Bool)

(assert (=> b!992439 (=> (not res!663346) (not e!559882))))

(declare-datatypes ((tuple2!15050 0))(
  ( (tuple2!15051 (_1!7536 (_ BitVec 64)) (_2!7536 List!20928)) )
))
(declare-datatypes ((Option!543 0))(
  ( (Some!542 (v!14351 tuple2!15050)) (None!541) )
))
(declare-fun isEmpty!752 (Option!543) Bool)

(declare-fun unapply!19 (List!20928) Option!543)

(assert (=> b!992439 (= res!663346 (isEmpty!752 (unapply!19 lt!440018)))))

(declare-fun $colon$colon!577 (List!20928 (_ BitVec 64)) List!20928)

(assert (=> b!992439 (= lt!440018 ($colon$colon!577 tail!21 head!726))))

(declare-fun b!992441 () Bool)

(declare-fun -!447 (List!20928 (_ BitVec 64)) List!20928)

(assert (=> b!992441 (= e!559882 (not (= (-!447 lt!440018 head!726) tail!21)))))

(assert (= (and start!85136 res!663347) b!992438))

(assert (= (and b!992438 res!663349) b!992439))

(assert (= (and b!992439 res!663346) b!992440))

(assert (= (and b!992440 res!663348) b!992441))

(declare-fun m!919625 () Bool)

(assert (=> b!992438 m!919625))

(declare-fun m!919627 () Bool)

(assert (=> b!992438 m!919627))

(declare-fun m!919629 () Bool)

(assert (=> start!85136 m!919629))

(declare-fun m!919631 () Bool)

(assert (=> b!992439 m!919631))

(assert (=> b!992439 m!919631))

(declare-fun m!919633 () Bool)

(assert (=> b!992439 m!919633))

(declare-fun m!919635 () Bool)

(assert (=> b!992439 m!919635))

(declare-fun m!919637 () Bool)

(assert (=> b!992441 m!919637))

(check-sat (not b!992439) (not b!992438) (not start!85136) (not b!992441))
(check-sat)
(get-model)

(declare-fun d!118051 () Bool)

(assert (=> d!118051 (= (isEmpty!752 (unapply!19 lt!440018)) (not ((_ is Some!542) (unapply!19 lt!440018))))))

(assert (=> b!992439 d!118051))

(declare-fun d!118057 () Bool)

(assert (=> d!118057 (= (unapply!19 lt!440018) (ite ((_ is Nil!20925) lt!440018) None!541 (Some!542 (tuple2!15051 (h!22086 lt!440018) (t!29917 lt!440018)))))))

(assert (=> b!992439 d!118057))

(declare-fun d!118059 () Bool)

(assert (=> d!118059 (= ($colon$colon!577 tail!21 head!726) (Cons!20924 head!726 tail!21))))

(assert (=> b!992439 d!118059))

(declare-fun d!118061 () Bool)

(declare-fun c!100685 () Bool)

(assert (=> d!118061 (= c!100685 ((_ is Nil!20925) tail!21))))

(declare-fun e!559910 () (InoxSet (_ BitVec 64)))

(assert (=> d!118061 (= (content!446 tail!21) e!559910)))

(declare-fun b!992482 () Bool)

(assert (=> b!992482 (= e!559910 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992483 () Bool)

(assert (=> b!992483 (= e!559910 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22086 tail!21) true) (content!446 (t!29917 tail!21))))))

(assert (= (and d!118061 c!100685) b!992482))

(assert (= (and d!118061 (not c!100685)) b!992483))

(declare-fun m!919671 () Bool)

(assert (=> b!992483 m!919671))

(declare-fun m!919673 () Bool)

(assert (=> b!992483 m!919673))

(assert (=> b!992438 d!118061))

(declare-fun d!118067 () Bool)

(declare-fun lt!440037 () Bool)

(assert (=> d!118067 (= lt!440037 (select (content!446 tail!21) head!726))))

(declare-fun e!559925 () Bool)

(assert (=> d!118067 (= lt!440037 e!559925)))

(declare-fun res!663390 () Bool)

(assert (=> d!118067 (=> (not res!663390) (not e!559925))))

(assert (=> d!118067 (= res!663390 ((_ is Cons!20924) tail!21))))

(assert (=> d!118067 (= (contains!5727 tail!21 head!726) lt!440037)))

(declare-fun b!992504 () Bool)

(declare-fun e!559926 () Bool)

(assert (=> b!992504 (= e!559925 e!559926)))

(declare-fun res!663391 () Bool)

(assert (=> b!992504 (=> res!663391 e!559926)))

(assert (=> b!992504 (= res!663391 (= (h!22086 tail!21) head!726))))

(declare-fun b!992505 () Bool)

(assert (=> b!992505 (= e!559926 (contains!5727 (t!29917 tail!21) head!726))))

(assert (= (and d!118067 res!663390) b!992504))

(assert (= (and b!992504 (not res!663391)) b!992505))

(assert (=> d!118067 m!919625))

(assert (=> d!118067 m!919627))

(declare-fun m!919675 () Bool)

(assert (=> b!992505 m!919675))

(assert (=> start!85136 d!118067))

(declare-fun bm!42092 () Bool)

(declare-fun call!42095 () List!20928)

(assert (=> bm!42092 (= call!42095 (-!447 (t!29917 lt!440018) head!726))))

(declare-fun b!992538 () Bool)

(declare-fun e!559948 () List!20928)

(assert (=> b!992538 (= e!559948 Nil!20925)))

(declare-fun b!992539 () Bool)

(declare-fun lt!440042 () List!20928)

(declare-fun e!559949 () Bool)

(assert (=> b!992539 (= e!559949 (= (content!446 lt!440042) ((_ map and) (content!446 lt!440018) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(declare-fun b!992540 () Bool)

(declare-fun e!559950 () List!20928)

(assert (=> b!992540 (= e!559950 (Cons!20924 (h!22086 lt!440018) call!42095))))

(declare-fun b!992541 () Bool)

(assert (=> b!992541 (= e!559950 call!42095)))

(declare-fun b!992542 () Bool)

(assert (=> b!992542 (= e!559948 e!559950)))

(declare-fun c!100706 () Bool)

(assert (=> b!992542 (= c!100706 (= head!726 (h!22086 lt!440018)))))

(declare-fun d!118069 () Bool)

(assert (=> d!118069 e!559949))

(declare-fun res!663400 () Bool)

(assert (=> d!118069 (=> (not res!663400) (not e!559949))))

(declare-fun size!30661 (List!20928) Int)

(assert (=> d!118069 (= res!663400 (<= (size!30661 lt!440042) (size!30661 lt!440018)))))

(assert (=> d!118069 (= lt!440042 e!559948)))

(declare-fun c!100707 () Bool)

(assert (=> d!118069 (= c!100707 ((_ is Cons!20924) lt!440018))))

(assert (=> d!118069 (= (-!447 lt!440018 head!726) lt!440042)))

(assert (= (and d!118069 c!100707) b!992542))

(assert (= (and d!118069 (not c!100707)) b!992538))

(assert (= (and b!992542 c!100706) b!992541))

(assert (= (and b!992542 (not c!100706)) b!992540))

(assert (= (or b!992541 b!992540) bm!42092))

(assert (= (and d!118069 res!663400) b!992539))

(declare-fun m!919701 () Bool)

(assert (=> bm!42092 m!919701))

(declare-fun m!919703 () Bool)

(assert (=> b!992539 m!919703))

(declare-fun m!919705 () Bool)

(assert (=> b!992539 m!919705))

(declare-fun m!919707 () Bool)

(assert (=> b!992539 m!919707))

(declare-fun m!919709 () Bool)

(assert (=> d!118069 m!919709))

(declare-fun m!919711 () Bool)

(assert (=> d!118069 m!919711))

(assert (=> b!992441 d!118069))

(check-sat (not b!992483) (not d!118069) (not d!118067) (not bm!42092) (not b!992505) (not b!992539))
(check-sat)
