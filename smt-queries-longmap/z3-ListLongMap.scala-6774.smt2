; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85156 () Bool)

(assert start!85156)

(declare-fun b!992689 () Bool)

(declare-fun res!663470 () Bool)

(declare-fun e!560037 () Bool)

(assert (=> b!992689 (=> (not res!663470) (not e!560037))))

(declare-fun head!726 () (_ BitVec 64))

(declare-datatypes ((List!20894 0))(
  ( (Nil!20891) (Cons!20890 (h!22052 (_ BitVec 64)) (t!29892 List!20894)) )
))
(declare-fun tail!21 () List!20894)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!449 (List!20894) (InoxSet (_ BitVec 64)))

(assert (=> b!992689 (= res!663470 (not (select (content!449 tail!21) head!726)))))

(declare-fun b!992690 () Bool)

(declare-fun e!560036 () Bool)

(assert (=> b!992690 (= e!560037 e!560036)))

(declare-fun res!663468 () Bool)

(assert (=> b!992690 (=> (not res!663468) (not e!560036))))

(declare-fun lt!440257 () List!20894)

(declare-datatypes ((tuple2!14972 0))(
  ( (tuple2!14973 (_1!7497 (_ BitVec 64)) (_2!7497 List!20894)) )
))
(declare-datatypes ((Option!541 0))(
  ( (Some!540 (v!14353 tuple2!14972)) (None!539) )
))
(declare-fun isEmpty!748 (Option!541) Bool)

(declare-fun unapply!20 (List!20894) Option!541)

(assert (=> b!992690 (= res!663468 (isEmpty!748 (unapply!20 lt!440257)))))

(declare-fun $colon$colon!577 (List!20894 (_ BitVec 64)) List!20894)

(assert (=> b!992690 (= lt!440257 ($colon$colon!577 tail!21 head!726))))

(declare-fun res!663469 () Bool)

(assert (=> start!85156 (=> (not res!663469) (not e!560037))))

(declare-fun contains!5755 (List!20894 (_ BitVec 64)) Bool)

(assert (=> start!85156 (= res!663469 (not (contains!5755 tail!21 head!726)))))

(assert (=> start!85156 e!560037))

(assert (=> start!85156 true))

(declare-fun b!992691 () Bool)

(declare-fun res!663471 () Bool)

(assert (=> b!992691 (=> (not res!663471) (not e!560036))))

(get-info :version)

(assert (=> b!992691 (= res!663471 (not ((_ is Nil!20891) lt!440257)))))

(declare-fun b!992692 () Bool)

(declare-fun -!448 (List!20894 (_ BitVec 64)) List!20894)

(assert (=> b!992692 (= e!560036 (not (= (-!448 lt!440257 head!726) tail!21)))))

(assert (= (and start!85156 res!663469) b!992689))

(assert (= (and b!992689 res!663470) b!992690))

(assert (= (and b!992690 res!663468) b!992691))

(assert (= (and b!992691 res!663471) b!992692))

(declare-fun m!920397 () Bool)

(assert (=> b!992689 m!920397))

(declare-fun m!920399 () Bool)

(assert (=> b!992689 m!920399))

(declare-fun m!920401 () Bool)

(assert (=> b!992690 m!920401))

(assert (=> b!992690 m!920401))

(declare-fun m!920403 () Bool)

(assert (=> b!992690 m!920403))

(declare-fun m!920405 () Bool)

(assert (=> b!992690 m!920405))

(declare-fun m!920407 () Bool)

(assert (=> start!85156 m!920407))

(declare-fun m!920409 () Bool)

(assert (=> b!992692 m!920409))

(check-sat (not start!85156) (not b!992692) (not b!992689) (not b!992690))
(check-sat)
(get-model)

(declare-fun d!118251 () Bool)

(declare-fun lt!440266 () Bool)

(assert (=> d!118251 (= lt!440266 (select (content!449 tail!21) head!726))))

(declare-fun e!560058 () Bool)

(assert (=> d!118251 (= lt!440266 e!560058)))

(declare-fun res!663492 () Bool)

(assert (=> d!118251 (=> (not res!663492) (not e!560058))))

(assert (=> d!118251 (= res!663492 ((_ is Cons!20890) tail!21))))

(assert (=> d!118251 (= (contains!5755 tail!21 head!726) lt!440266)))

(declare-fun b!992724 () Bool)

(declare-fun e!560059 () Bool)

(assert (=> b!992724 (= e!560058 e!560059)))

(declare-fun res!663491 () Bool)

(assert (=> b!992724 (=> res!663491 e!560059)))

(assert (=> b!992724 (= res!663491 (= (h!22052 tail!21) head!726))))

(declare-fun b!992725 () Bool)

(assert (=> b!992725 (= e!560059 (contains!5755 (t!29892 tail!21) head!726))))

(assert (= (and d!118251 res!663492) b!992724))

