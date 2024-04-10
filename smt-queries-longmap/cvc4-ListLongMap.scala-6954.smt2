; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87706 () Bool)

(assert start!87706)

(declare-fun res!680763 () Bool)

(declare-fun e!570642 () Bool)

(assert (=> start!87706 (=> (not res!680763) (not e!570642))))

(declare-datatypes ((B!1434 0))(
  ( (B!1435 (val!11801 Int)) )
))
(declare-datatypes ((tuple2!15148 0))(
  ( (tuple2!15149 (_1!7585 (_ BitVec 64)) (_2!7585 B!1434)) )
))
(declare-datatypes ((List!21434 0))(
  ( (Nil!21431) (Cons!21430 (h!22628 tuple2!15148) (t!30435 List!21434)) )
))
(declare-fun l!412 () List!21434)

(declare-fun isStrictlySorted!575 (List!21434) Bool)

(assert (=> start!87706 (= res!680763 (isStrictlySorted!575 l!412))))

(assert (=> start!87706 e!570642))

(declare-fun e!570643 () Bool)

(assert (=> start!87706 e!570643))

(declare-fun tp_is_empty!23501 () Bool)

(assert (=> start!87706 tp_is_empty!23501))

(declare-fun b!1014366 () Bool)

(declare-fun res!680762 () Bool)

(assert (=> b!1014366 (=> (not res!680762) (not e!570642))))

(declare-fun value!115 () B!1434)

(assert (=> b!1014366 (= res!680762 (and (not (= (_2!7585 (h!22628 l!412)) value!115)) (is-Cons!21430 l!412)))))

(declare-fun b!1014367 () Bool)

(declare-fun ListPrimitiveSize!114 (List!21434) Int)

(assert (=> b!1014367 (= e!570642 (>= (ListPrimitiveSize!114 (t!30435 l!412)) (ListPrimitiveSize!114 l!412)))))

(declare-datatypes ((List!21435 0))(
  ( (Nil!21432) (Cons!21431 (h!22629 (_ BitVec 64)) (t!30436 List!21435)) )
))
(declare-fun lt!448491 () List!21435)

(declare-fun getKeysOf!48 (List!21434 B!1434) List!21435)

(assert (=> b!1014367 (= lt!448491 (getKeysOf!48 (t!30435 l!412) value!115))))

(declare-fun b!1014368 () Bool)

(declare-fun tp!70526 () Bool)

(assert (=> b!1014368 (= e!570643 (and tp_is_empty!23501 tp!70526))))

(assert (= (and start!87706 res!680763) b!1014366))

(assert (= (and b!1014366 res!680762) b!1014367))

(assert (= (and start!87706 (is-Cons!21430 l!412)) b!1014368))

(declare-fun m!937027 () Bool)

(assert (=> start!87706 m!937027))

(declare-fun m!937029 () Bool)

(assert (=> b!1014367 m!937029))

(declare-fun m!937031 () Bool)

(assert (=> b!1014367 m!937031))

(declare-fun m!937033 () Bool)

(assert (=> b!1014367 m!937033))

(push 1)

(assert (not b!1014367))

(assert (not start!87706))

(assert (not b!1014368))

(assert tp_is_empty!23501)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120751 () Bool)

(declare-fun lt!448497 () Int)

(assert (=> d!120751 (>= lt!448497 0)))

(declare-fun e!570649 () Int)

(assert (=> d!120751 (= lt!448497 e!570649)))

(declare-fun c!102663 () Bool)

(assert (=> d!120751 (= c!102663 (is-Nil!21431 (t!30435 l!412)))))

(assert (=> d!120751 (= (ListPrimitiveSize!114 (t!30435 l!412)) lt!448497)))

(declare-fun b!1014379 () Bool)

(assert (=> b!1014379 (= e!570649 0)))

(declare-fun b!1014380 () Bool)

(assert (=> b!1014380 (= e!570649 (+ 1 (ListPrimitiveSize!114 (t!30435 (t!30435 l!412)))))))

(assert (= (and d!120751 c!102663) b!1014379))

(assert (= (and d!120751 (not c!102663)) b!1014380))

(declare-fun m!937037 () Bool)

(assert (=> b!1014380 m!937037))

(assert (=> b!1014367 d!120751))

(declare-fun d!120755 () Bool)

(declare-fun lt!448499 () Int)

(assert (=> d!120755 (>= lt!448499 0)))

(declare-fun e!570651 () Int)

(assert (=> d!120755 (= lt!448499 e!570651)))

(declare-fun c!102665 () Bool)

(assert (=> d!120755 (= c!102665 (is-Nil!21431 l!412))))

(assert (=> d!120755 (= (ListPrimitiveSize!114 l!412) lt!448499)))

(declare-fun b!1014383 () Bool)

(assert (=> b!1014383 (= e!570651 0)))

(declare-fun b!1014384 () Bool)

(assert (=> b!1014384 (= e!570651 (+ 1 (ListPrimitiveSize!114 (t!30435 l!412))))))

(assert (= (and d!120755 c!102665) b!1014383))

