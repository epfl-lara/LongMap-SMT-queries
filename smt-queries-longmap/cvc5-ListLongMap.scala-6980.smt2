; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88420 () Bool)

(assert start!88420)

(declare-fun res!682445 () Bool)

(declare-fun e!572450 () Bool)

(assert (=> start!88420 (=> (not res!682445) (not e!572450))))

(declare-datatypes ((B!1586 0))(
  ( (B!1587 (val!11877 Int)) )
))
(declare-datatypes ((tuple2!15300 0))(
  ( (tuple2!15301 (_1!7661 (_ BitVec 64)) (_2!7661 B!1586)) )
))
(declare-datatypes ((List!21565 0))(
  ( (Nil!21562) (Cons!21561 (h!22759 tuple2!15300) (t!30566 List!21565)) )
))
(declare-fun l!1036 () List!21565)

(declare-fun isStrictlySorted!636 (List!21565) Bool)

(assert (=> start!88420 (= res!682445 (isStrictlySorted!636 l!1036))))

(assert (=> start!88420 e!572450))

(declare-fun e!572451 () Bool)

(assert (=> start!88420 e!572451))

(assert (=> start!88420 true))

(declare-fun b!1017492 () Bool)

(declare-fun res!682444 () Bool)

(assert (=> b!1017492 (=> (not res!682444) (not e!572450))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!620 0))(
  ( (Some!619 (v!14470 B!1586)) (None!618) )
))
(declare-fun isDefined!416 (Option!620) Bool)

(declare-fun getValueByKey!569 (List!21565 (_ BitVec 64)) Option!620)

(assert (=> b!1017492 (= res!682444 (isDefined!416 (getValueByKey!569 l!1036 key!271)))))

(declare-fun b!1017493 () Bool)

(declare-fun ListPrimitiveSize!127 (List!21565) Int)

(assert (=> b!1017493 (= e!572450 (< (ListPrimitiveSize!127 l!1036) 0))))

(declare-fun b!1017494 () Bool)

(declare-fun tp_is_empty!23653 () Bool)

(declare-fun tp!70900 () Bool)

(assert (=> b!1017494 (= e!572451 (and tp_is_empty!23653 tp!70900))))

(assert (= (and start!88420 res!682445) b!1017492))

(assert (= (and b!1017492 res!682444) b!1017493))

(assert (= (and start!88420 (is-Cons!21561 l!1036)) b!1017494))

(declare-fun m!938833 () Bool)

(assert (=> start!88420 m!938833))

(declare-fun m!938835 () Bool)

(assert (=> b!1017492 m!938835))

(assert (=> b!1017492 m!938835))

(declare-fun m!938837 () Bool)

(assert (=> b!1017492 m!938837))

(declare-fun m!938839 () Bool)

(assert (=> b!1017493 m!938839))

(push 1)

(assert (not b!1017493))

(assert (not b!1017492))

(assert tp_is_empty!23653)

(assert (not start!88420))

