; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72166 () Bool)

(assert start!72166)

(declare-fun res!569136 () Bool)

(declare-fun e!466828 () Bool)

(assert (=> start!72166 (=> (not res!569136) (not e!466828))))

(declare-datatypes ((List!16014 0))(
  ( (Nil!16011) (Cons!16010 (h!17141 (_ BitVec 64)) (t!22376 List!16014)) )
))
(declare-fun l!404 () List!16014)

(declare-fun length!35 (List!16014) Int)

(assert (=> start!72166 (= res!569136 (< (length!35 l!404) 2147483647))))

(assert (=> start!72166 e!466828))

(assert (=> start!72166 true))

(declare-fun b!836649 () Bool)

(declare-fun res!569137 () Bool)

(assert (=> b!836649 (=> (not res!569137) (not e!466828))))

(get-info :version)

(assert (=> b!836649 (= res!569137 ((_ is Cons!16010) l!404))))

(declare-fun b!836650 () Bool)

(declare-fun ListPrimitiveSize!82 (List!16014) Int)

(assert (=> b!836650 (= e!466828 (>= (ListPrimitiveSize!82 (t!22376 l!404)) (ListPrimitiveSize!82 l!404)))))

(assert (= (and start!72166 res!569136) b!836649))

(assert (= (and b!836649 res!569137) b!836650))

(declare-fun m!781223 () Bool)

(assert (=> start!72166 m!781223))

(declare-fun m!781225 () Bool)

(assert (=> b!836650 m!781225))

(declare-fun m!781227 () Bool)

(assert (=> b!836650 m!781227))

(check-sat (not b!836650) (not start!72166))
(check-sat)
(get-model)

(declare-fun d!107575 () Bool)

(declare-fun lt!380268 () Int)

(assert (=> d!107575 (>= lt!380268 0)))

(declare-fun e!466839 () Int)

(assert (=> d!107575 (= lt!380268 e!466839)))

(declare-fun c!91072 () Bool)

(assert (=> d!107575 (= c!91072 ((_ is Nil!16011) (t!22376 l!404)))))

(assert (=> d!107575 (= (ListPrimitiveSize!82 (t!22376 l!404)) lt!380268)))

(declare-fun b!836671 () Bool)

(assert (=> b!836671 (= e!466839 0)))

(declare-fun b!836672 () Bool)

(assert (=> b!836672 (= e!466839 (+ 1 (ListPrimitiveSize!82 (t!22376 (t!22376 l!404)))))))

(assert (= (and d!107575 c!91072) b!836671))

(assert (= (and d!107575 (not c!91072)) b!836672))

(declare-fun m!781243 () Bool)

(assert (=> b!836672 m!781243))

(assert (=> b!836650 d!107575))

(declare-fun d!107583 () Bool)

(declare-fun lt!380272 () Int)

(assert (=> d!107583 (>= lt!380272 0)))

(declare-fun e!466841 () Int)

(assert (=> d!107583 (= lt!380272 e!466841)))

(declare-fun c!91074 () Bool)

(assert (=> d!107583 (= c!91074 ((_ is Nil!16011) l!404))))

(assert (=> d!107583 (= (ListPrimitiveSize!82 l!404) lt!380272)))

(declare-fun b!836677 () Bool)

(assert (=> b!836677 (= e!466841 0)))

(declare-fun b!836678 () Bool)

(assert (=> b!836678 (= e!466841 (+ 1 (ListPrimitiveSize!82 (t!22376 l!404))))))

(assert (= (and d!107583 c!91074) b!836677))

(assert (= (and d!107583 (not c!91074)) b!836678))

(assert (=> b!836678 m!781225))

(assert (=> b!836650 d!107583))

(declare-fun d!107587 () Bool)

(declare-fun size!22899 (List!16014) Int)

(assert (=> d!107587 (= (length!35 l!404) (size!22899 l!404))))

(declare-fun bs!23507 () Bool)

(assert (= bs!23507 d!107587))

(declare-fun m!781247 () Bool)

(assert (=> bs!23507 m!781247))

(assert (=> start!72166 d!107587))

(check-sat (not b!836678) (not d!107587) (not b!836672))
(check-sat)
