; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85148 () Bool)

(assert start!85148)

(declare-fun res!663569 () Bool)

(declare-fun e!560340 () Bool)

(assert (=> start!85148 (=> (not res!663569) (not e!560340))))

(declare-datatypes ((List!20870 0))(
  ( (Nil!20867) (Cons!20866 (h!22034 (_ BitVec 64)) (t!29848 List!20870)) )
))
(declare-fun tail!21 () List!20870)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5764 (List!20870 (_ BitVec 64)) Bool)

(assert (=> start!85148 (= res!663569 (not (contains!5764 tail!21 head!726)))))

(assert (=> start!85148 e!560340))

(assert (=> start!85148 true))

(declare-fun b!993191 () Bool)

(declare-fun res!663567 () Bool)

(assert (=> b!993191 (=> (not res!663567) (not e!560340))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!436 (List!20870) (InoxSet (_ BitVec 64)))

(assert (=> b!993191 (= res!663567 (not (select (content!436 tail!21) head!726)))))

(declare-fun b!993192 () Bool)

(declare-fun e!560339 () Bool)

(assert (=> b!993192 (= e!560340 e!560339)))

(declare-fun res!663568 () Bool)

(assert (=> b!993192 (=> (not res!663568) (not e!560339))))

(declare-datatypes ((tuple2!14950 0))(
  ( (tuple2!14951 (_1!7486 (_ BitVec 64)) (_2!7486 List!20870)) )
))
(declare-datatypes ((Option!526 0))(
  ( (Some!525 (v!14325 tuple2!14950)) (None!524) )
))
(declare-fun lt!440480 () Option!526)

(declare-fun isEmpty!741 (Option!526) Bool)

(assert (=> b!993192 (= res!663568 (not (isEmpty!741 lt!440480)))))

(declare-fun unapply!7 (List!20870) Option!526)

(declare-fun $colon$colon!563 (List!20870 (_ BitVec 64)) List!20870)

(assert (=> b!993192 (= lt!440480 (unapply!7 ($colon$colon!563 tail!21 head!726)))))

(declare-fun b!993193 () Bool)

(declare-fun get!15717 (Option!526) tuple2!14950)

(assert (=> b!993193 (= e!560339 (contains!5764 (_2!7486 (get!15717 lt!440480)) head!726))))

(assert (= (and start!85148 res!663569) b!993191))

(assert (= (and b!993191 res!663567) b!993192))

(assert (= (and b!993192 res!663568) b!993193))

(declare-fun m!921275 () Bool)

(assert (=> start!85148 m!921275))

(declare-fun m!921277 () Bool)

(assert (=> b!993191 m!921277))

(declare-fun m!921279 () Bool)

(assert (=> b!993191 m!921279))

(declare-fun m!921281 () Bool)

(assert (=> b!993192 m!921281))

(declare-fun m!921283 () Bool)

(assert (=> b!993192 m!921283))

(assert (=> b!993192 m!921283))

(declare-fun m!921285 () Bool)

(assert (=> b!993192 m!921285))

(declare-fun m!921287 () Bool)

(assert (=> b!993193 m!921287))

(declare-fun m!921289 () Bool)

(assert (=> b!993193 m!921289))

(check-sat (not b!993191) (not b!993192) (not b!993193) (not start!85148))
(check-sat)
(get-model)

(declare-fun d!118397 () Bool)

(declare-fun c!100959 () Bool)

(get-info :version)

(assert (=> d!118397 (= c!100959 ((_ is Nil!20867) tail!21))))

(declare-fun e!560360 () (InoxSet (_ BitVec 64)))

(assert (=> d!118397 (= (content!436 tail!21) e!560360)))

(declare-fun b!993228 () Bool)

(assert (=> b!993228 (= e!560360 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993229 () Bool)

(assert (=> b!993229 (= e!560360 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22034 tail!21) true) (content!436 (t!29848 tail!21))))))

(assert (= (and d!118397 c!100959) b!993228))

(assert (= (and d!118397 (not c!100959)) b!993229))

(declare-fun m!921327 () Bool)

(assert (=> b!993229 m!921327))

(declare-fun m!921333 () Bool)

(assert (=> b!993229 m!921333))

(assert (=> b!993191 d!118397))

(declare-fun d!118405 () Bool)

