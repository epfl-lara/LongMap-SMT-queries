; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85158 () Bool)

(assert start!85158)

(declare-fun res!663483 () Bool)

(declare-fun e!560043 () Bool)

(assert (=> start!85158 (=> (not res!663483) (not e!560043))))

(declare-datatypes ((List!20895 0))(
  ( (Nil!20892) (Cons!20891 (h!22053 (_ BitVec 64)) (t!29893 List!20895)) )
))
(declare-fun tail!21 () List!20895)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5756 (List!20895 (_ BitVec 64)) Bool)

(assert (=> start!85158 (= res!663483 (not (contains!5756 tail!21 head!726)))))

(assert (=> start!85158 e!560043))

(assert (=> start!85158 true))

(declare-fun b!992703 () Bool)

(declare-fun res!663482 () Bool)

(declare-fun e!560042 () Bool)

(assert (=> b!992703 (=> (not res!663482) (not e!560042))))

(declare-fun lt!440260 () List!20895)

(assert (=> b!992703 (= res!663482 (not (is-Nil!20892 lt!440260)))))

(declare-fun b!992701 () Bool)

(declare-fun res!663481 () Bool)

(assert (=> b!992701 (=> (not res!663481) (not e!560043))))

(declare-fun content!450 (List!20895) (Set (_ BitVec 64)))

(assert (=> b!992701 (= res!663481 (not (member head!726 (content!450 tail!21))))))

(declare-fun b!992702 () Bool)

(assert (=> b!992702 (= e!560043 e!560042)))

(declare-fun res!663480 () Bool)

(assert (=> b!992702 (=> (not res!663480) (not e!560042))))

(declare-datatypes ((tuple2!14974 0))(
  ( (tuple2!14975 (_1!7498 (_ BitVec 64)) (_2!7498 List!20895)) )
))
(declare-datatypes ((Option!542 0))(
  ( (Some!541 (v!14354 tuple2!14974)) (None!540) )
))
(declare-fun isEmpty!749 (Option!542) Bool)

(declare-fun unapply!21 (List!20895) Option!542)

(assert (=> b!992702 (= res!663480 (isEmpty!749 (unapply!21 lt!440260)))))

(declare-fun $colon$colon!578 (List!20895 (_ BitVec 64)) List!20895)

(assert (=> b!992702 (= lt!440260 ($colon$colon!578 tail!21 head!726))))

(declare-fun b!992704 () Bool)

(declare-fun -!449 (List!20895 (_ BitVec 64)) List!20895)

(assert (=> b!992704 (= e!560042 (not (= (-!449 lt!440260 head!726) tail!21)))))

(assert (= (and start!85158 res!663483) b!992701))

(assert (= (and b!992701 res!663481) b!992702))

(assert (= (and b!992702 res!663480) b!992703))

(assert (= (and b!992703 res!663482) b!992704))

(declare-fun m!920411 () Bool)

(assert (=> start!85158 m!920411))

(declare-fun m!920413 () Bool)

(assert (=> b!992701 m!920413))

(declare-fun m!920415 () Bool)

(assert (=> b!992701 m!920415))

(declare-fun m!920417 () Bool)

(assert (=> b!992702 m!920417))

(assert (=> b!992702 m!920417))

(declare-fun m!920419 () Bool)

(assert (=> b!992702 m!920419))

(declare-fun m!920421 () Bool)

(assert (=> b!992702 m!920421))

(declare-fun m!920423 () Bool)

(assert (=> b!992704 m!920423))

(push 1)

(assert (not b!992704))

(assert (not b!992701))

(assert (not b!992702))

(assert (not start!85158))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118249 () Bool)

(declare-fun e!560057 () Bool)

(assert (=> d!118249 e!560057))

(declare-fun res!663490 () Bool)

(assert (=> d!118249 (=> (not res!663490) (not e!560057))))

(declare-fun lt!440265 () List!20895)

(declare-fun size!30690 (List!20895) Int)

(assert (=> d!118249 (= res!663490 (<= (size!30690 lt!440265) (size!30690 lt!440260)))))

(declare-fun e!560056 () List!20895)

(assert (=> d!118249 (= lt!440265 e!560056)))

(declare-fun c!100752 () Bool)

(assert (=> d!118249 (= c!100752 (is-Cons!20891 lt!440260))))

(assert (=> d!118249 (= (-!449 lt!440260 head!726) lt!440265)))

(declare-fun b!992719 () Bool)

(declare-fun e!560055 () List!20895)

(declare-fun call!42115 () List!20895)

(assert (=> b!992719 (= e!560055 (Cons!20891 (h!22053 lt!440260) call!42115))))

(declare-fun b!992720 () Bool)

(assert (=> b!992720 (= e!560056 e!560055)))

(declare-fun c!100753 () Bool)

(assert (=> b!992720 (= c!100753 (= head!726 (h!22053 lt!440260)))))

