; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85340 () Bool)

(assert start!85340)

(declare-fun res!663644 () Bool)

(declare-fun e!560243 () Bool)

(assert (=> start!85340 (=> (not res!663644) (not e!560243))))

(declare-datatypes ((List!20949 0))(
  ( (Nil!20946) (Cons!20945 (h!22107 (_ BitVec 64)) (t!29941 List!20949)) )
))
(declare-fun l!3519 () List!20949)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5748 (List!20949 (_ BitVec 64)) Bool)

(assert (=> start!85340 (= res!663644 (not (contains!5748 l!3519 e!29)))))

(assert (=> start!85340 e!560243))

(assert (=> start!85340 true))

(declare-fun b!992880 () Bool)

(declare-fun res!663645 () Bool)

(assert (=> b!992880 (=> (not res!663645) (not e!560243))))

(declare-datatypes ((tuple2!15086 0))(
  ( (tuple2!15087 (_1!7554 (_ BitVec 64)) (_2!7554 List!20949)) )
))
(declare-datatypes ((Option!561 0))(
  ( (Some!560 (v!14387 tuple2!15086)) (None!559) )
))
(declare-fun isEmpty!770 (Option!561) Bool)

(declare-fun unapply!37 (List!20949) Option!561)

(assert (=> b!992880 (= res!663645 (isEmpty!770 (unapply!37 l!3519)))))

(declare-fun b!992881 () Bool)

(declare-fun res!663646 () Bool)

(assert (=> b!992881 (=> (not res!663646) (not e!560243))))

(get-info :version)

(assert (=> b!992881 (= res!663646 ((_ is Nil!20946) l!3519))))

(declare-fun b!992882 () Bool)

(declare-fun -!453 (List!20949 (_ BitVec 64)) List!20949)

(assert (=> b!992882 (= e!560243 (not (= (-!453 l!3519 e!29) l!3519)))))

(assert (= (and start!85340 res!663644) b!992880))

(assert (= (and b!992880 res!663645) b!992881))

(assert (= (and b!992881 res!663646) b!992882))

(declare-fun m!920129 () Bool)

(assert (=> start!85340 m!920129))

(declare-fun m!920131 () Bool)

(assert (=> b!992880 m!920131))

(assert (=> b!992880 m!920131))

(declare-fun m!920133 () Bool)

(assert (=> b!992880 m!920133))

(declare-fun m!920135 () Bool)

(assert (=> b!992882 m!920135))

(check-sat (not b!992882) (not start!85340) (not b!992880))
(check-sat)
(get-model)

(declare-fun b!992931 () Bool)

(declare-fun e!560271 () List!20949)

(declare-fun call!42115 () List!20949)

(assert (=> b!992931 (= e!560271 call!42115)))

(declare-fun b!992933 () Bool)

(declare-fun e!560272 () List!20949)

(assert (=> b!992933 (= e!560272 e!560271)))

(declare-fun c!100769 () Bool)

(assert (=> b!992933 (= c!100769 (= e!29 (h!22107 l!3519)))))

(declare-fun b!992935 () Bool)

(assert (=> b!992935 (= e!560271 (Cons!20945 (h!22107 l!3519) call!42115))))

(declare-fun e!560274 () Bool)

(declare-fun b!992937 () Bool)

(declare-fun lt!440226 () List!20949)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!464 (List!20949) (InoxSet (_ BitVec 64)))

(assert (=> b!992937 (= e!560274 (= (content!464 lt!440226) ((_ map and) (content!464 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!992939 () Bool)

(assert (=> b!992939 (= e!560272 Nil!20946)))

(declare-fun bm!42112 () Bool)

(assert (=> bm!42112 (= call!42115 (-!453 (t!29941 l!3519) e!29))))

(declare-fun d!118257 () Bool)

(assert (=> d!118257 e!560274))

(declare-fun res!663672 () Bool)

(assert (=> d!118257 (=> (not res!663672) (not e!560274))))

(declare-fun size!30667 (List!20949) Int)

(assert (=> d!118257 (= res!663672 (<= (size!30667 lt!440226) (size!30667 l!3519)))))

(assert (=> d!118257 (= lt!440226 e!560272)))

(declare-fun c!100767 () Bool)

(assert (=> d!118257 (= c!100767 ((_ is Cons!20945) l!3519))))

(assert (=> d!118257 (= (-!453 l!3519 e!29) lt!440226)))

(assert (= (and d!118257 c!100767) b!992933))

(assert (= (and d!118257 (not c!100767)) b!992939))

(assert (= (and b!992933 c!100769) b!992931))

(assert (= (and b!992933 (not c!100769)) b!992935))

(assert (= (or b!992931 b!992935) bm!42112))

(assert (= (and d!118257 res!663672) b!992937))

(declare-fun m!920155 () Bool)

(assert (=> b!992937 m!920155))

(declare-fun m!920159 () Bool)

(assert (=> b!992937 m!920159))

(declare-fun m!920163 () Bool)

(assert (=> b!992937 m!920163))

(declare-fun m!920167 () Bool)

(assert (=> bm!42112 m!920167))

(declare-fun m!920171 () Bool)

(assert (=> d!118257 m!920171))

(declare-fun m!920175 () Bool)

(assert (=> d!118257 m!920175))

(assert (=> b!992882 d!118257))

(declare-fun d!118265 () Bool)

(declare-fun lt!440234 () Bool)

(assert (=> d!118265 (= lt!440234 (select (content!464 l!3519) e!29))))

(declare-fun e!560291 () Bool)

(assert (=> d!118265 (= lt!440234 e!560291)))

(declare-fun res!663684 () Bool)

(assert (=> d!118265 (=> (not res!663684) (not e!560291))))

(assert (=> d!118265 (= res!663684 ((_ is Cons!20945) l!3519))))

(assert (=> d!118265 (= (contains!5748 l!3519 e!29) lt!440234)))

(declare-fun b!992956 () Bool)

(declare-fun e!560290 () Bool)

(assert (=> b!992956 (= e!560291 e!560290)))

(declare-fun res!663685 () Bool)

(assert (=> b!992956 (=> res!663685 e!560290)))

(assert (=> b!992956 (= res!663685 (= (h!22107 l!3519) e!29))))

(declare-fun b!992957 () Bool)

(assert (=> b!992957 (= e!560290 (contains!5748 (t!29941 l!3519) e!29))))

(assert (= (and d!118265 res!663684) b!992956))

(assert (= (and b!992956 (not res!663685)) b!992957))

(assert (=> d!118265 m!920159))

(declare-fun m!920191 () Bool)

(assert (=> d!118265 m!920191))

(declare-fun m!920195 () Bool)

(assert (=> b!992957 m!920195))

(assert (=> start!85340 d!118265))

(declare-fun d!118271 () Bool)

(assert (=> d!118271 (= (isEmpty!770 (unapply!37 l!3519)) (not ((_ is Some!560) (unapply!37 l!3519))))))

(assert (=> b!992880 d!118271))

(declare-fun d!118275 () Bool)

(assert (=> d!118275 (= (unapply!37 l!3519) (ite ((_ is Nil!20946) l!3519) None!559 (Some!560 (tuple2!15087 (h!22107 l!3519) (t!29941 l!3519)))))))

(assert (=> b!992880 d!118275))

(check-sat (not bm!42112) (not b!992937) (not d!118265) (not b!992957) (not d!118257))
(check-sat)
