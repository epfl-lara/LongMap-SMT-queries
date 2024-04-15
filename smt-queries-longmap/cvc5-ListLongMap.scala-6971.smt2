; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88136 () Bool)

(assert start!88136)

(declare-fun b!1016372 () Bool)

(assert (=> b!1016372 true))

(assert (=> b!1016372 true))

(declare-fun b!1016367 () Bool)

(declare-fun e!571744 () Bool)

(declare-datatypes ((B!1536 0))(
  ( (B!1537 (val!11852 Int)) )
))
(declare-datatypes ((tuple2!15330 0))(
  ( (tuple2!15331 (_1!7676 (_ BitVec 64)) (_2!7676 B!1536)) )
))
(declare-datatypes ((List!21562 0))(
  ( (Nil!21559) (Cons!21558 (h!22756 tuple2!15330) (t!30554 List!21562)) )
))
(declare-fun lt!449073 () List!21562)

(declare-datatypes ((List!21563 0))(
  ( (Nil!21560) (Cons!21559 (h!22757 (_ BitVec 64)) (t!30555 List!21563)) )
))
(declare-fun keys!40 () List!21563)

(declare-fun containsKey!492 (List!21562 (_ BitVec 64)) Bool)

(assert (=> b!1016367 (= e!571744 (containsKey!492 lt!449073 (h!22757 keys!40)))))

(declare-fun b!1016368 () Bool)

(declare-fun res!681739 () Bool)

(declare-fun e!571746 () Bool)

(assert (=> b!1016368 (=> (not res!681739) (not e!571746))))

(declare-fun newHead!31 () tuple2!15330)

(declare-fun l!1114 () List!21562)

(declare-fun head!968 (List!21562) tuple2!15330)

(assert (=> b!1016368 (= res!681739 (bvslt (_1!7676 newHead!31) (_1!7676 (head!968 l!1114))))))

(declare-fun b!1016369 () Bool)

(declare-fun res!681742 () Bool)

(assert (=> b!1016369 (=> (not res!681742) (not e!571746))))

(assert (=> b!1016369 (= res!681742 (is-Cons!21559 keys!40))))

(declare-fun b!1016370 () Bool)

(assert (=> b!1016370 (= e!571746 (not e!571744))))

(declare-fun res!681740 () Bool)

(assert (=> b!1016370 (=> (not res!681740) (not e!571744))))

(declare-fun isStrictlySorted!616 (List!21562) Bool)

(assert (=> b!1016370 (= res!681740 (isStrictlySorted!616 lt!449073))))

(assert (=> b!1016370 (= lt!449073 (Cons!21558 newHead!31 l!1114))))

(assert (=> b!1016370 (containsKey!492 l!1114 (h!22757 keys!40))))

(declare-datatypes ((Unit!33145 0))(
  ( (Unit!33146) )
))
(declare-fun lt!449074 () Unit!33145)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 (List!21562 (_ BitVec 64)) Unit!33145)

(assert (=> b!1016370 (= lt!449074 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 l!1114 (h!22757 keys!40)))))

(declare-fun b!1016371 () Bool)

(declare-fun e!571745 () Bool)

(declare-fun tp_is_empty!23603 () Bool)

(declare-fun tp!70781 () Bool)

(assert (=> b!1016371 (= e!571745 (and tp_is_empty!23603 tp!70781))))

(declare-fun b!1016373 () Bool)

(declare-fun res!681741 () Bool)

(assert (=> b!1016373 (=> (not res!681741) (not e!571746))))

(declare-fun isEmpty!890 (List!21562) Bool)

(assert (=> b!1016373 (= res!681741 (not (isEmpty!890 l!1114)))))

(declare-fun res!681738 () Bool)

(assert (=> b!1016372 (=> (not res!681738) (not e!571746))))

(declare-fun lambda!1025 () Int)

(declare-fun forall!286 (List!21563 Int) Bool)

(assert (=> b!1016372 (= res!681738 (forall!286 keys!40 lambda!1025))))

(declare-fun res!681743 () Bool)

(assert (=> start!88136 (=> (not res!681743) (not e!571746))))

