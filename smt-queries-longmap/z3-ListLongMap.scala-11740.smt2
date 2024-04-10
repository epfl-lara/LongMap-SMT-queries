; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137690 () Bool)

(assert start!137690)

(declare-fun res!1081119 () Bool)

(declare-fun e!883210 () Bool)

(assert (=> start!137690 (=> (not res!1081119) (not e!883210))))

(declare-datatypes ((B!2782 0))(
  ( (B!2783 (val!19753 Int)) )
))
(declare-datatypes ((tuple2!25674 0))(
  ( (tuple2!25675 (_1!12848 (_ BitVec 64)) (_2!12848 B!2782)) )
))
(declare-datatypes ((List!36873 0))(
  ( (Nil!36870) (Cons!36869 (h!38412 tuple2!25674) (t!51787 List!36873)) )
))
(declare-datatypes ((ListLongMap!22785 0))(
  ( (ListLongMap!22786 (toList!11408 List!36873)) )
))
(declare-fun thiss!185 () ListLongMap!22785)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun containsKey!962 (List!36873 (_ BitVec 64)) Bool)

(assert (=> start!137690 (= res!1081119 (containsKey!962 (toList!11408 thiss!185) key!86))))

(assert (=> start!137690 e!883210))

(declare-fun e!883211 () Bool)

(declare-fun inv!59128 (ListLongMap!22785) Bool)

(assert (=> start!137690 (and (inv!59128 thiss!185) e!883211)))

(assert (=> start!137690 true))

(declare-fun b!1582515 () Bool)

(declare-fun isStrictlySorted!1119 (List!36873) Bool)

(assert (=> b!1582515 (= e!883210 (not (isStrictlySorted!1119 (toList!11408 thiss!185))))))

(declare-fun b!1582516 () Bool)

(declare-fun tp!114779 () Bool)

(assert (=> b!1582516 (= e!883211 tp!114779)))

(assert (= (and start!137690 res!1081119) b!1582515))

(assert (= start!137690 b!1582516))

(declare-fun m!1452911 () Bool)

(assert (=> start!137690 m!1452911))

(declare-fun m!1452913 () Bool)

(assert (=> start!137690 m!1452913))

(declare-fun m!1452915 () Bool)

(assert (=> b!1582515 m!1452915))

(check-sat (not b!1582515) (not start!137690) (not b!1582516))
(check-sat)
(get-model)

(declare-fun d!167003 () Bool)

(declare-fun res!1081137 () Bool)

(declare-fun e!883232 () Bool)

(assert (=> d!167003 (=> res!1081137 e!883232)))

(get-info :version)

(assert (=> d!167003 (= res!1081137 (or ((_ is Nil!36870) (toList!11408 thiss!185)) ((_ is Nil!36870) (t!51787 (toList!11408 thiss!185)))))))

(assert (=> d!167003 (= (isStrictlySorted!1119 (toList!11408 thiss!185)) e!883232)))

(declare-fun b!1582537 () Bool)

(declare-fun e!883233 () Bool)

(assert (=> b!1582537 (= e!883232 e!883233)))

(declare-fun res!1081138 () Bool)

(assert (=> b!1582537 (=> (not res!1081138) (not e!883233))))

(assert (=> b!1582537 (= res!1081138 (bvslt (_1!12848 (h!38412 (toList!11408 thiss!185))) (_1!12848 (h!38412 (t!51787 (toList!11408 thiss!185))))))))

(declare-fun b!1582538 () Bool)

(assert (=> b!1582538 (= e!883233 (isStrictlySorted!1119 (t!51787 (toList!11408 thiss!185))))))

(assert (= (and d!167003 (not res!1081137)) b!1582537))

(assert (= (and b!1582537 res!1081138) b!1582538))

(declare-fun m!1452925 () Bool)

(assert (=> b!1582538 m!1452925))

(assert (=> b!1582515 d!167003))

(declare-fun d!167011 () Bool)

(declare-fun res!1081155 () Bool)

(declare-fun e!883253 () Bool)

(assert (=> d!167011 (=> res!1081155 e!883253)))

(assert (=> d!167011 (= res!1081155 (and ((_ is Cons!36869) (toList!11408 thiss!185)) (= (_1!12848 (h!38412 (toList!11408 thiss!185))) key!86)))))

(assert (=> d!167011 (= (containsKey!962 (toList!11408 thiss!185) key!86) e!883253)))

(declare-fun b!1582560 () Bool)

(declare-fun e!883254 () Bool)

(assert (=> b!1582560 (= e!883253 e!883254)))

(declare-fun res!1081156 () Bool)

(assert (=> b!1582560 (=> (not res!1081156) (not e!883254))))

(assert (=> b!1582560 (= res!1081156 (and (or (not ((_ is Cons!36869) (toList!11408 thiss!185))) (bvsle (_1!12848 (h!38412 (toList!11408 thiss!185))) key!86)) ((_ is Cons!36869) (toList!11408 thiss!185)) (bvslt (_1!12848 (h!38412 (toList!11408 thiss!185))) key!86)))))

(declare-fun b!1582561 () Bool)

(assert (=> b!1582561 (= e!883254 (containsKey!962 (t!51787 (toList!11408 thiss!185)) key!86))))

(assert (= (and d!167011 (not res!1081155)) b!1582560))

(assert (= (and b!1582560 res!1081156) b!1582561))

(declare-fun m!1452931 () Bool)

(assert (=> b!1582561 m!1452931))

(assert (=> start!137690 d!167011))

(declare-fun d!167019 () Bool)

(assert (=> d!167019 (= (inv!59128 thiss!185) (isStrictlySorted!1119 (toList!11408 thiss!185)))))

(declare-fun bs!45857 () Bool)

(assert (= bs!45857 d!167019))

(assert (=> bs!45857 m!1452915))

(assert (=> start!137690 d!167019))

(declare-fun b!1582573 () Bool)

(declare-fun e!883262 () Bool)

(declare-fun tp_is_empty!39323 () Bool)

(declare-fun tp!114791 () Bool)

(assert (=> b!1582573 (= e!883262 (and tp_is_empty!39323 tp!114791))))

(assert (=> b!1582516 (= tp!114779 e!883262)))

(assert (= (and b!1582516 ((_ is Cons!36869) (toList!11408 thiss!185))) b!1582573))

(check-sat tp_is_empty!39323 (not d!167019) (not b!1582538) (not b!1582573) (not b!1582561))
(check-sat)
