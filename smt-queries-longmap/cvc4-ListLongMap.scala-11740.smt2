; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137692 () Bool)

(assert start!137692)

(declare-fun res!1081122 () Bool)

(declare-fun e!883216 () Bool)

(assert (=> start!137692 (=> (not res!1081122) (not e!883216))))

(declare-datatypes ((B!2784 0))(
  ( (B!2785 (val!19754 Int)) )
))
(declare-datatypes ((tuple2!25676 0))(
  ( (tuple2!25677 (_1!12849 (_ BitVec 64)) (_2!12849 B!2784)) )
))
(declare-datatypes ((List!36874 0))(
  ( (Nil!36871) (Cons!36870 (h!38413 tuple2!25676) (t!51788 List!36874)) )
))
(declare-datatypes ((ListLongMap!22787 0))(
  ( (ListLongMap!22788 (toList!11409 List!36874)) )
))
(declare-fun thiss!185 () ListLongMap!22787)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun containsKey!963 (List!36874 (_ BitVec 64)) Bool)

(assert (=> start!137692 (= res!1081122 (containsKey!963 (toList!11409 thiss!185) key!86))))

(assert (=> start!137692 e!883216))

(declare-fun e!883217 () Bool)

(declare-fun inv!59129 (ListLongMap!22787) Bool)

(assert (=> start!137692 (and (inv!59129 thiss!185) e!883217)))

(assert (=> start!137692 true))

(declare-fun b!1582521 () Bool)

(declare-fun isStrictlySorted!1120 (List!36874) Bool)

(assert (=> b!1582521 (= e!883216 (not (isStrictlySorted!1120 (toList!11409 thiss!185))))))

(declare-fun b!1582522 () Bool)

(declare-fun tp!114782 () Bool)

(assert (=> b!1582522 (= e!883217 tp!114782)))

(assert (= (and start!137692 res!1081122) b!1582521))

(assert (= start!137692 b!1582522))

(declare-fun m!1452917 () Bool)

(assert (=> start!137692 m!1452917))

(declare-fun m!1452919 () Bool)

(assert (=> start!137692 m!1452919))

(declare-fun m!1452921 () Bool)

(assert (=> b!1582521 m!1452921))

(push 1)

(assert (not start!137692))

(assert (not b!1582521))

(assert (not b!1582522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167007 () Bool)

(declare-fun res!1081135 () Bool)

(declare-fun e!883230 () Bool)

(assert (=> d!167007 (=> res!1081135 e!883230)))

(assert (=> d!167007 (= res!1081135 (and (is-Cons!36870 (toList!11409 thiss!185)) (= (_1!12849 (h!38413 (toList!11409 thiss!185))) key!86)))))

(assert (=> d!167007 (= (containsKey!963 (toList!11409 thiss!185) key!86) e!883230)))

(declare-fun b!1582535 () Bool)

(declare-fun e!883231 () Bool)

(assert (=> b!1582535 (= e!883230 e!883231)))

(declare-fun res!1081136 () Bool)

(assert (=> b!1582535 (=> (not res!1081136) (not e!883231))))

(assert (=> b!1582535 (= res!1081136 (and (or (not (is-Cons!36870 (toList!11409 thiss!185))) (bvsle (_1!12849 (h!38413 (toList!11409 thiss!185))) key!86)) (is-Cons!36870 (toList!11409 thiss!185)) (bvslt (_1!12849 (h!38413 (toList!11409 thiss!185))) key!86)))))

(declare-fun b!1582536 () Bool)

(assert (=> b!1582536 (= e!883231 (containsKey!963 (t!51788 (toList!11409 thiss!185)) key!86))))

(assert (= (and d!167007 (not res!1081135)) b!1582535))

(assert (= (and b!1582535 res!1081136) b!1582536))

(declare-fun m!1452923 () Bool)

(assert (=> b!1582536 m!1452923))

(assert (=> start!137692 d!167007))

(declare-fun d!167009 () Bool)

(assert (=> d!167009 (= (inv!59129 thiss!185) (isStrictlySorted!1120 (toList!11409 thiss!185)))))

(declare-fun bs!45855 () Bool)

(assert (= bs!45855 d!167009))

(assert (=> bs!45855 m!1452921))

(assert (=> start!137692 d!167009))

(declare-fun d!167013 () Bool)

(declare-fun res!1081149 () Bool)

(declare-fun e!883244 () Bool)

(assert (=> d!167013 (=> res!1081149 e!883244)))

(assert (=> d!167013 (= res!1081149 (or (is-Nil!36871 (toList!11409 thiss!185)) (is-Nil!36871 (t!51788 (toList!11409 thiss!185)))))))

(assert (=> d!167013 (= (isStrictlySorted!1120 (toList!11409 thiss!185)) e!883244)))

(declare-fun b!1582547 () Bool)

(declare-fun e!883245 () Bool)

(assert (=> b!1582547 (= e!883244 e!883245)))

(declare-fun res!1081150 () Bool)

(assert (=> b!1582547 (=> (not res!1081150) (not e!883245))))

(assert (=> b!1582547 (= res!1081150 (bvslt (_1!12849 (h!38413 (toList!11409 thiss!185))) (_1!12849 (h!38413 (t!51788 (toList!11409 thiss!185))))))))

(declare-fun b!1582548 () Bool)

(assert (=> b!1582548 (= e!883245 (isStrictlySorted!1120 (t!51788 (toList!11409 thiss!185))))))

(assert (= (and d!167013 (not res!1081149)) b!1582547))

(assert (= (and b!1582547 res!1081150) b!1582548))

(declare-fun m!1452929 () Bool)

(assert (=> b!1582548 m!1452929))

(assert (=> b!1582521 d!167013))

(declare-fun b!1582555 () Bool)

(declare-fun e!883248 () Bool)

(declare-fun tp_is_empty!39319 () Bool)

(declare-fun tp!114785 () Bool)

(assert (=> b!1582555 (= e!883248 (and tp_is_empty!39319 tp!114785))))

(assert (=> b!1582522 (= tp!114782 e!883248)))

(assert (= (and b!1582522 (is-Cons!36870 (toList!11409 thiss!185))) b!1582555))

(push 1)