(assert (=> start!88136 (= res!681743 (isStrictlySorted!616 l!1114))))

(assert (=> start!88136 e!571746))

(assert (=> start!88136 e!571745))

(assert (=> start!88136 true))

(assert (=> start!88136 tp_is_empty!23603))

(assert (= (and start!88136 res!681743) b!1016373))

(assert (= (and b!1016373 res!681741) b!1016372))

(assert (= (and b!1016372 res!681738) b!1016368))

(assert (= (and b!1016368 res!681739) b!1016369))

(assert (= (and b!1016369 res!681742) b!1016370))

(assert (= (and b!1016370 res!681740) b!1016367))

(assert (= (and start!88136 (is-Cons!21558 l!1114)) b!1016371))

(declare-fun m!937521 () Bool)

(assert (=> b!1016367 m!937521))

(declare-fun m!937523 () Bool)

(assert (=> b!1016373 m!937523))

(declare-fun m!937525 () Bool)

(assert (=> start!88136 m!937525))

(declare-fun m!937527 () Bool)

(assert (=> b!1016368 m!937527))

(declare-fun m!937529 () Bool)

(assert (=> b!1016370 m!937529))

(declare-fun m!937531 () Bool)

(assert (=> b!1016370 m!937531))

(declare-fun m!937533 () Bool)

(assert (=> b!1016370 m!937533))

(declare-fun m!937535 () Bool)

(assert (=> b!1016372 m!937535))

(push 1)

(assert (not b!1016367))

(assert (not b!1016370))

(assert (not b!1016368))

(assert (not b!1016372))

(assert tp_is_empty!23603)

(assert (not b!1016371))

(assert (not start!88136))

(assert (not b!1016373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121115 () Bool)

(declare-fun res!681760 () Bool)

(declare-fun e!571763 () Bool)

(assert (=> d!121115 (=> res!681760 e!571763)))

(assert (=> d!121115 (= res!681760 (and (is-Cons!21558 lt!449073) (= (_1!7676 (h!22756 lt!449073)) (h!22757 keys!40))))))

(assert (=> d!121115 (= (containsKey!492 lt!449073 (h!22757 keys!40)) e!571763)))

(declare-fun b!1016394 () Bool)

(declare-fun e!571764 () Bool)

(assert (=> b!1016394 (= e!571763 e!571764)))

(declare-fun res!681761 () Bool)

(assert (=> b!1016394 (=> (not res!681761) (not e!571764))))

(assert (=> b!1016394 (= res!681761 (and (or (not (is-Cons!21558 lt!449073)) (bvsle (_1!7676 (h!22756 lt!449073)) (h!22757 keys!40))) (is-Cons!21558 lt!449073) (bvslt (_1!7676 (h!22756 lt!449073)) (h!22757 keys!40))))))

(declare-fun b!1016395 () Bool)

(assert (=> b!1016395 (= e!571764 (containsKey!492 (t!30554 lt!449073) (h!22757 keys!40)))))

(assert (= (and d!121115 (not res!681760)) b!1016394))

(assert (= (and b!1016394 res!681761) b!1016395))

(declare-fun m!937543 () Bool)

(assert (=> b!1016395 m!937543))

(assert (=> b!1016367 d!121115))

(declare-fun d!121123 () Bool)

(declare-fun res!681780 () Bool)

(declare-fun e!571783 () Bool)

(assert (=> d!121123 (=> res!681780 e!571783)))

(assert (=> d!121123 (= res!681780 (is-Nil!21560 keys!40))))

(assert (=> d!121123 (= (forall!286 keys!40 lambda!1025) e!571783)))

(declare-fun b!1016414 () Bool)

(declare-fun e!571784 () Bool)

(assert (=> b!1016414 (= e!571783 e!571784)))

(declare-fun res!681781 () Bool)

(assert (=> b!1016414 (=> (not res!681781) (not e!571784))))

(declare-fun dynLambda!1909 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016414 (= res!681781 (dynLambda!1909 lambda!1025 (h!22757 keys!40)))))

(declare-fun b!1016415 () Bool)

(assert (=> b!1016415 (= e!571784 (forall!286 (t!30555 keys!40) lambda!1025))))

