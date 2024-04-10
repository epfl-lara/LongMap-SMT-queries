; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87916 () Bool)

(assert start!87916)

(declare-fun b!1015562 () Bool)

(assert (=> b!1015562 true))

(assert (=> b!1015562 true))

(declare-fun b!1015564 () Bool)

(declare-fun e!571311 () Bool)

(declare-fun tp_is_empty!23555 () Bool)

(declare-fun tp!70661 () Bool)

(assert (=> b!1015564 (= e!571311 (and tp_is_empty!23555 tp!70661))))

(declare-fun res!681196 () Bool)

(declare-fun e!571312 () Bool)

(assert (=> b!1015562 (=> (not res!681196) (not e!571312))))

(declare-datatypes ((List!21482 0))(
  ( (Nil!21479) (Cons!21478 (h!22676 (_ BitVec 64)) (t!30483 List!21482)) )
))
(declare-fun keys!40 () List!21482)

(declare-fun lambda!917 () Int)

(declare-fun forall!261 (List!21482 Int) Bool)

(assert (=> b!1015562 (= res!681196 (forall!261 keys!40 lambda!917))))

(declare-fun res!681198 () Bool)

(assert (=> start!87916 (=> (not res!681198) (not e!571312))))

(declare-datatypes ((B!1488 0))(
  ( (B!1489 (val!11828 Int)) )
))
(declare-datatypes ((tuple2!15202 0))(
  ( (tuple2!15203 (_1!7612 (_ BitVec 64)) (_2!7612 B!1488)) )
))
(declare-datatypes ((List!21483 0))(
  ( (Nil!21480) (Cons!21479 (h!22677 tuple2!15202) (t!30484 List!21483)) )
))
(declare-fun l!1114 () List!21483)

(declare-fun isStrictlySorted!599 (List!21483) Bool)

(assert (=> start!87916 (= res!681198 (isStrictlySorted!599 l!1114))))

(assert (=> start!87916 e!571312))

(assert (=> start!87916 e!571311))

(assert (=> start!87916 true))

(assert (=> start!87916 tp_is_empty!23555))

(declare-fun b!1015561 () Bool)

(declare-fun res!681197 () Bool)

(assert (=> b!1015561 (=> (not res!681197) (not e!571312))))

(declare-fun isEmpty!858 (List!21483) Bool)

(assert (=> b!1015561 (= res!681197 (not (isEmpty!858 l!1114)))))

(declare-fun b!1015563 () Bool)

(assert (=> b!1015563 (= e!571312 (= l!1114 Nil!21480))))

(assert (= (and start!87916 res!681198) b!1015561))

(assert (= (and b!1015561 res!681197) b!1015562))

(assert (= (and b!1015562 res!681196) b!1015563))

(assert (= (and start!87916 (is-Cons!21479 l!1114)) b!1015564))

(declare-fun m!937571 () Bool)

(assert (=> b!1015562 m!937571))

(declare-fun m!937573 () Bool)

(assert (=> start!87916 m!937573))

(declare-fun m!937575 () Bool)

(assert (=> b!1015561 m!937575))

(push 1)

(assert (not b!1015561))

(assert (not b!1015562))

(assert tp_is_empty!23555)

(assert (not start!87916))

(assert (not b!1015564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120981 () Bool)

(declare-fun res!681211 () Bool)

(declare-fun e!571325 () Bool)

(assert (=> d!120981 (=> res!681211 e!571325)))

(assert (=> d!120981 (= res!681211 (is-Nil!21479 keys!40))))

(assert (=> d!120981 (= (forall!261 keys!40 lambda!917) e!571325)))

(declare-fun b!1015581 () Bool)

(declare-fun e!571326 () Bool)

(assert (=> b!1015581 (= e!571325 e!571326)))

(declare-fun res!681212 () Bool)

(assert (=> b!1015581 (=> (not res!681212) (not e!571326))))

(declare-fun dynLambda!1902 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015581 (= res!681212 (dynLambda!1902 lambda!917 (h!22676 keys!40)))))

(declare-fun b!1015582 () Bool)

(assert (=> b!1015582 (= e!571326 (forall!261 (t!30483 keys!40) lambda!917))))

(assert (= (and d!120981 (not res!681211)) b!1015581))

(assert (= (and b!1015581 res!681212) b!1015582))

(declare-fun b_lambda!15427 () Bool)

(assert (=> (not b_lambda!15427) (not b!1015581)))

(declare-fun m!937577 () Bool)

(assert (=> b!1015581 m!937577))

(declare-fun m!937581 () Bool)

(assert (=> b!1015582 m!937581))

(assert (=> b!1015562 d!120981))

(declare-fun d!120987 () Bool)

(assert (=> d!120987 (= (isEmpty!858 l!1114) (is-Nil!21480 l!1114))))

(assert (=> b!1015561 d!120987))

(declare-fun d!120993 () Bool)

(declare-fun res!681231 () Bool)

(declare-fun e!571345 () Bool)

(assert (=> d!120993 (=> res!681231 e!571345)))

(assert (=> d!120993 (= res!681231 (or (is-Nil!21480 l!1114) (is-Nil!21480 (t!30484 l!1114))))))

(assert (=> d!120993 (= (isStrictlySorted!599 l!1114) e!571345)))

(declare-fun b!1015601 () Bool)

(declare-fun e!571346 () Bool)

(assert (=> b!1015601 (= e!571345 e!571346)))

(declare-fun res!681232 () Bool)

(assert (=> b!1015601 (=> (not res!681232) (not e!571346))))

(assert (=> b!1015601 (= res!681232 (bvslt (_1!7612 (h!22677 l!1114)) (_1!7612 (h!22677 (t!30484 l!1114)))))))

(declare-fun b!1015602 () Bool)

(assert (=> b!1015602 (= e!571346 (isStrictlySorted!599 (t!30484 l!1114)))))

(assert (= (and d!120993 (not res!681231)) b!1015601))

(assert (= (and b!1015601 res!681232) b!1015602))

(declare-fun m!937591 () Bool)

(assert (=> b!1015602 m!937591))

(assert (=> start!87916 d!120993))

(declare-fun b!1015618 () Bool)

(declare-fun e!571356 () Bool)

(declare-fun tp!70669 () Bool)

(assert (=> b!1015618 (= e!571356 (and tp_is_empty!23555 tp!70669))))

(assert (=> b!1015564 (= tp!70661 e!571356)))

(assert (= (and b!1015564 (is-Cons!21479 (t!30484 l!1114))) b!1015618))

(declare-fun b_lambda!15435 () Bool)

(assert (= b_lambda!15427 (or b!1015562 b_lambda!15435)))

(declare-fun bs!29451 () Bool)

(declare-fun d!121001 () Bool)

(assert (= bs!29451 (and d!121001 b!1015562)))

(declare-fun value!178 () B!1488)

(declare-datatypes ((Option!588 0))(
  ( (Some!587 (v!14438 B!1488)) (None!586) )
))
(declare-fun getValueByKey!537 (List!21483 (_ BitVec 64)) Option!588)

(assert (=> bs!29451 (= (dynLambda!1902 lambda!917 (h!22676 keys!40)) (= (getValueByKey!537 l!1114 (h!22676 keys!40)) (Some!587 value!178)))))

(declare-fun m!937597 () Bool)

(assert (=> bs!29451 m!937597))

(assert (=> b!1015581 d!121001))

(push 1)

