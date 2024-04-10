; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88136 () Bool)

(assert start!88136)

(declare-fun b!1016505 () Bool)

(assert (=> b!1016505 true))

(assert (=> b!1016505 true))

(declare-fun res!681802 () Bool)

(declare-fun e!571826 () Bool)

(assert (=> start!88136 (=> (not res!681802) (not e!571826))))

(declare-datatypes ((B!1536 0))(
  ( (B!1537 (val!11852 Int)) )
))
(declare-datatypes ((tuple2!15250 0))(
  ( (tuple2!15251 (_1!7636 (_ BitVec 64)) (_2!7636 B!1536)) )
))
(declare-datatypes ((List!21527 0))(
  ( (Nil!21524) (Cons!21523 (h!22721 tuple2!15250) (t!30528 List!21527)) )
))
(declare-fun l!1114 () List!21527)

(declare-fun isStrictlySorted!620 (List!21527) Bool)

(assert (=> start!88136 (= res!681802 (isStrictlySorted!620 l!1114))))

(assert (=> start!88136 e!571826))

(declare-fun e!571825 () Bool)

(assert (=> start!88136 e!571825))

(assert (=> start!88136 true))

(declare-fun tp_is_empty!23603 () Bool)

(assert (=> start!88136 tp_is_empty!23603))

(declare-fun b!1016503 () Bool)

(declare-fun res!681803 () Bool)

(assert (=> b!1016503 (=> (not res!681803) (not e!571826))))

(declare-datatypes ((List!21528 0))(
  ( (Nil!21525) (Cons!21524 (h!22722 (_ BitVec 64)) (t!30529 List!21528)) )
))
(declare-fun keys!40 () List!21528)

(assert (=> b!1016503 (= res!681803 (is-Cons!21524 keys!40))))

(declare-fun b!1016504 () Bool)

(declare-fun e!571827 () Bool)

(declare-fun lt!449274 () List!21527)

(declare-fun containsKey!492 (List!21527 (_ BitVec 64)) Bool)

(assert (=> b!1016504 (= e!571827 (containsKey!492 lt!449274 (h!22722 keys!40)))))

(declare-fun res!681804 () Bool)

(assert (=> b!1016505 (=> (not res!681804) (not e!571826))))

(declare-fun lambda!1025 () Int)

(declare-fun forall!282 (List!21528 Int) Bool)

(assert (=> b!1016505 (= res!681804 (forall!282 keys!40 lambda!1025))))

(declare-fun b!1016506 () Bool)

(assert (=> b!1016506 (= e!571826 (not e!571827))))

(declare-fun res!681805 () Bool)

(assert (=> b!1016506 (=> (not res!681805) (not e!571827))))

(assert (=> b!1016506 (= res!681805 (isStrictlySorted!620 lt!449274))))

(declare-fun newHead!31 () tuple2!15250)

(assert (=> b!1016506 (= lt!449274 (Cons!21523 newHead!31 l!1114))))

(assert (=> b!1016506 (containsKey!492 l!1114 (h!22722 keys!40))))

(declare-datatypes ((Unit!33249 0))(
  ( (Unit!33250) )
))
(declare-fun lt!449273 () Unit!33249)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 (List!21527 (_ BitVec 64)) Unit!33249)

(assert (=> b!1016506 (= lt!449273 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 l!1114 (h!22722 keys!40)))))

(declare-fun b!1016507 () Bool)

(declare-fun res!681806 () Bool)

(assert (=> b!1016507 (=> (not res!681806) (not e!571826))))

(declare-fun isEmpty!885 (List!21527) Bool)

(assert (=> b!1016507 (= res!681806 (not (isEmpty!885 l!1114)))))

(declare-fun b!1016508 () Bool)

(declare-fun tp!70780 () Bool)

(assert (=> b!1016508 (= e!571825 (and tp_is_empty!23603 tp!70780))))

(declare-fun b!1016509 () Bool)

(declare-fun res!681801 () Bool)

(assert (=> b!1016509 (=> (not res!681801) (not e!571826))))

(declare-fun head!969 (List!21527) tuple2!15250)

