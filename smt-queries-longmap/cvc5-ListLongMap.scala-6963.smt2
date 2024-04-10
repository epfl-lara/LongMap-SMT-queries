; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87912 () Bool)

(assert start!87912)

(declare-fun b!1015530 () Bool)

(assert (=> b!1015530 true))

(assert (=> b!1015530 true))

(declare-fun res!681178 () Bool)

(declare-fun e!571299 () Bool)

(assert (=> b!1015530 (=> (not res!681178) (not e!571299))))

(declare-datatypes ((List!21478 0))(
  ( (Nil!21475) (Cons!21474 (h!22672 (_ BitVec 64)) (t!30479 List!21478)) )
))
(declare-fun keys!40 () List!21478)

(declare-fun lambda!911 () Int)

(declare-fun forall!259 (List!21478 Int) Bool)

(assert (=> b!1015530 (= res!681178 (forall!259 keys!40 lambda!911))))

(declare-fun b!1015529 () Bool)

(declare-fun res!681180 () Bool)

(assert (=> b!1015529 (=> (not res!681180) (not e!571299))))

(declare-datatypes ((B!1484 0))(
  ( (B!1485 (val!11826 Int)) )
))
(declare-datatypes ((tuple2!15198 0))(
  ( (tuple2!15199 (_1!7610 (_ BitVec 64)) (_2!7610 B!1484)) )
))
(declare-datatypes ((List!21479 0))(
  ( (Nil!21476) (Cons!21475 (h!22673 tuple2!15198) (t!30480 List!21479)) )
))
(declare-fun l!1114 () List!21479)

(declare-fun isEmpty!856 (List!21479) Bool)

(assert (=> b!1015529 (= res!681180 (not (isEmpty!856 l!1114)))))

(declare-fun b!1015532 () Bool)

(declare-fun e!571300 () Bool)

(declare-fun tp_is_empty!23551 () Bool)

(declare-fun tp!70655 () Bool)

(assert (=> b!1015532 (= e!571300 (and tp_is_empty!23551 tp!70655))))

(declare-fun b!1015531 () Bool)

(assert (=> b!1015531 (= e!571299 (= l!1114 Nil!21476))))

(declare-fun res!681179 () Bool)

(assert (=> start!87912 (=> (not res!681179) (not e!571299))))

(declare-fun isStrictlySorted!597 (List!21479) Bool)

(assert (=> start!87912 (= res!681179 (isStrictlySorted!597 l!1114))))

(assert (=> start!87912 e!571299))

(assert (=> start!87912 e!571300))

(assert (=> start!87912 true))

(assert (=> start!87912 tp_is_empty!23551))

(assert (= (and start!87912 res!681179) b!1015529))

(assert (= (and b!1015529 res!681180) b!1015530))

(assert (= (and b!1015530 res!681178) b!1015531))

(assert (= (and start!87912 (is-Cons!21475 l!1114)) b!1015532))

(declare-fun m!937559 () Bool)

(assert (=> b!1015530 m!937559))

(declare-fun m!937561 () Bool)

(assert (=> b!1015529 m!937561))

(declare-fun m!937563 () Bool)

(assert (=> start!87912 m!937563))

(push 1)

(assert (not b!1015530))

(assert (not start!87912))

(assert (not b!1015529))

(assert tp_is_empty!23551)

(assert (not b!1015532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120983 () Bool)

(declare-fun res!681213 () Bool)

(declare-fun e!571327 () Bool)

(assert (=> d!120983 (=> res!681213 e!571327)))

(assert (=> d!120983 (= res!681213 (is-Nil!21475 keys!40))))

(assert (=> d!120983 (= (forall!259 keys!40 lambda!911) e!571327)))

(declare-fun b!1015583 () Bool)

(declare-fun e!571328 () Bool)

(assert (=> b!1015583 (= e!571327 e!571328)))

(declare-fun res!681214 () Bool)

(assert (=> b!1015583 (=> (not res!681214) (not e!571328))))

(declare-fun dynLambda!1901 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015583 (= res!681214 (dynLambda!1901 lambda!911 (h!22672 keys!40)))))

