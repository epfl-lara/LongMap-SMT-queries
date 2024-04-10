; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43686 () Bool)

(assert start!43686)

(declare-fun res!288188 () Bool)

(declare-fun e!284657 () Bool)

(assert (=> start!43686 (=> (not res!288188) (not e!284657))))

(declare-datatypes ((B!1068 0))(
  ( (B!1069 (val!6986 Int)) )
))
(declare-datatypes ((tuple2!9174 0))(
  ( (tuple2!9175 (_1!4598 (_ BitVec 64)) (_2!4598 B!1068)) )
))
(declare-datatypes ((List!9250 0))(
  ( (Nil!9247) (Cons!9246 (h!10102 tuple2!9174) (t!15472 List!9250)) )
))
(declare-datatypes ((ListLongMap!8087 0))(
  ( (ListLongMap!8088 (toList!4059 List!9250)) )
))
(declare-fun thiss!180 () ListLongMap!8087)

(declare-fun isEmpty!619 (ListLongMap!8087) Bool)

(assert (=> start!43686 (= res!288188 (not (isEmpty!619 thiss!180)))))

(assert (=> start!43686 e!284657))

(declare-fun e!284658 () Bool)

(declare-fun inv!15793 (ListLongMap!8087) Bool)

(assert (=> start!43686 (and (inv!15793 thiss!180) e!284658)))

(declare-fun b!483688 () Bool)

(assert (=> b!483688 (= e!284657 (= (toList!4059 thiss!180) Nil!9247))))

(declare-fun b!483689 () Bool)

(declare-fun tp!43381 () Bool)

(assert (=> b!483689 (= e!284658 tp!43381)))

(assert (= (and start!43686 res!288188) b!483688))

(assert (= start!43686 b!483689))

(declare-fun m!464641 () Bool)

(assert (=> start!43686 m!464641))

(declare-fun m!464643 () Bool)

(assert (=> start!43686 m!464643))

(push 1)

(assert (not start!43686))

(assert (not b!483689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76947 () Bool)

(declare-fun isEmpty!622 (List!9250) Bool)

(assert (=> d!76947 (= (isEmpty!619 thiss!180) (isEmpty!622 (toList!4059 thiss!180)))))

(declare-fun bs!15375 () Bool)

(assert (= bs!15375 d!76947))

(declare-fun m!464649 () Bool)

(assert (=> bs!15375 m!464649))

(assert (=> start!43686 d!76947))

(declare-fun d!76953 () Bool)

(declare-fun isStrictlySorted!395 (List!9250) Bool)

(assert (=> d!76953 (= (inv!15793 thiss!180) (isStrictlySorted!395 (toList!4059 thiss!180)))))

(declare-fun bs!15378 () Bool)

(assert (= bs!15378 d!76953))

(declare-fun m!464655 () Bool)

(assert (=> bs!15378 m!464655))

(assert (=> start!43686 d!76953))

(declare-fun b!483704 () Bool)

(declare-fun e!284667 () Bool)

(declare-fun tp_is_empty!13877 () Bool)

(declare-fun tp!43390 () Bool)

(assert (=> b!483704 (= e!284667 (and tp_is_empty!13877 tp!43390))))

(assert (=> b!483689 (= tp!43381 e!284667)))

(assert (= (and b!483689 (is-Cons!9246 (toList!4059 thiss!180))) b!483704))

(push 1)

(assert (not d!76953))

(assert (not d!76947))

(assert (not b!483704))

(assert tp_is_empty!13877)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