(assert (=> b!1016509 (= res!681801 (bvslt (_1!7636 newHead!31) (_1!7636 (head!969 l!1114))))))

(assert (= (and start!88136 res!681802) b!1016507))

(assert (= (and b!1016507 res!681806) b!1016505))

(assert (= (and b!1016505 res!681804) b!1016509))

(assert (= (and b!1016509 res!681801) b!1016503))

(assert (= (and b!1016503 res!681803) b!1016506))

(assert (= (and b!1016506 res!681805) b!1016504))

(assert (= (and start!88136 (is-Cons!21523 l!1114)) b!1016508))

(declare-fun m!938133 () Bool)

(assert (=> start!88136 m!938133))

(declare-fun m!938135 () Bool)

(assert (=> b!1016509 m!938135))

(declare-fun m!938137 () Bool)

(assert (=> b!1016507 m!938137))

(declare-fun m!938139 () Bool)

(assert (=> b!1016506 m!938139))

(declare-fun m!938141 () Bool)

(assert (=> b!1016506 m!938141))

(declare-fun m!938143 () Bool)

(assert (=> b!1016506 m!938143))

(declare-fun m!938145 () Bool)

(assert (=> b!1016505 m!938145))

(declare-fun m!938147 () Bool)

(assert (=> b!1016504 m!938147))

(push 1)

(assert (not b!1016505))

(assert (not b!1016506))

(assert (not b!1016508))

(assert (not b!1016504))

(assert (not start!88136))

(assert tp_is_empty!23603)

(assert (not b!1016507))

(assert (not b!1016509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121265 () Bool)

(declare-fun res!681843 () Bool)

(declare-fun e!571864 () Bool)

(assert (=> d!121265 (=> res!681843 e!571864)))

(assert (=> d!121265 (= res!681843 (is-Nil!21525 keys!40))))

(assert (=> d!121265 (= (forall!282 keys!40 lambda!1025) e!571864)))

(declare-fun b!1016550 () Bool)

(declare-fun e!571865 () Bool)

(assert (=> b!1016550 (= e!571864 e!571865)))

(declare-fun res!681844 () Bool)

(assert (=> b!1016550 (=> (not res!681844) (not e!571865))))

(declare-fun dynLambda!1917 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016550 (= res!681844 (dynLambda!1917 lambda!1025 (h!22722 keys!40)))))

(declare-fun b!1016551 () Bool)

(assert (=> b!1016551 (= e!571865 (forall!282 (t!30529 keys!40) lambda!1025))))

(assert (= (and d!121265 (not res!681843)) b!1016550))

(assert (= (and b!1016550 res!681844) b!1016551))

(declare-fun b_lambda!15523 () Bool)

(assert (=> (not b_lambda!15523) (not b!1016550)))

(declare-fun m!938165 () Bool)

(assert (=> b!1016550 m!938165))

(declare-fun m!938169 () Bool)

(assert (=> b!1016551 m!938169))

(assert (=> b!1016505 d!121265))

(declare-fun d!121275 () Bool)

(declare-fun res!681858 () Bool)

(declare-fun e!571881 () Bool)

(assert (=> d!121275 (=> res!681858 e!571881)))

(assert (=> d!121275 (= res!681858 (or (is-Nil!21524 lt!449274) (is-Nil!21524 (t!30528 lt!449274))))))

(assert (=> d!121275 (= (isStrictlySorted!620 lt!449274) e!571881)))

(declare-fun b!1016569 () Bool)

(declare-fun e!571882 () Bool)

(assert (=> b!1016569 (= e!571881 e!571882)))

(declare-fun res!681859 () Bool)

(assert (=> b!1016569 (=> (not res!681859) (not e!571882))))

(assert (=> b!1016569 (= res!681859 (bvslt (_1!7636 (h!22721 lt!449274)) (_1!7636 (h!22721 (t!30528 lt!449274)))))))

(declare-fun b!1016570 () Bool)

(assert (=> b!1016570 (= e!571882 (isStrictlySorted!620 (t!30528 lt!449274)))))

