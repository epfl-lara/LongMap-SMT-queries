; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87702 () Bool)

(assert start!87702)

(declare-fun res!680689 () Bool)

(declare-fun e!570553 () Bool)

(assert (=> start!87702 (=> (not res!680689) (not e!570553))))

(declare-datatypes ((B!1430 0))(
  ( (B!1431 (val!11799 Int)) )
))
(declare-datatypes ((tuple2!15224 0))(
  ( (tuple2!15225 (_1!7623 (_ BitVec 64)) (_2!7623 B!1430)) )
))
(declare-datatypes ((List!21465 0))(
  ( (Nil!21462) (Cons!21461 (h!22659 tuple2!15224) (t!30457 List!21465)) )
))
(declare-fun l!412 () List!21465)

(declare-fun isStrictlySorted!569 (List!21465) Bool)

(assert (=> start!87702 (= res!680689 (isStrictlySorted!569 l!412))))

(assert (=> start!87702 e!570553))

(declare-fun e!570554 () Bool)

(assert (=> start!87702 e!570554))

(declare-fun tp_is_empty!23497 () Bool)

(assert (=> start!87702 tp_is_empty!23497))

(declare-fun b!1014218 () Bool)

(declare-fun res!680690 () Bool)

(assert (=> b!1014218 (=> (not res!680690) (not e!570553))))

(declare-fun value!115 () B!1430)

(get-info :version)

(assert (=> b!1014218 (= res!680690 (and (not (= (_2!7623 (h!22659 l!412)) value!115)) ((_ is Cons!21461) l!412)))))

(declare-fun b!1014219 () Bool)

(declare-fun ListPrimitiveSize!112 (List!21465) Int)

(assert (=> b!1014219 (= e!570553 (>= (ListPrimitiveSize!112 (t!30457 l!412)) (ListPrimitiveSize!112 l!412)))))

(declare-datatypes ((List!21466 0))(
  ( (Nil!21463) (Cons!21462 (h!22660 (_ BitVec 64)) (t!30458 List!21466)) )
))
(declare-fun lt!448285 () List!21466)

(declare-fun getKeysOf!46 (List!21465 B!1430) List!21466)

(assert (=> b!1014219 (= lt!448285 (getKeysOf!46 (t!30457 l!412) value!115))))

(declare-fun b!1014220 () Bool)

(declare-fun tp!70521 () Bool)

(assert (=> b!1014220 (= e!570554 (and tp_is_empty!23497 tp!70521))))

(assert (= (and start!87702 res!680689) b!1014218))

(assert (= (and b!1014218 res!680690) b!1014219))

(assert (= (and start!87702 ((_ is Cons!21461) l!412)) b!1014220))

(declare-fun m!936403 () Bool)

(assert (=> start!87702 m!936403))

(declare-fun m!936405 () Bool)

(assert (=> b!1014219 m!936405))

(declare-fun m!936407 () Bool)

(assert (=> b!1014219 m!936407))

(declare-fun m!936409 () Bool)

(assert (=> b!1014219 m!936409))

(check-sat (not start!87702) (not b!1014219) (not b!1014220) tp_is_empty!23497)
(check-sat)
(get-model)

(declare-fun d!120613 () Bool)

(declare-fun res!680713 () Bool)

(declare-fun e!570577 () Bool)

(assert (=> d!120613 (=> res!680713 e!570577)))

(assert (=> d!120613 (= res!680713 (or ((_ is Nil!21462) l!412) ((_ is Nil!21462) (t!30457 l!412))))))

(assert (=> d!120613 (= (isStrictlySorted!569 l!412) e!570577)))

(declare-fun b!1014249 () Bool)

(declare-fun e!570578 () Bool)

(assert (=> b!1014249 (= e!570577 e!570578)))

(declare-fun res!680714 () Bool)

(assert (=> b!1014249 (=> (not res!680714) (not e!570578))))

(assert (=> b!1014249 (= res!680714 (bvslt (_1!7623 (h!22659 l!412)) (_1!7623 (h!22659 (t!30457 l!412)))))))

(declare-fun b!1014250 () Bool)

(assert (=> b!1014250 (= e!570578 (isStrictlySorted!569 (t!30457 l!412)))))

(assert (= (and d!120613 (not res!680713)) b!1014249))

(assert (= (and b!1014249 res!680714) b!1014250))

(declare-fun m!936429 () Bool)

(assert (=> b!1014250 m!936429))

(assert (=> start!87702 d!120613))

(declare-fun d!120619 () Bool)

(declare-fun lt!448298 () Int)

(assert (=> d!120619 (>= lt!448298 0)))

(declare-fun e!570591 () Int)

(assert (=> d!120619 (= lt!448298 e!570591)))

(declare-fun c!102632 () Bool)

(assert (=> d!120619 (= c!102632 ((_ is Nil!21462) (t!30457 l!412)))))

(assert (=> d!120619 (= (ListPrimitiveSize!112 (t!30457 l!412)) lt!448298)))

(declare-fun b!1014269 () Bool)