(assert (=> d!118405 (= (isEmpty!741 lt!440480) (not ((_ is Some!525) lt!440480)))))

(assert (=> b!993192 d!118405))

(declare-fun d!118411 () Bool)

(assert (=> d!118411 (= (unapply!7 ($colon$colon!563 tail!21 head!726)) (ite ((_ is Nil!20867) ($colon$colon!563 tail!21 head!726)) None!524 (Some!525 (tuple2!14951 (h!22034 ($colon$colon!563 tail!21 head!726)) (t!29848 ($colon$colon!563 tail!21 head!726))))))))

(assert (=> b!993192 d!118411))

(declare-fun d!118415 () Bool)

(assert (=> d!118415 (= ($colon$colon!563 tail!21 head!726) (Cons!20866 head!726 tail!21))))

(assert (=> b!993192 d!118415))

(declare-fun d!118421 () Bool)

(declare-fun lt!440494 () Bool)

(assert (=> d!118421 (= lt!440494 (select (content!436 (_2!7486 (get!15717 lt!440480))) head!726))))

(declare-fun e!560376 () Bool)

(assert (=> d!118421 (= lt!440494 e!560376)))

(declare-fun res!663602 () Bool)

(assert (=> d!118421 (=> (not res!663602) (not e!560376))))

(assert (=> d!118421 (= res!663602 ((_ is Cons!20866) (_2!7486 (get!15717 lt!440480))))))

(assert (=> d!118421 (= (contains!5764 (_2!7486 (get!15717 lt!440480)) head!726) lt!440494)))

(declare-fun b!993244 () Bool)

(declare-fun e!560377 () Bool)

(assert (=> b!993244 (= e!560376 e!560377)))

(declare-fun res!663603 () Bool)

(assert (=> b!993244 (=> res!663603 e!560377)))

(assert (=> b!993244 (= res!663603 (= (h!22034 (_2!7486 (get!15717 lt!440480))) head!726))))

(declare-fun b!993245 () Bool)

(assert (=> b!993245 (= e!560377 (contains!5764 (t!29848 (_2!7486 (get!15717 lt!440480))) head!726))))

(assert (= (and d!118421 res!663602) b!993244))

(assert (= (and b!993244 (not res!663603)) b!993245))

(declare-fun m!921337 () Bool)

(assert (=> d!118421 m!921337))

(declare-fun m!921341 () Bool)

(assert (=> d!118421 m!921341))

(declare-fun m!921345 () Bool)

(assert (=> b!993245 m!921345))

(assert (=> b!993193 d!118421))

(declare-fun d!118427 () Bool)

(assert (=> d!118427 (= (get!15717 lt!440480) (v!14325 lt!440480))))

(assert (=> b!993193 d!118427))

(declare-fun d!118433 () Bool)

(declare-fun lt!440497 () Bool)

(assert (=> d!118433 (= lt!440497 (select (content!436 tail!21) head!726))))

(declare-fun e!560382 () Bool)

(assert (=> d!118433 (= lt!440497 e!560382)))

(declare-fun res!663608 () Bool)

(assert (=> d!118433 (=> (not res!663608) (not e!560382))))

(assert (=> d!118433 (= res!663608 ((_ is Cons!20866) tail!21))))

(assert (=> d!118433 (= (contains!5764 tail!21 head!726) lt!440497)))

(declare-fun b!993250 () Bool)

(declare-fun e!560383 () Bool)

(assert (=> b!993250 (= e!560382 e!560383)))

(declare-fun res!663609 () Bool)

(assert (=> b!993250 (=> res!663609 e!560383)))

(assert (=> b!993250 (= res!663609 (= (h!22034 tail!21) head!726))))

(declare-fun b!993251 () Bool)

(assert (=> b!993251 (= e!560383 (contains!5764 (t!29848 tail!21) head!726))))

(assert (= (and d!118433 res!663608) b!993250))

(assert (= (and b!993250 (not res!663609)) b!993251))

(assert (=> d!118433 m!921277))

(assert (=> d!118433 m!921279))

(declare-fun m!921355 () Bool)

(assert (=> b!993251 m!921355))

(assert (=> start!85148 d!118433))

(check-sat (not d!118421) (not b!993229) (not b!993251) (not b!993245) (not d!118433))
(check-sat)
