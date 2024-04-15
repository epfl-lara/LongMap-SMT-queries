; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138240 () Bool)

(assert start!138240)

(declare-fun b!1585413 () Bool)

(declare-fun res!1082815 () Bool)

(declare-fun e!885174 () Bool)

(assert (=> b!1585413 (=> res!1082815 e!885174)))

(declare-datatypes ((B!2994 0))(
  ( (B!2995 (val!19859 Int)) )
))
(declare-datatypes ((tuple2!25954 0))(
  ( (tuple2!25955 (_1!12988 (_ BitVec 64)) (_2!12988 B!2994)) )
))
(declare-datatypes ((List!37020 0))(
  ( (Nil!37017) (Cons!37016 (h!38560 tuple2!25954) (t!51933 List!37020)) )
))
(declare-fun lt!677141 () List!37020)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1012 (List!37020 (_ BitVec 64)) Bool)

(assert (=> b!1585413 (= res!1082815 (not (containsKey!1012 lt!677141 newKey!21)))))

(declare-fun b!1585414 () Bool)

(declare-fun res!1082817 () Bool)

(declare-fun e!885172 () Bool)

(assert (=> b!1585414 (=> (not res!1082817) (not e!885172))))

(declare-fun l!556 () List!37020)

(assert (=> b!1585414 (= res!1082817 (and (bvsge (_1!12988 (h!38560 l!556)) newKey!21) (is-Cons!37016 l!556) (= (_1!12988 (h!38560 l!556)) newKey!21)))))

(declare-fun b!1585415 () Bool)

(assert (=> b!1585415 (= e!885172 e!885174)))

(declare-fun res!1082814 () Bool)

(assert (=> b!1585415 (=> res!1082814 e!885174)))

(declare-fun isStrictlySorted!1199 (List!37020) Bool)

(assert (=> b!1585415 (= res!1082814 (not (isStrictlySorted!1199 lt!677141)))))

(declare-fun lt!677140 () tuple2!25954)

(declare-fun $colon$colon!1049 (List!37020 tuple2!25954) List!37020)

(assert (=> b!1585415 (= lt!677141 ($colon$colon!1049 (t!51933 l!556) lt!677140))))

(declare-fun newValue!21 () B!2994)

(assert (=> b!1585415 (= lt!677140 (tuple2!25955 newKey!21 newValue!21))))

(declare-fun res!1082816 () Bool)

(assert (=> start!138240 (=> (not res!1082816) (not e!885172))))

(assert (=> start!138240 (= res!1082816 (isStrictlySorted!1199 l!556))))

(assert (=> start!138240 e!885172))

(declare-fun e!885173 () Bool)

(assert (=> start!138240 e!885173))

(assert (=> start!138240 true))

(declare-fun tp_is_empty!39527 () Bool)

(assert (=> start!138240 tp_is_empty!39527))

(declare-fun b!1585416 () Bool)

(declare-fun tp!115287 () Bool)

(assert (=> b!1585416 (= e!885173 (and tp_is_empty!39527 tp!115287))))

(declare-fun b!1585417 () Bool)

(declare-fun contains!10491 (List!37020 tuple2!25954) Bool)

(assert (=> b!1585417 (= e!885174 (not (contains!10491 lt!677141 lt!677140)))))

(assert (= (and start!138240 res!1082816) b!1585414))

(assert (= (and b!1585414 res!1082817) b!1585415))

(assert (= (and b!1585415 (not res!1082814)) b!1585413))

(assert (= (and b!1585413 (not res!1082815)) b!1585417))

(assert (= (and start!138240 (is-Cons!37016 l!556)) b!1585416))

(declare-fun m!1453571 () Bool)

(assert (=> b!1585413 m!1453571))

(declare-fun m!1453573 () Bool)

(assert (=> b!1585415 m!1453573))

(declare-fun m!1453575 () Bool)

(assert (=> b!1585415 m!1453575))

(declare-fun m!1453577 () Bool)

(assert (=> start!138240 m!1453577))

(declare-fun m!1453579 () Bool)

(assert (=> b!1585417 m!1453579))

(push 1)

(assert (not b!1585417))

(assert (not b!1585413))

(assert (not b!1585415))

(assert (not start!138240))

(assert (not b!1585416))

(assert tp_is_empty!39527)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167531 () Bool)

(declare-fun res!1082832 () Bool)

(declare-fun e!885189 () Bool)

(assert (=> d!167531 (=> res!1082832 e!885189)))

(assert (=> d!167531 (= res!1082832 (and (is-Cons!37016 lt!677141) (= (_1!12988 (h!38560 lt!677141)) newKey!21)))))

(assert (=> d!167531 (= (containsKey!1012 lt!677141 newKey!21) e!885189)))

(declare-fun b!1585432 () Bool)

(declare-fun e!885190 () Bool)

(assert (=> b!1585432 (= e!885189 e!885190)))

(declare-fun res!1082833 () Bool)

(assert (=> b!1585432 (=> (not res!1082833) (not e!885190))))

(assert (=> b!1585432 (= res!1082833 (and (or (not (is-Cons!37016 lt!677141)) (bvsle (_1!12988 (h!38560 lt!677141)) newKey!21)) (is-Cons!37016 lt!677141) (bvslt (_1!12988 (h!38560 lt!677141)) newKey!21)))))

(declare-fun b!1585433 () Bool)

(assert (=> b!1585433 (= e!885190 (containsKey!1012 (t!51933 lt!677141) newKey!21))))

