; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88086 () Bool)

(assert start!88086)

(declare-fun b!1016284 () Bool)

(assert (=> b!1016284 true))

(assert (=> b!1016284 true))

(declare-fun b!1016280 () Bool)

(declare-fun res!681675 () Bool)

(declare-fun e!571710 () Bool)

(assert (=> b!1016280 (=> (not res!681675) (not e!571710))))

(declare-datatypes ((List!21517 0))(
  ( (Nil!21514) (Cons!21513 (h!22711 (_ BitVec 64)) (t!30518 List!21517)) )
))
(declare-fun keys!40 () List!21517)

(assert (=> b!1016280 (= res!681675 (is-Cons!21513 keys!40))))

(declare-fun b!1016281 () Bool)

(declare-fun res!681676 () Bool)

(assert (=> b!1016281 (=> (not res!681676) (not e!571710))))

(declare-datatypes ((B!1526 0))(
  ( (B!1527 (val!11847 Int)) )
))
(declare-datatypes ((tuple2!15240 0))(
  ( (tuple2!15241 (_1!7631 (_ BitVec 64)) (_2!7631 B!1526)) )
))
(declare-fun newHead!31 () tuple2!15240)

(declare-datatypes ((List!21518 0))(
  ( (Nil!21515) (Cons!21514 (h!22712 tuple2!15240) (t!30519 List!21518)) )
))
(declare-fun l!1114 () List!21518)

(declare-fun head!964 (List!21518) tuple2!15240)

(assert (=> b!1016281 (= res!681676 (bvslt (_1!7631 newHead!31) (_1!7631 (head!964 l!1114))))))

(declare-fun b!1016282 () Bool)

(declare-fun res!681677 () Bool)

(assert (=> b!1016282 (=> (not res!681677) (not e!571710))))

(declare-fun isEmpty!877 (List!21518) Bool)

(assert (=> b!1016282 (= res!681677 (not (isEmpty!877 l!1114)))))

(declare-fun b!1016283 () Bool)

(declare-fun e!571711 () Bool)

(declare-fun tp_is_empty!23593 () Bool)

(declare-fun tp!70754 () Bool)

(assert (=> b!1016283 (= e!571711 (and tp_is_empty!23593 tp!70754))))

(declare-fun res!681674 () Bool)

(assert (=> start!88086 (=> (not res!681674) (not e!571710))))

(declare-fun isStrictlySorted!615 (List!21518) Bool)

(assert (=> start!88086 (= res!681674 (isStrictlySorted!615 l!1114))))

(assert (=> start!88086 e!571710))

(assert (=> start!88086 e!571711))

(assert (=> start!88086 true))

(assert (=> start!88086 tp_is_empty!23593))

(declare-fun res!681678 () Bool)

(assert (=> b!1016284 (=> (not res!681678) (not e!571710))))

(declare-fun lambda!1010 () Int)

(declare-fun forall!277 (List!21517 Int) Bool)

(assert (=> b!1016284 (= res!681678 (forall!277 keys!40 lambda!1010))))

(declare-fun b!1016285 () Bool)

(declare-datatypes ((Option!600 0))(
  ( (Some!599 (v!14450 B!1526)) (None!598) )
))
(declare-fun isDefined!398 (Option!600) Bool)

(declare-fun getValueByKey!549 (List!21518 (_ BitVec 64)) Option!600)

(assert (=> b!1016285 (= e!571710 (not (isDefined!398 (getValueByKey!549 l!1114 (h!22711 keys!40)))))))

(assert (= (and start!88086 res!681674) b!1016282))

(assert (= (and b!1016282 res!681677) b!1016284))

(assert (= (and b!1016284 res!681678) b!1016281))

(assert (= (and b!1016281 res!681676) b!1016280))

(assert (= (and b!1016280 res!681675) b!1016285))

(assert (= (and start!88086 (is-Cons!21514 l!1114)) b!1016283))

(declare-fun m!938015 () Bool)

(assert (=> b!1016285 m!938015))

(assert (=> b!1016285 m!938015))

