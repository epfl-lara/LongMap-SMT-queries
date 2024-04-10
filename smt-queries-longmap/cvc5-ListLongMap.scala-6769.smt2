; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84962 () Bool)

(assert start!84962)

(declare-fun res!663192 () Bool)

(declare-fun e!559719 () Bool)

(assert (=> start!84962 (=> (not res!663192) (not e!559719))))

(declare-datatypes ((List!20878 0))(
  ( (Nil!20875) (Cons!20874 (h!22036 (_ BitVec 64)) (t!29864 List!20878)) )
))
(declare-fun tail!21 () List!20878)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5739 (List!20878 (_ BitVec 64)) Bool)

(assert (=> start!84962 (= res!663192 (not (contains!5739 tail!21 head!726)))))

(assert (=> start!84962 e!559719))

(assert (=> start!84962 true))

(declare-fun b!992239 () Bool)

(declare-fun content!433 (List!20878) (Set (_ BitVec 64)))

(assert (=> b!992239 (= e!559719 (set.member head!726 (content!433 tail!21)))))

(assert (= (and start!84962 res!663192) b!992239))

(declare-fun m!919945 () Bool)

(assert (=> start!84962 m!919945))

(declare-fun m!919947 () Bool)

(assert (=> b!992239 m!919947))

(declare-fun m!919949 () Bool)

(assert (=> b!992239 m!919949))

(push 1)

(assert (not start!84962))

(assert (not b!992239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118061 () Bool)

(declare-fun lt!440115 () Bool)

(assert (=> d!118061 (= lt!440115 (set.member head!726 (content!433 tail!21)))))

(declare-fun e!559741 () Bool)

(assert (=> d!118061 (= lt!440115 e!559741)))

(declare-fun res!663214 () Bool)

(assert (=> d!118061 (=> (not res!663214) (not e!559741))))

(assert (=> d!118061 (= res!663214 (is-Cons!20874 tail!21))))

(assert (=> d!118061 (= (contains!5739 tail!21 head!726) lt!440115)))

(declare-fun b!992260 () Bool)

(declare-fun e!559739 () Bool)

(assert (=> b!992260 (= e!559741 e!559739)))

(declare-fun res!663213 () Bool)

(assert (=> b!992260 (=> res!663213 e!559739)))

(assert (=> b!992260 (= res!663213 (= (h!22036 tail!21) head!726))))

(declare-fun b!992261 () Bool)

(assert (=> b!992261 (= e!559739 (contains!5739 (t!29864 tail!21) head!726))))

(assert (= (and d!118061 res!663214) b!992260))

(assert (= (and b!992260 (not res!663213)) b!992261))

(assert (=> d!118061 m!919947))

(assert (=> d!118061 m!919949))

(declare-fun m!919965 () Bool)

(assert (=> b!992261 m!919965))

(assert (=> start!84962 d!118061))

(declare-fun d!118067 () Bool)

(declare-fun c!100668 () Bool)

(assert (=> d!118067 (= c!100668 (is-Nil!20875 tail!21))))

(declare-fun e!559751 () (Set (_ BitVec 64)))

(assert (=> d!118067 (= (content!433 tail!21) e!559751)))

(declare-fun b!992278 () Bool)

(assert (=> b!992278 (= e!559751 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!992280 () Bool)

(assert (=> b!992280 (= e!559751 (set.union (set.insert (h!22036 tail!21) (as set.empty (Set (_ BitVec 64)))) (content!433 (t!29864 tail!21))))))

(assert (= (and d!118067 c!100668) b!992278))

(assert (= (and d!118067 (not c!100668)) b!992280))

(declare-fun m!919971 () Bool)

(assert (=> b!992280 m!919971))

(declare-fun m!919977 () Bool)

(assert (=> b!992280 m!919977))

(assert (=> b!992239 d!118067))

(push 1)

