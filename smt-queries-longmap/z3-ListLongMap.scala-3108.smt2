; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43712 () Bool)

(assert start!43712)

(declare-fun res!288212 () Bool)

(declare-fun e!284699 () Bool)

(assert (=> start!43712 (=> (not res!288212) (not e!284699))))

(declare-datatypes ((B!1072 0))(
  ( (B!1073 (val!6988 Int)) )
))
(declare-datatypes ((tuple2!9178 0))(
  ( (tuple2!9179 (_1!4600 (_ BitVec 64)) (_2!4600 B!1072)) )
))
(declare-datatypes ((List!9252 0))(
  ( (Nil!9249) (Cons!9248 (h!10104 tuple2!9178) (t!15474 List!9252)) )
))
(declare-datatypes ((ListLongMap!8091 0))(
  ( (ListLongMap!8092 (toList!4061 List!9252)) )
))
(declare-fun thiss!180 () ListLongMap!8091)

(declare-fun isEmpty!624 (ListLongMap!8091) Bool)

(assert (=> start!43712 (= res!288212 (not (isEmpty!624 thiss!180)))))

(assert (=> start!43712 e!284699))

(declare-fun e!284700 () Bool)

(declare-fun inv!15800 (ListLongMap!8091) Bool)

(assert (=> start!43712 (and (inv!15800 thiss!180) e!284700)))

(declare-fun b!483736 () Bool)

(declare-fun tail!132 (List!9252) List!9252)

(assert (=> b!483736 (= e!284699 (not (inv!15800 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180))))))))

(declare-fun b!483737 () Bool)

(declare-fun tp!43399 () Bool)

(assert (=> b!483737 (= e!284700 tp!43399)))

(assert (= (and start!43712 res!288212) b!483736))

(assert (= start!43712 b!483737))

(declare-fun m!464669 () Bool)

(assert (=> start!43712 m!464669))

(declare-fun m!464671 () Bool)

(assert (=> start!43712 m!464671))

(declare-fun m!464673 () Bool)

(assert (=> b!483736 m!464673))

(declare-fun m!464675 () Bool)

(assert (=> b!483736 m!464675))

(check-sat (not b!483736) (not start!43712) (not b!483737))
(check-sat)
(get-model)

(declare-fun d!76971 () Bool)

(declare-fun isStrictlySorted!398 (List!9252) Bool)

(assert (=> d!76971 (= (inv!15800 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180)))) (isStrictlySorted!398 (toList!4061 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180))))))))

(declare-fun bs!15384 () Bool)

(assert (= bs!15384 d!76971))

(declare-fun m!464689 () Bool)

(assert (=> bs!15384 m!464689))

(assert (=> b!483736 d!76971))

(declare-fun d!76979 () Bool)

(assert (=> d!76979 (= (tail!132 (toList!4061 thiss!180)) (t!15474 (toList!4061 thiss!180)))))

(assert (=> b!483736 d!76979))

(declare-fun d!76985 () Bool)

(declare-fun isEmpty!627 (List!9252) Bool)

(assert (=> d!76985 (= (isEmpty!624 thiss!180) (isEmpty!627 (toList!4061 thiss!180)))))

(declare-fun bs!15389 () Bool)

(assert (= bs!15389 d!76985))

(declare-fun m!464699 () Bool)

(assert (=> bs!15389 m!464699))

(assert (=> start!43712 d!76985))

(declare-fun d!76989 () Bool)

(assert (=> d!76989 (= (inv!15800 thiss!180) (isStrictlySorted!398 (toList!4061 thiss!180)))))

(declare-fun bs!15390 () Bool)

(assert (= bs!15390 d!76989))

(declare-fun m!464701 () Bool)

(assert (=> bs!15390 m!464701))

(assert (=> start!43712 d!76989))

(declare-fun b!483758 () Bool)

(declare-fun e!284715 () Bool)

(declare-fun tp_is_empty!13883 () Bool)

(declare-fun tp!43411 () Bool)

(assert (=> b!483758 (= e!284715 (and tp_is_empty!13883 tp!43411))))

