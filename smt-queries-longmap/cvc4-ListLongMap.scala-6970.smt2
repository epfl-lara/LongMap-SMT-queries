; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88090 () Bool)

(assert start!88090)

(declare-fun b!1016328 () Bool)

(assert (=> b!1016328 true))

(assert (=> b!1016328 true))

(declare-fun b!1016324 () Bool)

(declare-fun e!571722 () Bool)

(declare-fun tp_is_empty!23597 () Bool)

(declare-fun tp!70760 () Bool)

(assert (=> b!1016324 (= e!571722 (and tp_is_empty!23597 tp!70760))))

(declare-fun b!1016325 () Bool)

(declare-fun res!681708 () Bool)

(declare-fun e!571723 () Bool)

(assert (=> b!1016325 (=> (not res!681708) (not e!571723))))

(declare-datatypes ((B!1530 0))(
  ( (B!1531 (val!11849 Int)) )
))
(declare-datatypes ((tuple2!15244 0))(
  ( (tuple2!15245 (_1!7633 (_ BitVec 64)) (_2!7633 B!1530)) )
))
(declare-datatypes ((List!21521 0))(
  ( (Nil!21518) (Cons!21517 (h!22715 tuple2!15244) (t!30522 List!21521)) )
))
(declare-fun l!1114 () List!21521)

(declare-fun isEmpty!879 (List!21521) Bool)

(assert (=> b!1016325 (= res!681708 (not (isEmpty!879 l!1114)))))

(declare-fun b!1016326 () Bool)

(declare-datatypes ((List!21522 0))(
  ( (Nil!21519) (Cons!21518 (h!22716 (_ BitVec 64)) (t!30523 List!21522)) )
))
(declare-fun keys!40 () List!21522)

(declare-datatypes ((Option!602 0))(
  ( (Some!601 (v!14452 B!1530)) (None!600) )
))
(declare-fun isDefined!400 (Option!602) Bool)

(declare-fun getValueByKey!551 (List!21521 (_ BitVec 64)) Option!602)

(assert (=> b!1016326 (= e!571723 (not (isDefined!400 (getValueByKey!551 l!1114 (h!22716 keys!40)))))))

(declare-fun b!1016327 () Bool)

(declare-fun res!681707 () Bool)

(assert (=> b!1016327 (=> (not res!681707) (not e!571723))))

(declare-fun newHead!31 () tuple2!15244)

(declare-fun head!966 (List!21521) tuple2!15244)

(assert (=> b!1016327 (= res!681707 (bvslt (_1!7633 newHead!31) (_1!7633 (head!966 l!1114))))))

(declare-fun res!681704 () Bool)

(assert (=> b!1016328 (=> (not res!681704) (not e!571723))))

(declare-fun lambda!1016 () Int)

(declare-fun forall!279 (List!21522 Int) Bool)

(assert (=> b!1016328 (= res!681704 (forall!279 keys!40 lambda!1016))))

(declare-fun res!681706 () Bool)

(assert (=> start!88090 (=> (not res!681706) (not e!571723))))

(declare-fun isStrictlySorted!617 (List!21521) Bool)

(assert (=> start!88090 (= res!681706 (isStrictlySorted!617 l!1114))))

(assert (=> start!88090 e!571723))

(assert (=> start!88090 e!571722))

(assert (=> start!88090 true))

(assert (=> start!88090 tp_is_empty!23597))

(declare-fun b!1016329 () Bool)

(declare-fun res!681705 () Bool)

(assert (=> b!1016329 (=> (not res!681705) (not e!571723))))

(assert (=> b!1016329 (= res!681705 (is-Cons!21518 keys!40))))

(assert (= (and start!88090 res!681706) b!1016325))

(assert (= (and b!1016325 res!681708) b!1016328))

(assert (= (and b!1016328 res!681704) b!1016327))

(assert (= (and b!1016327 res!681707) b!1016329))

(assert (= (and b!1016329 res!681705) b!1016326))

(assert (= (and start!88090 (is-Cons!21517 l!1114)) b!1016324))

(declare-fun m!938039 () Bool)

(assert (=> b!1016328 m!938039))

(declare-fun m!938041 () Bool)

(assert (=> b!1016327 m!938041))

(declare-fun m!938043 () Bool)

(assert (=> start!88090 m!938043))

(declare-fun m!938045 () Bool)

(assert (=> b!1016326 m!938045))

(assert (=> b!1016326 m!938045))

(declare-fun m!938047 () Bool)

(assert (=> b!1016326 m!938047))

(declare-fun m!938049 () Bool)

(assert (=> b!1016325 m!938049))

(push 1)

(assert (not b!1016325))

(assert (not b!1016324))

(assert (not b!1016327))

(assert (not start!88090))

(assert (not b!1016328))

(assert (not b!1016326))

(assert tp_is_empty!23597)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121201 () Bool)

(declare-fun res!681729 () Bool)

(declare-fun e!571758 () Bool)

(assert (=> d!121201 (=> res!681729 e!571758)))

(assert (=> d!121201 (= res!681729 (or (is-Nil!21518 l!1114) (is-Nil!21518 (t!30522 l!1114))))))

(assert (=> d!121201 (= (isStrictlySorted!617 l!1114) e!571758)))

(declare-fun b!1016382 () Bool)

(declare-fun e!571759 () Bool)

(assert (=> b!1016382 (= e!571758 e!571759)))

(declare-fun res!681730 () Bool)

(assert (=> b!1016382 (=> (not res!681730) (not e!571759))))

(assert (=> b!1016382 (= res!681730 (bvslt (_1!7633 (h!22715 l!1114)) (_1!7633 (h!22715 (t!30522 l!1114)))))))

(declare-fun b!1016383 () Bool)