(assert (=> b!1014269 (= e!570591 0)))

(declare-fun b!1014270 () Bool)

(assert (=> b!1014270 (= e!570591 (+ 1 (ListPrimitiveSize!112 (t!30457 (t!30457 l!412)))))))

(assert (= (and d!120619 c!102632) b!1014269))

(assert (= (and d!120619 (not c!102632)) b!1014270))

(declare-fun m!936435 () Bool)

(assert (=> b!1014270 m!936435))

(assert (=> b!1014219 d!120619))

(declare-fun d!120627 () Bool)

(declare-fun lt!448299 () Int)

(assert (=> d!120627 (>= lt!448299 0)))

(declare-fun e!570592 () Int)

(assert (=> d!120627 (= lt!448299 e!570592)))

(declare-fun c!102633 () Bool)

(assert (=> d!120627 (= c!102633 ((_ is Nil!21462) l!412))))

(assert (=> d!120627 (= (ListPrimitiveSize!112 l!412) lt!448299)))

(declare-fun b!1014271 () Bool)

(assert (=> b!1014271 (= e!570592 0)))

(declare-fun b!1014272 () Bool)

(assert (=> b!1014272 (= e!570592 (+ 1 (ListPrimitiveSize!112 (t!30457 l!412))))))

(assert (= (and d!120627 c!102633) b!1014271))

(assert (= (and d!120627 (not c!102633)) b!1014272))

(assert (=> b!1014272 m!936405))

(assert (=> b!1014219 d!120627))

(declare-fun b!1014342 () Bool)

(assert (=> b!1014342 true))

(assert (=> b!1014342 true))

(assert (=> b!1014342 true))

(declare-fun bs!29238 () Bool)

(declare-fun b!1014341 () Bool)

(assert (= bs!29238 (and b!1014341 b!1014342)))

(declare-fun lambda!702 () Int)

(declare-fun lt!448396 () tuple2!15224)

(declare-fun lambda!707 () Int)

(declare-fun lt!448397 () List!21465)

(declare-fun lt!448389 () List!21465)

(declare-fun lt!448390 () tuple2!15224)

(assert (=> bs!29238 (= (= (Cons!21461 lt!448390 lt!448397) (Cons!21461 lt!448396 lt!448389)) (= lambda!707 lambda!702))))

(assert (=> b!1014341 true))

(assert (=> b!1014341 true))

(assert (=> b!1014341 true))

(declare-fun bs!29240 () Bool)

(declare-fun d!120629 () Bool)

(assert (= bs!29240 (and d!120629 b!1014342)))

(declare-fun lambda!709 () Int)

(assert (=> bs!29240 (= (= (t!30457 l!412) (Cons!21461 lt!448396 lt!448389)) (= lambda!709 lambda!702))))

(declare-fun bs!29244 () Bool)

(assert (= bs!29244 (and d!120629 b!1014341)))

(assert (=> bs!29244 (= (= (t!30457 l!412) (Cons!21461 lt!448390 lt!448397)) (= lambda!709 lambda!707))))

(assert (=> d!120629 true))

(assert (=> d!120629 true))

(declare-fun b!1014337 () Bool)

(declare-datatypes ((Unit!33059 0))(
  ( (Unit!33060) )
))
(declare-fun e!570626 () Unit!33059)

(declare-fun Unit!33061 () Unit!33059)

(assert (=> b!1014337 (= e!570626 Unit!33061)))

(declare-fun b!1014338 () Bool)

(declare-fun e!570628 () List!21466)

(declare-fun e!570625 () List!21466)

(assert (=> b!1014338 (= e!570628 e!570625)))

(declare-fun c!102666 () Bool)

(assert (=> b!1014338 (= c!102666 (and ((_ is Cons!21461) (t!30457 l!412)) (not (= (_2!7623 (h!22659 (t!30457 l!412))) value!115))))))

(declare-fun bm!42780 () Bool)

(declare-fun call!42784 () Bool)

(declare-fun call!42785 () List!21466)

(declare-fun isEmpty!839 (List!21466) Bool)

(assert (=> bm!42780 (= call!42784 (isEmpty!839 call!42785))))

(declare-fun lt!448393 () List!21466)

(declare-fun lt!448391 () List!21466)

(declare-fun bm!42781 () Bool)

(declare-fun c!102669 () Bool)

(declare-fun call!42783 () Bool)

(declare-fun forall!242 (List!21466 Int) Bool)

(assert (=> bm!42781 (= call!42783 (forall!242 (ite c!102669 lt!448391 lt!448393) (ite c!102669 lambda!702 lambda!707)))))

(declare-fun lt!448395 () List!21466)

(assert (=> d!120629 (forall!242 lt!448395 lambda!709)))

(assert (=> d!120629 (= lt!448395 e!570628)))

(assert (=> d!120629 (= c!102669 (and ((_ is Cons!21461) (t!30457 l!412)) (= (_2!7623 (h!22659 (t!30457 l!412))) value!115)))))

