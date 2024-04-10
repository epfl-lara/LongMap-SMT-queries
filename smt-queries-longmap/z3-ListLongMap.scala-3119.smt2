; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43862 () Bool)

(assert start!43862)

(declare-fun b!484473 () Bool)

(declare-fun res!288627 () Bool)

(declare-fun e!285199 () Bool)

(assert (=> b!484473 (=> (not res!288627) (not e!285199))))

(declare-datatypes ((B!1138 0))(
  ( (B!1139 (val!7021 Int)) )
))
(declare-datatypes ((tuple2!9244 0))(
  ( (tuple2!9245 (_1!4633 (_ BitVec 64)) (_2!4633 B!1138)) )
))
(declare-datatypes ((List!9285 0))(
  ( (Nil!9282) (Cons!9281 (h!10137 tuple2!9244) (t!15507 List!9285)) )
))
(declare-fun l!956 () List!9285)

(declare-fun isStrictlySorted!424 (List!9285) Bool)

(assert (=> b!484473 (= res!288627 (isStrictlySorted!424 (t!15507 l!956)))))

(declare-fun b!484474 () Bool)

(declare-fun e!285200 () Bool)

(declare-fun tp_is_empty!13947 () Bool)

(declare-fun tp!43537 () Bool)

(assert (=> b!484474 (= e!285200 (and tp_is_empty!13947 tp!43537))))

(declare-fun b!484475 () Bool)

(declare-fun res!288625 () Bool)