(assert (= (and d!121123 (not res!681780)) b!1016414))

(assert (= (and b!1016414 res!681781) b!1016415))

(declare-fun b_lambda!15499 () Bool)

(assert (=> (not b_lambda!15499) (not b!1016414)))

(declare-fun m!937551 () Bool)

(assert (=> b!1016414 m!937551))

(declare-fun m!937553 () Bool)

(assert (=> b!1016415 m!937553))

(assert (=> b!1016372 d!121123))

(declare-fun d!121131 () Bool)

(assert (=> d!121131 (= (head!968 l!1114) (h!22756 l!1114))))

(assert (=> b!1016368 d!121131))

(declare-fun d!121133 () Bool)

(declare-fun res!681801 () Bool)

(declare-fun e!571804 () Bool)

(assert (=> d!121133 (=> res!681801 e!571804)))

(assert (=> d!121133 (= res!681801 (or (is-Nil!21559 l!1114) (is-Nil!21559 (t!30554 l!1114))))))

(assert (=> d!121133 (= (isStrictlySorted!616 l!1114) e!571804)))

(declare-fun b!1016435 () Bool)

(declare-fun e!571805 () Bool)

(assert (=> b!1016435 (= e!571804 e!571805)))

(declare-fun res!681802 () Bool)

(assert (=> b!1016435 (=> (not res!681802) (not e!571805))))

(assert (=> b!1016435 (= res!681802 (bvslt (_1!7676 (h!22756 l!1114)) (_1!7676 (h!22756 (t!30554 l!1114)))))))

(declare-fun b!1016436 () Bool)

(assert (=> b!1016436 (= e!571805 (isStrictlySorted!616 (t!30554 l!1114)))))

(assert (= (and d!121133 (not res!681801)) b!1016435))

(assert (= (and b!1016435 res!681802) b!1016436))

(declare-fun m!937565 () Bool)

(assert (=> b!1016436 m!937565))

(assert (=> start!88136 d!121133))

(declare-fun d!121143 () Bool)

(assert (=> d!121143 (= (isEmpty!890 l!1114) (is-Nil!21559 l!1114))))

(assert (=> b!1016373 d!121143))

(declare-fun d!121147 () Bool)

(declare-fun res!681806 () Bool)

(declare-fun e!571809 () Bool)

(assert (=> d!121147 (=> res!681806 e!571809)))

(assert (=> d!121147 (= res!681806 (or (is-Nil!21559 lt!449073) (is-Nil!21559 (t!30554 lt!449073))))))

(assert (=> d!121147 (= (isStrictlySorted!616 lt!449073) e!571809)))

(declare-fun b!1016440 () Bool)

(declare-fun e!571810 () Bool)

(assert (=> b!1016440 (= e!571809 e!571810)))

(declare-fun res!681807 () Bool)

(assert (=> b!1016440 (=> (not res!681807) (not e!571810))))

(assert (=> b!1016440 (= res!681807 (bvslt (_1!7676 (h!22756 lt!449073)) (_1!7676 (h!22756 (t!30554 lt!449073)))))))

(declare-fun b!1016441 () Bool)

(assert (=> b!1016441 (= e!571810 (isStrictlySorted!616 (t!30554 lt!449073)))))

(assert (= (and d!121147 (not res!681806)) b!1016440))

(assert (= (and b!1016440 res!681807) b!1016441))

(declare-fun m!937577 () Bool)

(assert (=> b!1016441 m!937577))

(assert (=> b!1016370 d!121147))

(declare-fun d!121151 () Bool)

(declare-fun res!681808 () Bool)

(declare-fun e!571813 () Bool)

(assert (=> d!121151 (=> res!681808 e!571813)))

(assert (=> d!121151 (= res!681808 (and (is-Cons!21558 l!1114) (= (_1!7676 (h!22756 l!1114)) (h!22757 keys!40))))))

(assert (=> d!121151 (= (containsKey!492 l!1114 (h!22757 keys!40)) e!571813)))

(declare-fun b!1016446 () Bool)

(declare-fun e!571814 () Bool)

