; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85080 () Bool)

(assert start!85080)

(declare-fun b!992523 () Bool)

(declare-fun res!663373 () Bool)

(declare-fun e!559923 () Bool)

(assert (=> b!992523 (=> (not res!663373) (not e!559923))))

(declare-datatypes ((List!20889 0))(
  ( (Nil!20886) (Cons!20885 (h!22047 (_ BitVec 64)) (t!29881 List!20889)) )
))
(declare-fun lt!440215 () List!20889)

(assert (=> b!992523 (= res!663373 (is-Nil!20886 lt!440215))))

(declare-fun b!992522 () Bool)

(declare-fun e!559922 () Bool)

(assert (=> b!992522 (= e!559922 e!559923)))

(declare-fun res!663372 () Bool)

(assert (=> b!992522 (=> (not res!663372) (not e!559923))))

(declare-datatypes ((tuple2!14962 0))(
  ( (tuple2!14963 (_1!7492 (_ BitVec 64)) (_2!7492 List!20889)) )
))
(declare-datatypes ((Option!536 0))(
  ( (Some!535 (v!14342 tuple2!14962)) (None!534) )
))
(declare-fun isEmpty!743 (Option!536) Bool)

(declare-fun unapply!15 (List!20889) Option!536)

(assert (=> b!992522 (= res!663372 (isEmpty!743 (unapply!15 lt!440215)))))

(declare-fun tail!21 () List!20889)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun $colon$colon!572 (List!20889 (_ BitVec 64)) List!20889)

(assert (=> b!992522 (= lt!440215 ($colon$colon!572 tail!21 head!726))))

(declare-fun b!992521 () Bool)

(declare-fun res!663375 () Bool)

(assert (=> b!992521 (=> (not res!663375) (not e!559922))))

(declare-fun content!444 (List!20889) (Set (_ BitVec 64)))

(assert (=> b!992521 (= res!663375 (not (member head!726 (content!444 tail!21))))))

(declare-fun b!992524 () Bool)

(declare-fun -!446 (List!20889 (_ BitVec 64)) List!20889)

(assert (=> b!992524 (= e!559923 (not (= (-!446 lt!440215 head!726) tail!21)))))

(declare-fun res!663374 () Bool)

(assert (=> start!85080 (=> (not res!663374) (not e!559922))))

(declare-fun contains!5750 (List!20889 (_ BitVec 64)) Bool)

(assert (=> start!85080 (= res!663374 (not (contains!5750 tail!21 head!726)))))

(assert (=> start!85080 e!559922))

(assert (=> start!85080 true))

(assert (= (and start!85080 res!663374) b!992521))

(assert (= (and b!992521 res!663375) b!992522))

(assert (= (and b!992522 res!663372) b!992523))

(assert (= (and b!992523 res!663373) b!992524))

(declare-fun m!920261 () Bool)

(assert (=> b!992522 m!920261))

(assert (=> b!992522 m!920261))

(declare-fun m!920263 () Bool)

(assert (=> b!992522 m!920263))

(declare-fun m!920265 () Bool)

(assert (=> b!992522 m!920265))

(declare-fun m!920267 () Bool)

(assert (=> b!992521 m!920267))

(declare-fun m!920269 () Bool)

(assert (=> b!992521 m!920269))

(declare-fun m!920271 () Bool)

(assert (=> b!992524 m!920271))

(declare-fun m!920273 () Bool)

(assert (=> start!85080 m!920273))

(push 1)

(assert (not b!992521))

(assert (not start!85080))

(assert (not b!992522))