(assert (=> d!120629 (isStrictlySorted!569 (t!30457 l!412))))

(assert (=> d!120629 (= (getKeysOf!46 (t!30457 l!412) value!115) lt!448395)))

(declare-fun b!1014339 () Bool)

(assert (=> b!1014339 (= e!570628 (Cons!21462 (_1!7623 (h!22659 (t!30457 l!412))) call!42785))))

(declare-fun c!102668 () Bool)

(assert (=> b!1014339 (= c!102668 (not call!42784))))

(declare-fun lt!448392 () Unit!33059)

(declare-fun e!570627 () Unit!33059)

(assert (=> b!1014339 (= lt!448392 e!570627)))

(declare-fun call!42786 () Unit!33059)

(declare-fun bm!42782 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!38 (List!21465 List!21466 B!1430 tuple2!15224) Unit!33059)

(assert (=> bm!42782 (= call!42786 (lemmaForallGetValueByKeySameWithASmallerHead!38 (ite c!102669 lt!448389 lt!448397) (ite c!102669 lt!448391 lt!448393) value!115 (ite c!102669 lt!448396 lt!448390)))))

(declare-fun b!1014340 () Bool)

(declare-fun lt!448394 () Unit!33059)

(assert (=> b!1014340 (= lt!448394 e!570626)))

(declare-fun c!102667 () Bool)

(assert (=> b!1014340 (= c!102667 (not call!42784))))

(declare-fun lt!448387 () List!21466)

(assert (=> b!1014340 (= lt!448387 call!42785)))

(assert (=> b!1014340 (= e!570625 call!42785)))

(declare-fun lt!448398 () Unit!33059)

(assert (=> b!1014341 (= e!570626 lt!448398)))

(assert (=> b!1014341 (= lt!448397 (t!30457 (t!30457 l!412)))))

(assert (=> b!1014341 (= lt!448393 call!42785)))

(assert (=> b!1014341 (= lt!448390 (h!22659 (t!30457 l!412)))))

(assert (=> b!1014341 (= lt!448398 call!42786)))

(assert (=> b!1014341 call!42783))

(declare-fun bm!42783 () Bool)

(assert (=> bm!42783 (= call!42785 (getKeysOf!46 (t!30457 (t!30457 l!412)) value!115))))

(assert (=> b!1014342 call!42783))

(declare-fun lt!448399 () Unit!33059)

(assert (=> b!1014342 (= lt!448399 call!42786)))

(assert (=> b!1014342 (= lt!448396 (h!22659 (t!30457 l!412)))))

(assert (=> b!1014342 (= lt!448391 call!42785)))

(assert (=> b!1014342 (= lt!448389 (t!30457 (t!30457 l!412)))))

(assert (=> b!1014342 (= e!570627 lt!448399)))

(declare-fun b!1014343 () Bool)

(assert (=> b!1014343 (= e!570625 Nil!21463)))

(declare-fun b!1014344 () Bool)

(declare-fun Unit!33067 () Unit!33059)

(assert (=> b!1014344 (= e!570627 Unit!33067)))

(assert (= (and d!120629 c!102669) b!1014339))

(assert (= (and d!120629 (not c!102669)) b!1014338))

(assert (= (and b!1014339 c!102668) b!1014342))

(assert (= (and b!1014339 (not c!102668)) b!1014344))

(assert (= (and b!1014338 c!102666) b!1014340))

(assert (= (and b!1014338 (not c!102666)) b!1014343))

(assert (= (and b!1014340 c!102667) b!1014341))

(assert (= (and b!1014340 (not c!102667)) b!1014337))

(assert (= (or b!1014342 b!1014341) bm!42782))

(assert (= (or b!1014342 b!1014341) bm!42781))

(assert (= (or b!1014339 b!1014342 b!1014340 b!1014341) bm!42783))

(assert (= (or b!1014339 b!1014340) bm!42780))

(declare-fun m!936459 () Bool)

(assert (=> bm!42782 m!936459))

(declare-fun m!936461 () Bool)

(assert (=> bm!42781 m!936461))

(declare-fun m!936463 () Bool)

(assert (=> bm!42780 m!936463))

(declare-fun m!936465 () Bool)

(assert (=> d!120629 m!936465))

(assert (=> d!120629 m!936429))

(declare-fun m!936467 () Bool)

(assert (=> bm!42783 m!936467))

(assert (=> b!1014219 d!120629))

(declare-fun b!1014385 () Bool)

(declare-fun e!570641 () Bool)

(declare-fun tp!70536 () Bool)

(assert (=> b!1014385 (= e!570641 (and tp_is_empty!23497 tp!70536))))

(assert (=> b!1014220 (= tp!70521 e!570641)))

(assert (= (and b!1014220 ((_ is Cons!21461) (t!30457 l!412))) b!1014385))

(check-sat (not b!1014385) (not bm!42783) (not b!1014272) (not bm!42781) (not bm!42780) (not b!1014250) (not b!1014270) (not d!120629) (not bm!42782) tp_is_empty!23497)
(check-sat)
