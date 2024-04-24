; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138128 () Bool)

(assert start!138128)

(declare-fun res!1082036 () Bool)

(declare-fun e!884761 () Bool)

(assert (=> start!138128 (=> (not res!1082036) (not e!884761))))

(declare-datatypes ((B!2780 0))(
  ( (B!2781 (val!19752 Int)) )
))
(declare-datatypes ((tuple2!25732 0))(
  ( (tuple2!25733 (_1!12877 (_ BitVec 64)) (_2!12877 B!2780)) )
))
(declare-datatypes ((List!36904 0))(
  ( (Nil!36901) (Cons!36900 (h!38461 tuple2!25732) (t!51810 List!36904)) )
))
(declare-datatypes ((ListLongMap!22851 0))(
  ( (ListLongMap!22852 (toList!11441 List!36904)) )
))
(declare-fun thiss!185 () ListLongMap!22851)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun containsKey!962 (List!36904 (_ BitVec 64)) Bool)

(assert (=> start!138128 (= res!1082036 (containsKey!962 (toList!11441 thiss!185) key!86))))

(assert (=> start!138128 e!884761))

(declare-fun e!884762 () Bool)

(declare-fun inv!59137 (ListLongMap!22851) Bool)

(assert (=> start!138128 (and (inv!59137 thiss!185) e!884762)))

(assert (=> start!138128 true))

(declare-fun b!1585016 () Bool)

(declare-fun isStrictlySorted!1106 (List!36904) Bool)

(assert (=> b!1585016 (= e!884761 (not (isStrictlySorted!1106 (toList!11441 thiss!185))))))

(declare-fun b!1585017 () Bool)

(declare-fun tp!114777 () Bool)

(assert (=> b!1585017 (= e!884762 tp!114777)))

(assert (= (and start!138128 res!1082036) b!1585016))

(assert (= start!138128 b!1585017))

(declare-fun m!1455231 () Bool)

(assert (=> start!138128 m!1455231))

(declare-fun m!1455233 () Bool)

(assert (=> start!138128 m!1455233))

(declare-fun m!1455235 () Bool)

(assert (=> b!1585016 m!1455235))

(check-sat (not start!138128) (not b!1585016) (not b!1585017))
(check-sat)
(get-model)

(declare-fun d!167735 () Bool)

(declare-fun res!1082056 () Bool)

(declare-fun e!884788 () Bool)

(assert (=> d!167735 (=> res!1082056 e!884788)))

(get-info :version)

(assert (=> d!167735 (= res!1082056 (and ((_ is Cons!36900) (toList!11441 thiss!185)) (= (_1!12877 (h!38461 (toList!11441 thiss!185))) key!86)))))

(assert (=> d!167735 (= (containsKey!962 (toList!11441 thiss!185) key!86) e!884788)))

(declare-fun b!1585043 () Bool)

(declare-fun e!884790 () Bool)

(assert (=> b!1585043 (= e!884788 e!884790)))

(declare-fun res!1082058 () Bool)

(assert (=> b!1585043 (=> (not res!1082058) (not e!884790))))

(assert (=> b!1585043 (= res!1082058 (and (or (not ((_ is Cons!36900) (toList!11441 thiss!185))) (bvsle (_1!12877 (h!38461 (toList!11441 thiss!185))) key!86)) ((_ is Cons!36900) (toList!11441 thiss!185)) (bvslt (_1!12877 (h!38461 (toList!11441 thiss!185))) key!86)))))

(declare-fun b!1585045 () Bool)

(assert (=> b!1585045 (= e!884790 (containsKey!962 (t!51810 (toList!11441 thiss!185)) key!86))))

(assert (= (and d!167735 (not res!1082056)) b!1585043))

(assert (= (and b!1585043 res!1082058) b!1585045))

(declare-fun m!1455249 () Bool)

(assert (=> b!1585045 m!1455249))

(assert (=> start!138128 d!167735))

(declare-fun d!167740 () Bool)

(assert (=> d!167740 (= (inv!59137 thiss!185) (isStrictlySorted!1106 (toList!11441 thiss!185)))))

(declare-fun bs!45879 () Bool)

(assert (= bs!45879 d!167740))

(assert (=> bs!45879 m!1455235))

(assert (=> start!138128 d!167740))

(declare-fun d!167747 () Bool)

(declare-fun res!1082073 () Bool)

(declare-fun e!884805 () Bool)

(assert (=> d!167747 (=> res!1082073 e!884805)))

(assert (=> d!167747 (= res!1082073 (or ((_ is Nil!36901) (toList!11441 thiss!185)) ((_ is Nil!36901) (t!51810 (toList!11441 thiss!185)))))))

(assert (=> d!167747 (= (isStrictlySorted!1106 (toList!11441 thiss!185)) e!884805)))

(declare-fun b!1585060 () Bool)

(declare-fun e!884806 () Bool)

(assert (=> b!1585060 (= e!884805 e!884806)))

(declare-fun res!1082074 () Bool)

(assert (=> b!1585060 (=> (not res!1082074) (not e!884806))))

(assert (=> b!1585060 (= res!1082074 (bvslt (_1!12877 (h!38461 (toList!11441 thiss!185))) (_1!12877 (h!38461 (t!51810 (toList!11441 thiss!185))))))))

(declare-fun b!1585061 () Bool)

(assert (=> b!1585061 (= e!884806 (isStrictlySorted!1106 (t!51810 (toList!11441 thiss!185))))))

(assert (= (and d!167747 (not res!1082073)) b!1585060))

(assert (= (and b!1585060 res!1082074) b!1585061))

(declare-fun m!1455255 () Bool)

(assert (=> b!1585061 m!1455255))

(assert (=> b!1585016 d!167747))

(declare-fun b!1585074 () Bool)

(declare-fun e!884815 () Bool)

(declare-fun tp_is_empty!39321 () Bool)

(declare-fun tp!114788 () Bool)

(assert (=> b!1585074 (= e!884815 (and tp_is_empty!39321 tp!114788))))

(assert (=> b!1585017 (= tp!114777 e!884815)))

(assert (= (and b!1585017 ((_ is Cons!36900) (toList!11441 thiss!185))) b!1585074))

(check-sat (not b!1585074) tp_is_empty!39321 (not b!1585045) (not b!1585061) (not d!167740))
(check-sat)
