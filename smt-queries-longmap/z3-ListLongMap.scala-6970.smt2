; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88086 () Bool)

(assert start!88086)

(declare-fun b!1016151 () Bool)

(assert (=> b!1016151 true))

(assert (=> b!1016151 true))

(declare-fun b!1016150 () Bool)

(declare-fun e!571634 () Bool)

(declare-fun tp_is_empty!23593 () Bool)

(declare-fun tp!70755 () Bool)

(assert (=> b!1016150 (= e!571634 (and tp_is_empty!23593 tp!70755))))

(declare-fun res!681615 () Bool)

(declare-fun e!571633 () Bool)

(assert (=> b!1016151 (=> (not res!681615) (not e!571633))))

(declare-datatypes ((List!21552 0))(
  ( (Nil!21549) (Cons!21548 (h!22746 (_ BitVec 64)) (t!30544 List!21552)) )
))
(declare-fun keys!40 () List!21552)

(declare-fun lambda!1010 () Int)

(declare-fun forall!281 (List!21552 Int) Bool)

(assert (=> b!1016151 (= res!681615 (forall!281 keys!40 lambda!1010))))

(declare-fun b!1016152 () Bool)

(declare-fun res!681616 () Bool)

(assert (=> b!1016152 (=> (not res!681616) (not e!571633))))

(declare-datatypes ((B!1526 0))(
  ( (B!1527 (val!11847 Int)) )
))
(declare-datatypes ((tuple2!15320 0))(
  ( (tuple2!15321 (_1!7671 (_ BitVec 64)) (_2!7671 B!1526)) )
))
(declare-datatypes ((List!21553 0))(
  ( (Nil!21550) (Cons!21549 (h!22747 tuple2!15320) (t!30545 List!21553)) )
))
(declare-fun l!1114 () List!21553)

(declare-fun isEmpty!882 (List!21553) Bool)

(assert (=> b!1016152 (= res!681616 (not (isEmpty!882 l!1114)))))

(declare-fun res!681614 () Bool)

(assert (=> start!88086 (=> (not res!681614) (not e!571633))))

(declare-fun isStrictlySorted!611 (List!21553) Bool)

(assert (=> start!88086 (= res!681614 (isStrictlySorted!611 l!1114))))

(assert (=> start!88086 e!571633))

(assert (=> start!88086 e!571634))

(assert (=> start!88086 true))

(assert (=> start!88086 tp_is_empty!23593))

(declare-fun b!1016153 () Bool)

(declare-fun res!681617 () Bool)

(assert (=> b!1016153 (=> (not res!681617) (not e!571633))))

(declare-fun newHead!31 () tuple2!15320)

(declare-fun head!963 (List!21553) tuple2!15320)

(assert (=> b!1016153 (= res!681617 (bvslt (_1!7671 newHead!31) (_1!7671 (head!963 l!1114))))))

(declare-fun b!1016154 () Bool)

(declare-datatypes ((Option!603 0))(
  ( (Some!602 (v!14450 B!1526)) (None!601) )
))
(declare-fun isDefined!401 (Option!603) Bool)

(declare-fun getValueByKey!552 (List!21553 (_ BitVec 64)) Option!603)

(assert (=> b!1016154 (= e!571633 (not (isDefined!401 (getValueByKey!552 l!1114 (h!22746 keys!40)))))))

(declare-fun b!1016155 () Bool)

(declare-fun res!681613 () Bool)

(assert (=> b!1016155 (=> (not res!681613) (not e!571633))))

(get-info :version)

(assert (=> b!1016155 (= res!681613 ((_ is Cons!21548) keys!40))))

(assert (= (and start!88086 res!681614) b!1016152))

(assert (= (and b!1016152 res!681616) b!1016151))

(assert (= (and b!1016151 res!681615) b!1016153))

(assert (= (and b!1016153 res!681617) b!1016155))

(assert (= (and b!1016155 res!681613) b!1016154))

(assert (= (and start!88086 ((_ is Cons!21549) l!1114)) b!1016150))

(declare-fun m!937411 () Bool)

(assert (=> b!1016152 m!937411))

(declare-fun m!937413 () Bool)

(assert (=> start!88086 m!937413))

(declare-fun m!937415 () Bool)

(assert (=> b!1016154 m!937415))

(assert (=> b!1016154 m!937415))

(declare-fun m!937417 () Bool)

(assert (=> b!1016154 m!937417))

(declare-fun m!937419 () Bool)

