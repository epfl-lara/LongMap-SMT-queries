; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137536 () Bool)

(assert start!137536)

(declare-fun res!1080757 () Bool)

(declare-fun e!882759 () Bool)

(assert (=> start!137536 (=> (not res!1080757) (not e!882759))))

(declare-datatypes ((B!2730 0))(
  ( (B!2731 (val!19727 Int)) )
))
(declare-datatypes ((tuple2!25622 0))(
  ( (tuple2!25623 (_1!12822 (_ BitVec 64)) (_2!12822 B!2730)) )
))
(declare-datatypes ((List!36847 0))(
  ( (Nil!36844) (Cons!36843 (h!38386 tuple2!25622) (t!51761 List!36847)) )
))
(declare-fun l!1356 () List!36847)

(declare-fun isStrictlySorted!1102 (List!36847) Bool)

(assert (=> start!137536 (= res!1080757 (isStrictlySorted!1102 l!1356))))

(assert (=> start!137536 e!882759))

(declare-fun e!882761 () Bool)

(assert (=> start!137536 e!882761))

(assert (=> start!137536 true))

(declare-fun b!1581942 () Bool)

(declare-fun tp_is_empty!39275 () Bool)

(declare-fun tp!114647 () Bool)

(assert (=> b!1581942 (= e!882761 (and tp_is_empty!39275 tp!114647))))

(declare-fun b!1581943 () Bool)

(declare-fun e!882760 () Bool)

(assert (=> b!1581943 (= e!882759 e!882760)))

(declare-fun res!1080756 () Bool)

(assert (=> b!1581943 (=> res!1080756 e!882760)))

(assert (=> b!1581943 (= res!1080756 (not (isStrictlySorted!1102 (t!51761 l!1356))))))

(declare-fun b!1581944 () Bool)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!948 (List!36847 (_ BitVec 64)) Bool)

(assert (=> b!1581944 (= e!882760 (containsKey!948 (t!51761 l!1356) key!387))))

(declare-fun b!1581945 () Bool)

(declare-fun res!1080759 () Bool)

(assert (=> b!1581945 (=> (not res!1080759) (not e!882759))))

(assert (=> b!1581945 (= res!1080759 (not (is-Nil!36844 l!1356)))))

(declare-fun b!1581946 () Bool)

(declare-fun res!1080758 () Bool)

(assert (=> b!1581946 (=> (not res!1080758) (not e!882759))))

(assert (=> b!1581946 (= res!1080758 (not (containsKey!948 l!1356 key!387)))))

(assert (= (and start!137536 res!1080757) b!1581946))

(assert (= (and b!1581946 res!1080758) b!1581945))

(assert (= (and b!1581945 res!1080759) b!1581943))

(assert (= (and b!1581943 (not res!1080756)) b!1581944))

(assert (= (and start!137536 (is-Cons!36843 l!1356)) b!1581942))

(declare-fun m!1452675 () Bool)

(assert (=> start!137536 m!1452675))

(declare-fun m!1452677 () Bool)

(assert (=> b!1581943 m!1452677))

(declare-fun m!1452679 () Bool)

(assert (=> b!1581944 m!1452679))

(declare-fun m!1452681 () Bool)

(assert (=> b!1581946 m!1452681))

(push 1)

(assert (not start!137536))

(assert tp_is_empty!39275)

(assert (not b!1581944))

(assert (not b!1581946))

(assert (not b!1581942))