(assert (= (and d!167531 (not res!1082832)) b!1585432))

(assert (= (and b!1585432 res!1082833) b!1585433))

(declare-fun m!1453583 () Bool)

(assert (=> b!1585433 m!1453583))

(assert (=> b!1585413 d!167531))

(declare-fun d!167533 () Bool)

(declare-fun lt!677147 () Bool)

(declare-fun content!859 (List!37020) (Set tuple2!25954))

(assert (=> d!167533 (= lt!677147 (set.member lt!677140 (content!859 lt!677141)))))

(declare-fun e!885204 () Bool)

(assert (=> d!167533 (= lt!677147 e!885204)))

(declare-fun res!1082846 () Bool)

(assert (=> d!167533 (=> (not res!1082846) (not e!885204))))

(assert (=> d!167533 (= res!1082846 (is-Cons!37016 lt!677141))))

(assert (=> d!167533 (= (contains!10491 lt!677141 lt!677140) lt!677147)))

(declare-fun b!1585446 () Bool)

(declare-fun e!885203 () Bool)

(assert (=> b!1585446 (= e!885204 e!885203)))

(declare-fun res!1082847 () Bool)

(assert (=> b!1585446 (=> res!1082847 e!885203)))

(assert (=> b!1585446 (= res!1082847 (= (h!38560 lt!677141) lt!677140))))

(declare-fun b!1585447 () Bool)

(assert (=> b!1585447 (= e!885203 (contains!10491 (t!51933 lt!677141) lt!677140))))

(assert (= (and d!167533 res!1082846) b!1585446))

(assert (= (and b!1585446 (not res!1082847)) b!1585447))

(declare-fun m!1453593 () Bool)

(assert (=> d!167533 m!1453593))

(declare-fun m!1453595 () Bool)

(assert (=> d!167533 m!1453595))

(declare-fun m!1453597 () Bool)

(assert (=> b!1585447 m!1453597))

(assert (=> b!1585417 d!167533))

(declare-fun d!167543 () Bool)

(declare-fun res!1082860 () Bool)

(declare-fun e!885220 () Bool)

(assert (=> d!167543 (=> res!1082860 e!885220)))

(assert (=> d!167543 (= res!1082860 (or (is-Nil!37017 l!556) (is-Nil!37017 (t!51933 l!556))))))

(assert (=> d!167543 (= (isStrictlySorted!1199 l!556) e!885220)))

(declare-fun b!1585465 () Bool)

(declare-fun e!885221 () Bool)

(assert (=> b!1585465 (= e!885220 e!885221)))

(declare-fun res!1082861 () Bool)

(assert (=> b!1585465 (=> (not res!1082861) (not e!885221))))

(assert (=> b!1585465 (= res!1082861 (bvslt (_1!12988 (h!38560 l!556)) (_1!12988 (h!38560 (t!51933 l!556)))))))

(declare-fun b!1585466 () Bool)

(assert (=> b!1585466 (= e!885221 (isStrictlySorted!1199 (t!51933 l!556)))))

(assert (= (and d!167543 (not res!1082860)) b!1585465))

(assert (= (and b!1585465 res!1082861) b!1585466))

(declare-fun m!1453607 () Bool)

(assert (=> b!1585466 m!1453607))

(assert (=> start!138240 d!167543))

(declare-fun d!167547 () Bool)

(declare-fun res!1082862 () Bool)

(declare-fun e!885222 () Bool)

(assert (=> d!167547 (=> res!1082862 e!885222)))

(assert (=> d!167547 (= res!1082862 (or (is-Nil!37017 lt!677141) (is-Nil!37017 (t!51933 lt!677141))))))

(assert (=> d!167547 (= (isStrictlySorted!1199 lt!677141) e!885222)))

(declare-fun b!1585467 () Bool)

(declare-fun e!885223 () Bool)

(assert (=> b!1585467 (= e!885222 e!885223)))

(declare-fun res!1082863 () Bool)

(assert (=> b!1585467 (=> (not res!1082863) (not e!885223))))

(assert (=> b!1585467 (= res!1082863 (bvslt (_1!12988 (h!38560 lt!677141)) (_1!12988 (h!38560 (t!51933 lt!677141)))))))

(declare-fun b!1585468 () Bool)

(assert (=> b!1585468 (= e!885223 (isStrictlySorted!1199 (t!51933 lt!677141)))))

(assert (= (and d!167547 (not res!1082862)) b!1585467))

(assert (= (and b!1585467 res!1082863) b!1585468))

(declare-fun m!1453609 () Bool)

(assert (=> b!1585468 m!1453609))

(assert (=> b!1585415 d!167547))

(declare-fun d!167549 () Bool)

(assert (=> d!167549 (= ($colon$colon!1049 (t!51933 l!556) lt!677140) (Cons!37016 lt!677140 (t!51933 l!556)))))

(assert (=> b!1585415 d!167549))

(declare-fun b!1585477 () Bool)

(declare-fun e!885230 () Bool)

(declare-fun tp!115293 () Bool)

(assert (=> b!1585477 (= e!885230 (and tp_is_empty!39527 tp!115293))))

(assert (=> b!1585416 (= tp!115287 e!885230)))

(assert (= (and b!1585416 (is-Cons!37016 (t!51933 l!556))) b!1585477))

(push 1)

(assert (not b!1585466))

(assert (not d!167533))

(assert (not b!1585447))

(assert (not b!1585433))

(assert (not b!1585477))

(assert tp_is_empty!39527)

(assert (not b!1585468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

