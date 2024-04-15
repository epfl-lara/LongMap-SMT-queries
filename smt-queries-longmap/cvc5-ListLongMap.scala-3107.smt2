; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43672 () Bool)

(assert start!43672)

(declare-fun res!288059 () Bool)

(declare-fun e!284483 () Bool)

(assert (=> start!43672 (=> (not res!288059) (not e!284483))))

(declare-datatypes ((B!1068 0))(
  ( (B!1069 (val!6986 Int)) )
))
(declare-datatypes ((tuple2!9224 0))(
  ( (tuple2!9225 (_1!4623 (_ BitVec 64)) (_2!4623 B!1068)) )
))
(declare-datatypes ((List!9288 0))(
  ( (Nil!9285) (Cons!9284 (h!10140 tuple2!9224) (t!15501 List!9288)) )
))
(declare-datatypes ((ListLongMap!8127 0))(
  ( (ListLongMap!8128 (toList!4079 List!9288)) )
))
(declare-fun thiss!180 () ListLongMap!8127)

(declare-fun isEmpty!624 (ListLongMap!8127) Bool)

(assert (=> start!43672 (= res!288059 (not (isEmpty!624 thiss!180)))))

(assert (=> start!43672 e!284483))

(declare-fun e!284484 () Bool)

(declare-fun inv!15793 (ListLongMap!8127) Bool)

(assert (=> start!43672 (and (inv!15793 thiss!180) e!284484)))

(declare-fun b!483417 () Bool)

(assert (=> b!483417 (= e!284483 (= (toList!4079 thiss!180) Nil!9285))))

(declare-fun b!483418 () Bool)

(declare-fun tp!43381 () Bool)

(assert (=> b!483418 (= e!284484 tp!43381)))

(assert (= (and start!43672 res!288059) b!483417))

(assert (= start!43672 b!483418))

(declare-fun m!463907 () Bool)

(assert (=> start!43672 m!463907))

(declare-fun m!463909 () Bool)

(assert (=> start!43672 m!463909))

(push 1)

(assert (not start!43672))

(assert (not b!483418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76743 () Bool)

(declare-fun isEmpty!625 (List!9288) Bool)

(assert (=> d!76743 (= (isEmpty!624 thiss!180) (isEmpty!625 (toList!4079 thiss!180)))))

(declare-fun bs!15345 () Bool)

(assert (= bs!15345 d!76743))

(declare-fun m!463915 () Bool)

(assert (=> bs!15345 m!463915))

(assert (=> start!43672 d!76743))

(declare-fun d!76749 () Bool)

(declare-fun isStrictlySorted!389 (List!9288) Bool)

(assert (=> d!76749 (= (inv!15793 thiss!180) (isStrictlySorted!389 (toList!4079 thiss!180)))))

(declare-fun bs!15347 () Bool)

(assert (= bs!15347 d!76749))

(declare-fun m!463919 () Bool)

(assert (=> bs!15347 m!463919))

(assert (=> start!43672 d!76749))

(declare-fun b!483428 () Bool)

(declare-fun e!284490 () Bool)

(declare-fun tp_is_empty!13875 () Bool)

(declare-fun tp!43387 () Bool)

(assert (=> b!483428 (= e!284490 (and tp_is_empty!13875 tp!43387))))

(assert (=> b!483418 (= tp!43381 e!284490)))

(assert (= (and b!483418 (is-Cons!9284 (toList!4079 thiss!180))) b!483428))

(push 1)

(assert (not d!76743))

(assert (not d!76749))

(assert (not b!483428))

(assert tp_is_empty!13875)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76751 () Bool)

(assert (=> d!76751 (= (isEmpty!625 (toList!4079 thiss!180)) (is-Nil!9285 (toList!4079 thiss!180)))))

(assert (=> d!76743 d!76751))

(declare-fun d!76753 () Bool)

(declare-fun res!288068 () Bool)

(declare-fun e!284502 () Bool)

(assert (=> d!76753 (=> res!288068 e!284502)))

(assert (=> d!76753 (= res!288068 (or (is-Nil!9285 (toList!4079 thiss!180)) (is-Nil!9285 (t!15501 (toList!4079 thiss!180)))))))

(assert (=> d!76753 (= (isStrictlySorted!389 (toList!4079 thiss!180)) e!284502)))

(declare-fun b!483442 () Bool)

(declare-fun e!284503 () Bool)

(assert (=> b!483442 (= e!284502 e!284503)))

(declare-fun res!288069 () Bool)

(assert (=> b!483442 (=> (not res!288069) (not e!284503))))

(assert (=> b!483442 (= res!288069 (bvslt (_1!4623 (h!10140 (toList!4079 thiss!180))) (_1!4623 (h!10140 (t!15501 (toList!4079 thiss!180))))))))

(declare-fun b!483443 () Bool)

(assert (=> b!483443 (= e!284503 (isStrictlySorted!389 (t!15501 (toList!4079 thiss!180))))))

(assert (= (and d!76753 (not res!288068)) b!483442))

(assert (= (and b!483442 res!288069) b!483443))

(declare-fun m!463923 () Bool)

(assert (=> b!483443 m!463923))

(assert (=> d!76749 d!76753))

(declare-fun b!483444 () Bool)

(declare-fun e!284504 () Bool)

(declare-fun tp!43391 () Bool)

(assert (=> b!483444 (= e!284504 (and tp_is_empty!13875 tp!43391))))

(assert (=> b!483428 (= tp!43387 e!284504)))

(assert (= (and b!483428 (is-Cons!9284 (t!15501 (toList!4079 thiss!180)))) b!483444))

(push 1)

(assert (not b!483443))

(assert (not b!483444))

(assert tp_is_empty!13875)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

