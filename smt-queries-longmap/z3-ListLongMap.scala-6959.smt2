; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87878 () Bool)

(assert start!87878)

(declare-fun b!1015385 () Bool)

(assert (=> b!1015385 true))

(assert (=> b!1015385 true))

(declare-fun res!681101 () Bool)

(declare-fun e!571198 () Bool)

(assert (=> start!87878 (=> (not res!681101) (not e!571198))))

(declare-datatypes ((B!1462 0))(
  ( (B!1463 (val!11815 Int)) )
))
(declare-datatypes ((tuple2!15176 0))(
  ( (tuple2!15177 (_1!7599 (_ BitVec 64)) (_2!7599 B!1462)) )
))
(declare-datatypes ((List!21462 0))(
  ( (Nil!21459) (Cons!21458 (h!22656 tuple2!15176) (t!30463 List!21462)) )
))
(declare-fun l!412 () List!21462)

(declare-fun isStrictlySorted!589 (List!21462) Bool)

(assert (=> start!87878 (= res!681101 (isStrictlySorted!589 l!412))))

(assert (=> start!87878 e!571198))

(declare-fun e!571197 () Bool)

(assert (=> start!87878 e!571197))

(declare-fun tp_is_empty!23529 () Bool)

(assert (=> start!87878 tp_is_empty!23529))

(declare-fun b!1015384 () Bool)

(declare-fun res!681102 () Bool)

(assert (=> b!1015384 (=> (not res!681102) (not e!571198))))

(declare-fun value!115 () B!1462)

(get-info :version)

(assert (=> b!1015384 (= res!681102 (and (or (not ((_ is Cons!21458) l!412)) (not (= (_2!7599 (h!22656 l!412)) value!115))) (or (not ((_ is Cons!21458) l!412)) (= (_2!7599 (h!22656 l!412)) value!115)) ((_ is Nil!21459) l!412)))))

(declare-fun lambda!896 () Int)

(declare-datatypes ((List!21463 0))(
  ( (Nil!21460) (Cons!21459 (h!22657 (_ BitVec 64)) (t!30464 List!21463)) )
))
(declare-fun forall!254 (List!21463 Int) Bool)

(assert (=> b!1015385 (= e!571198 (not (forall!254 Nil!21460 lambda!896)))))

(declare-fun b!1015386 () Bool)

(declare-fun tp!70613 () Bool)

(assert (=> b!1015386 (= e!571197 (and tp_is_empty!23529 tp!70613))))

(assert (= (and start!87878 res!681101) b!1015384))

(assert (= (and b!1015384 res!681102) b!1015385))

(assert (= (and start!87878 ((_ is Cons!21458) l!412)) b!1015386))

(declare-fun m!937513 () Bool)

(assert (=> start!87878 m!937513))

(declare-fun m!937515 () Bool)

(assert (=> b!1015385 m!937515))

(check-sat (not start!87878) (not b!1015385) (not b!1015386) tp_is_empty!23529)
(check-sat)
(get-model)

(declare-fun d!120957 () Bool)

(declare-fun res!681113 () Bool)

(declare-fun e!571209 () Bool)

(assert (=> d!120957 (=> res!681113 e!571209)))

(assert (=> d!120957 (= res!681113 (or ((_ is Nil!21459) l!412) ((_ is Nil!21459) (t!30463 l!412))))))

(assert (=> d!120957 (= (isStrictlySorted!589 l!412) e!571209)))

(declare-fun b!1015408 () Bool)

(declare-fun e!571210 () Bool)

(assert (=> b!1015408 (= e!571209 e!571210)))

(declare-fun res!681114 () Bool)

(assert (=> b!1015408 (=> (not res!681114) (not e!571210))))

(assert (=> b!1015408 (= res!681114 (bvslt (_1!7599 (h!22656 l!412)) (_1!7599 (h!22656 (t!30463 l!412)))))))

(declare-fun b!1015409 () Bool)

(assert (=> b!1015409 (= e!571210 (isStrictlySorted!589 (t!30463 l!412)))))

(assert (= (and d!120957 (not res!681113)) b!1015408))

(assert (= (and b!1015408 res!681114) b!1015409))

(declare-fun m!937521 () Bool)

(assert (=> b!1015409 m!937521))

(assert (=> start!87878 d!120957))

(declare-fun d!120961 () Bool)

(declare-fun res!681125 () Bool)

(declare-fun e!571221 () Bool)

(assert (=> d!120961 (=> res!681125 e!571221)))

(assert (=> d!120961 (= res!681125 ((_ is Nil!21460) Nil!21460))))

(assert (=> d!120961 (= (forall!254 Nil!21460 lambda!896) e!571221)))

(declare-fun b!1015420 () Bool)

(declare-fun e!571222 () Bool)

(assert (=> b!1015420 (= e!571221 e!571222)))

(declare-fun res!681126 () Bool)

(assert (=> b!1015420 (=> (not res!681126) (not e!571222))))

(declare-fun dynLambda!1900 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015420 (= res!681126 (dynLambda!1900 lambda!896 (h!22657 Nil!21460)))))

(declare-fun b!1015421 () Bool)

(assert (=> b!1015421 (= e!571222 (forall!254 (t!30464 Nil!21460) lambda!896))))

(assert (= (and d!120961 (not res!681125)) b!1015420))

(assert (= (and b!1015420 res!681126) b!1015421))

(declare-fun b_lambda!15417 () Bool)

(assert (=> (not b_lambda!15417) (not b!1015420)))

(declare-fun m!937527 () Bool)

(assert (=> b!1015420 m!937527))

(declare-fun m!937529 () Bool)

(assert (=> b!1015421 m!937529))

(assert (=> b!1015385 d!120961))

(declare-fun b!1015426 () Bool)

(declare-fun e!571225 () Bool)

(declare-fun tp!70619 () Bool)

(assert (=> b!1015426 (= e!571225 (and tp_is_empty!23529 tp!70619))))

(assert (=> b!1015386 (= tp!70613 e!571225)))

(assert (= (and b!1015386 ((_ is Cons!21458) (t!30463 l!412))) b!1015426))

(declare-fun b_lambda!15419 () Bool)

(assert (= b_lambda!15417 (or b!1015385 b_lambda!15419)))

(declare-fun bs!29436 () Bool)

(declare-fun d!120967 () Bool)

(assert (= bs!29436 (and d!120967 b!1015385)))

(declare-datatypes ((Option!584 0))(
  ( (Some!583 (v!14434 B!1462)) (None!582) )
))
(declare-fun getValueByKey!533 (List!21462 (_ BitVec 64)) Option!584)

(assert (=> bs!29436 (= (dynLambda!1900 lambda!896 (h!22657 Nil!21460)) (= (getValueByKey!533 l!412 (h!22657 Nil!21460)) (Some!583 value!115)))))

(declare-fun m!937531 () Bool)

(assert (=> bs!29436 m!937531))

(assert (=> b!1015420 d!120967))

(check-sat (not b!1015409) (not b!1015421) (not b_lambda!15419) (not bs!29436) tp_is_empty!23529 (not b!1015426))
(check-sat)
