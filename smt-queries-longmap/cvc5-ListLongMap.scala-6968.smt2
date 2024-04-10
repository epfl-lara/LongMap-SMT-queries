; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88020 () Bool)

(assert start!88020)

(declare-fun b!1016031 () Bool)

(assert (=> b!1016031 true))

(assert (=> b!1016031 true))

(declare-fun res!681517 () Bool)

(declare-fun e!571570 () Bool)

(assert (=> b!1016031 (=> (not res!681517) (not e!571570))))

(declare-datatypes ((List!21505 0))(
  ( (Nil!21502) (Cons!21501 (h!22699 (_ BitVec 64)) (t!30506 List!21505)) )
))
(declare-fun keys!40 () List!21505)

(declare-fun lambda!992 () Int)

(declare-fun forall!271 (List!21505 Int) Bool)

(assert (=> b!1016031 (= res!681517 (forall!271 keys!40 lambda!992))))

(declare-fun b!1016032 () Bool)

(declare-fun res!681516 () Bool)

(assert (=> b!1016032 (=> (not res!681516) (not e!571570))))

(assert (=> b!1016032 (= res!681516 (not (is-Cons!21501 keys!40)))))

(declare-fun b!1016033 () Bool)

(declare-fun res!681519 () Bool)

(assert (=> b!1016033 (=> (not res!681519) (not e!571570))))

(declare-datatypes ((B!1514 0))(
  ( (B!1515 (val!11841 Int)) )
))
(declare-datatypes ((tuple2!15228 0))(
  ( (tuple2!15229 (_1!7625 (_ BitVec 64)) (_2!7625 B!1514)) )
))
(declare-datatypes ((List!21506 0))(
  ( (Nil!21503) (Cons!21502 (h!22700 tuple2!15228) (t!30507 List!21506)) )
))
(declare-fun l!1114 () List!21506)

(declare-fun isEmpty!871 (List!21506) Bool)

(assert (=> b!1016033 (= res!681519 (not (isEmpty!871 l!1114)))))

(declare-fun res!681515 () Bool)

(assert (=> start!88020 (=> (not res!681515) (not e!571570))))

(declare-fun isStrictlySorted!609 (List!21506) Bool)

(assert (=> start!88020 (= res!681515 (isStrictlySorted!609 l!1114))))

(assert (=> start!88020 e!571570))

(declare-fun e!571569 () Bool)

(assert (=> start!88020 e!571569))

(assert (=> start!88020 true))

(declare-fun tp_is_empty!23581 () Bool)

(assert (=> start!88020 tp_is_empty!23581))

(declare-fun b!1016034 () Bool)

(declare-fun res!681518 () Bool)

(assert (=> b!1016034 (=> (not res!681518) (not e!571570))))

(declare-fun newHead!31 () tuple2!15228)

(declare-fun head!958 (List!21506) tuple2!15228)

(assert (=> b!1016034 (= res!681518 (bvslt (_1!7625 newHead!31) (_1!7625 (head!958 l!1114))))))

(declare-fun b!1016035 () Bool)

(assert (=> b!1016035 (= e!571570 (not (isStrictlySorted!609 (Cons!21502 newHead!31 l!1114))))))

(declare-fun b!1016036 () Bool)

(declare-fun tp!70718 () Bool)

(assert (=> b!1016036 (= e!571569 (and tp_is_empty!23581 tp!70718))))

(assert (= (and start!88020 res!681515) b!1016033))

(assert (= (and b!1016033 res!681519) b!1016031))

(assert (= (and b!1016031 res!681517) b!1016034))

(assert (= (and b!1016034 res!681518) b!1016032))

(assert (= (and b!1016032 res!681516) b!1016035))

(assert (= (and start!88020 (is-Cons!21502 l!1114)) b!1016036))

(declare-fun m!937895 () Bool)

(assert (=> b!1016035 m!937895))

(declare-fun m!937897 () Bool)

(assert (=> b!1016034 m!937897))

(declare-fun m!937899 () Bool)

(assert (=> b!1016031 m!937899))

(declare-fun m!937901 () Bool)

(assert (=> start!88020 m!937901))

(declare-fun m!937903 () Bool)

(assert (=> b!1016033 m!937903))

(push 1)

(assert (not start!88020))

(assert tp_is_empty!23581)

(assert (not b!1016031))

(assert (not b!1016034))

(assert (not b!1016033))

(assert (not b!1016035))

(assert (not b!1016036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121117 () Bool)

(assert (=> d!121117 (= (head!958 l!1114) (h!22700 l!1114))))

(assert (=> b!1016034 d!121117))

(declare-fun d!121119 () Bool)

(assert (=> d!121119 (= (isEmpty!871 l!1114) (is-Nil!21503 l!1114))))

(assert (=> b!1016033 d!121119))

(declare-fun d!121123 () Bool)

(declare-fun res!681568 () Bool)

(declare-fun e!571601 () Bool)

(assert (=> d!121123 (=> res!681568 e!571601)))

(assert (=> d!121123 (= res!681568 (is-Nil!21502 keys!40))))

(assert (=> d!121123 (= (forall!271 keys!40 lambda!992) e!571601)))

(declare-fun b!1016103 () Bool)

(declare-fun e!571602 () Bool)

(assert (=> b!1016103 (= e!571601 e!571602)))

(declare-fun res!681569 () Bool)

(assert (=> b!1016103 (=> (not res!681569) (not e!571602))))

(declare-fun dynLambda!1908 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016103 (= res!681569 (dynLambda!1908 lambda!992 (h!22699 keys!40)))))