(declare-fun m!938017 () Bool)

(assert (=> b!1016285 m!938017))

(declare-fun m!938019 () Bool)

(assert (=> b!1016284 m!938019))

(declare-fun m!938021 () Bool)

(assert (=> b!1016282 m!938021))

(declare-fun m!938023 () Bool)

(assert (=> start!88086 m!938023))

(declare-fun m!938025 () Bool)

(assert (=> b!1016281 m!938025))

(push 1)

(assert (not b!1016283))

(assert (not b!1016285))

(assert tp_is_empty!23593)

(assert (not b!1016284))

(assert (not start!88086))

(assert (not b!1016282))

(assert (not b!1016281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121193 () Bool)

(declare-fun isEmpty!880 (Option!600) Bool)

(assert (=> d!121193 (= (isDefined!398 (getValueByKey!549 l!1114 (h!22711 keys!40))) (not (isEmpty!880 (getValueByKey!549 l!1114 (h!22711 keys!40)))))))

(declare-fun bs!29510 () Bool)

(assert (= bs!29510 d!121193))

(assert (=> bs!29510 m!938015))

(declare-fun m!938055 () Bool)

(assert (=> bs!29510 m!938055))

(assert (=> b!1016285 d!121193))

(declare-fun b!1016365 () Bool)

(declare-fun e!571745 () Option!600)

(assert (=> b!1016365 (= e!571745 None!598)))

(declare-fun b!1016364 () Bool)

(assert (=> b!1016364 (= e!571745 (getValueByKey!549 (t!30519 l!1114) (h!22711 keys!40)))))

(declare-fun b!1016362 () Bool)

(declare-fun e!571744 () Option!600)

(assert (=> b!1016362 (= e!571744 (Some!599 (_2!7631 (h!22712 l!1114))))))

(declare-fun b!1016363 () Bool)

(assert (=> b!1016363 (= e!571744 e!571745)))

(declare-fun c!102928 () Bool)

(assert (=> b!1016363 (= c!102928 (and (is-Cons!21514 l!1114) (not (= (_1!7631 (h!22712 l!1114)) (h!22711 keys!40)))))))

(declare-fun d!121195 () Bool)

(declare-fun c!102927 () Bool)

(assert (=> d!121195 (= c!102927 (and (is-Cons!21514 l!1114) (= (_1!7631 (h!22712 l!1114)) (h!22711 keys!40))))))

(assert (=> d!121195 (= (getValueByKey!549 l!1114 (h!22711 keys!40)) e!571744)))

(assert (= (and d!121195 c!102927) b!1016362))

(assert (= (and d!121195 (not c!102927)) b!1016363))

(assert (= (and b!1016363 c!102928) b!1016364))

(assert (= (and b!1016363 (not c!102928)) b!1016365))

(declare-fun m!938061 () Bool)

(assert (=> b!1016364 m!938061))

(assert (=> b!1016285 d!121195))

(declare-fun d!121203 () Bool)

(declare-fun res!681731 () Bool)

(declare-fun e!571761 () Bool)

(assert (=> d!121203 (=> res!681731 e!571761)))

(assert (=> d!121203 (= res!681731 (or (is-Nil!21515 l!1114) (is-Nil!21515 (t!30519 l!1114))))))

(assert (=> d!121203 (= (isStrictlySorted!615 l!1114) e!571761)))

(declare-fun b!1016385 () Bool)

(declare-fun e!571762 () Bool)

(assert (=> b!1016385 (= e!571761 e!571762)))

(declare-fun res!681732 () Bool)

(assert (=> b!1016385 (=> (not res!681732) (not e!571762))))

(assert (=> b!1016385 (= res!681732 (bvslt (_1!7631 (h!22712 l!1114)) (_1!7631 (h!22712 (t!30519 l!1114)))))))

(declare-fun b!1016386 () Bool)

(assert (=> b!1016386 (= e!571762 (isStrictlySorted!615 (t!30519 l!1114)))))

(assert (= (and d!121203 (not res!681731)) b!1016385))

(assert (= (and b!1016385 res!681732) b!1016386))

(declare-fun m!938067 () Bool)

(assert (=> b!1016386 m!938067))

(assert (=> start!88086 d!121203))

(declare-fun d!121213 () Bool)

(assert (=> d!121213 (= (head!964 l!1114) (h!22712 l!1114))))

(assert (=> b!1016281 d!121213))

(declare-fun d!121217 () Bool)

(assert (=> d!121217 (= (isEmpty!877 l!1114) (is-Nil!21515 l!1114))))

(assert (=> b!1016282 d!121217))

(declare-fun d!121219 () Bool)

(declare-fun res!681737 () Bool)

(declare-fun e!571773 () Bool)

(assert (=> d!121219 (=> res!681737 e!571773)))

(assert (=> d!121219 (= res!681737 (is-Nil!21514 keys!40))))

(assert (=> d!121219 (= (forall!277 keys!40 lambda!1010) e!571773)))

(declare-fun b!1016403 () Bool)

(declare-fun e!571774 () Bool)

(assert (=> b!1016403 (= e!571773 e!571774)))

(declare-fun res!681738 () Bool)

(assert (=> b!1016403 (=> (not res!681738) (not e!571774))))

(declare-fun dynLambda!1913 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016403 (= res!681738 (dynLambda!1913 lambda!1010 (h!22711 keys!40)))))

