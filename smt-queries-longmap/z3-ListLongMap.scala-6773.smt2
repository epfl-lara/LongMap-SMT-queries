; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85286 () Bool)

(assert start!85286)

(declare-fun res!663754 () Bool)

(declare-fun e!560568 () Bool)

(assert (=> start!85286 (=> (not res!663754) (not e!560568))))

(declare-datatypes ((List!20879 0))(
  ( (Nil!20876) (Cons!20875 (h!22043 (_ BitVec 64)) (t!29866 List!20879)) )
))
(declare-fun tail!21 () List!20879)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5773 (List!20879 (_ BitVec 64)) Bool)

(assert (=> start!85286 (= res!663754 (not (contains!5773 tail!21 head!726)))))

(assert (=> start!85286 e!560568))

(assert (=> start!85286 true))

(declare-fun b!993515 () Bool)

(declare-fun res!663755 () Bool)

(assert (=> b!993515 (=> (not res!663755) (not e!560568))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!445 (List!20879) (InoxSet (_ BitVec 64)))

(assert (=> b!993515 (= res!663755 (not (select (content!445 tail!21) head!726)))))

(declare-fun b!993516 () Bool)

(declare-fun e!560567 () Bool)

(assert (=> b!993516 (= e!560568 e!560567)))

(declare-fun res!663753 () Bool)

(assert (=> b!993516 (=> (not res!663753) (not e!560567))))

(declare-fun lt!440597 () List!20879)

(declare-datatypes ((tuple2!14968 0))(
  ( (tuple2!14969 (_1!7495 (_ BitVec 64)) (_2!7495 List!20879)) )
))
(declare-datatypes ((Option!535 0))(
  ( (Some!534 (v!14343 tuple2!14968)) (None!533) )
))
(declare-fun isEmpty!750 (Option!535) Bool)

(declare-fun unapply!16 (List!20879) Option!535)

(assert (=> b!993516 (= res!663753 (isEmpty!750 (unapply!16 lt!440597)))))

(declare-fun $colon$colon!572 (List!20879 (_ BitVec 64)) List!20879)

(assert (=> b!993516 (= lt!440597 ($colon$colon!572 tail!21 head!726))))

(declare-fun b!993517 () Bool)

(get-info :version)

(assert (=> b!993517 (= e!560567 (not ((_ is Nil!20876) lt!440597)))))

(assert (= (and start!85286 res!663754) b!993515))

(assert (= (and b!993515 res!663755) b!993516))

(assert (= (and b!993516 res!663753) b!993517))

(declare-fun m!921623 () Bool)

(assert (=> start!85286 m!921623))

(declare-fun m!921625 () Bool)

(assert (=> b!993515 m!921625))

(declare-fun m!921627 () Bool)

(assert (=> b!993515 m!921627))

(declare-fun m!921629 () Bool)

(assert (=> b!993516 m!921629))

(assert (=> b!993516 m!921629))

(declare-fun m!921631 () Bool)

(assert (=> b!993516 m!921631))

(declare-fun m!921633 () Bool)

(assert (=> b!993516 m!921633))

(check-sat (not start!85286) (not b!993516) (not b!993515))
(check-sat)
(get-model)

(declare-fun d!118543 () Bool)

(declare-fun lt!440612 () Bool)

(assert (=> d!118543 (= lt!440612 (select (content!445 tail!21) head!726))))

(declare-fun e!560597 () Bool)

(assert (=> d!118543 (= lt!440612 e!560597)))

(declare-fun res!663791 () Bool)

(assert (=> d!118543 (=> (not res!663791) (not e!560597))))

(assert (=> d!118543 (= res!663791 ((_ is Cons!20875) tail!21))))

(assert (=> d!118543 (= (contains!5773 tail!21 head!726) lt!440612)))

(declare-fun b!993552 () Bool)

(declare-fun e!560598 () Bool)

(assert (=> b!993552 (= e!560597 e!560598)))

(declare-fun res!663790 () Bool)

(assert (=> b!993552 (=> res!663790 e!560598)))

(assert (=> b!993552 (= res!663790 (= (h!22043 tail!21) head!726))))

(declare-fun b!993553 () Bool)

(assert (=> b!993553 (= e!560598 (contains!5773 (t!29866 tail!21) head!726))))

(assert (= (and d!118543 res!663791) b!993552))

(assert (= (and b!993552 (not res!663790)) b!993553))

(assert (=> d!118543 m!921625))

(assert (=> d!118543 m!921627))

(declare-fun m!921663 () Bool)

(assert (=> b!993553 m!921663))

(assert (=> start!85286 d!118543))

(declare-fun d!118549 () Bool)

(assert (=> d!118549 (= (isEmpty!750 (unapply!16 lt!440597)) (not ((_ is Some!534) (unapply!16 lt!440597))))))

(assert (=> b!993516 d!118549))

(declare-fun d!118555 () Bool)

(assert (=> d!118555 (= (unapply!16 lt!440597) (ite ((_ is Nil!20876) lt!440597) None!533 (Some!534 (tuple2!14969 (h!22043 lt!440597) (t!29866 lt!440597)))))))

(assert (=> b!993516 d!118555))

(declare-fun d!118561 () Bool)

(assert (=> d!118561 (= ($colon$colon!572 tail!21 head!726) (Cons!20875 head!726 tail!21))))

(assert (=> b!993516 d!118561))

(declare-fun d!118567 () Bool)

(declare-fun c!101029 () Bool)

(assert (=> d!118567 (= c!101029 ((_ is Nil!20876) tail!21))))

(declare-fun e!560607 () (InoxSet (_ BitVec 64)))

(assert (=> d!118567 (= (content!445 tail!21) e!560607)))

(declare-fun b!993570 () Bool)

(assert (=> b!993570 (= e!560607 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!993571 () Bool)

(assert (=> b!993571 (= e!560607 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22043 tail!21) true) (content!445 (t!29866 tail!21))))))

(assert (= (and d!118567 c!101029) b!993570))

(assert (= (and d!118567 (not c!101029)) b!993571))

(declare-fun m!921673 () Bool)

(assert (=> b!993571 m!921673))

(declare-fun m!921675 () Bool)

(assert (=> b!993571 m!921675))

(assert (=> b!993515 d!118567))

(check-sat (not b!993553) (not d!118543) (not b!993571))
(check-sat)
