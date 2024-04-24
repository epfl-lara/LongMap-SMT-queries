; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138104 () Bool)

(assert start!138104)

(declare-datatypes ((B!2768 0))(
  ( (B!2769 (val!19746 Int)) )
))
(declare-datatypes ((tuple2!25720 0))(
  ( (tuple2!25721 (_1!12871 (_ BitVec 64)) (_2!12871 B!2768)) )
))
(declare-datatypes ((List!36898 0))(
  ( (Nil!36895) (Cons!36894 (h!38455 tuple2!25720) (t!51804 List!36898)) )
))
(declare-datatypes ((ListLongMap!22839 0))(
  ( (ListLongMap!22840 (toList!11435 List!36898)) )
))
(declare-fun thiss!185 () ListLongMap!22839)

(declare-fun isStrictlySorted!1103 (List!36898) Bool)

(assert (=> start!138104 (not (isStrictlySorted!1103 (toList!11435 thiss!185)))))

(declare-fun e!884714 () Bool)

(declare-fun inv!59121 (ListLongMap!22839) Bool)

(assert (=> start!138104 (and (inv!59121 thiss!185) e!884714)))

(declare-fun b!1584963 () Bool)

(declare-fun tp!114750 () Bool)

(assert (=> b!1584963 (= e!884714 tp!114750)))

(assert (= start!138104 b!1584963))

(declare-fun m!1455207 () Bool)

(assert (=> start!138104 m!1455207))

(declare-fun m!1455209 () Bool)

(assert (=> start!138104 m!1455209))

(check-sat (not start!138104) (not b!1584963))
(check-sat)
(get-model)

(declare-fun d!167717 () Bool)

(declare-fun res!1082028 () Bool)

(declare-fun e!884733 () Bool)

(assert (=> d!167717 (=> res!1082028 e!884733)))

(get-info :version)

(assert (=> d!167717 (= res!1082028 (or ((_ is Nil!36895) (toList!11435 thiss!185)) ((_ is Nil!36895) (t!51804 (toList!11435 thiss!185)))))))

(assert (=> d!167717 (= (isStrictlySorted!1103 (toList!11435 thiss!185)) e!884733)))

(declare-fun b!1584982 () Bool)

(declare-fun e!884734 () Bool)

(assert (=> b!1584982 (= e!884733 e!884734)))

(declare-fun res!1082029 () Bool)

(assert (=> b!1584982 (=> (not res!1082029) (not e!884734))))

(assert (=> b!1584982 (= res!1082029 (bvslt (_1!12871 (h!38455 (toList!11435 thiss!185))) (_1!12871 (h!38455 (t!51804 (toList!11435 thiss!185))))))))

(declare-fun b!1584983 () Bool)

(assert (=> b!1584983 (= e!884734 (isStrictlySorted!1103 (t!51804 (toList!11435 thiss!185))))))

(assert (= (and d!167717 (not res!1082028)) b!1584982))

(assert (= (and b!1584982 res!1082029) b!1584983))

(declare-fun m!1455219 () Bool)

(assert (=> b!1584983 m!1455219))

(assert (=> start!138104 d!167717))

(declare-fun d!167723 () Bool)

(assert (=> d!167723 (= (inv!59121 thiss!185) (isStrictlySorted!1103 (toList!11435 thiss!185)))))

(declare-fun bs!45870 () Bool)

(assert (= bs!45870 d!167723))

(assert (=> bs!45870 m!1455207))

(assert (=> start!138104 d!167723))

(declare-fun b!1584996 () Bool)

(declare-fun e!884743 () Bool)

(declare-fun tp_is_empty!39313 () Bool)

(declare-fun tp!114761 () Bool)

(assert (=> b!1584996 (= e!884743 (and tp_is_empty!39313 tp!114761))))

(assert (=> b!1584963 (= tp!114750 e!884743)))

(assert (= (and b!1584963 ((_ is Cons!36894) (toList!11435 thiss!185))) b!1584996))

(check-sat (not d!167723) (not b!1584983) (not b!1584996) tp_is_empty!39313)
(check-sat)
