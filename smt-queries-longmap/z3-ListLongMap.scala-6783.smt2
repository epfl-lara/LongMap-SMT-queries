; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85394 () Bool)

(assert start!85394)

(declare-fun res!663734 () Bool)

(declare-fun e!560327 () Bool)

(assert (=> start!85394 (=> (not res!663734) (not e!560327))))

(declare-datatypes ((List!20955 0))(
  ( (Nil!20952) (Cons!20951 (h!22113 (_ BitVec 64)) (t!29947 List!20955)) )
))
(declare-fun l!3519 () List!20955)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5754 (List!20955 (_ BitVec 64)) Bool)

(assert (=> start!85394 (= res!663734 (not (contains!5754 l!3519 e!29)))))

(assert (=> start!85394 e!560327))

(assert (=> start!85394 true))

(declare-fun b!993006 () Bool)

(declare-fun res!663735 () Bool)

(assert (=> b!993006 (=> (not res!663735) (not e!560327))))

(declare-datatypes ((tuple2!15098 0))(
  ( (tuple2!15099 (_1!7560 (_ BitVec 64)) (_2!7560 List!20955)) )
))
(declare-datatypes ((Option!567 0))(
  ( (Some!566 (v!14399 tuple2!15098)) (None!565) )
))
(declare-fun isEmpty!776 (Option!567) Bool)

(declare-fun unapply!43 (List!20955) Option!567)

(assert (=> b!993006 (= res!663735 (isEmpty!776 (unapply!43 l!3519)))))

(declare-fun b!993007 () Bool)

(declare-fun res!663736 () Bool)

(assert (=> b!993007 (=> (not res!663736) (not e!560327))))

(get-info :version)

(assert (=> b!993007 (= res!663736 (not ((_ is Nil!20952) l!3519)))))

(declare-fun b!993008 () Bool)

(declare-fun -!456 (List!20955 (_ BitVec 64)) List!20955)

(assert (=> b!993008 (= e!560327 (not (= (-!456 l!3519 e!29) l!3519)))))

(assert (= (and start!85394 res!663734) b!993006))

(assert (= (and b!993006 res!663735) b!993007))

(assert (= (and b!993007 res!663736) b!993008))

(declare-fun m!920237 () Bool)

(assert (=> start!85394 m!920237))

(declare-fun m!920239 () Bool)

(assert (=> b!993006 m!920239))

(assert (=> b!993006 m!920239))

(declare-fun m!920241 () Bool)

(assert (=> b!993006 m!920241))

(declare-fun m!920243 () Bool)

(assert (=> b!993008 m!920243))

(check-sat (not start!85394) (not b!993008) (not b!993006))
(check-sat)
(get-model)

(declare-fun d!118303 () Bool)

(declare-fun lt!440253 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!470 (List!20955) (InoxSet (_ BitVec 64)))

(assert (=> d!118303 (= lt!440253 (select (content!470 l!3519) e!29))))

(declare-fun e!560347 () Bool)

(assert (=> d!118303 (= lt!440253 e!560347)))

(declare-fun res!663768 () Bool)

(assert (=> d!118303 (=> (not res!663768) (not e!560347))))

(assert (=> d!118303 (= res!663768 ((_ is Cons!20951) l!3519))))

(assert (=> d!118303 (= (contains!5754 l!3519 e!29) lt!440253)))

(declare-fun b!993038 () Bool)

(declare-fun e!560346 () Bool)

(assert (=> b!993038 (= e!560347 e!560346)))

(declare-fun res!663767 () Bool)

(assert (=> b!993038 (=> res!663767 e!560346)))

(assert (=> b!993038 (= res!663767 (= (h!22113 l!3519) e!29))))

(declare-fun b!993039 () Bool)

(assert (=> b!993039 (= e!560346 (contains!5754 (t!29947 l!3519) e!29))))

(assert (= (and d!118303 res!663768) b!993038))

(assert (= (and b!993038 (not res!663767)) b!993039))

(declare-fun m!920261 () Bool)

(assert (=> d!118303 m!920261))

(declare-fun m!920263 () Bool)

(assert (=> d!118303 m!920263))

(declare-fun m!920265 () Bool)

(assert (=> b!993039 m!920265))

(assert (=> start!85394 d!118303))

(declare-fun b!993075 () Bool)

(declare-fun e!560373 () List!20955)

(declare-fun e!560375 () List!20955)

(assert (=> b!993075 (= e!560373 e!560375)))

(declare-fun c!100786 () Bool)

(assert (=> b!993075 (= c!100786 (= e!29 (h!22113 l!3519)))))

(declare-fun e!560374 () Bool)

(declare-fun lt!440262 () List!20955)

(declare-fun b!993077 () Bool)

(assert (=> b!993077 (= e!560374 (= (content!470 lt!440262) ((_ map and) (content!470 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun bm!42120 () Bool)

(declare-fun call!42123 () List!20955)

(assert (=> bm!42120 (= call!42123 (-!456 (t!29947 l!3519) e!29))))

(declare-fun b!993078 () Bool)

(assert (=> b!993078 (= e!560373 Nil!20952)))

(declare-fun b!993079 () Bool)

(assert (=> b!993079 (= e!560375 call!42123)))

(declare-fun b!993076 () Bool)

(assert (=> b!993076 (= e!560375 (Cons!20951 (h!22113 l!3519) call!42123))))

(declare-fun d!118309 () Bool)

(assert (=> d!118309 e!560374))

(declare-fun res!663779 () Bool)

(assert (=> d!118309 (=> (not res!663779) (not e!560374))))

(declare-fun size!30669 (List!20955) Int)

(assert (=> d!118309 (= res!663779 (<= (size!30669 lt!440262) (size!30669 l!3519)))))

(assert (=> d!118309 (= lt!440262 e!560373)))

(declare-fun c!100785 () Bool)

(assert (=> d!118309 (= c!100785 ((_ is Cons!20951) l!3519))))

(assert (=> d!118309 (= (-!456 l!3519 e!29) lt!440262)))

(assert (= (and d!118309 c!100785) b!993075))

(assert (= (and d!118309 (not c!100785)) b!993078))

(assert (= (and b!993075 c!100786) b!993079))

(assert (= (and b!993075 (not c!100786)) b!993076))

(assert (= (or b!993079 b!993076) bm!42120))

(assert (= (and d!118309 res!663779) b!993077))

(declare-fun m!920279 () Bool)

(assert (=> b!993077 m!920279))

(assert (=> b!993077 m!920261))

(declare-fun m!920281 () Bool)

(assert (=> b!993077 m!920281))

(declare-fun m!920283 () Bool)

(assert (=> bm!42120 m!920283))

(declare-fun m!920285 () Bool)

(assert (=> d!118309 m!920285))

(declare-fun m!920287 () Bool)

(assert (=> d!118309 m!920287))

(assert (=> b!993008 d!118309))

(declare-fun d!118315 () Bool)

(assert (=> d!118315 (= (isEmpty!776 (unapply!43 l!3519)) (not ((_ is Some!566) (unapply!43 l!3519))))))

(assert (=> b!993006 d!118315))

(declare-fun d!118317 () Bool)

(assert (=> d!118317 (= (unapply!43 l!3519) (ite ((_ is Nil!20952) l!3519) None!565 (Some!566 (tuple2!15099 (h!22113 l!3519) (t!29947 l!3519)))))))

(assert (=> b!993006 d!118317))

(check-sat (not d!118309) (not bm!42120) (not d!118303) (not b!993039) (not b!993077))
(check-sat)
