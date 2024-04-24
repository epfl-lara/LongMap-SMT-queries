; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137976 () Bool)

(assert start!137976)

(declare-fun b!1584449 () Bool)

(declare-fun e!884316 () Bool)

(declare-fun e!884317 () Bool)

(assert (=> b!1584449 (= e!884316 e!884317)))

(declare-fun res!1081678 () Bool)

(assert (=> b!1584449 (=> res!1081678 e!884317)))

(declare-datatypes ((B!2730 0))(
  ( (B!2731 (val!19727 Int)) )
))
(declare-datatypes ((tuple2!25682 0))(
  ( (tuple2!25683 (_1!12852 (_ BitVec 64)) (_2!12852 B!2730)) )
))
(declare-datatypes ((List!36879 0))(
  ( (Nil!36876) (Cons!36875 (h!38436 tuple2!25682) (t!51785 List!36879)) )
))
(declare-fun l!1356 () List!36879)

(declare-fun isStrictlySorted!1090 (List!36879) Bool)

(assert (=> b!1584449 (= res!1081678 (not (isStrictlySorted!1090 (t!51785 l!1356))))))

(declare-fun res!1081676 () Bool)

(assert (=> start!137976 (=> (not res!1081676) (not e!884316))))

(assert (=> start!137976 (= res!1081676 (isStrictlySorted!1090 l!1356))))

(assert (=> start!137976 e!884316))

(declare-fun e!884318 () Bool)

(assert (=> start!137976 e!884318))

(assert (=> start!137976 true))

(declare-fun b!1584450 () Bool)

(declare-fun res!1081677 () Bool)

(assert (=> b!1584450 (=> (not res!1081677) (not e!884316))))

(assert (=> b!1584450 (= res!1081677 (not (is-Nil!36876 l!1356)))))

(declare-fun b!1584451 () Bool)

(declare-fun res!1081679 () Bool)

(assert (=> b!1584451 (=> (not res!1081679) (not e!884316))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!949 (List!36879 (_ BitVec 64)) Bool)

(assert (=> b!1584451 (= res!1081679 (not (containsKey!949 l!1356 key!387)))))

(declare-fun b!1584452 () Bool)

(assert (=> b!1584452 (= e!884317 (containsKey!949 (t!51785 l!1356) key!387))))

(declare-fun b!1584453 () Bool)

(declare-fun tp_is_empty!39275 () Bool)

(declare-fun tp!114648 () Bool)

(assert (=> b!1584453 (= e!884318 (and tp_is_empty!39275 tp!114648))))

(assert (= (and start!137976 res!1081676) b!1584451))

(assert (= (and b!1584451 res!1081679) b!1584450))

(assert (= (and b!1584450 res!1081677) b!1584449))

(assert (= (and b!1584449 (not res!1081678)) b!1584452))

(assert (= (and start!137976 (is-Cons!36875 l!1356)) b!1584453))

(declare-fun m!1455001 () Bool)

(assert (=> b!1584449 m!1455001))

(declare-fun m!1455003 () Bool)

(assert (=> start!137976 m!1455003))

(declare-fun m!1455005 () Bool)

(assert (=> b!1584451 m!1455005))

(declare-fun m!1455007 () Bool)

(assert (=> b!1584452 m!1455007))

(push 1)

(assert (not b!1584451))

(assert (not b!1584452))

(assert (not start!137976))

(assert (not b!1584453))

(assert (not b!1584449))

(assert tp_is_empty!39275)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167597 () Bool)

(declare-fun res!1081692 () Bool)

(declare-fun e!884331 () Bool)

(assert (=> d!167597 (=> res!1081692 e!884331)))

(assert (=> d!167597 (= res!1081692 (or (is-Nil!36876 (t!51785 l!1356)) (is-Nil!36876 (t!51785 (t!51785 l!1356)))))))

(assert (=> d!167597 (= (isStrictlySorted!1090 (t!51785 l!1356)) e!884331)))

(declare-fun b!1584466 () Bool)

(declare-fun e!884332 () Bool)

(assert (=> b!1584466 (= e!884331 e!884332)))

(declare-fun res!1081693 () Bool)

(assert (=> b!1584466 (=> (not res!1081693) (not e!884332))))

(assert (=> b!1584466 (= res!1081693 (bvslt (_1!12852 (h!38436 (t!51785 l!1356))) (_1!12852 (h!38436 (t!51785 (t!51785 l!1356))))))))

(declare-fun b!1584467 () Bool)

(assert (=> b!1584467 (= e!884332 (isStrictlySorted!1090 (t!51785 (t!51785 l!1356))))))

(assert (= (and d!167597 (not res!1081692)) b!1584466))

(assert (= (and b!1584466 res!1081693) b!1584467))

(declare-fun m!1455010 () Bool)

(assert (=> b!1584467 m!1455010))

(assert (=> b!1584449 d!167597))