(declare-fun b!1015584 () Bool)

(assert (=> b!1015584 (= e!571328 (forall!259 (t!30479 keys!40) lambda!911))))

(assert (= (and d!120983 (not res!681213)) b!1015583))

(assert (= (and b!1015583 res!681214) b!1015584))

(declare-fun b_lambda!15429 () Bool)

(assert (=> (not b_lambda!15429) (not b!1015583)))

(declare-fun m!937579 () Bool)

(assert (=> b!1015583 m!937579))

(declare-fun m!937583 () Bool)

(assert (=> b!1015584 m!937583))

(assert (=> b!1015530 d!120983))

(declare-fun d!120989 () Bool)

(assert (=> d!120989 (= (isEmpty!856 l!1114) (is-Nil!21476 l!1114))))

(assert (=> b!1015529 d!120989))

(declare-fun d!120995 () Bool)

(declare-fun res!681233 () Bool)

(declare-fun e!571347 () Bool)

(assert (=> d!120995 (=> res!681233 e!571347)))

(assert (=> d!120995 (= res!681233 (or (is-Nil!21476 l!1114) (is-Nil!21476 (t!30480 l!1114))))))

(assert (=> d!120995 (= (isStrictlySorted!597 l!1114) e!571347)))

(declare-fun b!1015603 () Bool)

(declare-fun e!571348 () Bool)

(assert (=> b!1015603 (= e!571347 e!571348)))

(declare-fun res!681234 () Bool)

(assert (=> b!1015603 (=> (not res!681234) (not e!571348))))

(assert (=> b!1015603 (= res!681234 (bvslt (_1!7610 (h!22673 l!1114)) (_1!7610 (h!22673 (t!30480 l!1114)))))))

(declare-fun b!1015604 () Bool)

(assert (=> b!1015604 (= e!571348 (isStrictlySorted!597 (t!30480 l!1114)))))

(assert (= (and d!120995 (not res!681233)) b!1015603))

(assert (= (and b!1015603 res!681234) b!1015604))

(declare-fun m!937593 () Bool)

(assert (=> b!1015604 m!937593))

(assert (=> start!87912 d!120995))

(declare-fun b!1015619 () Bool)

(declare-fun e!571357 () Bool)

(declare-fun tp!70670 () Bool)

(assert (=> b!1015619 (= e!571357 (and tp_is_empty!23551 tp!70670))))

(assert (=> b!1015532 (= tp!70655 e!571357)))

(assert (= (and b!1015532 (is-Cons!21475 (t!30480 l!1114))) b!1015619))

(declare-fun b_lambda!15437 () Bool)

(assert (= b_lambda!15429 (or b!1015530 b_lambda!15437)))

(declare-fun bs!29452 () Bool)

(declare-fun d!121003 () Bool)

(assert (= bs!29452 (and d!121003 b!1015530)))

(declare-fun value!178 () B!1484)

(declare-datatypes ((Option!586 0))(
  ( (Some!585 (v!14436 B!1484)) (None!584) )
))
(declare-fun getValueByKey!535 (List!21479 (_ BitVec 64)) Option!586)

(assert (=> bs!29452 (= (dynLambda!1901 lambda!911 (h!22672 keys!40)) (= (getValueByKey!535 l!1114 (h!22672 keys!40)) (Some!585 value!178)))))

(declare-fun m!937599 () Bool)

(assert (=> bs!29452 m!937599))

(assert (=> b!1015583 d!121003))

(push 1)

(assert (not b!1015619))

(assert (not bs!29452))

(assert (not b!1015604))

(assert tp_is_empty!23551)

(assert (not b!1015584))

(assert (not b_lambda!15437))