(assert (= (and d!121275 (not res!681858)) b!1016569))

(assert (= (and b!1016569 res!681859) b!1016570))

(declare-fun m!938177 () Bool)

(assert (=> b!1016570 m!938177))

(assert (=> b!1016506 d!121275))

(declare-fun d!121279 () Bool)

(declare-fun res!681868 () Bool)

(declare-fun e!571892 () Bool)

(assert (=> d!121279 (=> res!681868 e!571892)))

(assert (=> d!121279 (= res!681868 (and (is-Cons!21523 l!1114) (= (_1!7636 (h!22721 l!1114)) (h!22722 keys!40))))))

(assert (=> d!121279 (= (containsKey!492 l!1114 (h!22722 keys!40)) e!571892)))

(declare-fun b!1016580 () Bool)

(declare-fun e!571893 () Bool)

(assert (=> b!1016580 (= e!571892 e!571893)))

(declare-fun res!681869 () Bool)

(assert (=> b!1016580 (=> (not res!681869) (not e!571893))))

(assert (=> b!1016580 (= res!681869 (and (or (not (is-Cons!21523 l!1114)) (bvsle (_1!7636 (h!22721 l!1114)) (h!22722 keys!40))) (is-Cons!21523 l!1114) (bvslt (_1!7636 (h!22721 l!1114)) (h!22722 keys!40))))))

(declare-fun b!1016581 () Bool)

(assert (=> b!1016581 (= e!571893 (containsKey!492 (t!30528 l!1114) (h!22722 keys!40)))))

(assert (= (and d!121279 (not res!681868)) b!1016580))

(assert (= (and b!1016580 res!681869) b!1016581))

(declare-fun m!938181 () Bool)

(assert (=> b!1016581 m!938181))

(assert (=> b!1016506 d!121279))

(declare-fun d!121285 () Bool)

(assert (=> d!121285 (containsKey!492 l!1114 (h!22722 keys!40))))

(declare-fun lt!449283 () Unit!33249)

(declare-fun choose!1650 (List!21527 (_ BitVec 64)) Unit!33249)

(assert (=> d!121285 (= lt!449283 (choose!1650 l!1114 (h!22722 keys!40)))))

(declare-fun e!571903 () Bool)

(assert (=> d!121285 e!571903))

(declare-fun res!681877 () Bool)

(assert (=> d!121285 (=> (not res!681877) (not e!571903))))

(assert (=> d!121285 (= res!681877 (isStrictlySorted!620 l!1114))))

(assert (=> d!121285 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 l!1114 (h!22722 keys!40)) lt!449283)))

(declare-fun b!1016593 () Bool)

(declare-datatypes ((Option!605 0))(
  ( (Some!604 (v!14455 B!1536)) (None!603) )
))
(declare-fun isDefined!403 (Option!605) Bool)

(declare-fun getValueByKey!554 (List!21527 (_ BitVec 64)) Option!605)

(assert (=> b!1016593 (= e!571903 (isDefined!403 (getValueByKey!554 l!1114 (h!22722 keys!40))))))

(assert (= (and d!121285 res!681877) b!1016593))

(assert (=> d!121285 m!938141))

(declare-fun m!938193 () Bool)

(assert (=> d!121285 m!938193))

(assert (=> d!121285 m!938133))

(declare-fun m!938195 () Bool)

(assert (=> b!1016593 m!938195))

(assert (=> b!1016593 m!938195))

(declare-fun m!938197 () Bool)

(assert (=> b!1016593 m!938197))

(assert (=> b!1016506 d!121285))

(declare-fun d!121293 () Bool)

(assert (=> d!121293 (= (isEmpty!885 l!1114) (is-Nil!21524 l!1114))))

(assert (=> b!1016507 d!121293))

(declare-fun d!121297 () Bool)

(declare-fun res!681878 () Bool)

(declare-fun e!571905 () Bool)

(assert (=> d!121297 (=> res!681878 e!571905)))

(assert (=> d!121297 (= res!681878 (and (is-Cons!21523 lt!449274) (= (_1!7636 (h!22721 lt!449274)) (h!22722 keys!40))))))

