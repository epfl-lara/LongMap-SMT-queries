; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1994 () Bool)

(assert start!1994)

(declare-fun b!13420 () Bool)

(assert (=> b!13420 true))

(declare-fun b!13418 () Bool)

(declare-fun e!8042 () Bool)

(declare-fun e!8041 () Bool)

(assert (=> b!13418 (= e!8042 e!8041)))

(declare-fun res!10578 () Bool)

(assert (=> b!13418 (=> (not res!10578) (not e!8041))))

(declare-datatypes ((B!490 0))(
  ( (B!491 (val!343 Int)) )
))
(declare-datatypes ((tuple2!486 0))(
  ( (tuple2!487 (_1!243 (_ BitVec 64)) (_2!243 B!490)) )
))
(declare-datatypes ((List!398 0))(
  ( (Nil!395) (Cons!394 (h!960 tuple2!486) (t!2794 List!398)) )
))
(declare-fun lt!3513 () List!398)

(declare-fun isStrictlySorted!85 (List!398) Bool)

(assert (=> b!13418 (= res!10578 (isStrictlySorted!85 lt!3513))))

(declare-fun l!522 () List!398)

(declare-fun value!159 () B!490)

(declare-fun filterByValue!8 (List!398 B!490) List!398)

(assert (=> b!13418 (= lt!3513 (filterByValue!8 (t!2794 l!522) value!159))))

(declare-fun b!13419 () Bool)

(assert (=> b!13419 (= e!8041 (= lt!3513 Nil!395))))

(declare-fun res!10574 () Bool)

(assert (=> b!13420 (=> (not res!10574) (not e!8041))))

(declare-fun lambda!74 () Int)

(declare-fun forall!75 (List!398 Int) Bool)

(assert (=> b!13420 (= res!10574 (forall!75 lt!3513 lambda!74))))

(declare-fun b!13421 () Bool)

(declare-fun res!10575 () Bool)

(assert (=> b!13421 (=> (not res!10575) (not e!8041))))

(declare-fun isEmpty!82 (List!398) Bool)

(assert (=> b!13421 (= res!10575 (not (isEmpty!82 lt!3513)))))

(declare-fun b!13417 () Bool)

(declare-fun res!10576 () Bool)

(assert (=> b!13417 (=> (not res!10576) (not e!8041))))

(assert (=> b!13417 (= res!10576 (not (isEmpty!82 l!522)))))

(declare-fun res!10577 () Bool)

(assert (=> start!1994 (=> (not res!10577) (not e!8042))))

(assert (=> start!1994 (= res!10577 (isStrictlySorted!85 l!522))))

(assert (=> start!1994 e!8042))

(declare-fun e!8040 () Bool)

(assert (=> start!1994 e!8040))

(declare-fun tp_is_empty!669 () Bool)

(assert (=> start!1994 tp_is_empty!669))

(declare-fun b!13422 () Bool)

(declare-fun res!10579 () Bool)

(assert (=> b!13422 (=> (not res!10579) (not e!8042))))

(get-info :version)

(assert (=> b!13422 (= res!10579 (and (not (= (_2!243 (h!960 l!522)) value!159)) ((_ is Cons!394) l!522)))))

(declare-fun b!13423 () Bool)

(declare-fun tp!2189 () Bool)

(assert (=> b!13423 (= e!8040 (and tp_is_empty!669 tp!2189))))

(assert (= (and start!1994 res!10577) b!13422))

(assert (= (and b!13422 res!10579) b!13418))

(assert (= (and b!13418 res!10578) b!13420))

(assert (= (and b!13420 res!10574) b!13417))

(assert (= (and b!13417 res!10576) b!13421))

(assert (= (and b!13421 res!10575) b!13419))

(assert (= (and start!1994 ((_ is Cons!394) l!522)) b!13423))

(declare-fun m!9113 () Bool)

(assert (=> b!13420 m!9113))

(declare-fun m!9115 () Bool)

(assert (=> start!1994 m!9115))

(declare-fun m!9117 () Bool)

(assert (=> b!13418 m!9117))

(declare-fun m!9119 () Bool)

(assert (=> b!13418 m!9119))

(declare-fun m!9121 () Bool)

(assert (=> b!13421 m!9121))

(declare-fun m!9123 () Bool)

(assert (=> b!13417 m!9123))

(check-sat (not start!1994) tp_is_empty!669 (not b!13423) (not b!13421) (not b!13417) (not b!13420) (not b!13418))
(check-sat)
(get-model)

(declare-fun d!2017 () Bool)

(assert (=> d!2017 (= (isEmpty!82 lt!3513) ((_ is Nil!395) lt!3513))))

(assert (=> b!13421 d!2017))

(declare-fun d!2019 () Bool)

(declare-fun res!10614 () Bool)

(declare-fun e!8068 () Bool)

(assert (=> d!2019 (=> res!10614 e!8068)))

(assert (=> d!2019 (= res!10614 (or ((_ is Nil!395) l!522) ((_ is Nil!395) (t!2794 l!522))))))

