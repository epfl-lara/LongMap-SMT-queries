; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72130 () Bool)

(assert start!72130)

(declare-datatypes ((List!16005 0))(
  ( (Nil!16002) (Cons!16001 (h!17132 (_ BitVec 64)) (t!22376 List!16005)) )
))
(declare-fun l!632 () List!16005)

(declare-fun ListPrimitiveSize!75 (List!16005) Int)

(assert (=> start!72130 (< (ListPrimitiveSize!75 l!632) 0)))

(assert (=> start!72130 true))

(declare-fun bs!23518 () Bool)

(assert (= bs!23518 start!72130))

(declare-fun m!781901 () Bool)

(assert (=> bs!23518 m!781901))

(push 1)

(assert (not start!72130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107719 () Bool)

(declare-fun lt!380470 () Int)

(assert (=> d!107719 (>= lt!380470 0)))

(declare-fun e!466917 () Int)

(assert (=> d!107719 (= lt!380470 e!466917)))