(assert (=> b!484475 (=> (not res!288625) (not e!285199))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!387 (List!9285 (_ BitVec 64)) Bool)

(assert (=> b!484475 (= res!288625 (not (containsKey!387 (t!15507 l!956) key!251)))))

(declare-fun b!484476 () Bool)

(declare-fun e!285201 () Bool)

(assert (=> b!484476 (= e!285201 e!285199)))

(declare-fun res!288628 () Bool)

(assert (=> b!484476 (=> (not res!288628) (not e!285199))))

(get-info :version)

(assert (=> b!484476 (= res!288628 (and ((_ is Cons!9281) l!956) (bvslt (_1!4633 (h!10137 l!956)) key!251)))))

(declare-fun lt!219382 () List!9285)

(declare-fun value!166 () B!1138)

(declare-fun insertStrictlySorted!239 (List!9285 (_ BitVec 64) B!1138) List!9285)

(assert (=> b!484476 (= lt!219382 (insertStrictlySorted!239 l!956 key!251 value!166))))

(declare-fun res!288629 () Bool)

(assert (=> start!43862 (=> (not res!288629) (not e!285201))))

(assert (=> start!43862 (= res!288629 (isStrictlySorted!424 l!956))))

(assert (=> start!43862 e!285201))

(assert (=> start!43862 e!285200))

(assert (=> start!43862 true))

(assert (=> start!43862 tp_is_empty!13947))

(declare-fun b!484477 () Bool)

(declare-fun ListPrimitiveSize!65 (List!9285) Int)

(assert (=> b!484477 (= e!285199 (>= (ListPrimitiveSize!65 (t!15507 l!956)) (ListPrimitiveSize!65 l!956)))))

(declare-fun b!484478 () Bool)

(declare-fun res!288626 () Bool)

(assert (=> b!484478 (=> (not res!288626) (not e!285201))))

(assert (=> b!484478 (= res!288626 (not (containsKey!387 l!956 key!251)))))

(assert (= (and start!43862 res!288629) b!484478))

(assert (= (and b!484478 res!288626) b!484476))

(assert (= (and b!484476 res!288628) b!484473))

(assert (= (and b!484473 res!288627) b!484475))

(assert (= (and b!484475 res!288625) b!484477))

(assert (= (and start!43862 ((_ is Cons!9281) l!956)) b!484474))

(declare-fun m!465029 () Bool)

(assert (=> b!484476 m!465029))

(declare-fun m!465031 () Bool)

(assert (=> b!484477 m!465031))

(declare-fun m!465033 () Bool)

(assert (=> b!484477 m!465033))

(declare-fun m!465035 () Bool)

(assert (=> b!484475 m!465035))

(declare-fun m!465037 () Bool)

(assert (=> b!484473 m!465037))

(declare-fun m!465039 () Bool)

(assert (=> start!43862 m!465039))

(declare-fun m!465041 () Bool)

(assert (=> b!484478 m!465041))

(check-sat (not start!43862) (not b!484477) (not b!484473) (not b!484475) (not b!484474) (not b!484478) (not b!484476) tp_is_empty!13947)
(check-sat)
(get-model)

(declare-fun d!77103 () Bool)

(declare-fun res!288649 () Bool)

(declare-fun e!285215 () Bool)

(assert (=> d!77103 (=> res!288649 e!285215)))

(assert (=> d!77103 (= res!288649 (and ((_ is Cons!9281) (t!15507 l!956)) (= (_1!4633 (h!10137 (t!15507 l!956))) key!251)))))

(assert (=> d!77103 (= (containsKey!387 (t!15507 l!956) key!251) e!285215)))

(declare-fun b!484501 () Bool)

(declare-fun e!285216 () Bool)

(assert (=> b!484501 (= e!285215 e!285216)))

(declare-fun res!288650 () Bool)

(assert (=> b!484501 (=> (not res!288650) (not e!285216))))

(assert (=> b!484501 (= res!288650 (and (or (not ((_ is Cons!9281) (t!15507 l!956))) (bvsle (_1!4633 (h!10137 (t!15507 l!956))) key!251)) ((_ is Cons!9281) (t!15507 l!956)) (bvslt (_1!4633 (h!10137 (t!15507 l!956))) key!251)))))

(declare-fun b!484502 () Bool)

(assert (=> b!484502 (= e!285216 (containsKey!387 (t!15507 (t!15507 l!956)) key!251))))

(assert (= (and d!77103 (not res!288649)) b!484501))

(assert (= (and b!484501 res!288650) b!484502))

(declare-fun m!465057 () Bool)

(assert (=> b!484502 m!465057))

(assert (=> b!484475 d!77103))

(declare-fun d!77107 () Bool)

(declare-fun lt!219388 () Int)

(assert (=> d!77107 (>= lt!219388 0)))

(declare-fun e!285219 () Int)

(assert (=> d!77107 (= lt!219388 e!285219)))

(declare-fun c!58247 () Bool)

(assert (=> d!77107 (= c!58247 ((_ is Nil!9282) (t!15507 l!956)))))

(assert (=> d!77107 (= (ListPrimitiveSize!65 (t!15507 l!956)) lt!219388)))

(declare-fun b!484507 () Bool)

(assert (=> b!484507 (= e!285219 0)))

(declare-fun b!484508 () Bool)

(assert (=> b!484508 (= e!285219 (+ 1 (ListPrimitiveSize!65 (t!15507 (t!15507 l!956)))))))

(assert (= (and d!77107 c!58247) b!484507))

(assert (= (and d!77107 (not c!58247)) b!484508))

(declare-fun m!465059 () Bool)

(assert (=> b!484508 m!465059))

(assert (=> b!484477 d!77107))

(declare-fun d!77111 () Bool)

(declare-fun lt!219389 () Int)

(assert (=> d!77111 (>= lt!219389 0)))

(declare-fun e!285220 () Int)

(assert (=> d!77111 (= lt!219389 e!285220)))

(declare-fun c!58248 () Bool)

(assert (=> d!77111 (= c!58248 ((_ is Nil!9282) l!956))))

(assert (=> d!77111 (= (ListPrimitiveSize!65 l!956) lt!219389)))

(declare-fun b!484509 () Bool)

(assert (=> b!484509 (= e!285220 0)))

(declare-fun b!484510 () Bool)

(assert (=> b!484510 (= e!285220 (+ 1 (ListPrimitiveSize!65 (t!15507 l!956))))))

(assert (= (and d!77111 c!58248) b!484509))

(assert (= (and d!77111 (not c!58248)) b!484510))

(assert (=> b!484510 m!465031))

(assert (=> b!484477 d!77111))

(declare-fun c!58281 () Bool)

(declare-fun bm!31143 () Bool)

(declare-fun e!285267 () List!9285)

(declare-fun call!31147 () List!9285)

(declare-fun $colon$colon!123 (List!9285 tuple2!9244) List!9285)

(assert (=> bm!31143 (= call!31147 ($colon$colon!123 e!285267 (ite c!58281 (h!10137 l!956) (tuple2!9245 key!251 value!166))))))

(declare-fun c!58282 () Bool)

(assert (=> bm!31143 (= c!58282 c!58281)))

(declare-fun b!484597 () Bool)

(declare-fun e!285271 () List!9285)

(declare-fun call!31146 () List!9285)

(assert (=> b!484597 (= e!285271 call!31146)))

(declare-fun b!484598 () Bool)

(declare-fun c!58284 () Bool)

(assert (=> b!484598 (= c!58284 (and ((_ is Cons!9281) l!956) (bvsgt (_1!4633 (h!10137 l!956)) key!251)))))

(declare-fun e!285270 () List!9285)

(assert (=> b!484598 (= e!285270 e!285271)))

(declare-fun b!484599 () Bool)

(assert (=> b!484599 (= e!285271 call!31146)))

(declare-fun b!484600 () Bool)

(declare-fun e!285268 () List!9285)

(assert (=> b!484600 (= e!285268 call!31147)))

(declare-fun bm!31144 () Bool)

(declare-fun call!31148 () List!9285)

(assert (=> bm!31144 (= call!31148 call!31147)))

(declare-fun d!77113 () Bool)

(declare-fun e!285269 () Bool)

(assert (=> d!77113 e!285269))

(declare-fun res!288674 () Bool)

(assert (=> d!77113 (=> (not res!288674) (not e!285269))))

(declare-fun lt!219398 () List!9285)

(assert (=> d!77113 (= res!288674 (isStrictlySorted!424 lt!219398))))

(assert (=> d!77113 (= lt!219398 e!285268)))

(assert (=> d!77113 (= c!58281 (and ((_ is Cons!9281) l!956) (bvslt (_1!4633 (h!10137 l!956)) key!251)))))

(assert (=> d!77113 (isStrictlySorted!424 l!956)))

(assert (=> d!77113 (= (insertStrictlySorted!239 l!956 key!251 value!166) lt!219398)))

(declare-fun b!484601 () Bool)

(declare-fun res!288673 () Bool)

(assert (=> b!484601 (=> (not res!288673) (not e!285269))))

(assert (=> b!484601 (= res!288673 (containsKey!387 lt!219398 key!251))))

(declare-fun bm!31145 () Bool)

(assert (=> bm!31145 (= call!31146 call!31148)))

(declare-fun b!484602 () Bool)

(declare-fun c!58283 () Bool)

(assert (=> b!484602 (= e!285267 (ite c!58283 (t!15507 l!956) (ite c!58284 (Cons!9281 (h!10137 l!956) (t!15507 l!956)) Nil!9282)))))

(declare-fun b!484603 () Bool)

(assert (=> b!484603 (= e!285270 call!31148)))

(declare-fun b!484604 () Bool)

(assert (=> b!484604 (= e!285267 (insertStrictlySorted!239 (t!15507 l!956) key!251 value!166))))

(declare-fun b!484605 () Bool)

(assert (=> b!484605 (= e!285268 e!285270)))

(assert (=> b!484605 (= c!58283 (and ((_ is Cons!9281) l!956) (= (_1!4633 (h!10137 l!956)) key!251)))))

(declare-fun b!484606 () Bool)

(declare-fun contains!2683 (List!9285 tuple2!9244) Bool)

(assert (=> b!484606 (= e!285269 (contains!2683 lt!219398 (tuple2!9245 key!251 value!166)))))

(assert (= (and d!77113 c!58281) b!484600))

(assert (= (and d!77113 (not c!58281)) b!484605))

(assert (= (and b!484605 c!58283) b!484603))

(assert (= (and b!484605 (not c!58283)) b!484598))

(assert (= (and b!484598 c!58284) b!484599))

(assert (= (and b!484598 (not c!58284)) b!484597))

(assert (= (or b!484599 b!484597) bm!31145))

(assert (= (or b!484603 bm!31145) bm!31144))

(assert (= (or b!484600 bm!31144) bm!31143))

(assert (= (and bm!31143 c!58282) b!484604))

(assert (= (and bm!31143 (not c!58282)) b!484602))

(assert (= (and d!77113 res!288674) b!484601))

(assert (= (and b!484601 res!288673) b!484606))

(declare-fun m!465081 () Bool)

(assert (=> b!484606 m!465081))

(declare-fun m!465083 () Bool)

(assert (=> d!77113 m!465083))

(assert (=> d!77113 m!465039))

(declare-fun m!465085 () Bool)

(assert (=> b!484601 m!465085))

(declare-fun m!465087 () Bool)

(assert (=> bm!31143 m!465087))

(declare-fun m!465089 () Bool)

(assert (=> b!484604 m!465089))

(assert (=> b!484476 d!77113))

(declare-fun d!77121 () Bool)

(declare-fun res!288687 () Bool)

(declare-fun e!285288 () Bool)

(assert (=> d!77121 (=> res!288687 e!285288)))

(assert (=> d!77121 (= res!288687 (or ((_ is Nil!9282) l!956) ((_ is Nil!9282) (t!15507 l!956))))))

(assert (=> d!77121 (= (isStrictlySorted!424 l!956) e!285288)))

(declare-fun b!484627 () Bool)

(declare-fun e!285289 () Bool)

(assert (=> b!484627 (= e!285288 e!285289)))

(declare-fun res!288688 () Bool)

(assert (=> b!484627 (=> (not res!288688) (not e!285289))))

(assert (=> b!484627 (= res!288688 (bvslt (_1!4633 (h!10137 l!956)) (_1!4633 (h!10137 (t!15507 l!956)))))))

(declare-fun b!484628 () Bool)

(assert (=> b!484628 (= e!285289 (isStrictlySorted!424 (t!15507 l!956)))))

(assert (= (and d!77121 (not res!288687)) b!484627))

(assert (= (and b!484627 res!288688) b!484628))

(assert (=> b!484628 m!465037))

(assert (=> start!43862 d!77121))

(declare-fun d!77131 () Bool)

(declare-fun res!288689 () Bool)

(declare-fun e!285290 () Bool)

(assert (=> d!77131 (=> res!288689 e!285290)))

(assert (=> d!77131 (= res!288689 (or ((_ is Nil!9282) (t!15507 l!956)) ((_ is Nil!9282) (t!15507 (t!15507 l!956)))))))

(assert (=> d!77131 (= (isStrictlySorted!424 (t!15507 l!956)) e!285290)))

(declare-fun b!484629 () Bool)

(declare-fun e!285291 () Bool)

(assert (=> b!484629 (= e!285290 e!285291)))

(declare-fun res!288690 () Bool)

(assert (=> b!484629 (=> (not res!288690) (not e!285291))))

(assert (=> b!484629 (= res!288690 (bvslt (_1!4633 (h!10137 (t!15507 l!956))) (_1!4633 (h!10137 (t!15507 (t!15507 l!956))))))))

(declare-fun b!484630 () Bool)

(assert (=> b!484630 (= e!285291 (isStrictlySorted!424 (t!15507 (t!15507 l!956))))))

(assert (= (and d!77131 (not res!288689)) b!484629))

(assert (= (and b!484629 res!288690) b!484630))

(declare-fun m!465095 () Bool)

(assert (=> b!484630 m!465095))

(assert (=> b!484473 d!77131))

(declare-fun d!77133 () Bool)

(declare-fun res!288691 () Bool)

(declare-fun e!285292 () Bool)

(assert (=> d!77133 (=> res!288691 e!285292)))

(assert (=> d!77133 (= res!288691 (and ((_ is Cons!9281) l!956) (= (_1!4633 (h!10137 l!956)) key!251)))))

(assert (=> d!77133 (= (containsKey!387 l!956 key!251) e!285292)))

(declare-fun b!484631 () Bool)

(declare-fun e!285293 () Bool)

(assert (=> b!484631 (= e!285292 e!285293)))

(declare-fun res!288692 () Bool)

(assert (=> b!484631 (=> (not res!288692) (not e!285293))))

(assert (=> b!484631 (= res!288692 (and (or (not ((_ is Cons!9281) l!956)) (bvsle (_1!4633 (h!10137 l!956)) key!251)) ((_ is Cons!9281) l!956) (bvslt (_1!4633 (h!10137 l!956)) key!251)))))

(declare-fun b!484632 () Bool)

(assert (=> b!484632 (= e!285293 (containsKey!387 (t!15507 l!956) key!251))))

(assert (= (and d!77133 (not res!288691)) b!484631))

(assert (= (and b!484631 res!288692) b!484632))

(assert (=> b!484632 m!465035))

(assert (=> b!484478 d!77133))

(declare-fun b!484643 () Bool)

(declare-fun e!285302 () Bool)

(declare-fun tp!43543 () Bool)

(assert (=> b!484643 (= e!285302 (and tp_is_empty!13947 tp!43543))))

(assert (=> b!484474 (= tp!43537 e!285302)))

(assert (= (and b!484474 ((_ is Cons!9281) (t!15507 l!956))) b!484643))

(check-sat (not bm!31143) (not b!484601) (not b!484606) (not b!484643) (not b!484508) (not d!77113) (not b!484632) (not b!484502) (not b!484628) (not b!484630) (not b!484604) (not b!484510) tp_is_empty!13947)
(check-sat)
