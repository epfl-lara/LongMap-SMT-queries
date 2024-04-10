; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72138 () Bool)

(assert start!72138)

(declare-fun res!569208 () Bool)

(declare-fun e!466920 () Bool)

(assert (=> start!72138 (=> (not res!569208) (not e!466920))))

(declare-datatypes ((List!16006 0))(
  ( (Nil!16003) (Cons!16002 (h!17133 (_ BitVec 64)) (t!22377 List!16006)) )
))
(declare-fun l!632 () List!16006)

(assert (=> start!72138 (= res!569208 (and (not (is-Nil!16003 l!632)) (not (is-Nil!16003 (t!22377 l!632))) (bvslt (h!17133 l!632) (h!17133 (t!22377 l!632)))))))

(assert (=> start!72138 e!466920))

(assert (=> start!72138 true))

(declare-fun b!836792 () Bool)

(declare-fun ListPrimitiveSize!76 (List!16006) Int)

(assert (=> b!836792 (= e!466920 (>= (ListPrimitiveSize!76 (t!22377 l!632)) (ListPrimitiveSize!76 l!632)))))

(assert (= (and start!72138 res!569208) b!836792))

(declare-fun m!781909 () Bool)

(assert (=> b!836792 m!781909))

(declare-fun m!781911 () Bool)

(assert (=> b!836792 m!781911))

(push 1)

(assert (not b!836792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107727 () Bool)

(declare-fun lt!380477 () Int)

(assert (=> d!107727 (>= lt!380477 0)))

(declare-fun e!466933 () Int)

(assert (=> d!107727 (= lt!380477 e!466933)))

(declare-fun c!91110 () Bool)

(assert (=> d!107727 (= c!91110 (is-Nil!16003 (t!22377 l!632)))))

(assert (=> d!107727 (= (ListPrimitiveSize!76 (t!22377 l!632)) lt!380477)))

(declare-fun b!836811 () Bool)

(assert (=> b!836811 (= e!466933 0)))