(assert (not b!1581943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166869 () Bool)

(declare-fun res!1080776 () Bool)

(declare-fun e!882778 () Bool)

(assert (=> d!166869 (=> res!1080776 e!882778)))

(assert (=> d!166869 (= res!1080776 (and (is-Cons!36843 l!1356) (= (_1!12822 (h!38386 l!1356)) key!387)))))

(assert (=> d!166869 (= (containsKey!948 l!1356 key!387) e!882778)))

(declare-fun b!1581963 () Bool)

(declare-fun e!882779 () Bool)

(assert (=> b!1581963 (= e!882778 e!882779)))

(declare-fun res!1080777 () Bool)

(assert (=> b!1581963 (=> (not res!1080777) (not e!882779))))

(assert (=> b!1581963 (= res!1080777 (and (or (not (is-Cons!36843 l!1356)) (bvsle (_1!12822 (h!38386 l!1356)) key!387)) (is-Cons!36843 l!1356) (bvslt (_1!12822 (h!38386 l!1356)) key!387)))))

(declare-fun b!1581964 () Bool)

(assert (=> b!1581964 (= e!882779 (containsKey!948 (t!51761 l!1356) key!387))))

(assert (= (and d!166869 (not res!1080776)) b!1581963))

(assert (= (and b!1581963 res!1080777) b!1581964))

(assert (=> b!1581964 m!1452679))

(assert (=> b!1581946 d!166869))

(declare-fun d!166875 () Bool)

(declare-fun res!1080778 () Bool)

(declare-fun e!882780 () Bool)

(assert (=> d!166875 (=> res!1080778 e!882780)))

(assert (=> d!166875 (= res!1080778 (and (is-Cons!36843 (t!51761 l!1356)) (= (_1!12822 (h!38386 (t!51761 l!1356))) key!387)))))

(assert (=> d!166875 (= (containsKey!948 (t!51761 l!1356) key!387) e!882780)))

(declare-fun b!1581965 () Bool)

(declare-fun e!882781 () Bool)

(assert (=> b!1581965 (= e!882780 e!882781)))

(declare-fun res!1080779 () Bool)

(assert (=> b!1581965 (=> (not res!1080779) (not e!882781))))

(assert (=> b!1581965 (= res!1080779 (and (or (not (is-Cons!36843 (t!51761 l!1356))) (bvsle (_1!12822 (h!38386 (t!51761 l!1356))) key!387)) (is-Cons!36843 (t!51761 l!1356)) (bvslt (_1!12822 (h!38386 (t!51761 l!1356))) key!387)))))

(declare-fun b!1581966 () Bool)

(assert (=> b!1581966 (= e!882781 (containsKey!948 (t!51761 (t!51761 l!1356)) key!387))))

(assert (= (and d!166875 (not res!1080778)) b!1581965))

(assert (= (and b!1581965 res!1080779) b!1581966))

(declare-fun m!1452683 () Bool)

(assert (=> b!1581966 m!1452683))

(assert (=> b!1581944 d!166875))

(declare-fun d!166877 () Bool)

(declare-fun res!1080804 () Bool)

(declare-fun e!882806 () Bool)

(assert (=> d!166877 (=> res!1080804 e!882806)))

(assert (=> d!166877 (= res!1080804 (or (is-Nil!36844 (t!51761 l!1356)) (is-Nil!36844 (t!51761 (t!51761 l!1356)))))))

(assert (=> d!166877 (= (isStrictlySorted!1102 (t!51761 l!1356)) e!882806)))

(declare-fun b!1581991 () Bool)

(declare-fun e!882807 () Bool)

(assert (=> b!1581991 (= e!882806 e!882807)))

(declare-fun res!1080805 () Bool)

(assert (=> b!1581991 (=> (not res!1080805) (not e!882807))))

(assert (=> b!1581991 (= res!1080805 (bvslt (_1!12822 (h!38386 (t!51761 l!1356))) (_1!12822 (h!38386 (t!51761 (t!51761 l!1356))))))))

(declare-fun b!1581992 () Bool)

(assert (=> b!1581992 (= e!882807 (isStrictlySorted!1102 (t!51761 (t!51761 l!1356))))))

(assert (= (and d!166877 (not res!1080804)) b!1581991))

(assert (= (and b!1581991 res!1080805) b!1581992))

(declare-fun m!1452693 () Bool)

(assert (=> b!1581992 m!1452693))

(assert (=> b!1581943 d!166877))

(declare-fun d!166887 () Bool)

(declare-fun res!1080806 () Bool)

(declare-fun e!882812 () Bool)

(assert (=> d!166887 (=> res!1080806 e!882812)))

(assert (=> d!166887 (= res!1080806 (or (is-Nil!36844 l!1356) (is-Nil!36844 (t!51761 l!1356))))))

(assert (=> d!166887 (= (isStrictlySorted!1102 l!1356) e!882812)))

(declare-fun b!1582001 () Bool)

(declare-fun e!882813 () Bool)

(assert (=> b!1582001 (= e!882812 e!882813)))

(declare-fun res!1080807 () Bool)

(assert (=> b!1582001 (=> (not res!1080807) (not e!882813))))

(assert (=> b!1582001 (= res!1080807 (bvslt (_1!12822 (h!38386 l!1356)) (_1!12822 (h!38386 (t!51761 l!1356)))))))

(declare-fun b!1582002 () Bool)

(assert (=> b!1582002 (= e!882813 (isStrictlySorted!1102 (t!51761 l!1356)))))

(assert (= (and d!166887 (not res!1080806)) b!1582001))

(assert (= (and b!1582001 res!1080807) b!1582002))

(assert (=> b!1582002 m!1452677))

(assert (=> start!137536 d!166887))

(declare-fun b!1582009 () Bool)

(declare-fun e!882818 () Bool)

(declare-fun tp!114656 () Bool)

(assert (=> b!1582009 (= e!882818 (and tp_is_empty!39275 tp!114656))))

(assert (=> b!1581942 (= tp!114647 e!882818)))

(assert (= (and b!1581942 (is-Cons!36843 (t!51761 l!1356))) b!1582009))

(push 1)

(assert (not b!1581992))

(assert (not b!1581964))

(assert (not b!1581966))

(assert (not b!1582002))

(assert (not b!1582009))

(assert tp_is_empty!39275)

(check-sat)

(pop 1)

(push 1)

(check-sat)

