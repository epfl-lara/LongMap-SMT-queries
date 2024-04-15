; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84896 () Bool)

(assert start!84896)

(declare-fun res!663015 () Bool)

(declare-fun e!559511 () Bool)

(assert (=> start!84896 (=> (not res!663015) (not e!559511))))

(declare-datatypes ((List!20907 0))(
  ( (Nil!20904) (Cons!20903 (h!22065 (_ BitVec 64)) (t!29881 List!20907)) )
))
(declare-fun tail!21 () List!20907)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5706 (List!20907 (_ BitVec 64)) Bool)

(assert (=> start!84896 (= res!663015 (not (contains!5706 tail!21 head!726)))))

(assert (=> start!84896 e!559511))

(assert (=> start!84896 true))

(declare-fun b!991914 () Bool)

(declare-fun res!663014 () Bool)

(assert (=> b!991914 (=> (not res!663014) (not e!559511))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!425 (List!20907) (InoxSet (_ BitVec 64)))

(assert (=> b!991914 (= res!663014 (not (select (content!425 tail!21) head!726)))))

(declare-fun b!991915 () Bool)

(declare-fun e!559510 () Bool)

(assert (=> b!991915 (= e!559511 e!559510)))

(declare-fun res!663016 () Bool)

(assert (=> b!991915 (=> (not res!663016) (not e!559510))))

(declare-datatypes ((tuple2!15014 0))(
  ( (tuple2!15015 (_1!7518 (_ BitVec 64)) (_2!7518 List!20907)) )
))
(declare-datatypes ((Option!525 0))(
  ( (Some!524 (v!14315 tuple2!15014)) (None!523) )
))
(declare-fun lt!439838 () Option!525)

(declare-fun isEmpty!734 (Option!525) Bool)

(assert (=> b!991915 (= res!663016 (not (isEmpty!734 lt!439838)))))

(declare-fun unapply!1 (List!20907) Option!525)

(declare-fun $colon$colon!559 (List!20907 (_ BitVec 64)) List!20907)

(assert (=> b!991915 (= lt!439838 (unapply!1 ($colon$colon!559 tail!21 head!726)))))

(declare-fun b!991916 () Bool)

(declare-fun isDefined!389 (Option!525) Bool)

(assert (=> b!991916 (= e!559510 (not (isDefined!389 lt!439838)))))

(assert (= (and start!84896 res!663015) b!991914))

(assert (= (and b!991914 res!663014) b!991915))

(assert (= (and b!991915 res!663016) b!991916))

(declare-fun m!919079 () Bool)

(assert (=> start!84896 m!919079))

(declare-fun m!919081 () Bool)

(assert (=> b!991914 m!919081))

(declare-fun m!919083 () Bool)

(assert (=> b!991914 m!919083))

(declare-fun m!919085 () Bool)

(assert (=> b!991915 m!919085))

(declare-fun m!919087 () Bool)

(assert (=> b!991915 m!919087))

(assert (=> b!991915 m!919087))

(declare-fun m!919089 () Bool)

(assert (=> b!991915 m!919089))

(declare-fun m!919091 () Bool)

(assert (=> b!991916 m!919091))

(check-sat (not start!84896) (not b!991915) (not b!991914) (not b!991916))
(check-sat)
(get-model)

(declare-fun d!117823 () Bool)

(declare-fun lt!439849 () Bool)

(assert (=> d!117823 (= lt!439849 (select (content!425 tail!21) head!726))))

(declare-fun e!559536 () Bool)

(assert (=> d!117823 (= lt!439849 e!559536)))

(declare-fun res!663043 () Bool)

(assert (=> d!117823 (=> (not res!663043) (not e!559536))))

(get-info :version)

(assert (=> d!117823 (= res!663043 ((_ is Cons!20903) tail!21))))

(assert (=> d!117823 (= (contains!5706 tail!21 head!726) lt!439849)))

(declare-fun b!991949 () Bool)

(declare-fun e!559535 () Bool)

(assert (=> b!991949 (= e!559536 e!559535)))

(declare-fun res!663044 () Bool)

(assert (=> b!991949 (=> res!663044 e!559535)))

(assert (=> b!991949 (= res!663044 (= (h!22065 tail!21) head!726))))

(declare-fun b!991950 () Bool)

(assert (=> b!991950 (= e!559535 (contains!5706 (t!29881 tail!21) head!726))))

(assert (= (and d!117823 res!663043) b!991949))

(assert (= (and b!991949 (not res!663044)) b!991950))

(assert (=> d!117823 m!919081))

(assert (=> d!117823 m!919083))

(declare-fun m!919125 () Bool)

(assert (=> b!991950 m!919125))

(assert (=> start!84896 d!117823))

(declare-fun d!117833 () Bool)

(assert (=> d!117833 (= (isEmpty!734 lt!439838) (not ((_ is Some!524) lt!439838)))))

(assert (=> b!991915 d!117833))

(declare-fun d!117835 () Bool)

(assert (=> d!117835 (= (unapply!1 ($colon$colon!559 tail!21 head!726)) (ite ((_ is Nil!20904) ($colon$colon!559 tail!21 head!726)) None!523 (Some!524 (tuple2!15015 (h!22065 ($colon$colon!559 tail!21 head!726)) (t!29881 ($colon$colon!559 tail!21 head!726))))))))

(assert (=> b!991915 d!117835))

(declare-fun d!117841 () Bool)

(assert (=> d!117841 (= ($colon$colon!559 tail!21 head!726) (Cons!20903 head!726 tail!21))))

(assert (=> b!991915 d!117841))

(declare-fun d!117843 () Bool)

(declare-fun c!100594 () Bool)

(assert (=> d!117843 (= c!100594 ((_ is Nil!20904) tail!21))))

(declare-fun e!559549 () (InoxSet (_ BitVec 64)))

(assert (=> d!117843 (= (content!425 tail!21) e!559549)))

(declare-fun b!991967 () Bool)

(assert (=> b!991967 (= e!559549 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!991968 () Bool)

(assert (=> b!991968 (= e!559549 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22065 tail!21) true) (content!425 (t!29881 tail!21))))))

(assert (= (and d!117843 c!100594) b!991967))

(assert (= (and d!117843 (not c!100594)) b!991968))

(declare-fun m!919131 () Bool)

(assert (=> b!991968 m!919131))

(declare-fun m!919133 () Bool)

(assert (=> b!991968 m!919133))

(assert (=> b!991914 d!117843))

(declare-fun d!117853 () Bool)

(assert (=> d!117853 (= (isDefined!389 lt!439838) (not (isEmpty!734 lt!439838)))))

(declare-fun bs!28176 () Bool)

(assert (= bs!28176 d!117853))

(assert (=> bs!28176 m!919085))

(assert (=> b!991916 d!117853))

(check-sat (not b!991968) (not d!117853) (not b!991950) (not d!117823))
(check-sat)
