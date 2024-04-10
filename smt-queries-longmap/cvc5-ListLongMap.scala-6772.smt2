; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85076 () Bool)

(assert start!85076)

(declare-datatypes ((List!20887 0))(
  ( (Nil!20884) (Cons!20883 (h!22045 (_ BitVec 64)) (t!29879 List!20887)) )
))
(declare-fun tail!21 () List!20887)

(declare-fun lt!440209 () List!20887)

(declare-fun e!559910 () Bool)

(declare-fun b!992500 () Bool)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun -!444 (List!20887 (_ BitVec 64)) List!20887)

(assert (=> b!992500 (= e!559910 (not (= (-!444 lt!440209 head!726) tail!21)))))

(declare-fun b!992498 () Bool)

(declare-fun e!559911 () Bool)

(assert (=> b!992498 (= e!559911 e!559910)))

(declare-fun res!663351 () Bool)

(assert (=> b!992498 (=> (not res!663351) (not e!559910))))

(declare-datatypes ((tuple2!14958 0))(
  ( (tuple2!14959 (_1!7490 (_ BitVec 64)) (_2!7490 List!20887)) )
))
(declare-datatypes ((Option!534 0))(
  ( (Some!533 (v!14340 tuple2!14958)) (None!532) )
))
(declare-fun isEmpty!741 (Option!534) Bool)

(declare-fun unapply!13 (List!20887) Option!534)

(assert (=> b!992498 (= res!663351 (isEmpty!741 (unapply!13 lt!440209)))))

(declare-fun $colon$colon!570 (List!20887 (_ BitVec 64)) List!20887)

(assert (=> b!992498 (= lt!440209 ($colon$colon!570 tail!21 head!726))))

(declare-fun b!992499 () Bool)

(declare-fun res!663349 () Bool)

(assert (=> b!992499 (=> (not res!663349) (not e!559910))))

(assert (=> b!992499 (= res!663349 (is-Nil!20884 lt!440209))))

(declare-fun res!663350 () Bool)

(assert (=> start!85076 (=> (not res!663350) (not e!559911))))

(declare-fun contains!5748 (List!20887 (_ BitVec 64)) Bool)

(assert (=> start!85076 (= res!663350 (not (contains!5748 tail!21 head!726)))))

(assert (=> start!85076 e!559911))

(assert (=> start!85076 true))

(declare-fun b!992497 () Bool)

(declare-fun res!663348 () Bool)

(assert (=> b!992497 (=> (not res!663348) (not e!559911))))

(declare-fun content!442 (List!20887) (Set (_ BitVec 64)))

(assert (=> b!992497 (= res!663348 (not (set.member head!726 (content!442 tail!21))))))

(assert (= (and start!85076 res!663350) b!992497))

(assert (= (and b!992497 res!663348) b!992498))

(assert (= (and b!992498 res!663351) b!992499))

(assert (= (and b!992499 res!663349) b!992500))

(declare-fun m!920233 () Bool)

(assert (=> b!992500 m!920233))

(declare-fun m!920235 () Bool)

(assert (=> b!992498 m!920235))

(assert (=> b!992498 m!920235))

(declare-fun m!920237 () Bool)

(assert (=> b!992498 m!920237))

(declare-fun m!920239 () Bool)

(assert (=> b!992498 m!920239))

(declare-fun m!920241 () Bool)

(assert (=> start!85076 m!920241))

(declare-fun m!920243 () Bool)

(assert (=> b!992497 m!920243))

(declare-fun m!920245 () Bool)

(assert (=> b!992497 m!920245))

(push 1)

(assert (not start!85076))

(assert (not b!992498))

(assert (not b!992500))

