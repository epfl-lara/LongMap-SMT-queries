; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85358 () Bool)

(assert start!85358)

(declare-fun res!663754 () Bool)

(declare-fun e!560391 () Bool)

(assert (=> start!85358 (=> (not res!663754) (not e!560391))))

(declare-datatypes ((List!20914 0))(
  ( (Nil!20911) (Cons!20910 (h!22072 (_ BitVec 64)) (t!29915 List!20914)) )
))
(declare-fun l!3519 () List!20914)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5775 (List!20914 (_ BitVec 64)) Bool)

(assert (=> start!85358 (= res!663754 (not (contains!5775 l!3519 e!29)))))

(assert (=> start!85358 e!560391))

(assert (=> start!85358 true))

(declare-fun b!993119 () Bool)

(declare-fun res!663755 () Bool)

(assert (=> b!993119 (=> (not res!663755) (not e!560391))))

(declare-datatypes ((tuple2!15006 0))(
  ( (tuple2!15007 (_1!7514 (_ BitVec 64)) (_2!7514 List!20914)) )
))
(declare-datatypes ((Option!558 0))(
  ( (Some!557 (v!14388 tuple2!15006)) (None!556) )
))
(declare-fun isEmpty!765 (Option!558) Bool)

(declare-fun unapply!37 (List!20914) Option!558)

(assert (=> b!993119 (= res!663755 (isEmpty!765 (unapply!37 l!3519)))))

(declare-fun b!993120 () Bool)

(declare-fun res!663756 () Bool)

(assert (=> b!993120 (=> (not res!663756) (not e!560391))))

(assert (=> b!993120 (= res!663756 (is-Nil!20911 l!3519))))

(declare-fun b!993121 () Bool)

(declare-fun -!453 (List!20914 (_ BitVec 64)) List!20914)

(assert (=> b!993121 (= e!560391 (not (= (-!453 l!3519 e!29) l!3519)))))

(assert (= (and start!85358 res!663754) b!993119))

(assert (= (and b!993119 res!663755) b!993120))

(assert (= (and b!993120 res!663756) b!993121))

(declare-fun m!920887 () Bool)

(assert (=> start!85358 m!920887))

(declare-fun m!920889 () Bool)

(assert (=> b!993119 m!920889))

(assert (=> b!993119 m!920889))

(declare-fun m!920891 () Bool)

(assert (=> b!993119 m!920891))

(declare-fun m!920893 () Bool)

(assert (=> b!993121 m!920893))

(push 1)

(assert (not b!993121))

(assert (not start!85358))

(assert (not b!993119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!993170 () Bool)

(declare-fun e!560420 () List!20914)

(assert (=> b!993170 (= e!560420 Nil!20911)))

(declare-fun d!118455 () Bool)

(declare-fun e!560421 () Bool)

(assert (=> d!118455 e!560421))

(declare-fun res!663781 () Bool)

(assert (=> d!118455 (=> (not res!663781) (not e!560421))))

(declare-fun lt!440462 () List!20914)

(declare-fun size!30696 (List!20914) Int)

(assert (=> d!118455 (= res!663781 (<= (size!30696 lt!440462) (size!30696 l!3519)))))

(assert (=> d!118455 (= lt!440462 e!560420)))

(declare-fun c!100833 () Bool)

(assert (=> d!118455 (= c!100833 (is-Cons!20910 l!3519))))

(assert (=> d!118455 (= (-!453 l!3519 e!29) lt!440462)))

(declare-fun b!993171 () Bool)

(declare-fun content!467 (List!20914) (Set (_ BitVec 64)))

(assert (=> b!993171 (= e!560421 (= (content!467 lt!440462) (set.minus (content!467 l!3519) (set.insert e!29 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!993172 () Bool)

(declare-fun e!560419 () List!20914)

(assert (=> b!993172 (= e!560420 e!560419)))

(declare-fun c!100832 () Bool)

(assert (=> b!993172 (= c!100832 (= e!29 (h!22072 l!3519)))))

(declare-fun b!993173 () Bool)

(declare-fun call!42140 () List!20914)

(assert (=> b!993173 (= e!560419 (Cons!20910 (h!22072 l!3519) call!42140))))

(declare-fun b!993174 () Bool)

(assert (=> b!993174 (= e!560419 call!42140)))

(declare-fun bm!42137 () Bool)

(assert (=> bm!42137 (= call!42140 (-!453 (t!29915 l!3519) e!29))))

(assert (= (and d!118455 c!100833) b!993172))

(assert (= (and d!118455 (not c!100833)) b!993170))

(assert (= (and b!993172 c!100832) b!993174))

(assert (= (and b!993172 (not c!100832)) b!993173))

(assert (= (or b!993174 b!993173) bm!42137))

(assert (= (and d!118455 res!663781) b!993171))

(declare-fun m!920911 () Bool)

(assert (=> d!118455 m!920911))

(declare-fun m!920913 () Bool)

(assert (=> d!118455 m!920913))

(declare-fun m!920915 () Bool)

(assert (=> b!993171 m!920915))

(declare-fun m!920917 () Bool)

(assert (=> b!993171 m!920917))

(declare-fun m!920919 () Bool)

(assert (=> b!993171 m!920919))

(declare-fun m!920921 () Bool)

(assert (=> bm!42137 m!920921))

(assert (=> b!993121 d!118455))

(declare-fun d!118461 () Bool)

(declare-fun lt!440471 () Bool)

(assert (=> d!118461 (= lt!440471 (set.member e!29 (content!467 l!3519)))))

(declare-fun e!560441 () Bool)

(assert (=> d!118461 (= lt!440471 e!560441)))

(declare-fun res!663796 () Bool)

(assert (=> d!118461 (=> (not res!663796) (not e!560441))))

(assert (=> d!118461 (= res!663796 (is-Cons!20910 l!3519))))

(assert (=> d!118461 (= (contains!5775 l!3519 e!29) lt!440471)))

(declare-fun b!993197 () Bool)

(declare-fun e!560440 () Bool)

(assert (=> b!993197 (= e!560441 e!560440)))

(declare-fun res!663797 () Bool)

(assert (=> b!993197 (=> res!663797 e!560440)))

(assert (=> b!993197 (= res!663797 (= (h!22072 l!3519) e!29))))

(declare-fun b!993198 () Bool)

(assert (=> b!993198 (= e!560440 (contains!5775 (t!29915 l!3519) e!29))))

(assert (= (and d!118461 res!663796) b!993197))

(assert (= (and b!993197 (not res!663797)) b!993198))

(assert (=> d!118461 m!920917))

(declare-fun m!920947 () Bool)

(assert (=> d!118461 m!920947))

(declare-fun m!920949 () Bool)

(assert (=> b!993198 m!920949))

(assert (=> start!85358 d!118461))

(declare-fun d!118467 () Bool)

(assert (=> d!118467 (= (isEmpty!765 (unapply!37 l!3519)) (not (is-Some!557 (unapply!37 l!3519))))))

(assert (=> b!993119 d!118467))

(declare-fun d!118469 () Bool)

(assert (=> d!118469 (= (unapply!37 l!3519) (ite (is-Nil!20911 l!3519) None!556 (Some!557 (tuple2!15007 (h!22072 l!3519) (t!29915 l!3519)))))))

(assert (=> b!993119 d!118469))

(push 1)

