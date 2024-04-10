; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43684 () Bool)

(assert start!43684)

(declare-fun res!288185 () Bool)

(declare-fun e!284651 () Bool)

(assert (=> start!43684 (=> (not res!288185) (not e!284651))))

(declare-datatypes ((B!1066 0))(
  ( (B!1067 (val!6985 Int)) )
))
(declare-datatypes ((tuple2!9172 0))(
  ( (tuple2!9173 (_1!4597 (_ BitVec 64)) (_2!4597 B!1066)) )
))
(declare-datatypes ((List!9249 0))(
  ( (Nil!9246) (Cons!9245 (h!10101 tuple2!9172) (t!15471 List!9249)) )
))
(declare-datatypes ((ListLongMap!8085 0))(
  ( (ListLongMap!8086 (toList!4058 List!9249)) )
))
(declare-fun thiss!180 () ListLongMap!8085)

(declare-fun isEmpty!618 (ListLongMap!8085) Bool)

(assert (=> start!43684 (= res!288185 (not (isEmpty!618 thiss!180)))))

(assert (=> start!43684 e!284651))

(declare-fun e!284652 () Bool)

(declare-fun inv!15792 (ListLongMap!8085) Bool)

(assert (=> start!43684 (and (inv!15792 thiss!180) e!284652)))

(declare-fun b!483682 () Bool)

(assert (=> b!483682 (= e!284651 (= (toList!4058 thiss!180) Nil!9246))))

(declare-fun b!483683 () Bool)

(declare-fun tp!43378 () Bool)

(assert (=> b!483683 (= e!284652 tp!43378)))

(assert (= (and start!43684 res!288185) b!483682))

(assert (= start!43684 b!483683))

(declare-fun m!464637 () Bool)

(assert (=> start!43684 m!464637))

(declare-fun m!464639 () Bool)

(assert (=> start!43684 m!464639))

(check-sat (not start!43684) (not b!483683))
(check-sat)
(get-model)

(declare-fun d!76943 () Bool)

(declare-fun isEmpty!620 (List!9249) Bool)

(assert (=> d!76943 (= (isEmpty!618 thiss!180) (isEmpty!620 (toList!4058 thiss!180)))))

(declare-fun bs!15373 () Bool)

(assert (= bs!15373 d!76943))

(declare-fun m!464645 () Bool)

(assert (=> bs!15373 m!464645))

(assert (=> start!43684 d!76943))

(declare-fun d!76949 () Bool)

(declare-fun isStrictlySorted!393 (List!9249) Bool)

(assert (=> d!76949 (= (inv!15792 thiss!180) (isStrictlySorted!393 (toList!4058 thiss!180)))))

(declare-fun bs!15376 () Bool)

(assert (= bs!15376 d!76949))

(declare-fun m!464651 () Bool)

(assert (=> bs!15376 m!464651))

(assert (=> start!43684 d!76949))

(declare-fun b!483694 () Bool)

(declare-fun e!284661 () Bool)

(declare-fun tp_is_empty!13873 () Bool)

(declare-fun tp!43384 () Bool)

(assert (=> b!483694 (= e!284661 (and tp_is_empty!13873 tp!43384))))

(assert (=> b!483683 (= tp!43378 e!284661)))

(get-info :version)

(assert (= (and b!483683 ((_ is Cons!9245) (toList!4058 thiss!180))) b!483694))

(check-sat (not d!76943) (not d!76949) (not b!483694) tp_is_empty!13873)
(check-sat)
(get-model)

(declare-fun d!76955 () Bool)

(assert (=> d!76955 (= (isEmpty!620 (toList!4058 thiss!180)) ((_ is Nil!9246) (toList!4058 thiss!180)))))

(assert (=> d!76943 d!76955))

(declare-fun d!76957 () Bool)

(declare-fun res!288193 () Bool)

(declare-fun e!284672 () Bool)

(assert (=> d!76957 (=> res!288193 e!284672)))

(assert (=> d!76957 (= res!288193 (or ((_ is Nil!9246) (toList!4058 thiss!180)) ((_ is Nil!9246) (t!15471 (toList!4058 thiss!180)))))))

(assert (=> d!76957 (= (isStrictlySorted!393 (toList!4058 thiss!180)) e!284672)))

(declare-fun b!483709 () Bool)

(declare-fun e!284673 () Bool)

(assert (=> b!483709 (= e!284672 e!284673)))

(declare-fun res!288194 () Bool)

(assert (=> b!483709 (=> (not res!288194) (not e!284673))))

(assert (=> b!483709 (= res!288194 (bvslt (_1!4597 (h!10101 (toList!4058 thiss!180))) (_1!4597 (h!10101 (t!15471 (toList!4058 thiss!180))))))))

(declare-fun b!483710 () Bool)

(assert (=> b!483710 (= e!284673 (isStrictlySorted!393 (t!15471 (toList!4058 thiss!180))))))

(assert (= (and d!76957 (not res!288193)) b!483709))

(assert (= (and b!483709 res!288194) b!483710))

(declare-fun m!464657 () Bool)

(assert (=> b!483710 m!464657))

(assert (=> d!76949 d!76957))

(declare-fun b!483711 () Bool)

(declare-fun e!284674 () Bool)

(declare-fun tp!43391 () Bool)

(assert (=> b!483711 (= e!284674 (and tp_is_empty!13873 tp!43391))))

(assert (=> b!483694 (= tp!43384 e!284674)))

(assert (= (and b!483694 ((_ is Cons!9245) (t!15471 (toList!4058 thiss!180)))) b!483711))

(check-sat (not b!483710) (not b!483711) tp_is_empty!13873)
(check-sat)
