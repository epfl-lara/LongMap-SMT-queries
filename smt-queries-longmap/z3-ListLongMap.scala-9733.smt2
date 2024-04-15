; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115272 () Bool)

(assert start!115272)

(declare-fun res!908129 () Bool)

(declare-fun e!773830 () Bool)

(assert (=> start!115272 (=> (not res!908129) (not e!773830))))

(declare-datatypes ((List!31901 0))(
  ( (Nil!31898) (Cons!31897 (h!33106 (_ BitVec 64)) (t!46587 List!31901)) )
))
(declare-datatypes ((tuple2!24462 0))(
  ( (tuple2!24463 (_1!12242 (_ BitVec 64)) (_2!12242 List!31901)) )
))
(declare-datatypes ((Option!791 0))(
  ( (Some!790 (v!21587 tuple2!24462)) (None!789) )
))
(declare-fun lt!600907 () Option!791)

(declare-fun isEmpty!1118 (Option!791) Bool)

(assert (=> start!115272 (= res!908129 (not (isEmpty!1118 lt!600907)))))

(declare-fun l!3677 () List!31901)

(declare-fun unapply!55 (List!31901) Option!791)

(assert (=> start!115272 (= lt!600907 (unapply!55 l!3677))))

(assert (=> start!115272 e!773830))

(assert (=> start!115272 true))

(declare-fun b!1364490 () Bool)

(declare-fun ListPrimitiveSize!172 (List!31901) Int)

(declare-fun get!22712 (Option!791) tuple2!24462)

(assert (=> b!1364490 (= e!773830 (>= (ListPrimitiveSize!172 (_2!12242 (get!22712 lt!600907))) (ListPrimitiveSize!172 l!3677)))))

(assert (= (and start!115272 res!908129) b!1364490))

(declare-fun m!1248815 () Bool)

(assert (=> start!115272 m!1248815))

(declare-fun m!1248817 () Bool)

(assert (=> start!115272 m!1248817))

(declare-fun m!1248819 () Bool)

(assert (=> b!1364490 m!1248819))

(declare-fun m!1248821 () Bool)

(assert (=> b!1364490 m!1248821))

(declare-fun m!1248823 () Bool)

(assert (=> b!1364490 m!1248823))

(check-sat (not start!115272) (not b!1364490))
(check-sat)
(get-model)

(declare-fun d!146351 () Bool)

(get-info :version)

(assert (=> d!146351 (= (isEmpty!1118 lt!600907) (not ((_ is Some!790) lt!600907)))))

(assert (=> start!115272 d!146351))

(declare-fun d!146355 () Bool)

(assert (=> d!146355 (= (unapply!55 l!3677) (ite ((_ is Nil!31898) l!3677) None!789 (Some!790 (tuple2!24463 (h!33106 l!3677) (t!46587 l!3677)))))))

(assert (=> start!115272 d!146355))

(declare-fun d!146357 () Bool)

(declare-fun lt!600920 () Int)

(assert (=> d!146357 (>= lt!600920 0)))

(declare-fun e!773843 () Int)

(assert (=> d!146357 (= lt!600920 e!773843)))

(declare-fun c!127629 () Bool)

(assert (=> d!146357 (= c!127629 ((_ is Nil!31898) (_2!12242 (get!22712 lt!600907))))))

(assert (=> d!146357 (= (ListPrimitiveSize!172 (_2!12242 (get!22712 lt!600907))) lt!600920)))

(declare-fun b!1364509 () Bool)

(assert (=> b!1364509 (= e!773843 0)))

(declare-fun b!1364510 () Bool)

(assert (=> b!1364510 (= e!773843 (+ 1 (ListPrimitiveSize!172 (t!46587 (_2!12242 (get!22712 lt!600907))))))))

(assert (= (and d!146357 c!127629) b!1364509))

(assert (= (and d!146357 (not c!127629)) b!1364510))

(declare-fun m!1248849 () Bool)

(assert (=> b!1364510 m!1248849))

(assert (=> b!1364490 d!146357))

(declare-fun d!146365 () Bool)

(assert (=> d!146365 (= (get!22712 lt!600907) (v!21587 lt!600907))))

(assert (=> b!1364490 d!146365))

(declare-fun d!146369 () Bool)

(declare-fun lt!600921 () Int)

(assert (=> d!146369 (>= lt!600921 0)))

(declare-fun e!773844 () Int)

(assert (=> d!146369 (= lt!600921 e!773844)))

(declare-fun c!127630 () Bool)

(assert (=> d!146369 (= c!127630 ((_ is Nil!31898) l!3677))))

(assert (=> d!146369 (= (ListPrimitiveSize!172 l!3677) lt!600921)))

(declare-fun b!1364511 () Bool)

(assert (=> b!1364511 (= e!773844 0)))

(declare-fun b!1364512 () Bool)

(assert (=> b!1364512 (= e!773844 (+ 1 (ListPrimitiveSize!172 (t!46587 l!3677))))))

(assert (= (and d!146369 c!127630) b!1364511))

(assert (= (and d!146369 (not c!127630)) b!1364512))

(declare-fun m!1248851 () Bool)

(assert (=> b!1364512 m!1248851))

(assert (=> b!1364490 d!146369))

(check-sat (not b!1364512) (not b!1364510))
(check-sat)
