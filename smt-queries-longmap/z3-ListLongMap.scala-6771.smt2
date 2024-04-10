; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85024 () Bool)

(assert start!85024)

(declare-datatypes ((List!20885 0))(
  ( (Nil!20882) (Cons!20881 (h!22043 (_ BitVec 64)) (t!29874 List!20885)) )
))
(declare-fun tail!21 () List!20885)

(declare-fun b!992374 () Bool)

(declare-fun e!559821 () Bool)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun lt!440161 () List!20885)

(declare-fun -!442 (List!20885 (_ BitVec 64)) List!20885)

(assert (=> b!992374 (= e!559821 (not (= (-!442 lt!440161 head!726) tail!21)))))

(declare-datatypes ((tuple2!14954 0))(
  ( (tuple2!14955 (_1!7488 (_ BitVec 64)) (_2!7488 List!20885)) )
))
(declare-fun lt!440160 () tuple2!14954)

(assert (=> b!992374 (= (-!442 (_2!7488 lt!440160) head!726) (_2!7488 lt!440160))))

(declare-datatypes ((Unit!32906 0))(
  ( (Unit!32907) )
))
(declare-fun lt!440158 () Unit!32906)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20885) Unit!32906)

(assert (=> b!992374 (= lt!440158 (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7488 lt!440160)))))

(declare-fun b!992371 () Bool)

(declare-fun res!663291 () Bool)

(declare-fun e!559819 () Bool)

