; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88424 () Bool)

(assert start!88424)

(declare-fun res!682457 () Bool)

(declare-fun e!572462 () Bool)

(assert (=> start!88424 (=> (not res!682457) (not e!572462))))

(declare-datatypes ((B!1590 0))(
  ( (B!1591 (val!11879 Int)) )
))
(declare-datatypes ((tuple2!15304 0))(
  ( (tuple2!15305 (_1!7663 (_ BitVec 64)) (_2!7663 B!1590)) )
))
(declare-datatypes ((List!21567 0))(
  ( (Nil!21564) (Cons!21563 (h!22761 tuple2!15304) (t!30568 List!21567)) )
))
(declare-fun l!1036 () List!21567)

(declare-fun isStrictlySorted!638 (List!21567) Bool)

(assert (=> start!88424 (= res!682457 (isStrictlySorted!638 l!1036))))

(assert (=> start!88424 e!572462))

(declare-fun e!572463 () Bool)

(assert (=> start!88424 e!572463))

(assert (=> start!88424 true))

(declare-fun b!1017510 () Bool)

(declare-fun res!682456 () Bool)

(assert (=> b!1017510 (=> (not res!682456) (not e!572462))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!622 0))(
  ( (Some!621 (v!14472 B!1590)) (None!620) )
))
(declare-fun isDefined!418 (Option!622) Bool)

(declare-fun getValueByKey!571 (List!21567 (_ BitVec 64)) Option!622)

(assert (=> b!1017510 (= res!682456 (isDefined!418 (getValueByKey!571 l!1036 key!271)))))

(declare-fun b!1017511 () Bool)

(declare-fun ListPrimitiveSize!129 (List!21567) Int)

(assert (=> b!1017511 (= e!572462 (< (ListPrimitiveSize!129 l!1036) 0))))

(declare-fun b!1017512 () Bool)

(declare-fun tp_is_empty!23657 () Bool)

(declare-fun tp!70906 () Bool)

(assert (=> b!1017512 (= e!572463 (and tp_is_empty!23657 tp!70906))))

(assert (= (and start!88424 res!682457) b!1017510))

(assert (= (and b!1017510 res!682456) b!1017511))

(assert (= (and start!88424 (is-Cons!21563 l!1036)) b!1017512))

(declare-fun m!938849 () Bool)

(assert (=> start!88424 m!938849))

(declare-fun m!938851 () Bool)

(assert (=> b!1017510 m!938851))

(assert (=> b!1017510 m!938851))

(declare-fun m!938853 () Bool)

(assert (=> b!1017510 m!938853))

(declare-fun m!938855 () Bool)

(assert (=> b!1017511 m!938855))

(push 1)

(assert tp_is_empty!23657)

(assert (not b!1017512))

(assert (not b!1017511))

(assert (not start!88424))

(assert (not b!1017510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121623 () Bool)

(declare-fun isEmpty!908 (Option!622) Bool)

(assert (=> d!121623 (= (isDefined!418 (getValueByKey!571 l!1036 key!271)) (not (isEmpty!908 (getValueByKey!571 l!1036 key!271))))))

(declare-fun bs!29611 () Bool)

(assert (= bs!29611 d!121623))

(assert (=> bs!29611 m!938851))

(declare-fun m!938857 () Bool)

(assert (=> bs!29611 m!938857))

(assert (=> b!1017510 d!121623))

(declare-fun b!1017539 () Bool)

(declare-fun e!572477 () Option!622)

(assert (=> b!1017539 (= e!572477 (getValueByKey!571 (t!30568 l!1036) key!271))))

(declare-fun b!1017540 () Bool)

(assert (=> b!1017540 (= e!572477 None!620)))

(declare-fun d!121627 () Bool)

(declare-fun c!103019 () Bool)

(assert (=> d!121627 (= c!103019 (and (is-Cons!21563 l!1036) (= (_1!7663 (h!22761 l!1036)) key!271)))))

(declare-fun e!572476 () Option!622)

(assert (=> d!121627 (= (getValueByKey!571 l!1036 key!271) e!572476)))

(declare-fun b!1017537 () Bool)

(assert (=> b!1017537 (= e!572476 (Some!621 (_2!7663 (h!22761 l!1036))))))

(declare-fun b!1017538 () Bool)

(assert (=> b!1017538 (= e!572476 e!572477)))

(declare-fun c!103020 () Bool)

(assert (=> b!1017538 (= c!103020 (and (is-Cons!21563 l!1036) (not (= (_1!7663 (h!22761 l!1036)) key!271))))))

(assert (= (and d!121627 c!103019) b!1017537))

(assert (= (and d!121627 (not c!103019)) b!1017538))

(assert (= (and b!1017538 c!103020) b!1017539))

(assert (= (and b!1017538 (not c!103020)) b!1017540))

(declare-fun m!938863 () Bool)

(assert (=> b!1017539 m!938863))

(assert (=> b!1017510 d!121627))

(declare-fun d!121635 () Bool)

(declare-fun lt!449466 () Int)

(assert (=> d!121635 (>= lt!449466 0)))

(declare-fun e!572494 () Int)

(assert (=> d!121635 (= lt!449466 e!572494)))

(declare-fun c!103027 () Bool)

(assert (=> d!121635 (= c!103027 (is-Nil!21564 l!1036))))

(assert (=> d!121635 (= (ListPrimitiveSize!129 l!1036) lt!449466)))

(declare-fun b!1017563 () Bool)

(assert (=> b!1017563 (= e!572494 0)))

(declare-fun b!1017564 () Bool)

(assert (=> b!1017564 (= e!572494 (+ 1 (ListPrimitiveSize!129 (t!30568 l!1036))))))

(assert (= (and d!121635 c!103027) b!1017563))

(assert (= (and d!121635 (not c!103027)) b!1017564))

(declare-fun m!938873 () Bool)

(assert (=> b!1017564 m!938873))

(assert (=> b!1017511 d!121635))

(declare-fun d!121645 () Bool)

(declare-fun res!682474 () Bool)

(declare-fun e!572508 () Bool)

(assert (=> d!121645 (=> res!682474 e!572508)))

(assert (=> d!121645 (= res!682474 (or (is-Nil!21564 l!1036) (is-Nil!21564 (t!30568 l!1036))))))

(assert (=> d!121645 (= (isStrictlySorted!638 l!1036) e!572508)))

(declare-fun b!1017584 () Bool)

(declare-fun e!572509 () Bool)

(assert (=> b!1017584 (= e!572508 e!572509)))

(declare-fun res!682475 () Bool)

(assert (=> b!1017584 (=> (not res!682475) (not e!572509))))