(assert (=> d!2019 (= (isStrictlySorted!85 l!522) e!8068)))

(declare-fun b!13465 () Bool)

(declare-fun e!8069 () Bool)

(assert (=> b!13465 (= e!8068 e!8069)))

(declare-fun res!10615 () Bool)

(assert (=> b!13465 (=> (not res!10615) (not e!8069))))

(assert (=> b!13465 (= res!10615 (bvslt (_1!243 (h!960 l!522)) (_1!243 (h!960 (t!2794 l!522)))))))

(declare-fun b!13466 () Bool)

(assert (=> b!13466 (= e!8069 (isStrictlySorted!85 (t!2794 l!522)))))

(assert (= (and d!2019 (not res!10614)) b!13465))

(assert (= (and b!13465 res!10615) b!13466))

(declare-fun m!9141 () Bool)

(assert (=> b!13466 m!9141))

(assert (=> start!1994 d!2019))

(declare-fun d!2027 () Bool)

(assert (=> d!2027 (= (isEmpty!82 l!522) ((_ is Nil!395) l!522))))

(assert (=> b!13417 d!2027))

(declare-fun d!2029 () Bool)

(declare-fun res!10620 () Bool)

(declare-fun e!8074 () Bool)

(assert (=> d!2029 (=> res!10620 e!8074)))

(assert (=> d!2029 (= res!10620 (or ((_ is Nil!395) lt!3513) ((_ is Nil!395) (t!2794 lt!3513))))))

(assert (=> d!2029 (= (isStrictlySorted!85 lt!3513) e!8074)))

(declare-fun b!13471 () Bool)

(declare-fun e!8075 () Bool)

(assert (=> b!13471 (= e!8074 e!8075)))

(declare-fun res!10621 () Bool)

(assert (=> b!13471 (=> (not res!10621) (not e!8075))))

(assert (=> b!13471 (= res!10621 (bvslt (_1!243 (h!960 lt!3513)) (_1!243 (h!960 (t!2794 lt!3513)))))))

(declare-fun b!13472 () Bool)

(assert (=> b!13472 (= e!8075 (isStrictlySorted!85 (t!2794 lt!3513)))))

(assert (= (and d!2029 (not res!10620)) b!13471))

(assert (= (and b!13471 res!10621) b!13472))

(declare-fun m!9143 () Bool)

(assert (=> b!13472 m!9143))

(assert (=> b!13418 d!2029))

(declare-fun bs!526 () Bool)

(declare-fun b!13545 () Bool)

(assert (= bs!526 (and b!13545 b!13420)))

(declare-fun lambda!85 () Int)

(assert (=> bs!526 (= lambda!85 lambda!74)))

(assert (=> b!13545 true))

(declare-fun d!2031 () Bool)

(declare-fun e!8120 () Bool)

(assert (=> d!2031 e!8120))

(declare-fun res!10651 () Bool)

(assert (=> d!2031 (=> (not res!10651) (not e!8120))))

(declare-fun lt!3524 () List!398)

(assert (=> d!2031 (= res!10651 (isStrictlySorted!85 lt!3524))))

(declare-fun e!8121 () List!398)

(assert (=> d!2031 (= lt!3524 e!8121)))

(declare-fun c!1265 () Bool)

(assert (=> d!2031 (= c!1265 (and ((_ is Cons!394) (t!2794 l!522)) (= (_2!243 (h!960 (t!2794 l!522))) value!159)))))

(assert (=> d!2031 (isStrictlySorted!85 (t!2794 l!522))))

(assert (=> d!2031 (= (filterByValue!8 (t!2794 l!522) value!159) lt!3524)))

(declare-fun b!13542 () Bool)

(declare-fun e!8119 () List!398)

(assert (=> b!13542 (= e!8121 e!8119)))

(declare-fun c!1264 () Bool)

(assert (=> b!13542 (= c!1264 (and ((_ is Cons!394) (t!2794 l!522)) (not (= (_2!243 (h!960 (t!2794 l!522))) value!159))))))

(declare-fun b!13543 () Bool)

(declare-fun e!8117 () Bool)

(assert (=> b!13543 (= e!8120 e!8117)))

(declare-fun c!1263 () Bool)

(assert (=> b!13543 (= c!1263 (isEmpty!82 (t!2794 l!522)))))

(declare-fun b!13544 () Bool)

(declare-fun e!8118 () Bool)

(declare-fun head!786 (List!398) tuple2!486)

(assert (=> b!13544 (= e!8118 (bvsge (_1!243 (head!786 lt!3524)) (_1!243 (head!786 (t!2794 l!522)))))))

(declare-fun res!10649 () Bool)

(assert (=> b!13545 (=> (not res!10649) (not e!8120))))

(assert (=> b!13545 (= res!10649 (forall!75 lt!3524 lambda!85))))

(declare-fun b!13546 () Bool)

(declare-fun call!381 () List!398)

(declare-fun $colon$colon!16 (List!398 tuple2!486) List!398)