(assert (not b!992524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118183 () Bool)

(declare-fun c!100714 () Bool)

(assert (=> d!118183 (= c!100714 (is-Nil!20886 tail!21))))

(declare-fun e!559930 () (Set (_ BitVec 64)))

(assert (=> d!118183 (= (content!444 tail!21) e!559930)))

(declare-fun b!992533 () Bool)

(assert (=> b!992533 (= e!559930 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!992534 () Bool)

(assert (=> b!992534 (= e!559930 (union (insert (h!22047 tail!21) (as emptyset (Set (_ BitVec 64)))) (content!444 (t!29881 tail!21))))))

(assert (= (and d!118183 c!100714) b!992533))

(assert (= (and d!118183 (not c!100714)) b!992534))

(declare-fun m!920275 () Bool)

(assert (=> b!992534 m!920275))

(declare-fun m!920277 () Bool)

(assert (=> b!992534 m!920277))

(assert (=> b!992521 d!118183))

(declare-fun d!118185 () Bool)

(declare-fun lt!440223 () Bool)

(assert (=> d!118185 (= lt!440223 (member head!726 (content!444 tail!21)))))

(declare-fun e!559945 () Bool)

(assert (=> d!118185 (= lt!440223 e!559945)))

(declare-fun res!663388 () Bool)

(assert (=> d!118185 (=> (not res!663388) (not e!559945))))

(assert (=> d!118185 (= res!663388 (is-Cons!20885 tail!21))))

(assert (=> d!118185 (= (contains!5750 tail!21 head!726) lt!440223)))

(declare-fun b!992551 () Bool)

(declare-fun e!559944 () Bool)

(assert (=> b!992551 (= e!559945 e!559944)))

(declare-fun res!663389 () Bool)

(assert (=> b!992551 (=> res!663389 e!559944)))

(assert (=> b!992551 (= res!663389 (= (h!22047 tail!21) head!726))))

(declare-fun b!992552 () Bool)

(assert (=> b!992552 (= e!559944 (contains!5750 (t!29881 tail!21) head!726))))

(assert (= (and d!118185 res!663388) b!992551))

(assert (= (and b!992551 (not res!663389)) b!992552))

(assert (=> d!118185 m!920267))

(assert (=> d!118185 m!920269))

(declare-fun m!920281 () Bool)

(assert (=> b!992552 m!920281))

(assert (=> start!85080 d!118185))

(declare-fun d!118195 () Bool)

(assert (=> d!118195 (= (isEmpty!743 (unapply!15 lt!440215)) (not (is-Some!535 (unapply!15 lt!440215))))))

(assert (=> b!992522 d!118195))

(declare-fun d!118197 () Bool)

(assert (=> d!118197 (= (unapply!15 lt!440215) (ite (is-Nil!20886 lt!440215) None!534 (Some!535 (tuple2!14963 (h!22047 lt!440215) (t!29881 lt!440215)))))))

(assert (=> b!992522 d!118197))

(declare-fun d!118201 () Bool)

(assert (=> d!118201 (= ($colon$colon!572 tail!21 head!726) (Cons!20885 head!726 tail!21))))

(assert (=> b!992522 d!118201))

(declare-fun b!992599 () Bool)

(declare-fun e!559979 () List!20889)

(assert (=> b!992599 (= e!559979 Nil!20886)))

(declare-fun b!992600 () Bool)

(declare-fun e!559978 () List!20889)

(assert (=> b!992600 (= e!559979 e!559978)))

(declare-fun c!100736 () Bool)

(assert (=> b!992600 (= c!100736 (= head!726 (h!22047 lt!440215)))))

(declare-fun b!992601 () Bool)

(declare-fun call!42112 () List!20889)

(assert (=> b!992601 (= e!559978 call!42112)))

(declare-fun bm!42109 () Bool)

(assert (=> bm!42109 (= call!42112 (-!446 (t!29881 lt!440215) head!726))))

(declare-fun b!992602 () Bool)

(assert (=> b!992602 (= e!559978 (Cons!20885 (h!22047 lt!440215) call!42112))))

(declare-fun b!992603 () Bool)

(declare-fun lt!440233 () List!20889)

(declare-fun e!559977 () Bool)

(assert (=> b!992603 (= e!559977 (= (content!444 lt!440233) (setminus (content!444 lt!440215) (insert head!726 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun d!118203 () Bool)

(assert (=> d!118203 e!559977))

(declare-fun res!663402 () Bool)

(assert (=> d!118203 (=> (not res!663402) (not e!559977))))

(declare-fun size!30689 (List!20889) Int)

(assert (=> d!118203 (= res!663402 (<= (size!30689 lt!440233) (size!30689 lt!440215)))))

(assert (=> d!118203 (= lt!440233 e!559979)))

(declare-fun c!100737 () Bool)

(assert (=> d!118203 (= c!100737 (is-Cons!20885 lt!440215))))

(assert (=> d!118203 (= (-!446 lt!440215 head!726) lt!440233)))

(assert (= (and d!118203 c!100737) b!992600))

(assert (= (and d!118203 (not c!100737)) b!992599))