(assert (= (and d!120755 (not c!102665)) b!1014384))

(assert (=> b!1014384 m!937029))

(assert (=> b!1014367 d!120755))

(declare-fun b!1014446 () Bool)

(assert (=> b!1014446 true))

(assert (=> b!1014446 true))

(assert (=> b!1014446 true))

(declare-fun bs!29265 () Bool)

(declare-fun b!1014434 () Bool)

(assert (= bs!29265 (and b!1014434 b!1014446)))

(declare-fun lt!448566 () tuple2!15148)

(declare-fun lt!448581 () List!21434)

(declare-fun lt!448574 () List!21434)

(declare-fun lt!448565 () tuple2!15148)

(declare-fun lambda!698 () Int)

(declare-fun lambda!696 () Int)

(assert (=> bs!29265 (= (= (Cons!21430 lt!448565 lt!448574) (Cons!21430 lt!448566 lt!448581)) (= lambda!698 lambda!696))))

(assert (=> b!1014434 true))

(assert (=> b!1014434 true))

(assert (=> b!1014434 true))

(declare-fun bs!29267 () Bool)

(declare-fun d!120759 () Bool)

(assert (= bs!29267 (and d!120759 b!1014446)))

(declare-fun lambda!700 () Int)

(assert (=> bs!29267 (= (= (t!30435 l!412) (Cons!21430 lt!448566 lt!448581)) (= lambda!700 lambda!696))))

(declare-fun bs!29269 () Bool)

(assert (= bs!29269 (and d!120759 b!1014434)))

(assert (=> bs!29269 (= (= (t!30435 l!412) (Cons!21430 lt!448565 lt!448574)) (= lambda!700 lambda!698))))

(assert (=> d!120759 true))

(assert (=> d!120759 true))

(declare-datatypes ((Unit!33166 0))(
  ( (Unit!33167) )
))
(declare-fun e!570681 () Unit!33166)

(declare-fun lt!448576 () Unit!33166)

(assert (=> b!1014434 (= e!570681 lt!448576)))

(assert (=> b!1014434 (= lt!448574 (t!30435 (t!30435 l!412)))))

(declare-fun lt!448586 () List!21435)

(declare-fun call!42795 () List!21435)

(assert (=> b!1014434 (= lt!448586 call!42795)))

(assert (=> b!1014434 (= lt!448565 (h!22628 (t!30435 l!412)))))

(declare-fun call!42799 () Unit!33166)

(assert (=> b!1014434 (= lt!448576 call!42799)))

(declare-fun call!42797 () Bool)

(assert (=> b!1014434 call!42797))

(declare-fun b!1014436 () Bool)

(declare-fun lt!448577 () Unit!33166)

(assert (=> b!1014436 (= lt!448577 e!570681)))

(declare-fun c!102697 () Bool)

(declare-fun call!42801 () Bool)

(assert (=> b!1014436 (= c!102697 (not call!42801))))

(declare-fun lt!448583 () List!21435)

(assert (=> b!1014436 (= lt!448583 call!42795)))

(declare-fun e!570679 () List!21435)

(assert (=> b!1014436 (= e!570679 call!42795)))

(declare-fun b!1014437 () Bool)

(declare-fun Unit!33170 () Unit!33166)

(assert (=> b!1014437 (= e!570681 Unit!33170)))

(declare-fun b!1014438 () Bool)

(assert (=> b!1014438 (= e!570679 Nil!21432)))

(declare-fun bm!42793 () Bool)

(declare-fun lt!448585 () List!21435)

(declare-fun c!102691 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!35 (List!21434 List!21435 B!1434 tuple2!15148) Unit!33166)

(assert (=> bm!42793 (= call!42799 (lemmaForallGetValueByKeySameWithASmallerHead!35 (ite c!102691 lt!448581 lt!448574) (ite c!102691 lt!448585 lt!448586) value!115 (ite c!102691 lt!448566 lt!448565)))))

(declare-fun bm!42794 () Bool)

(declare-fun isEmpty!834 (List!21435) Bool)

(assert (=> bm!42794 (= call!42801 (isEmpty!834 call!42795))))

(declare-fun bm!42796 () Bool)

(assert (=> bm!42796 (= call!42795 (getKeysOf!48 (t!30435 (t!30435 l!412)) value!115))))

(declare-fun b!1014444 () Bool)

(declare-fun e!570677 () List!21435)

(assert (=> b!1014444 (= e!570677 e!570679)))

(declare-fun c!102695 () Bool)

(assert (=> b!1014444 (= c!102695 (and (is-Cons!21430 (t!30435 l!412)) (not (= (_2!7585 (h!22628 (t!30435 l!412))) value!115))))))

(declare-fun bm!42797 () Bool)

(declare-fun forall!240 (List!21435 Int) Bool)

(assert (=> bm!42797 (= call!42797 (forall!240 (ite c!102691 lt!448585 lt!448586) (ite c!102691 lambda!696 lambda!698)))))

(assert (=> b!1014446 call!42797))

