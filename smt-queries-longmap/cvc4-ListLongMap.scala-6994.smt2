; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88682 () Bool)

(assert start!88682)

(declare-fun res!683098 () Bool)

(declare-fun e!573282 () Bool)

(assert (=> start!88682 (=> (not res!683098) (not e!573282))))

(declare-datatypes ((B!1674 0))(
  ( (B!1675 (val!11921 Int)) )
))
(declare-datatypes ((tuple2!15388 0))(
  ( (tuple2!15389 (_1!7705 (_ BitVec 64)) (_2!7705 B!1674)) )
))
(declare-datatypes ((List!21609 0))(
  ( (Nil!21606) (Cons!21605 (h!22803 tuple2!15388) (t!30613 List!21609)) )
))
(declare-fun l!996 () List!21609)

(declare-fun isStrictlySorted!674 (List!21609) Bool)

(assert (=> start!88682 (= res!683098 (isStrictlySorted!674 l!996))))

(assert (=> start!88682 e!573282))

(declare-fun e!573280 () Bool)

(assert (=> start!88682 e!573280))

(assert (=> start!88682 true))

(declare-fun tp_is_empty!23741 () Bool)

(assert (=> start!88682 tp_is_empty!23741))

(declare-fun b!1018773 () Bool)

(declare-fun e!573281 () Bool)

(assert (=> b!1018773 (= e!573282 e!573281)))

(declare-fun res!683099 () Bool)

(assert (=> b!1018773 (=> (not res!683099) (not e!573281))))

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1018773 (= res!683099 (and (is-Cons!21605 l!996) (bvslt (_1!7705 (h!22803 l!996)) key!261)))))

(declare-fun lt!449598 () List!21609)

(declare-fun value!172 () B!1674)

(declare-fun insertStrictlySorted!352 (List!21609 (_ BitVec 64) B!1674) List!21609)

(assert (=> b!1018773 (= lt!449598 (insertStrictlySorted!352 l!996 key!261 value!172))))

(declare-fun b!1018775 () Bool)

(declare-fun tp!71101 () Bool)

(assert (=> b!1018775 (= e!573280 (and tp_is_empty!23741 tp!71101))))

(declare-fun b!1018774 () Bool)

(assert (=> b!1018774 (= e!573281 (not (isStrictlySorted!674 (t!30613 l!996))))))

(declare-fun b!1018772 () Bool)

(declare-fun res!683097 () Bool)

(assert (=> b!1018772 (=> (not res!683097) (not e!573282))))

(declare-fun containsKey!534 (List!21609 (_ BitVec 64)) Bool)

(assert (=> b!1018772 (= res!683097 (containsKey!534 l!996 key!261))))

(assert (= (and start!88682 res!683098) b!1018772))

(assert (= (and b!1018772 res!683097) b!1018773))

(assert (= (and b!1018773 res!683099) b!1018774))

(assert (= (and start!88682 (is-Cons!21605 l!996)) b!1018775))

(declare-fun m!939485 () Bool)

(assert (=> start!88682 m!939485))

(declare-fun m!939487 () Bool)

(assert (=> b!1018773 m!939487))

(declare-fun m!939489 () Bool)

(assert (=> b!1018774 m!939489))

(declare-fun m!939491 () Bool)

(assert (=> b!1018772 m!939491))

(push 1)

(assert (not start!88682))

(assert (not b!1018773))

(assert (not b!1018772))

(assert (not b!1018774))

(assert (not b!1018775))

(assert tp_is_empty!23741)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121943 () Bool)

(declare-fun res!683110 () Bool)

(declare-fun e!573301 () Bool)

(assert (=> d!121943 (=> res!683110 e!573301)))

(assert (=> d!121943 (= res!683110 (or (is-Nil!21606 (t!30613 l!996)) (is-Nil!21606 (t!30613 (t!30613 l!996)))))))

(assert (=> d!121943 (= (isStrictlySorted!674 (t!30613 l!996)) e!573301)))

(declare-fun b!1018802 () Bool)

(declare-fun e!573302 () Bool)

(assert (=> b!1018802 (= e!573301 e!573302)))

(declare-fun res!683111 () Bool)

(assert (=> b!1018802 (=> (not res!683111) (not e!573302))))

(assert (=> b!1018802 (= res!683111 (bvslt (_1!7705 (h!22803 (t!30613 l!996))) (_1!7705 (h!22803 (t!30613 (t!30613 l!996))))))))

(declare-fun b!1018803 () Bool)

(assert (=> b!1018803 (= e!573302 (isStrictlySorted!674 (t!30613 (t!30613 l!996))))))

(assert (= (and d!121943 (not res!683110)) b!1018802))

(assert (= (and b!1018802 res!683111) b!1018803))

(declare-fun m!939495 () Bool)

(assert (=> b!1018803 m!939495))

(assert (=> b!1018774 d!121943))

(declare-fun d!121947 () Bool)

(declare-fun res!683112 () Bool)

(declare-fun e!573303 () Bool)

(assert (=> d!121947 (=> res!683112 e!573303)))