(assert (=> b!483737 (= tp!43399 e!284715)))

(get-info :version)

(assert (= (and b!483737 ((_ is Cons!9248) (toList!4061 thiss!180))) b!483758))

(check-sat tp_is_empty!13883 (not d!76971) (not d!76989) (not d!76985) (not b!483758))
(check-sat)
(get-model)

(declare-fun d!76993 () Bool)

(declare-fun res!288228 () Bool)

(declare-fun e!284729 () Bool)

(assert (=> d!76993 (=> res!288228 e!284729)))

(assert (=> d!76993 (= res!288228 (or ((_ is Nil!9249) (toList!4061 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180))))) ((_ is Nil!9249) (t!15474 (toList!4061 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180))))))))))

(assert (=> d!76993 (= (isStrictlySorted!398 (toList!4061 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180))))) e!284729)))

(declare-fun b!483772 () Bool)

(declare-fun e!284730 () Bool)

(assert (=> b!483772 (= e!284729 e!284730)))

(declare-fun res!288229 () Bool)

(assert (=> b!483772 (=> (not res!288229) (not e!284730))))

(assert (=> b!483772 (= res!288229 (bvslt (_1!4600 (h!10104 (toList!4061 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180)))))) (_1!4600 (h!10104 (t!15474 (toList!4061 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180)))))))))))

(declare-fun b!483773 () Bool)

(assert (=> b!483773 (= e!284730 (isStrictlySorted!398 (t!15474 (toList!4061 (ListLongMap!8092 (tail!132 (toList!4061 thiss!180)))))))))

(assert (= (and d!76993 (not res!288228)) b!483772))

(assert (= (and b!483772 res!288229) b!483773))

(declare-fun m!464707 () Bool)

(assert (=> b!483773 m!464707))

(assert (=> d!76971 d!76993))

(declare-fun d!76999 () Bool)

(assert (=> d!76999 (= (isEmpty!627 (toList!4061 thiss!180)) ((_ is Nil!9249) (toList!4061 thiss!180)))))

(assert (=> d!76985 d!76999))

(declare-fun d!77001 () Bool)

(declare-fun res!288230 () Bool)

(declare-fun e!284731 () Bool)

(assert (=> d!77001 (=> res!288230 e!284731)))

(assert (=> d!77001 (= res!288230 (or ((_ is Nil!9249) (toList!4061 thiss!180)) ((_ is Nil!9249) (t!15474 (toList!4061 thiss!180)))))))

(assert (=> d!77001 (= (isStrictlySorted!398 (toList!4061 thiss!180)) e!284731)))

(declare-fun b!483774 () Bool)

(declare-fun e!284732 () Bool)

(assert (=> b!483774 (= e!284731 e!284732)))

(declare-fun res!288231 () Bool)

(assert (=> b!483774 (=> (not res!288231) (not e!284732))))

(assert (=> b!483774 (= res!288231 (bvslt (_1!4600 (h!10104 (toList!4061 thiss!180))) (_1!4600 (h!10104 (t!15474 (toList!4061 thiss!180))))))))

(declare-fun b!483775 () Bool)

(assert (=> b!483775 (= e!284732 (isStrictlySorted!398 (t!15474 (toList!4061 thiss!180))))))

(assert (= (and d!77001 (not res!288230)) b!483774))

(assert (= (and b!483774 res!288231) b!483775))

(declare-fun m!464709 () Bool)

(assert (=> b!483775 m!464709))

(assert (=> d!76989 d!77001))

(declare-fun b!483776 () Bool)

(declare-fun e!284733 () Bool)

(declare-fun tp!43413 () Bool)

(assert (=> b!483776 (= e!284733 (and tp_is_empty!13883 tp!43413))))

(assert (=> b!483758 (= tp!43411 e!284733)))

(assert (= (and b!483758 ((_ is Cons!9248) (t!15474 (toList!4061 thiss!180)))) b!483776))

(check-sat (not b!483773) (not b!483775) (not b!483776) tp_is_empty!13883)
