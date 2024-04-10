; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138378 () Bool)

(assert start!138378)

(declare-fun res!1083263 () Bool)

(declare-fun e!885707 () Bool)

(assert (=> start!138378 (=> (not res!1083263) (not e!885707))))

(declare-datatypes ((B!3024 0))(
  ( (B!3025 (val!19874 Int)) )
))
(declare-datatypes ((tuple2!25916 0))(
  ( (tuple2!25917 (_1!12969 (_ BitVec 64)) (_2!12969 B!3024)) )
))
(declare-datatypes ((List!36994 0))(
  ( (Nil!36991) (Cons!36990 (h!38533 tuple2!25916) (t!51924 List!36994)) )
))
(declare-fun l!636 () List!36994)

(declare-fun isStrictlySorted!1216 (List!36994) Bool)

(assert (=> start!138378 (= res!1083263 (isStrictlySorted!1216 l!636))))

(assert (=> start!138378 e!885707))

(declare-fun e!885708 () Bool)

(assert (=> start!138378 e!885708))

(assert (=> start!138378 true))

(declare-fun b!1586145 () Bool)

(declare-fun res!1083262 () Bool)

(assert (=> b!1586145 (=> (not res!1083262) (not e!885707))))

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1586145 (= res!1083262 (and (or (not (is-Cons!36990 l!636)) (not (= (_1!12969 (h!38533 l!636)) key!185))) (or (not (is-Cons!36990 l!636)) (bvsle (_1!12969 (h!38533 l!636)) key!185)) (is-Cons!36990 l!636) (bvslt (_1!12969 (h!38533 l!636)) key!185)))))

(declare-fun b!1586146 () Bool)

(assert (=> b!1586146 (= e!885707 (not (isStrictlySorted!1216 (t!51924 l!636))))))

(declare-fun b!1586147 () Bool)

(declare-fun tp_is_empty!39557 () Bool)

(declare-fun tp!115368 () Bool)

(assert (=> b!1586147 (= e!885708 (and tp_is_empty!39557 tp!115368))))

(assert (= (and start!138378 res!1083263) b!1586145))

(assert (= (and b!1586145 res!1083262) b!1586146))

(assert (= (and start!138378 (is-Cons!36990 l!636)) b!1586147))

(declare-fun m!1454669 () Bool)

(assert (=> start!138378 m!1454669))

(declare-fun m!1454671 () Bool)

(assert (=> b!1586146 m!1454671))

(push 1)

(assert (not start!138378))

(assert (not b!1586146))

(assert (not b!1586147))

(assert tp_is_empty!39557)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167877 () Bool)

(declare-fun res!1083284 () Bool)

(declare-fun e!885735 () Bool)

(assert (=> d!167877 (=> res!1083284 e!885735)))

(assert (=> d!167877 (= res!1083284 (or (is-Nil!36991 l!636) (is-Nil!36991 (t!51924 l!636))))))

(assert (=> d!167877 (= (isStrictlySorted!1216 l!636) e!885735)))

(declare-fun b!1586178 () Bool)

(declare-fun e!885736 () Bool)

(assert (=> b!1586178 (= e!885735 e!885736)))

(declare-fun res!1083285 () Bool)

(assert (=> b!1586178 (=> (not res!1083285) (not e!885736))))

(assert (=> b!1586178 (= res!1083285 (bvslt (_1!12969 (h!38533 l!636)) (_1!12969 (h!38533 (t!51924 l!636)))))))

(declare-fun b!1586179 () Bool)

(assert (=> b!1586179 (= e!885736 (isStrictlySorted!1216 (t!51924 l!636)))))

(assert (= (and d!167877 (not res!1083284)) b!1586178))

(assert (= (and b!1586178 res!1083285) b!1586179))

(assert (=> b!1586179 m!1454671))

(assert (=> start!138378 d!167877))

(declare-fun d!167879 () Bool)

(declare-fun res!1083286 () Bool)

(declare-fun e!885737 () Bool)

(assert (=> d!167879 (=> res!1083286 e!885737)))

(assert (=> d!167879 (= res!1083286 (or (is-Nil!36991 (t!51924 l!636)) (is-Nil!36991 (t!51924 (t!51924 l!636)))))))

(assert (=> d!167879 (= (isStrictlySorted!1216 (t!51924 l!636)) e!885737)))

(declare-fun b!1586180 () Bool)

(declare-fun e!885738 () Bool)

(assert (=> b!1586180 (= e!885737 e!885738)))

(declare-fun res!1083287 () Bool)

(assert (=> b!1586180 (=> (not res!1083287) (not e!885738))))

(assert (=> b!1586180 (= res!1083287 (bvslt (_1!12969 (h!38533 (t!51924 l!636))) (_1!12969 (h!38533 (t!51924 (t!51924 l!636))))))))

(declare-fun b!1586181 () Bool)

(assert (=> b!1586181 (= e!885738 (isStrictlySorted!1216 (t!51924 (t!51924 l!636))))))

(assert (= (and d!167879 (not res!1083286)) b!1586180))

(assert (= (and b!1586180 res!1083287) b!1586181))

(declare-fun m!1454677 () Bool)

(assert (=> b!1586181 m!1454677))

(assert (=> b!1586146 d!167879))

(declare-fun b!1586186 () Bool)

(declare-fun e!885741 () Bool)

(declare-fun tp!115377 () Bool)

(assert (=> b!1586186 (= e!885741 (and tp_is_empty!39557 tp!115377))))

(assert (=> b!1586147 (= tp!115368 e!885741)))

