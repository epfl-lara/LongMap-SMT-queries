; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84984 () Bool)

(assert start!84984)

(declare-fun res!663243 () Bool)

(declare-fun e!559770 () Bool)

(assert (=> start!84984 (=> (not res!663243) (not e!559770))))

(declare-datatypes ((List!20883 0))(
  ( (Nil!20880) (Cons!20879 (h!22041 (_ BitVec 64)) (t!29869 List!20883)) )
))
(declare-fun tail!21 () List!20883)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5744 (List!20883 (_ BitVec 64)) Bool)

(assert (=> start!84984 (= res!663243 (not (contains!5744 tail!21 head!726)))))

(assert (=> start!84984 e!559770))

(assert (=> start!84984 true))

(declare-fun b!992306 () Bool)

(declare-fun res!663242 () Bool)

(assert (=> b!992306 (=> (not res!663242) (not e!559770))))

(declare-fun content!438 (List!20883) (Set (_ BitVec 64)))

(assert (=> b!992306 (= res!663242 (not (member head!726 (content!438 tail!21))))))

(declare-fun b!992307 () Bool)

(declare-fun e!559769 () Bool)

(assert (=> b!992307 (= e!559770 e!559769)))

(declare-fun res!663241 () Bool)

(assert (=> b!992307 (=> (not res!663241) (not e!559769))))

(declare-datatypes ((tuple2!14950 0))(
  ( (tuple2!14951 (_1!7486 (_ BitVec 64)) (_2!7486 List!20883)) )
))
(declare-datatypes ((Option!530 0))(
  ( (Some!529 (v!14330 tuple2!14950)) (None!528) )
))
(declare-fun lt!440125 () Option!530)

(declare-fun isEmpty!737 (Option!530) Bool)

(assert (=> b!992307 (= res!663241 (not (isEmpty!737 lt!440125)))))

(declare-fun unapply!9 (List!20883) Option!530)

(declare-fun $colon$colon!566 (List!20883 (_ BitVec 64)) List!20883)

(assert (=> b!992307 (= lt!440125 (unapply!9 ($colon$colon!566 tail!21 head!726)))))

(declare-fun b!992308 () Bool)

(declare-fun get!15690 (Option!530) tuple2!14950)

(assert (=> b!992308 (= e!559769 (contains!5744 (_2!7486 (get!15690 lt!440125)) head!726))))

(assert (= (and start!84984 res!663243) b!992306))

(assert (= (and b!992306 res!663242) b!992307))

(assert (= (and b!992307 res!663241) b!992308))

(declare-fun m!920013 () Bool)

(assert (=> start!84984 m!920013))

(declare-fun m!920015 () Bool)

(assert (=> b!992306 m!920015))

(declare-fun m!920017 () Bool)

(assert (=> b!992306 m!920017))

(declare-fun m!920019 () Bool)

(assert (=> b!992307 m!920019))

(declare-fun m!920021 () Bool)

(assert (=> b!992307 m!920021))

(assert (=> b!992307 m!920021))

(declare-fun m!920023 () Bool)

(assert (=> b!992307 m!920023))

(declare-fun m!920025 () Bool)

(assert (=> b!992308 m!920025))

(declare-fun m!920027 () Bool)

(assert (=> b!992308 m!920027))

(push 1)

(assert (not start!84984))

(assert (not b!992308))

(assert (not b!992307))

