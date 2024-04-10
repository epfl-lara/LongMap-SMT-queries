; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87280 () Bool)

(assert start!87280)

(declare-fun res!679740 () Bool)

(declare-fun e!569187 () Bool)

(assert (=> start!87280 (=> (not res!679740) (not e!569187))))

(declare-datatypes ((B!1314 0))(
  ( (B!1315 (val!11741 Int)) )
))
(declare-datatypes ((tuple2!15028 0))(
  ( (tuple2!15029 (_1!7525 (_ BitVec 64)) (_2!7525 B!1314)) )
))
(declare-datatypes ((List!21333 0))(
  ( (Nil!21330) (Cons!21329 (h!22527 tuple2!15028) (t!30334 List!21333)) )
))
(declare-fun l!412 () List!21333)

(declare-fun isStrictlySorted!521 (List!21333) Bool)

(assert (=> start!87280 (= res!679740 (isStrictlySorted!521 l!412))))

(assert (=> start!87280 e!569187))

(declare-fun e!569188 () Bool)

(assert (=> start!87280 e!569188))

(declare-fun tp_is_empty!23381 () Bool)

(assert (=> start!87280 tp_is_empty!23381))

(declare-fun b!1011798 () Bool)

(declare-fun res!679739 () Bool)

(assert (=> b!1011798 (=> (not res!679739) (not e!569187))))

(declare-fun value!115 () B!1314)

(assert (=> b!1011798 (= res!679739 (and (is-Cons!21329 l!412) (= (_2!7525 (h!22527 l!412)) value!115)))))

(declare-fun b!1011799 () Bool)

(assert (=> b!1011799 (= e!569187 (not (isStrictlySorted!521 (t!30334 l!412))))))

(declare-fun b!1011800 () Bool)

(declare-fun tp!70217 () Bool)

(assert (=> b!1011800 (= e!569188 (and tp_is_empty!23381 tp!70217))))

(assert (= (and start!87280 res!679740) b!1011798))

(assert (= (and b!1011798 res!679739) b!1011799))

(assert (= (and start!87280 (is-Cons!21329 l!412)) b!1011800))

(declare-fun m!935747 () Bool)

(assert (=> start!87280 m!935747))

(declare-fun m!935749 () Bool)

(assert (=> b!1011799 m!935749))

(push 1)

(assert (not b!1011799))

(assert (not start!87280))

(assert (not b!1011800))

(assert tp_is_empty!23381)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120197 () Bool)

(declare-fun res!679757 () Bool)

(declare-fun e!569208 () Bool)

(assert (=> d!120197 (=> res!679757 e!569208)))

(assert (=> d!120197 (= res!679757 (or (is-Nil!21330 (t!30334 l!412)) (is-Nil!21330 (t!30334 (t!30334 l!412)))))))

(assert (=> d!120197 (= (isStrictlySorted!521 (t!30334 l!412)) e!569208)))

(declare-fun b!1011823 () Bool)

(declare-fun e!569210 () Bool)

(assert (=> b!1011823 (= e!569208 e!569210)))

(declare-fun res!679759 () Bool)

(assert (=> b!1011823 (=> (not res!679759) (not e!569210))))

(assert (=> b!1011823 (= res!679759 (bvslt (_1!7525 (h!22527 (t!30334 l!412))) (_1!7525 (h!22527 (t!30334 (t!30334 l!412))))))))

(declare-fun b!1011825 () Bool)

(assert (=> b!1011825 (= e!569210 (isStrictlySorted!521 (t!30334 (t!30334 l!412))))))

(assert (= (and d!120197 (not res!679757)) b!1011823))

(assert (= (and b!1011823 res!679759) b!1011825))

(declare-fun m!935753 () Bool)

(assert (=> b!1011825 m!935753))

(assert (=> b!1011799 d!120197))

(declare-fun d!120202 () Bool)

(declare-fun res!679761 () Bool)

(declare-fun e!569212 () Bool)

(assert (=> d!120202 (=> res!679761 e!569212)))

(assert (=> d!120202 (= res!679761 (or (is-Nil!21330 l!412) (is-Nil!21330 (t!30334 l!412))))))

(assert (=> d!120202 (= (isStrictlySorted!521 l!412) e!569212)))

(declare-fun b!1011826 () Bool)

(declare-fun e!569213 () Bool)

(assert (=> b!1011826 (= e!569212 e!569213)))

(declare-fun res!679762 () Bool)

(assert (=> b!1011826 (=> (not res!679762) (not e!569213))))

(assert (=> b!1011826 (= res!679762 (bvslt (_1!7525 (h!22527 l!412)) (_1!7525 (h!22527 (t!30334 l!412)))))))