(declare-fun b!992721 () Bool)

(assert (=> b!992721 (= e!560055 call!42115)))

(declare-fun bm!42112 () Bool)

(assert (=> bm!42112 (= call!42115 (-!449 (t!29893 lt!440260) head!726))))

(declare-fun b!992722 () Bool)

(assert (=> b!992722 (= e!560057 (= (content!450 lt!440265) (setminus (content!450 lt!440260) (insert head!726 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!992723 () Bool)

(assert (=> b!992723 (= e!560056 Nil!20892)))

(assert (= (and d!118249 c!100752) b!992720))

(assert (= (and d!118249 (not c!100752)) b!992723))

(assert (= (and b!992720 c!100753) b!992721))

(assert (= (and b!992720 (not c!100753)) b!992719))

(assert (= (or b!992721 b!992719) bm!42112))

(assert (= (and d!118249 res!663490) b!992722))

(declare-fun m!920425 () Bool)

(assert (=> d!118249 m!920425))

(declare-fun m!920427 () Bool)

(assert (=> d!118249 m!920427))

(declare-fun m!920429 () Bool)

(assert (=> bm!42112 m!920429))

(declare-fun m!920431 () Bool)

(assert (=> b!992722 m!920431))

(declare-fun m!920433 () Bool)

(assert (=> b!992722 m!920433))

(declare-fun m!920435 () Bool)

(assert (=> b!992722 m!920435))

(assert (=> b!992704 d!118249))

(declare-fun d!118261 () Bool)

(declare-fun c!100756 () Bool)

(assert (=> d!118261 (= c!100756 (is-Nil!20892 tail!21))))

(declare-fun e!560066 () (Set (_ BitVec 64)))

(assert (=> d!118261 (= (content!450 tail!21) e!560066)))

(declare-fun b!992734 () Bool)

(assert (=> b!992734 (= e!560066 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!992735 () Bool)

(assert (=> b!992735 (= e!560066 (union (insert (h!22053 tail!21) (as emptyset (Set (_ BitVec 64)))) (content!450 (t!29893 tail!21))))))

(assert (= (and d!118261 c!100756) b!992734))

(assert (= (and d!118261 (not c!100756)) b!992735))

(declare-fun m!920439 () Bool)

(assert (=> b!992735 m!920439))

(declare-fun m!920441 () Bool)

(assert (=> b!992735 m!920441))

(assert (=> b!992701 d!118261))

(declare-fun d!118265 () Bool)

(assert (=> d!118265 (= (isEmpty!749 (unapply!21 lt!440260)) (not (is-Some!541 (unapply!21 lt!440260))))))

(assert (=> b!992702 d!118265))

(declare-fun d!118267 () Bool)

(assert (=> d!118267 (= (unapply!21 lt!440260) (ite (is-Nil!20892 lt!440260) None!540 (Some!541 (tuple2!14975 (h!22053 lt!440260) (t!29893 lt!440260)))))))

(assert (=> b!992702 d!118267))

(declare-fun d!118269 () Bool)

(assert (=> d!118269 (= ($colon$colon!578 tail!21 head!726) (Cons!20891 head!726 tail!21))))

(assert (=> b!992702 d!118269))

(declare-fun d!118273 () Bool)

(declare-fun lt!440274 () Bool)

(assert (=> d!118273 (= lt!440274 (member head!726 (content!450 tail!21)))))

(declare-fun e!560081 () Bool)

(assert (=> d!118273 (= lt!440274 e!560081)))

(declare-fun res!663505 () Bool)

(assert (=> d!118273 (=> (not res!663505) (not e!560081))))

(assert (=> d!118273 (= res!663505 (is-Cons!20891 tail!21))))

(assert (=> d!118273 (= (contains!5756 tail!21 head!726) lt!440274)))

(declare-fun b!992752 () Bool)

(declare-fun e!560080 () Bool)

(assert (=> b!992752 (= e!560081 e!560080)))

(declare-fun res!663506 () Bool)

(assert (=> b!992752 (=> res!663506 e!560080)))

(assert (=> b!992752 (= res!663506 (= (h!22053 tail!21) head!726))))

(declare-fun b!992753 () Bool)

(assert (=> b!992753 (= e!560080 (contains!5756 (t!29893 tail!21) head!726))))

(assert (= (and d!118273 res!663505) b!992752))

(assert (= (and b!992752 (not res!663506)) b!992753))

(assert (=> d!118273 m!920413))

(assert (=> d!118273 m!920415))

(declare-fun m!920445 () Bool)

(assert (=> b!992753 m!920445))

(assert (=> start!85158 d!118273))

(push 1)

(assert (not b!992753))

(assert (not d!118249))

(assert (not b!992735))

(assert (not bm!42112))

(assert (not d!118273))

(assert (not b!992722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

