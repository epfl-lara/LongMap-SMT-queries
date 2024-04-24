; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43668 () Bool)

(assert start!43668)

(declare-fun res!288175 () Bool)

(declare-fun e!284606 () Bool)

(assert (=> start!43668 (=> (not res!288175) (not e!284606))))

(declare-datatypes ((B!1064 0))(
  ( (B!1065 (val!6984 Int)) )
))
(declare-datatypes ((tuple2!9084 0))(
  ( (tuple2!9085 (_1!4553 (_ BitVec 64)) (_2!4553 B!1064)) )
))
(declare-datatypes ((List!9150 0))(
  ( (Nil!9147) (Cons!9146 (h!10002 tuple2!9084) (t!15364 List!9150)) )
))
(declare-datatypes ((ListLongMap!7999 0))(
  ( (ListLongMap!8000 (toList!4015 List!9150)) )
))
(declare-fun thiss!180 () ListLongMap!7999)

(declare-fun isEmpty!623 (ListLongMap!7999) Bool)

(assert (=> start!43668 (= res!288175 (not (isEmpty!623 thiss!180)))))

(assert (=> start!43668 e!284606))

(declare-fun e!284607 () Bool)

(declare-fun inv!15791 (ListLongMap!7999) Bool)

(assert (=> start!43668 (and (inv!15791 thiss!180) e!284607)))

(declare-fun b!483615 () Bool)

(assert (=> b!483615 (= e!284606 (= (toList!4015 thiss!180) Nil!9147))))

(declare-fun b!483616 () Bool)

(declare-fun tp!43375 () Bool)

(assert (=> b!483616 (= e!284607 tp!43375)))

(assert (= (and start!43668 res!288175) b!483615))

(assert (= start!43668 b!483616))

(declare-fun m!464815 () Bool)

(assert (=> start!43668 m!464815))

(declare-fun m!464817 () Bool)

(assert (=> start!43668 m!464817))

(check-sat (not start!43668) (not b!483616))
(check-sat)
(get-model)

(declare-fun d!76971 () Bool)

(declare-fun isEmpty!626 (List!9150) Bool)

(assert (=> d!76971 (= (isEmpty!623 thiss!180) (isEmpty!626 (toList!4015 thiss!180)))))

(declare-fun bs!15389 () Bool)

(assert (= bs!15389 d!76971))

(declare-fun m!464827 () Bool)

(assert (=> bs!15389 m!464827))

(assert (=> start!43668 d!76971))

(declare-fun d!76975 () Bool)

(declare-fun isStrictlySorted!381 (List!9150) Bool)

(assert (=> d!76975 (= (inv!15791 thiss!180) (isStrictlySorted!381 (toList!4015 thiss!180)))))

(declare-fun bs!15392 () Bool)

(assert (= bs!15392 d!76975))

(declare-fun m!464833 () Bool)

(assert (=> bs!15392 m!464833))

(assert (=> start!43668 d!76975))

(declare-fun b!483633 () Bool)

(declare-fun e!284622 () Bool)

(declare-fun tp_is_empty!13873 () Bool)

(declare-fun tp!43384 () Bool)

(assert (=> b!483633 (= e!284622 (and tp_is_empty!13873 tp!43384))))

(assert (=> b!483616 (= tp!43375 e!284622)))

(get-info :version)

(assert (= (and b!483616 ((_ is Cons!9146) (toList!4015 thiss!180))) b!483633))

(check-sat (not d!76975) (not d!76971) (not b!483633) tp_is_empty!13873)
(check-sat)
(get-model)

(declare-fun d!76983 () Bool)

(declare-fun res!288186 () Bool)

(declare-fun e!284633 () Bool)

(assert (=> d!76983 (=> res!288186 e!284633)))

(assert (=> d!76983 (= res!288186 (or ((_ is Nil!9147) (toList!4015 thiss!180)) ((_ is Nil!9147) (t!15364 (toList!4015 thiss!180)))))))

(assert (=> d!76983 (= (isStrictlySorted!381 (toList!4015 thiss!180)) e!284633)))

(declare-fun b!483648 () Bool)

(declare-fun e!284634 () Bool)

(assert (=> b!483648 (= e!284633 e!284634)))

(declare-fun res!288187 () Bool)

(assert (=> b!483648 (=> (not res!288187) (not e!284634))))

(assert (=> b!483648 (= res!288187 (bvslt (_1!4553 (h!10002 (toList!4015 thiss!180))) (_1!4553 (h!10002 (t!15364 (toList!4015 thiss!180))))))))

(declare-fun b!483649 () Bool)

(assert (=> b!483649 (= e!284634 (isStrictlySorted!381 (t!15364 (toList!4015 thiss!180))))))

(assert (= (and d!76983 (not res!288186)) b!483648))

(assert (= (and b!483648 res!288187) b!483649))

(declare-fun m!464839 () Bool)

(assert (=> b!483649 m!464839))

(assert (=> d!76975 d!76983))

(declare-fun d!76985 () Bool)

(assert (=> d!76985 (= (isEmpty!626 (toList!4015 thiss!180)) ((_ is Nil!9147) (toList!4015 thiss!180)))))

(assert (=> d!76971 d!76985))

(declare-fun b!483650 () Bool)

(declare-fun e!284635 () Bool)

(declare-fun tp!43391 () Bool)

(assert (=> b!483650 (= e!284635 (and tp_is_empty!13873 tp!43391))))

(assert (=> b!483633 (= tp!43384 e!284635)))

(assert (= (and b!483633 ((_ is Cons!9146) (t!15364 (toList!4015 thiss!180)))) b!483650))

(check-sat (not b!483649) (not b!483650) tp_is_empty!13873)
(check-sat)