(assert (= (and b!992724 (not res!663491)) b!992725))

(assert (=> d!118251 m!920397))

(assert (=> d!118251 m!920399))

(declare-fun m!920437 () Bool)

(assert (=> b!992725 m!920437))

(assert (=> start!85156 d!118251))

(declare-fun d!118263 () Bool)

(declare-fun e!560087 () Bool)

(assert (=> d!118263 e!560087))

(declare-fun res!663507 () Bool)

(assert (=> d!118263 (=> (not res!663507) (not e!560087))))

(declare-fun lt!440277 () List!20894)

(declare-fun size!30691 (List!20894) Int)

(assert (=> d!118263 (= res!663507 (<= (size!30691 lt!440277) (size!30691 lt!440257)))))

(declare-fun e!560089 () List!20894)

(assert (=> d!118263 (= lt!440277 e!560089)))

(declare-fun c!100766 () Bool)

(assert (=> d!118263 (= c!100766 ((_ is Cons!20890) lt!440257))))

(assert (=> d!118263 (= (-!448 lt!440257 head!726) lt!440277)))

(declare-fun bm!42117 () Bool)

(declare-fun call!42120 () List!20894)

(assert (=> bm!42117 (= call!42120 (-!448 (t!29892 lt!440257) head!726))))

(declare-fun b!992762 () Bool)

(declare-fun e!560088 () List!20894)

(assert (=> b!992762 (= e!560089 e!560088)))

(declare-fun c!100765 () Bool)

(assert (=> b!992762 (= c!100765 (= head!726 (h!22052 lt!440257)))))

(declare-fun b!992763 () Bool)

(assert (=> b!992763 (= e!560088 (Cons!20890 (h!22052 lt!440257) call!42120))))

(declare-fun b!992764 () Bool)

(assert (=> b!992764 (= e!560088 call!42120)))

(declare-fun b!992765 () Bool)

(assert (=> b!992765 (= e!560087 (= (content!449 lt!440277) ((_ map and) (content!449 lt!440257) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(declare-fun b!992766 () Bool)

(assert (=> b!992766 (= e!560089 Nil!20891)))

(assert (= (and d!118263 c!100766) b!992762))

(assert (= (and d!118263 (not c!100766)) b!992766))

(assert (= (and b!992762 c!100765) b!992764))

(assert (= (and b!992762 (not c!100765)) b!992763))

(assert (= (or b!992764 b!992763) bm!42117))

(assert (= (and d!118263 res!663507) b!992765))

(declare-fun m!920447 () Bool)

(assert (=> d!118263 m!920447))

(declare-fun m!920449 () Bool)

(assert (=> d!118263 m!920449))

(declare-fun m!920451 () Bool)

(assert (=> bm!42117 m!920451))

(declare-fun m!920453 () Bool)

(assert (=> b!992765 m!920453))

(declare-fun m!920455 () Bool)

(assert (=> b!992765 m!920455))

(declare-fun m!920457 () Bool)

(assert (=> b!992765 m!920457))

(assert (=> b!992692 d!118263))

(declare-fun d!118275 () Bool)

(declare-fun c!100771 () Bool)

(assert (=> d!118275 (= c!100771 ((_ is Nil!20891) tail!21))))

(declare-fun e!560097 () (InoxSet (_ BitVec 64)))

(assert (=> d!118275 (= (content!449 tail!21) e!560097)))

(declare-fun b!992778 () Bool)

(assert (=> b!992778 (= e!560097 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992779 () Bool)

(assert (=> b!992779 (= e!560097 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22052 tail!21) true) (content!449 (t!29892 tail!21))))))

(assert (= (and d!118275 c!100771) b!992778))

(assert (= (and d!118275 (not c!100771)) b!992779))

(declare-fun m!920465 () Bool)

(assert (=> b!992779 m!920465))

(declare-fun m!920469 () Bool)

(assert (=> b!992779 m!920469))

(assert (=> b!992689 d!118275))

(declare-fun d!118277 () Bool)

(assert (=> d!118277 (= (isEmpty!748 (unapply!20 lt!440257)) (not ((_ is Some!540) (unapply!20 lt!440257))))))

(assert (=> b!992690 d!118277))

(declare-fun d!118281 () Bool)

(assert (=> d!118281 (= (unapply!20 lt!440257) (ite ((_ is Nil!20891) lt!440257) None!539 (Some!540 (tuple2!14973 (h!22052 lt!440257) (t!29892 lt!440257)))))))

(assert (=> b!992690 d!118281))

(declare-fun d!118283 () Bool)

(assert (=> d!118283 (= ($colon$colon!577 tail!21 head!726) (Cons!20890 head!726 tail!21))))

(assert (=> b!992690 d!118283))

(check-sat (not bm!42117) (not d!118251) (not b!992765) (not d!118263) (not b!992779) (not b!992725))
