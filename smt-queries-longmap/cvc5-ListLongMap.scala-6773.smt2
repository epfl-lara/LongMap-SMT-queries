; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85118 () Bool)

(assert start!85118)

(declare-fun res!663411 () Bool)

(declare-fun e!559985 () Bool)

(assert (=> start!85118 (=> (not res!663411) (not e!559985))))

(declare-datatypes ((List!20890 0))(
  ( (Nil!20887) (Cons!20886 (h!22048 (_ BitVec 64)) (t!29885 List!20890)) )
))
(declare-fun tail!21 () List!20890)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5751 (List!20890 (_ BitVec 64)) Bool)

(assert (=> start!85118 (= res!663411 (not (contains!5751 tail!21 head!726)))))

(assert (=> start!85118 e!559985))

(assert (=> start!85118 true))

(declare-fun b!992612 () Bool)

(declare-fun res!663409 () Bool)

(assert (=> b!992612 (=> (not res!663409) (not e!559985))))

(declare-fun content!445 (List!20890) (Set (_ BitVec 64)))

(assert (=> b!992612 (= res!663409 (not (set.member head!726 (content!445 tail!21))))))

(declare-fun b!992613 () Bool)

(declare-fun e!559986 () Bool)

(assert (=> b!992613 (= e!559985 e!559986)))

(declare-fun res!663410 () Bool)

(assert (=> b!992613 (=> (not res!663410) (not e!559986))))

(declare-fun lt!440236 () List!20890)

(declare-datatypes ((tuple2!14964 0))(
  ( (tuple2!14965 (_1!7493 (_ BitVec 64)) (_2!7493 List!20890)) )
))
(declare-datatypes ((Option!537 0))(
  ( (Some!536 (v!14346 tuple2!14964)) (None!535) )
))
(declare-fun isEmpty!744 (Option!537) Bool)

(declare-fun unapply!16 (List!20890) Option!537)

(assert (=> b!992613 (= res!663410 (isEmpty!744 (unapply!16 lt!440236)))))

(declare-fun $colon$colon!573 (List!20890 (_ BitVec 64)) List!20890)

(assert (=> b!992613 (= lt!440236 ($colon$colon!573 tail!21 head!726))))

(declare-fun b!992614 () Bool)

(assert (=> b!992614 (= e!559986 (not (is-Nil!20887 lt!440236)))))

(assert (= (and start!85118 res!663411) b!992612))

(assert (= (and b!992612 res!663409) b!992613))

(assert (= (and b!992613 res!663410) b!992614))

(declare-fun m!920329 () Bool)

(assert (=> start!85118 m!920329))

(declare-fun m!920331 () Bool)

(assert (=> b!992612 m!920331))

(declare-fun m!920333 () Bool)

(assert (=> b!992612 m!920333))

(declare-fun m!920335 () Bool)

(assert (=> b!992613 m!920335))

(assert (=> b!992613 m!920335))

(declare-fun m!920337 () Bool)

(assert (=> b!992613 m!920337))

(declare-fun m!920339 () Bool)

(assert (=> b!992613 m!920339))

(push 1)

(assert (not b!992612))

(assert (not start!85118))

(assert (not b!992613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118219 () Bool)

(declare-fun c!100741 () Bool)

(assert (=> d!118219 (= c!100741 (is-Nil!20887 tail!21))))

(declare-fun e!560009 () (Set (_ BitVec 64)))

(assert (=> d!118219 (= (content!445 tail!21) e!560009)))

(declare-fun b!992645 () Bool)

(assert (=> b!992645 (= e!560009 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992646 () Bool)

(assert (=> b!992646 (= e!560009 (set.union (set.insert (h!22048 tail!21) (as set.empty (Set (_ BitVec 64)))) (content!445 (t!29885 tail!21))))))

(assert (= (and d!118219 c!100741) b!992645))

(assert (= (and d!118219 (not c!100741)) b!992646))

(declare-fun m!920365 () Bool)

(assert (=> b!992646 m!920365))

(declare-fun m!920367 () Bool)

(assert (=> b!992646 m!920367))

(assert (=> b!992612 d!118219))

(declare-fun d!118223 () Bool)

(declare-fun lt!440251 () Bool)

(assert (=> d!118223 (= lt!440251 (set.member head!726 (content!445 tail!21)))))

(declare-fun e!560021 () Bool)

(assert (=> d!118223 (= lt!440251 e!560021)))

(declare-fun res!663447 () Bool)

(assert (=> d!118223 (=> (not res!663447) (not e!560021))))

(assert (=> d!118223 (= res!663447 (is-Cons!20886 tail!21))))

(assert (=> d!118223 (= (contains!5751 tail!21 head!726) lt!440251)))

(declare-fun b!992659 () Bool)

(declare-fun e!560020 () Bool)

(assert (=> b!992659 (= e!560021 e!560020)))

(declare-fun res!663446 () Bool)

(assert (=> b!992659 (=> res!663446 e!560020)))

(assert (=> b!992659 (= res!663446 (= (h!22048 tail!21) head!726))))

(declare-fun b!992660 () Bool)

(assert (=> b!992660 (= e!560020 (contains!5751 (t!29885 tail!21) head!726))))

(assert (= (and d!118223 res!663447) b!992659))

(assert (= (and b!992659 (not res!663446)) b!992660))

(assert (=> d!118223 m!920331))

(assert (=> d!118223 m!920333))

(declare-fun m!920375 () Bool)

(assert (=> b!992660 m!920375))

(assert (=> start!85118 d!118223))

(declare-fun d!118233 () Bool)

(assert (=> d!118233 (= (isEmpty!744 (unapply!16 lt!440236)) (not (is-Some!536 (unapply!16 lt!440236))))))

(assert (=> b!992613 d!118233))

(declare-fun d!118239 () Bool)

(assert (=> d!118239 (= (unapply!16 lt!440236) (ite (is-Nil!20887 lt!440236) None!535 (Some!536 (tuple2!14965 (h!22048 lt!440236) (t!29885 lt!440236)))))))

(assert (=> b!992613 d!118239))

(declare-fun d!118243 () Bool)

(assert (=> d!118243 (= ($colon$colon!573 tail!21 head!726) (Cons!20886 head!726 tail!21))))

(assert (=> b!992613 d!118243))

(push 1)