(assert (=> d!121297 (= (containsKey!492 lt!449274 (h!22722 keys!40)) e!571905)))

(declare-fun b!1016595 () Bool)

(declare-fun e!571906 () Bool)

(assert (=> b!1016595 (= e!571905 e!571906)))

(declare-fun res!681879 () Bool)

(assert (=> b!1016595 (=> (not res!681879) (not e!571906))))

(assert (=> b!1016595 (= res!681879 (and (or (not (is-Cons!21523 lt!449274)) (bvsle (_1!7636 (h!22721 lt!449274)) (h!22722 keys!40))) (is-Cons!21523 lt!449274) (bvslt (_1!7636 (h!22721 lt!449274)) (h!22722 keys!40))))))

(declare-fun b!1016596 () Bool)

(assert (=> b!1016596 (= e!571906 (containsKey!492 (t!30528 lt!449274) (h!22722 keys!40)))))

(assert (= (and d!121297 (not res!681878)) b!1016595))

(assert (= (and b!1016595 res!681879) b!1016596))

(declare-fun m!938199 () Bool)

(assert (=> b!1016596 m!938199))

(assert (=> b!1016504 d!121297))

(declare-fun d!121299 () Bool)

(assert (=> d!121299 (= (head!969 l!1114) (h!22721 l!1114))))

(assert (=> b!1016509 d!121299))

(declare-fun d!121301 () Bool)

(declare-fun res!681880 () Bool)

(declare-fun e!571907 () Bool)

(assert (=> d!121301 (=> res!681880 e!571907)))

(assert (=> d!121301 (= res!681880 (or (is-Nil!21524 l!1114) (is-Nil!21524 (t!30528 l!1114))))))

(assert (=> d!121301 (= (isStrictlySorted!620 l!1114) e!571907)))

(declare-fun b!1016597 () Bool)

(declare-fun e!571908 () Bool)

(assert (=> b!1016597 (= e!571907 e!571908)))

(declare-fun res!681881 () Bool)

(assert (=> b!1016597 (=> (not res!681881) (not e!571908))))

(assert (=> b!1016597 (= res!681881 (bvslt (_1!7636 (h!22721 l!1114)) (_1!7636 (h!22721 (t!30528 l!1114)))))))

(declare-fun b!1016598 () Bool)

(assert (=> b!1016598 (= e!571908 (isStrictlySorted!620 (t!30528 l!1114)))))

(assert (= (and d!121301 (not res!681880)) b!1016597))

(assert (= (and b!1016597 res!681881) b!1016598))

(declare-fun m!938201 () Bool)

(assert (=> b!1016598 m!938201))

(assert (=> start!88136 d!121301))

(declare-fun b!1016603 () Bool)

(declare-fun e!571911 () Bool)

(declare-fun tp!70789 () Bool)

(assert (=> b!1016603 (= e!571911 (and tp_is_empty!23603 tp!70789))))

(assert (=> b!1016508 (= tp!70780 e!571911)))

(assert (= (and b!1016508 (is-Cons!21523 (t!30528 l!1114))) b!1016603))

(declare-fun b_lambda!15529 () Bool)

(assert (= b_lambda!15523 (or b!1016505 b_lambda!15529)))

(declare-fun bs!29523 () Bool)

(declare-fun d!121303 () Bool)

(assert (= bs!29523 (and d!121303 b!1016505)))

(declare-fun value!178 () B!1536)

(assert (=> bs!29523 (= (dynLambda!1917 lambda!1025 (h!22722 keys!40)) (= (getValueByKey!554 l!1114 (h!22722 keys!40)) (Some!604 value!178)))))

(assert (=> bs!29523 m!938195))

(assert (=> b!1016550 d!121303))

(push 1)

(assert (not b_lambda!15529))

(assert (not b!1016596))

(assert (not b!1016581))

(assert (not b!1016603))

(assert (not b!1016570))

(assert (not b!1016593))

(assert tp_is_empty!23603)

(assert (not b!1016598))

(assert (not d!121285))

(assert (not b!1016551))

(assert (not bs!29523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

