; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43698 () Bool)

(assert start!43698)

(declare-fun res!288202 () Bool)

(declare-fun e!284654 () Bool)

(assert (=> start!43698 (=> (not res!288202) (not e!284654))))

(declare-datatypes ((B!1070 0))(
  ( (B!1071 (val!6987 Int)) )
))
(declare-datatypes ((tuple2!9090 0))(
  ( (tuple2!9091 (_1!4556 (_ BitVec 64)) (_2!4556 B!1070)) )
))
(declare-datatypes ((List!9153 0))(
  ( (Nil!9150) (Cons!9149 (h!10005 tuple2!9090) (t!15367 List!9153)) )
))
(declare-datatypes ((ListLongMap!8005 0))(
  ( (ListLongMap!8006 (toList!4018 List!9153)) )
))
(declare-fun thiss!180 () ListLongMap!8005)

(declare-fun isEmpty!629 (ListLongMap!8005) Bool)

(assert (=> start!43698 (= res!288202 (not (isEmpty!629 thiss!180)))))

(assert (=> start!43698 e!284654))

(declare-fun e!284655 () Bool)

(declare-fun inv!15799 (ListLongMap!8005) Bool)

(assert (=> start!43698 (and (inv!15799 thiss!180) e!284655)))

(declare-fun b!483669 () Bool)

(declare-fun tail!131 (List!9153) List!9153)

(assert (=> b!483669 (= e!284654 (not (inv!15799 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180))))))))

(declare-fun b!483670 () Bool)

(declare-fun tp!43396 () Bool)

(assert (=> b!483670 (= e!284655 tp!43396)))

(assert (= (and start!43698 res!288202) b!483669))

(assert (= start!43698 b!483670))

(declare-fun m!464845 () Bool)

(assert (=> start!43698 m!464845))

(declare-fun m!464847 () Bool)

(assert (=> start!43698 m!464847))

(declare-fun m!464849 () Bool)

(assert (=> b!483669 m!464849))

(declare-fun m!464851 () Bool)

(assert (=> b!483669 m!464851))

(check-sat (not b!483669) (not start!43698) (not b!483670))
(check-sat)
(get-model)

(declare-fun d!77001 () Bool)

(declare-fun isStrictlySorted!384 (List!9153) Bool)

(assert (=> d!77001 (= (inv!15799 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180)))) (isStrictlySorted!384 (toList!4018 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180))))))))

(declare-fun bs!15400 () Bool)

(assert (= bs!15400 d!77001))

(declare-fun m!464873 () Bool)

(assert (=> bs!15400 m!464873))

(assert (=> b!483669 d!77001))

(declare-fun d!77007 () Bool)

(assert (=> d!77007 (= (tail!131 (toList!4018 thiss!180)) (t!15367 (toList!4018 thiss!180)))))

(assert (=> b!483669 d!77007))

(declare-fun d!77011 () Bool)

(declare-fun isEmpty!634 (List!9153) Bool)

(assert (=> d!77011 (= (isEmpty!629 thiss!180) (isEmpty!634 (toList!4018 thiss!180)))))

(declare-fun bs!15405 () Bool)

(assert (= bs!15405 d!77011))

(declare-fun m!464883 () Bool)

(assert (=> bs!15405 m!464883))

(assert (=> start!43698 d!77011))

(declare-fun d!77019 () Bool)

(assert (=> d!77019 (= (inv!15799 thiss!180) (isStrictlySorted!384 (toList!4018 thiss!180)))))

(declare-fun bs!15406 () Bool)

(assert (= bs!15406 d!77019))

(declare-fun m!464885 () Bool)

(assert (=> bs!15406 m!464885))

(assert (=> start!43698 d!77019))

(declare-fun b!483697 () Bool)

(declare-fun e!284676 () Bool)

(declare-fun tp_is_empty!13883 () Bool)

(declare-fun tp!43411 () Bool)

(assert (=> b!483697 (= e!284676 (and tp_is_empty!13883 tp!43411))))

