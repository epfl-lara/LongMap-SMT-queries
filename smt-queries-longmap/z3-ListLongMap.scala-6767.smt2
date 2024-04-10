; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84916 () Bool)

(assert start!84916)

(declare-fun res!663135 () Bool)

(declare-fun e!559664 () Bool)

(assert (=> start!84916 (=> (not res!663135) (not e!559664))))

(declare-datatypes ((List!20873 0))(
  ( (Nil!20870) (Cons!20869 (h!22031 (_ BitVec 64)) (t!29856 List!20873)) )
))
(declare-fun tail!21 () List!20873)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5734 (List!20873 (_ BitVec 64)) Bool)

(assert (=> start!84916 (= res!663135 (not (contains!5734 tail!21 head!726)))))

(assert (=> start!84916 e!559664))

(assert (=> start!84916 true))

(declare-fun b!992162 () Bool)

(declare-fun res!663133 () Bool)

(assert (=> b!992162 (=> (not res!663133) (not e!559664))))

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!428 (List!20873) (InoxSet (_ BitVec 64)))

(assert (=> b!992162 (= res!663133 (not (select (content!428 tail!21) head!726)))))

(declare-fun b!992163 () Bool)

(declare-fun e!559665 () Bool)

(assert (=> b!992163 (= e!559664 e!559665)))

(declare-fun res!663134 () Bool)

(assert (=> b!992163 (=> (not res!663134) (not e!559665))))

(declare-datatypes ((tuple2!14936 0))(
  ( (tuple2!14937 (_1!7479 (_ BitVec 64)) (_2!7479 List!20873)) )
))
(declare-datatypes ((Option!523 0))(
  ( (Some!522 (v!14317 tuple2!14936)) (None!521) )
))
(declare-fun lt!440077 () Option!523)

(declare-fun isEmpty!730 (Option!523) Bool)

(assert (=> b!992163 (= res!663134 (not (isEmpty!730 lt!440077)))))

(declare-fun unapply!2 (List!20873) Option!523)

(declare-fun $colon$colon!559 (List!20873 (_ BitVec 64)) List!20873)

(assert (=> b!992163 (= lt!440077 (unapply!2 ($colon$colon!559 tail!21 head!726)))))

(declare-fun b!992164 () Bool)

(declare-fun isDefined!387 (Option!523) Bool)

(assert (=> b!992164 (= e!559665 (not (isDefined!387 lt!440077)))))

(assert (= (and start!84916 res!663135) b!992162))

(assert (= (and b!992162 res!663133) b!992163))

(assert (= (and b!992163 res!663134) b!992164))

(declare-fun m!919851 () Bool)

(assert (=> start!84916 m!919851))

(declare-fun m!919853 () Bool)

(assert (=> b!992162 m!919853))

(declare-fun m!919855 () Bool)

(assert (=> b!992162 m!919855))

(declare-fun m!919857 () Bool)

(assert (=> b!992163 m!919857))

(declare-fun m!919859 () Bool)

(assert (=> b!992163 m!919859))

(assert (=> b!992163 m!919859))

(declare-fun m!919861 () Bool)

(assert (=> b!992163 m!919861))

(declare-fun m!919863 () Bool)

(assert (=> b!992164 m!919863))

(check-sat (not b!992162) (not start!84916) (not b!992164) (not b!992163))
(check-sat)
(get-model)

(declare-fun d!118019 () Bool)

(declare-fun c!100654 () Bool)

(get-info :version)

(assert (=> d!118019 (= c!100654 ((_ is Nil!20870) tail!21))))

(declare-fun e!559682 () (InoxSet (_ BitVec 64)))

(assert (=> d!118019 (= (content!428 tail!21) e!559682)))

(declare-fun b!992186 () Bool)

(assert (=> b!992186 (= e!559682 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992187 () Bool)

(assert (=> b!992187 (= e!559682 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22031 tail!21) true) (content!428 (t!29856 tail!21))))))

(assert (= (and d!118019 c!100654) b!992186))

(assert (= (and d!118019 (not c!100654)) b!992187))

(declare-fun m!919879 () Bool)

(assert (=> b!992187 m!919879))

(declare-fun m!919881 () Bool)

(assert (=> b!992187 m!919881))

(assert (=> b!992162 d!118019))

(declare-fun d!118025 () Bool)

(declare-fun lt!440089 () Bool)

(assert (=> d!118025 (= lt!440089 (select (content!428 tail!21) head!726))))

(declare-fun e!559691 () Bool)

(assert (=> d!118025 (= lt!440089 e!559691)))

(declare-fun res!663161 () Bool)

(assert (=> d!118025 (=> (not res!663161) (not e!559691))))

(assert (=> d!118025 (= res!663161 ((_ is Cons!20869) tail!21))))

(assert (=> d!118025 (= (contains!5734 tail!21 head!726) lt!440089)))

(declare-fun b!992196 () Bool)

(declare-fun e!559692 () Bool)

(assert (=> b!992196 (= e!559691 e!559692)))

(declare-fun res!663162 () Bool)

(assert (=> b!992196 (=> res!663162 e!559692)))

(assert (=> b!992196 (= res!663162 (= (h!22031 tail!21) head!726))))

(declare-fun b!992197 () Bool)

(assert (=> b!992197 (= e!559692 (contains!5734 (t!29856 tail!21) head!726))))

(assert (= (and d!118025 res!663161) b!992196))

(assert (= (and b!992196 (not res!663162)) b!992197))

(assert (=> d!118025 m!919853))

(assert (=> d!118025 m!919855))

(declare-fun m!919887 () Bool)

(assert (=> b!992197 m!919887))

(assert (=> start!84916 d!118025))

(declare-fun d!118039 () Bool)

(assert (=> d!118039 (= (isDefined!387 lt!440077) (not (isEmpty!730 lt!440077)))))

(declare-fun bs!28209 () Bool)

(assert (= bs!28209 d!118039))

(assert (=> bs!28209 m!919857))

(assert (=> b!992164 d!118039))

(declare-fun d!118045 () Bool)

(assert (=> d!118045 (= (isEmpty!730 lt!440077) (not ((_ is Some!522) lt!440077)))))

(assert (=> b!992163 d!118045))

(declare-fun d!118051 () Bool)

(assert (=> d!118051 (= (unapply!2 ($colon$colon!559 tail!21 head!726)) (ite ((_ is Nil!20870) ($colon$colon!559 tail!21 head!726)) None!521 (Some!522 (tuple2!14937 (h!22031 ($colon$colon!559 tail!21 head!726)) (t!29856 ($colon$colon!559 tail!21 head!726))))))))

(assert (=> b!992163 d!118051))

(declare-fun d!118053 () Bool)

(assert (=> d!118053 (= ($colon$colon!559 tail!21 head!726) (Cons!20869 head!726 tail!21))))

(assert (=> b!992163 d!118053))

(check-sat (not d!118025) (not d!118039) (not b!992187) (not b!992197))
(check-sat)
