; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85078 () Bool)

(assert start!85078)

(declare-fun b!992511 () Bool)

(declare-fun res!663362 () Bool)

(declare-fun e!559916 () Bool)

(assert (=> b!992511 (=> (not res!663362) (not e!559916))))

(declare-datatypes ((List!20888 0))(
  ( (Nil!20885) (Cons!20884 (h!22046 (_ BitVec 64)) (t!29880 List!20888)) )
))
(declare-fun lt!440212 () List!20888)

(get-info :version)

(assert (=> b!992511 (= res!663362 ((_ is Nil!20885) lt!440212))))

(declare-fun res!663363 () Bool)

(declare-fun e!559917 () Bool)

(assert (=> start!85078 (=> (not res!663363) (not e!559917))))

(declare-fun tail!21 () List!20888)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5749 (List!20888 (_ BitVec 64)) Bool)

(assert (=> start!85078 (= res!663363 (not (contains!5749 tail!21 head!726)))))

(assert (=> start!85078 e!559917))

(assert (=> start!85078 true))

(declare-fun b!992509 () Bool)

(declare-fun res!663360 () Bool)

(assert (=> b!992509 (=> (not res!663360) (not e!559917))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!443 (List!20888) (InoxSet (_ BitVec 64)))

(assert (=> b!992509 (= res!663360 (not (select (content!443 tail!21) head!726)))))

(declare-fun b!992512 () Bool)

(declare-fun -!445 (List!20888 (_ BitVec 64)) List!20888)

(assert (=> b!992512 (= e!559916 (not (= (-!445 lt!440212 head!726) tail!21)))))

(declare-fun b!992510 () Bool)

(assert (=> b!992510 (= e!559917 e!559916)))

(declare-fun res!663361 () Bool)

(assert (=> b!992510 (=> (not res!663361) (not e!559916))))

(declare-datatypes ((tuple2!14960 0))(
  ( (tuple2!14961 (_1!7491 (_ BitVec 64)) (_2!7491 List!20888)) )
))
(declare-datatypes ((Option!535 0))(
  ( (Some!534 (v!14341 tuple2!14960)) (None!533) )
))
(declare-fun isEmpty!742 (Option!535) Bool)

(declare-fun unapply!14 (List!20888) Option!535)

(assert (=> b!992510 (= res!663361 (isEmpty!742 (unapply!14 lt!440212)))))

(declare-fun $colon$colon!571 (List!20888 (_ BitVec 64)) List!20888)

(assert (=> b!992510 (= lt!440212 ($colon$colon!571 tail!21 head!726))))

(assert (= (and start!85078 res!663363) b!992509))

(assert (= (and b!992509 res!663360) b!992510))

(assert (= (and b!992510 res!663361) b!992511))

(assert (= (and b!992511 res!663362) b!992512))

(declare-fun m!920247 () Bool)

(assert (=> start!85078 m!920247))

(declare-fun m!920249 () Bool)

(assert (=> b!992509 m!920249))

(declare-fun m!920251 () Bool)

(assert (=> b!992509 m!920251))

(declare-fun m!920253 () Bool)

(assert (=> b!992512 m!920253))

(declare-fun m!920255 () Bool)

(assert (=> b!992510 m!920255))

(assert (=> b!992510 m!920255))

(declare-fun m!920257 () Bool)

(assert (=> b!992510 m!920257))

(declare-fun m!920259 () Bool)

(assert (=> b!992510 m!920259))

(check-sat (not b!992512) (not b!992509) (not start!85078) (not b!992510))
(check-sat)
(get-model)

(declare-fun e!559948 () Bool)

(declare-fun b!992553 () Bool)

(declare-fun lt!440224 () List!20888)

(assert (=> b!992553 (= e!559948 (= (content!443 lt!440224) ((_ map and) (content!443 lt!440212) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(declare-fun b!992554 () Bool)

(declare-fun e!559946 () List!20888)

(assert (=> b!992554 (= e!559946 Nil!20885)))

(declare-fun b!992555 () Bool)

(declare-fun e!559947 () List!20888)

(assert (=> b!992555 (= e!559946 e!559947)))

(declare-fun c!100720 () Bool)

(assert (=> b!992555 (= c!100720 (= head!726 (h!22046 lt!440212)))))

(declare-fun b!992556 () Bool)

(declare-fun call!42106 () List!20888)

(assert (=> b!992556 (= e!559947 call!42106)))

(declare-fun bm!42103 () Bool)

(assert (=> bm!42103 (= call!42106 (-!445 (t!29880 lt!440212) head!726))))

(declare-fun b!992557 () Bool)

(assert (=> b!992557 (= e!559947 (Cons!20884 (h!22046 lt!440212) call!42106))))

(declare-fun d!118179 () Bool)

(assert (=> d!118179 e!559948))

(declare-fun res!663390 () Bool)

(assert (=> d!118179 (=> (not res!663390) (not e!559948))))

(declare-fun size!30687 (List!20888) Int)

(assert (=> d!118179 (= res!663390 (<= (size!30687 lt!440224) (size!30687 lt!440212)))))

(assert (=> d!118179 (= lt!440224 e!559946)))

(declare-fun c!100719 () Bool)

(assert (=> d!118179 (= c!100719 ((_ is Cons!20884) lt!440212))))

(assert (=> d!118179 (= (-!445 lt!440212 head!726) lt!440224)))

(assert (= (and d!118179 c!100719) b!992555))

(assert (= (and d!118179 (not c!100719)) b!992554))

(assert (= (and b!992555 c!100720) b!992556))

(assert (= (and b!992555 (not c!100720)) b!992557))

(assert (= (or b!992556 b!992557) bm!42103))

(assert (= (and d!118179 res!663390) b!992553))

(declare-fun m!920283 () Bool)

(assert (=> b!992553 m!920283))

(declare-fun m!920285 () Bool)

(assert (=> b!992553 m!920285))

(declare-fun m!920287 () Bool)

(assert (=> b!992553 m!920287))

(declare-fun m!920289 () Bool)

(assert (=> bm!42103 m!920289))

(declare-fun m!920291 () Bool)

(assert (=> d!118179 m!920291))

(declare-fun m!920293 () Bool)

(assert (=> d!118179 m!920293))

(assert (=> b!992512 d!118179))

(declare-fun d!118199 () Bool)

(declare-fun c!100723 () Bool)

(assert (=> d!118199 (= c!100723 ((_ is Nil!20885) tail!21))))

(declare-fun e!559951 () (InoxSet (_ BitVec 64)))

(assert (=> d!118199 (= (content!443 tail!21) e!559951)))

(declare-fun b!992562 () Bool)

(assert (=> b!992562 (= e!559951 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992563 () Bool)

(assert (=> b!992563 (= e!559951 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22046 tail!21) true) (content!443 (t!29880 tail!21))))))

(assert (= (and d!118199 c!100723) b!992562))

(assert (= (and d!118199 (not c!100723)) b!992563))

(declare-fun m!920295 () Bool)

(assert (=> b!992563 m!920295))

(declare-fun m!920297 () Bool)

(assert (=> b!992563 m!920297))

(assert (=> b!992509 d!118199))

(declare-fun d!118205 () Bool)

(declare-fun lt!440231 () Bool)

(assert (=> d!118205 (= lt!440231 (select (content!443 tail!21) head!726))))

(declare-fun e!559968 () Bool)

(assert (=> d!118205 (= lt!440231 e!559968)))

(declare-fun res!663397 () Bool)

(assert (=> d!118205 (=> (not res!663397) (not e!559968))))

(assert (=> d!118205 (= res!663397 ((_ is Cons!20884) tail!21))))

(assert (=> d!118205 (= (contains!5749 tail!21 head!726) lt!440231)))

(declare-fun b!992586 () Bool)

(declare-fun e!559969 () Bool)

(assert (=> b!992586 (= e!559968 e!559969)))

(declare-fun res!663398 () Bool)

(assert (=> b!992586 (=> res!663398 e!559969)))

(assert (=> b!992586 (= res!663398 (= (h!22046 tail!21) head!726))))

(declare-fun b!992587 () Bool)

(assert (=> b!992587 (= e!559969 (contains!5749 (t!29880 tail!21) head!726))))

(assert (= (and d!118205 res!663397) b!992586))

(assert (= (and b!992586 (not res!663398)) b!992587))

(assert (=> d!118205 m!920249))

(assert (=> d!118205 m!920251))

(declare-fun m!920299 () Bool)

(assert (=> b!992587 m!920299))

(assert (=> start!85078 d!118205))

(declare-fun d!118207 () Bool)

(assert (=> d!118207 (= (isEmpty!742 (unapply!14 lt!440212)) (not ((_ is Some!534) (unapply!14 lt!440212))))))

(assert (=> b!992510 d!118207))

(declare-fun d!118211 () Bool)

(assert (=> d!118211 (= (unapply!14 lt!440212) (ite ((_ is Nil!20885) lt!440212) None!533 (Some!534 (tuple2!14961 (h!22046 lt!440212) (t!29880 lt!440212)))))))

(assert (=> b!992510 d!118211))

(declare-fun d!118213 () Bool)

(assert (=> d!118213 (= ($colon$colon!571 tail!21 head!726) (Cons!20884 head!726 tail!21))))

(assert (=> b!992510 d!118213))

(check-sat (not d!118179) (not d!118205) (not b!992553) (not b!992563) (not b!992587) (not bm!42103))
(check-sat)