(assert (=> b!1016153 m!937419))

(declare-fun m!937421 () Bool)

(assert (=> b!1016151 m!937421))

(check-sat (not start!88086) (not b!1016151) (not b!1016153) (not b!1016154) (not b!1016150) tp_is_empty!23593 (not b!1016152))
(check-sat)
(get-model)

(declare-fun d!121051 () Bool)

(assert (=> d!121051 (= (isEmpty!882 l!1114) ((_ is Nil!21550) l!1114))))

(assert (=> b!1016152 d!121051))

(declare-fun d!121053 () Bool)

(assert (=> d!121053 (= (head!963 l!1114) (h!22747 l!1114))))

(assert (=> b!1016153 d!121053))

(declare-fun d!121055 () Bool)

(declare-fun res!681652 () Bool)

(declare-fun e!571651 () Bool)

(assert (=> d!121055 (=> res!681652 e!571651)))

(assert (=> d!121055 (= res!681652 ((_ is Nil!21549) keys!40))))

(assert (=> d!121055 (= (forall!281 keys!40 lambda!1010) e!571651)))

(declare-fun b!1016208 () Bool)

(declare-fun e!571652 () Bool)

(assert (=> b!1016208 (= e!571651 e!571652)))

(declare-fun res!681653 () Bool)

(assert (=> b!1016208 (=> (not res!681653) (not e!571652))))

(declare-fun dynLambda!1905 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016208 (= res!681653 (dynLambda!1905 lambda!1010 (h!22746 keys!40)))))

(declare-fun b!1016209 () Bool)

(assert (=> b!1016209 (= e!571652 (forall!281 (t!30544 keys!40) lambda!1010))))

(assert (= (and d!121055 (not res!681652)) b!1016208))

(assert (= (and b!1016208 res!681653) b!1016209))

(declare-fun b_lambda!15481 () Bool)

(assert (=> (not b_lambda!15481) (not b!1016208)))

(declare-fun m!937447 () Bool)

(assert (=> b!1016208 m!937447))

(declare-fun m!937449 () Bool)

(assert (=> b!1016209 m!937449))

(assert (=> b!1016151 d!121055))

(declare-fun d!121057 () Bool)

(declare-fun isEmpty!885 (Option!603) Bool)

(assert (=> d!121057 (= (isDefined!401 (getValueByKey!552 l!1114 (h!22746 keys!40))) (not (isEmpty!885 (getValueByKey!552 l!1114 (h!22746 keys!40)))))))

(declare-fun bs!29482 () Bool)

(assert (= bs!29482 d!121057))

(assert (=> bs!29482 m!937415))

(declare-fun m!937451 () Bool)

(assert (=> bs!29482 m!937451))

(assert (=> b!1016154 d!121057))

(declare-fun b!1016227 () Bool)

(declare-fun e!571664 () Option!603)

(assert (=> b!1016227 (= e!571664 None!601)))

(declare-fun d!121061 () Bool)

(declare-fun c!102891 () Bool)

(assert (=> d!121061 (= c!102891 (and ((_ is Cons!21549) l!1114) (= (_1!7671 (h!22747 l!1114)) (h!22746 keys!40))))))

(declare-fun e!571663 () Option!603)

(assert (=> d!121061 (= (getValueByKey!552 l!1114 (h!22746 keys!40)) e!571663)))

(declare-fun b!1016224 () Bool)

(assert (=> b!1016224 (= e!571663 (Some!602 (_2!7671 (h!22747 l!1114))))))

(declare-fun b!1016225 () Bool)

(assert (=> b!1016225 (= e!571663 e!571664)))

(declare-fun c!102892 () Bool)

(assert (=> b!1016225 (= c!102892 (and ((_ is Cons!21549) l!1114) (not (= (_1!7671 (h!22747 l!1114)) (h!22746 keys!40)))))))

(declare-fun b!1016226 () Bool)

(assert (=> b!1016226 (= e!571664 (getValueByKey!552 (t!30545 l!1114) (h!22746 keys!40)))))

(assert (= (and d!121061 c!102891) b!1016224))

(assert (= (and d!121061 (not c!102891)) b!1016225))

(assert (= (and b!1016225 c!102892) b!1016226))

(assert (= (and b!1016225 (not c!102892)) b!1016227))

(declare-fun m!937457 () Bool)

(assert (=> b!1016226 m!937457))

(assert (=> b!1016154 d!121061))

(declare-fun d!121067 () Bool)

