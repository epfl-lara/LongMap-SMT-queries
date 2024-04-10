; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115270 () Bool)

(assert start!115270)

(declare-datatypes ((List!31846 0))(
  ( (Nil!31843) (Cons!31842 (h!33051 (_ BitVec 64)) (t!46540 List!31846)) )
))
(declare-fun l!3677 () List!31846)

(declare-fun ListPrimitiveSize!170 (List!31846) Int)

(assert (=> start!115270 (< (ListPrimitiveSize!170 l!3677) 0)))

(assert (=> start!115270 true))

(declare-fun bs!39142 () Bool)

(assert (= bs!39142 start!115270))

(declare-fun m!1249323 () Bool)

(assert (=> bs!39142 m!1249323))

(check-sat (not start!115270))
(check-sat)
(get-model)

(declare-fun d!146467 () Bool)

(declare-fun lt!601088 () Int)

(assert (=> d!146467 (>= lt!601088 0)))

(declare-fun e!773858 () Int)

(assert (=> d!146467 (= lt!601088 e!773858)))

(declare-fun c!127638 () Bool)

(get-info :version)

(assert (=> d!146467 (= c!127638 ((_ is Nil!31843) l!3677))))

(assert (=> d!146467 (= (ListPrimitiveSize!170 l!3677) lt!601088)))

(declare-fun b!1364552 () Bool)

(assert (=> b!1364552 (= e!773858 0)))

(declare-fun b!1364553 () Bool)

(assert (=> b!1364553 (= e!773858 (+ 1 (ListPrimitiveSize!170 (t!46540 l!3677))))))

(assert (= (and d!146467 c!127638) b!1364552))

(assert (= (and d!146467 (not c!127638)) b!1364553))

(declare-fun m!1249327 () Bool)

(assert (=> b!1364553 m!1249327))

(assert (=> start!115270 d!146467))

(check-sat (not b!1364553))
(check-sat)