(assert (=> b!992371 (=> (not res!663291) (not e!559819))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!440 (List!20885) (InoxSet (_ BitVec 64)))

(assert (=> b!992371 (= res!663291 (not (select (content!440 tail!21) head!726)))))

(declare-fun b!992372 () Bool)

(declare-fun e!559820 () Bool)

(assert (=> b!992372 (= e!559819 e!559820)))

(declare-fun res!663289 () Bool)

(assert (=> b!992372 (=> (not res!663289) (not e!559820))))

(declare-datatypes ((Option!532 0))(
  ( (Some!531 (v!14335 tuple2!14954)) (None!530) )
))
(declare-fun lt!440159 () Option!532)

(declare-fun isEmpty!739 (Option!532) Bool)

(assert (=> b!992372 (= res!663289 (not (isEmpty!739 lt!440159)))))

(declare-fun unapply!11 (List!20885) Option!532)

(assert (=> b!992372 (= lt!440159 (unapply!11 lt!440161))))

(declare-fun $colon$colon!568 (List!20885 (_ BitVec 64)) List!20885)

(assert (=> b!992372 (= lt!440161 ($colon$colon!568 tail!21 head!726))))

(declare-fun res!663290 () Bool)

(assert (=> start!85024 (=> (not res!663290) (not e!559819))))

(declare-fun contains!5746 (List!20885 (_ BitVec 64)) Bool)

(assert (=> start!85024 (= res!663290 (not (contains!5746 tail!21 head!726)))))

(assert (=> start!85024 e!559819))

(assert (=> start!85024 true))

(declare-fun b!992373 () Bool)

(assert (=> b!992373 (= e!559820 e!559821)))

(declare-fun res!663288 () Bool)

(assert (=> b!992373 (=> (not res!663288) (not e!559821))))

(assert (=> b!992373 (= res!663288 (not (contains!5746 (_2!7488 lt!440160) head!726)))))

(declare-fun get!15694 (Option!532) tuple2!14954)

(assert (=> b!992373 (= lt!440160 (get!15694 lt!440159))))

(assert (= (and start!85024 res!663290) b!992371))

(assert (= (and b!992371 res!663291) b!992372))

(assert (= (and b!992372 res!663289) b!992373))

(assert (= (and b!992373 res!663288) b!992374))

(declare-fun m!920087 () Bool)

(assert (=> b!992374 m!920087))

(declare-fun m!920089 () Bool)

(assert (=> b!992374 m!920089))

(declare-fun m!920091 () Bool)

(assert (=> b!992374 m!920091))

(declare-fun m!920093 () Bool)

(assert (=> start!85024 m!920093))

(declare-fun m!920095 () Bool)

(assert (=> b!992371 m!920095))

(declare-fun m!920097 () Bool)

(assert (=> b!992371 m!920097))

(declare-fun m!920099 () Bool)

(assert (=> b!992373 m!920099))

(declare-fun m!920101 () Bool)

(assert (=> b!992373 m!920101))

(declare-fun m!920103 () Bool)

(assert (=> b!992372 m!920103))

(declare-fun m!920105 () Bool)

(assert (=> b!992372 m!920105))

(declare-fun m!920107 () Bool)

(assert (=> b!992372 m!920107))

(check-sat (not b!992374) (not b!992371) (not b!992373) (not b!992372) (not start!85024))
(check-sat)
(get-model)

(declare-fun d!118117 () Bool)

(declare-fun lt!440180 () Bool)

(assert (=> d!118117 (= lt!440180 (select (content!440 (_2!7488 lt!440160)) head!726))))

(declare-fun e!559844 () Bool)

(assert (=> d!118117 (= lt!440180 e!559844)))

(declare-fun res!663316 () Bool)

(assert (=> d!118117 (=> (not res!663316) (not e!559844))))

(get-info :version)

(assert (=> d!118117 (= res!663316 ((_ is Cons!20881) (_2!7488 lt!440160)))))

(assert (=> d!118117 (= (contains!5746 (_2!7488 lt!440160) head!726) lt!440180)))

(declare-fun b!992399 () Bool)

(declare-fun e!559843 () Bool)

(assert (=> b!992399 (= e!559844 e!559843)))

(declare-fun res!663317 () Bool)

(assert (=> b!992399 (=> res!663317 e!559843)))

(assert (=> b!992399 (= res!663317 (= (h!22043 (_2!7488 lt!440160)) head!726))))

(declare-fun b!992400 () Bool)

(assert (=> b!992400 (= e!559843 (contains!5746 (t!29874 (_2!7488 lt!440160)) head!726))))

(assert (= (and d!118117 res!663316) b!992399))

(assert (= (and b!992399 (not res!663317)) b!992400))

(declare-fun m!920131 () Bool)

(assert (=> d!118117 m!920131))

(declare-fun m!920133 () Bool)

(assert (=> d!118117 m!920133))

(declare-fun m!920135 () Bool)

(assert (=> b!992400 m!920135))

(assert (=> b!992373 d!118117))

(declare-fun d!118123 () Bool)

(assert (=> d!118123 (= (get!15694 lt!440159) (v!14335 lt!440159))))

(assert (=> b!992373 d!118123))

(declare-fun d!118127 () Bool)

(declare-fun lt!440183 () Bool)

(assert (=> d!118127 (= lt!440183 (select (content!440 tail!21) head!726))))

(declare-fun e!559850 () Bool)

(assert (=> d!118127 (= lt!440183 e!559850)))

(declare-fun res!663322 () Bool)

(assert (=> d!118127 (=> (not res!663322) (not e!559850))))

(assert (=> d!118127 (= res!663322 ((_ is Cons!20881) tail!21))))

(assert (=> d!118127 (= (contains!5746 tail!21 head!726) lt!440183)))

(declare-fun b!992405 () Bool)

(declare-fun e!559849 () Bool)

(assert (=> b!992405 (= e!559850 e!559849)))

(declare-fun res!663323 () Bool)

(assert (=> b!992405 (=> res!663323 e!559849)))

(assert (=> b!992405 (= res!663323 (= (h!22043 tail!21) head!726))))

(declare-fun b!992406 () Bool)

(assert (=> b!992406 (= e!559849 (contains!5746 (t!29874 tail!21) head!726))))

(assert (= (and d!118127 res!663322) b!992405))

(assert (= (and b!992405 (not res!663323)) b!992406))

(assert (=> d!118127 m!920095))

(assert (=> d!118127 m!920097))

(declare-fun m!920149 () Bool)

(assert (=> b!992406 m!920149))

(assert (=> start!85024 d!118127))

(declare-fun d!118133 () Bool)

(assert (=> d!118133 (= (isEmpty!739 lt!440159) (not ((_ is Some!531) lt!440159)))))

(assert (=> b!992372 d!118133))

(declare-fun d!118137 () Bool)

(assert (=> d!118137 (= (unapply!11 lt!440161) (ite ((_ is Nil!20882) lt!440161) None!530 (Some!531 (tuple2!14955 (h!22043 lt!440161) (t!29874 lt!440161)))))))

(assert (=> b!992372 d!118137))

(declare-fun d!118139 () Bool)

(assert (=> d!118139 (= ($colon$colon!568 tail!21 head!726) (Cons!20881 head!726 tail!21))))

(assert (=> b!992372 d!118139))

(declare-fun d!118143 () Bool)

(declare-fun c!100688 () Bool)

(assert (=> d!118143 (= c!100688 ((_ is Nil!20882) tail!21))))

(declare-fun e!559863 () (InoxSet (_ BitVec 64)))

(assert (=> d!118143 (= (content!440 tail!21) e!559863)))

(declare-fun b!992427 () Bool)

(assert (=> b!992427 (= e!559863 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992428 () Bool)

(assert (=> b!992428 (= e!559863 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22043 tail!21) true) (content!440 (t!29874 tail!21))))))