(assert (not b!992497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118181 () Bool)

(declare-fun lt!440220 () Bool)

(assert (=> d!118181 (= lt!440220 (set.member head!726 (content!442 tail!21)))))

(declare-fun e!559935 () Bool)

(assert (=> d!118181 (= lt!440220 e!559935)))

(declare-fun res!663381 () Bool)

(assert (=> d!118181 (=> (not res!663381) (not e!559935))))

(assert (=> d!118181 (= res!663381 (is-Cons!20883 tail!21))))

(assert (=> d!118181 (= (contains!5748 tail!21 head!726) lt!440220)))

(declare-fun b!992541 () Bool)

(declare-fun e!559934 () Bool)

(assert (=> b!992541 (= e!559935 e!559934)))

(declare-fun res!663380 () Bool)

(assert (=> b!992541 (=> res!663380 e!559934)))

(assert (=> b!992541 (= res!663380 (= (h!22045 tail!21) head!726))))

(declare-fun b!992543 () Bool)

(assert (=> b!992543 (= e!559934 (contains!5748 (t!29879 tail!21) head!726))))

(assert (= (and d!118181 res!663381) b!992541))

(assert (= (and b!992541 (not res!663380)) b!992543))

(assert (=> d!118181 m!920243))

(assert (=> d!118181 m!920245))

(declare-fun m!920279 () Bool)

(assert (=> b!992543 m!920279))

(assert (=> start!85076 d!118181))

(declare-fun d!118187 () Bool)

(assert (=> d!118187 (= (isEmpty!741 (unapply!13 lt!440209)) (not (is-Some!533 (unapply!13 lt!440209))))))

(assert (=> b!992498 d!118187))

(declare-fun d!118189 () Bool)

(assert (=> d!118189 (= (unapply!13 lt!440209) (ite (is-Nil!20884 lt!440209) None!532 (Some!533 (tuple2!14959 (h!22045 lt!440209) (t!29879 lt!440209)))))))

(assert (=> b!992498 d!118189))

(declare-fun d!118191 () Bool)

(assert (=> d!118191 (= ($colon$colon!570 tail!21 head!726) (Cons!20883 head!726 tail!21))))

(assert (=> b!992498 d!118191))

(declare-fun b!992588 () Bool)

(declare-fun e!559972 () List!20887)

(declare-fun e!559971 () List!20887)

(assert (=> b!992588 (= e!559972 e!559971)))

(declare-fun c!100733 () Bool)

(assert (=> b!992588 (= c!100733 (= head!726 (h!22045 lt!440209)))))

(declare-fun bm!42108 () Bool)

(declare-fun call!42111 () List!20887)

(assert (=> bm!42108 (= call!42111 (-!444 (t!29879 lt!440209) head!726))))

(declare-fun b!992589 () Bool)

(assert (=> b!992589 (= e!559971 (Cons!20883 (h!22045 lt!440209) call!42111))))

(declare-fun b!992590 () Bool)

(assert (=> b!992590 (= e!559971 call!42111)))

(declare-fun b!992591 () Bool)

(assert (=> b!992591 (= e!559972 Nil!20884)))

(declare-fun d!118193 () Bool)

(declare-fun e!559970 () Bool)

(assert (=> d!118193 e!559970))

(declare-fun res!663399 () Bool)

(assert (=> d!118193 (=> (not res!663399) (not e!559970))))

(declare-fun lt!440232 () List!20887)

(declare-fun size!30688 (List!20887) Int)

(assert (=> d!118193 (= res!663399 (<= (size!30688 lt!440232) (size!30688 lt!440209)))))

(assert (=> d!118193 (= lt!440232 e!559972)))

(declare-fun c!100732 () Bool)

(assert (=> d!118193 (= c!100732 (is-Cons!20883 lt!440209))))

(assert (=> d!118193 (= (-!444 lt!440209 head!726) lt!440232)))

(declare-fun b!992592 () Bool)

(assert (=> b!992592 (= e!559970 (= (content!442 lt!440232) (set.minus (content!442 lt!440209) (set.insert head!726 (as set.empty (Set (_ BitVec 64)))))))))

(assert (= (and d!118193 c!100732) b!992588))

(assert (= (and d!118193 (not c!100732)) b!992591))

(assert (= (and b!992588 c!100733) b!992590))

(assert (= (and b!992588 (not c!100733)) b!992589))

(assert (= (or b!992590 b!992589) bm!42108))

(assert (= (and d!118193 res!663399) b!992592))

(declare-fun m!920301 () Bool)

(assert (=> bm!42108 m!920301))

(declare-fun m!920303 () Bool)

(assert (=> d!118193 m!920303))

(declare-fun m!920305 () Bool)

(assert (=> d!118193 m!920305))

(declare-fun m!920307 () Bool)

(assert (=> b!992592 m!920307))

(declare-fun m!920309 () Bool)

(assert (=> b!992592 m!920309))

(declare-fun m!920311 () Bool)

(assert (=> b!992592 m!920311))

(assert (=> b!992500 d!118193))

(declare-fun d!118209 () Bool)

(declare-fun c!100738 () Bool)

(assert (=> d!118209 (= c!100738 (is-Nil!20884 tail!21))))

(declare-fun e!559980 () (Set (_ BitVec 64)))

(assert (=> d!118209 (= (content!442 tail!21) e!559980)))

(declare-fun b!992604 () Bool)

(assert (=> b!992604 (= e!559980 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992605 () Bool)

(assert (=> b!992605 (= e!559980 (set.union (set.insert (h!22045 tail!21) (as set.empty (Set (_ BitVec 64)))) (content!442 (t!29879 tail!21))))))

(assert (= (and d!118209 c!100738) b!992604))

(assert (= (and d!118209 (not c!100738)) b!992605))

(declare-fun m!920317 () Bool)

(assert (=> b!992605 m!920317))

(declare-fun m!920323 () Bool)

(assert (=> b!992605 m!920323))

(assert (=> b!992497 d!118209))

(push 1)

