; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137688 () Bool)

(assert start!137688)

(declare-fun res!1081116 () Bool)

(declare-fun e!883204 () Bool)

(assert (=> start!137688 (=> (not res!1081116) (not e!883204))))

(declare-datatypes ((B!2780 0))(
  ( (B!2781 (val!19752 Int)) )
))
(declare-datatypes ((tuple2!25672 0))(
  ( (tuple2!25673 (_1!12847 (_ BitVec 64)) (_2!12847 B!2780)) )
))
(declare-datatypes ((List!36872 0))(
  ( (Nil!36869) (Cons!36868 (h!38411 tuple2!25672) (t!51786 List!36872)) )
))
(declare-datatypes ((ListLongMap!22783 0))(
  ( (ListLongMap!22784 (toList!11407 List!36872)) )
))
(declare-fun thiss!185 () ListLongMap!22783)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun containsKey!961 (List!36872 (_ BitVec 64)) Bool)

(assert (=> start!137688 (= res!1081116 (containsKey!961 (toList!11407 thiss!185) key!86))))

(assert (=> start!137688 e!883204))

(declare-fun e!883205 () Bool)

(declare-fun inv!59127 (ListLongMap!22783) Bool)

(assert (=> start!137688 (and (inv!59127 thiss!185) e!883205)))

(assert (=> start!137688 true))

(declare-fun b!1582509 () Bool)

(declare-fun isStrictlySorted!1118 (List!36872) Bool)

(assert (=> b!1582509 (= e!883204 (not (isStrictlySorted!1118 (toList!11407 thiss!185))))))

(declare-fun b!1582510 () Bool)

(declare-fun tp!114776 () Bool)

(assert (=> b!1582510 (= e!883205 tp!114776)))

(assert (= (and start!137688 res!1081116) b!1582509))

(assert (= start!137688 b!1582510))

(declare-fun m!1452905 () Bool)

(assert (=> start!137688 m!1452905))

(declare-fun m!1452907 () Bool)

(assert (=> start!137688 m!1452907))

(declare-fun m!1452909 () Bool)

(assert (=> b!1582509 m!1452909))

(push 1)

(assert (not start!137688))

(assert (not b!1582509))

(assert (not b!1582510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167005 () Bool)

(declare-fun res!1081139 () Bool)

(declare-fun e!883234 () Bool)

(assert (=> d!167005 (=> res!1081139 e!883234)))

(assert (=> d!167005 (= res!1081139 (and (is-Cons!36868 (toList!11407 thiss!185)) (= (_1!12847 (h!38411 (toList!11407 thiss!185))) key!86)))))

(assert (=> d!167005 (= (containsKey!961 (toList!11407 thiss!185) key!86) e!883234)))

(declare-fun b!1582539 () Bool)

(declare-fun e!883235 () Bool)

(assert (=> b!1582539 (= e!883234 e!883235)))

(declare-fun res!1081140 () Bool)

(assert (=> b!1582539 (=> (not res!1081140) (not e!883235))))

(assert (=> b!1582539 (= res!1081140 (and (or (not (is-Cons!36868 (toList!11407 thiss!185))) (bvsle (_1!12847 (h!38411 (toList!11407 thiss!185))) key!86)) (is-Cons!36868 (toList!11407 thiss!185)) (bvslt (_1!12847 (h!38411 (toList!11407 thiss!185))) key!86)))))

(declare-fun b!1582540 () Bool)

(assert (=> b!1582540 (= e!883235 (containsKey!961 (t!51786 (toList!11407 thiss!185)) key!86))))

(assert (= (and d!167005 (not res!1081139)) b!1582539))

(assert (= (and b!1582539 res!1081140) b!1582540))

(declare-fun m!1452927 () Bool)

(assert (=> b!1582540 m!1452927))

(assert (=> start!137688 d!167005))

(declare-fun d!167015 () Bool)

(assert (=> d!167015 (= (inv!59127 thiss!185) (isStrictlySorted!1118 (toList!11407 thiss!185)))))

(declare-fun bs!45856 () Bool)

(assert (= bs!45856 d!167015))

(assert (=> bs!45856 m!1452909))

(assert (=> start!137688 d!167015))

(declare-fun d!167017 () Bool)

(declare-fun res!1081157 () Bool)

(declare-fun e!883255 () Bool)

(assert (=> d!167017 (=> res!1081157 e!883255)))

(assert (=> d!167017 (= res!1081157 (or (is-Nil!36869 (toList!11407 thiss!185)) (is-Nil!36869 (t!51786 (toList!11407 thiss!185)))))))

(assert (=> d!167017 (= (isStrictlySorted!1118 (toList!11407 thiss!185)) e!883255)))

(declare-fun b!1582562 () Bool)

(declare-fun e!883256 () Bool)

(assert (=> b!1582562 (= e!883255 e!883256)))

(declare-fun res!1081158 () Bool)

(assert (=> b!1582562 (=> (not res!1081158) (not e!883256))))

(assert (=> b!1582562 (= res!1081158 (bvslt (_1!12847 (h!38411 (toList!11407 thiss!185))) (_1!12847 (h!38411 (t!51786 (toList!11407 thiss!185))))))))

(declare-fun b!1582563 () Bool)

(assert (=> b!1582563 (= e!883256 (isStrictlySorted!1118 (t!51786 (toList!11407 thiss!185))))))

(assert (= (and d!167017 (not res!1081157)) b!1582562))

(assert (= (and b!1582562 res!1081158) b!1582563))

(declare-fun m!1452933 () Bool)

(assert (=> b!1582563 m!1452933))

(assert (=> b!1582509 d!167017))

(declare-fun b!1582572 () Bool)

(declare-fun e!883261 () Bool)

(declare-fun tp_is_empty!39321 () Bool)

(declare-fun tp!114790 () Bool)

(assert (=> b!1582572 (= e!883261 (and tp_is_empty!39321 tp!114790))))

(assert (=> b!1582510 (= tp!114776 e!883261)))

(assert (= (and b!1582510 (is-Cons!36868 (toList!11407 thiss!185))) b!1582572))

(push 1)

(assert (not b!1582540))

(assert (not b!1582563))

(assert tp_is_empty!39321)

