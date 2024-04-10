; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69668 () Bool)

(assert start!69668)

(declare-datatypes ((B!1166 0))(
  ( (B!1167 (val!7035 Int)) )
))
(declare-datatypes ((tuple2!9272 0))(
  ( (tuple2!9273 (_1!4647 (_ BitVec 64)) (_2!4647 B!1166)) )
))
(declare-datatypes ((List!15086 0))(
  ( (Nil!15083) (Cons!15082 (h!16211 tuple2!9272) (t!21401 List!15086)) )
))
(declare-datatypes ((ListLongMap!8095 0))(
  ( (ListLongMap!8096 (toList!4063 List!15086)) )
))
(declare-fun thiss!191 () ListLongMap!8095)

(declare-fun isStrictlySorted!438 (List!15086) Bool)

(assert (=> start!69668 (not (isStrictlySorted!438 (toList!4063 thiss!191)))))

(declare-fun e!449282 () Bool)

(declare-fun inv!25917 (ListLongMap!8095) Bool)

(assert (=> start!69668 (and (inv!25917 thiss!191) e!449282)))

(declare-fun b!811791 () Bool)

(declare-fun tp!43621 () Bool)

(assert (=> b!811791 (= e!449282 tp!43621)))

(assert (= start!69668 b!811791))

(declare-fun m!754271 () Bool)

(assert (=> start!69668 m!754271))

(declare-fun m!754273 () Bool)

(assert (=> start!69668 m!754273))

(push 1)

(assert (not start!69668))

(assert (not b!811791))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104211 () Bool)

(declare-fun res!554840 () Bool)

(declare-fun e!449297 () Bool)

(assert (=> d!104211 (=> res!554840 e!449297)))

(assert (=> d!104211 (= res!554840 (or (is-Nil!15083 (toList!4063 thiss!191)) (is-Nil!15083 (t!21401 (toList!4063 thiss!191)))))))

(assert (=> d!104211 (= (isStrictlySorted!438 (toList!4063 thiss!191)) e!449297)))

(declare-fun b!811806 () Bool)

(declare-fun e!449298 () Bool)

(assert (=> b!811806 (= e!449297 e!449298)))

(declare-fun res!554841 () Bool)

(assert (=> b!811806 (=> (not res!554841) (not e!449298))))

(assert (=> b!811806 (= res!554841 (bvslt (_1!4647 (h!16211 (toList!4063 thiss!191))) (_1!4647 (h!16211 (t!21401 (toList!4063 thiss!191))))))))

(declare-fun b!811807 () Bool)

(assert (=> b!811807 (= e!449298 (isStrictlySorted!438 (t!21401 (toList!4063 thiss!191))))))

(assert (= (and d!104211 (not res!554840)) b!811806))

(assert (= (and b!811806 res!554841) b!811807))

(declare-fun m!754283 () Bool)

(assert (=> b!811807 m!754283))

(assert (=> start!69668 d!104211))

(declare-fun d!104215 () Bool)

(assert (=> d!104215 (= (inv!25917 thiss!191) (isStrictlySorted!438 (toList!4063 thiss!191)))))

(declare-fun bs!22471 () Bool)

(assert (= bs!22471 d!104215))

(assert (=> bs!22471 m!754271))

(assert (=> start!69668 d!104215))

(declare-fun b!811823 () Bool)

(declare-fun e!449309 () Bool)

(declare-fun tp_is_empty!13976 () Bool)

(declare-fun tp!43632 () Bool)

(assert (=> b!811823 (= e!449309 (and tp_is_empty!13976 tp!43632))))

(assert (=> b!811791 (= tp!43621 e!449309)))

(assert (= (and b!811791 (is-Cons!15082 (toList!4063 thiss!191))) b!811823))

(push 1)

