; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85026 () Bool)

(assert start!85026)

(declare-fun b!992384 () Bool)

(declare-fun e!559829 () Bool)

(declare-fun e!559828 () Bool)

(assert (=> b!992384 (= e!559829 e!559828)))

(declare-fun res!663301 () Bool)

(assert (=> b!992384 (=> (not res!663301) (not e!559828))))

(declare-datatypes ((List!20886 0))(
  ( (Nil!20883) (Cons!20882 (h!22044 (_ BitVec 64)) (t!29875 List!20886)) )
))
(declare-datatypes ((tuple2!14956 0))(
  ( (tuple2!14957 (_1!7489 (_ BitVec 64)) (_2!7489 List!20886)) )
))
(declare-datatypes ((Option!533 0))(
  ( (Some!532 (v!14336 tuple2!14956)) (None!531) )
))
(declare-fun lt!440172 () Option!533)

(declare-fun isEmpty!740 (Option!533) Bool)

(assert (=> b!992384 (= res!663301 (not (isEmpty!740 lt!440172)))))

(declare-fun lt!440170 () List!20886)

(declare-fun unapply!12 (List!20886) Option!533)

(assert (=> b!992384 (= lt!440172 (unapply!12 lt!440170))))

(declare-fun tail!21 () List!20886)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun $colon$colon!569 (List!20886 (_ BitVec 64)) List!20886)

(assert (=> b!992384 (= lt!440170 ($colon$colon!569 tail!21 head!726))))

(declare-fun e!559830 () Bool)

(declare-fun b!992386 () Bool)

(declare-fun -!443 (List!20886 (_ BitVec 64)) List!20886)

(assert (=> b!992386 (= e!559830 (not (= (-!443 lt!440170 head!726) tail!21)))))

(declare-fun lt!440171 () tuple2!14956)

(assert (=> b!992386 (= (-!443 (_2!7489 lt!440171) head!726) (_2!7489 lt!440171))))

(declare-datatypes ((Unit!32908 0))(
  ( (Unit!32909) )
))
(declare-fun lt!440173 () Unit!32908)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20886) Unit!32908)

(assert (=> b!992386 (= lt!440173 (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7489 lt!440171)))))

(declare-fun b!992383 () Bool)

(declare-fun res!663300 () Bool)

(assert (=> b!992383 (=> (not res!663300) (not e!559829))))

(declare-fun content!441 (List!20886) (Set (_ BitVec 64)))

(assert (=> b!992383 (= res!663300 (not (member head!726 (content!441 tail!21))))))

(declare-fun b!992385 () Bool)

(assert (=> b!992385 (= e!559828 e!559830)))

(declare-fun res!663302 () Bool)

(assert (=> b!992385 (=> (not res!663302) (not e!559830))))

(declare-fun contains!5747 (List!20886 (_ BitVec 64)) Bool)

(assert (=> b!992385 (= res!663302 (not (contains!5747 (_2!7489 lt!440171) head!726)))))

(declare-fun get!15695 (Option!533) tuple2!14956)

(assert (=> b!992385 (= lt!440171 (get!15695 lt!440172))))

(declare-fun res!663303 () Bool)

(assert (=> start!85026 (=> (not res!663303) (not e!559829))))

(assert (=> start!85026 (= res!663303 (not (contains!5747 tail!21 head!726)))))

(assert (=> start!85026 e!559829))

(assert (=> start!85026 true))

(assert (= (and start!85026 res!663303) b!992383))

(assert (= (and b!992383 res!663300) b!992384))

(assert (= (and b!992384 res!663301) b!992385))

(assert (= (and b!992385 res!663302) b!992386))

(declare-fun m!920109 () Bool)

(assert (=> b!992383 m!920109))

(declare-fun m!920111 () Bool)

(assert (=> b!992383 m!920111))

(declare-fun m!920113 () Bool)

(assert (=> b!992386 m!920113))

(declare-fun m!920115 () Bool)

(assert (=> b!992386 m!920115))

(declare-fun m!920117 () Bool)

(assert (=> b!992386 m!920117))

(declare-fun m!920119 () Bool)

(assert (=> b!992385 m!920119))

(declare-fun m!920121 () Bool)

(assert (=> b!992385 m!920121))

(declare-fun m!920123 () Bool)

(assert (=> b!992384 m!920123))

(declare-fun m!920125 () Bool)

(assert (=> b!992384 m!920125))

(declare-fun m!920127 () Bool)

(assert (=> b!992384 m!920127))

(declare-fun m!920129 () Bool)