(declare-fun res!681668 () Bool)

(declare-fun e!571677 () Bool)

(assert (=> d!121067 (=> res!681668 e!571677)))

(assert (=> d!121067 (= res!681668 (or ((_ is Nil!21550) l!1114) ((_ is Nil!21550) (t!30545 l!1114))))))

(assert (=> d!121067 (= (isStrictlySorted!611 l!1114) e!571677)))

(declare-fun b!1016244 () Bool)

(declare-fun e!571678 () Bool)

(assert (=> b!1016244 (= e!571677 e!571678)))

(declare-fun res!681669 () Bool)

(assert (=> b!1016244 (=> (not res!681669) (not e!571678))))

(assert (=> b!1016244 (= res!681669 (bvslt (_1!7671 (h!22747 l!1114)) (_1!7671 (h!22747 (t!30545 l!1114)))))))

(declare-fun b!1016245 () Bool)

(assert (=> b!1016245 (= e!571678 (isStrictlySorted!611 (t!30545 l!1114)))))

(assert (= (and d!121067 (not res!681668)) b!1016244))

(assert (= (and b!1016244 res!681669) b!1016245))

(declare-fun m!937461 () Bool)

(assert (=> b!1016245 m!937461))

(assert (=> start!88086 d!121067))

(declare-fun b!1016252 () Bool)

(declare-fun e!571683 () Bool)

(declare-fun tp!70764 () Bool)

(assert (=> b!1016252 (= e!571683 (and tp_is_empty!23593 tp!70764))))

(assert (=> b!1016150 (= tp!70755 e!571683)))

(assert (= (and b!1016150 ((_ is Cons!21549) (t!30545 l!1114))) b!1016252))

(declare-fun b_lambda!15487 () Bool)

(assert (= b_lambda!15481 (or b!1016151 b_lambda!15487)))

(declare-fun bs!29484 () Bool)

(declare-fun d!121075 () Bool)

(assert (= bs!29484 (and d!121075 b!1016151)))

(declare-fun value!178 () B!1526)

(assert (=> bs!29484 (= (dynLambda!1905 lambda!1010 (h!22746 keys!40)) (= (getValueByKey!552 l!1114 (h!22746 keys!40)) (Some!602 value!178)))))

(assert (=> bs!29484 m!937415))

(assert (=> b!1016208 d!121075))

(check-sat (not b!1016209) (not bs!29484) (not b!1016245) (not d!121057) (not b!1016226) (not b!1016252) (not b_lambda!15487) tp_is_empty!23593)
(check-sat)
(get-model)

(declare-fun d!121093 () Bool)

(declare-fun res!681684 () Bool)

(declare-fun e!571710 () Bool)

(assert (=> d!121093 (=> res!681684 e!571710)))

(assert (=> d!121093 (= res!681684 (or ((_ is Nil!21550) (t!30545 l!1114)) ((_ is Nil!21550) (t!30545 (t!30545 l!1114)))))))

(assert (=> d!121093 (= (isStrictlySorted!611 (t!30545 l!1114)) e!571710)))

(declare-fun b!1016291 () Bool)

(declare-fun e!571711 () Bool)

(assert (=> b!1016291 (= e!571710 e!571711)))

(declare-fun res!681685 () Bool)

(assert (=> b!1016291 (=> (not res!681685) (not e!571711))))

(assert (=> b!1016291 (= res!681685 (bvslt (_1!7671 (h!22747 (t!30545 l!1114))) (_1!7671 (h!22747 (t!30545 (t!30545 l!1114))))))))

(declare-fun b!1016292 () Bool)

(assert (=> b!1016292 (= e!571711 (isStrictlySorted!611 (t!30545 (t!30545 l!1114))))))

(assert (= (and d!121093 (not res!681684)) b!1016291))

(assert (= (and b!1016291 res!681685) b!1016292))

(declare-fun m!937477 () Bool)

(assert (=> b!1016292 m!937477))

(assert (=> b!1016245 d!121093))

(declare-fun d!121095 () Bool)

(assert (=> d!121095 (= (isEmpty!885 (getValueByKey!552 l!1114 (h!22746 keys!40))) (not ((_ is Some!602) (getValueByKey!552 l!1114 (h!22746 keys!40)))))))

(assert (=> d!121057 d!121095))

(assert (=> bs!29484 d!121061))

(declare-fun d!121097 () Bool)

(declare-fun res!681686 () Bool)

(declare-fun e!571712 () Bool)

