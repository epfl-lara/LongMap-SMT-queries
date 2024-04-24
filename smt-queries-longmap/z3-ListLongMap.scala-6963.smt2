; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88150 () Bool)

(assert start!88150)

(declare-fun b!1016864 () Bool)

(assert (=> b!1016864 true))

(assert (=> b!1016864 true))

(declare-fun b!1016863 () Bool)

(declare-fun res!681698 () Bool)

(declare-fun e!572157 () Bool)

(assert (=> b!1016863 (=> (not res!681698) (not e!572157))))

(declare-datatypes ((B!1484 0))(
  ( (B!1485 (val!11826 Int)) )
))
(declare-datatypes ((tuple2!15202 0))(
  ( (tuple2!15203 (_1!7612 (_ BitVec 64)) (_2!7612 B!1484)) )
))
(declare-datatypes ((List!21467 0))(
  ( (Nil!21464) (Cons!21463 (h!22670 tuple2!15202) (t!30460 List!21467)) )
))
(declare-fun l!1114 () List!21467)

(declare-fun isEmpty!860 (List!21467) Bool)

(assert (=> b!1016863 (= res!681698 (not (isEmpty!860 l!1114)))))

(declare-fun b!1016865 () Bool)

(assert (=> b!1016865 (= e!572157 (= l!1114 Nil!21464))))

(declare-fun b!1016866 () Bool)

(declare-fun e!572156 () Bool)

(declare-fun tp_is_empty!23551 () Bool)

(declare-fun tp!70656 () Bool)

(assert (=> b!1016866 (= e!572156 (and tp_is_empty!23551 tp!70656))))

(declare-fun res!681697 () Bool)

(assert (=> b!1016864 (=> (not res!681697) (not e!572157))))

(declare-datatypes ((List!21468 0))(
  ( (Nil!21465) (Cons!21464 (h!22671 (_ BitVec 64)) (t!30461 List!21468)) )
))
(declare-fun keys!40 () List!21468)

(declare-fun lambda!911 () Int)

(declare-fun forall!261 (List!21468 Int) Bool)

(assert (=> b!1016864 (= res!681697 (forall!261 keys!40 lambda!911))))

(declare-fun res!681696 () Bool)

(assert (=> start!88150 (=> (not res!681696) (not e!572157))))

(declare-fun isStrictlySorted!585 (List!21467) Bool)

(assert (=> start!88150 (= res!681696 (isStrictlySorted!585 l!1114))))

(assert (=> start!88150 e!572157))

(assert (=> start!88150 e!572156))

(assert (=> start!88150 true))

(assert (=> start!88150 tp_is_empty!23551))

(assert (= (and start!88150 res!681696) b!1016863))

(assert (= (and b!1016863 res!681698) b!1016864))

(assert (= (and b!1016864 res!681697) b!1016865))

(get-info :version)

(assert (= (and start!88150 ((_ is Cons!21463) l!1114)) b!1016866))

(declare-fun m!939239 () Bool)

(assert (=> b!1016863 m!939239))

(declare-fun m!939241 () Bool)

(assert (=> b!1016864 m!939241))

(declare-fun m!939243 () Bool)

(assert (=> start!88150 m!939243))

(check-sat (not b!1016866) tp_is_empty!23551 (not b!1016864) (not b!1016863) (not start!88150))
(check-sat)
(get-model)

(declare-fun d!121463 () Bool)

(declare-fun res!681733 () Bool)

(declare-fun e!572186 () Bool)

(assert (=> d!121463 (=> res!681733 e!572186)))

(assert (=> d!121463 (= res!681733 (or ((_ is Nil!21464) l!1114) ((_ is Nil!21464) (t!30460 l!1114))))))

(assert (=> d!121463 (= (isStrictlySorted!585 l!1114) e!572186)))

(declare-fun b!1016919 () Bool)

(declare-fun e!572187 () Bool)

