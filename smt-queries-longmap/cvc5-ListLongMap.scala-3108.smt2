; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43710 () Bool)

(assert start!43710)

(declare-fun res!288209 () Bool)

(declare-fun e!284693 () Bool)

(assert (=> start!43710 (=> (not res!288209) (not e!284693))))

(declare-datatypes ((B!1070 0))(
  ( (B!1071 (val!6987 Int)) )
))
(declare-datatypes ((tuple2!9176 0))(
  ( (tuple2!9177 (_1!4599 (_ BitVec 64)) (_2!4599 B!1070)) )
))
(declare-datatypes ((List!9251 0))(
  ( (Nil!9248) (Cons!9247 (h!10103 tuple2!9176) (t!15473 List!9251)) )
))
(declare-datatypes ((ListLongMap!8089 0))(
  ( (ListLongMap!8090 (toList!4060 List!9251)) )
))
(declare-fun thiss!180 () ListLongMap!8089)

(declare-fun isEmpty!623 (ListLongMap!8089) Bool)

(assert (=> start!43710 (= res!288209 (not (isEmpty!623 thiss!180)))))

(assert (=> start!43710 e!284693))

(declare-fun e!284694 () Bool)

(declare-fun inv!15799 (ListLongMap!8089) Bool)

(assert (=> start!43710 (and (inv!15799 thiss!180) e!284694)))

(declare-fun b!483730 () Bool)

(declare-fun tail!131 (List!9251) List!9251)

(assert (=> b!483730 (= e!284693 (not (inv!15799 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180))))))))

(declare-fun b!483731 () Bool)

(declare-fun tp!43396 () Bool)

(assert (=> b!483731 (= e!284694 tp!43396)))

(assert (= (and start!43710 res!288209) b!483730))

(assert (= start!43710 b!483731))

(declare-fun m!464661 () Bool)

(assert (=> start!43710 m!464661))

(declare-fun m!464663 () Bool)

(assert (=> start!43710 m!464663))

(declare-fun m!464665 () Bool)

(assert (=> b!483730 m!464665))

(declare-fun m!464667 () Bool)

(assert (=> b!483730 m!464667))

(push 1)

(assert (not start!43710))

(assert (not b!483730))

(assert (not b!483731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76969 () Bool)

(declare-fun isEmpty!626 (List!9251) Bool)

(assert (=> d!76969 (= (isEmpty!623 thiss!180) (isEmpty!626 (toList!4060 thiss!180)))))

(declare-fun bs!15382 () Bool)

(assert (= bs!15382 d!76969))

(declare-fun m!464685 () Bool)

(assert (=> bs!15382 m!464685))

(assert (=> start!43710 d!76969))

(declare-fun d!76973 () Bool)

(declare-fun isStrictlySorted!397 (List!9251) Bool)

(assert (=> d!76973 (= (inv!15799 thiss!180) (isStrictlySorted!397 (toList!4060 thiss!180)))))

(declare-fun bs!15385 () Bool)

(assert (= bs!15385 d!76973))

(declare-fun m!464691 () Bool)

(assert (=> bs!15385 m!464691))

(assert (=> start!43710 d!76973))

(declare-fun d!76981 () Bool)

(assert (=> d!76981 (= (inv!15799 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180)))) (isStrictlySorted!397 (toList!4060 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180))))))))

(declare-fun bs!15386 () Bool)

(assert (= bs!15386 d!76981))

(declare-fun m!464693 () Bool)

(assert (=> bs!15386 m!464693))

(assert (=> b!483730 d!76981))

(declare-fun d!76983 () Bool)

(assert (=> d!76983 (= (tail!131 (toList!4060 thiss!180)) (t!15473 (toList!4060 thiss!180)))))

(assert (=> b!483730 d!76983))

(declare-fun b!483753 () Bool)

(declare-fun e!284712 () Bool)

(declare-fun tp_is_empty!13881 () Bool)

(declare-fun tp!43408 () Bool)

(assert (=> b!483753 (= e!284712 (and tp_is_empty!13881 tp!43408))))

