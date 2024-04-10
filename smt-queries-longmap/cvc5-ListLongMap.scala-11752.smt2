; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137890 () Bool)

(assert start!137890)

(declare-fun res!1081661 () Bool)

(declare-fun e!883836 () Bool)

(assert (=> start!137890 (=> (not res!1081661) (not e!883836))))

(declare-datatypes ((B!2852 0))(
  ( (B!2853 (val!19788 Int)) )
))
(declare-datatypes ((tuple2!25744 0))(
  ( (tuple2!25745 (_1!12883 (_ BitVec 64)) (_2!12883 B!2852)) )
))
(declare-datatypes ((List!36908 0))(
  ( (Nil!36905) (Cons!36904 (h!38447 tuple2!25744) (t!51822 List!36908)) )
))
(declare-fun l!548 () List!36908)

(declare-fun isStrictlySorted!1142 (List!36908) Bool)

(assert (=> start!137890 (= res!1081661 (isStrictlySorted!1142 l!548))))

(assert (=> start!137890 e!883836))

(declare-fun e!883837 () Bool)

(assert (=> start!137890 e!883837))

(declare-fun b!1583421 () Bool)

(declare-fun ListPrimitiveSize!211 (List!36908) Int)

(assert (=> b!1583421 (= e!883836 (< (ListPrimitiveSize!211 l!548) 0))))

(declare-fun b!1583422 () Bool)

(declare-fun tp_is_empty!39385 () Bool)

(declare-fun tp!114949 () Bool)

(assert (=> b!1583422 (= e!883837 (and tp_is_empty!39385 tp!114949))))

(assert (= (and start!137890 res!1081661) b!1583421))

(assert (= (and start!137890 (is-Cons!36904 l!548)) b!1583422))

(declare-fun m!1453301 () Bool)

(assert (=> start!137890 m!1453301))

(declare-fun m!1453303 () Bool)

(assert (=> b!1583421 m!1453303))

(push 1)

(assert (not b!1583421))

(assert (not start!137890))

(assert (not b!1583422))

(assert tp_is_empty!39385)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167233 () Bool)

(declare-fun lt!677171 () Int)

(assert (=> d!167233 (>= lt!677171 0)))

(declare-fun e!883860 () Int)

(assert (=> d!167233 (= lt!677171 e!883860)))

(declare-fun c!146734 () Bool)

(assert (=> d!167233 (= c!146734 (is-Nil!36905 l!548))))

(assert (=> d!167233 (= (ListPrimitiveSize!211 l!548) lt!677171)))

(declare-fun b!1583449 () Bool)

(assert (=> b!1583449 (= e!883860 0)))

(declare-fun b!1583450 () Bool)

(assert (=> b!1583450 (= e!883860 (+ 1 (ListPrimitiveSize!211 (t!51822 l!548))))))

(assert (= (and d!167233 c!146734) b!1583449))

(assert (= (and d!167233 (not c!146734)) b!1583450))

(declare-fun m!1453315 () Bool)

(assert (=> b!1583450 m!1453315))

(assert (=> b!1583421 d!167233))

(declare-fun d!167237 () Bool)

(declare-fun res!1081682 () Bool)

(declare-fun e!883875 () Bool)

(assert (=> d!167237 (=> res!1081682 e!883875)))

(assert (=> d!167237 (= res!1081682 (or (is-Nil!36905 l!548) (is-Nil!36905 (t!51822 l!548))))))

(assert (=> d!167237 (= (isStrictlySorted!1142 l!548) e!883875)))

(declare-fun b!1583471 () Bool)

(declare-fun e!883877 () Bool)

(assert (=> b!1583471 (= e!883875 e!883877)))

(declare-fun res!1081684 () Bool)

(assert (=> b!1583471 (=> (not res!1081684) (not e!883877))))

(assert (=> b!1583471 (= res!1081684 (bvslt (_1!12883 (h!38447 l!548)) (_1!12883 (h!38447 (t!51822 l!548)))))))

(declare-fun b!1583472 () Bool)

(assert (=> b!1583472 (= e!883877 (isStrictlySorted!1142 (t!51822 l!548)))))

(assert (= (and d!167237 (not res!1081682)) b!1583471))

(assert (= (and b!1583471 res!1081684) b!1583472))

(declare-fun m!1453321 () Bool)

(assert (=> b!1583472 m!1453321))

(assert (=> start!137890 d!167237))

(declare-fun b!1583484 () Bool)

(declare-fun e!883884 () Bool)

(declare-fun tp!114963 () Bool)

(assert (=> b!1583484 (= e!883884 (and tp_is_empty!39385 tp!114963))))

(assert (=> b!1583422 (= tp!114949 e!883884)))

(assert (= (and b!1583422 (is-Cons!36904 (t!51822 l!548))) b!1583484))

(push 1)

(assert (not b!1583472))