(declare-fun lt!448570 () Unit!33166)

(assert (=> b!1014446 (= lt!448570 call!42799)))

(assert (=> b!1014446 (= lt!448566 (h!22628 (t!30435 l!412)))))

(assert (=> b!1014446 (= lt!448585 call!42795)))

(assert (=> b!1014446 (= lt!448581 (t!30435 (t!30435 l!412)))))

(declare-fun e!570683 () Unit!33166)

(assert (=> b!1014446 (= e!570683 lt!448570)))

(declare-fun b!1014448 () Bool)

(assert (=> b!1014448 (= e!570677 (Cons!21431 (_1!7585 (h!22628 (t!30435 l!412))) call!42795))))

(declare-fun c!102693 () Bool)

(assert (=> b!1014448 (= c!102693 (not call!42801))))

(declare-fun lt!448568 () Unit!33166)

(assert (=> b!1014448 (= lt!448568 e!570683)))

(declare-fun lt!448572 () List!21435)

(assert (=> d!120759 (forall!240 lt!448572 lambda!700)))

(assert (=> d!120759 (= lt!448572 e!570677)))

(assert (=> d!120759 (= c!102691 (and (is-Cons!21430 (t!30435 l!412)) (= (_2!7585 (h!22628 (t!30435 l!412))) value!115)))))

(assert (=> d!120759 (isStrictlySorted!575 (t!30435 l!412))))

(assert (=> d!120759 (= (getKeysOf!48 (t!30435 l!412) value!115) lt!448572)))

(declare-fun b!1014442 () Bool)

(declare-fun Unit!33173 () Unit!33166)

(assert (=> b!1014442 (= e!570683 Unit!33173)))

(assert (= (and d!120759 c!102691) b!1014448))

(assert (= (and d!120759 (not c!102691)) b!1014444))

(assert (= (and b!1014448 c!102693) b!1014446))

(assert (= (and b!1014448 (not c!102693)) b!1014442))

(assert (= (and b!1014444 c!102695) b!1014436))

(assert (= (and b!1014444 (not c!102695)) b!1014438))

(assert (= (and b!1014436 c!102697) b!1014434))

(assert (= (and b!1014436 (not c!102697)) b!1014437))

(assert (= (or b!1014446 b!1014434) bm!42793))

(assert (= (or b!1014446 b!1014434) bm!42797))

(assert (= (or b!1014448 b!1014446 b!1014434 b!1014436) bm!42796))

(assert (= (or b!1014448 b!1014436) bm!42794))

(declare-fun m!937042 () Bool)

(assert (=> bm!42796 m!937042))

(declare-fun m!937047 () Bool)

(assert (=> bm!42793 m!937047))

(declare-fun m!937051 () Bool)

(assert (=> bm!42794 m!937051))

(declare-fun m!937055 () Bool)

(assert (=> bm!42797 m!937055))

(declare-fun m!937059 () Bool)

(assert (=> d!120759 m!937059))

(declare-fun m!937063 () Bool)

(assert (=> d!120759 m!937063))

(assert (=> b!1014367 d!120759))

(declare-fun d!120769 () Bool)

(declare-fun res!680772 () Bool)

(declare-fun e!570692 () Bool)

(assert (=> d!120769 (=> res!680772 e!570692)))

(assert (=> d!120769 (= res!680772 (or (is-Nil!21431 l!412) (is-Nil!21431 (t!30435 l!412))))))

(assert (=> d!120769 (= (isStrictlySorted!575 l!412) e!570692)))

(declare-fun b!1014469 () Bool)

(declare-fun e!570693 () Bool)

(assert (=> b!1014469 (= e!570692 e!570693)))

(declare-fun res!680773 () Bool)

(assert (=> b!1014469 (=> (not res!680773) (not e!570693))))

(assert (=> b!1014469 (= res!680773 (bvslt (_1!7585 (h!22628 l!412)) (_1!7585 (h!22628 (t!30435 l!412)))))))

(declare-fun b!1014470 () Bool)

(assert (=> b!1014470 (= e!570693 (isStrictlySorted!575 (t!30435 l!412)))))

(assert (= (and d!120769 (not res!680772)) b!1014469))

(assert (= (and b!1014469 res!680773) b!1014470))

(assert (=> b!1014470 m!937063))

(assert (=> start!87706 d!120769))

(declare-fun b!1014481 () Bool)

(declare-fun e!570700 () Bool)

(declare-fun tp!70531 () Bool)

(assert (=> b!1014481 (= e!570700 (and tp_is_empty!23501 tp!70531))))

(assert (=> b!1014368 (= tp!70526 e!570700)))

(assert (= (and b!1014368 (is-Cons!21430 (t!30435 l!412))) b!1014481))

(push 1)

(assert (not bm!42797))

(assert tp_is_empty!23501)

(assert (not bm!42793))

(assert (not b!1014384))

(assert (not d!120759))

(assert (not b!1014481))

(assert (not b!1014470))

(assert (not bm!42794))

(assert (not b!1014380))

(assert (not bm!42796))

(check-sat)