(assert (=> d!121097 (=> res!681686 e!571712)))

(assert (=> d!121097 (= res!681686 ((_ is Nil!21549) (t!30544 keys!40)))))

(assert (=> d!121097 (= (forall!281 (t!30544 keys!40) lambda!1010) e!571712)))

(declare-fun b!1016293 () Bool)

(declare-fun e!571713 () Bool)

(assert (=> b!1016293 (= e!571712 e!571713)))

(declare-fun res!681687 () Bool)

(assert (=> b!1016293 (=> (not res!681687) (not e!571713))))

(assert (=> b!1016293 (= res!681687 (dynLambda!1905 lambda!1010 (h!22746 (t!30544 keys!40))))))

(declare-fun b!1016294 () Bool)

(assert (=> b!1016294 (= e!571713 (forall!281 (t!30544 (t!30544 keys!40)) lambda!1010))))

(assert (= (and d!121097 (not res!681686)) b!1016293))

(assert (= (and b!1016293 res!681687) b!1016294))

(declare-fun b_lambda!15493 () Bool)

(assert (=> (not b_lambda!15493) (not b!1016293)))

(declare-fun m!937479 () Bool)

(assert (=> b!1016293 m!937479))

(declare-fun m!937481 () Bool)

(assert (=> b!1016294 m!937481))

(assert (=> b!1016209 d!121097))

(declare-fun b!1016298 () Bool)

(declare-fun e!571715 () Option!603)

(assert (=> b!1016298 (= e!571715 None!601)))

(declare-fun d!121099 () Bool)

(declare-fun c!102905 () Bool)

(assert (=> d!121099 (= c!102905 (and ((_ is Cons!21549) (t!30545 l!1114)) (= (_1!7671 (h!22747 (t!30545 l!1114))) (h!22746 keys!40))))))

(declare-fun e!571714 () Option!603)

(assert (=> d!121099 (= (getValueByKey!552 (t!30545 l!1114) (h!22746 keys!40)) e!571714)))

(declare-fun b!1016295 () Bool)

(assert (=> b!1016295 (= e!571714 (Some!602 (_2!7671 (h!22747 (t!30545 l!1114)))))))

(declare-fun b!1016296 () Bool)

(assert (=> b!1016296 (= e!571714 e!571715)))

(declare-fun c!102906 () Bool)

(assert (=> b!1016296 (= c!102906 (and ((_ is Cons!21549) (t!30545 l!1114)) (not (= (_1!7671 (h!22747 (t!30545 l!1114))) (h!22746 keys!40)))))))

(declare-fun b!1016297 () Bool)

(assert (=> b!1016297 (= e!571715 (getValueByKey!552 (t!30545 (t!30545 l!1114)) (h!22746 keys!40)))))

(assert (= (and d!121099 c!102905) b!1016295))

(assert (= (and d!121099 (not c!102905)) b!1016296))

(assert (= (and b!1016296 c!102906) b!1016297))

(assert (= (and b!1016296 (not c!102906)) b!1016298))

(declare-fun m!937483 () Bool)

(assert (=> b!1016297 m!937483))

(assert (=> b!1016226 d!121099))

(declare-fun b!1016299 () Bool)

(declare-fun e!571716 () Bool)

(declare-fun tp!70771 () Bool)

(assert (=> b!1016299 (= e!571716 (and tp_is_empty!23593 tp!70771))))

(assert (=> b!1016252 (= tp!70764 e!571716)))

(assert (= (and b!1016252 ((_ is Cons!21549) (t!30545 (t!30545 l!1114)))) b!1016299))

(declare-fun b_lambda!15495 () Bool)

(assert (= b_lambda!15493 (or b!1016151 b_lambda!15495)))

(declare-fun bs!29488 () Bool)

(declare-fun d!121101 () Bool)

(assert (= bs!29488 (and d!121101 b!1016151)))

(assert (=> bs!29488 (= (dynLambda!1905 lambda!1010 (h!22746 (t!30544 keys!40))) (= (getValueByKey!552 l!1114 (h!22746 (t!30544 keys!40))) (Some!602 value!178)))))

(declare-fun m!937485 () Bool)

(assert (=> bs!29488 m!937485))

(assert (=> b!1016293 d!121101))

(check-sat (not b!1016297) (not b!1016292) (not b_lambda!15495) (not b!1016294) tp_is_empty!23593 (not b!1016299) (not bs!29488) (not b_lambda!15487))
(check-sat)
