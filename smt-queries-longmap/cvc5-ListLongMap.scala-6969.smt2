; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88050 () Bool)

(assert start!88050)

(declare-fun b!1016155 () Bool)

(assert (=> b!1016155 true))

(assert (=> b!1016155 true))

(declare-fun b!1016152 () Bool)

(declare-fun e!571638 () Bool)

(declare-fun tp_is_empty!23587 () Bool)

(declare-fun tp!70736 () Bool)

(assert (=> b!1016152 (= e!571638 (and tp_is_empty!23587 tp!70736))))

(declare-fun res!681603 () Bool)

(declare-fun e!571639 () Bool)

(assert (=> start!88050 (=> (not res!681603) (not e!571639))))

(declare-datatypes ((B!1520 0))(
  ( (B!1521 (val!11844 Int)) )
))
(declare-datatypes ((tuple2!15234 0))(
  ( (tuple2!15235 (_1!7628 (_ BitVec 64)) (_2!7628 B!1520)) )
))
(declare-datatypes ((List!21511 0))(
  ( (Nil!21508) (Cons!21507 (h!22705 tuple2!15234) (t!30512 List!21511)) )
))
(declare-fun l!1114 () List!21511)

(declare-fun isStrictlySorted!612 (List!21511) Bool)

(assert (=> start!88050 (= res!681603 (isStrictlySorted!612 l!1114))))

(assert (=> start!88050 e!571639))

(assert (=> start!88050 e!571638))

(assert (=> start!88050 true))

(assert (=> start!88050 tp_is_empty!23587))

(declare-fun b!1016153 () Bool)

(declare-fun res!681602 () Bool)

(assert (=> b!1016153 (=> (not res!681602) (not e!571639))))

(declare-fun newHead!31 () tuple2!15234)

(declare-fun head!961 (List!21511) tuple2!15234)

(assert (=> b!1016153 (= res!681602 (bvslt (_1!7628 newHead!31) (_1!7628 (head!961 l!1114))))))

(declare-fun b!1016154 () Bool)

(declare-datatypes ((List!21512 0))(
  ( (Nil!21509) (Cons!21508 (h!22706 (_ BitVec 64)) (t!30513 List!21512)) )
))
(declare-fun keys!40 () List!21512)

(declare-fun ListPrimitiveSize!121 (List!21512) Int)

(assert (=> b!1016154 (= e!571639 (< (ListPrimitiveSize!121 keys!40) 0))))

(declare-fun res!681601 () Bool)

(assert (=> b!1016155 (=> (not res!681601) (not e!571639))))

(declare-fun lambda!1001 () Int)

(declare-fun forall!274 (List!21512 Int) Bool)

(assert (=> b!1016155 (= res!681601 (forall!274 keys!40 lambda!1001))))

(declare-fun b!1016156 () Bool)

(declare-fun res!681600 () Bool)

(assert (=> b!1016156 (=> (not res!681600) (not e!571639))))

(declare-fun isEmpty!874 (List!21511) Bool)

(assert (=> b!1016156 (= res!681600 (not (isEmpty!874 l!1114)))))

(assert (= (and start!88050 res!681603) b!1016156))

(assert (= (and b!1016156 res!681600) b!1016155))

(assert (= (and b!1016155 res!681601) b!1016153))

(assert (= (and b!1016153 res!681602) b!1016154))

(assert (= (and start!88050 (is-Cons!21507 l!1114)) b!1016152))

(declare-fun m!937955 () Bool)

(assert (=> b!1016153 m!937955))

(declare-fun m!937957 () Bool)

(assert (=> b!1016156 m!937957))

(declare-fun m!937959 () Bool)

(assert (=> b!1016154 m!937959))

(declare-fun m!937961 () Bool)

(assert (=> b!1016155 m!937961))

(declare-fun m!937963 () Bool)

(assert (=> start!88050 m!937963))

(push 1)

(assert (not b!1016153))

(assert (not b!1016152))

(assert (not b!1016156))

(assert (not b!1016155))

(assert tp_is_empty!23587)

(assert (not b!1016154))

(assert (not start!88050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121153 () Bool)

(assert (=> d!121153 (= (head!961 l!1114) (h!22705 l!1114))))

(assert (=> b!1016153 d!121153))

(declare-fun d!121155 () Bool)

(declare-fun res!681638 () Bool)

(declare-fun e!571662 () Bool)

(assert (=> d!121155 (=> res!681638 e!571662)))

(assert (=> d!121155 (= res!681638 (is-Nil!21509 keys!40))))

(assert (=> d!121155 (= (forall!274 keys!40 lambda!1001) e!571662)))

(declare-fun b!1016209 () Bool)

(declare-fun e!571663 () Bool)

(assert (=> b!1016209 (= e!571662 e!571663)))

(declare-fun res!681639 () Bool)

(assert (=> b!1016209 (=> (not res!681639) (not e!571663))))

(declare-fun dynLambda!1910 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016209 (= res!681639 (dynLambda!1910 lambda!1001 (h!22706 keys!40)))))

