; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84980 () Bool)

(assert start!84980)

(declare-fun res!663223 () Bool)

(declare-fun e!559758 () Bool)

(assert (=> start!84980 (=> (not res!663223) (not e!559758))))

(declare-datatypes ((List!20881 0))(
  ( (Nil!20878) (Cons!20877 (h!22039 (_ BitVec 64)) (t!29867 List!20881)) )
))
(declare-fun tail!21 () List!20881)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5742 (List!20881 (_ BitVec 64)) Bool)

(assert (=> start!84980 (= res!663223 (not (contains!5742 tail!21 head!726)))))

(assert (=> start!84980 e!559758))

(assert (=> start!84980 true))

(declare-fun b!992288 () Bool)

(declare-fun res!663224 () Bool)

(assert (=> b!992288 (=> (not res!663224) (not e!559758))))

(declare-fun content!436 (List!20881) (Set (_ BitVec 64)))

(assert (=> b!992288 (= res!663224 (not (set.member head!726 (content!436 tail!21))))))

(declare-fun b!992289 () Bool)

(declare-fun e!559757 () Bool)

(assert (=> b!992289 (= e!559758 e!559757)))

(declare-fun res!663225 () Bool)

(assert (=> b!992289 (=> (not res!663225) (not e!559757))))

(declare-datatypes ((tuple2!14946 0))(
  ( (tuple2!14947 (_1!7484 (_ BitVec 64)) (_2!7484 List!20881)) )
))
(declare-datatypes ((Option!528 0))(
  ( (Some!527 (v!14328 tuple2!14946)) (None!526) )
))
(declare-fun lt!440119 () Option!528)

(declare-fun isEmpty!735 (Option!528) Bool)

(assert (=> b!992289 (= res!663225 (not (isEmpty!735 lt!440119)))))

(declare-fun unapply!7 (List!20881) Option!528)

(declare-fun $colon$colon!564 (List!20881 (_ BitVec 64)) List!20881)

(assert (=> b!992289 (= lt!440119 (unapply!7 ($colon$colon!564 tail!21 head!726)))))

(declare-fun b!992290 () Bool)

(declare-fun get!15688 (Option!528) tuple2!14946)

(assert (=> b!992290 (= e!559757 (contains!5742 (_2!7484 (get!15688 lt!440119)) head!726))))

(assert (= (and start!84980 res!663223) b!992288))

(assert (= (and b!992288 res!663224) b!992289))

(assert (= (and b!992289 res!663225) b!992290))

(declare-fun m!919981 () Bool)

(assert (=> start!84980 m!919981))

(declare-fun m!919983 () Bool)

(assert (=> b!992288 m!919983))

(declare-fun m!919985 () Bool)

(assert (=> b!992288 m!919985))

(declare-fun m!919987 () Bool)

(assert (=> b!992289 m!919987))

(declare-fun m!919989 () Bool)

(assert (=> b!992289 m!919989))

(assert (=> b!992289 m!919989))

(declare-fun m!919991 () Bool)

(assert (=> b!992289 m!919991))

(declare-fun m!919993 () Bool)

(assert (=> b!992290 m!919993))

(declare-fun m!919995 () Bool)

(assert (=> b!992290 m!919995))

(push 1)

(assert (not b!992290))

(assert (not start!84980))

(assert (not b!992289))

