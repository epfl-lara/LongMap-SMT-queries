; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84964 () Bool)

(assert start!84964)

(declare-fun res!663195 () Bool)

(declare-fun e!559722 () Bool)

(assert (=> start!84964 (=> (not res!663195) (not e!559722))))

(declare-datatypes ((List!20879 0))(
  ( (Nil!20876) (Cons!20875 (h!22037 (_ BitVec 64)) (t!29865 List!20879)) )
))
(declare-fun tail!21 () List!20879)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5740 (List!20879 (_ BitVec 64)) Bool)

(assert (=> start!84964 (= res!663195 (not (contains!5740 tail!21 head!726)))))

(assert (=> start!84964 e!559722))

(assert (=> start!84964 true))

(declare-fun b!992242 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!434 (List!20879) (InoxSet (_ BitVec 64)))

(assert (=> b!992242 (= e!559722 (select (content!434 tail!21) head!726))))

(assert (= (and start!84964 res!663195) b!992242))

(declare-fun m!919951 () Bool)

(assert (=> start!84964 m!919951))

(declare-fun m!919953 () Bool)

(assert (=> b!992242 m!919953))

(declare-fun m!919955 () Bool)

(assert (=> b!992242 m!919955))

(check-sat (not start!84964) (not b!992242))
(check-sat)
(get-model)

(declare-fun d!118063 () Bool)

(declare-fun lt!440116 () Bool)

(assert (=> d!118063 (= lt!440116 (select (content!434 tail!21) head!726))))

(declare-fun e!559742 () Bool)

(assert (=> d!118063 (= lt!440116 e!559742)))

(declare-fun res!663215 () Bool)

(assert (=> d!118063 (=> (not res!663215) (not e!559742))))

(get-info :version)

(assert (=> d!118063 (= res!663215 ((_ is Cons!20875) tail!21))))

(assert (=> d!118063 (= (contains!5740 tail!21 head!726) lt!440116)))

(declare-fun b!992262 () Bool)

(declare-fun e!559743 () Bool)

(assert (=> b!992262 (= e!559742 e!559743)))

(declare-fun res!663216 () Bool)

(assert (=> b!992262 (=> res!663216 e!559743)))

(assert (=> b!992262 (= res!663216 (= (h!22037 tail!21) head!726))))

(declare-fun b!992263 () Bool)

(assert (=> b!992263 (= e!559743 (contains!5740 (t!29865 tail!21) head!726))))

(assert (= (and d!118063 res!663215) b!992262))

(assert (= (and b!992262 (not res!663216)) b!992263))

(assert (=> d!118063 m!919953))

(assert (=> d!118063 m!919955))

(declare-fun m!919967 () Bool)

(assert (=> b!992263 m!919967))

(assert (=> start!84964 d!118063))

(declare-fun d!118069 () Bool)

(declare-fun c!100669 () Bool)

(assert (=> d!118069 (= c!100669 ((_ is Nil!20876) tail!21))))

(declare-fun e!559752 () (InoxSet (_ BitVec 64)))

(assert (=> d!118069 (= (content!434 tail!21) e!559752)))

(declare-fun b!992279 () Bool)

(assert (=> b!992279 (= e!559752 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!992281 () Bool)

(assert (=> b!992281 (= e!559752 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22037 tail!21) true) (content!434 (t!29865 tail!21))))))

(assert (= (and d!118069 c!100669) b!992279))

(assert (= (and d!118069 (not c!100669)) b!992281))

(declare-fun m!919973 () Bool)

(assert (=> b!992281 m!919973))

(declare-fun m!919979 () Bool)

(assert (=> b!992281 m!919979))

(assert (=> b!992242 d!118069))

(check-sat (not b!992281) (not d!118063) (not b!992263))
(check-sat)
