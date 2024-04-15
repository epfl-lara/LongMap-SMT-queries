; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136888 () Bool)

(assert start!136888)

(declare-datatypes ((B!2576 0))(
  ( (B!2577 (val!19650 Int)) )
))
(declare-datatypes ((tuple2!25470 0))(
  ( (tuple2!25471 (_1!12746 (_ BitVec 64)) (_2!12746 B!2576)) )
))
(declare-datatypes ((List!36811 0))(
  ( (Nil!36808) (Cons!36807 (h!38351 tuple2!25470) (t!51717 List!36811)) )
))
(declare-datatypes ((ListLongMap!22809 0))(
  ( (ListLongMap!22810 (toList!11420 List!36811)) )
))
(declare-fun thiss!201 () ListLongMap!22809)

(declare-fun isStrictlySorted!1029 (List!36811) Bool)

(assert (=> start!136888 (not (isStrictlySorted!1029 (toList!11420 thiss!201)))))

(declare-fun e!880739 () Bool)

(declare-fun inv!58936 (ListLongMap!22809) Bool)

(assert (=> start!136888 (and (inv!58936 thiss!201) e!880739)))

(declare-fun b!1578929 () Bool)

(declare-fun tp!114298 () Bool)

(assert (=> b!1578929 (= e!880739 tp!114298)))

(assert (= start!136888 b!1578929))

(declare-fun m!1450245 () Bool)

(assert (=> start!136888 m!1450245))

(declare-fun m!1450247 () Bool)

(assert (=> start!136888 m!1450247))

(check-sat (not start!136888) (not b!1578929))
(check-sat)
(get-model)

(declare-fun d!165999 () Bool)

(declare-fun res!1078891 () Bool)

(declare-fun e!880758 () Bool)

(assert (=> d!165999 (=> res!1078891 e!880758)))

(get-info :version)

(assert (=> d!165999 (= res!1078891 (or ((_ is Nil!36808) (toList!11420 thiss!201)) ((_ is Nil!36808) (t!51717 (toList!11420 thiss!201)))))))

(assert (=> d!165999 (= (isStrictlySorted!1029 (toList!11420 thiss!201)) e!880758)))

(declare-fun b!1578948 () Bool)

(declare-fun e!880759 () Bool)

(assert (=> b!1578948 (= e!880758 e!880759)))

(declare-fun res!1078892 () Bool)

(assert (=> b!1578948 (=> (not res!1078892) (not e!880759))))

(assert (=> b!1578948 (= res!1078892 (bvslt (_1!12746 (h!38351 (toList!11420 thiss!201))) (_1!12746 (h!38351 (t!51717 (toList!11420 thiss!201))))))))

(declare-fun b!1578949 () Bool)

(assert (=> b!1578949 (= e!880759 (isStrictlySorted!1029 (t!51717 (toList!11420 thiss!201))))))

(assert (= (and d!165999 (not res!1078891)) b!1578948))

(assert (= (and b!1578948 res!1078892) b!1578949))

(declare-fun m!1450257 () Bool)

(assert (=> b!1578949 m!1450257))

(assert (=> start!136888 d!165999))

(declare-fun d!166005 () Bool)

(assert (=> d!166005 (= (inv!58936 thiss!201) (isStrictlySorted!1029 (toList!11420 thiss!201)))))

(declare-fun bs!45687 () Bool)

(assert (= bs!45687 d!166005))

(assert (=> bs!45687 m!1450245))

(assert (=> start!136888 d!166005))

(declare-fun b!1578966 () Bool)

(declare-fun e!880770 () Bool)

(declare-fun tp_is_empty!39121 () Bool)

(declare-fun tp!114311 () Bool)

(assert (=> b!1578966 (= e!880770 (and tp_is_empty!39121 tp!114311))))

(assert (=> b!1578929 (= tp!114298 e!880770)))

(assert (= (and b!1578929 ((_ is Cons!36807) (toList!11420 thiss!201))) b!1578966))

(check-sat (not d!166005) (not b!1578949) (not b!1578966) tp_is_empty!39121)
(check-sat)