(assert (=> b!483670 (= tp!43396 e!284676)))

(get-info :version)

(assert (= (and b!483670 ((_ is Cons!9149) (toList!4018 thiss!180))) b!483697))

(check-sat (not b!483697) (not d!77001) tp_is_empty!13883 (not d!77019) (not d!77011))
(check-sat)
(get-model)

(declare-fun d!77021 () Bool)

(declare-fun res!288213 () Bool)

(declare-fun e!284681 () Bool)

(assert (=> d!77021 (=> res!288213 e!284681)))

(assert (=> d!77021 (= res!288213 (or ((_ is Nil!9150) (toList!4018 thiss!180)) ((_ is Nil!9150) (t!15367 (toList!4018 thiss!180)))))))

(assert (=> d!77021 (= (isStrictlySorted!384 (toList!4018 thiss!180)) e!284681)))

(declare-fun b!483702 () Bool)

(declare-fun e!284682 () Bool)

(assert (=> b!483702 (= e!284681 e!284682)))

(declare-fun res!288214 () Bool)

(assert (=> b!483702 (=> (not res!288214) (not e!284682))))

(assert (=> b!483702 (= res!288214 (bvslt (_1!4556 (h!10005 (toList!4018 thiss!180))) (_1!4556 (h!10005 (t!15367 (toList!4018 thiss!180))))))))

(declare-fun b!483703 () Bool)

(assert (=> b!483703 (= e!284682 (isStrictlySorted!384 (t!15367 (toList!4018 thiss!180))))))

(assert (= (and d!77021 (not res!288213)) b!483702))

(assert (= (and b!483702 res!288214) b!483703))

(declare-fun m!464887 () Bool)

(assert (=> b!483703 m!464887))

(assert (=> d!77019 d!77021))

(declare-fun d!77025 () Bool)

(declare-fun res!288217 () Bool)

(declare-fun e!284685 () Bool)

(assert (=> d!77025 (=> res!288217 e!284685)))

(assert (=> d!77025 (= res!288217 (or ((_ is Nil!9150) (toList!4018 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180))))) ((_ is Nil!9150) (t!15367 (toList!4018 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180))))))))))

(assert (=> d!77025 (= (isStrictlySorted!384 (toList!4018 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180))))) e!284685)))

(declare-fun b!483704 () Bool)

(declare-fun e!284686 () Bool)

(assert (=> b!483704 (= e!284685 e!284686)))

(declare-fun res!288218 () Bool)

(assert (=> b!483704 (=> (not res!288218) (not e!284686))))

(assert (=> b!483704 (= res!288218 (bvslt (_1!4556 (h!10005 (toList!4018 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180)))))) (_1!4556 (h!10005 (t!15367 (toList!4018 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180)))))))))))

(declare-fun b!483705 () Bool)

(assert (=> b!483705 (= e!284686 (isStrictlySorted!384 (t!15367 (toList!4018 (ListLongMap!8006 (tail!131 (toList!4018 thiss!180)))))))))

(assert (= (and d!77025 (not res!288217)) b!483704))

(assert (= (and b!483704 res!288218) b!483705))

(declare-fun m!464889 () Bool)

(assert (=> b!483705 m!464889))

(assert (=> d!77001 d!77025))

(declare-fun d!77027 () Bool)

(assert (=> d!77027 (= (isEmpty!634 (toList!4018 thiss!180)) ((_ is Nil!9150) (toList!4018 thiss!180)))))

(assert (=> d!77011 d!77027))

(declare-fun b!483710 () Bool)

(declare-fun e!284689 () Bool)

(declare-fun tp!43412 () Bool)

(assert (=> b!483710 (= e!284689 (and tp_is_empty!13883 tp!43412))))

(assert (=> b!483697 (= tp!43411 e!284689)))

(assert (= (and b!483697 ((_ is Cons!9149) (t!15367 (toList!4018 thiss!180)))) b!483710))

(check-sat (not b!483703) (not b!483705) (not b!483710) tp_is_empty!13883)
(check-sat)
