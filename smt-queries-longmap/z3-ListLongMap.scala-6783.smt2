; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85580 () Bool)

(assert start!85580)

(declare-fun res!664188 () Bool)

(declare-fun e!561057 () Bool)

(assert (=> start!85580 (=> (not res!664188) (not e!561057))))

(declare-datatypes ((List!20909 0))(
  ( (Nil!20906) (Cons!20905 (h!22073 (_ BitVec 64)) (t!29902 List!20909)) )
))
(declare-fun l!3519 () List!20909)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5803 (List!20909 (_ BitVec 64)) Bool)

(assert (=> start!85580 (= res!664188 (not (contains!5803 l!3519 e!29)))))

(assert (=> start!85580 e!561057))

(assert (=> start!85580 true))

(declare-fun b!994148 () Bool)

(declare-fun res!664189 () Bool)

(assert (=> b!994148 (=> (not res!664189) (not e!561057))))

(declare-datatypes ((tuple2!15022 0))(
  ( (tuple2!15023 (_1!7522 (_ BitVec 64)) (_2!7522 List!20909)) )
))
(declare-datatypes ((Option!562 0))(
  ( (Some!561 (v!14397 tuple2!15022)) (None!560) )
))
(declare-fun isEmpty!777 (Option!562) Bool)

(declare-fun unapply!43 (List!20909) Option!562)

(assert (=> b!994148 (= res!664189 (isEmpty!777 (unapply!43 l!3519)))))

(declare-fun b!994149 () Bool)

(declare-fun res!664190 () Bool)

(assert (=> b!994149 (=> (not res!664190) (not e!561057))))

(get-info :version)

(assert (=> b!994149 (= res!664190 (not ((_ is Nil!20906) l!3519)))))

(declare-fun b!994150 () Bool)

(declare-fun -!455 (List!20909 (_ BitVec 64)) List!20909)

(assert (=> b!994150 (= e!561057 (not (= (-!455 l!3519 e!29) l!3519)))))

(assert (= (and start!85580 res!664188) b!994148))

(assert (= (and b!994148 res!664189) b!994149))

(assert (= (and b!994149 res!664190) b!994150))

(declare-fun m!922289 () Bool)

(assert (=> start!85580 m!922289))

(declare-fun m!922291 () Bool)

(assert (=> b!994148 m!922291))

(assert (=> b!994148 m!922291))

(declare-fun m!922293 () Bool)

(assert (=> b!994148 m!922293))

(declare-fun m!922295 () Bool)

(assert (=> b!994150 m!922295))

(check-sat (not b!994148) (not b!994150) (not start!85580))
(check-sat)
(get-model)

(declare-fun d!118823 () Bool)

(assert (=> d!118823 (= (isEmpty!777 (unapply!43 l!3519)) (not ((_ is Some!561) (unapply!43 l!3519))))))

(assert (=> b!994148 d!118823))

(declare-fun d!118829 () Bool)

(assert (=> d!118829 (= (unapply!43 l!3519) (ite ((_ is Nil!20906) l!3519) None!560 (Some!561 (tuple2!15023 (h!22073 l!3519) (t!29902 l!3519)))))))

(assert (=> b!994148 d!118829))

(declare-fun d!118835 () Bool)

(declare-fun e!561088 () Bool)

(assert (=> d!118835 e!561088))

(declare-fun res!664215 () Bool)

(assert (=> d!118835 (=> (not res!664215) (not e!561088))))

(declare-fun lt!440850 () List!20909)

(declare-fun size!30717 (List!20909) Int)

(assert (=> d!118835 (= res!664215 (<= (size!30717 lt!440850) (size!30717 l!3519)))))

(declare-fun e!561085 () List!20909)

(assert (=> d!118835 (= lt!440850 e!561085)))

(declare-fun c!101134 () Bool)

(assert (=> d!118835 (= c!101134 ((_ is Cons!20905) l!3519))))

(assert (=> d!118835 (= (-!455 l!3519 e!29) lt!440850)))

(declare-fun b!994199 () Bool)

(declare-fun e!561087 () List!20909)

(declare-fun call!42194 () List!20909)

(assert (=> b!994199 (= e!561087 (Cons!20905 (h!22073 l!3519) call!42194))))

(declare-fun b!994200 () Bool)

(assert (=> b!994200 (= e!561085 e!561087)))

(declare-fun c!101135 () Bool)

(assert (=> b!994200 (= c!101135 (= e!29 (h!22073 l!3519)))))

(declare-fun b!994201 () Bool)

(assert (=> b!994201 (= e!561085 Nil!20906)))

(declare-fun b!994203 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!472 (List!20909) (InoxSet (_ BitVec 64)))

(assert (=> b!994203 (= e!561088 (= (content!472 lt!440850) ((_ map and) (content!472 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!994205 () Bool)

(assert (=> b!994205 (= e!561087 call!42194)))

(declare-fun bm!42191 () Bool)

(assert (=> bm!42191 (= call!42194 (-!455 (t!29902 l!3519) e!29))))

(assert (= (and d!118835 c!101134) b!994200))

(assert (= (and d!118835 (not c!101134)) b!994201))

(assert (= (and b!994200 c!101135) b!994205))

(assert (= (and b!994200 (not c!101135)) b!994199))

(assert (= (or b!994205 b!994199) bm!42191))

(assert (= (and d!118835 res!664215) b!994203))

(declare-fun m!922313 () Bool)

(assert (=> d!118835 m!922313))

(declare-fun m!922319 () Bool)

(assert (=> d!118835 m!922319))

(declare-fun m!922324 () Bool)

(assert (=> b!994203 m!922324))

(declare-fun m!922329 () Bool)

(assert (=> b!994203 m!922329))

(declare-fun m!922339 () Bool)

(assert (=> b!994203 m!922339))

(declare-fun m!922345 () Bool)

(assert (=> bm!42191 m!922345))

(assert (=> b!994150 d!118835))

(declare-fun d!118843 () Bool)

(declare-fun lt!440861 () Bool)

(assert (=> d!118843 (= lt!440861 (select (content!472 l!3519) e!29))))

(declare-fun e!561108 () Bool)

(assert (=> d!118843 (= lt!440861 e!561108)))

(declare-fun res!664233 () Bool)

(assert (=> d!118843 (=> (not res!664233) (not e!561108))))

(assert (=> d!118843 (= res!664233 ((_ is Cons!20905) l!3519))))

(assert (=> d!118843 (= (contains!5803 l!3519 e!29) lt!440861)))

(declare-fun b!994228 () Bool)

(declare-fun e!561109 () Bool)

(assert (=> b!994228 (= e!561108 e!561109)))

(declare-fun res!664234 () Bool)

(assert (=> b!994228 (=> res!664234 e!561109)))

(assert (=> b!994228 (= res!664234 (= (h!22073 l!3519) e!29))))

(declare-fun b!994230 () Bool)

(assert (=> b!994230 (= e!561109 (contains!5803 (t!29902 l!3519) e!29))))

(assert (= (and d!118843 res!664233) b!994228))

(assert (= (and b!994228 (not res!664234)) b!994230))

(assert (=> d!118843 m!922329))

(declare-fun m!922354 () Bool)

(assert (=> d!118843 m!922354))

(declare-fun m!922359 () Bool)

(assert (=> b!994230 m!922359))

(assert (=> start!85580 d!118843))

(check-sat (not b!994203) (not b!994230) (not bm!42191) (not d!118843) (not d!118835))
(check-sat)
