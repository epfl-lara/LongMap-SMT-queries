; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72166 () Bool)

(assert start!72166)

(declare-fun res!569235 () Bool)

(declare-fun e!466958 () Bool)

(assert (=> start!72166 (=> (not res!569235) (not e!466958))))

(declare-datatypes ((List!16012 0))(
  ( (Nil!16009) (Cons!16008 (h!17139 (_ BitVec 64)) (t!22383 List!16012)) )
))
(declare-fun l!404 () List!16012)

(declare-fun length!32 (List!16012) Int)

(assert (=> start!72166 (= res!569235 (< (length!32 l!404) 2147483647))))

(assert (=> start!72166 e!466958))

(assert (=> start!72166 true))

(declare-fun b!836859 () Bool)

(declare-fun ListPrimitiveSize!79 (List!16012) Int)

(assert (=> b!836859 (= e!466958 (< (ListPrimitiveSize!79 l!404) 0))))

(assert (= (and start!72166 res!569235) b!836859))

(declare-fun m!781955 () Bool)

(assert (=> start!72166 m!781955))

(declare-fun m!781957 () Bool)

(assert (=> b!836859 m!781957))

(push 1)

(assert (not b!836859))

(assert (not start!72166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107761 () Bool)

(declare-fun lt!380495 () Int)

(assert (=> d!107761 (>= lt!380495 0)))

(declare-fun e!466969 () Int)

(assert (=> d!107761 (= lt!380495 e!466969)))

(declare-fun c!91128 () Bool)

(assert (=> d!107761 (= c!91128 (is-Nil!16009 l!404))))

(assert (=> d!107761 (= (ListPrimitiveSize!79 l!404) lt!380495)))

(declare-fun b!836874 () Bool)

(assert (=> b!836874 (= e!466969 0)))

(declare-fun b!836875 () Bool)

(assert (=> b!836875 (= e!466969 (+ 1 (ListPrimitiveSize!79 (t!22383 l!404))))))

(assert (= (and d!107761 c!91128) b!836874))

(assert (= (and d!107761 (not c!91128)) b!836875))

(declare-fun m!781969 () Bool)

(assert (=> b!836875 m!781969))

(assert (=> b!836859 d!107761))

(declare-fun d!107767 () Bool)

(declare-fun size!22910 (List!16012) Int)

(assert (=> d!107767 (= (length!32 l!404) (size!22910 l!404))))

(declare-fun bs!23535 () Bool)

(assert (= bs!23535 d!107767))

(declare-fun m!781973 () Bool)

(assert (=> bs!23535 m!781973))

(assert (=> start!72166 d!107767))

(push 1)

(assert (not d!107767))

(assert (not b!836875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