(assert (=> b!483731 (= tp!43396 e!284712)))

(assert (= (and b!483731 (is-Cons!9247 (toList!4060 thiss!180))) b!483753))

(push 1)

(assert (not d!76969))

(assert (not d!76981))

(assert tp_is_empty!13881)

(assert (not d!76973))

(assert (not b!483753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76991 () Bool)

(declare-fun res!288220 () Bool)

(declare-fun e!284720 () Bool)

(assert (=> d!76991 (=> res!288220 e!284720)))

(assert (=> d!76991 (= res!288220 (or (is-Nil!9248 (toList!4060 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180))))) (is-Nil!9248 (t!15473 (toList!4060 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180))))))))))

(assert (=> d!76991 (= (isStrictlySorted!397 (toList!4060 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180))))) e!284720)))

(declare-fun b!483763 () Bool)

(declare-fun e!284721 () Bool)

(assert (=> b!483763 (= e!284720 e!284721)))

(declare-fun res!288221 () Bool)

(assert (=> b!483763 (=> (not res!288221) (not e!284721))))

(assert (=> b!483763 (= res!288221 (bvslt (_1!4599 (h!10103 (toList!4060 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180)))))) (_1!4599 (h!10103 (t!15473 (toList!4060 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180)))))))))))

(declare-fun b!483764 () Bool)

(assert (=> b!483764 (= e!284721 (isStrictlySorted!397 (t!15473 (toList!4060 (ListLongMap!8090 (tail!131 (toList!4060 thiss!180)))))))))

(assert (= (and d!76991 (not res!288220)) b!483763))

(assert (= (and b!483763 res!288221) b!483764))

(declare-fun m!464703 () Bool)

(assert (=> b!483764 m!464703))

(assert (=> d!76981 d!76991))

(declare-fun d!76995 () Bool)

(assert (=> d!76995 (= (isEmpty!626 (toList!4060 thiss!180)) (is-Nil!9248 (toList!4060 thiss!180)))))

(assert (=> d!76969 d!76995))

(declare-fun d!76997 () Bool)

(declare-fun res!288222 () Bool)

(declare-fun e!284722 () Bool)

(assert (=> d!76997 (=> res!288222 e!284722)))

(assert (=> d!76997 (= res!288222 (or (is-Nil!9248 (toList!4060 thiss!180)) (is-Nil!9248 (t!15473 (toList!4060 thiss!180)))))))

(assert (=> d!76997 (= (isStrictlySorted!397 (toList!4060 thiss!180)) e!284722)))

(declare-fun b!483765 () Bool)

(declare-fun e!284723 () Bool)

(assert (=> b!483765 (= e!284722 e!284723)))

(declare-fun res!288223 () Bool)

(assert (=> b!483765 (=> (not res!288223) (not e!284723))))

(assert (=> b!483765 (= res!288223 (bvslt (_1!4599 (h!10103 (toList!4060 thiss!180))) (_1!4599 (h!10103 (t!15473 (toList!4060 thiss!180))))))))

(declare-fun b!483766 () Bool)

(assert (=> b!483766 (= e!284723 (isStrictlySorted!397 (t!15473 (toList!4060 thiss!180))))))

(assert (= (and d!76997 (not res!288222)) b!483765))

(assert (= (and b!483765 res!288223) b!483766))

(declare-fun m!464705 () Bool)

(assert (=> b!483766 m!464705))

(assert (=> d!76973 d!76997))

(declare-fun b!483767 () Bool)

(declare-fun e!284726 () Bool)

(declare-fun tp!43412 () Bool)

(assert (=> b!483767 (= e!284726 (and tp_is_empty!13881 tp!43412))))

(assert (=> b!483753 (= tp!43408 e!284726)))

(assert (= (and b!483753 (is-Cons!9247 (t!15473 (toList!4060 thiss!180)))) b!483767))

(push 1)

(assert (not b!483764))

(assert (not b!483766))

(assert (not b!483767))

(assert tp_is_empty!13881)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

