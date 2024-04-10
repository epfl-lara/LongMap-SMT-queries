; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84982 () Bool)

(assert start!84982)

(declare-fun res!663234 () Bool)

(declare-fun e!559764 () Bool)

(assert (=> start!84982 (=> (not res!663234) (not e!559764))))

(declare-datatypes ((List!20882 0))(
  ( (Nil!20879) (Cons!20878 (h!22040 (_ BitVec 64)) (t!29868 List!20882)) )
))
(declare-fun tail!21 () List!20882)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5743 (List!20882 (_ BitVec 64)) Bool)

(assert (=> start!84982 (= res!663234 (not (contains!5743 tail!21 head!726)))))

(assert (=> start!84982 e!559764))

(assert (=> start!84982 true))

(declare-fun b!992297 () Bool)

(declare-fun res!663233 () Bool)

(assert (=> b!992297 (=> (not res!663233) (not e!559764))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!437 (List!20882) (InoxSet (_ BitVec 64)))

(assert (=> b!992297 (= res!663233 (not (select (content!437 tail!21) head!726)))))

(declare-fun b!992298 () Bool)

(declare-fun e!559763 () Bool)

(assert (=> b!992298 (= e!559764 e!559763)))

(declare-fun res!663232 () Bool)

(assert (=> b!992298 (=> (not res!663232) (not e!559763))))

(declare-datatypes ((tuple2!14948 0))(
  ( (tuple2!14949 (_1!7485 (_ BitVec 64)) (_2!7485 List!20882)) )
))
(declare-datatypes ((Option!529 0))(
  ( (Some!528 (v!14329 tuple2!14948)) (None!527) )
))
(declare-fun lt!440122 () Option!529)

(declare-fun isEmpty!736 (Option!529) Bool)

(assert (=> b!992298 (= res!663232 (not (isEmpty!736 lt!440122)))))

(declare-fun unapply!8 (List!20882) Option!529)

(declare-fun $colon$colon!565 (List!20882 (_ BitVec 64)) List!20882)

(assert (=> b!992298 (= lt!440122 (unapply!8 ($colon$colon!565 tail!21 head!726)))))

(declare-fun b!992299 () Bool)

(declare-fun get!15689 (Option!529) tuple2!14948)

(assert (=> b!992299 (= e!559763 (contains!5743 (_2!7485 (get!15689 lt!440122)) head!726))))

(assert (= (and start!84982 res!663234) b!992297))

(assert (= (and b!992297 res!663233) b!992298))

(assert (= (and b!992298 res!663232) b!992299))

(declare-fun m!919997 () Bool)

(assert (=> start!84982 m!919997))

(declare-fun m!919999 () Bool)

(assert (=> b!992297 m!919999))

(declare-fun m!920001 () Bool)

(assert (=> b!992297 m!920001))

(declare-fun m!920003 () Bool)

(assert (=> b!992298 m!920003))

(declare-fun m!920005 () Bool)

(assert (=> b!992298 m!920005))

(assert (=> b!992298 m!920005))

(declare-fun m!920007 () Bool)

(assert (=> b!992298 m!920007))

(declare-fun m!920009 () Bool)

(assert (=> b!992299 m!920009))

(declare-fun m!920011 () Bool)

(assert (=> b!992299 m!920011))

(check-sat (not start!84982) (not b!992299) (not b!992298) (not b!992297))
(check-sat)
(get-model)

(declare-fun d!118077 () Bool)

(declare-fun lt!440135 () Bool)

(assert (=> d!118077 (= lt!440135 (select (content!437 tail!21) head!726))))

(declare-fun e!559789 () Bool)

(assert (=> d!118077 (= lt!440135 e!559789)))

(declare-fun res!663262 () Bool)

(assert (=> d!118077 (=> (not res!663262) (not e!559789))))

(get-info :version)

(assert (=> d!118077 (= res!663262 ((_ is Cons!20878) tail!21))))

(assert (=> d!118077 (= (contains!5743 tail!21 head!726) lt!440135)))

(declare-fun b!992327 () Bool)

(declare-fun e!559790 () Bool)

(assert (=> b!992327 (= e!559789 e!559790)))

(declare-fun res!663263 () Bool)

(assert (=> b!992327 (=> res!663263 e!559790)))

(assert (=> b!992327 (= res!663263 (= (h!22040 tail!21) head!726))))

(declare-fun b!992328 () Bool)

(assert (=> b!992328 (= e!559790 (contains!5743 (t!29868 tail!21) head!726))))

(assert (= (and d!118077 res!663262) b!992327))

(assert (= (and b!992327 (not res!663263)) b!992328))

(assert (=> d!118077 m!919999))

(assert (=> d!118077 m!920001))

(declare-fun m!920043 () Bool)

(assert (=> b!992328 m!920043))

(assert (=> start!84982 d!118077))

(declare-fun d!118089 () Bool)

(declare-fun lt!440136 () Bool)

(assert (=> d!118089 (= lt!440136 (select (content!437 (_2!7485 (get!15689 lt!440122))) head!726))))

(declare-fun e!559791 () Bool)

(assert (=> d!118089 (= lt!440136 e!559791)))

(declare-fun res!663264 () Bool)

(assert (=> d!118089 (=> (not res!663264) (not e!559791))))

(assert (=> d!118089 (= res!663264 ((_ is Cons!20878) (_2!7485 (get!15689 lt!440122))))))

(assert (=> d!118089 (= (contains!5743 (_2!7485 (get!15689 lt!440122)) head!726) lt!440136)))

(declare-fun b!992329 () Bool)

(declare-fun e!559792 () Bool)

(assert (=> b!992329 (= e!559791 e!559792)))

(declare-fun res!663265 () Bool)

(assert (=> b!992329 (=> res!663265 e!559792)))

(assert (=> b!992329 (= res!663265 (= (h!22040 (_2!7485 (get!15689 lt!440122))) head!726))))

(declare-fun b!992330 () Bool)

(assert (=> b!992330 (= e!559792 (contains!5743 (t!29868 (_2!7485 (get!15689 lt!440122))) head!726))))

(assert (= (and d!118089 res!663264) b!992329))

(assert (= (and b!992329 (not res!663265)) b!992330))

(declare-fun m!920045 () Bool)

(assert (=> d!118089 m!920045))

(declare-fun m!920047 () Bool)

(assert (=> d!118089 m!920047))

(declare-fun m!920049 () Bool)

(assert (=> b!992330 m!920049))

(assert (=> b!992299 d!118089))

(declare-fun d!118093 () Bool)

(assert (=> d!118093 (= (get!15689 lt!440122) (v!14329 lt!440122))))

(assert (=> b!992299 d!118093))

(declare-fun d!118099 () Bool)

(assert (=> d!118099 (= (isEmpty!736 lt!440122) (not ((_ is Some!528) lt!440122)))))

(assert (=> b!992298 d!118099))

(declare-fun d!118105 () Bool)

(assert (=> d!118105 (= (unapply!8 ($colon$colon!565 tail!21 head!726)) (ite ((_ is Nil!20879) ($colon$colon!565 tail!21 head!726)) None!527 (Some!528 (tuple2!14949 (h!22040 ($colon$colon!565 tail!21 head!726)) (t!29868 ($colon$colon!565 tail!21 head!726))))))))

(assert (=> b!992298 d!118105))

(declare-fun d!118109 () Bool)

(assert (=> d!118109 (= ($colon$colon!565 tail!21 head!726) (Cons!20878 head!726 tail!21))))

(assert (=> b!992298 d!118109))

(declare-fun d!118113 () Bool)

(declare-fun c!100678 () Bool)

(assert (=> d!118113 (= c!100678 ((_ is Nil!20879) tail!21))))

(declare-fun e!559803 () (InoxSet (_ BitVec 64)))

(assert (=> d!118113 (= (content!437 tail!21) e!559803)))

(declare-fun b!992349 () Bool)

(assert (=> b!992349 (= e!559803 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992350 () Bool)

(assert (=> b!992350 (= e!559803 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22040 tail!21) true) (content!437 (t!29868 tail!21))))))

(assert (= (and d!118113 c!100678) b!992349))

(assert (= (and d!118113 (not c!100678)) b!992350))

(declare-fun m!920061 () Bool)

(assert (=> b!992350 m!920061))

(declare-fun m!920063 () Bool)

(assert (=> b!992350 m!920063))

(assert (=> b!992297 d!118113))

(check-sat (not b!992328) (not d!118089) (not b!992330) (not d!118077) (not b!992350))
(check-sat)
