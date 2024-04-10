; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138374 () Bool)

(assert start!138374)

(declare-fun res!1083251 () Bool)

(declare-fun e!885695 () Bool)

(assert (=> start!138374 (=> (not res!1083251) (not e!885695))))

(declare-datatypes ((B!3020 0))(
  ( (B!3021 (val!19872 Int)) )
))
(declare-datatypes ((tuple2!25912 0))(
  ( (tuple2!25913 (_1!12967 (_ BitVec 64)) (_2!12967 B!3020)) )
))
(declare-datatypes ((List!36992 0))(
  ( (Nil!36989) (Cons!36988 (h!38531 tuple2!25912) (t!51922 List!36992)) )
))
(declare-fun l!636 () List!36992)

(declare-fun isStrictlySorted!1214 (List!36992) Bool)

(assert (=> start!138374 (= res!1083251 (isStrictlySorted!1214 l!636))))

(assert (=> start!138374 e!885695))

(declare-fun e!885696 () Bool)

(assert (=> start!138374 e!885696))

(assert (=> start!138374 true))

(declare-fun b!1586127 () Bool)

(declare-fun res!1083250 () Bool)

(assert (=> b!1586127 (=> (not res!1083250) (not e!885695))))

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1586127 (= res!1083250 (and (or (not (is-Cons!36988 l!636)) (not (= (_1!12967 (h!38531 l!636)) key!185))) (or (not (is-Cons!36988 l!636)) (bvsle (_1!12967 (h!38531 l!636)) key!185)) (is-Cons!36988 l!636) (bvslt (_1!12967 (h!38531 l!636)) key!185)))))

(declare-fun b!1586128 () Bool)

(assert (=> b!1586128 (= e!885695 (not (isStrictlySorted!1214 (t!51922 l!636))))))

(declare-fun b!1586129 () Bool)

(declare-fun tp_is_empty!39553 () Bool)

(declare-fun tp!115362 () Bool)

(assert (=> b!1586129 (= e!885696 (and tp_is_empty!39553 tp!115362))))

(assert (= (and start!138374 res!1083251) b!1586127))

(assert (= (and b!1586127 res!1083250) b!1586128))

(assert (= (and start!138374 (is-Cons!36988 l!636)) b!1586129))

(declare-fun m!1454661 () Bool)

(assert (=> start!138374 m!1454661))

(declare-fun m!1454663 () Bool)

(assert (=> b!1586128 m!1454663))

(push 1)

(assert (not b!1586128))

(assert (not start!138374))

(assert (not b!1586129))

(assert tp_is_empty!39553)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167871 () Bool)

(declare-fun res!1083273 () Bool)

(declare-fun e!885718 () Bool)

(assert (=> d!167871 (=> res!1083273 e!885718)))

(assert (=> d!167871 (= res!1083273 (or (is-Nil!36989 (t!51922 l!636)) (is-Nil!36989 (t!51922 (t!51922 l!636)))))))

(assert (=> d!167871 (= (isStrictlySorted!1214 (t!51922 l!636)) e!885718)))

(declare-fun b!1586157 () Bool)

(declare-fun e!885720 () Bool)

(assert (=> b!1586157 (= e!885718 e!885720)))

(declare-fun res!1083275 () Bool)

(assert (=> b!1586157 (=> (not res!1083275) (not e!885720))))

(assert (=> b!1586157 (= res!1083275 (bvslt (_1!12967 (h!38531 (t!51922 l!636))) (_1!12967 (h!38531 (t!51922 (t!51922 l!636))))))))

(declare-fun b!1586159 () Bool)

(assert (=> b!1586159 (= e!885720 (isStrictlySorted!1214 (t!51922 (t!51922 l!636))))))

(assert (= (and d!167871 (not res!1083273)) b!1586157))

(assert (= (and b!1586157 res!1083275) b!1586159))

(declare-fun m!1454673 () Bool)

(assert (=> b!1586159 m!1454673))

(assert (=> b!1586128 d!167871))

(declare-fun d!167875 () Bool)

(declare-fun res!1083278 () Bool)

(declare-fun e!885723 () Bool)

(assert (=> d!167875 (=> res!1083278 e!885723)))

(assert (=> d!167875 (= res!1083278 (or (is-Nil!36989 l!636) (is-Nil!36989 (t!51922 l!636))))))

(assert (=> d!167875 (= (isStrictlySorted!1214 l!636) e!885723)))

(declare-fun b!1586162 () Bool)

(declare-fun e!885724 () Bool)

(assert (=> b!1586162 (= e!885723 e!885724)))

(declare-fun res!1083279 () Bool)

(assert (=> b!1586162 (=> (not res!1083279) (not e!885724))))

(assert (=> b!1586162 (= res!1083279 (bvslt (_1!12967 (h!38531 l!636)) (_1!12967 (h!38531 (t!51922 l!636)))))))

(declare-fun b!1586163 () Bool)

(assert (=> b!1586163 (= e!885724 (isStrictlySorted!1214 (t!51922 l!636)))))

(assert (= (and d!167875 (not res!1083278)) b!1586162))

(assert (= (and b!1586162 res!1083279) b!1586163))

(assert (=> b!1586163 m!1454663))

(assert (=> start!138374 d!167875))

(declare-fun b!1586173 () Bool)

(declare-fun e!885730 () Bool)

(declare-fun tp!115374 () Bool)

(assert (=> b!1586173 (= e!885730 (and tp_is_empty!39553 tp!115374))))

(assert (=> b!1586129 (= tp!115362 e!885730)))

(assert (= (and b!1586129 (is-Cons!36988 (t!51922 l!636))) b!1586173))

(push 1)

(assert (not b!1586163))

(assert (not b!1586159))

(assert (not b!1586173))

(assert tp_is_empty!39553)

(check-sat)

