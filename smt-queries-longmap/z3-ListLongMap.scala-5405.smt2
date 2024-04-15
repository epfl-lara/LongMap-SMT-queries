; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72130 () Bool)

(assert start!72130)

(declare-fun res!569109 () Bool)

(declare-fun e!466789 () Bool)

(assert (=> start!72130 (=> (not res!569109) (not e!466789))))

(declare-datatypes ((List!16008 0))(
  ( (Nil!16005) (Cons!16004 (h!17135 (_ BitVec 64)) (t!22370 List!16008)) )
))
(declare-fun l!404 () List!16008)

(declare-fun length!29 (List!16008) Int)

(assert (=> start!72130 (= res!569109 (< (length!29 l!404) 2147483647))))

(assert (=> start!72130 e!466789))

(assert (=> start!72130 true))

(declare-fun b!836580 () Bool)

(declare-fun res!569110 () Bool)

(assert (=> b!836580 (=> (not res!569110) (not e!466789))))

(get-info :version)

(assert (=> b!836580 (= res!569110 ((_ is Cons!16004) l!404))))

(declare-fun b!836581 () Bool)

(assert (=> b!836581 (= e!466789 (>= (length!29 (t!22370 l!404)) 2147483647))))

(assert (= (and start!72130 res!569109) b!836580))

(assert (= (and b!836580 res!569110) b!836581))

(declare-fun m!781169 () Bool)

(assert (=> start!72130 m!781169))

(declare-fun m!781171 () Bool)

(assert (=> b!836581 m!781171))

(check-sat (not b!836581) (not start!72130))
(check-sat)
(get-model)

(declare-fun d!107535 () Bool)

(declare-fun size!22891 (List!16008) Int)

(assert (=> d!107535 (= (length!29 (t!22370 l!404)) (size!22891 (t!22370 l!404)))))

(declare-fun bs!23491 () Bool)

(assert (= bs!23491 d!107535))

(declare-fun m!781181 () Bool)

(assert (=> bs!23491 m!781181))

(assert (=> b!836581 d!107535))

(declare-fun d!107541 () Bool)

(assert (=> d!107541 (= (length!29 l!404) (size!22891 l!404))))

(declare-fun bs!23493 () Bool)

(assert (= bs!23493 d!107541))

(declare-fun m!781185 () Bool)

(assert (=> bs!23493 m!781185))

(assert (=> start!72130 d!107541))

(check-sat (not d!107541) (not d!107535))
(check-sat)
(get-model)

(declare-fun d!107547 () Bool)

(declare-fun lt!380249 () Int)

(assert (=> d!107547 (>= lt!380249 0)))

(declare-fun e!466802 () Int)

(assert (=> d!107547 (= lt!380249 e!466802)))

(declare-fun c!91053 () Bool)

(assert (=> d!107547 (= c!91053 ((_ is Nil!16005) l!404))))

(assert (=> d!107547 (= (size!22891 l!404) lt!380249)))

(declare-fun b!836606 () Bool)

(assert (=> b!836606 (= e!466802 0)))

(declare-fun b!836607 () Bool)

(assert (=> b!836607 (= e!466802 (+ 1 (size!22891 (t!22370 l!404))))))

(assert (= (and d!107547 c!91053) b!836606))

(assert (= (and d!107547 (not c!91053)) b!836607))

(assert (=> b!836607 m!781181))

(assert (=> d!107541 d!107547))

(declare-fun d!107553 () Bool)

(declare-fun lt!380251 () Int)

(assert (=> d!107553 (>= lt!380251 0)))

(declare-fun e!466804 () Int)

(assert (=> d!107553 (= lt!380251 e!466804)))

(declare-fun c!91055 () Bool)

(assert (=> d!107553 (= c!91055 ((_ is Nil!16005) (t!22370 l!404)))))

(assert (=> d!107553 (= (size!22891 (t!22370 l!404)) lt!380251)))

(declare-fun b!836610 () Bool)

(assert (=> b!836610 (= e!466804 0)))

(declare-fun b!836611 () Bool)

(assert (=> b!836611 (= e!466804 (+ 1 (size!22891 (t!22370 (t!22370 l!404)))))))

(assert (= (and d!107553 c!91055) b!836610))

(assert (= (and d!107553 (not c!91055)) b!836611))

(declare-fun m!781195 () Bool)

(assert (=> b!836611 m!781195))

(assert (=> d!107535 d!107553))

(check-sat (not b!836611) (not b!836607))
(check-sat)
