; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115260 () Bool)

(assert start!115260)

(declare-datatypes ((List!31898 0))(
  ( (Nil!31895) (Cons!31894 (h!33103 (_ BitVec 64)) (t!46584 List!31898)) )
))
(declare-fun l!3677 () List!31898)

(declare-fun ListPrimitiveSize!169 (List!31898) Int)

(assert (=> start!115260 (< (ListPrimitiveSize!169 l!3677) 0)))

(assert (=> start!115260 true))

(declare-fun bs!39113 () Bool)

(assert (= bs!39113 start!115260))

(declare-fun m!1248805 () Bool)

(assert (=> bs!39113 m!1248805))

(check-sat (not start!115260))
(check-sat)
(get-model)

(declare-fun d!146343 () Bool)

(declare-fun lt!600900 () Int)

(assert (=> d!146343 (>= lt!600900 0)))

(declare-fun e!773823 () Int)

(assert (=> d!146343 (= lt!600900 e!773823)))

(declare-fun c!127618 () Bool)

(get-info :version)

(assert (=> d!146343 (= c!127618 ((_ is Nil!31895) l!3677))))

(assert (=> d!146343 (= (ListPrimitiveSize!169 l!3677) lt!600900)))

(declare-fun b!1364478 () Bool)

(assert (=> b!1364478 (= e!773823 0)))

(declare-fun b!1364479 () Bool)

(assert (=> b!1364479 (= e!773823 (+ 1 (ListPrimitiveSize!169 (t!46584 l!3677))))))

(assert (= (and d!146343 c!127618) b!1364478))

(assert (= (and d!146343 (not c!127618)) b!1364479))

(declare-fun m!1248811 () Bool)

(assert (=> b!1364479 m!1248811))

(assert (=> start!115260 d!146343))

(check-sat (not b!1364479))
(check-sat)