(declare-fun d!167603 () Bool)

(declare-fun res!1081697 () Bool)

(declare-fun e!884336 () Bool)

(assert (=> d!167603 (=> res!1081697 e!884336)))

(assert (=> d!167603 (= res!1081697 (or (is-Nil!36876 l!1356) (is-Nil!36876 (t!51785 l!1356))))))

(assert (=> d!167603 (= (isStrictlySorted!1090 l!1356) e!884336)))

(declare-fun b!1584471 () Bool)

(declare-fun e!884338 () Bool)

(assert (=> b!1584471 (= e!884336 e!884338)))

(declare-fun res!1081699 () Bool)

(assert (=> b!1584471 (=> (not res!1081699) (not e!884338))))

(assert (=> b!1584471 (= res!1081699 (bvslt (_1!12852 (h!38436 l!1356)) (_1!12852 (h!38436 (t!51785 l!1356)))))))

(declare-fun b!1584473 () Bool)

(assert (=> b!1584473 (= e!884338 (isStrictlySorted!1090 (t!51785 l!1356)))))

(assert (= (and d!167603 (not res!1081697)) b!1584471))

(assert (= (and b!1584471 res!1081699) b!1584473))

(assert (=> b!1584473 m!1455001))

(assert (=> start!137976 d!167603))

(declare-fun d!167605 () Bool)

(declare-fun res!1081714 () Bool)

(declare-fun e!884353 () Bool)

(assert (=> d!167605 (=> res!1081714 e!884353)))

(assert (=> d!167605 (= res!1081714 (and (is-Cons!36875 l!1356) (= (_1!12852 (h!38436 l!1356)) key!387)))))

(assert (=> d!167605 (= (containsKey!949 l!1356 key!387) e!884353)))

(declare-fun b!1584488 () Bool)

(declare-fun e!884354 () Bool)

(assert (=> b!1584488 (= e!884353 e!884354)))

(declare-fun res!1081715 () Bool)

(assert (=> b!1584488 (=> (not res!1081715) (not e!884354))))

(assert (=> b!1584488 (= res!1081715 (and (or (not (is-Cons!36875 l!1356)) (bvsle (_1!12852 (h!38436 l!1356)) key!387)) (is-Cons!36875 l!1356) (bvslt (_1!12852 (h!38436 l!1356)) key!387)))))

(declare-fun b!1584489 () Bool)

(assert (=> b!1584489 (= e!884354 (containsKey!949 (t!51785 l!1356) key!387))))

(assert (= (and d!167605 (not res!1081714)) b!1584488))

(assert (= (and b!1584488 res!1081715) b!1584489))

(assert (=> b!1584489 m!1455007))

(assert (=> b!1584451 d!167605))

(declare-fun d!167611 () Bool)

(declare-fun res!1081718 () Bool)

(declare-fun e!884357 () Bool)

(assert (=> d!167611 (=> res!1081718 e!884357)))

(assert (=> d!167611 (= res!1081718 (and (is-Cons!36875 (t!51785 l!1356)) (= (_1!12852 (h!38436 (t!51785 l!1356))) key!387)))))

(assert (=> d!167611 (= (containsKey!949 (t!51785 l!1356) key!387) e!884357)))

(declare-fun b!1584492 () Bool)

(declare-fun e!884358 () Bool)

(assert (=> b!1584492 (= e!884357 e!884358)))

(declare-fun res!1081719 () Bool)

(assert (=> b!1584492 (=> (not res!1081719) (not e!884358))))

(assert (=> b!1584492 (= res!1081719 (and (or (not (is-Cons!36875 (t!51785 l!1356))) (bvsle (_1!12852 (h!38436 (t!51785 l!1356))) key!387)) (is-Cons!36875 (t!51785 l!1356)) (bvslt (_1!12852 (h!38436 (t!51785 l!1356))) key!387)))))

(declare-fun b!1584493 () Bool)

(assert (=> b!1584493 (= e!884358 (containsKey!949 (t!51785 (t!51785 l!1356)) key!387))))

(assert (= (and d!167611 (not res!1081718)) b!1584492))

(assert (= (and b!1584492 res!1081719) b!1584493))

(declare-fun m!1455013 () Bool)

(assert (=> b!1584493 m!1455013))

(assert (=> b!1584452 d!167611))

(declare-fun b!1584509 () Bool)

(declare-fun e!884370 () Bool)

(declare-fun tp!114654 () Bool)

(assert (=> b!1584509 (= e!884370 (and tp_is_empty!39275 tp!114654))))

(assert (=> b!1584453 (= tp!114648 e!884370)))

(assert (= (and b!1584453 (is-Cons!36875 (t!51785 l!1356))) b!1584509))

(push 1)

(assert (not b!1584509))

(assert (not b!1584467))

(assert (not b!1584489))

(assert tp_is_empty!39275)

(assert (not b!1584473))

(assert (not b!1584493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

