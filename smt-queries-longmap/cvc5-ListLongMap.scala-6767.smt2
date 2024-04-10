; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84914 () Bool)

(assert start!84914)

(declare-fun res!663125 () Bool)

(declare-fun e!559659 () Bool)

(assert (=> start!84914 (=> (not res!663125) (not e!559659))))

(declare-datatypes ((List!20872 0))(
  ( (Nil!20869) (Cons!20868 (h!22030 (_ BitVec 64)) (t!29855 List!20872)) )
))
(declare-fun tail!21 () List!20872)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5733 (List!20872 (_ BitVec 64)) Bool)

(assert (=> start!84914 (= res!663125 (not (contains!5733 tail!21 head!726)))))

(assert (=> start!84914 e!559659))

(assert (=> start!84914 true))

(declare-fun b!992153 () Bool)

(declare-fun res!663126 () Bool)

(assert (=> b!992153 (=> (not res!663126) (not e!559659))))

(declare-fun content!427 (List!20872) (Set (_ BitVec 64)))

(assert (=> b!992153 (= res!663126 (not (set.member head!726 (content!427 tail!21))))))

(declare-fun b!992154 () Bool)

(declare-fun e!559658 () Bool)

(assert (=> b!992154 (= e!559659 e!559658)))

(declare-fun res!663124 () Bool)

(assert (=> b!992154 (=> (not res!663124) (not e!559658))))

(declare-datatypes ((tuple2!14934 0))(
  ( (tuple2!14935 (_1!7478 (_ BitVec 64)) (_2!7478 List!20872)) )
))
(declare-datatypes ((Option!522 0))(
  ( (Some!521 (v!14316 tuple2!14934)) (None!520) )
))
(declare-fun lt!440074 () Option!522)

(declare-fun isEmpty!729 (Option!522) Bool)

(assert (=> b!992154 (= res!663124 (not (isEmpty!729 lt!440074)))))

(declare-fun unapply!1 (List!20872) Option!522)

(declare-fun $colon$colon!558 (List!20872 (_ BitVec 64)) List!20872)

(assert (=> b!992154 (= lt!440074 (unapply!1 ($colon$colon!558 tail!21 head!726)))))

(declare-fun b!992155 () Bool)

(declare-fun isDefined!386 (Option!522) Bool)

(assert (=> b!992155 (= e!559658 (not (isDefined!386 lt!440074)))))

(assert (= (and start!84914 res!663125) b!992153))

(assert (= (and b!992153 res!663126) b!992154))

(assert (= (and b!992154 res!663124) b!992155))

(declare-fun m!919837 () Bool)

(assert (=> start!84914 m!919837))

(declare-fun m!919839 () Bool)

(assert (=> b!992153 m!919839))

(declare-fun m!919841 () Bool)

(assert (=> b!992153 m!919841))

(declare-fun m!919843 () Bool)

(assert (=> b!992154 m!919843))

(declare-fun m!919845 () Bool)

(assert (=> b!992154 m!919845))

(assert (=> b!992154 m!919845))

(declare-fun m!919847 () Bool)

(assert (=> b!992154 m!919847))

(declare-fun m!919849 () Bool)

(assert (=> b!992155 m!919849))

(push 1)

(assert (not start!84914))

(assert (not b!992155))

(assert (not b!992154))

(assert (not b!992153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118023 () Bool)

(declare-fun lt!440086 () Bool)

(assert (=> d!118023 (= lt!440086 (set.member head!726 (content!427 tail!21)))))

(declare-fun e!559685 () Bool)

(assert (=> d!118023 (= lt!440086 e!559685)))

(declare-fun res!663156 () Bool)

(assert (=> d!118023 (=> (not res!663156) (not e!559685))))

(assert (=> d!118023 (= res!663156 (is-Cons!20868 tail!21))))

(assert (=> d!118023 (= (contains!5733 tail!21 head!726) lt!440086)))

(declare-fun b!992190 () Bool)

(declare-fun e!559686 () Bool)

(assert (=> b!992190 (= e!559685 e!559686)))

(declare-fun res!663155 () Bool)

(assert (=> b!992190 (=> res!663155 e!559686)))

(assert (=> b!992190 (= res!663155 (= (h!22030 tail!21) head!726))))

(declare-fun b!992191 () Bool)

(assert (=> b!992191 (= e!559686 (contains!5733 (t!29855 tail!21) head!726))))

(assert (= (and d!118023 res!663156) b!992190))

(assert (= (and b!992190 (not res!663155)) b!992191))

(assert (=> d!118023 m!919839))

(assert (=> d!118023 m!919841))

(declare-fun m!919885 () Bool)

(assert (=> b!992191 m!919885))

(assert (=> start!84914 d!118023))

(declare-fun d!118029 () Bool)

(assert (=> d!118029 (= (isDefined!386 lt!440074) (not (isEmpty!729 lt!440074)))))

(declare-fun bs!28208 () Bool)

(assert (= bs!28208 d!118029))

(assert (=> bs!28208 m!919843))

(assert (=> b!992155 d!118029))

(declare-fun d!118033 () Bool)

(assert (=> d!118033 (= (isEmpty!729 lt!440074) (not (is-Some!521 lt!440074)))))

(assert (=> b!992154 d!118033))

(declare-fun d!118037 () Bool)

(assert (=> d!118037 (= (unapply!1 ($colon$colon!558 tail!21 head!726)) (ite (is-Nil!20869 ($colon$colon!558 tail!21 head!726)) None!520 (Some!521 (tuple2!14935 (h!22030 ($colon$colon!558 tail!21 head!726)) (t!29855 ($colon$colon!558 tail!21 head!726))))))))

(assert (=> b!992154 d!118037))

(declare-fun d!118043 () Bool)

(assert (=> d!118043 (= ($colon$colon!558 tail!21 head!726) (Cons!20868 head!726 tail!21))))

(assert (=> b!992154 d!118043))

(declare-fun d!118049 () Bool)

(declare-fun c!100660 () Bool)

(assert (=> d!118049 (= c!100660 (is-Nil!20869 tail!21))))

(declare-fun e!559698 () (Set (_ BitVec 64)))

(assert (=> d!118049 (= (content!427 tail!21) e!559698)))

(declare-fun b!992208 () Bool)

(assert (=> b!992208 (= e!559698 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992209 () Bool)

(assert (=> b!992209 (= e!559698 (set.union (set.insert (h!22030 tail!21) (as set.empty (Set (_ BitVec 64)))) (content!427 (t!29855 tail!21))))))

(assert (= (and d!118049 c!100660) b!992208))

(assert (= (and d!118049 (not c!100660)) b!992209))

(declare-fun m!919893 () Bool)

(assert (=> b!992209 m!919893))

(declare-fun m!919895 () Bool)

(assert (=> b!992209 m!919895))

(assert (=> b!992153 d!118049))

(push 1)

