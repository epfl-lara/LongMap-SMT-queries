; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69648 () Bool)

(assert start!69648)

(declare-datatypes ((B!1166 0))(
  ( (B!1167 (val!7035 Int)) )
))
(declare-datatypes ((tuple2!9322 0))(
  ( (tuple2!9323 (_1!4672 (_ BitVec 64)) (_2!4672 B!1166)) )
))
(declare-datatypes ((List!15124 0))(
  ( (Nil!15121) (Cons!15120 (h!16249 tuple2!9322) (t!21430 List!15124)) )
))
(declare-datatypes ((ListLongMap!8135 0))(
  ( (ListLongMap!8136 (toList!4083 List!15124)) )
))
(declare-fun thiss!191 () ListLongMap!8135)

(declare-fun isStrictlySorted!434 (List!15124) Bool)

(assert (=> start!69648 (not (isStrictlySorted!434 (toList!4083 thiss!191)))))

(declare-fun e!449128 () Bool)

(declare-fun inv!25917 (ListLongMap!8135) Bool)

(assert (=> start!69648 (and (inv!25917 thiss!191) e!449128)))

(declare-fun b!811541 () Bool)

(declare-fun tp!43621 () Bool)

(assert (=> b!811541 (= e!449128 tp!43621)))

(assert (= start!69648 b!811541))

(declare-fun m!753529 () Bool)

(assert (=> start!69648 m!753529))

(declare-fun m!753531 () Bool)

(assert (=> start!69648 m!753531))

(check-sat (not start!69648) (not b!811541))
(check-sat)
(get-model)

(declare-fun d!104015 () Bool)

(declare-fun res!554734 () Bool)

(declare-fun e!449143 () Bool)

(assert (=> d!104015 (=> res!554734 e!449143)))

(get-info :version)

(assert (=> d!104015 (= res!554734 (or ((_ is Nil!15121) (toList!4083 thiss!191)) ((_ is Nil!15121) (t!21430 (toList!4083 thiss!191)))))))

(assert (=> d!104015 (= (isStrictlySorted!434 (toList!4083 thiss!191)) e!449143)))

(declare-fun b!811558 () Bool)

(declare-fun e!449148 () Bool)

(assert (=> b!811558 (= e!449143 e!449148)))

(declare-fun res!554735 () Bool)

(assert (=> b!811558 (=> (not res!554735) (not e!449148))))

(assert (=> b!811558 (= res!554735 (bvslt (_1!4672 (h!16249 (toList!4083 thiss!191))) (_1!4672 (h!16249 (t!21430 (toList!4083 thiss!191))))))))

(declare-fun b!811559 () Bool)

(assert (=> b!811559 (= e!449148 (isStrictlySorted!434 (t!21430 (toList!4083 thiss!191))))))

(assert (= (and d!104015 (not res!554734)) b!811558))

(assert (= (and b!811558 res!554735) b!811559))

(declare-fun m!753543 () Bool)

(assert (=> b!811559 m!753543))

(assert (=> start!69648 d!104015))

(declare-fun d!104023 () Bool)

(assert (=> d!104023 (= (inv!25917 thiss!191) (isStrictlySorted!434 (toList!4083 thiss!191)))))

(declare-fun bs!22441 () Bool)

(assert (= bs!22441 d!104023))

(assert (=> bs!22441 m!753529))

(assert (=> start!69648 d!104023))

(declare-fun b!811574 () Bool)

(declare-fun e!449157 () Bool)

(declare-fun tp_is_empty!13976 () Bool)

(declare-fun tp!43632 () Bool)

(assert (=> b!811574 (= e!449157 (and tp_is_empty!13976 tp!43632))))

(assert (=> b!811541 (= tp!43621 e!449157)))

(assert (= (and b!811541 ((_ is Cons!15120) (toList!4083 thiss!191))) b!811574))

(check-sat (not b!811559) (not d!104023) (not b!811574) tp_is_empty!13976)
(check-sat)
