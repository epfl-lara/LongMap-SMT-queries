; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84962 () Bool)

(assert start!84962)

(declare-fun res!663115 () Bool)

(declare-fun e!559610 () Bool)

(assert (=> start!84962 (=> (not res!663115) (not e!559610))))

(declare-datatypes ((List!20916 0))(
  ( (Nil!20913) (Cons!20912 (h!22074 (_ BitVec 64)) (t!29893 List!20916)) )
))
(declare-fun tail!21 () List!20916)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5715 (List!20916 (_ BitVec 64)) Bool)

(assert (=> start!84962 (= res!663115 (not (contains!5715 tail!21 head!726)))))

(assert (=> start!84962 e!559610))

(assert (=> start!84962 true))

(declare-fun b!992049 () Bool)

(declare-fun res!663114 () Bool)

(assert (=> b!992049 (=> (not res!663114) (not e!559610))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!434 (List!20916) (InoxSet (_ BitVec 64)))

(assert (=> b!992049 (= res!663114 (not (select (content!434 tail!21) head!726)))))

(declare-fun b!992050 () Bool)

(declare-fun e!559609 () Bool)

(assert (=> b!992050 (= e!559610 e!559609)))

(declare-fun res!663113 () Bool)

(assert (=> b!992050 (=> (not res!663113) (not e!559609))))

(declare-datatypes ((tuple2!15026 0))(
  ( (tuple2!15027 (_1!7524 (_ BitVec 64)) (_2!7524 List!20916)) )
))
(declare-datatypes ((Option!531 0))(
  ( (Some!530 (v!14327 tuple2!15026)) (None!529) )
))
(declare-fun lt!439883 () Option!531)

(declare-fun isEmpty!740 (Option!531) Bool)

(assert (=> b!992050 (= res!663113 (not (isEmpty!740 lt!439883)))))

(declare-fun unapply!7 (List!20916) Option!531)

(declare-fun $colon$colon!565 (List!20916 (_ BitVec 64)) List!20916)

(assert (=> b!992050 (= lt!439883 (unapply!7 ($colon$colon!565 tail!21 head!726)))))

(declare-fun b!992051 () Bool)

(declare-fun get!15683 (Option!531) tuple2!15026)

(assert (=> b!992051 (= e!559609 (contains!5715 (_2!7524 (get!15683 lt!439883)) head!726))))

(assert (= (and start!84962 res!663115) b!992049))

(assert (= (and b!992049 res!663114) b!992050))

(assert (= (and b!992050 res!663113) b!992051))

(declare-fun m!919223 () Bool)

(assert (=> start!84962 m!919223))

(declare-fun m!919225 () Bool)

(assert (=> b!992049 m!919225))

(declare-fun m!919227 () Bool)

(assert (=> b!992049 m!919227))

(declare-fun m!919229 () Bool)

(assert (=> b!992050 m!919229))

(declare-fun m!919231 () Bool)

(assert (=> b!992050 m!919231))

(assert (=> b!992050 m!919231))

(declare-fun m!919233 () Bool)

(assert (=> b!992050 m!919233))

(declare-fun m!919235 () Bool)

(assert (=> b!992051 m!919235))

(declare-fun m!919237 () Bool)

(assert (=> b!992051 m!919237))

(check-sat (not start!84962) (not b!992051) (not b!992050) (not b!992049))
(check-sat)
(get-model)

(declare-fun d!117875 () Bool)

(declare-fun lt!439896 () Bool)

(assert (=> d!117875 (= lt!439896 (select (content!434 tail!21) head!726))))

(declare-fun e!559634 () Bool)

(assert (=> d!117875 (= lt!439896 e!559634)))

(declare-fun res!663145 () Bool)

(assert (=> d!117875 (=> (not res!663145) (not e!559634))))

(get-info :version)

(assert (=> d!117875 (= res!663145 ((_ is Cons!20912) tail!21))))

(assert (=> d!117875 (= (contains!5715 tail!21 head!726) lt!439896)))

(declare-fun b!992080 () Bool)

(declare-fun e!559633 () Bool)

(assert (=> b!992080 (= e!559634 e!559633)))

(declare-fun res!663144 () Bool)

(assert (=> b!992080 (=> res!663144 e!559633)))

(assert (=> b!992080 (= res!663144 (= (h!22074 tail!21) head!726))))

(declare-fun b!992081 () Bool)

(assert (=> b!992081 (= e!559633 (contains!5715 (t!29893 tail!21) head!726))))

(assert (= (and d!117875 res!663145) b!992080))

(assert (= (and b!992080 (not res!663144)) b!992081))

(assert (=> d!117875 m!919225))

(assert (=> d!117875 m!919227))

(declare-fun m!919271 () Bool)

(assert (=> b!992081 m!919271))

(assert (=> start!84962 d!117875))

(declare-fun d!117881 () Bool)

(declare-fun lt!439898 () Bool)

(assert (=> d!117881 (= lt!439898 (select (content!434 (_2!7524 (get!15683 lt!439883))) head!726))))

(declare-fun e!559640 () Bool)

(assert (=> d!117881 (= lt!439898 e!559640)))

(declare-fun res!663151 () Bool)

(assert (=> d!117881 (=> (not res!663151) (not e!559640))))

(assert (=> d!117881 (= res!663151 ((_ is Cons!20912) (_2!7524 (get!15683 lt!439883))))))

(assert (=> d!117881 (= (contains!5715 (_2!7524 (get!15683 lt!439883)) head!726) lt!439898)))

(declare-fun b!992086 () Bool)

(declare-fun e!559639 () Bool)

(assert (=> b!992086 (= e!559640 e!559639)))

(declare-fun res!663150 () Bool)

(assert (=> b!992086 (=> res!663150 e!559639)))

(assert (=> b!992086 (= res!663150 (= (h!22074 (_2!7524 (get!15683 lt!439883))) head!726))))

(declare-fun b!992087 () Bool)

(assert (=> b!992087 (= e!559639 (contains!5715 (t!29893 (_2!7524 (get!15683 lt!439883))) head!726))))

(assert (= (and d!117881 res!663151) b!992086))

(assert (= (and b!992086 (not res!663150)) b!992087))

(declare-fun m!919275 () Bool)

(assert (=> d!117881 m!919275))

(declare-fun m!919281 () Bool)

(assert (=> d!117881 m!919281))

(declare-fun m!919285 () Bool)

(assert (=> b!992087 m!919285))

(assert (=> b!992051 d!117881))

(declare-fun d!117887 () Bool)

(assert (=> d!117887 (= (get!15683 lt!439883) (v!14327 lt!439883))))

(assert (=> b!992051 d!117887))

(declare-fun d!117891 () Bool)

(assert (=> d!117891 (= (isEmpty!740 lt!439883) (not ((_ is Some!530) lt!439883)))))

(assert (=> b!992050 d!117891))

(declare-fun d!117897 () Bool)

(assert (=> d!117897 (= (unapply!7 ($colon$colon!565 tail!21 head!726)) (ite ((_ is Nil!20913) ($colon$colon!565 tail!21 head!726)) None!529 (Some!530 (tuple2!15027 (h!22074 ($colon$colon!565 tail!21 head!726)) (t!29893 ($colon$colon!565 tail!21 head!726))))))))

(assert (=> b!992050 d!117897))

(declare-fun d!117907 () Bool)

(assert (=> d!117907 (= ($colon$colon!565 tail!21 head!726) (Cons!20912 head!726 tail!21))))

(assert (=> b!992050 d!117907))

(declare-fun d!117911 () Bool)

(declare-fun c!100610 () Bool)

(assert (=> d!117911 (= c!100610 ((_ is Nil!20913) tail!21))))

(declare-fun e!559652 () (InoxSet (_ BitVec 64)))

(assert (=> d!117911 (= (content!434 tail!21) e!559652)))

(declare-fun b!992106 () Bool)

(assert (=> b!992106 (= e!559652 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992107 () Bool)

(assert (=> b!992107 (= e!559652 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22074 tail!21) true) (content!434 (t!29893 tail!21))))))

(assert (= (and d!117911 c!100610) b!992106))

(assert (= (and d!117911 (not c!100610)) b!992107))

(declare-fun m!919299 () Bool)

(assert (=> b!992107 m!919299))

(declare-fun m!919301 () Bool)

(assert (=> b!992107 m!919301))

(assert (=> b!992049 d!117911))

(check-sat (not b!992081) (not d!117875) (not b!992087) (not b!992107) (not d!117881))
(check-sat)
