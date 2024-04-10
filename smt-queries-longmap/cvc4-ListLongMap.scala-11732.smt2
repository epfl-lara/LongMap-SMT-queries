; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137554 () Bool)

(assert start!137554)

(declare-fun res!1080825 () Bool)

(declare-fun e!882836 () Bool)

(assert (=> start!137554 (=> (not res!1080825) (not e!882836))))

(declare-datatypes ((B!2736 0))(
  ( (B!2737 (val!19730 Int)) )
))
(declare-datatypes ((tuple2!25628 0))(
  ( (tuple2!25629 (_1!12825 (_ BitVec 64)) (_2!12825 B!2736)) )
))
(declare-datatypes ((List!36850 0))(
  ( (Nil!36847) (Cons!36846 (h!38389 tuple2!25628) (t!51764 List!36850)) )
))
(declare-fun l!1356 () List!36850)

(declare-fun isStrictlySorted!1105 (List!36850) Bool)

(assert (=> start!137554 (= res!1080825 (isStrictlySorted!1105 l!1356))))

(assert (=> start!137554 e!882836))

(declare-fun e!882835 () Bool)

(assert (=> start!137554 e!882835))

(assert (=> start!137554 true))

(declare-fun b!1582034 () Bool)

(declare-fun res!1080824 () Bool)

(assert (=> b!1582034 (=> (not res!1080824) (not e!882836))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!951 (List!36850 (_ BitVec 64)) Bool)

(assert (=> b!1582034 (= res!1080824 (not (containsKey!951 l!1356 key!387)))))

(declare-fun b!1582035 () Bool)

(declare-fun ListPrimitiveSize!201 (List!36850) Int)

(assert (=> b!1582035 (= e!882836 (< (ListPrimitiveSize!201 l!1356) 0))))

(declare-fun b!1582036 () Bool)

(declare-fun tp_is_empty!39281 () Bool)

(declare-fun tp!114665 () Bool)

(assert (=> b!1582036 (= e!882835 (and tp_is_empty!39281 tp!114665))))

(assert (= (and start!137554 res!1080825) b!1582034))

(assert (= (and b!1582034 res!1080824) b!1582035))

(assert (= (and start!137554 (is-Cons!36846 l!1356)) b!1582036))

(declare-fun m!1452707 () Bool)

(assert (=> start!137554 m!1452707))

(declare-fun m!1452709 () Bool)

(assert (=> b!1582034 m!1452709))

(declare-fun m!1452711 () Bool)

(assert (=> b!1582035 m!1452711))

(push 1)

(assert tp_is_empty!39281)

(assert (not b!1582035))

(assert (not b!1582034))

(assert (not b!1582036))

(assert (not start!137554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166893 () Bool)

(declare-fun res!1080834 () Bool)

(declare-fun e!882848 () Bool)

(assert (=> d!166893 (=> res!1080834 e!882848)))

(assert (=> d!166893 (= res!1080834 (or (is-Nil!36847 l!1356) (is-Nil!36847 (t!51764 l!1356))))))

(assert (=> d!166893 (= (isStrictlySorted!1105 l!1356) e!882848)))

(declare-fun b!1582051 () Bool)

(declare-fun e!882849 () Bool)

(assert (=> b!1582051 (= e!882848 e!882849)))

(declare-fun res!1080835 () Bool)

(assert (=> b!1582051 (=> (not res!1080835) (not e!882849))))

(assert (=> b!1582051 (= res!1080835 (bvslt (_1!12825 (h!38389 l!1356)) (_1!12825 (h!38389 (t!51764 l!1356)))))))

(declare-fun b!1582052 () Bool)

(assert (=> b!1582052 (= e!882849 (isStrictlySorted!1105 (t!51764 l!1356)))))

(assert (= (and d!166893 (not res!1080834)) b!1582051))

(assert (= (and b!1582051 res!1080835) b!1582052))

(declare-fun m!1452715 () Bool)

(assert (=> b!1582052 m!1452715))

(assert (=> start!137554 d!166893))

(declare-fun d!166899 () Bool)

(declare-fun lt!677040 () Int)

(assert (=> d!166899 (>= lt!677040 0)))

(declare-fun e!882862 () Int)

(assert (=> d!166899 (= lt!677040 e!882862)))

(declare-fun c!146638 () Bool)

(assert (=> d!166899 (= c!146638 (is-Nil!36847 l!1356))))

(assert (=> d!166899 (= (ListPrimitiveSize!201 l!1356) lt!677040)))

(declare-fun b!1582067 () Bool)

(assert (=> b!1582067 (= e!882862 0)))

(declare-fun b!1582068 () Bool)

(assert (=> b!1582068 (= e!882862 (+ 1 (ListPrimitiveSize!201 (t!51764 l!1356))))))

(assert (= (and d!166899 c!146638) b!1582067))

(assert (= (and d!166899 (not c!146638)) b!1582068))

(declare-fun m!1452719 () Bool)

(assert (=> b!1582068 m!1452719))

(assert (=> b!1582035 d!166899))

(declare-fun d!166903 () Bool)

(declare-fun res!1080858 () Bool)

(declare-fun e!882877 () Bool)

(assert (=> d!166903 (=> res!1080858 e!882877)))

(assert (=> d!166903 (= res!1080858 (and (is-Cons!36846 l!1356) (= (_1!12825 (h!38389 l!1356)) key!387)))))

(assert (=> d!166903 (= (containsKey!951 l!1356 key!387) e!882877)))

(declare-fun b!1582085 () Bool)

(declare-fun e!882878 () Bool)

(assert (=> b!1582085 (= e!882877 e!882878)))

(declare-fun res!1080859 () Bool)

(assert (=> b!1582085 (=> (not res!1080859) (not e!882878))))

(assert (=> b!1582085 (= res!1080859 (and (or (not (is-Cons!36846 l!1356)) (bvsle (_1!12825 (h!38389 l!1356)) key!387)) (is-Cons!36846 l!1356) (bvslt (_1!12825 (h!38389 l!1356)) key!387)))))

(declare-fun b!1582086 () Bool)

(assert (=> b!1582086 (= e!882878 (containsKey!951 (t!51764 l!1356) key!387))))

(assert (= (and d!166903 (not res!1080858)) b!1582085))

(assert (= (and b!1582085 res!1080859) b!1582086))

(declare-fun m!1452725 () Bool)

(assert (=> b!1582086 m!1452725))

(assert (=> b!1582034 d!166903))

(declare-fun b!1582103 () Bool)

(declare-fun e!882888 () Bool)

(declare-fun tp!114672 () Bool)

(assert (=> b!1582103 (= e!882888 (and tp_is_empty!39281 tp!114672))))

(assert (=> b!1582036 (= tp!114665 e!882888)))

(assert (= (and b!1582036 (is-Cons!36846 (t!51764 l!1356))) b!1582103))

(push 1)

