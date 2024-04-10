; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72148 () Bool)

(assert start!72148)

(declare-fun res!569219 () Bool)

(declare-fun e!466937 () Bool)

(assert (=> start!72148 (=> (not res!569219) (not e!466937))))

(declare-datatypes ((List!16009 0))(
  ( (Nil!16006) (Cons!16005 (h!17136 (_ BitVec 64)) (t!22380 List!16009)) )
))
(declare-fun l!404 () List!16009)

(declare-fun length!29 (List!16009) Int)

(assert (=> start!72148 (= res!569219 (< (length!29 l!404) 2147483647))))

(assert (=> start!72148 e!466937))

(assert (=> start!72148 true))

(declare-fun b!836819 () Bool)

(declare-fun res!569220 () Bool)

(assert (=> b!836819 (=> (not res!569220) (not e!466937))))

(assert (=> b!836819 (= res!569220 (is-Cons!16005 l!404))))

(declare-fun b!836820 () Bool)

(assert (=> b!836820 (= e!466937 (>= (length!29 (t!22380 l!404)) 2147483647))))

(assert (= (and start!72148 res!569219) b!836819))

(assert (= (and b!836819 res!569220) b!836820))

(declare-fun m!781925 () Bool)

(assert (=> start!72148 m!781925))

(declare-fun m!781927 () Bool)

(assert (=> b!836820 m!781927))

(push 1)

(assert (not b!836820))

(assert (not start!72148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107733 () Bool)

(declare-fun size!22906 (List!16009) Int)

(assert (=> d!107733 (= (length!29 (t!22380 l!404)) (size!22906 (t!22380 l!404)))))

(declare-fun bs!23525 () Bool)

(assert (= bs!23525 d!107733))

(declare-fun m!781937 () Bool)

(assert (=> bs!23525 m!781937))

(assert (=> b!836820 d!107733))

(declare-fun d!107735 () Bool)

(assert (=> d!107735 (= (length!29 l!404) (size!22906 l!404))))

(declare-fun bs!23526 () Bool)

(assert (= bs!23526 d!107735))

(declare-fun m!781939 () Bool)

(assert (=> bs!23526 m!781939))

(assert (=> start!72148 d!107735))

(push 1)

(assert (not d!107735))

(assert (not d!107733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107745 () Bool)

(declare-fun lt!380484 () Int)

(assert (=> d!107745 (>= lt!380484 0)))

(declare-fun e!466949 () Int)

(assert (=> d!107745 (= lt!380484 e!466949)))

(declare-fun c!91117 () Bool)

(assert (=> d!107745 (= c!91117 (is-Nil!16006 l!404))))

(assert (=> d!107745 (= (size!22906 l!404) lt!380484)))

(declare-fun b!836843 () Bool)

(assert (=> b!836843 (= e!466949 0)))

(declare-fun b!836844 () Bool)

(assert (=> b!836844 (= e!466949 (+ 1 (size!22906 (t!22380 l!404))))))

(assert (= (and d!107745 c!91117) b!836843))

(assert (= (and d!107745 (not c!91117)) b!836844))

(assert (=> b!836844 m!781937))

(assert (=> d!107735 d!107745))

(declare-fun d!107753 () Bool)

(declare-fun lt!380486 () Int)

(assert (=> d!107753 (>= lt!380486 0)))

(declare-fun e!466951 () Int)

(assert (=> d!107753 (= lt!380486 e!466951)))

(declare-fun c!91119 () Bool)

(assert (=> d!107753 (= c!91119 (is-Nil!16006 (t!22380 l!404)))))

(assert (=> d!107753 (= (size!22906 (t!22380 l!404)) lt!380486)))

(declare-fun b!836847 () Bool)

(assert (=> b!836847 (= e!466951 0)))

(declare-fun b!836848 () Bool)

(assert (=> b!836848 (= e!466951 (+ 1 (size!22906 (t!22380 (t!22380 l!404)))))))

(assert (= (and d!107753 c!91119) b!836847))

(assert (= (and d!107753 (not c!91119)) b!836848))

(declare-fun m!781951 () Bool)

(assert (=> b!836848 m!781951))

(assert (=> d!107733 d!107753))

(push 1)

