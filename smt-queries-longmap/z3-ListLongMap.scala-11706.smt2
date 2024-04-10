; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136924 () Bool)

(assert start!136924)

(declare-datatypes ((B!2578 0))(
  ( (B!2579 (val!19651 Int)) )
))
(declare-datatypes ((tuple2!25404 0))(
  ( (tuple2!25405 (_1!12713 (_ BitVec 64)) (_2!12713 B!2578)) )
))
(declare-datatypes ((List!36771 0))(
  ( (Nil!36768) (Cons!36767 (h!38310 tuple2!25404) (t!51685 List!36771)) )
))
(declare-datatypes ((ListLongMap!22743 0))(
  ( (ListLongMap!22744 (toList!11387 List!36771)) )
))
(declare-fun thiss!201 () ListLongMap!22743)

(declare-fun isStrictlySorted!1032 (List!36771) Bool)

(assert (=> start!136924 (not (isStrictlySorted!1032 (toList!11387 thiss!201)))))

(declare-fun e!880940 () Bool)

(declare-fun inv!58937 (ListLongMap!22743) Bool)

(assert (=> start!136924 (and (inv!58937 thiss!201) e!880940)))

(declare-fun b!1579245 () Bool)

(declare-fun tp!114300 () Bool)

(assert (=> b!1579245 (= e!880940 tp!114300)))

(assert (= start!136924 b!1579245))

(declare-fun m!1451129 () Bool)

(assert (=> start!136924 m!1451129))

(declare-fun m!1451131 () Bool)

(assert (=> start!136924 m!1451131))

(check-sat (not start!136924) (not b!1579245))
(check-sat)
(get-model)

(declare-fun d!166237 () Bool)

(declare-fun res!1079016 () Bool)

(declare-fun e!880952 () Bool)

(assert (=> d!166237 (=> res!1079016 e!880952)))

(get-info :version)

(assert (=> d!166237 (= res!1079016 (or ((_ is Nil!36768) (toList!11387 thiss!201)) ((_ is Nil!36768) (t!51685 (toList!11387 thiss!201)))))))

(assert (=> d!166237 (= (isStrictlySorted!1032 (toList!11387 thiss!201)) e!880952)))

(declare-fun b!1579257 () Bool)

(declare-fun e!880953 () Bool)

(assert (=> b!1579257 (= e!880952 e!880953)))

(declare-fun res!1079017 () Bool)

(assert (=> b!1579257 (=> (not res!1079017) (not e!880953))))

(assert (=> b!1579257 (= res!1079017 (bvslt (_1!12713 (h!38310 (toList!11387 thiss!201))) (_1!12713 (h!38310 (t!51685 (toList!11387 thiss!201))))))))

(declare-fun b!1579258 () Bool)

(assert (=> b!1579258 (= e!880953 (isStrictlySorted!1032 (t!51685 (toList!11387 thiss!201))))))

(assert (= (and d!166237 (not res!1079016)) b!1579257))

(assert (= (and b!1579257 res!1079017) b!1579258))

(declare-fun m!1451137 () Bool)

(assert (=> b!1579258 m!1451137))

(assert (=> start!136924 d!166237))

(declare-fun d!166243 () Bool)

(assert (=> d!166243 (= (inv!58937 thiss!201) (isStrictlySorted!1032 (toList!11387 thiss!201)))))

(declare-fun bs!45732 () Bool)

(assert (= bs!45732 d!166243))

(assert (=> bs!45732 m!1451129))

(assert (=> start!136924 d!166243))

(declare-fun b!1579273 () Bool)

(declare-fun e!880964 () Bool)

(declare-fun tp_is_empty!39121 () Bool)

(declare-fun tp!114308 () Bool)

(assert (=> b!1579273 (= e!880964 (and tp_is_empty!39121 tp!114308))))

(assert (=> b!1579245 (= tp!114300 e!880964)))

(assert (= (and b!1579245 ((_ is Cons!36767) (toList!11387 thiss!201))) b!1579273))

(check-sat (not d!166243) (not b!1579258) (not b!1579273) tp_is_empty!39121)
(check-sat)
