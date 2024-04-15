; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137658 () Bool)

(assert start!137658)

(declare-fun res!1080993 () Bool)

(declare-fun e!883018 () Bool)

(assert (=> start!137658 (=> (not res!1080993) (not e!883018))))

(declare-datatypes ((B!2784 0))(
  ( (B!2785 (val!19754 Int)) )
))
(declare-datatypes ((tuple2!25744 0))(
  ( (tuple2!25745 (_1!12883 (_ BitVec 64)) (_2!12883 B!2784)) )
))
(declare-datatypes ((List!36915 0))(
  ( (Nil!36912) (Cons!36911 (h!38455 tuple2!25744) (t!51821 List!36915)) )
))
(declare-datatypes ((ListLongMap!22855 0))(
  ( (ListLongMap!22856 (toList!11443 List!36915)) )
))
(declare-fun thiss!185 () ListLongMap!22855)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun containsKey!961 (List!36915 (_ BitVec 64)) Bool)

(assert (=> start!137658 (= res!1080993 (containsKey!961 (toList!11443 thiss!185) key!86))))

(assert (=> start!137658 e!883018))

(declare-fun e!883019 () Bool)

(declare-fun inv!59129 (ListLongMap!22855) Bool)

(assert (=> start!137658 (and (inv!59129 thiss!185) e!883019)))

(assert (=> start!137658 true))

(declare-fun b!1582208 () Bool)

(declare-fun isStrictlySorted!1118 (List!36915) Bool)

(assert (=> b!1582208 (= e!883018 (not (isStrictlySorted!1118 (toList!11443 thiss!185))))))

(declare-fun b!1582209 () Bool)

(declare-fun tp!114783 () Bool)

(assert (=> b!1582209 (= e!883019 tp!114783)))

(assert (= (and start!137658 res!1080993) b!1582208))

(assert (= start!137658 b!1582209))

(declare-fun m!1452037 () Bool)

(assert (=> start!137658 m!1452037))

(declare-fun m!1452039 () Bool)

(assert (=> start!137658 m!1452039))

(declare-fun m!1452041 () Bool)

(assert (=> b!1582208 m!1452041))

(push 1)

(assert (not b!1582208))

(assert (not start!137658))

(assert (not b!1582209))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166765 () Bool)

(declare-fun res!1081004 () Bool)

(declare-fun e!883030 () Bool)

(assert (=> d!166765 (=> res!1081004 e!883030)))

(assert (=> d!166765 (= res!1081004 (or (is-Nil!36912 (toList!11443 thiss!185)) (is-Nil!36912 (t!51821 (toList!11443 thiss!185)))))))

(assert (=> d!166765 (= (isStrictlySorted!1118 (toList!11443 thiss!185)) e!883030)))

(declare-fun b!1582220 () Bool)

(declare-fun e!883031 () Bool)

(assert (=> b!1582220 (= e!883030 e!883031)))

(declare-fun res!1081005 () Bool)

(assert (=> b!1582220 (=> (not res!1081005) (not e!883031))))

(assert (=> b!1582220 (= res!1081005 (bvslt (_1!12883 (h!38455 (toList!11443 thiss!185))) (_1!12883 (h!38455 (t!51821 (toList!11443 thiss!185))))))))

(declare-fun b!1582221 () Bool)

(assert (=> b!1582221 (= e!883031 (isStrictlySorted!1118 (t!51821 (toList!11443 thiss!185))))))

(assert (= (and d!166765 (not res!1081004)) b!1582220))

(assert (= (and b!1582220 res!1081005) b!1582221))

(declare-fun m!1452043 () Bool)

(assert (=> b!1582221 m!1452043))

(assert (=> b!1582208 d!166765))

(declare-fun d!166771 () Bool)

(declare-fun res!1081016 () Bool)

(declare-fun e!883042 () Bool)

(assert (=> d!166771 (=> res!1081016 e!883042)))

(assert (=> d!166771 (= res!1081016 (and (is-Cons!36911 (toList!11443 thiss!185)) (= (_1!12883 (h!38455 (toList!11443 thiss!185))) key!86)))))

(assert (=> d!166771 (= (containsKey!961 (toList!11443 thiss!185) key!86) e!883042)))

(declare-fun b!1582232 () Bool)

(declare-fun e!883043 () Bool)

(assert (=> b!1582232 (= e!883042 e!883043)))

(declare-fun res!1081017 () Bool)

(assert (=> b!1582232 (=> (not res!1081017) (not e!883043))))

(assert (=> b!1582232 (= res!1081017 (and (or (not (is-Cons!36911 (toList!11443 thiss!185))) (bvsle (_1!12883 (h!38455 (toList!11443 thiss!185))) key!86)) (is-Cons!36911 (toList!11443 thiss!185)) (bvslt (_1!12883 (h!38455 (toList!11443 thiss!185))) key!86)))))

(declare-fun b!1582233 () Bool)

(assert (=> b!1582233 (= e!883043 (containsKey!961 (t!51821 (toList!11443 thiss!185)) key!86))))

(assert (= (and d!166771 (not res!1081016)) b!1582232))

(assert (= (and b!1582232 res!1081017) b!1582233))

(declare-fun m!1452049 () Bool)

(assert (=> b!1582233 m!1452049))

(assert (=> start!137658 d!166771))

(declare-fun d!166779 () Bool)

(assert (=> d!166779 (= (inv!59129 thiss!185) (isStrictlySorted!1118 (toList!11443 thiss!185)))))

(declare-fun bs!45811 () Bool)

(assert (= bs!45811 d!166779))

(assert (=> bs!45811 m!1452041))

(assert (=> start!137658 d!166779))

(declare-fun b!1582242 () Bool)

(declare-fun e!883050 () Bool)

(declare-fun tp_is_empty!39319 () Bool)

(declare-fun tp!114786 () Bool)

(assert (=> b!1582242 (= e!883050 (and tp_is_empty!39319 tp!114786))))

(assert (=> b!1582209 (= tp!114783 e!883050)))

(assert (= (and b!1582209 (is-Cons!36911 (toList!11443 thiss!185))) b!1582242))

(push 1)

(assert (not b!1582233))

(assert (not d!166779))

(assert (not b!1582221))

(assert (not b!1582242))

(assert tp_is_empty!39319)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