(declare-fun b!1016404 () Bool)

(assert (=> b!1016404 (= e!571774 (forall!277 (t!30518 keys!40) lambda!1010))))

(assert (= (and d!121219 (not res!681737)) b!1016403))

(assert (= (and b!1016403 res!681738) b!1016404))

(declare-fun b_lambda!15503 () Bool)

(assert (=> (not b_lambda!15503) (not b!1016403)))

(declare-fun m!938073 () Bool)

(assert (=> b!1016403 m!938073))

(declare-fun m!938075 () Bool)

(assert (=> b!1016404 m!938075))

(assert (=> b!1016284 d!121219))

(declare-fun b!1016413 () Bool)

(declare-fun e!571781 () Bool)

(declare-fun tp!70766 () Bool)

(assert (=> b!1016413 (= e!571781 (and tp_is_empty!23593 tp!70766))))

(assert (=> b!1016283 (= tp!70754 e!571781)))

(assert (= (and b!1016283 (is-Cons!21514 (t!30519 l!1114))) b!1016413))

(declare-fun b_lambda!15505 () Bool)

(assert (= b_lambda!15503 (or b!1016284 b_lambda!15505)))

(declare-fun bs!29514 () Bool)

(declare-fun d!121223 () Bool)

(assert (= bs!29514 (and d!121223 b!1016284)))

(declare-fun value!178 () B!1526)

(assert (=> bs!29514 (= (dynLambda!1913 lambda!1010 (h!22711 keys!40)) (= (getValueByKey!549 l!1114 (h!22711 keys!40)) (Some!599 value!178)))))

(assert (=> bs!29514 m!938015))

(assert (=> b!1016403 d!121223))

(push 1)

(assert (not d!121193))

(assert (not b!1016404))

(assert tp_is_empty!23593)

(assert (not b_lambda!15505))

(assert (not bs!29514))

(assert (not b!1016364))

(assert (not b!1016386))

(assert (not b!1016413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> bs!29514 d!121195))

(declare-fun d!121239 () Bool)

(assert (=> d!121239 (= (isEmpty!880 (getValueByKey!549 l!1114 (h!22711 keys!40))) (not (is-Some!599 (getValueByKey!549 l!1114 (h!22711 keys!40)))))))

(assert (=> d!121193 d!121239))

(declare-fun d!121241 () Bool)

(declare-fun res!681749 () Bool)

(declare-fun e!571794 () Bool)

(assert (=> d!121241 (=> res!681749 e!571794)))

(assert (=> d!121241 (= res!681749 (or (is-Nil!21515 (t!30519 l!1114)) (is-Nil!21515 (t!30519 (t!30519 l!1114)))))))

