; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85100 () Bool)

(assert start!85100)

(declare-fun res!663300 () Bool)

(declare-fun e!559838 () Bool)

(assert (=> start!85100 (=> (not res!663300) (not e!559838))))

(declare-datatypes ((List!20925 0))(
  ( (Nil!20922) (Cons!20921 (h!22083 (_ BitVec 64)) (t!29911 List!20925)) )
))
(declare-fun tail!21 () List!20925)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5724 (List!20925 (_ BitVec 64)) Bool)

(assert (=> start!85100 (= res!663300 (not (contains!5724 tail!21 head!726)))))

(assert (=> start!85100 e!559838))

(assert (=> start!85100 true))

(declare-fun b!992373 () Bool)

(declare-fun res!663301 () Bool)

(assert (=> b!992373 (=> (not res!663301) (not e!559838))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!443 (List!20925) (InoxSet (_ BitVec 64)))

(assert (=> b!992373 (= res!663301 (not (select (content!443 tail!21) head!726)))))

(declare-fun b!992374 () Bool)

(declare-fun e!559837 () Bool)

(assert (=> b!992374 (= e!559838 e!559837)))

(declare-fun res!663299 () Bool)

(assert (=> b!992374 (=> (not res!663299) (not e!559837))))

(declare-fun lt!440000 () List!20925)

(declare-datatypes ((tuple2!15044 0))(
  ( (tuple2!15045 (_1!7533 (_ BitVec 64)) (_2!7533 List!20925)) )
))
(declare-datatypes ((Option!540 0))(
  ( (Some!539 (v!14345 tuple2!15044)) (None!538) )
))
(declare-fun isEmpty!749 (Option!540) Bool)

(declare-fun unapply!16 (List!20925) Option!540)

(assert (=> b!992374 (= res!663299 (isEmpty!749 (unapply!16 lt!440000)))))

(declare-fun $colon$colon!574 (List!20925 (_ BitVec 64)) List!20925)

(assert (=> b!992374 (= lt!440000 ($colon$colon!574 tail!21 head!726))))

(declare-fun b!992375 () Bool)

(get-info :version)

(assert (=> b!992375 (= e!559837 (not ((_ is Nil!20922) lt!440000)))))

(assert (= (and start!85100 res!663300) b!992373))

(assert (= (and b!992373 res!663301) b!992374))

(assert (= (and b!992374 res!663299) b!992375))

(declare-fun m!919571 () Bool)

(assert (=> start!85100 m!919571))

(declare-fun m!919573 () Bool)

(assert (=> b!992373 m!919573))

(declare-fun m!919575 () Bool)

(assert (=> b!992373 m!919575))

(declare-fun m!919577 () Bool)

(assert (=> b!992374 m!919577))

(assert (=> b!992374 m!919577))

(declare-fun m!919579 () Bool)

(assert (=> b!992374 m!919579))

(declare-fun m!919581 () Bool)

(assert (=> b!992374 m!919581))

(check-sat (not b!992374) (not start!85100) (not b!992373))
(check-sat)
(get-model)

(declare-fun d!118021 () Bool)

(assert (=> d!118021 (= (isEmpty!749 (unapply!16 lt!440000)) (not ((_ is Some!539) (unapply!16 lt!440000))))))

(assert (=> b!992374 d!118021))

(declare-fun d!118025 () Bool)

(assert (=> d!118025 (= (unapply!16 lt!440000) (ite ((_ is Nil!20922) lt!440000) None!538 (Some!539 (tuple2!15045 (h!22083 lt!440000) (t!29911 lt!440000)))))))

(assert (=> b!992374 d!118025))

(declare-fun d!118031 () Bool)

(assert (=> d!118031 (= ($colon$colon!574 tail!21 head!726) (Cons!20921 head!726 tail!21))))

(assert (=> b!992374 d!118031))

(declare-fun d!118033 () Bool)

(declare-fun lt!440014 () Bool)

(assert (=> d!118033 (= lt!440014 (select (content!443 tail!21) head!726))))

(declare-fun e!559865 () Bool)

(assert (=> d!118033 (= lt!440014 e!559865)))

(declare-fun res!663335 () Bool)

(assert (=> d!118033 (=> (not res!663335) (not e!559865))))

(assert (=> d!118033 (= res!663335 ((_ is Cons!20921) tail!21))))

(assert (=> d!118033 (= (contains!5724 tail!21 head!726) lt!440014)))

(declare-fun b!992408 () Bool)

(declare-fun e!559866 () Bool)

(assert (=> b!992408 (= e!559865 e!559866)))

(declare-fun res!663334 () Bool)

(assert (=> b!992408 (=> res!663334 e!559866)))

(assert (=> b!992408 (= res!663334 (= (h!22083 tail!21) head!726))))

(declare-fun b!992409 () Bool)

(assert (=> b!992409 (= e!559866 (contains!5724 (t!29911 tail!21) head!726))))

(assert (= (and d!118033 res!663335) b!992408))

(assert (= (and b!992408 (not res!663334)) b!992409))

(assert (=> d!118033 m!919573))

(assert (=> d!118033 m!919575))

(declare-fun m!919609 () Bool)

(assert (=> b!992409 m!919609))

(assert (=> start!85100 d!118033))

(declare-fun d!118045 () Bool)

(declare-fun c!100682 () Bool)

(assert (=> d!118045 (= c!100682 ((_ is Nil!20922) tail!21))))

(declare-fun e!559877 () (InoxSet (_ BitVec 64)))

(assert (=> d!118045 (= (content!443 tail!21) e!559877)))

(declare-fun b!992428 () Bool)

(assert (=> b!992428 (= e!559877 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992429 () Bool)

(assert (=> b!992429 (= e!559877 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22083 tail!21) true) (content!443 (t!29911 tail!21))))))

(assert (= (and d!118045 c!100682) b!992428))

(assert (= (and d!118045 (not c!100682)) b!992429))

(declare-fun m!919620 () Bool)

(assert (=> b!992429 m!919620))

(declare-fun m!919623 () Bool)

(assert (=> b!992429 m!919623))

(assert (=> b!992373 d!118045))

(check-sat (not d!118033) (not b!992409) (not b!992429))
(check-sat)