(assert (not b!992306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118073 () Bool)

(declare-fun lt!440128 () Bool)

(assert (=> d!118073 (= lt!440128 (member head!726 (content!438 tail!21)))))

(declare-fun e!559776 () Bool)

(assert (=> d!118073 (= lt!440128 e!559776)))

(declare-fun res!663248 () Bool)

(assert (=> d!118073 (=> (not res!663248) (not e!559776))))

(assert (=> d!118073 (= res!663248 (is-Cons!20879 tail!21))))

(assert (=> d!118073 (= (contains!5744 tail!21 head!726) lt!440128)))

(declare-fun b!992313 () Bool)

(declare-fun e!559775 () Bool)

(assert (=> b!992313 (= e!559776 e!559775)))

(declare-fun res!663249 () Bool)

(assert (=> b!992313 (=> res!663249 e!559775)))

(assert (=> b!992313 (= res!663249 (= (h!22041 tail!21) head!726))))

(declare-fun b!992314 () Bool)

(assert (=> b!992314 (= e!559775 (contains!5744 (t!29869 tail!21) head!726))))

(assert (= (and d!118073 res!663248) b!992313))

(assert (= (and b!992313 (not res!663249)) b!992314))

(assert (=> d!118073 m!920015))

(assert (=> d!118073 m!920017))

(declare-fun m!920029 () Bool)

(assert (=> b!992314 m!920029))

(assert (=> start!84984 d!118073))

(declare-fun d!118079 () Bool)

(declare-fun lt!440129 () Bool)

(assert (=> d!118079 (= lt!440129 (member head!726 (content!438 (_2!7486 (get!15690 lt!440125)))))))

(declare-fun e!559778 () Bool)

(assert (=> d!118079 (= lt!440129 e!559778)))

(declare-fun res!663250 () Bool)

(assert (=> d!118079 (=> (not res!663250) (not e!559778))))

(assert (=> d!118079 (= res!663250 (is-Cons!20879 (_2!7486 (get!15690 lt!440125))))))

(assert (=> d!118079 (= (contains!5744 (_2!7486 (get!15690 lt!440125)) head!726) lt!440129)))

(declare-fun b!992315 () Bool)

(declare-fun e!559777 () Bool)

(assert (=> b!992315 (= e!559778 e!559777)))

(declare-fun res!663251 () Bool)

(assert (=> b!992315 (=> res!663251 e!559777)))

(assert (=> b!992315 (= res!663251 (= (h!22041 (_2!7486 (get!15690 lt!440125))) head!726))))

(declare-fun b!992316 () Bool)

(assert (=> b!992316 (= e!559777 (contains!5744 (t!29869 (_2!7486 (get!15690 lt!440125))) head!726))))

(assert (= (and d!118079 res!663250) b!992315))

(assert (= (and b!992315 (not res!663251)) b!992316))

(declare-fun m!920031 () Bool)

(assert (=> d!118079 m!920031))

(declare-fun m!920033 () Bool)

(assert (=> d!118079 m!920033))

(declare-fun m!920035 () Bool)

(assert (=> b!992316 m!920035))

(assert (=> b!992308 d!118079))

(declare-fun d!118081 () Bool)

(assert (=> d!118081 (= (get!15690 lt!440125) (v!14330 lt!440125))))

(assert (=> b!992308 d!118081))

(declare-fun d!118083 () Bool)

(assert (=> d!118083 (= (isEmpty!737 lt!440125) (not (is-Some!529 lt!440125)))))

(assert (=> b!992307 d!118083))

(declare-fun d!118085 () Bool)

(assert (=> d!118085 (= (unapply!9 ($colon$colon!566 tail!21 head!726)) (ite (is-Nil!20880 ($colon$colon!566 tail!21 head!726)) None!528 (Some!529 (tuple2!14951 (h!22041 ($colon$colon!566 tail!21 head!726)) (t!29869 ($colon$colon!566 tail!21 head!726))))))))

(assert (=> b!992307 d!118085))

(declare-fun d!118095 () Bool)

(assert (=> d!118095 (= ($colon$colon!566 tail!21 head!726) (Cons!20879 head!726 tail!21))))

(assert (=> b!992307 d!118095))

(declare-fun d!118101 () Bool)

(declare-fun c!100672 () Bool)

(assert (=> d!118101 (= c!100672 (is-Nil!20880 tail!21))))

(declare-fun e!559797 () (Set (_ BitVec 64)))

(assert (=> d!118101 (= (content!438 tail!21) e!559797)))

(declare-fun b!992337 () Bool)

(assert (=> b!992337 (= e!559797 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!992338 () Bool)

(assert (=> b!992338 (= e!559797 (union (insert (h!22041 tail!21) (as emptyset (Set (_ BitVec 64)))) (content!438 (t!29869 tail!21))))))

(assert (= (and d!118101 c!100672) b!992337))

(assert (= (and d!118101 (not c!100672)) b!992338))

(declare-fun m!920053 () Bool)

(assert (=> b!992338 m!920053))

(declare-fun m!920055 () Bool)

(assert (=> b!992338 m!920055))

(assert (=> b!992306 d!118101))

(push 1)

