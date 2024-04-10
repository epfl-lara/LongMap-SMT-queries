; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115272 () Bool)

(assert start!115272)

(declare-datatypes ((List!31847 0))(
  ( (Nil!31844) (Cons!31843 (h!33052 (_ BitVec 64)) (t!46541 List!31847)) )
))
(declare-fun l!3677 () List!31847)

(declare-fun ListPrimitiveSize!171 (List!31847) Int)

(assert (=> start!115272 (< (ListPrimitiveSize!171 l!3677) 0)))

(assert (=> start!115272 true))

(declare-fun bs!39143 () Bool)

(assert (= bs!39143 start!115272))

(declare-fun m!1249325 () Bool)

(assert (=> bs!39143 m!1249325))

(push 1)

(assert (not start!115272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146471 () Bool)

(declare-fun lt!601089 () Int)

(assert (=> d!146471 (>= lt!601089 0)))

(declare-fun e!773859 () Int)

(assert (=> d!146471 (= lt!601089 e!773859)))

(declare-fun c!127639 () Bool)

(assert (=> d!146471 (= c!127639 (is-Nil!31844 l!3677))))

(assert (=> d!146471 (= (ListPrimitiveSize!171 l!3677) lt!601089)))

(declare-fun b!1364554 () Bool)

(assert (=> b!1364554 (= e!773859 0)))

(declare-fun b!1364555 () Bool)

(assert (=> b!1364555 (= e!773859 (+ 1 (ListPrimitiveSize!171 (t!46541 l!3677))))))

(assert (= (and d!146471 c!127639) b!1364554))

(assert (= (and d!146471 (not c!127639)) b!1364555))

(declare-fun m!1249329 () Bool)

(assert (=> b!1364555 m!1249329))

(assert (=> start!115272 d!146471))

(push 1)

