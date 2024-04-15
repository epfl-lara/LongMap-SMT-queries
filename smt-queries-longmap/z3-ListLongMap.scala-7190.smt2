; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92152 () Bool)

(assert start!92152)

(declare-fun res!697144 () Bool)

(declare-fun e!594256 () Bool)

(assert (=> start!92152 (=> (not res!697144) (not e!594256))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65936 0))(
  ( (array!65937 (arr!31710 (Array (_ BitVec 32) (_ BitVec 64))) (size!32248 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65936)

(assert (=> start!92152 (= res!697144 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32248 a!3488)) (bvslt (size!32248 a!3488) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!32248 a!3488))))))

(assert (=> start!92152 e!594256))

(assert (=> start!92152 true))

(declare-fun array_inv!24493 (array!65936) Bool)

(assert (=> start!92152 (array_inv!24493 a!3488)))

(declare-fun b!1047896 () Bool)

(declare-fun res!697142 () Bool)

(assert (=> b!1047896 (=> (not res!697142) (not e!594256))))

(declare-datatypes ((List!22081 0))(
  ( (Nil!22078) (Cons!22077 (h!23286 (_ BitVec 64)) (t!31379 List!22081)) )
))
(declare-fun noDuplicate!1501 (List!22081) Bool)

(assert (=> b!1047896 (= res!697142 (noDuplicate!1501 Nil!22078))))

(declare-fun b!1047897 () Bool)

(declare-fun e!594257 () Bool)

(assert (=> b!1047897 (= e!594256 e!594257)))

(declare-fun res!697143 () Bool)

(assert (=> b!1047897 (=> res!697143 e!594257)))

(declare-fun contains!6073 (List!22081 (_ BitVec 64)) Bool)

(assert (=> b!1047897 (= res!697143 (contains!6073 Nil!22078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047898 () Bool)

(assert (=> b!1047898 (= e!594257 (contains!6073 Nil!22078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92152 res!697144) b!1047896))

(assert (= (and b!1047896 res!697142) b!1047897))

(assert (= (and b!1047897 (not res!697143)) b!1047898))

(declare-fun m!968461 () Bool)

(assert (=> start!92152 m!968461))

(declare-fun m!968463 () Bool)

(assert (=> b!1047896 m!968463))

(declare-fun m!968465 () Bool)

(assert (=> b!1047897 m!968465))

(declare-fun m!968467 () Bool)

(assert (=> b!1047898 m!968467))

(check-sat (not b!1047897) (not b!1047898) (not start!92152) (not b!1047896))
(check-sat)
(get-model)

(declare-fun d!127467 () Bool)

(declare-fun lt!462901 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!526 (List!22081) (InoxSet (_ BitVec 64)))

(assert (=> d!127467 (= lt!462901 (select (content!526 Nil!22078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!594281 () Bool)

(assert (=> d!127467 (= lt!462901 e!594281)))

(declare-fun res!697168 () Bool)

(assert (=> d!127467 (=> (not res!697168) (not e!594281))))

(get-info :version)

(assert (=> d!127467 (= res!697168 ((_ is Cons!22077) Nil!22078))))

(assert (=> d!127467 (= (contains!6073 Nil!22078 #b0000000000000000000000000000000000000000000000000000000000000000) lt!462901)))

(declare-fun b!1047921 () Bool)

(declare-fun e!594282 () Bool)

(assert (=> b!1047921 (= e!594281 e!594282)))

(declare-fun res!697167 () Bool)

(assert (=> b!1047921 (=> res!697167 e!594282)))

(assert (=> b!1047921 (= res!697167 (= (h!23286 Nil!22078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047922 () Bool)

(assert (=> b!1047922 (= e!594282 (contains!6073 (t!31379 Nil!22078) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!127467 res!697168) b!1047921))

(assert (= (and b!1047921 (not res!697167)) b!1047922))

(declare-fun m!968485 () Bool)

(assert (=> d!127467 m!968485))

(declare-fun m!968487 () Bool)

(assert (=> d!127467 m!968487))

(declare-fun m!968489 () Bool)

(assert (=> b!1047922 m!968489))

(assert (=> b!1047897 d!127467))

(declare-fun d!127469 () Bool)

(declare-fun lt!462902 () Bool)

(assert (=> d!127469 (= lt!462902 (select (content!526 Nil!22078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!594283 () Bool)

(assert (=> d!127469 (= lt!462902 e!594283)))

(declare-fun res!697170 () Bool)

(assert (=> d!127469 (=> (not res!697170) (not e!594283))))

(assert (=> d!127469 (= res!697170 ((_ is Cons!22077) Nil!22078))))

(assert (=> d!127469 (= (contains!6073 Nil!22078 #b1000000000000000000000000000000000000000000000000000000000000000) lt!462902)))

(declare-fun b!1047923 () Bool)

(declare-fun e!594284 () Bool)

(assert (=> b!1047923 (= e!594283 e!594284)))

(declare-fun res!697169 () Bool)

(assert (=> b!1047923 (=> res!697169 e!594284)))

(assert (=> b!1047923 (= res!697169 (= (h!23286 Nil!22078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1047924 () Bool)

(assert (=> b!1047924 (= e!594284 (contains!6073 (t!31379 Nil!22078) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!127469 res!697170) b!1047923))

(assert (= (and b!1047923 (not res!697169)) b!1047924))

(assert (=> d!127469 m!968485))

(declare-fun m!968491 () Bool)

(assert (=> d!127469 m!968491))

(declare-fun m!968493 () Bool)

(assert (=> b!1047924 m!968493))

(assert (=> b!1047898 d!127469))

(declare-fun d!127473 () Bool)

(assert (=> d!127473 (= (array_inv!24493 a!3488) (bvsge (size!32248 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92152 d!127473))

(declare-fun d!127475 () Bool)

(declare-fun res!697185 () Bool)

(declare-fun e!594299 () Bool)

(assert (=> d!127475 (=> res!697185 e!594299)))

(assert (=> d!127475 (= res!697185 ((_ is Nil!22078) Nil!22078))))

(assert (=> d!127475 (= (noDuplicate!1501 Nil!22078) e!594299)))

(declare-fun b!1047939 () Bool)

(declare-fun e!594300 () Bool)

(assert (=> b!1047939 (= e!594299 e!594300)))

(declare-fun res!697186 () Bool)

(assert (=> b!1047939 (=> (not res!697186) (not e!594300))))

(assert (=> b!1047939 (= res!697186 (not (contains!6073 (t!31379 Nil!22078) (h!23286 Nil!22078))))))

(declare-fun b!1047940 () Bool)

(assert (=> b!1047940 (= e!594300 (noDuplicate!1501 (t!31379 Nil!22078)))))

(assert (= (and d!127475 (not res!697185)) b!1047939))

(assert (= (and b!1047939 res!697186) b!1047940))

(declare-fun m!968499 () Bool)

(assert (=> b!1047939 m!968499))

(declare-fun m!968501 () Bool)

(assert (=> b!1047940 m!968501))

(assert (=> b!1047896 d!127475))

(check-sat (not b!1047924) (not b!1047922) (not d!127467) (not d!127469) (not b!1047939) (not b!1047940))
(check-sat)
