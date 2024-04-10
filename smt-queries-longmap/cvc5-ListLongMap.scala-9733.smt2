; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115280 () Bool)

(assert start!115280)

(declare-fun res!908158 () Bool)

(declare-fun e!773863 () Bool)

(assert (=> start!115280 (=> (not res!908158) (not e!773863))))

(declare-datatypes ((List!31848 0))(
  ( (Nil!31845) (Cons!31844 (h!33053 (_ BitVec 64)) (t!46542 List!31848)) )
))
(declare-datatypes ((tuple2!24388 0))(
  ( (tuple2!24389 (_1!12205 (_ BitVec 64)) (_2!12205 List!31848)) )
))
(declare-datatypes ((Option!789 0))(
  ( (Some!788 (v!21588 tuple2!24388)) (None!787) )
))
(declare-fun lt!601093 () Option!789)

(declare-fun isEmpty!1113 (Option!789) Bool)

(assert (=> start!115280 (= res!908158 (not (isEmpty!1113 lt!601093)))))

(declare-fun l!3677 () List!31848)

(declare-fun unapply!55 (List!31848) Option!789)

(assert (=> start!115280 (= lt!601093 (unapply!55 l!3677))))

(assert (=> start!115280 e!773863))

(assert (=> start!115280 true))

(declare-fun b!1364560 () Bool)

(declare-fun ListPrimitiveSize!172 (List!31848) Int)

(declare-fun get!22712 (Option!789) tuple2!24388)

(assert (=> b!1364560 (= e!773863 (>= (ListPrimitiveSize!172 (_2!12205 (get!22712 lt!601093))) (ListPrimitiveSize!172 l!3677)))))

(assert (= (and start!115280 res!908158) b!1364560))

(declare-fun m!1249333 () Bool)

(assert (=> start!115280 m!1249333))

(declare-fun m!1249335 () Bool)

(assert (=> start!115280 m!1249335))

(declare-fun m!1249337 () Bool)

(assert (=> b!1364560 m!1249337))

(declare-fun m!1249339 () Bool)

(assert (=> b!1364560 m!1249339))

(declare-fun m!1249341 () Bool)

(assert (=> b!1364560 m!1249341))

(push 1)

(assert (not start!115280))

(assert (not b!1364560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146479 () Bool)

(assert (=> d!146479 (= (isEmpty!1113 lt!601093) (not (is-Some!788 lt!601093)))))

(assert (=> start!115280 d!146479))

(declare-fun d!146483 () Bool)

(assert (=> d!146483 (= (unapply!55 l!3677) (ite (is-Nil!31845 l!3677) None!787 (Some!788 (tuple2!24389 (h!33053 l!3677) (t!46542 l!3677)))))))

(assert (=> start!115280 d!146483))

(declare-fun d!146487 () Bool)

(declare-fun lt!601109 () Int)

(assert (=> d!146487 (>= lt!601109 0)))

(declare-fun e!773879 () Int)

(assert (=> d!146487 (= lt!601109 e!773879)))

(declare-fun c!127650 () Bool)

(assert (=> d!146487 (= c!127650 (is-Nil!31845 (_2!12205 (get!22712 lt!601093))))))

(assert (=> d!146487 (= (ListPrimitiveSize!172 (_2!12205 (get!22712 lt!601093))) lt!601109)))

(declare-fun b!1364585 () Bool)

(assert (=> b!1364585 (= e!773879 0)))

(declare-fun b!1364586 () Bool)

(assert (=> b!1364586 (= e!773879 (+ 1 (ListPrimitiveSize!172 (t!46542 (_2!12205 (get!22712 lt!601093))))))))

(assert (= (and d!146487 c!127650) b!1364585))

(assert (= (and d!146487 (not c!127650)) b!1364586))

(declare-fun m!1249369 () Bool)

(assert (=> b!1364586 m!1249369))

(assert (=> b!1364560 d!146487))

(declare-fun d!146499 () Bool)

(assert (=> d!146499 (= (get!22712 lt!601093) (v!21588 lt!601093))))

(assert (=> b!1364560 d!146499))

(declare-fun d!146503 () Bool)

(declare-fun lt!601111 () Int)

(assert (=> d!146503 (>= lt!601111 0)))

(declare-fun e!773881 () Int)

(assert (=> d!146503 (= lt!601111 e!773881)))

(declare-fun c!127652 () Bool)

(assert (=> d!146503 (= c!127652 (is-Nil!31845 l!3677))))

(assert (=> d!146503 (= (ListPrimitiveSize!172 l!3677) lt!601111)))

(declare-fun b!1364589 () Bool)

(assert (=> b!1364589 (= e!773881 0)))

(declare-fun b!1364590 () Bool)

(assert (=> b!1364590 (= e!773881 (+ 1 (ListPrimitiveSize!172 (t!46542 l!3677))))))

(assert (= (and d!146503 c!127652) b!1364589))

(assert (= (and d!146503 (not c!127652)) b!1364590))

(declare-fun m!1249373 () Bool)

(assert (=> b!1364590 m!1249373))

(assert (=> b!1364560 d!146503))

(push 1)