(declare-fun b!1016104 () Bool)

(assert (=> b!1016104 (= e!571602 (forall!271 (t!30506 keys!40) lambda!992))))

(assert (= (and d!121123 (not res!681568)) b!1016103))

(assert (= (and b!1016103 res!681569) b!1016104))

(declare-fun b_lambda!15475 () Bool)

(assert (=> (not b_lambda!15475) (not b!1016103)))

(declare-fun m!937927 () Bool)

(assert (=> b!1016103 m!937927))

(declare-fun m!937929 () Bool)

(assert (=> b!1016104 m!937929))

(assert (=> b!1016031 d!121123))

(declare-fun d!121127 () Bool)

(declare-fun res!681580 () Bool)

(declare-fun e!571616 () Bool)

(assert (=> d!121127 (=> res!681580 e!571616)))

(assert (=> d!121127 (= res!681580 (or (is-Nil!21503 (Cons!21502 newHead!31 l!1114)) (is-Nil!21503 (t!30507 (Cons!21502 newHead!31 l!1114)))))))

(assert (=> d!121127 (= (isStrictlySorted!609 (Cons!21502 newHead!31 l!1114)) e!571616)))

(declare-fun b!1016120 () Bool)

(declare-fun e!571617 () Bool)

(assert (=> b!1016120 (= e!571616 e!571617)))

(declare-fun res!681581 () Bool)

(assert (=> b!1016120 (=> (not res!681581) (not e!571617))))

(assert (=> b!1016120 (= res!681581 (bvslt (_1!7625 (h!22700 (Cons!21502 newHead!31 l!1114))) (_1!7625 (h!22700 (t!30507 (Cons!21502 newHead!31 l!1114))))))))

(declare-fun b!1016121 () Bool)

(assert (=> b!1016121 (= e!571617 (isStrictlySorted!609 (t!30507 (Cons!21502 newHead!31 l!1114))))))

(assert (= (and d!121127 (not res!681580)) b!1016120))

(assert (= (and b!1016120 res!681581) b!1016121))

(declare-fun m!937941 () Bool)

(assert (=> b!1016121 m!937941))

(assert (=> b!1016035 d!121127))

(declare-fun d!121135 () Bool)

(declare-fun res!681582 () Bool)

(declare-fun e!571618 () Bool)

(assert (=> d!121135 (=> res!681582 e!571618)))

(assert (=> d!121135 (= res!681582 (or (is-Nil!21503 l!1114) (is-Nil!21503 (t!30507 l!1114))))))

(assert (=> d!121135 (= (isStrictlySorted!609 l!1114) e!571618)))

(declare-fun b!1016122 () Bool)

(declare-fun e!571619 () Bool)

(assert (=> b!1016122 (= e!571618 e!571619)))

(declare-fun res!681583 () Bool)

(assert (=> b!1016122 (=> (not res!681583) (not e!571619))))

(assert (=> b!1016122 (= res!681583 (bvslt (_1!7625 (h!22700 l!1114)) (_1!7625 (h!22700 (t!30507 l!1114)))))))

(declare-fun b!1016123 () Bool)

(assert (=> b!1016123 (= e!571619 (isStrictlySorted!609 (t!30507 l!1114)))))

(assert (= (and d!121135 (not res!681582)) b!1016122))

(assert (= (and b!1016122 res!681583) b!1016123))

(declare-fun m!937945 () Bool)

(assert (=> b!1016123 m!937945))

(assert (=> start!88020 d!121135))

(declare-fun b!1016132 () Bool)

(declare-fun e!571626 () Bool)

(declare-fun tp!70730 () Bool)

(assert (=> b!1016132 (= e!571626 (and tp_is_empty!23581 tp!70730))))

(assert (=> b!1016036 (= tp!70718 e!571626)))

(assert (= (and b!1016036 (is-Cons!21502 (t!30507 l!1114))) b!1016132))

(declare-fun b_lambda!15483 () Bool)

(assert (= b_lambda!15475 (or b!1016031 b_lambda!15483)))

(declare-fun bs!29499 () Bool)

(declare-fun d!121137 () Bool)

(assert (= bs!29499 (and d!121137 b!1016031)))

(declare-fun value!178 () B!1514)

(declare-datatypes ((Option!596 0))(
  ( (Some!595 (v!14446 B!1514)) (None!594) )
))
(declare-fun getValueByKey!545 (List!21506 (_ BitVec 64)) Option!596)

(assert (=> bs!29499 (= (dynLambda!1908 lambda!992 (h!22699 keys!40)) (= (getValueByKey!545 l!1114 (h!22699 keys!40)) (Some!595 value!178)))))

(declare-fun m!937949 () Bool)

(assert (=> bs!29499 m!937949))

(assert (=> b!1016103 d!121137))

(push 1)

(assert (not b!1016132))

(assert (not bs!29499))

(assert (not b!1016123))

(assert (not b!1016104))

(assert tp_is_empty!23581)

(assert (not b!1016121))

(assert (not b_lambda!15483))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

