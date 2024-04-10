; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137666 () Bool)

(assert start!137666)

(declare-datatypes ((B!2770 0))(
  ( (B!2771 (val!19747 Int)) )
))
(declare-datatypes ((tuple2!25662 0))(
  ( (tuple2!25663 (_1!12842 (_ BitVec 64)) (_2!12842 B!2770)) )
))
(declare-datatypes ((List!36867 0))(
  ( (Nil!36864) (Cons!36863 (h!38406 tuple2!25662) (t!51781 List!36867)) )
))
(declare-datatypes ((ListLongMap!22773 0))(
  ( (ListLongMap!22774 (toList!11402 List!36867)) )
))
(declare-fun thiss!185 () ListLongMap!22773)

(declare-fun isStrictlySorted!1116 (List!36867) Bool)

(assert (=> start!137666 (not (isStrictlySorted!1116 (toList!11402 thiss!185)))))

(declare-fun e!883160 () Bool)

(declare-fun inv!59112 (ListLongMap!22773) Bool)

(assert (=> start!137666 (and (inv!59112 thiss!185) e!883160)))

(declare-fun b!1582459 () Bool)

(declare-fun tp!114752 () Bool)

(assert (=> b!1582459 (= e!883160 tp!114752)))

(assert (= start!137666 b!1582459))

(declare-fun m!1452885 () Bool)

(assert (=> start!137666 m!1452885))

(declare-fun m!1452887 () Bool)

(assert (=> start!137666 m!1452887))

(check-sat (not start!137666) (not b!1582459))
(check-sat)
(get-model)

(declare-fun d!166989 () Bool)

(declare-fun res!1081108 () Bool)

(declare-fun e!883176 () Bool)

(assert (=> d!166989 (=> res!1081108 e!883176)))

(get-info :version)

(assert (=> d!166989 (= res!1081108 (or ((_ is Nil!36864) (toList!11402 thiss!185)) ((_ is Nil!36864) (t!51781 (toList!11402 thiss!185)))))))

(assert (=> d!166989 (= (isStrictlySorted!1116 (toList!11402 thiss!185)) e!883176)))

(declare-fun b!1582475 () Bool)

(declare-fun e!883177 () Bool)

(assert (=> b!1582475 (= e!883176 e!883177)))

(declare-fun res!1081109 () Bool)

(assert (=> b!1582475 (=> (not res!1081109) (not e!883177))))

(assert (=> b!1582475 (= res!1081109 (bvslt (_1!12842 (h!38406 (toList!11402 thiss!185))) (_1!12842 (h!38406 (t!51781 (toList!11402 thiss!185))))))))

(declare-fun b!1582476 () Bool)

(assert (=> b!1582476 (= e!883177 (isStrictlySorted!1116 (t!51781 (toList!11402 thiss!185))))))

(assert (= (and d!166989 (not res!1081108)) b!1582475))

(assert (= (and b!1582475 res!1081109) b!1582476))

(declare-fun m!1452893 () Bool)

(assert (=> b!1582476 m!1452893))

(assert (=> start!137666 d!166989))

(declare-fun d!166993 () Bool)

(assert (=> d!166993 (= (inv!59112 thiss!185) (isStrictlySorted!1116 (toList!11402 thiss!185)))))

(declare-fun bs!45846 () Bool)

(assert (= bs!45846 d!166993))

(assert (=> bs!45846 m!1452885))

(assert (=> start!137666 d!166993))

(declare-fun b!1582485 () Bool)

(declare-fun e!883184 () Bool)

(declare-fun tp_is_empty!39313 () Bool)

(declare-fun tp!114758 () Bool)

(assert (=> b!1582485 (= e!883184 (and tp_is_empty!39313 tp!114758))))

(assert (=> b!1582459 (= tp!114752 e!883184)))

(assert (= (and b!1582459 ((_ is Cons!36863) (toList!11402 thiss!185))) b!1582485))

(check-sat (not b!1582476) (not d!166993) (not b!1582485) tp_is_empty!39313)
(check-sat)