(assert (=> b!1016383 (= e!571759 (isStrictlySorted!617 (t!30522 l!1114)))))

(assert (= (and d!121201 (not res!681729)) b!1016382))

(assert (= (and b!1016382 res!681730) b!1016383))

(declare-fun m!938065 () Bool)

(assert (=> b!1016383 m!938065))

(assert (=> start!88090 d!121201))

(declare-fun d!121207 () Bool)

(assert (=> d!121207 (= (isEmpty!879 l!1114) (is-Nil!21518 l!1114))))

(assert (=> b!1016325 d!121207))

(declare-fun d!121211 () Bool)

(declare-fun isEmpty!882 (Option!602) Bool)

(assert (=> d!121211 (= (isDefined!400 (getValueByKey!551 l!1114 (h!22716 keys!40))) (not (isEmpty!882 (getValueByKey!551 l!1114 (h!22716 keys!40)))))))

(declare-fun bs!29513 () Bool)

(assert (= bs!29513 d!121211))

(assert (=> bs!29513 m!938045))

(declare-fun m!938069 () Bool)

(assert (=> bs!29513 m!938069))

(assert (=> b!1016326 d!121211))

(declare-fun d!121215 () Bool)

(declare-fun c!102935 () Bool)

(assert (=> d!121215 (= c!102935 (and (is-Cons!21517 l!1114) (= (_1!7633 (h!22715 l!1114)) (h!22716 keys!40))))))

(declare-fun e!571771 () Option!602)

(assert (=> d!121215 (= (getValueByKey!551 l!1114 (h!22716 keys!40)) e!571771)))

(declare-fun b!1016399 () Bool)

(assert (=> b!1016399 (= e!571771 (Some!601 (_2!7633 (h!22715 l!1114))))))

(declare-fun b!1016400 () Bool)

(declare-fun e!571772 () Option!602)

(assert (=> b!1016400 (= e!571771 e!571772)))

(declare-fun c!102936 () Bool)

(assert (=> b!1016400 (= c!102936 (and (is-Cons!21517 l!1114) (not (= (_1!7633 (h!22715 l!1114)) (h!22716 keys!40)))))))

(declare-fun b!1016401 () Bool)

(assert (=> b!1016401 (= e!571772 (getValueByKey!551 (t!30522 l!1114) (h!22716 keys!40)))))

(declare-fun b!1016402 () Bool)

(assert (=> b!1016402 (= e!571772 None!600)))

(assert (= (and d!121215 c!102935) b!1016399))

(assert (= (and d!121215 (not c!102935)) b!1016400))

(assert (= (and b!1016400 c!102936) b!1016401))

(assert (= (and b!1016400 (not c!102936)) b!1016402))

(declare-fun m!938071 () Bool)

(assert (=> b!1016401 m!938071))

(assert (=> b!1016326 d!121215))

(declare-fun d!121221 () Bool)

(declare-fun res!681743 () Bool)

(declare-fun e!571782 () Bool)

(assert (=> d!121221 (=> res!681743 e!571782)))

(assert (=> d!121221 (= res!681743 (is-Nil!21519 keys!40))))

(assert (=> d!121221 (= (forall!279 keys!40 lambda!1016) e!571782)))

(declare-fun b!1016414 () Bool)

(declare-fun e!571783 () Bool)

(assert (=> b!1016414 (= e!571782 e!571783)))

(declare-fun res!681744 () Bool)

(assert (=> b!1016414 (=> (not res!681744) (not e!571783))))

(declare-fun dynLambda!1914 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016414 (= res!681744 (dynLambda!1914 lambda!1016 (h!22716 keys!40)))))

(declare-fun b!1016415 () Bool)

(assert (=> b!1016415 (= e!571783 (forall!279 (t!30523 keys!40) lambda!1016))))

(assert (= (and d!121221 (not res!681743)) b!1016414))

(assert (= (and b!1016414 res!681744) b!1016415))

(declare-fun b_lambda!15507 () Bool)

(assert (=> (not b_lambda!15507) (not b!1016414)))

(declare-fun m!938077 () Bool)

(assert (=> b!1016414 m!938077))

(declare-fun m!938079 () Bool)

(assert (=> b!1016415 m!938079))

(assert (=> b!1016328 d!121221))

(declare-fun d!121225 () Bool)

(assert (=> d!121225 (= (head!966 l!1114) (h!22715 l!1114))))

(assert (=> b!1016327 d!121225))

(declare-fun b!1016420 () Bool)

(declare-fun e!571786 () Bool)

(declare-fun tp!70769 () Bool)

(assert (=> b!1016420 (= e!571786 (and tp_is_empty!23597 tp!70769))))

(assert (=> b!1016324 (= tp!70760 e!571786)))

(assert (= (and b!1016324 (is-Cons!21517 (t!30522 l!1114))) b!1016420))

(declare-fun b_lambda!15509 () Bool)

(assert (= b_lambda!15507 (or b!1016328 b_lambda!15509)))

(declare-fun bs!29515 () Bool)

(declare-fun d!121227 () Bool)

(assert (= bs!29515 (and d!121227 b!1016328)))

(declare-fun value!178 () B!1530)

(assert (=> bs!29515 (= (dynLambda!1914 lambda!1016 (h!22716 keys!40)) (= (getValueByKey!551 l!1114 (h!22716 keys!40)) (Some!601 value!178)))))

(assert (=> bs!29515 m!938045))

(assert (=> b!1016414 d!121227))

(push 1)

(assert (not b_lambda!15509))

(assert (not b!1016383))

(assert (not b!1016401))

(assert tp_is_empty!23597)

(assert (not d!121211))

(assert (not b!1016420))

(assert (not bs!29515))

(assert (not b!1016415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

