; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137664 () Bool)

(assert start!137664)

(declare-datatypes ((B!2768 0))(
  ( (B!2769 (val!19746 Int)) )
))
(declare-datatypes ((tuple2!25660 0))(
  ( (tuple2!25661 (_1!12841 (_ BitVec 64)) (_2!12841 B!2768)) )
))
(declare-datatypes ((List!36866 0))(
  ( (Nil!36863) (Cons!36862 (h!38405 tuple2!25660) (t!51780 List!36866)) )
))
(declare-datatypes ((ListLongMap!22771 0))(
  ( (ListLongMap!22772 (toList!11401 List!36866)) )
))
(declare-fun thiss!185 () ListLongMap!22771)

(declare-fun isStrictlySorted!1115 (List!36866) Bool)

(assert (=> start!137664 (not (isStrictlySorted!1115 (toList!11401 thiss!185)))))

(declare-fun e!883157 () Bool)

(declare-fun inv!59111 (ListLongMap!22771) Bool)

(assert (=> start!137664 (and (inv!59111 thiss!185) e!883157)))

(declare-fun b!1582456 () Bool)

(declare-fun tp!114749 () Bool)

(assert (=> b!1582456 (= e!883157 tp!114749)))

(assert (= start!137664 b!1582456))

(declare-fun m!1452881 () Bool)

(assert (=> start!137664 m!1452881))

(declare-fun m!1452883 () Bool)

(assert (=> start!137664 m!1452883))

(push 1)

(assert (not start!137664))

(assert (not b!1582456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166991 () Bool)

(declare-fun res!1081110 () Bool)

(declare-fun e!883178 () Bool)

(assert (=> d!166991 (=> res!1081110 e!883178)))

(assert (=> d!166991 (= res!1081110 (or (is-Nil!36863 (toList!11401 thiss!185)) (is-Nil!36863 (t!51780 (toList!11401 thiss!185)))))))

(assert (=> d!166991 (= (isStrictlySorted!1115 (toList!11401 thiss!185)) e!883178)))

(declare-fun b!1582481 () Bool)

(declare-fun e!883181 () Bool)

(assert (=> b!1582481 (= e!883178 e!883181)))

(declare-fun res!1081113 () Bool)

(assert (=> b!1582481 (=> (not res!1081113) (not e!883181))))

(assert (=> b!1582481 (= res!1081113 (bvslt (_1!12841 (h!38405 (toList!11401 thiss!185))) (_1!12841 (h!38405 (t!51780 (toList!11401 thiss!185))))))))

(declare-fun b!1582482 () Bool)

(assert (=> b!1582482 (= e!883181 (isStrictlySorted!1115 (t!51780 (toList!11401 thiss!185))))))

(assert (= (and d!166991 (not res!1081110)) b!1582481))

(assert (= (and b!1582481 res!1081113) b!1582482))

(declare-fun m!1452897 () Bool)

(assert (=> b!1582482 m!1452897))

(assert (=> start!137664 d!166991))

(declare-fun d!166997 () Bool)

