; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43682 () Bool)

(assert start!43682)

(declare-fun res!288182 () Bool)

(declare-fun e!284645 () Bool)

(assert (=> start!43682 (=> (not res!288182) (not e!284645))))

(declare-datatypes ((B!1064 0))(
  ( (B!1065 (val!6984 Int)) )
))
(declare-datatypes ((tuple2!9170 0))(
  ( (tuple2!9171 (_1!4596 (_ BitVec 64)) (_2!4596 B!1064)) )
))
(declare-datatypes ((List!9248 0))(
  ( (Nil!9245) (Cons!9244 (h!10100 tuple2!9170) (t!15470 List!9248)) )
))
(declare-datatypes ((ListLongMap!8083 0))(
  ( (ListLongMap!8084 (toList!4057 List!9248)) )
))
(declare-fun thiss!180 () ListLongMap!8083)

(declare-fun isEmpty!617 (ListLongMap!8083) Bool)

(assert (=> start!43682 (= res!288182 (not (isEmpty!617 thiss!180)))))

(assert (=> start!43682 e!284645))

(declare-fun e!284646 () Bool)

(declare-fun inv!15791 (ListLongMap!8083) Bool)

(assert (=> start!43682 (and (inv!15791 thiss!180) e!284646)))

(declare-fun b!483676 () Bool)

(assert (=> b!483676 (= e!284645 (= (toList!4057 thiss!180) Nil!9245))))

(declare-fun b!483677 () Bool)

(declare-fun tp!43375 () Bool)

(assert (=> b!483677 (= e!284646 tp!43375)))

(assert (= (and start!43682 res!288182) b!483676))

(assert (= start!43682 b!483677))

(declare-fun m!464633 () Bool)

(assert (=> start!43682 m!464633))

(declare-fun m!464635 () Bool)

(assert (=> start!43682 m!464635))

(push 1)

(assert (not start!43682))

(assert (not b!483677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76945 () Bool)

(declare-fun isEmpty!621 (List!9248) Bool)

(assert (=> d!76945 (= (isEmpty!617 thiss!180) (isEmpty!621 (toList!4057 thiss!180)))))

(declare-fun bs!15374 () Bool)

(assert (= bs!15374 d!76945))

(declare-fun m!464647 () Bool)

(assert (=> bs!15374 m!464647))

(assert (=> start!43682 d!76945))

(declare-fun d!76951 () Bool)

(declare-fun isStrictlySorted!394 (List!9248) Bool)

(assert (=> d!76951 (= (inv!15791 thiss!180) (isStrictlySorted!394 (toList!4057 thiss!180)))))

(declare-fun bs!15377 () Bool)

(assert (= bs!15377 d!76951))

(declare-fun m!464653 () Bool)

(assert (=> bs!15377 m!464653))

(assert (=> start!43682 d!76951))

(declare-fun b!483699 () Bool)

(declare-fun e!284664 () Bool)

(declare-fun tp_is_empty!13875 () Bool)

(declare-fun tp!43387 () Bool)

(assert (=> b!483699 (= e!284664 (and tp_is_empty!13875 tp!43387))))

(assert (=> b!483677 (= tp!43375 e!284664)))

(assert (= (and b!483677 (is-Cons!9244 (toList!4057 thiss!180))) b!483699))

(push 1)

(assert (not d!76945))

(assert (not d!76951))

(assert (not b!483699))

(assert tp_is_empty!13875)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76959 () Bool)

(assert (=> d!76959 (= (isEmpty!621 (toList!4057 thiss!180)) (is-Nil!9245 (toList!4057 thiss!180)))))

(assert (=> d!76945 d!76959))

(declare-fun d!76961 () Bool)

(declare-fun res!288199 () Bool)

(declare-fun e!284679 () Bool)

(assert (=> d!76961 (=> res!288199 e!284679)))

(assert (=> d!76961 (= res!288199 (or (is-Nil!9245 (toList!4057 thiss!180)) (is-Nil!9245 (t!15470 (toList!4057 thiss!180)))))))

(assert (=> d!76961 (= (isStrictlySorted!394 (toList!4057 thiss!180)) e!284679)))

(declare-fun b!483716 () Bool)

(declare-fun e!284680 () Bool)

(assert (=> b!483716 (= e!284679 e!284680)))

(declare-fun res!288200 () Bool)

(assert (=> b!483716 (=> (not res!288200) (not e!284680))))

(assert (=> b!483716 (= res!288200 (bvslt (_1!4596 (h!10100 (toList!4057 thiss!180))) (_1!4596 (h!10100 (t!15470 (toList!4057 thiss!180))))))))

(declare-fun b!483717 () Bool)

(assert (=> b!483717 (= e!284680 (isStrictlySorted!394 (t!15470 (toList!4057 thiss!180))))))

(assert (= (and d!76961 (not res!288199)) b!483716))

(assert (= (and b!483716 res!288200) b!483717))

(declare-fun m!464659 () Bool)

(assert (=> b!483717 m!464659))

(assert (=> d!76951 d!76961))

(declare-fun b!483718 () Bool)

(declare-fun e!284681 () Bool)

(declare-fun tp!43392 () Bool)

(assert (=> b!483718 (= e!284681 (and tp_is_empty!13875 tp!43392))))

(assert (=> b!483699 (= tp!43387 e!284681)))

(assert (= (and b!483699 (is-Cons!9244 (t!15470 (toList!4057 thiss!180)))) b!483718))

