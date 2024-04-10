; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115282 () Bool)

(assert start!115282)

(declare-fun res!908161 () Bool)

(declare-fun e!773866 () Bool)

(assert (=> start!115282 (=> (not res!908161) (not e!773866))))

(declare-datatypes ((List!31849 0))(
  ( (Nil!31846) (Cons!31845 (h!33054 (_ BitVec 64)) (t!46543 List!31849)) )
))
(declare-datatypes ((tuple2!24390 0))(
  ( (tuple2!24391 (_1!12206 (_ BitVec 64)) (_2!12206 List!31849)) )
))
(declare-datatypes ((Option!790 0))(
  ( (Some!789 (v!21589 tuple2!24390)) (None!788) )
))
(declare-fun lt!601096 () Option!790)

(declare-fun isEmpty!1114 (Option!790) Bool)

(assert (=> start!115282 (= res!908161 (not (isEmpty!1114 lt!601096)))))

(declare-fun l!3677 () List!31849)

(declare-fun unapply!56 (List!31849) Option!790)

(assert (=> start!115282 (= lt!601096 (unapply!56 l!3677))))

(assert (=> start!115282 e!773866))

(assert (=> start!115282 true))

(declare-fun b!1364563 () Bool)

(declare-fun ListPrimitiveSize!173 (List!31849) Int)

(declare-fun get!22713 (Option!790) tuple2!24390)

(assert (=> b!1364563 (= e!773866 (>= (ListPrimitiveSize!173 (_2!12206 (get!22713 lt!601096))) (ListPrimitiveSize!173 l!3677)))))

(assert (= (and start!115282 res!908161) b!1364563))

(declare-fun m!1249343 () Bool)

(assert (=> start!115282 m!1249343))

(declare-fun m!1249345 () Bool)

(assert (=> start!115282 m!1249345))

(declare-fun m!1249347 () Bool)

(assert (=> b!1364563 m!1249347))

(declare-fun m!1249349 () Bool)

(assert (=> b!1364563 m!1249349))

(declare-fun m!1249351 () Bool)

(assert (=> b!1364563 m!1249351))

(check-sat (not start!115282) (not b!1364563))
(check-sat)
(get-model)

(declare-fun d!146475 () Bool)

(get-info :version)

(assert (=> d!146475 (= (isEmpty!1114 lt!601096) (not ((_ is Some!789) lt!601096)))))

(assert (=> start!115282 d!146475))

(declare-fun d!146481 () Bool)

(assert (=> d!146481 (= (unapply!56 l!3677) (ite ((_ is Nil!31846) l!3677) None!788 (Some!789 (tuple2!24391 (h!33054 l!3677) (t!46543 l!3677)))))))

(assert (=> start!115282 d!146481))

(declare-fun d!146485 () Bool)

(declare-fun lt!601108 () Int)

(assert (=> d!146485 (>= lt!601108 0)))

(declare-fun e!773878 () Int)

(assert (=> d!146485 (= lt!601108 e!773878)))

(declare-fun c!127649 () Bool)

(assert (=> d!146485 (= c!127649 ((_ is Nil!31846) (_2!12206 (get!22713 lt!601096))))))

(assert (=> d!146485 (= (ListPrimitiveSize!173 (_2!12206 (get!22713 lt!601096))) lt!601108)))

(declare-fun b!1364583 () Bool)

(assert (=> b!1364583 (= e!773878 0)))

(declare-fun b!1364584 () Bool)

(assert (=> b!1364584 (= e!773878 (+ 1 (ListPrimitiveSize!173 (t!46543 (_2!12206 (get!22713 lt!601096))))))))

(assert (= (and d!146485 c!127649) b!1364583))

(assert (= (and d!146485 (not c!127649)) b!1364584))

(declare-fun m!1249367 () Bool)

(assert (=> b!1364584 m!1249367))

(assert (=> b!1364563 d!146485))

(declare-fun d!146497 () Bool)

(assert (=> d!146497 (= (get!22713 lt!601096) (v!21589 lt!601096))))

(assert (=> b!1364563 d!146497))

(declare-fun d!146501 () Bool)

(declare-fun lt!601110 () Int)

(assert (=> d!146501 (>= lt!601110 0)))

(declare-fun e!773880 () Int)

(assert (=> d!146501 (= lt!601110 e!773880)))

(declare-fun c!127651 () Bool)

(assert (=> d!146501 (= c!127651 ((_ is Nil!31846) l!3677))))

(assert (=> d!146501 (= (ListPrimitiveSize!173 l!3677) lt!601110)))

(declare-fun b!1364587 () Bool)

(assert (=> b!1364587 (= e!773880 0)))

(declare-fun b!1364588 () Bool)

(assert (=> b!1364588 (= e!773880 (+ 1 (ListPrimitiveSize!173 (t!46543 l!3677))))))

(assert (= (and d!146501 c!127651) b!1364587))

(assert (= (and d!146501 (not c!127651)) b!1364588))

(declare-fun m!1249371 () Bool)

(assert (=> b!1364588 m!1249371))

(assert (=> b!1364563 d!146501))

(check-sat (not b!1364584) (not b!1364588))
(check-sat)