(declare-fun b!1016210 () Bool)

(assert (=> b!1016210 (= e!571663 (forall!274 (t!30513 keys!40) lambda!1001))))

(assert (= (and d!121155 (not res!681638)) b!1016209))

(assert (= (and b!1016209 res!681639) b!1016210))

(declare-fun b_lambda!15487 () Bool)

(assert (=> (not b_lambda!15487) (not b!1016209)))

(declare-fun m!937987 () Bool)

(assert (=> b!1016209 m!937987))

(declare-fun m!937989 () Bool)

(assert (=> b!1016210 m!937989))

(assert (=> b!1016155 d!121155))

(declare-fun d!121161 () Bool)

(declare-fun lt!449250 () Int)

(assert (=> d!121161 (>= lt!449250 0)))

(declare-fun e!571670 () Int)

(assert (=> d!121161 (= lt!449250 e!571670)))

(declare-fun c!102912 () Bool)

(assert (=> d!121161 (= c!102912 (is-Nil!21509 keys!40))))

(assert (=> d!121161 (= (ListPrimitiveSize!121 keys!40) lt!449250)))

(declare-fun b!1016219 () Bool)

(assert (=> b!1016219 (= e!571670 0)))

(declare-fun b!1016220 () Bool)

(assert (=> b!1016220 (= e!571670 (+ 1 (ListPrimitiveSize!121 (t!30513 keys!40))))))

(assert (= (and d!121161 c!102912) b!1016219))

(assert (= (and d!121161 (not c!102912)) b!1016220))

(declare-fun m!937991 () Bool)

(assert (=> b!1016220 m!937991))

(assert (=> b!1016154 d!121161))

(declare-fun d!121163 () Bool)

(assert (=> d!121163 (= (isEmpty!874 l!1114) (is-Nil!21508 l!1114))))

(assert (=> b!1016156 d!121163))

(declare-fun d!121167 () Bool)

(declare-fun res!681650 () Bool)

(declare-fun e!571684 () Bool)

(assert (=> d!121167 (=> res!681650 e!571684)))

(assert (=> d!121167 (= res!681650 (or (is-Nil!21508 l!1114) (is-Nil!21508 (t!30512 l!1114))))))

(assert (=> d!121167 (= (isStrictlySorted!612 l!1114) e!571684)))

(declare-fun b!1016241 () Bool)

(declare-fun e!571685 () Bool)

(assert (=> b!1016241 (= e!571684 e!571685)))

(declare-fun res!681651 () Bool)

(assert (=> b!1016241 (=> (not res!681651) (not e!571685))))

(assert (=> b!1016241 (= res!681651 (bvslt (_1!7628 (h!22705 l!1114)) (_1!7628 (h!22705 (t!30512 l!1114)))))))

(declare-fun b!1016242 () Bool)

(assert (=> b!1016242 (= e!571685 (isStrictlySorted!612 (t!30512 l!1114)))))

(assert (= (and d!121167 (not res!681650)) b!1016241))

(assert (= (and b!1016241 res!681651) b!1016242))

(declare-fun m!937999 () Bool)

(assert (=> b!1016242 m!937999))

(assert (=> start!88050 d!121167))

(declare-fun b!1016250 () Bool)

(declare-fun e!571690 () Bool)

(declare-fun tp!70748 () Bool)

(assert (=> b!1016250 (= e!571690 (and tp_is_empty!23587 tp!70748))))

(assert (=> b!1016152 (= tp!70736 e!571690)))

(assert (= (and b!1016152 (is-Cons!21507 (t!30512 l!1114))) b!1016250))

(declare-fun b_lambda!15493 () Bool)

(assert (= b_lambda!15487 (or b!1016155 b_lambda!15493)))

(declare-fun bs!29505 () Bool)

(declare-fun d!121175 () Bool)

(assert (= bs!29505 (and d!121175 b!1016155)))

(declare-fun value!178 () B!1520)

(declare-datatypes ((Option!599 0))(
  ( (Some!598 (v!14449 B!1520)) (None!597) )
))
(declare-fun getValueByKey!548 (List!21511 (_ BitVec 64)) Option!599)

(assert (=> bs!29505 (= (dynLambda!1910 lambda!1001 (h!22706 keys!40)) (= (getValueByKey!548 l!1114 (h!22706 keys!40)) (Some!598 value!178)))))

(declare-fun m!938005 () Bool)

(assert (=> bs!29505 m!938005))

(assert (=> b!1016209 d!121175))

(push 1)