(assert (= (and d!118143 c!100688) b!992427))

(assert (= (and d!118143 (not c!100688)) b!992428))

(declare-fun m!920157 () Bool)

(assert (=> b!992428 m!920157))

(declare-fun m!920159 () Bool)

(assert (=> b!992428 m!920159))

(assert (=> b!992371 d!118143))

(declare-fun b!992461 () Bool)

(declare-fun e!559889 () List!20885)

(declare-fun call!42100 () List!20885)

(assert (=> b!992461 (= e!559889 call!42100)))

(declare-fun b!992462 () Bool)

(declare-fun e!559888 () List!20885)

(assert (=> b!992462 (= e!559888 e!559889)))

(declare-fun c!100702 () Bool)

(assert (=> b!992462 (= c!100702 (= head!726 (h!22043 lt!440161)))))

(declare-fun d!118151 () Bool)

(declare-fun e!559887 () Bool)

(assert (=> d!118151 e!559887))

(declare-fun res!663334 () Bool)

(assert (=> d!118151 (=> (not res!663334) (not e!559887))))

(declare-fun lt!440196 () List!20885)

(declare-fun size!30685 (List!20885) Int)

(assert (=> d!118151 (= res!663334 (<= (size!30685 lt!440196) (size!30685 lt!440161)))))

(assert (=> d!118151 (= lt!440196 e!559888)))

(declare-fun c!100701 () Bool)

(assert (=> d!118151 (= c!100701 ((_ is Cons!20881) lt!440161))))

(assert (=> d!118151 (= (-!442 lt!440161 head!726) lt!440196)))

(declare-fun b!992463 () Bool)

(assert (=> b!992463 (= e!559889 (Cons!20881 (h!22043 lt!440161) call!42100))))

(declare-fun b!992464 () Bool)

(assert (=> b!992464 (= e!559888 Nil!20882)))

(declare-fun bm!42097 () Bool)

(assert (=> bm!42097 (= call!42100 (-!442 (t!29874 lt!440161) head!726))))

(declare-fun b!992465 () Bool)

