; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69836 () Bool)

(assert start!69836)

(declare-datatypes ((B!1166 0))(
  ( (B!1167 (val!7035 Int)) )
))
(declare-datatypes ((tuple2!9186 0))(
  ( (tuple2!9187 (_1!4604 (_ BitVec 64)) (_2!4604 B!1166)) )
))
(declare-datatypes ((List!14988 0))(
  ( (Nil!14985) (Cons!14984 (h!16119 tuple2!9186) (t!21295 List!14988)) )
))
(declare-datatypes ((ListLongMap!8011 0))(
  ( (ListLongMap!8012 (toList!4021 List!14988)) )
))
(declare-fun thiss!191 () ListLongMap!8011)

(declare-fun isStrictlySorted!426 (List!14988) Bool)

(assert (=> start!69836 (not (isStrictlySorted!426 (toList!4021 thiss!191)))))

(declare-fun e!449854 () Bool)

(declare-fun inv!25917 (ListLongMap!8011) Bool)

(assert (=> start!69836 (and (inv!25917 thiss!191) e!449854)))

(declare-fun b!812679 () Bool)

(declare-fun tp!43621 () Bool)

(assert (=> b!812679 (= e!449854 tp!43621)))

(assert (= start!69836 b!812679))

(declare-fun m!755557 () Bool)

(assert (=> start!69836 m!755557))

(declare-fun m!755559 () Bool)

(assert (=> start!69836 m!755559))

(check-sat (not start!69836) (not b!812679))
(check-sat)
(get-model)

(declare-fun d!104531 () Bool)

(declare-fun res!555184 () Bool)

(declare-fun e!449873 () Bool)

(assert (=> d!104531 (=> res!555184 e!449873)))

(get-info :version)

(assert (=> d!104531 (= res!555184 (or ((_ is Nil!14985) (toList!4021 thiss!191)) ((_ is Nil!14985) (t!21295 (toList!4021 thiss!191)))))))

(assert (=> d!104531 (= (isStrictlySorted!426 (toList!4021 thiss!191)) e!449873)))

(declare-fun b!812698 () Bool)

(declare-fun e!449874 () Bool)

(assert (=> b!812698 (= e!449873 e!449874)))

(declare-fun res!555185 () Bool)

(assert (=> b!812698 (=> (not res!555185) (not e!449874))))

(assert (=> b!812698 (= res!555185 (bvslt (_1!4604 (h!16119 (toList!4021 thiss!191))) (_1!4604 (h!16119 (t!21295 (toList!4021 thiss!191))))))))

(declare-fun b!812699 () Bool)

(assert (=> b!812699 (= e!449874 (isStrictlySorted!426 (t!21295 (toList!4021 thiss!191))))))

(assert (= (and d!104531 (not res!555184)) b!812698))

(assert (= (and b!812698 res!555185) b!812699))

(declare-fun m!755569 () Bool)

(assert (=> b!812699 m!755569))

(assert (=> start!69836 d!104531))

(declare-fun d!104537 () Bool)

(assert (=> d!104537 (= (inv!25917 thiss!191) (isStrictlySorted!426 (toList!4021 thiss!191)))))

(declare-fun bs!22487 () Bool)

(assert (= bs!22487 d!104537))

(assert (=> bs!22487 m!755557))

(assert (=> start!69836 d!104537))

(declare-fun b!812716 () Bool)

(declare-fun e!449885 () Bool)

(declare-fun tp_is_empty!13975 () Bool)

(declare-fun tp!43634 () Bool)

(assert (=> b!812716 (= e!449885 (and tp_is_empty!13975 tp!43634))))

(assert (=> b!812679 (= tp!43621 e!449885)))

(assert (= (and b!812679 ((_ is Cons!14984) (toList!4021 thiss!191))) b!812716))

(check-sat (not d!104537) (not b!812699) (not b!812716) tp_is_empty!13975)
(check-sat)