(assert (=> b!13546 (= e!8121 ($colon$colon!16 call!381 (h!960 (t!2794 l!522))))))

(declare-fun bm!377 () Bool)

(assert (=> bm!377 (= call!381 (filterByValue!8 (t!2794 (t!2794 l!522)) value!159))))

(declare-fun bm!378 () Bool)

(declare-fun call!380 () Bool)

(assert (=> bm!378 (= call!380 (isEmpty!82 lt!3524))))

(declare-fun b!13547 () Bool)

(assert (=> b!13547 (= e!8119 Nil!395)))

(declare-fun b!13548 () Bool)

(assert (=> b!13548 (= e!8117 call!380)))

(declare-fun b!13549 () Bool)

(assert (=> b!13549 (= e!8117 e!8118)))

(declare-fun res!10650 () Bool)

(assert (=> b!13549 (= res!10650 call!380)))

(assert (=> b!13549 (=> res!10650 e!8118)))

(declare-fun b!13550 () Bool)

(assert (=> b!13550 (= e!8119 call!381)))

(assert (= (and d!2031 c!1265) b!13546))

(assert (= (and d!2031 (not c!1265)) b!13542))

(assert (= (and b!13542 c!1264) b!13550))

(assert (= (and b!13542 (not c!1264)) b!13547))

(assert (= (or b!13546 b!13550) bm!377))

(assert (= (and d!2031 res!10651) b!13545))

(assert (= (and b!13545 res!10649) b!13543))

(assert (= (and b!13543 c!1263) b!13548))

(assert (= (and b!13543 (not c!1263)) b!13549))

(assert (= (and b!13549 (not res!10650)) b!13544))

(assert (= (or b!13548 b!13549) bm!378))

(declare-fun m!9169 () Bool)

(assert (=> b!13544 m!9169))

(declare-fun m!9171 () Bool)

(assert (=> b!13544 m!9171))

(declare-fun m!9173 () Bool)

(assert (=> b!13546 m!9173))

(declare-fun m!9175 () Bool)

(assert (=> bm!378 m!9175))

(declare-fun m!9177 () Bool)

(assert (=> b!13545 m!9177))

(declare-fun m!9179 () Bool)

(assert (=> bm!377 m!9179))

(declare-fun m!9181 () Bool)

(assert (=> b!13543 m!9181))

(declare-fun m!9183 () Bool)

(assert (=> d!2031 m!9183))

(assert (=> d!2031 m!9141))

(assert (=> b!13418 d!2031))

(declare-fun d!2043 () Bool)

(declare-fun res!10665 () Bool)

(declare-fun e!8142 () Bool)

(assert (=> d!2043 (=> res!10665 e!8142)))

(assert (=> d!2043 (= res!10665 ((_ is Nil!395) lt!3513))))

(assert (=> d!2043 (= (forall!75 lt!3513 lambda!74) e!8142)))

(declare-fun b!13579 () Bool)

(declare-fun e!8143 () Bool)

(assert (=> b!13579 (= e!8142 e!8143)))

(declare-fun res!10666 () Bool)

(assert (=> b!13579 (=> (not res!10666) (not e!8143))))

(declare-fun dynLambda!86 (Int tuple2!486) Bool)

(assert (=> b!13579 (= res!10666 (dynLambda!86 lambda!74 (h!960 lt!3513)))))

(declare-fun b!13580 () Bool)

(assert (=> b!13580 (= e!8143 (forall!75 (t!2794 lt!3513) lambda!74))))

(assert (= (and d!2043 (not res!10665)) b!13579))

(assert (= (and b!13579 res!10666) b!13580))

(declare-fun b_lambda!881 () Bool)

(assert (=> (not b_lambda!881) (not b!13579)))

(declare-fun m!9205 () Bool)

(assert (=> b!13579 m!9205))

(declare-fun m!9207 () Bool)

(assert (=> b!13580 m!9207))

(assert (=> b!13420 d!2043))

(declare-fun b!13586 () Bool)

(declare-fun e!8147 () Bool)

(declare-fun tp!2201 () Bool)

(assert (=> b!13586 (= e!8147 (and tp_is_empty!669 tp!2201))))

(assert (=> b!13423 (= tp!2189 e!8147)))

(assert (= (and b!13423 ((_ is Cons!394) (t!2794 l!522))) b!13586))

(declare-fun b_lambda!885 () Bool)

(assert (= b_lambda!881 (or b!13420 b_lambda!885)))

(declare-fun bs!530 () Bool)

(declare-fun d!2053 () Bool)

(assert (= bs!530 (and d!2053 b!13420)))

(assert (=> bs!530 (= (dynLambda!86 lambda!74 (h!960 lt!3513)) (= (_2!243 (h!960 lt!3513)) value!159))))

(assert (=> b!13579 d!2053))

(check-sat tp_is_empty!669 (not b!13546) (not b!13466) (not bm!378) (not b!13580) (not b!13586) (not b_lambda!885) (not b!13543) (not d!2031) (not b!13545) (not b!13472) (not bm!377) (not b!13544))
(check-sat)