(assert (=> b!1016919 (= e!572186 e!572187)))

(declare-fun res!681734 () Bool)

(assert (=> b!1016919 (=> (not res!681734) (not e!572187))))

(assert (=> b!1016919 (= res!681734 (bvslt (_1!7612 (h!22670 l!1114)) (_1!7612 (h!22670 (t!30460 l!1114)))))))

(declare-fun b!1016920 () Bool)

(assert (=> b!1016920 (= e!572187 (isStrictlySorted!585 (t!30460 l!1114)))))

(assert (= (and d!121463 (not res!681733)) b!1016919))

(assert (= (and b!1016919 res!681734) b!1016920))

(declare-fun m!939263 () Bool)

(assert (=> b!1016920 m!939263))

(assert (=> start!88150 d!121463))

(declare-fun d!121469 () Bool)

(assert (=> d!121469 (= (isEmpty!860 l!1114) ((_ is Nil!21464) l!1114))))

(assert (=> b!1016863 d!121469))

(declare-fun d!121475 () Bool)

(declare-fun res!681749 () Bool)

(declare-fun e!572202 () Bool)

(assert (=> d!121475 (=> res!681749 e!572202)))

(assert (=> d!121475 (= res!681749 ((_ is Nil!21465) keys!40))))

(assert (=> d!121475 (= (forall!261 keys!40 lambda!911) e!572202)))

(declare-fun b!1016935 () Bool)

(declare-fun e!572203 () Bool)

(assert (=> b!1016935 (= e!572202 e!572203)))

(declare-fun res!681750 () Bool)

(assert (=> b!1016935 (=> (not res!681750) (not e!572203))))

(declare-fun dynLambda!1926 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016935 (= res!681750 (dynLambda!1926 lambda!911 (h!22671 keys!40)))))

(declare-fun b!1016936 () Bool)

(assert (=> b!1016936 (= e!572203 (forall!261 (t!30461 keys!40) lambda!911))))

(assert (= (and d!121475 (not res!681749)) b!1016935))

(assert (= (and b!1016935 res!681750) b!1016936))

(declare-fun b_lambda!15445 () Bool)

(assert (=> (not b_lambda!15445) (not b!1016935)))

(declare-fun m!939271 () Bool)

(assert (=> b!1016935 m!939271))

(declare-fun m!939273 () Bool)

(assert (=> b!1016936 m!939273))

(assert (=> b!1016864 d!121475))

(declare-fun b!1016953 () Bool)

(declare-fun e!572214 () Bool)

(declare-fun tp!70671 () Bool)

(assert (=> b!1016953 (= e!572214 (and tp_is_empty!23551 tp!70671))))

(assert (=> b!1016866 (= tp!70656 e!572214)))

(assert (= (and b!1016866 ((_ is Cons!21463) (t!30460 l!1114))) b!1016953))

(declare-fun b_lambda!15451 () Bool)

(assert (= b_lambda!15445 (or b!1016864 b_lambda!15451)))

(declare-fun bs!29473 () Bool)

(declare-fun d!121481 () Bool)

(assert (= bs!29473 (and d!121481 b!1016864)))

(declare-fun value!178 () B!1484)

(declare-datatypes ((Option!583 0))(
  ( (Some!582 (v!14433 B!1484)) (None!581) )
))
(declare-fun getValueByKey!532 (List!21467 (_ BitVec 64)) Option!583)

(assert (=> bs!29473 (= (dynLambda!1926 lambda!911 (h!22671 keys!40)) (= (getValueByKey!532 l!1114 (h!22671 keys!40)) (Some!582 value!178)))))

(declare-fun m!939279 () Bool)

(assert (=> bs!29473 m!939279))

(assert (=> b!1016935 d!121481))

(check-sat (not bs!29473) tp_is_empty!23551 (not b_lambda!15451) (not b!1016953) (not b!1016920) (not b!1016936))
(check-sat)
