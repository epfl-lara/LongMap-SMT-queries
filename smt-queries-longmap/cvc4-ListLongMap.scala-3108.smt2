; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43714 () Bool)

(assert start!43714)

(declare-fun res!288215 () Bool)

(declare-fun e!284705 () Bool)

(assert (=> start!43714 (=> (not res!288215) (not e!284705))))

(declare-datatypes ((B!1074 0))(
  ( (B!1075 (val!6989 Int)) )
))
(declare-datatypes ((tuple2!9180 0))(
  ( (tuple2!9181 (_1!4601 (_ BitVec 64)) (_2!4601 B!1074)) )
))
(declare-datatypes ((List!9253 0))(
  ( (Nil!9250) (Cons!9249 (h!10105 tuple2!9180) (t!15475 List!9253)) )
))
(declare-datatypes ((ListLongMap!8093 0))(
  ( (ListLongMap!8094 (toList!4062 List!9253)) )
))
(declare-fun thiss!180 () ListLongMap!8093)

(declare-fun isEmpty!625 (ListLongMap!8093) Bool)

(assert (=> start!43714 (= res!288215 (not (isEmpty!625 thiss!180)))))

(assert (=> start!43714 e!284705))

(declare-fun e!284706 () Bool)

(declare-fun inv!15801 (ListLongMap!8093) Bool)

(assert (=> start!43714 (and (inv!15801 thiss!180) e!284706)))

(declare-fun b!483742 () Bool)

(declare-fun tail!133 (List!9253) List!9253)

(assert (=> b!483742 (= e!284705 (not (inv!15801 (ListLongMap!8094 (tail!133 (toList!4062 thiss!180))))))))

(declare-fun b!483743 () Bool)

(declare-fun tp!43402 () Bool)

(assert (=> b!483743 (= e!284706 tp!43402)))

(assert (= (and start!43714 res!288215) b!483742))

(assert (= start!43714 b!483743))

(declare-fun m!464677 () Bool)

(assert (=> start!43714 m!464677))

(declare-fun m!464679 () Bool)

(assert (=> start!43714 m!464679))

(declare-fun m!464681 () Bool)

(assert (=> b!483742 m!464681))

(declare-fun m!464683 () Bool)

(assert (=> b!483742 m!464683))

(push 1)

(assert (not b!483742))

(assert (not start!43714))

(assert (not b!483743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76968 () Bool)

(declare-fun isStrictlySorted!396 (List!9253) Bool)

(assert (=> d!76968 (= (inv!15801 (ListLongMap!8094 (tail!133 (toList!4062 thiss!180)))) (isStrictlySorted!396 (toList!4062 (ListLongMap!8094 (tail!133 (toList!4062 thiss!180))))))))

(declare-fun bs!15383 () Bool)

(assert (= bs!15383 d!76968))

(declare-fun m!464687 () Bool)

(assert (=> bs!15383 m!464687))

(assert (=> b!483742 d!76968))

(declare-fun d!76975 () Bool)

(assert (=> d!76975 (= (tail!133 (toList!4062 thiss!180)) (t!15475 (toList!4062 thiss!180)))))

(assert (=> b!483742 d!76975))

(declare-fun d!76977 () Bool)

(declare-fun isEmpty!628 (List!9253) Bool)

(assert (=> d!76977 (= (isEmpty!625 thiss!180) (isEmpty!628 (toList!4062 thiss!180)))))

(declare-fun bs!15387 () Bool)

(assert (= bs!15387 d!76977))

(declare-fun m!464695 () Bool)

(assert (=> bs!15387 m!464695))

(assert (=> start!43714 d!76977))

(declare-fun d!76987 () Bool)

(assert (=> d!76987 (= (inv!15801 thiss!180) (isStrictlySorted!396 (toList!4062 thiss!180)))))

(declare-fun bs!15388 () Bool)

(assert (= bs!15388 d!76987))

(declare-fun m!464697 () Bool)

(assert (=> bs!15388 m!464697))

(assert (=> start!43714 d!76987))

(declare-fun b!483752 () Bool)

(declare-fun e!284711 () Bool)

(declare-fun tp_is_empty!13879 () Bool)

(declare-fun tp!43407 () Bool)

(assert (=> b!483752 (= e!284711 (and tp_is_empty!13879 tp!43407))))

(assert (=> b!483743 (= tp!43402 e!284711)))

(assert (= (and b!483743 (is-Cons!9249 (toList!4062 thiss!180))) b!483752))

(push 1)

(assert tp_is_empty!13879)

(assert (not b!483752))

(assert (not d!76977))

(assert (not d!76987))

(assert (not d!76968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77003 () Bool)

(assert (=> d!77003 (= (isEmpty!628 (toList!4062 thiss!180)) (is-Nil!9250 (toList!4062 thiss!180)))))

(assert (=> d!76977 d!77003))

(declare-fun d!77005 () Bool)

(declare-fun res!288236 () Bool)

(declare-fun e!284738 () Bool)

(assert (=> d!77005 (=> res!288236 e!284738)))

(assert (=> d!77005 (= res!288236 (or (is-Nil!9250 (toList!4062 thiss!180)) (is-Nil!9250 (t!15475 (toList!4062 thiss!180)))))))

(assert (=> d!77005 (= (isStrictlySorted!396 (toList!4062 thiss!180)) e!284738)))

(declare-fun b!483781 () Bool)

(declare-fun e!284739 () Bool)

(assert (=> b!483781 (= e!284738 e!284739)))

(declare-fun res!288237 () Bool)

(assert (=> b!483781 (=> (not res!288237) (not e!284739))))

(assert (=> b!483781 (= res!288237 (bvslt (_1!4601 (h!10105 (toList!4062 thiss!180))) (_1!4601 (h!10105 (t!15475 (toList!4062 thiss!180))))))))

(declare-fun b!483782 () Bool)

(assert (=> b!483782 (= e!284739 (isStrictlySorted!396 (t!15475 (toList!4062 thiss!180))))))

(assert (= (and d!77005 (not res!288236)) b!483781))