(assert (not b!1017494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121625 () Bool)

(declare-fun isEmpty!907 (Option!620) Bool)

(assert (=> d!121625 (= (isDefined!416 (getValueByKey!569 l!1036 key!271)) (not (isEmpty!907 (getValueByKey!569 l!1036 key!271))))))

(declare-fun bs!29612 () Bool)

(assert (= bs!29612 d!121625))

(assert (=> bs!29612 m!938835))

(declare-fun m!938859 () Bool)

(assert (=> bs!29612 m!938859))

(assert (=> b!1017492 d!121625))

(declare-fun d!121629 () Bool)

(declare-fun c!103017 () Bool)

(assert (=> d!121629 (= c!103017 (and (is-Cons!21561 l!1036) (= (_1!7661 (h!22759 l!1036)) key!271)))))

(declare-fun e!572474 () Option!620)

(assert (=> d!121629 (= (getValueByKey!569 l!1036 key!271) e!572474)))

(declare-fun b!1017533 () Bool)

(assert (=> b!1017533 (= e!572474 (Some!619 (_2!7661 (h!22759 l!1036))))))

(declare-fun b!1017535 () Bool)

(declare-fun e!572475 () Option!620)

(assert (=> b!1017535 (= e!572475 (getValueByKey!569 (t!30566 l!1036) key!271))))

(declare-fun b!1017536 () Bool)

(assert (=> b!1017536 (= e!572475 None!618)))

(declare-fun b!1017534 () Bool)

(assert (=> b!1017534 (= e!572474 e!572475)))

(declare-fun c!103018 () Bool)

(assert (=> b!1017534 (= c!103018 (and (is-Cons!21561 l!1036) (not (= (_1!7661 (h!22759 l!1036)) key!271))))))

(assert (= (and d!121629 c!103017) b!1017533))

(assert (= (and d!121629 (not c!103017)) b!1017534))

(assert (= (and b!1017534 c!103018) b!1017535))

(assert (= (and b!1017534 (not c!103018)) b!1017536))

(declare-fun m!938861 () Bool)

(assert (=> b!1017535 m!938861))

(assert (=> b!1017492 d!121629))

(declare-fun d!121633 () Bool)

(declare-fun lt!449463 () Int)

(assert (=> d!121633 (>= lt!449463 0)))

(declare-fun e!572483 () Int)

(assert (=> d!121633 (= lt!449463 e!572483)))

(declare-fun c!103024 () Bool)

(assert (=> d!121633 (= c!103024 (is-Nil!21562 l!1036))))

(assert (=> d!121633 (= (ListPrimitiveSize!127 l!1036) lt!449463)))

(declare-fun b!1017549 () Bool)

(assert (=> b!1017549 (= e!572483 0)))

(declare-fun b!1017550 () Bool)

(assert (=> b!1017550 (= e!572483 (+ 1 (ListPrimitiveSize!127 (t!30566 l!1036))))))

(assert (= (and d!121633 c!103024) b!1017549))

(assert (= (and d!121633 (not c!103024)) b!1017550))

(declare-fun m!938867 () Bool)

(assert (=> b!1017550 m!938867))

(assert (=> b!1017493 d!121633))

(declare-fun d!121639 () Bool)

(declare-fun res!682468 () Bool)

(declare-fun e!572495 () Bool)

(assert (=> d!121639 (=> res!682468 e!572495)))

(assert (=> d!121639 (= res!682468 (or (is-Nil!21562 l!1036) (is-Nil!21562 (t!30566 l!1036))))))

(assert (=> d!121639 (= (isStrictlySorted!636 l!1036) e!572495)))

(declare-fun b!1017565 () Bool)

(declare-fun e!572496 () Bool)

(assert (=> b!1017565 (= e!572495 e!572496)))

(declare-fun res!682469 () Bool)

(assert (=> b!1017565 (=> (not res!682469) (not e!572496))))

(assert (=> b!1017565 (= res!682469 (bvslt (_1!7661 (h!22759 l!1036)) (_1!7661 (h!22759 (t!30566 l!1036)))))))

(declare-fun b!1017566 () Bool)

(assert (=> b!1017566 (= e!572496 (isStrictlySorted!636 (t!30566 l!1036)))))

(assert (= (and d!121639 (not res!682468)) b!1017565))

(assert (= (and b!1017565 res!682469) b!1017566))

(declare-fun m!938875 () Bool)

(assert (=> b!1017566 m!938875))

(assert (=> start!88420 d!121639))

(declare-fun b!1017573 () Bool)

(declare-fun e!572499 () Bool)

(declare-fun tp!70909 () Bool)

(assert (=> b!1017573 (= e!572499 (and tp_is_empty!23653 tp!70909))))

(assert (=> b!1017494 (= tp!70900 e!572499)))

(assert (= (and b!1017494 (is-Cons!21561 (t!30566 l!1036))) b!1017573))

(push 1)

(assert (not b!1017535))

(assert (not b!1017566))

(assert (not d!121625))

(assert (not b!1017550))

(assert tp_is_empty!23653)

(assert (not b!1017573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