(assert (=> start!85026 m!920129))

(push 1)

(assert (not b!992386))

(assert (not b!992384))

(assert (not b!992385))

(assert (not b!992383))

(assert (not start!85026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118119 () Bool)

(declare-fun lt!440181 () Bool)

(assert (=> d!118119 (= lt!440181 (member head!726 (content!441 (_2!7489 lt!440171))))))

(declare-fun e!559845 () Bool)

(assert (=> d!118119 (= lt!440181 e!559845)))

(declare-fun res!663318 () Bool)

(assert (=> d!118119 (=> (not res!663318) (not e!559845))))

(assert (=> d!118119 (= res!663318 (is-Cons!20882 (_2!7489 lt!440171)))))

(assert (=> d!118119 (= (contains!5747 (_2!7489 lt!440171) head!726) lt!440181)))

(declare-fun b!992401 () Bool)

(declare-fun e!559846 () Bool)

(assert (=> b!992401 (= e!559845 e!559846)))

(declare-fun res!663319 () Bool)

(assert (=> b!992401 (=> res!663319 e!559846)))

(assert (=> b!992401 (= res!663319 (= (h!22044 (_2!7489 lt!440171)) head!726))))

(declare-fun b!992402 () Bool)

(assert (=> b!992402 (= e!559846 (contains!5747 (t!29875 (_2!7489 lt!440171)) head!726))))

(assert (= (and d!118119 res!663318) b!992401))

(assert (= (and b!992401 (not res!663319)) b!992402))

(declare-fun m!920137 () Bool)

(assert (=> d!118119 m!920137))

(declare-fun m!920139 () Bool)

(assert (=> d!118119 m!920139))

(declare-fun m!920141 () Bool)

(assert (=> b!992402 m!920141))

(assert (=> b!992385 d!118119))

(declare-fun d!118125 () Bool)

(assert (=> d!118125 (= (get!15695 lt!440172) (v!14336 lt!440172))))

(assert (=> b!992385 d!118125))

(declare-fun d!118129 () Bool)

(declare-fun c!100681 () Bool)

(assert (=> d!118129 (= c!100681 (is-Nil!20883 tail!21))))

(declare-fun e!559853 () (Set (_ BitVec 64)))

(assert (=> d!118129 (= (content!441 tail!21) e!559853)))

(declare-fun b!992411 () Bool)

(assert (=> b!992411 (= e!559853 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!992412 () Bool)

(assert (=> b!992412 (= e!559853 (union (insert (h!22044 tail!21) (as emptyset (Set (_ BitVec 64)))) (content!441 (t!29875 tail!21))))))

(assert (= (and d!118129 c!100681) b!992411))

(assert (= (and d!118129 (not c!100681)) b!992412))

(declare-fun m!920151 () Bool)

(assert (=> b!992412 m!920151))

(declare-fun m!920153 () Bool)

(assert (=> b!992412 m!920153))

(assert (=> b!992383 d!118129))

(declare-fun d!118141 () Bool)

(declare-fun lt!440184 () Bool)

(assert (=> d!118141 (= lt!440184 (member head!726 (content!441 tail!21)))))

(declare-fun e!559854 () Bool)

(assert (=> d!118141 (= lt!440184 e!559854)))

(declare-fun res!663324 () Bool)

(assert (=> d!118141 (=> (not res!663324) (not e!559854))))

(assert (=> d!118141 (= res!663324 (is-Cons!20882 tail!21))))

(assert (=> d!118141 (= (contains!5747 tail!21 head!726) lt!440184)))

(declare-fun b!992413 () Bool)

(declare-fun e!559855 () Bool)

(assert (=> b!992413 (= e!559854 e!559855)))

(declare-fun res!663325 () Bool)

(assert (=> b!992413 (=> res!663325 e!559855)))

(assert (=> b!992413 (= res!663325 (= (h!22044 tail!21) head!726))))

(declare-fun b!992414 () Bool)

(assert (=> b!992414 (= e!559855 (contains!5747 (t!29875 tail!21) head!726))))

(assert (= (and d!118141 res!663324) b!992413))

(assert (= (and b!992413 (not res!663325)) b!992414))

(assert (=> d!118141 m!920109))

(assert (=> d!118141 m!920111))

(declare-fun m!920155 () Bool)

(assert (=> b!992414 m!920155))

(assert (=> start!85026 d!118141))

(declare-fun d!118145 () Bool)

(assert (=> d!118145 (= (isEmpty!740 lt!440172) (not (is-Some!532 lt!440172)))))

(assert (=> b!992384 d!118145))

(declare-fun d!118147 () Bool)

(assert (=> d!118147 (= (unapply!12 lt!440170) (ite (is-Nil!20883 lt!440170) None!531 (Some!532 (tuple2!14957 (h!22044 lt!440170) (t!29875 lt!440170)))))))

(assert (=> b!992384 d!118147))

(declare-fun d!118149 () Bool)

(assert (=> d!118149 (= ($colon$colon!569 tail!21 head!726) (Cons!20882 head!726 tail!21))))

(assert (=> b!992384 d!118149))

(declare-fun d!118153 () Bool)

(declare-fun e!559894 () Bool)

(assert (=> d!118153 e!559894))

(declare-fun res!663337 () Bool)

(assert (=> d!118153 (=> (not res!663337) (not e!559894))))

(declare-fun lt!440198 () List!20886)

(declare-fun size!30686 (List!20886) Int)

(assert (=> d!118153 (= res!663337 (<= (size!30686 lt!440198) (size!30686 lt!440170)))))

(declare-fun e!559892 () List!20886)

(assert (=> d!118153 (= lt!440198 e!559892)))

(declare-fun c!100703 () Bool)

(assert (=> d!118153 (= c!100703 (is-Cons!20882 lt!440170))))

(assert (=> d!118153 (= (-!443 lt!440170 head!726) lt!440198)))

(declare-fun b!992468 () Bool)

(assert (=> b!992468 (= e!559894 (= (content!441 lt!440198) (setminus (content!441 lt!440170) (insert head!726 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!992469 () Bool)

(declare-fun e!559893 () List!20886)

(declare-fun call!42101 () List!20886)

(assert (=> b!992469 (= e!559893 call!42101)))

(declare-fun b!992470 () Bool)

(assert (=> b!992470 (= e!559892 e!559893)))

(declare-fun c!100704 () Bool)

(assert (=> b!992470 (= c!100704 (= head!726 (h!22044 lt!440170)))))

(declare-fun b!992471 () Bool)

(assert (=> b!992471 (= e!559893 (Cons!20882 (h!22044 lt!440170) call!42101))))

(declare-fun bm!42098 () Bool)

(assert (=> bm!42098 (= call!42101 (-!443 (t!29875 lt!440170) head!726))))

(declare-fun b!992472 () Bool)

(assert (=> b!992472 (= e!559892 Nil!20883)))

(assert (= (and d!118153 c!100703) b!992470))

(assert (= (and d!118153 (not c!100703)) b!992472))

(assert (= (and b!992470 c!100704) b!992469))

(assert (= (and b!992470 (not c!100704)) b!992471))

(assert (= (or b!992469 b!992471) bm!42098))

(assert (= (and d!118153 res!663337) b!992468))

(declare-fun m!920197 () Bool)

(assert (=> d!118153 m!920197))

(declare-fun m!920199 () Bool)

(assert (=> d!118153 m!920199))

(declare-fun m!920201 () Bool)

(assert (=> b!992468 m!920201))

(declare-fun m!920203 () Bool)

(assert (=> b!992468 m!920203))

(declare-fun m!920205 () Bool)

(assert (=> b!992468 m!920205))

(declare-fun m!920207 () Bool)

(assert (=> bm!42098 m!920207))

(assert (=> b!992386 d!118153))

(declare-fun d!118165 () Bool)

(declare-fun e!559900 () Bool)

(assert (=> d!118165 e!559900))

(declare-fun res!663339 () Bool)

(assert (=> d!118165 (=> (not res!663339) (not e!559900))))

(declare-fun lt!440200 () List!20886)

(assert (=> d!118165 (= res!663339 (<= (size!30686 lt!440200) (size!30686 (_2!7489 lt!440171))))))

(declare-fun e!559898 () List!20886)

(assert (=> d!118165 (= lt!440200 e!559898)))

(declare-fun c!100707 () Bool)

(assert (=> d!118165 (= c!100707 (is-Cons!20882 (_2!7489 lt!440171)))))

(assert (=> d!118165 (= (-!443 (_2!7489 lt!440171) head!726) lt!440200)))

(declare-fun b!992478 () Bool)

(assert (=> b!992478 (= e!559900 (= (content!441 lt!440200) (setminus (content!441 (_2!7489 lt!440171)) (insert head!726 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!992479 () Bool)

(declare-fun e!559899 () List!20886)

(declare-fun call!42103 () List!20886)

(assert (=> b!992479 (= e!559899 call!42103)))