(assert (not b!992288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118075 () Bool)

(declare-fun lt!440134 () Bool)

(assert (=> d!118075 (= lt!440134 (set.member head!726 (content!436 (_2!7484 (get!15688 lt!440119)))))))

(declare-fun e!559788 () Bool)

(assert (=> d!118075 (= lt!440134 e!559788)))

(declare-fun res!663261 () Bool)

(assert (=> d!118075 (=> (not res!663261) (not e!559788))))

(assert (=> d!118075 (= res!663261 (is-Cons!20877 (_2!7484 (get!15688 lt!440119))))))

(assert (=> d!118075 (= (contains!5742 (_2!7484 (get!15688 lt!440119)) head!726) lt!440134)))

(declare-fun b!992325 () Bool)

(declare-fun e!559787 () Bool)

(assert (=> b!992325 (= e!559788 e!559787)))

(declare-fun res!663260 () Bool)

(assert (=> b!992325 (=> res!663260 e!559787)))

(assert (=> b!992325 (= res!663260 (= (h!22039 (_2!7484 (get!15688 lt!440119))) head!726))))

(declare-fun b!992326 () Bool)

(assert (=> b!992326 (= e!559787 (contains!5742 (t!29867 (_2!7484 (get!15688 lt!440119))) head!726))))

(assert (= (and d!118075 res!663261) b!992325))

(assert (= (and b!992325 (not res!663260)) b!992326))

(declare-fun m!920037 () Bool)

(assert (=> d!118075 m!920037))

(declare-fun m!920039 () Bool)

(assert (=> d!118075 m!920039))

(declare-fun m!920041 () Bool)

(assert (=> b!992326 m!920041))

(assert (=> b!992290 d!118075))

(declare-fun d!118087 () Bool)

(assert (=> d!118087 (= (get!15688 lt!440119) (v!14328 lt!440119))))

(assert (=> b!992290 d!118087))

(declare-fun d!118091 () Bool)

(declare-fun lt!440137 () Bool)

(assert (=> d!118091 (= lt!440137 (set.member head!726 (content!436 tail!21)))))

(declare-fun e!559794 () Bool)

(assert (=> d!118091 (= lt!440137 e!559794)))

(declare-fun res!663267 () Bool)

(assert (=> d!118091 (=> (not res!663267) (not e!559794))))

(assert (=> d!118091 (= res!663267 (is-Cons!20877 tail!21))))

(assert (=> d!118091 (= (contains!5742 tail!21 head!726) lt!440137)))

(declare-fun b!992331 () Bool)

(declare-fun e!559793 () Bool)

(assert (=> b!992331 (= e!559794 e!559793)))

(declare-fun res!663266 () Bool)

(assert (=> b!992331 (=> res!663266 e!559793)))

(assert (=> b!992331 (= res!663266 (= (h!22039 tail!21) head!726))))

(declare-fun b!992332 () Bool)

(assert (=> b!992332 (= e!559793 (contains!5742 (t!29867 tail!21) head!726))))

(assert (= (and d!118091 res!663267) b!992331))

(assert (= (and b!992331 (not res!663266)) b!992332))

(assert (=> d!118091 m!919983))

(assert (=> d!118091 m!919985))

(declare-fun m!920051 () Bool)

(assert (=> b!992332 m!920051))

(assert (=> start!84980 d!118091))

(declare-fun d!118097 () Bool)

(assert (=> d!118097 (= (isEmpty!735 lt!440119) (not (is-Some!527 lt!440119)))))

(assert (=> b!992289 d!118097))

(declare-fun d!118103 () Bool)

(assert (=> d!118103 (= (unapply!7 ($colon$colon!564 tail!21 head!726)) (ite (is-Nil!20878 ($colon$colon!564 tail!21 head!726)) None!526 (Some!527 (tuple2!14947 (h!22039 ($colon$colon!564 tail!21 head!726)) (t!29867 ($colon$colon!564 tail!21 head!726))))))))

(assert (=> b!992289 d!118103))

(declare-fun d!118107 () Bool)

(assert (=> d!118107 (= ($colon$colon!564 tail!21 head!726) (Cons!20877 head!726 tail!21))))

(assert (=> b!992289 d!118107))

(declare-fun d!118111 () Bool)

(declare-fun c!100677 () Bool)

(assert (=> d!118111 (= c!100677 (is-Nil!20878 tail!21))))

(declare-fun e!559802 () (Set (_ BitVec 64)))

(assert (=> d!118111 (= (content!436 tail!21) e!559802)))

(declare-fun b!992347 () Bool)

(assert (=> b!992347 (= e!559802 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992348 () Bool)

(assert (=> b!992348 (= e!559802 (set.union (set.insert (h!22039 tail!21) (as set.empty (Set (_ BitVec 64)))) (content!436 (t!29867 tail!21))))))

(assert (= (and d!118111 c!100677) b!992347))

(assert (= (and d!118111 (not c!100677)) b!992348))

(declare-fun m!920057 () Bool)

(assert (=> b!992348 m!920057))

(declare-fun m!920059 () Bool)

(assert (=> b!992348 m!920059))

(assert (=> b!992288 d!118111))

(push 1)

(assert (not d!118075))

(assert (not b!992348))

(assert (not b!992332))

(assert (not b!992326))

(assert (not d!118091))

(check-sat)

