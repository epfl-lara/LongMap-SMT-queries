; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84966 () Bool)

(assert start!84966)

(declare-fun res!663198 () Bool)

(declare-fun e!559725 () Bool)

(assert (=> start!84966 (=> (not res!663198) (not e!559725))))

(declare-datatypes ((List!20880 0))(
  ( (Nil!20877) (Cons!20876 (h!22038 (_ BitVec 64)) (t!29866 List!20880)) )
))
(declare-fun tail!21 () List!20880)

(declare-fun head!726 () (_ BitVec 64))

(declare-fun contains!5741 (List!20880 (_ BitVec 64)) Bool)

(assert (=> start!84966 (= res!663198 (not (contains!5741 tail!21 head!726)))))

(assert (=> start!84966 e!559725))

(assert (=> start!84966 true))

(declare-fun b!992245 () Bool)

(declare-fun content!435 (List!20880) (Set (_ BitVec 64)))

(assert (=> b!992245 (= e!559725 (member head!726 (content!435 tail!21)))))

(assert (= (and start!84966 res!663198) b!992245))

(declare-fun m!919957 () Bool)

(assert (=> start!84966 m!919957))

(declare-fun m!919959 () Bool)

(assert (=> b!992245 m!919959))

(declare-fun m!919961 () Bool)

(assert (=> b!992245 m!919961))

(push 1)

(assert (not start!84966))

(assert (not b!992245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118059 () Bool)

(declare-fun lt!440114 () Bool)

(assert (=> d!118059 (= lt!440114 (member head!726 (content!435 tail!21)))))

(declare-fun e!559740 () Bool)

(assert (=> d!118059 (= lt!440114 e!559740)))

(declare-fun res!663211 () Bool)

(assert (=> d!118059 (=> (not res!663211) (not e!559740))))

(assert (=> d!118059 (= res!663211 (is-Cons!20876 tail!21))))

(assert (=> d!118059 (= (contains!5741 tail!21 head!726) lt!440114)))

(declare-fun b!992258 () Bool)

(declare-fun e!559738 () Bool)

(assert (=> b!992258 (= e!559740 e!559738)))

(declare-fun res!663212 () Bool)

(assert (=> b!992258 (=> res!663212 e!559738)))

(assert (=> b!992258 (= res!663212 (= (h!22038 tail!21) head!726))))

(declare-fun b!992259 () Bool)

(assert (=> b!992259 (= e!559738 (contains!5741 (t!29866 tail!21) head!726))))

(assert (= (and d!118059 res!663211) b!992258))

(assert (= (and b!992258 (not res!663212)) b!992259))

(assert (=> d!118059 m!919959))

(assert (=> d!118059 m!919961))

(declare-fun m!919964 () Bool)

(assert (=> b!992259 m!919964))

(assert (=> start!84966 d!118059))

(declare-fun d!118065 () Bool)

(declare-fun c!100667 () Bool)

(assert (=> d!118065 (= c!100667 (is-Nil!20877 tail!21))))

(declare-fun e!559750 () (Set (_ BitVec 64)))

(assert (=> d!118065 (= (content!435 tail!21) e!559750)))

(declare-fun b!992276 () Bool)

(assert (=> b!992276 (= e!559750 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!992277 () Bool)

(assert (=> b!992277 (= e!559750 (union (insert (h!22038 tail!21) (as emptyset (Set (_ BitVec 64)))) (content!435 (t!29866 tail!21))))))

