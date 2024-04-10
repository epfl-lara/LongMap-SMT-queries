; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115284 () Bool)

(assert start!115284)

(declare-fun res!908164 () Bool)

(declare-fun e!773869 () Bool)

(assert (=> start!115284 (=> (not res!908164) (not e!773869))))

(declare-datatypes ((List!31850 0))(
  ( (Nil!31847) (Cons!31846 (h!33055 (_ BitVec 64)) (t!46544 List!31850)) )
))
(declare-datatypes ((tuple2!24392 0))(
  ( (tuple2!24393 (_1!12207 (_ BitVec 64)) (_2!12207 List!31850)) )
))
(declare-datatypes ((Option!791 0))(
  ( (Some!790 (v!21590 tuple2!24392)) (None!789) )
))
(declare-fun lt!601099 () Option!791)

(declare-fun isEmpty!1115 (Option!791) Bool)

(assert (=> start!115284 (= res!908164 (not (isEmpty!1115 lt!601099)))))

(declare-fun l!3677 () List!31850)

(declare-fun unapply!57 (List!31850) Option!791)

(assert (=> start!115284 (= lt!601099 (unapply!57 l!3677))))

(assert (=> start!115284 e!773869))

(assert (=> start!115284 true))

(declare-fun b!1364566 () Bool)

(declare-fun ListPrimitiveSize!174 (List!31850) Int)

(declare-fun get!22714 (Option!791) tuple2!24392)

(assert (=> b!1364566 (= e!773869 (>= (ListPrimitiveSize!174 (_2!12207 (get!22714 lt!601099))) (ListPrimitiveSize!174 l!3677)))))

(assert (= (and start!115284 res!908164) b!1364566))

(declare-fun m!1249353 () Bool)

(assert (=> start!115284 m!1249353))

(declare-fun m!1249355 () Bool)

(assert (=> start!115284 m!1249355))

(declare-fun m!1249357 () Bool)

(assert (=> b!1364566 m!1249357))

(declare-fun m!1249359 () Bool)

(assert (=> b!1364566 m!1249359))

(declare-fun m!1249361 () Bool)

(assert (=> b!1364566 m!1249361))

(push 1)

(assert (not b!1364566))

(assert (not start!115284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146477 () Bool)

(declare-fun lt!601102 () Int)

(assert (=> d!146477 (>= lt!601102 0)))

(declare-fun e!773872 () Int)

(assert (=> d!146477 (= lt!601102 e!773872)))

(declare-fun c!127643 () Bool)

(assert (=> d!146477 (= c!127643 (is-Nil!31847 (_2!12207 (get!22714 lt!601099))))))

(assert (=> d!146477 (= (ListPrimitiveSize!174 (_2!12207 (get!22714 lt!601099))) lt!601102)))

(declare-fun b!1364571 () Bool)

(assert (=> b!1364571 (= e!773872 0)))

(declare-fun b!1364572 () Bool)

(assert (=> b!1364572 (= e!773872 (+ 1 (ListPrimitiveSize!174 (t!46544 (_2!12207 (get!22714 lt!601099))))))))

(assert (= (and d!146477 c!127643) b!1364571))

(assert (= (and d!146477 (not c!127643)) b!1364572))

(declare-fun m!1249363 () Bool)

(assert (=> b!1364572 m!1249363))

(assert (=> b!1364566 d!146477))

(declare-fun d!146489 () Bool)

(assert (=> d!146489 (= (get!22714 lt!601099) (v!21590 lt!601099))))

(assert (=> b!1364566 d!146489))

(declare-fun d!146491 () Bool)

(declare-fun lt!601107 () Int)

(assert (=> d!146491 (>= lt!601107 0)))

(declare-fun e!773877 () Int)

(assert (=> d!146491 (= lt!601107 e!773877)))

(declare-fun c!127648 () Bool)

(assert (=> d!146491 (= c!127648 (is-Nil!31847 l!3677))))

(assert (=> d!146491 (= (ListPrimitiveSize!174 l!3677) lt!601107)))

(declare-fun b!1364581 () Bool)

(assert (=> b!1364581 (= e!773877 0)))

(declare-fun b!1364582 () Bool)

(assert (=> b!1364582 (= e!773877 (+ 1 (ListPrimitiveSize!174 (t!46544 l!3677))))))

(assert (= (and d!146491 c!127648) b!1364581))

(assert (= (and d!146491 (not c!127648)) b!1364582))

(declare-fun m!1249365 () Bool)

(assert (=> b!1364582 m!1249365))

(assert (=> b!1364566 d!146491))

(declare-fun d!146493 () Bool)

(assert (=> d!146493 (= (isEmpty!1115 lt!601099) (not (is-Some!790 lt!601099)))))

(assert (=> start!115284 d!146493))

(declare-fun d!146495 () Bool)

(assert (=> d!146495 (= (unapply!57 l!3677) (ite (is-Nil!31847 l!3677) None!789 (Some!790 (tuple2!24393 (h!33055 l!3677) (t!46544 l!3677)))))))

