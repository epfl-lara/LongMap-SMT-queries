; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43698 () Bool)

(assert start!43698)

(declare-fun res!288080 () Bool)

(declare-fun e!284519 () Bool)

(assert (=> start!43698 (=> (not res!288080) (not e!284519))))

(declare-datatypes ((B!1070 0))(
  ( (B!1071 (val!6987 Int)) )
))
(declare-datatypes ((tuple2!9226 0))(
  ( (tuple2!9227 (_1!4624 (_ BitVec 64)) (_2!4624 B!1070)) )
))
(declare-datatypes ((List!9289 0))(
  ( (Nil!9286) (Cons!9285 (h!10141 tuple2!9226) (t!15502 List!9289)) )
))
(declare-datatypes ((ListLongMap!8129 0))(
  ( (ListLongMap!8130 (toList!4080 List!9289)) )
))
(declare-fun thiss!180 () ListLongMap!8129)

(declare-fun isEmpty!628 (ListLongMap!8129) Bool)

(assert (=> start!43698 (= res!288080 (not (isEmpty!628 thiss!180)))))

(assert (=> start!43698 e!284519))

(declare-fun e!284520 () Bool)

(declare-fun inv!15799 (ListLongMap!8129) Bool)

(assert (=> start!43698 (and (inv!15799 thiss!180) e!284520)))

(declare-fun b!483459 () Bool)

(declare-fun tail!131 (List!9289) List!9289)

(assert (=> b!483459 (= e!284519 (not (inv!15799 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180))))))))

(declare-fun b!483460 () Bool)

(declare-fun tp!43396 () Bool)

(assert (=> b!483460 (= e!284520 tp!43396)))

(assert (= (and start!43698 res!288080) b!483459))

(assert (= start!43698 b!483460))

(declare-fun m!463929 () Bool)

(assert (=> start!43698 m!463929))

(declare-fun m!463931 () Bool)

(assert (=> start!43698 m!463931))

(declare-fun m!463933 () Bool)

(assert (=> b!483459 m!463933))

(declare-fun m!463935 () Bool)

(assert (=> b!483459 m!463935))

(check-sat (not start!43698) (not b!483459) (not b!483460))
(check-sat)
(get-model)

(declare-fun d!76767 () Bool)

(declare-fun isEmpty!632 (List!9289) Bool)

(assert (=> d!76767 (= (isEmpty!628 thiss!180) (isEmpty!632 (toList!4080 thiss!180)))))

(declare-fun bs!15353 () Bool)

(assert (= bs!15353 d!76767))

(declare-fun m!463955 () Bool)

(assert (=> bs!15353 m!463955))

(assert (=> start!43698 d!76767))

(declare-fun d!76772 () Bool)

(declare-fun isStrictlySorted!393 (List!9289) Bool)

(assert (=> d!76772 (= (inv!15799 thiss!180) (isStrictlySorted!393 (toList!4080 thiss!180)))))

(declare-fun bs!15355 () Bool)

(assert (= bs!15355 d!76772))

(declare-fun m!463959 () Bool)

(assert (=> bs!15355 m!463959))

(assert (=> start!43698 d!76772))

(declare-fun d!76779 () Bool)

(assert (=> d!76779 (= (inv!15799 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180)))) (isStrictlySorted!393 (toList!4080 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180))))))))

(declare-fun bs!15357 () Bool)

(assert (= bs!15357 d!76779))

(declare-fun m!463963 () Bool)

(assert (=> bs!15357 m!463963))

(assert (=> b!483459 d!76779))

(declare-fun d!76783 () Bool)

(assert (=> d!76783 (= (tail!131 (toList!4080 thiss!180)) (t!15502 (toList!4080 thiss!180)))))

(assert (=> b!483459 d!76783))

(declare-fun b!483486 () Bool)

(declare-fun e!284540 () Bool)

(declare-fun tp_is_empty!13880 () Bool)

(declare-fun tp!43410 () Bool)

(assert (=> b!483486 (= e!284540 (and tp_is_empty!13880 tp!43410))))