(assert (=> b!1016446 (= e!571813 e!571814)))

(declare-fun res!681809 () Bool)

(assert (=> b!1016446 (=> (not res!681809) (not e!571814))))

(assert (=> b!1016446 (= res!681809 (and (or (not (is-Cons!21558 l!1114)) (bvsle (_1!7676 (h!22756 l!1114)) (h!22757 keys!40))) (is-Cons!21558 l!1114) (bvslt (_1!7676 (h!22756 l!1114)) (h!22757 keys!40))))))

(declare-fun b!1016447 () Bool)

(assert (=> b!1016447 (= e!571814 (containsKey!492 (t!30554 l!1114) (h!22757 keys!40)))))

(assert (= (and d!121151 (not res!681808)) b!1016446))

(assert (= (and b!1016446 res!681809) b!1016447))

(declare-fun m!937579 () Bool)

(assert (=> b!1016447 m!937579))

(assert (=> b!1016370 d!121151))

(declare-fun d!121155 () Bool)

(assert (=> d!121155 (containsKey!492 l!1114 (h!22757 keys!40))))

(declare-fun lt!449083 () Unit!33145)

(declare-fun choose!1658 (List!21562 (_ BitVec 64)) Unit!33145)

(assert (=> d!121155 (= lt!449083 (choose!1658 l!1114 (h!22757 keys!40)))))

(declare-fun e!571827 () Bool)

(assert (=> d!121155 e!571827))

(declare-fun res!681818 () Bool)

(assert (=> d!121155 (=> (not res!681818) (not e!571827))))

(assert (=> d!121155 (= res!681818 (isStrictlySorted!616 l!1114))))

(assert (=> d!121155 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 l!1114 (h!22757 keys!40)) lt!449083)))

(declare-fun b!1016462 () Bool)

(declare-datatypes ((Option!608 0))(
  ( (Some!607 (v!14455 B!1536)) (None!606) )
))
(declare-fun isDefined!406 (Option!608) Bool)

(declare-fun getValueByKey!557 (List!21562 (_ BitVec 64)) Option!608)

(assert (=> b!1016462 (= e!571827 (isDefined!406 (getValueByKey!557 l!1114 (h!22757 keys!40))))))

(assert (= (and d!121155 res!681818) b!1016462))

(assert (=> d!121155 m!937531))

(declare-fun m!937585 () Bool)

(assert (=> d!121155 m!937585))

(assert (=> d!121155 m!937525))

(declare-fun m!937587 () Bool)

(assert (=> b!1016462 m!937587))

(assert (=> b!1016462 m!937587))

(declare-fun m!937589 () Bool)

(assert (=> b!1016462 m!937589))

(assert (=> b!1016370 d!121155))

(declare-fun b!1016467 () Bool)

(declare-fun e!571830 () Bool)

(declare-fun tp!70790 () Bool)

(assert (=> b!1016467 (= e!571830 (and tp_is_empty!23603 tp!70790))))

(assert (=> b!1016371 (= tp!70781 e!571830)))

(assert (= (and b!1016371 (is-Cons!21558 (t!30554 l!1114))) b!1016467))

(declare-fun b_lambda!15507 () Bool)

(assert (= b_lambda!15499 (or b!1016372 b_lambda!15507)))

(declare-fun bs!29494 () Bool)

(declare-fun d!121161 () Bool)

(assert (= bs!29494 (and d!121161 b!1016372)))

(declare-fun value!178 () B!1536)

(assert (=> bs!29494 (= (dynLambda!1909 lambda!1025 (h!22757 keys!40)) (= (getValueByKey!557 l!1114 (h!22757 keys!40)) (Some!607 value!178)))))

(assert (=> bs!29494 m!937587))

(assert (=> b!1016414 d!121161))

(push 1)

(assert (not b!1016441))

(assert (not b!1016436))

(assert (not b!1016395))

(assert (not bs!29494))

(assert (not b!1016415))

(assert (not d!121155))

(assert (not b!1016467))

(assert tp_is_empty!23603)

(assert (not b!1016462))

(assert (not b_lambda!15507))

(assert (not b!1016447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