(assert (=> b!992465 (= e!559887 (= (content!440 lt!440196) ((_ map and) (content!440 lt!440161) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(assert (= (and d!118151 c!100701) b!992462))

(assert (= (and d!118151 (not c!100701)) b!992464))

(assert (= (and b!992462 c!100702) b!992461))

(assert (= (and b!992462 (not c!100702)) b!992463))

(assert (= (or b!992461 b!992463) bm!42097))

(assert (= (and d!118151 res!663334) b!992465))

(declare-fun m!920183 () Bool)

(assert (=> d!118151 m!920183))

(declare-fun m!920185 () Bool)

(assert (=> d!118151 m!920185))

(declare-fun m!920187 () Bool)

(assert (=> bm!42097 m!920187))

(declare-fun m!920191 () Bool)

(assert (=> b!992465 m!920191))

(declare-fun m!920193 () Bool)

(assert (=> b!992465 m!920193))

(declare-fun m!920195 () Bool)

(assert (=> b!992465 m!920195))

(assert (=> b!992374 d!118151))

(declare-fun b!992473 () Bool)

(declare-fun e!559897 () List!20885)

(declare-fun call!42102 () List!20885)

(assert (=> b!992473 (= e!559897 call!42102)))

(declare-fun b!992474 () Bool)

(declare-fun e!559896 () List!20885)

(assert (=> b!992474 (= e!559896 e!559897)))

(declare-fun c!100706 () Bool)

(assert (=> b!992474 (= c!100706 (= head!726 (h!22043 (_2!7488 lt!440160))))))

(declare-fun d!118163 () Bool)

(declare-fun e!559895 () Bool)

(assert (=> d!118163 e!559895))

(declare-fun res!663338 () Bool)

(assert (=> d!118163 (=> (not res!663338) (not e!559895))))

(declare-fun lt!440199 () List!20885)

(assert (=> d!118163 (= res!663338 (<= (size!30685 lt!440199) (size!30685 (_2!7488 lt!440160))))))

(assert (=> d!118163 (= lt!440199 e!559896)))

(declare-fun c!100705 () Bool)

(assert (=> d!118163 (= c!100705 ((_ is Cons!20881) (_2!7488 lt!440160)))))

(assert (=> d!118163 (= (-!442 (_2!7488 lt!440160) head!726) lt!440199)))

(declare-fun b!992475 () Bool)

(assert (=> b!992475 (= e!559897 (Cons!20881 (h!22043 (_2!7488 lt!440160)) call!42102))))

(declare-fun b!992476 () Bool)

(assert (=> b!992476 (= e!559896 Nil!20882)))

(declare-fun bm!42099 () Bool)

(assert (=> bm!42099 (= call!42102 (-!442 (t!29874 (_2!7488 lt!440160)) head!726))))

(declare-fun b!992477 () Bool)

(assert (=> b!992477 (= e!559895 (= (content!440 lt!440199) ((_ map and) (content!440 (_2!7488 lt!440160)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) head!726 true)))))))

(assert (= (and d!118163 c!100705) b!992474))

(assert (= (and d!118163 (not c!100705)) b!992476))

(assert (= (and b!992474 c!100706) b!992473))

(assert (= (and b!992474 (not c!100706)) b!992475))

(assert (= (or b!992473 b!992475) bm!42099))

(assert (= (and d!118163 res!663338) b!992477))

(declare-fun m!920209 () Bool)

(assert (=> d!118163 m!920209))

(declare-fun m!920211 () Bool)

(assert (=> d!118163 m!920211))

(declare-fun m!920213 () Bool)

(assert (=> bm!42099 m!920213))

(declare-fun m!920215 () Bool)

(assert (=> b!992477 m!920215))

(assert (=> b!992477 m!920131))

(assert (=> b!992477 m!920195))

(assert (=> b!992374 d!118163))

(declare-fun d!118169 () Bool)

(assert (=> d!118169 (= (-!442 (_2!7488 lt!440160) head!726) (_2!7488 lt!440160))))

(declare-fun lt!440205 () Unit!32906)

(declare-fun choose!48 ((_ BitVec 64) List!20885) Unit!32906)

(assert (=> d!118169 (= lt!440205 (choose!48 head!726 (_2!7488 lt!440160)))))

(assert (=> d!118169 (not (contains!5746 (_2!7488 lt!440160) head!726))))

(assert (=> d!118169 (= (lemmaListMinusENotContainedEqualsList!0 head!726 (_2!7488 lt!440160)) lt!440205)))

(declare-fun bs!28223 () Bool)

(assert (= bs!28223 d!118169))

(assert (=> bs!28223 m!920089))

(declare-fun m!920225 () Bool)

(assert (=> bs!28223 m!920225))

(assert (=> bs!28223 m!920099))

(assert (=> b!992374 d!118169))

(check-sat (not d!118163) (not b!992465) (not bm!42097) (not d!118169) (not d!118127) (not b!992400) (not bm!42099) (not b!992477) (not b!992428) (not d!118151) (not b!992406) (not d!118117))
(check-sat)
