; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85414 () Bool)

(assert start!85414)

(declare-fun res!663853 () Bool)

(declare-fun e!560478 () Bool)

(assert (=> start!85414 (=> (not res!663853) (not e!560478))))

(declare-datatypes ((List!20921 0))(
  ( (Nil!20918) (Cons!20917 (h!22079 (_ BitVec 64)) (t!29922 List!20921)) )
))
(declare-fun l!3519 () List!20921)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5782 (List!20921 (_ BitVec 64)) Bool)

(assert (=> start!85414 (= res!663853 (not (contains!5782 l!3519 e!29)))))

(assert (=> start!85414 e!560478))

(assert (=> start!85414 true))

(declare-fun b!993254 () Bool)

(declare-fun res!663854 () Bool)

(assert (=> b!993254 (=> (not res!663854) (not e!560478))))

(declare-datatypes ((tuple2!15020 0))(
  ( (tuple2!15021 (_1!7521 (_ BitVec 64)) (_2!7521 List!20921)) )
))
(declare-datatypes ((Option!565 0))(
  ( (Some!564 (v!14401 tuple2!15020)) (None!563) )
))
(declare-fun isEmpty!772 (Option!565) Bool)

(declare-fun unapply!44 (List!20921) Option!565)

(assert (=> b!993254 (= res!663854 (isEmpty!772 (unapply!44 l!3519)))))

(declare-fun b!993255 () Bool)

(declare-fun res!663855 () Bool)

(assert (=> b!993255 (=> (not res!663855) (not e!560478))))

(get-info :version)

(assert (=> b!993255 (= res!663855 (not ((_ is Nil!20918) l!3519)))))

(declare-fun b!993256 () Bool)

(declare-fun -!457 (List!20921 (_ BitVec 64)) List!20921)

(assert (=> b!993256 (= e!560478 (not (= (-!457 l!3519 e!29) l!3519)))))

(assert (= (and start!85414 res!663853) b!993254))

(assert (= (and b!993254 res!663854) b!993255))

(assert (= (and b!993255 res!663855) b!993256))

(declare-fun m!921003 () Bool)

(assert (=> start!85414 m!921003))

(declare-fun m!921005 () Bool)

(assert (=> b!993254 m!921005))

(assert (=> b!993254 m!921005))

(declare-fun m!921007 () Bool)

(assert (=> b!993254 m!921007))

(declare-fun m!921009 () Bool)

(assert (=> b!993256 m!921009))

(check-sat (not b!993254) (not b!993256) (not start!85414))
(check-sat)
(get-model)

(declare-fun d!118501 () Bool)

(assert (=> d!118501 (= (isEmpty!772 (unapply!44 l!3519)) (not ((_ is Some!564) (unapply!44 l!3519))))))

(assert (=> b!993254 d!118501))

(declare-fun d!118503 () Bool)

(assert (=> d!118503 (= (unapply!44 l!3519) (ite ((_ is Nil!20918) l!3519) None!563 (Some!564 (tuple2!15021 (h!22079 l!3519) (t!29922 l!3519)))))))

(assert (=> b!993254 d!118503))

(declare-fun b!993292 () Bool)

(declare-fun lt!440490 () List!20921)

(declare-fun e!560502 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!472 (List!20921) (InoxSet (_ BitVec 64)))

(assert (=> b!993292 (= e!560502 (= (content!472 lt!440490) ((_ map and) (content!472 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!993293 () Bool)

(declare-fun e!560504 () List!20921)

(declare-fun call!42147 () List!20921)

(assert (=> b!993293 (= e!560504 call!42147)))

(declare-fun b!993294 () Bool)

(assert (=> b!993294 (= e!560504 (Cons!20917 (h!22079 l!3519) call!42147))))

(declare-fun b!993295 () Bool)

(declare-fun e!560503 () List!20921)

(assert (=> b!993295 (= e!560503 e!560504)))

(declare-fun c!100846 () Bool)

(assert (=> b!993295 (= c!100846 (= e!29 (h!22079 l!3519)))))

(declare-fun d!118509 () Bool)

(assert (=> d!118509 e!560502))

(declare-fun res!663875 () Bool)

(assert (=> d!118509 (=> (not res!663875) (not e!560502))))

(declare-fun size!30699 (List!20921) Int)

(assert (=> d!118509 (= res!663875 (<= (size!30699 lt!440490) (size!30699 l!3519)))))

(assert (=> d!118509 (= lt!440490 e!560503)))

(declare-fun c!100847 () Bool)

(assert (=> d!118509 (= c!100847 ((_ is Cons!20917) l!3519))))

(assert (=> d!118509 (= (-!457 l!3519 e!29) lt!440490)))

(declare-fun bm!42144 () Bool)

(assert (=> bm!42144 (= call!42147 (-!457 (t!29922 l!3519) e!29))))

(declare-fun b!993296 () Bool)

(assert (=> b!993296 (= e!560503 Nil!20918)))

(assert (= (and d!118509 c!100847) b!993295))

(assert (= (and d!118509 (not c!100847)) b!993296))

(assert (= (and b!993295 c!100846) b!993293))

(assert (= (and b!993295 (not c!100846)) b!993294))

(assert (= (or b!993293 b!993294) bm!42144))

(assert (= (and d!118509 res!663875) b!993292))

(declare-fun m!921025 () Bool)

(assert (=> b!993292 m!921025))

(declare-fun m!921027 () Bool)

(assert (=> b!993292 m!921027))

(declare-fun m!921029 () Bool)

(assert (=> b!993292 m!921029))

(declare-fun m!921031 () Bool)

(assert (=> d!118509 m!921031))

(declare-fun m!921033 () Bool)

(assert (=> d!118509 m!921033))

(declare-fun m!921035 () Bool)

(assert (=> bm!42144 m!921035))

(assert (=> b!993256 d!118509))

(declare-fun d!118521 () Bool)

(declare-fun lt!440496 () Bool)

(assert (=> d!118521 (= lt!440496 (select (content!472 l!3519) e!29))))

(declare-fun e!560519 () Bool)

(assert (=> d!118521 (= lt!440496 e!560519)))

(declare-fun res!663883 () Bool)

(assert (=> d!118521 (=> (not res!663883) (not e!560519))))

(assert (=> d!118521 (= res!663883 ((_ is Cons!20917) l!3519))))

(assert (=> d!118521 (= (contains!5782 l!3519 e!29) lt!440496)))

(declare-fun b!993316 () Bool)

(declare-fun e!560520 () Bool)

(assert (=> b!993316 (= e!560519 e!560520)))

(declare-fun res!663884 () Bool)

(assert (=> b!993316 (=> res!663884 e!560520)))

(assert (=> b!993316 (= res!663884 (= (h!22079 l!3519) e!29))))

(declare-fun b!993317 () Bool)

(assert (=> b!993317 (= e!560520 (contains!5782 (t!29922 l!3519) e!29))))

(assert (= (and d!118521 res!663883) b!993316))

(assert (= (and b!993316 (not res!663884)) b!993317))

(assert (=> d!118521 m!921027))

(declare-fun m!921049 () Bool)

(assert (=> d!118521 m!921049))

(declare-fun m!921051 () Bool)

(assert (=> b!993317 m!921051))

(assert (=> start!85414 d!118521))

(check-sat (not bm!42144) (not d!118521) (not b!993292) (not b!993317) (not d!118509))
(check-sat)
