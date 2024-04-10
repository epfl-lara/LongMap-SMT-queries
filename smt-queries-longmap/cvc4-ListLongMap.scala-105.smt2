; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1702 () Bool)

(assert start!1702)

(declare-fun res!9834 () Bool)

(declare-fun e!7156 () Bool)

(assert (=> start!1702 (=> (not res!9834) (not e!7156))))

(declare-datatypes ((B!438 0))(
  ( (B!439 (val!314 Int)) )
))
(declare-datatypes ((tuple2!428 0))(
  ( (tuple2!429 (_1!214 (_ BitVec 64)) (_2!214 B!438)) )
))
(declare-datatypes ((List!366 0))(
  ( (Nil!363) (Cons!362 (h!928 tuple2!428) (t!2753 List!366)) )
))
(declare-fun l!1094 () List!366)

(declare-fun isStrictlySorted!59 (List!366) Bool)

(assert (=> start!1702 (= res!9834 (isStrictlySorted!59 l!1094))))

(assert (=> start!1702 e!7156))

(declare-fun e!7157 () Bool)

(assert (=> start!1702 e!7157))

(assert (=> start!1702 true))

(declare-fun tp_is_empty!611 () Bool)

(assert (=> start!1702 tp_is_empty!611))

(declare-fun b!12003 () Bool)

(declare-fun res!9835 () Bool)

(assert (=> b!12003 (=> (not res!9835) (not e!7156))))

(declare-fun key!303 () (_ BitVec 64))

(declare-fun v!194 () B!438)

(declare-datatypes ((Option!46 0))(
  ( (Some!45 (v!1360 B!438)) (None!44) )
))
(declare-fun getValueByKey!40 (List!366 (_ BitVec 64)) Option!46)

(assert (=> b!12003 (= res!9835 (= (getValueByKey!40 l!1094 key!303) (Some!45 v!194)))))

(declare-fun b!12004 () Bool)

(declare-fun ListPrimitiveSize!15 (List!366) Int)

(assert (=> b!12004 (= e!7156 (< (ListPrimitiveSize!15 l!1094) 0))))

(declare-fun b!12005 () Bool)

(declare-fun tp!2030 () Bool)

(assert (=> b!12005 (= e!7157 (and tp_is_empty!611 tp!2030))))

(assert (= (and start!1702 res!9834) b!12003))

(assert (= (and b!12003 res!9835) b!12004))

(assert (= (and start!1702 (is-Cons!362 l!1094)) b!12005))

(declare-fun m!8339 () Bool)

(assert (=> start!1702 m!8339))

(declare-fun m!8341 () Bool)

(assert (=> b!12003 m!8341))

(declare-fun m!8343 () Bool)

(assert (=> b!12004 m!8343))

(push 1)

(assert (not b!12004))

(assert (not b!12003))

(assert tp_is_empty!611)

(assert (not b!12005))

(assert (not start!1702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1670 () Bool)

(declare-fun res!9840 () Bool)

(declare-fun e!7166 () Bool)

(assert (=> d!1670 (=> res!9840 e!7166)))

(assert (=> d!1670 (= res!9840 (or (is-Nil!363 l!1094) (is-Nil!363 (t!2753 l!1094))))))

(assert (=> d!1670 (= (isStrictlySorted!59 l!1094) e!7166)))

(declare-fun b!12018 () Bool)

(declare-fun e!7167 () Bool)

(assert (=> b!12018 (= e!7166 e!7167)))

(declare-fun res!9841 () Bool)

(assert (=> b!12018 (=> (not res!9841) (not e!7167))))

(assert (=> b!12018 (= res!9841 (bvslt (_1!214 (h!928 l!1094)) (_1!214 (h!928 (t!2753 l!1094)))))))

(declare-fun b!12019 () Bool)

(assert (=> b!12019 (= e!7167 (isStrictlySorted!59 (t!2753 l!1094)))))

(assert (= (and d!1670 (not res!9840)) b!12018))

(assert (= (and b!12018 res!9841) b!12019))

(declare-fun m!8345 () Bool)

(assert (=> b!12019 m!8345))

(assert (=> start!1702 d!1670))

(declare-fun d!1675 () Bool)

(declare-fun c!1024 () Bool)

(assert (=> d!1675 (= c!1024 (and (is-Cons!362 l!1094) (= (_1!214 (h!928 l!1094)) key!303)))))

(declare-fun e!7180 () Option!46)

(assert (=> d!1675 (= (getValueByKey!40 l!1094 key!303) e!7180)))

(declare-fun b!12039 () Bool)

(declare-fun e!7181 () Option!46)

(assert (=> b!12039 (= e!7180 e!7181)))

(declare-fun c!1025 () Bool)

(assert (=> b!12039 (= c!1025 (and (is-Cons!362 l!1094) (not (= (_1!214 (h!928 l!1094)) key!303))))))

(declare-fun b!12040 () Bool)

(assert (=> b!12040 (= e!7181 (getValueByKey!40 (t!2753 l!1094) key!303))))

(declare-fun b!12038 () Bool)

(assert (=> b!12038 (= e!7180 (Some!45 (_2!214 (h!928 l!1094))))))

(declare-fun b!12041 () Bool)

(assert (=> b!12041 (= e!7181 None!44)))

(assert (= (and d!1675 c!1024) b!12038))

(assert (= (and d!1675 (not c!1024)) b!12039))

(assert (= (and b!12039 c!1025) b!12040))

(assert (= (and b!12039 (not c!1025)) b!12041))

(declare-fun m!8351 () Bool)

(assert (=> b!12040 m!8351))

(assert (=> b!12003 d!1675))

(declare-fun d!1681 () Bool)

(declare-fun lt!3096 () Int)

(assert (=> d!1681 (>= lt!3096 0)))

(declare-fun e!7190 () Int)

(assert (=> d!1681 (= lt!3096 e!7190)))

(declare-fun c!1028 () Bool)

(assert (=> d!1681 (= c!1028 (is-Nil!363 l!1094))))

(assert (=> d!1681 (= (ListPrimitiveSize!15 l!1094) lt!3096)))

(declare-fun b!12052 () Bool)

(assert (=> b!12052 (= e!7190 0)))

(declare-fun b!12053 () Bool)

(assert (=> b!12053 (= e!7190 (+ 1 (ListPrimitiveSize!15 (t!2753 l!1094))))))

(assert (= (and d!1681 c!1028) b!12052))

(assert (= (and d!1681 (not c!1028)) b!12053))

(declare-fun m!8357 () Bool)

(assert (=> b!12053 m!8357))

(assert (=> b!12004 d!1681))

(declare-fun b!12058 () Bool)

(declare-fun e!7193 () Bool)

(declare-fun tp!2033 () Bool)

(assert (=> b!12058 (= e!7193 (and tp_is_empty!611 tp!2033))))

(assert (=> b!12005 (= tp!2030 e!7193)))

(assert (= (and b!12005 (is-Cons!362 (t!2753 l!1094))) b!12058))

(push 1)

(assert (not b!12058))

(assert (not b!12040))

(assert tp_is_empty!611)

(assert (not b!12019))

(assert (not b!12053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

