; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115268 () Bool)

(assert start!115268)

(declare-datatypes ((List!31845 0))(
  ( (Nil!31842) (Cons!31841 (h!33050 (_ BitVec 64)) (t!46539 List!31845)) )
))
(declare-fun l!3677 () List!31845)

(declare-fun ListPrimitiveSize!169 (List!31845) Int)

(assert (=> start!115268 (< (ListPrimitiveSize!169 l!3677) 0)))

(assert (=> start!115268 true))

(declare-fun bs!39141 () Bool)

(assert (= bs!39141 start!115268))

(declare-fun m!1249321 () Bool)

(assert (=> bs!39141 m!1249321))

(push 1)

(assert (not start!115268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146469 () Bool)

(declare-fun lt!601090 () Int)

(assert (=> d!146469 (>= lt!601090 0)))

(declare-fun e!773860 () Int)

(assert (=> d!146469 (= lt!601090 e!773860)))

(declare-fun c!127640 () Bool)

(assert (=> d!146469 (= c!127640 (is-Nil!31842 l!3677))))

(assert (=> d!146469 (= (ListPrimitiveSize!169 l!3677) lt!601090)))

(declare-fun b!1364556 () Bool)

(assert (=> b!1364556 (= e!773860 0)))

(declare-fun b!1364557 () Bool)

(assert (=> b!1364557 (= e!773860 (+ 1 (ListPrimitiveSize!169 (t!46539 l!3677))))))

(assert (= (and d!146469 c!127640) b!1364556))

(assert (= (and d!146469 (not c!127640)) b!1364557))

(declare-fun m!1249331 () Bool)

(assert (=> b!1364557 m!1249331))

(assert (=> start!115268 d!146469))

(push 1)