(assert (=> b!483460 (= tp!43396 e!284540)))

(get-info :version)

(assert (= (and b!483460 ((_ is Cons!9285) (toList!4080 thiss!180))) b!483486))

(check-sat tp_is_empty!13880 (not d!76779) (not d!76772) (not d!76767) (not b!483486))
(check-sat)
(get-model)

(declare-fun d!76789 () Bool)

(declare-fun res!288091 () Bool)

(declare-fun e!284546 () Bool)

(assert (=> d!76789 (=> res!288091 e!284546)))

(assert (=> d!76789 (= res!288091 (or ((_ is Nil!9286) (toList!4080 thiss!180)) ((_ is Nil!9286) (t!15502 (toList!4080 thiss!180)))))))

(assert (=> d!76789 (= (isStrictlySorted!393 (toList!4080 thiss!180)) e!284546)))

(declare-fun b!483492 () Bool)

(declare-fun e!284547 () Bool)

(assert (=> b!483492 (= e!284546 e!284547)))

(declare-fun res!288092 () Bool)

(assert (=> b!483492 (=> (not res!288092) (not e!284547))))

(assert (=> b!483492 (= res!288092 (bvslt (_1!4624 (h!10141 (toList!4080 thiss!180))) (_1!4624 (h!10141 (t!15502 (toList!4080 thiss!180))))))))

(declare-fun b!483493 () Bool)

(assert (=> b!483493 (= e!284547 (isStrictlySorted!393 (t!15502 (toList!4080 thiss!180))))))

(assert (= (and d!76789 (not res!288091)) b!483492))

(assert (= (and b!483492 res!288092) b!483493))

(declare-fun m!463971 () Bool)

(assert (=> b!483493 m!463971))

(assert (=> d!76772 d!76789))

(declare-fun d!76793 () Bool)

(declare-fun res!288093 () Bool)

(declare-fun e!284548 () Bool)

(assert (=> d!76793 (=> res!288093 e!284548)))

(assert (=> d!76793 (= res!288093 (or ((_ is Nil!9286) (toList!4080 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180))))) ((_ is Nil!9286) (t!15502 (toList!4080 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180))))))))))

(assert (=> d!76793 (= (isStrictlySorted!393 (toList!4080 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180))))) e!284548)))

(declare-fun b!483494 () Bool)

(declare-fun e!284549 () Bool)

(assert (=> b!483494 (= e!284548 e!284549)))

(declare-fun res!288094 () Bool)

(assert (=> b!483494 (=> (not res!288094) (not e!284549))))

(assert (=> b!483494 (= res!288094 (bvslt (_1!4624 (h!10141 (toList!4080 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180)))))) (_1!4624 (h!10141 (t!15502 (toList!4080 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180)))))))))))

(declare-fun b!483495 () Bool)

(assert (=> b!483495 (= e!284549 (isStrictlySorted!393 (t!15502 (toList!4080 (ListLongMap!8130 (tail!131 (toList!4080 thiss!180)))))))))

(assert (= (and d!76793 (not res!288093)) b!483494))

(assert (= (and b!483494 res!288094) b!483495))

(declare-fun m!463973 () Bool)

(assert (=> b!483495 m!463973))

(assert (=> d!76779 d!76793))

(declare-fun d!76795 () Bool)

(assert (=> d!76795 (= (isEmpty!632 (toList!4080 thiss!180)) ((_ is Nil!9286) (toList!4080 thiss!180)))))

(assert (=> d!76767 d!76795))

(declare-fun b!483496 () Bool)

(declare-fun e!284550 () Bool)

(declare-fun tp!43412 () Bool)

(assert (=> b!483496 (= e!284550 (and tp_is_empty!13880 tp!43412))))

(assert (=> b!483486 (= tp!43410 e!284550)))

(assert (= (and b!483486 ((_ is Cons!9285) (t!15502 (toList!4080 thiss!180)))) b!483496))

(check-sat (not b!483493) (not b!483495) (not b!483496) tp_is_empty!13880)
(check-sat)
